/*
 * main.S - #Project 1 Simple Bot Code
 * running on Nexys4 DDR FPGA target board
 *
 * Copyright Srivatsa Yogendra, 2017
 *
 * Created By:		Srivatsa Yogendra
 * Modified By:     Michael Bourquin, Jean Shirimpaka
 * Last Modified:	12-Oct-2018
 *
 * Description:
 * Reads the switches on the FPGA board and writes
 * the values to the LEDs
 * Reads the Buttons on the FPGA board and outputs a compass (3 Digit Display) based on relative turning position of Robot
 * Displays a robot motion in the 4th display based on button input
 *
 * Assumes the existance of an AHB-Lite peripheral for the 8 digit
 * 7-segment display on the Nexys4 DDR.  The peripheral has 4 memory
 * mapped I/O registers:
 *	PORT_SEVENSEG_EN - (8 bits) Individual enables for each digit. Set bit to 0 to enable digit
 *									Digit7 = bit[7], Digit6 = bit[6], Digit5 = bit[5], Digit4 = bit[4],
 *									Digit3 = bit[3], Digit2 = bit[2], Digit1 = bit[1], Digit0 = bit[0]
 *	PORT_SEVENSEG_HGH = (32 bits) Value of digit.  Each digit has the range of 31:0, top 3 bits ignored
 *									Digit7 = bits[31:24], Digit6 = bits[23:16],
 *									Digit5 = bits[15:8] , Digit4 = bits[7:0]
 *	PORT_SEVENSEG_LOW = (32 bits) Value of digit.  Each digit has the range of 31:0, top 3 bits ignored
 *									Digit3 = bits[31:24], Digit2 = bits[23:16],
 *									Digit1 = bits[15:8] , Digit0 = bits[7:0]
 *	PORT_SEVENSEG_DP - (8 bits) Individual decimal points for each digit. Set bit to 0 to turn on the decimal point
 *									DP7 = bit[7], DP6 = bit[6], DP5 = bit[5], DP4 = bit[4],
 *									DP3 = bit[3], DP2 = bit[2], DP1 = bit[1], DP0 = bit[0]
 */


# bot orientation values
NORTH = 0x00
NORTHEAST = 0x01
EAST = 0x02
SOUTHEAST = 0x03
SOUTH = 0x04
SOUTHWEST = 0x05
WEST =  0x06
NORTHWEST = 0x07

# bot speed values
STOPPED = 0x0
SLOW = 0x1
MEDIUM = 0x2
FAST = 0x3

# nexys4 addresses
PORT_SEVENSEG_EN 	= 0xbf700000		# (o) 7 Segment enable
PORT_SEVENSEG_HGH	= 0xbf700004		# (o) 7 Segment Higher Display
PORT_SEVENSEG_LOW	= 0xbf700008		# (o) 7 Segment Lower Display
PORT_SEVENSEG_DP	= 0xbf70000C		# (o) 7 segment Decimal Point Display
BUTTONS_ADDR 		= 0xbf800008        # (o) Input Buttons Address
LEDS_ADDR			= 0xbf800000        # (o) LEDS Address
PORT_SLSWTCH		= 0xbf800004		# (i) slide switches
BUTTONS_ADDR		= 0xbf800008			# (i) button addresse

# accelerometer register addresses
X_ACC_ADDR			= 0xbf80001C		# (i)
Y_ACC_ADDR			= 0xbf800020		# (i)
Z_ACC_ADDR			= 0xbf800024        # (i)

# rojobot register addresses
PORT_BOTCTRL		= 0xbf800014		# (o) Bot Control port
PORT_BOTINFO = 		= 0xbf80000C		# (i) Bot Info Port
PORT_SOFTRESET = 0xbf800010             # (o) Bot Softreset (Active Low)
PORT_WHICH_SCREEN = 0xbf800018			# (o) determine which screen displayed

# masks
BIT_12_MASK 		= 0x800
INFO_DEADLOCK_MASK = 0x8
INFO_MAZEEND = 0x20
INFO_WALLCRASH = 0x10
BUTTON_C_MASK = 0x10

# control signals
FORWARD_CNT			= 0x33
REVERSE_CNT			= 0x22
LEFT_CNT			= 0x3
RIGHT_CNT			= 0x30
IDLE_CNT			= 0x0
FAST_LEFT_CNT		= 0x23
FAST_RIGHT_CNT		= 0x32

# values to write to LEDs
LED0_LIT = 0x01
LED0_OFF = 0xFE
LED1_LIT = 0x02
LED1_OFF = 0xFD
LED2_LIT = 0x04
LED2_OFF = 0xFB

# screen values
GAME_OVER_SCREEN = 0x0
LEVEL_1_SCREEN = 0x1
LEVEL_COMPLETE = 0x4
WIN_SCREEN = 0x5
DEBUG_SCREEN = 0x6

.globl main
main:

	# make sure SSEG_LOW digits are zero before enabling
	li $27, PORT_SEVENSEG_LOW
	li $26, 0x00000000
	sw $26, 0($27)

	# make sure SSEG_HI digits are zero before enabling
	li $27, PORT_SEVENSEG_HGH
	li $26, 0x00
	sw $26, 0($27)

	# enable seven_segement digits
	li $4, PORT_SEVENSEG_EN					# 27 = SEVEN_SEG_EN
	li $26, 0x00							# enable all sseg digits
	sw $26, 0($4)

	li   $20, X_ACC_ADDR					# $20 = address of x_acc_data
	li   $21, Y_ACC_ADDR					# $21 = address of y_acc_data
	li   $22, Z_ACC_ADDR					# $22 = address of z_acc_data

	lw $16, 0($20)							# $16 = x_acc_data
	lw $17, 0($21)							# $17 = y_acc_data
	lw $18, 0($22)							# $18 = z_acc_data

	li $6, 0x3								# lives($6) = 3
	li $9, 0x1								# level($9) = 1

	# zero LEDs to start
	addi $23, $0, 0x0						# $23 = This will hold current LED Value
	li $10, LEDS_ADDR						# 10 = LEDS_ADDR
	sh $23, 0($10)

	li $11, PORT_WHICH_SCREEN
	sw $9, 0($11)

#	li $11, PORT_WHICH_SCREEN
#	li $12, DEBUG_SCREEN
#	sw $12, 0($11)


readIO:
	li $11, PORT_BOTINFO
	lw $11, 0($11)
	andi $11, $11, INFO_DEADLOCK_MASK

	bne $11, 0, DEADLOCK
	j OTHER_THAN_DEADLOCK

DEADLOCK:
	li $11, PORT_BOTINFO
	lw $12, 0($11)

	andi $12, $12, INFO_WALLCRASH
	bne $12, $0, WALL_HIT
	j WIN_LOGIC

WALL_HIT:
	li $11, 0x1
	beq $6, $11, GAME_OVER
	#beq $6, $0, GAME_OVER // if lives==0, display game over and wait for button inpu
	j DECREMENT_LIVES	// else reset and decrement lives

GAME_OVER:
	// diplay zero lives
	li $27, PORT_SEVENSEG_LOW
	li $12, 0x1c1c17
	sll $12, $12, 8
	add $12, $12, $0
	sw $12, 0($27)

	// display game over screen
	li $11, PORT_WHICH_SCREEN
	li $12, GAME_OVER_SCREEN
	sw $12, 0($11)
	j KEY_PRESSED_IF

KEY_PRESSED_IF:
	li $11, BUTTONS_ADDR
	lw $12, 0($11)
	li $11, BUTTON_C_MASK
	and $12, $12, $11
	bne $12, $0, ENTER_IS_PRESSED_WALL_HIT
	j readIO

ENTER_IS_PRESSED_WALL_HIT:
	jal SOFT_RESET
	li $6, 3
	// display level 1 screen and set level reg
	li $9, 0x1;
	li $11, PORT_WHICH_SCREEN
	li $12, LEVEL_1_SCREEN
	sw $12, 0($11)
	j readIO

DECREMENT_LIVES:
	li $11, 1
	sub $6, $6, $11
	jal SOFT_RESET
	j readIO

WIN_LOGIC:
	li $6, 3 				// reset lives to 3 if win
	beq $9, 0x3, WIN_GAME
	j WIN_NEXT_LEVEL

WIN_GAME:
	li $11, PORT_WHICH_SCREEN // display win screen
	li $12, WIN_SCREEN
	sw $12, 0($11)
	j WIN_AFTER_CHECK

WIN_NEXT_LEVEL:
	li $11, PORT_WHICH_SCREEN // display level complete
	li $12, LEVEL_COMPLETE
	sw $12, 0($11)
	j WIN_AFTER_CHECK

WIN_AFTER_CHECK:
	li $11, BUTTONS_ADDR
	lw $12, 0($11)
	li $11, BUTTON_C_MASK
	and $12, $12, $11
	bne $12, $0, ENTER_IS_PRESSED_WIN
	j readIO

ENTER_IS_PRESSED_WIN:
	beq $9, 0x3, WIN_RESET_LEVEL
	j WIN_INCREMENT_LEVEL

WIN_RESET_LEVEL:
	li $9, 0x1
	j WIN_AFTER_ENTER_CHECK

WIN_INCREMENT_LEVEL:
	addi $9, $9, 0x1
	j WIN_AFTER_ENTER_CHECK

WIN_AFTER_ENTER_CHECK:
	li $11, PORT_WHICH_SCREEN // display next level
	sw $9, 0($11)
	jal SOFT_RESET
	j readIO




OTHER_THAN_DEADLOCK:



	li $10, 50							# tolerance($10) = 200
	# update x if outside tolerance
	lw $12, 0($20) 						# argument_1($12) = temp_x_acc_data
	add $7, $0, $16						# argument_2($7) = x_acc_data($16)
	jal TOLERANCE_FUNCTION
	add $16, $0, $7						# x_acc_data = return_value($7)

	# update y if outside tolerance
	lw $12, 0($21) 						# argument_1($12) = temp_y_acc_data
	add $7, $0, $17						# argument_2($7) = y_acc_data$17)
	jal TOLERANCE_FUNCTION
	add $17, $0, $7						# y_acc_data = return_value($7)

	# update z if outside tolerance
	lw $12, 0($22) 						# argument_1($12) = temp_z_acc_data
	add $7, $0, $18						# argument_2($7) = y_acc_data($18)
	jal TOLERANCE_FUNCTION
	add $18, $0, $7						# z_acc_data = return_value($7)


	li $7, PORT_SLSWTCH
	lw $8, 0($7)
	bne $8, $0, DEBUG_MODE
	j GAME_MODE

DEBUG_MODE:
	# update LED0 if x negative
	addi $12, $0, LED0_LIT				# argument_1($12) = LED0_LIT
	addi $7, $0, LED0_OFF				# argument_2($7) = LED0_OFF
	add $8, $0, $16						# argument_3($7) = x_acc_data($16)
	jal LED_FUNCITON

	# update LED1 if y negative
	addi $12, $0, LED1_LIT				# argument_1($12) = LED1_LIT
	addi $7, $0, LED1_OFF				# argument_2($7) = LED1_OFF
	add $8, $0, $17						# argument_3($7) = y_acc_data($17)
	jal LED_FUNCITON

	# update LED2 if z negative
	addi $12, $0, LED2_LIT				# argument_1($12) = LED2_LIT
	addi $7, $0, LED2_OFF				# argument_2($7) = LED2_OFF
	add $8, $0, $18						# argument_3($7) = z_acc_data($18)
	jal LED_FUNCITON

	# convert x_acc_data to BCD and display on ssegLow
	li $12, PORT_SEVENSEG_LOW			#
	add $7, $0, $16						#
	jal BCD_FUNCTION

	# convert x_acc_data to BCD and display on ssegHi
	li $12, PORT_SEVENSEG_HGH			#
	add $7, $0, $17						#
	jal BCD_FUNCTION
	j MOVEMENT_LOGIC

GAME_MODE:
	# zero bits for now
	li $27, PORT_SEVENSEG_LOW
	li $12, 0x1c1c17
	sll $12, $12, 8
	add $12, $12, $6
	sw $12, 0($27)


	# lives = 6, level = 9
	# zero bits for now
	li $27, PORT_SEVENSEG_HGH
	li $12, 0x1C1C18
	sll $12, $12, 8
	add $12, $12, $9
	sw $12, 0($27)

	# zero LEDs
	addi $23, $0, 0x0						# $23 = This will hold current LED Value
	li $10, LEDS_ADDR						# 10 = LEDS_ADDR
	sh $23, 0($10)
#-----------------------------START ICON MOVEMENT LOGIC-------------------------------------
#-------------------------------------------------------------------------------------------
MOVEMENT_LOGIC:
	andi $14, $16, BIT_12_MASK			# $14 = and(x_acc_data, bit_12_mask)
	andi $15, $17, BIT_12_MASK			# $15 = and(y_acc_data, bit_12_mask)


	add $7, $0, $16						# $7 = temp(x_acc_data). This will be converted to positive if negative
	add $8, $0, $17						# $8 = temp(y_acc_data). This will be converted to positive if negative
	bne $14, $0, CALCULATE_TWOS_COMPLEMENT_X			# if $14<0 then negative, so invert bits
	bne $15, $0, CALCULATE_TWOS_COMPLEMENT_Y			# if $14<0 then negative, so invert bits
	j POST_TWO_COMPLEMENT_LOGIC

CALCULATE_TWOS_COMPLEMENT_X:
	add $2, $0, $16						# argument_1($7) = x_acc_data($16)
	jal TWOS_COMPLEMENT_FUNCTION
	add $7, $0, $2						# $7 = positive(x_acc_data)
	bne $15, $0, CALCULATE_TWOS_COMPLEMENT_Y			# if $15<0 then negative, so invert bits
	j POST_TWO_COMPLEMENT_LOGIC

CALCULATE_TWOS_COMPLEMENT_Y:
	add $2, $0, $17						# argument_1($7) = x_acc_data($16)
	jal TWOS_COMPLEMENT_FUNCTION
	add $8, $0, $2						# $8 = positive(y_acc_data)

POST_TWO_COMPLEMENT_LOGIC:
	addi $11, $0, 0x12c 				# $11 = 300
	slt $12, $7, $11					# x_pos>300?
	beq $12, $0, X_GT_300

	slt $12, $8, $11					# y_pos>300?
	beq $12, $0, Y_GT_300

	li $13, 0x00					# neither x or y greater than threshold. jump to end
	j END_OF_DIRECTION_LOGIC

#--------------------------X_GT_300_LOGIC---------------------------------
X_GT_300:
	slt $12, $8, $11
	bne $12, $0, X_GT_300_AND_Y_LT_300
	j X_GT_300_AND_Y_GT_300

X_GT_300_AND_Y_LT_300:
	bne $14, $0, X_GT_300_AND_Y_LT_300_X_NEG
	j X_GT_300_AND_Y_LT_300_X_POS

X_GT_300_AND_Y_LT_300_X_NEG:
	li $13, NORTH
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_LT_300_X_POS:
	li $13, SOUTH
	j END_OF_DIRECTION_LOGIC

#--------------------------Y_GT_300_LOGIC---------------------------------
Y_GT_300:
	slt $12, $7, $11
	bne $12, $0, X_LT_300_AND_Y_GT_300
	j X_GT_300_AND_Y_GT_300

X_LT_300_AND_Y_GT_300:
	bne $15, $0, X_LT_300_AND_Y_GT_300_Y_NEG
	j X_LT_300_AND_Y_GT_300_Y_POS

X_LT_300_AND_Y_GT_300_Y_NEG:
	li $13, EAST
	j END_OF_DIRECTION_LOGIC

X_LT_300_AND_Y_GT_300_Y_POS:
	li $13, WEST
	j END_OF_DIRECTION_LOGIC

#--------------------------X_AND_Y_GT_300_LOGIC---------------------------
X_GT_300_AND_Y_GT_300:
	li $13, 0x0 							# DO I NEED THIS????
	bne $14, $0, X_GT_300_AND_Y_GT_300_X_NEG
	bne $15, $0, X_GT_300_AND_Y_GT_300_X_POS_Y_NEG
	j X_GT_300_AND_Y_GT_300_X_POS_AND_Y_POS
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_NEG:
	bne $15, $0, X_GT_300_AND_Y_GT_300_X_NEG_Y_NEG
	li $13, NORTHWEST
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_POS_Y_NEG:
	li $13, SOUTHEAST
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_NEG_Y_NEG:
	li $13, NORTHEAST
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_POS_AND_Y_POS:
	li $13, SOUTHWEST
	j END_OF_DIRECTION_LOGIC

END_OF_DIRECTION_LOGIC:

#-----------------------------START SPEED LOGIC---------------------------------------------
#-------------------------------------------------------------------------------------------

		li $19, STOPPED  					# x_speed($19) = stopped
		li $26, STOPPED  					# y_speed($26) = stopped
CALC_X_SPEED:
		#addi $11, $0, 0x12c 				# $11 = 300
		addi $11, $0, 300
		slt $12, $7, $11					# x_pos>300?
		beq $12, $0, X_SPEED_SLOW
		j CALC_Y_SPEED

X_SPEED_SLOW:
		li $19, SLOW  						# x_speed($19) = slow
		#addi $11, $0, 0x1F4					# $11 = 500
		addi $11, $0, 400
		slt $12, $7, $11					# x_pos>500?
		beq $12, $0, X_SPEED_MEDIUM
		j CALC_Y_SPEED

X_SPEED_MEDIUM:
		li $19, MEDIUM  					# x_speed($19) = medium
		#addi $11, $0, 0x2BC 				# $11 = 700
		addi $11, $0, 500
		slt $12, $7, $11					# x_pos>700?
		beq $12, $0, X_SPEED_FAST
		j CALC_Y_SPEED

X_SPEED_FAST:
		li $19, FAST  						# x_speed($19) = fast
		j CALC_Y_SPEED

CALC_Y_SPEED:
		#addi $11, $0, 0x12c 				# $11 = 300
		addi $11, $0, 300
		slt $12, $8, $11					# y_pos>300?
		beq $12, $0, Y_SPEED_SLOW
		j END_SPEED_LOGIC

Y_SPEED_SLOW:
		li $26, SLOW  						# y_speed($26) = slow
		#addi $11, $0, 0x1F4					# $11 = 500
		addi $11, $0, 400
		slt $12, $8, $11					# y_pos>500?
		beq $12, $0, Y_SPEED_MEDIUM
		j END_SPEED_LOGIC

Y_SPEED_MEDIUM:
		li $26, MEDIUM  					# y_speed($26) = medium
		addi $11, $0, 500
		#addi $11, $0, 0x2BC 				# $11 = 700
		slt $12, $8, $11					# y_pos>700?
		beq $12, $0, Y_SPEED_FAST
		j END_SPEED_LOGIC

Y_SPEED_FAST:
		li $26, FAST  						# y_speed($26) = fast
		j END_SPEED_LOGIC


END_SPEED_LOGIC:
		#sll $19, 4 							# shift for speed x bits
		#sll $26, 6 							# shift for speed y bits
		sll $19, 6 							# shift for speed x bits
		sll $26, 4 							# shift for speed y bits
		or $13, $13, $19					# add x speed bits
		or $13, $13, $26					# add y speed bits
		li $12, PORT_BOTCTRL
		sw $13, 0($12)


	j readIO





#------------------------------------------------------------------------------
# FUNCTIONS
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# TOLERANCE_FUNCITON() - Checks if current acceleromter reading is within +/- 200
# of the previous reading.  Updates accelerometer values if thresholds are met.
#
# Registers used:
#------------------------------------------------------------------------------
TOLERANCE_FUNCTION:
LT_TEMP_MINUS_TOLERANCE:
	sub $11, $7, $10 						# $11 = xyz_value($7)-200($10)
	slt $13, $12, $11 						# if reg_value<(xyz_value-200) then ($13)=1
	beq $13, 1, SET_XYZ

GT_TEMP_PLUS_TOLERANCE:
	add $11, $7, $10 						# $11 = xyz_value($7)+200($10)
	slt $13, $12, $11 						# if reg_value>(xyz_value + 200) then ($13)=0
	beq $13, 0, SET_XYZ
	jr $ra

SET_XYZ:
	add $7, $12, $0 						# xyz_acc_data = temp xyz_acc_data
	jr $ra

#------------------------------------------------------------------------------
# LED_FUNCITON() - Light LED corresponding to X(LED0), Y(LED1) or Z(LED2) value
#
# Registers used:
#------------------------------------------------------------------------------
LED_FUNCITON:
	li $10, LEDS_ADDR					# 10 = LEDS_ADDR
	andi $14, $8, BIT_12_MASK			# $14 = and(x_acc_data, bit_12_mask)
	bne $14, 0, NEGATIVE				# if $14<0 then NEGATIVE; else POSITIVE
	j POSITIVE

NEGATIVE:
	or $23, $23, $12
	j checkposEnd

POSITIVE:
	and $23, $23, $7
	j checkposEnd

checkposEnd:
	sh $23, 0($10)
	jr $ra
	nop # branch delay slot

#------------------------------------------------------------------------------
# BCD_FUNCTION() - Converts hexadecimal to BCD
#
# Reigsters used:
#------------------------------------------------------------------------------
BCD_FUNCTION:
	add $2, $0, $7 						# temp_x_acc_data($2) = x_acc_data
	andi $14, $2, BIT_12_MASK			# $14 = and(temp_x_acc_data, bit_12_mask)
	bne $14, 0, TWOS_COMPLEMENT			# if $14<0 then negative, so invert bits
	j SKIP_TWOS_COMPLEMENT

TWOS_COMPLEMENT:
	not $2, $2
	addi $2, $2, 1
	andi $2, $2, 0x00000fff
SKIP_TWOS_COMPLEMENT:
	li $5, 0							# $5 = 1000s counter
	li $4, 0 							# $4 = 100s counter
	li $24, 0 							# $24 = 10s counter
	li $25, 0
COUNT_1000S:
	sub $3, $2, 0x3E8
	blt $3, $0, COUNT_100S  			# if $3 < $0 then COUNT_10S
	addi $5, $5, 1
	add $2, $0, $3
	j COUNT_1000S

COUNT_100S:
	sub $3, $2, 0x64					# subtract 100 from compass and place in $3
	blt $3, $0, COUNT_10S  				# if $3 < $0 then COUNT_10S
	addi $4, $4, 1
	add $2, $0, $3
	j COUNT_100S

COUNT_10S:
	sub $3, $2, 0xA						# subtract 10 from compass and place in $3
	blt $3, $0, COUNT_1S  				# if $3 < $0 then COUNT_1S
	addi $24, $24, 1
	add $2, $0, $3
	j COUNT_10S

COUNT_1S:
	sub $3, $2, 0x1						# subtract 1 from compass and place in $3
	blt $3, $0, END_BCD  				# if $3 < $0 then END_BCD
	addi $25, $25, 1
	add $2, $0, $3
	j COUNT_1S

END_BCD:
	sll $5, $5, 24
	sll $4, $4, 16
	sll $24 , $24, 8
	or $5, $4, $5						# or 1000s and 100s and put in 1000s
	or $5, $24, $5						# or 1000s and 10s and put in 1000s
	or $5, $25, $5						# or 1000s and 1s and put in 1000s
	sw $5, 0($12)						# right 1000s and down to sseg
	jr $ra
	nop # branch delay slot


#------------------------------------------------------------------------------
# TWOS_COMPLEMENT_FUNCTION - returns twos-complement of input
#
# Reigsters used: $2
#------------------------------------------------------------------------------
TWOS_COMPLEMENT_FUNCTION:
	not $2, $2
	addi $2, $2, 1
	andi $2, $2, 0x00000fff
	jr $ra


#------------------------------------------------------------------------------
# SOFT_RESET -
#
# Reigsters used:
#------------------------------------------------------------------------------
SOFT_RESET:

		li $12, PORT_BOTCTRL # reset speed to zero and direction to North
		sw $0, 0($12)

		li $11, 0
		li $12, PORT_SOFTRESET

		sw $11, 0($12)
		li $11, 1
		sw $11, 0($12)
		jr $ra
