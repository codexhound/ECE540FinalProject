# $3 #contains x_value
MASK_negBit = 0x800
MASK_frontBits = 0x7FF

get2sCompliment: #args are (input: $3:input value, output: $3:output value,$6:true/false negative)

	li $4, MASK_negBit
	and $4, $4, $3
	bne $4, 0, NEGATIVE
	j POSITIVE
	
NEGATIVE:
	li $6, 1
	j doneNegCheck

POSITIVE:
	li $6, 0
	j doneNegCheck

doneNegCheck:
	
	#get 2's compliment
	li $4, MASK_frontBits
	and $3, $3, $4  #mask out all other bits besides 11 most sig
	xor $3, $3, $4  #inverse all the bits after the negative bit
	addi $3, $3, 1  #add 1 to inverse for two's compliment

	j $ra	#return to caller
