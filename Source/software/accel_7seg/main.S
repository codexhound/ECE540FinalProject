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

PORT_SEVENSEG_EN 	= 0xbf700000		# (o) 7 Segment enable
PORT_SEVENSEG_HGH	= 0xbf700004		# (o) 7 Segment Higher Display
PORT_SEVENSEG_LOW	= 0xbf700008		# (o) 7 Segment Lower Display
PORT_SEVENSEG_DP	= 0xbf70000C		# (o) 7 segment Decimal Point Display
BUTTONS_ADDR 		= 0xbf800008        # (o) Input Buttons Address
LEDS_ADDR			= 0xbf800000        # (o) LEDS Address
X_ACC_ADDR			= 0xbf80001C		# (i)
Y_ACC_ADDR			= 0xbf800020		# (i)
Z_ACC_ADDR			= 0xbf800024        # (i)
 
 
.globl main
main:
	li   $20, X_ACC_ADDR				# $20 = address of x_acc_data
	li   $21, Y_ACC_ADDR				# $21 = address of y_acc_data
	li   $22, Z_ACC_ADDR				# $22 = address of z_acc_data
   	addiu $13, $12, 4    				# $13 = address of switches
   	li    $14, PORT_SEVENSEG_EN			# $14 = address of the 7 segment enable
   	li 	 $15, PORT_SEVENSEG_HGH			# $15 = address of the higher 7 segment digits
   	li 	 $16, PORT_SEVENSEG_LOW			# $16 = address of the lower 7 segment digits
   	li 	 $17, PORT_SEVENSEG_DP			# $17 = address of the dp points in 7 segment digits
   	li 	  $11, 0x0					# set display enable all displays
	sw	  $11, 0($14)				# set display enables
	li 	  $11, 0xB7					# turn on decimal points needed (10110111) (-01-01-1)
	sw	  $11, 0($17)
   
readIO:
	lw    $3, 0($20)                # load x_acc_data	

	jal getDigits                   # get the digits for x data

	beq $4, 1, negativeDigit3
	j afterneg3		

negativeDigit3:
	li $7, 22						#load negative segment
	sll $7, 24
	add $12, $7, $0			        #add to upper digit for later write out
	j afterneg3

afterneg3:
	sll $5, 16
	add $12, $5, $12

	sll $6, 8
	add $12, $6, $12

	lw $3, 0($21)					#load y_acc data

	jal getDigits

	beq $4, 1, negativeDigit2
	j afterneg2

negativeDigit2:
	li $7, 22						#load negative segment
	add $12, $7, $12			    #add to upper digit for later write out
	j afterneg2

afterneg2:
	sw $12, 0($15)					#write out to upper digits

	sll $5, 24
	add $11, $5, $0

	sll $6, 16
	add $11, $6, $11

	lw $3, 0($22)					#load z_acc data

	jal getDigits

	beq $4, 1, negativeDigit1
	j afterneg1

negativeDigit1:
	li $7, 22						#load negative segment
	sll $7, 8
	add $11, $7, $11			    #add to upper digit for later write out
	j afterneg1

afterneg1:
	add $11, $5, $11

	sw $11, 0($16)					#write out to lower digits

	beq   $0, $0, readIO 	# repeat
	nop                  	# branch delay slot



getDigits: #paramter is $3, outputs (negative, digit, decimal are in $4,$5,$6), temps $7-$10
	slti $7, $3, 0					#check whether value is negative
	beq $7, 1, isNegative           #if negative
	li $4, 0						#else set postive
	j getDigitsAfterCheck

isNegative:
	li $4, 1						#set negative
	li $7, -1
	mult $3, $7						#absolute value of input
	mflo $3							#set input to least significant of multiplication
	j getDigitsAfterCheck

getDigitsAfterCheck:
	li    $7, 1000						
	div   $3, $7					# divide by 1000

	mflo  $7                        #load the result
	mfhi  $8						#load the mod from last div

	add $5, $7, $0					#load the digit into results

	li $7, 100
	div $8, $7						# divide mod by 100 to get 1000's place decimal
	mflo $7							# load division result

	add $6, $7, $0

	j $ra
