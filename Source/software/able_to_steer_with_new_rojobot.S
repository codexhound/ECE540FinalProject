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



SOUTH = 0x01
NORTH = 0x02
EAST = 0x03
WEST = 0x04
SOUTHEAST = 0x05
SOUTHWEST = 0x08
NORTHEAST = 0x06
NORTHWEST = 0x07

# nexys4 addresses
PORT_SEVENSEG_EN 	= 0xbf700000		# (o) 7 Segment enable
PORT_SEVENSEG_HGH	= 0xbf700004		# (o) 7 Segment Higher Display
PORT_SEVENSEG_LOW	= 0xbf700008		# (o) 7 Segment Lower Display
PORT_SEVENSEG_DP	= 0xbf70000C		# (o) 7 segment Decimal Point Display
BUTTONS_ADDR 		= 0xbf800008        # (o) Input Buttons Address
LEDS_ADDR			= 0xbf800000        # (o) LEDS Address

# accelerometer register addresses
X_ACC_ADDR			= 0xbf80001C		# (i)
Y_ACC_ADDR			= 0xbf800020		# (i)
Z_ACC_ADDR			= 0xbf800024        # (i)

# rojobot register addresses
PORT_BOTCTRL		= 0xbf800014		# (o) Bot Control port
PORT_BOTUPDATE		= 0xbf800010		# (i) Bot Update Port
PORT_BOTACK			= 0xbf800018		# (o) Bot Acknowledge Port
PORT_NEW_ORIENTATION = 0xbf800028		# (o) Bot New Orientation Port

# masks
BIT_12_MASK 		= 0x800

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


.globl main
main:

	# experiment with new orientations
#	li $27, PORT_NEW_ORIENTATION
#	li $26, OR_NW
#	sw $26, 0($27)

	# make sure SSEG_LOW digits are zero before enabling
	li $27, PORT_SEVENSEG_LOW
	li $26, 0x00
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


	# zero LEDs to start
	addi $23, $0, 0x0						# $23 = This will hold current LED Value
	li $10, LEDS_ADDR						# 10 = LEDS_ADDR
	sh $23, 0($10)




readIO:
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

	li $12, PORT_BOTCTRL
	li $7, NORTHWEST
	sw $7, 0($12)

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

