/*intialialize level register = 1st level
maingameloop:
if(deadlock)
	if(wallHit)
		display game over on 7 seg display
		load game over map into level select address
		if(c button input) //enter key input
			select 1st level
			set level register as 1st level
			soft reset the bot -> set then unset
			jump to main loop
		else return to main loop
	else //win, end Maze
		if(c button input) //enter key input
				calculate the next level and set level reg
				display to 7 seg based on next level
				load level reg into level select address
				soft reset the bot -> set then unset
				jump to main loop
		else
			display to 7 seg based on next level
			jump to main loop
else //main game loop
	the current game code goes here*/

/*
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
BUTTONS_ADDR 		= 0xbf800008        # (i) Input Buttons Address
LEDS_ADDR			= 0xbf800000        # (io) LEDS Address
PORT_SLSWTCH		= 0xbf800004		# (i) slide switches
PORT_MAPSELECT		= 0xbf800018		# (io) map select address

# accelerometer register addresses
X_ACC_ADDR			= 0xbf80001C		# (i)
Y_ACC_ADDR			= 0xbf800020		# (i)
Z_ACC_ADDR			= 0xbf800024        # (i)

# rojobot register addresses
PORT_BOTCTRL		= 0xbf800014		# (io) Bot Control port
PORT_BOTINFO = 		= 0xbf80000C		# (i) Bot Info Port
PORT_SOFTRESET = 0xbf800010             # (o) Bot Softreset (Active Low)

# masks
BIT_12_MASK 		= 0x800
INFO_DEADLOCK_MASK = 0x8
INFO_MAZEEND = 0x20
INFO_WALLCRASH = 0x10
C_BUTTON_MASK = 0x10
MODE_SWI_MASK = 0x1

# values to write to LEDs
LED0_LIT = 0x01
LED0_OFF = 0xFE
LED1_LIT = 0x02
LED1_OFF = 0xFD
LED2_LIT = 0x04
LED2_OFF = 0xFB

# map selects
GAMEOVER = 0x0
GAMEWIN = 0x1
LEVELWIN = 0x2
LEVEL1 = 0x3
LEVEL2 = 0x4
LEVEL3 = 0x5
LASTLEVEL = 0x5

#digit consts
CLEARED_DIGITS = 0x1C1C1C0C

.globl main
main:
	li $s3, LEVEL1							#initialize level register to LEVEL 1
	li $s4, 3								#initialize lives to 3
	li $s5, 0								#initialize wall hit reg to 0
	li $s6, 0								#initialize mazeEnd reg to 0
	li $s7, 0								#initialize deadlock reg to 0
	li $t8, 0								#initialize modeswitch reg to 0
	li $t9, 0								#initialize map select reg to 0
	li $t1, 0 								#initialize cbutton

	li $11, PORT_MAPSELECT
    sw $s3, 0($11) #sw LEVEL_REG mapADDR //set to current reg just in case

    li $t3, 0
	li $t2, PORT_BOTCTRL
	sw $t3, 0($t2) #initialize bot control to 0

	# make sure SSEG_LOW digits are zero before enabling
	li $k1, PORT_SEVENSEG_LOW
	li $k0, 0x0B00000B
	sw $k0, 0($k1)

	# make sure SSEG_HI digits are zero before enabling
	li $k1, PORT_SEVENSEG_HGH
	li $k0, 0x00
	sw $k0, 0($k1)

	# enable seven_segement digits
	li $a0, PORT_SEVENSEG_EN					# 27 = SEVEN_SEG_EN
	li $k0, 0x00							# enable all sseg digits
	sw $k0, 0($a0)

	li   $s4, X_ACC_ADDR					# $s4 = address of x_acc_data
	li   $s5, Y_ACC_ADDR					# $s5 = address of y_acc_data
	li   $s6, Z_ACC_ADDR					# $s6 = address of z_acc_data

	lw $s0, 0($s4)							# $s0 = x_acc_data
	lw $s1, 0($s5)							# $s1 = y_acc_data
	lw $s2, 0($s6)							# $s2 = z_acc_data

	# zero LEDs to start
	addi $s7, $zero, 0x0						# $s7 = This will hold current LED Value
	li $t2, LEDS_ADDR						# 10 = LEDS_ADDR
	sh $s7, 0($t2)

####################  Start Main Loop ###############################################
#####################################################################################

MAINLOOP:
	li $t3, PORT_BOTINFO
	lw $t3, 0($t3)
	andi $s5, $t3, INFO_WALLCRASH #get wallHit bit
	addi $s6, $t3, INFO_MAZEEND #get mazeEnd bit
	addi $s7, $t3, INFO_DEADLOCK_MASK #get deadlock bit
	li $t3, PORT_SLSWTCH
	lw $t3, 0($t3)
	andi $t8, $t3, MODE_SWI_MASK

	################ Update Acceleration Regs if tolerance is met ##################

	li $t2, 50							# tolerance($t2) = 200
	# update x if outside tolerance
	lw $t4, 0($s4) 						# argument_1($t4) = temp_x_acc_data
	add $a3, $zero, $s0						# argument_2($a3) = x_acc_data($s0)
	jal TOLERANCE_FUNCTION
	add $s0, $zero, $a3						# x_acc_data = return_value($a3)

	# update y if outside tolerance
	lw $t4, 0($s5) 						# argument_1($t4) = temp_y_acc_data
	add $a3, $zero, $s1						# argument_2($a3) = y_acc_data$s1)
	jal TOLERANCE_FUNCTION
	add $s1, $zero, $a3						# y_acc_data = return_value($a3)

	# update z if outside tolerance
	lw $t4, 0($s6) 						# argument_1($t4) = temp_z_acc_data
	add $a3, $zero, $s2						# argument_2($a3) = y_acc_data($s2)
	jal TOLERANCE_FUNCTION
	add $s2, $zero, $a3						# z_acc_data = return_value($a3)

	################################################################################

	beq $t8, 0, MAINGAMELOOP ##if switches equal 0 then enter maingame loop otherwise enter debug loop
	j DEBUGLOOP

DEBUGLOOP:
	li $t3, PORT_MAPSELECT
	li $t2, GAMEOVER
	sw $t2, 0($t3) 					#select GAMEOVERMAP in LEVELSEL address

	bne $s7, 0, DEBUGSOFTRESET 		#if there is a deadlock, do a soft reset other wise continue onto maingamelogic
	j DEBUG_MAIN_LOGIC

DEBUG_MAIN_LOGIC:

	################### DEBUG DISPLAY #########################################

	# update LED0 if x negative
	addi $t4, $zero, LED0_LIT				# argument_1($t4) = LED0_LIT
	addi $a3, $zero, LED0_OFF				# argument_2($a3) = LED0_OFF
	add $t0, $zero, $s0						# argument_3($a3) = x_acc_data($s0)
	jal LED_FUNCITON

	# update LED1 if y negative
	addi $t4, $zero, LED1_LIT				# argument_1($t4) = LED1_LIT
	addi $a3, $zero, LED1_OFF				# argument_2($a3) = LED1_OFF
	add $t0, $zero, $s1						# argument_3($a3) = y_acc_data($s1)
	jal LED_FUNCITON

	# update LED2 if z negative
	addi $t4, $zero, LED2_LIT				# argument_1($t4) = LED2_LIT
	addi $a3, $zero, LED2_OFF				# argument_2($a3) = LED2_OFF
	add $t0, $zero, $s2						# argument_3($a3) = z_acc_data($s2)
	jal LED_FUNCITON

	# convert x_acc_data to BCD and display on ssegLow
	li $t4, PORT_SEVENSEG_LOW			#
	add $a3, $zero, $s0						#
	jal BCD_FUNCTION

	# convert y_acc_data to BCD and display on ssegHi
	li $t4, PORT_SEVENSEG_HGH			#
	add $a3, $zero, $s1						#
	jal BCD_FUNCTION

	############################################################################
	
	j BOTHMODESLOGIC

DEBUGSOFTRESET:
	jal SOFTRESET
	j MAINLOOP

MAINGAMELOOP:
    li $t3, PORT_MAPSELECT
	lw $t9, 0($t3)
	li $t3, BUTTONS_ADDR
	lw $t3, 0($t3)
	andi $t1, $t3, C_BUTTON_MASK
	bne $s7, 0, WALLHIT
	j MAINGAMELOGIC

WALLHIT:
	bne $s5,0, IFWALLHIT
	beq $s6,0, IFLEVELWIN 			#if maze end or not wall hit then its a win
	j IFLEVELWIN

IFWALLHIT:
	jal CLEAR_7SEG
	jal LOSS_LOGIC 					#jump to loss logic
	j MAINLOOP

IFLEVELWIN:
	jal CLEAR_7SEG
	jal DISPLAYWIN 					#win logic function
	j MAINLOOP

#####################################################################################
#Start Main Game Loop Functions
#####################################################################################
/////////////////MAINGAMELOOPFUNCTIONS///////////////////////////////

///////////////////////Game Win Pseudo Code//////////////////////////
/*
if(gamewin)
	if(not displaying game win and level win)
		get game win type
		display game win (type)
		set game win reg
		return
	else //displaying game win
		if (enter key)
			go to next level
			reset
			return
		else return
*/
#####################################################################################
#####################################################################################

LOSS_LOGIC:
	add $t2, $ra, $zero #store caller in $t2 for end of function
	beq $s4, 0, DISPLAYGAMEOVER #lives was 0, display game over
	j LOSSWAIT ##else wait for input to continue

LOSSWAIT:
	bne $t1, 0, LOSS_RESET ##if enter input (!= 0) start end logic
	j LOSSEND

LOSS_RESET:	
	jal LOSS_SETLIVES
	jal SOFTRESET
	li $t3, GAMEOVER
	beq $t9, $t3, LOSS_GAMEOVER #if displaying game over
	j LOSSEND

LOSS_GAMEOVER:
	li $s3, LEVEL1 #must reset back to level 1, no more lives left
	li $t3, PORT_MAPSELECT
	sw $s3, 0($t3)
	j LOSSEND

DISPLAYGAMEOVER:
    li $t3, GAMEOVER
    li $t4, PORT_MAPSELECT
    sw $t3, 0($t4) #sw GAMEOVER mapADDR
	j LOSSWAIT

LOSSEND:
	jr $t2

#####################################################################################
#####################################################################################

LOSS_SETLIVES:
	beq $s4, 0, RESETLIVES
	j DECLIVES

RESETLIVES:
	li $s4, 3 #set lives to 3
	j LOSS_SETLIVES_END

DECLIVES:
    li $t3, 1
	sub $s4, $s4, $t3 #lives = lives - 1
	j LOSS_SETLIVES_END

LOSS_SETLIVES_END:
	jr $ra

#####################################################################################
##############  Display WIN Function ################################################

DISPLAYWIN:
	li $s4, 3 #reset lives
	add $t2, $zero, $ra #store return address in temp1
	li $t3, GAMEWIN
	bne $t9, $t3, GAMEWINCHECK ##if mapSel is not GAMEWIN and not LEVELWIN
	j DISPLAYING_GAME_WIN ##else displaying GAMEWIN

GAMEWINCHECK:
	li $t3, LEVELWIN
	bne $t9, $t3, NOT_DISPLAYING_GAME_WIN ##and not LEVELWIN
	j DISPLAYING_GAME_WIN ##else displaying GAMEWIN

NOT_DISPLAYING_GAME_WIN:
	li $t3, LASTLEVEL
	beq $s3, $t3, DISPLAYGAMEWIN #if level reg is last level display game win
	j DISPLAYLEVELWIN ##else disiplay level win

DISPLAYGAMEWIN:
	li $s3, LEVEL1 #LEVEL_REG = LEVEL1
	li $t3, GAMEWIN
	li $t4, PORT_MAPSELECT
	sw $t3, 0($t4) #sw GAMEWIN mapADDR
	j GAMEWINEND

DISPLAYLEVELWIN:
	addi $s3, $s3, 1 #LEVEL_REG = LEVEL_REG + 1
	li $t3, LEVELWIN
	li $t4, PORT_MAPSELECT
	sw $t3, 0($t4) #sw LEVELWIN mapADDR
	j GAMEWINEND

DISPLAYING_GAME_WIN:
	bne $t1, 0, GAMEWINENTER ##if cbutton is pressed (not 0)
	j GAMEWINEND

GAMEWINENTER:
	li $t3, PORT_MAPSELECT
	sw $s3, 0($t3) #sw LEVEL_REG mapADDR //on enter set mapSel to LEVEL_REG (next level from prev) and do a soft reset
	jal SOFTRESET
	j GAMEWINEND

GAMEWINEND:
	jr $t2 ##return to caller

#####################################################################################
#####################################################################################

SOFTRESET:
	li $t3, 0
	li $t2, PORT_SOFTRESET
	sw $t3, 0($t2)
	li $t3, 1
	sw $t3, 0($t2)
	li $t3, 0
	li $t2, PORT_BOTCTRL
	sw $t3, 0($t2) #reset bot control to 0
	jr $ra

#####################################################################################
#####################################################################################

CLEAR_7SEG: 
    addi $t2, $0, 12 #load C into low digits
    li $t3, 0x1C1C1C00
    add $t2, $t3, $t2
    li $t3, PORT_SEVENSEG_LOW
    sw $t2, 0($t3)
    li $t3, PORT_SEVENSEG_HGH
    li $t2, CLEARED_DIGITS
    sw $t2, 0($t3)
	jr $ra

#####################################################################################
#####################################################################################

DISPLAY_LIVES_7SEG:
	sub $t2, $s3, 2 #sub 3+1 (2wins,gameover) to get actual level
	li $t3, 0x1C1C1C00
	add $t2, $t3, $t2
	li $t3, PORT_SEVENSEG_LOW
	sw $t2, 0($t3) #load level into low digits

	addi $t2, $s4, 0
	li $t3, 0x1C1C1C00
	add $t2, $t3, $t2
	li $t3, PORT_SEVENSEG_HGH
	sw $t2, 0($t3) #load lives into high digits

	jr $ra

#####################################################################################
##END MAIN GAME LOOP FUNCTIONS

MAINGAMELOGIC:
    li $11, PORT_MAPSELECT
    sw $s3, 0($11) #sw LEVEL_REG mapADDR //set to current reg just in case

    jal DISPLAY_LIVES_7SEG #lives levels ------------- lives

    j BOTHMODESLOGIC

BOTHMODESLOGIC:

    #########################################################################

#-----------------------------START ICON MOVEMENT LOGIC-------------------------------------
#-------------------------------------------------------------------------------------------
MOVEMENT_LOGIC:
	andi $t6, $s0, BIT_12_MASK			# $t6 = and(x_acc_data, bit_12_mask)
	andi $t7, $s1, BIT_12_MASK			# $t7 = and(y_acc_data, bit_12_mask)


	add $a3, $zero, $s0						# $a3 = temp(x_acc_data). This will be converted to positive if negative
	add $t0, $zero, $s1						# $t0 = temp(y_acc_data). This will be converted to positive if negative
	bne $t6, $zero, CALCULATE_TWOS_COMPLEMENT_X			# if $t6<0 then negative, so invert bits
	bne $t7, $zero, CALCULATE_TWOS_COMPLEMENT_Y			# if $t6<0 then negative, so invert bits
	j POST_TWO_COMPLEMENT_LOGIC

CALCULATE_TWOS_COMPLEMENT_X:
	add $v0, $zero, $s0						# argument_1($a3) = x_acc_data($s0)
	jal TWOS_COMPLEMENT_FUNCTION
	add $a3, $zero, $v0						# $a3 = positive(x_acc_data)
	bne $t7, $zero, CALCULATE_TWOS_COMPLEMENT_Y			# if $t7<0 then negative, so invert bits
	j POST_TWO_COMPLEMENT_LOGIC

CALCULATE_TWOS_COMPLEMENT_Y:
	add $v0, $zero, $s1						# argument_1($a3) = x_acc_data($s0)
	jal TWOS_COMPLEMENT_FUNCTION
	add $t0, $zero, $v0						# $t0 = positive(y_acc_data)

POST_TWO_COMPLEMENT_LOGIC:
	addi $t3, $zero, 0x12c 				# $t3 = 300
	slt $t4, $a3, $t3					# x_pos>300?
	beq $t4, $zero, X_GT_300

	slt $t4, $t0, $t3					# y_pos>300?
	beq $t4, $zero, Y_GT_300

	li $t5, 0x00					# neither x or y greater than threshold. jump to end
	j END_OF_DIRECTION_LOGIC

#--------------------------X_GT_300_LOGIC---------------------------------
X_GT_300:
	slt $t4, $t0, $t3
	bne $t4, $zero, X_GT_300_AND_Y_LT_300
	j X_GT_300_AND_Y_GT_300

X_GT_300_AND_Y_LT_300:
	bne $t6, $zero, X_GT_300_AND_Y_LT_300_X_NEG
	j X_GT_300_AND_Y_LT_300_X_POS

X_GT_300_AND_Y_LT_300_X_NEG:
	li $t5, NORTH
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_LT_300_X_POS:
	li $t5, SOUTH
	j END_OF_DIRECTION_LOGIC

#--------------------------Y_GT_300_LOGIC---------------------------------
Y_GT_300:
	slt $t4, $a3, $t3
	bne $t4, $zero, X_LT_300_AND_Y_GT_300
	j X_GT_300_AND_Y_GT_300

X_LT_300_AND_Y_GT_300:
	bne $t7, $zero, X_LT_300_AND_Y_GT_300_Y_NEG
	j X_LT_300_AND_Y_GT_300_Y_POS

X_LT_300_AND_Y_GT_300_Y_NEG:
	li $t5, EAST
	j END_OF_DIRECTION_LOGIC

X_LT_300_AND_Y_GT_300_Y_POS:
	li $t5, WEST
	j END_OF_DIRECTION_LOGIC

#--------------------------X_AND_Y_GT_300_LOGIC---------------------------
X_GT_300_AND_Y_GT_300:
	li $t5, 0x0 							# DO I NEED THIS????
	bne $t6, $zero, X_GT_300_AND_Y_GT_300_X_NEG
	bne $t7, $zero, X_GT_300_AND_Y_GT_300_X_POS_Y_NEG
	j X_GT_300_AND_Y_GT_300_X_POS_AND_Y_POS
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_NEG:
	bne $t7, $zero, X_GT_300_AND_Y_GT_300_X_NEG_Y_NEG
	li $t5, NORTHWEST
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_POS_Y_NEG:
	li $t5, SOUTHEAST
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_NEG_Y_NEG:
	li $t5, NORTHEAST
	j END_OF_DIRECTION_LOGIC

X_GT_300_AND_Y_GT_300_X_POS_AND_Y_POS:
	li $t5, SOUTHWEST
	j END_OF_DIRECTION_LOGIC

END_OF_DIRECTION_LOGIC:

#-----------------------------START SPEED LOGIC---------------------------------------------
#-------------------------------------------------------------------------------------------

		li $s3, STOPPED  					# x_speed($s3) = stopped
		li $k0, STOPPED  					# y_speed($k0) = stopped
CALC_X_SPEED:
		addi $t3, $zero, 0x12c 				# $t3 = 300
		slt $t4, $a3, $t3					# x_pos>300?
		beq $t4, $zero, X_SPEED_SLOW
		j CALC_Y_SPEED

X_SPEED_SLOW:
		li $s3, SLOW  						# x_speed($s3) = slow
		addi $t3, $zero, 0x1F4					# $t3 = 500
		slt $t4, $a3, $t3					# x_pos>500?
		beq $t4, $zero, X_SPEED_MEDIUM
		j CALC_Y_SPEED

X_SPEED_MEDIUM:
		li $s3, MEDIUM  					# x_speed($s3) = medium
		addi $t3, $zero, 0x2BC 				# $t3 = 700
		slt $t4, $a3, $t3					# x_pos>700?
		beq $t4, $zero, X_SPEED_FAST
		j CALC_Y_SPEED

X_SPEED_FAST:
		li $s3, FAST  						# x_speed($s3) = fast
		j CALC_Y_SPEED

CALC_Y_SPEED:
		addi $t3, $zero, 0x12c 				# $t3 = 300
		slt $t4, $t0, $t3					# y_pos>300?
		beq $t4, $zero, Y_SPEED_SLOW
		j END_SPEED_LOGIC

Y_SPEED_SLOW:
		li $k0, SLOW  						# y_speed($k0) = slow
		addi $t3, $zero, 0x1F4					# $t3 = 500
		slt $t4, $t0, $t3					# y_pos>500?
		beq $t4, $zero, Y_SPEED_MEDIUM
		j END_SPEED_LOGIC

Y_SPEED_MEDIUM:
		li $k0, MEDIUM  					# y_speed($k0) = medium
		addi $t3, $zero, 0x2BC 				# $t3 = 700
		slt $t4, $t0, $t3					# y_pos>700?
		beq $t4, $zero, Y_SPEED_FAST
		j END_SPEED_LOGIC

Y_SPEED_FAST:
		li $k0, FAST  						# y_speed($k0) = fast
		j END_SPEED_LOGIC


END_SPEED_LOGIC:
		#sll $s3, 4 							# shift for speed x bits
		#sll $k0, 6 							# shift for speed y bits
		sll $s3, 6 							# shift for speed x bits
		sll $k0, 4 							# shift for speed y bits
		or $t5, $t5, $s3					# add x speed bits
		or $t5, $t5, $k0					# add y speed bits
		li $t4, PORT_BOTCTRL
		sw $t5, 0($t4)

        j MAINLOOP #return to main loop

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
	sub $t3, $a3, $t2 						# $t3 = xyz_value($a3)-200($t2)
	slt $t5, $t4, $t3 						# if reg_value<(xyz_value-200) then ($t5)=1
	beq $t5, 1, SET_XYZ

GT_TEMP_PLUS_TOLERANCE:
	add $t3, $a3, $t2 						# $t3 = xyz_value($a3)+200($t2)
	slt $t5, $t4, $t3 						# if reg_value>(xyz_value + 200) then ($t5)=0
	beq $t5, 0, SET_XYZ
	jr $ra

SET_XYZ:
	add $a3, $t4, $zero 						# xyz_acc_data = temp xyz_acc_data
	jr $ra

#------------------------------------------------------------------------------
# LED_FUNCITON() - Light LED corresponding to X(LED0), Y(LED1) or Z(LED2) value
#
# Registers used:
#------------------------------------------------------------------------------
LED_FUNCITON:
	li $t2, LEDS_ADDR					# 10 = LEDS_ADDR
	andi $t6, $t0, BIT_12_MASK			# $t6 = and(x_acc_data, bit_12_mask)
	bne $t6, 0, NEGATIVE				# if $t6<0 then NEGATIVE; else POSITIVE
	j POSITIVE

NEGATIVE:
	or $s7, $s7, $t4
	j checkposEnd

POSITIVE:
	and $s7, $s7, $a3
	j checkposEnd

checkposEnd:
	sh $s7, 0($t2)
	jr $ra
	nop # branch delay slot

#------------------------------------------------------------------------------
# BCD_FUNCTION() - Converts hexadecimal to BCD
#
# Reigsters used:
#------------------------------------------------------------------------------
BCD_FUNCTION:
	add $v0, $zero, $a3 						# temp_x_acc_data($v0) = x_acc_data
	andi $t6, $v0, BIT_12_MASK			# $t6 = and(temp_x_acc_data, bit_12_mask)
	bne $t6, 0, TWOS_COMPLEMENT			# if $t6<0 then negative, so invert bits
	j SKIP_TWOS_COMPLEMENT

TWOS_COMPLEMENT:
	not $v0, $v0
	addi $v0, $v0, 1
	andi $v0, $v0, 0x00000fff
SKIP_TWOS_COMPLEMENT:
	li $a1, 0							# $a1 = 1000s counter
	li $a0, 0 							# $a0 = 100s counter
	li $t8, 0 							# $t8 = 10s counter
	li $t9, 0
COUNT_1000S:
	sub $v1, $v0, 0x3E8
	blt $v1, $zero, COUNT_100S  			# if $v1 < $zero then COUNT_10S
	addi $a1, $a1, 1
	add $v0, $zero, $v1
	j COUNT_1000S

COUNT_100S:
	sub $v1, $v0, 0x64					# subtract 100 from compass and place in $v1
	blt $v1, $zero, COUNT_10S  				# if $v1 < $zero then COUNT_10S
	addi $a0, $a0, 1
	add $v0, $zero, $v1
	j COUNT_100S

COUNT_10S:
	sub $v1, $v0, 0xA						# subtract 10 from compass and place in $v1
	blt $v1, $zero, COUNT_1S  				# if $v1 < $zero then COUNT_1S
	addi $t8, $t8, 1
	add $v0, $zero, $v1
	j COUNT_10S

COUNT_1S:
	sub $v1, $v0, 0x1						# subtract 1 from compass and place in $v1
	blt $v1, $zero, END_BCD  				# if $v1 < $zero then END_BCD
	addi $t9, $t9, 1
	add $v0, $zero, $v1
	j COUNT_1S

END_BCD:
	sll $a1, $a1, 24
	sll $a0, $a0, 16
	sll $t8 , $t8, 8
	or $a1, $a0, $a1						# or 1000s and 100s and put in 1000s
	or $a1, $t8, $a1						# or 1000s and 10s and put in 1000s
	or $a1, $t9, $a1						# or 1000s and 1s and put in 1000s
	sw $a1, 0($t4)						# right 1000s and down to sseg
	jr $ra
	nop # branch delay slot


#------------------------------------------------------------------------------
# TWOS_COMPLEMENT_FUNCTION - returns twos-complement of input
#
# Reigsters used: $v0
#------------------------------------------------------------------------------
TWOS_COMPLEMENT_FUNCTION:
	not $v0, $v0
	addi $v0, $v0, 1
	andi $v0, $v0, 0x00000fff
	jr $ra


