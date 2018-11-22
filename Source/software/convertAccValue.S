$3 #contains x_value
MASK_negBit = 0x800
MASK_frontBits = 0xFFF

get2sCompliment: #args are (input: $3:input value, output: $3:output value,$6:true/false negative)

	li $4, MASK_negBit
	and $4, $4, $3
	bne $4, 0, NEGATIVE
	j POSITIVE
	
	NEGATIVE:
		li $6, 1
		li $4, MASK_frontBits
		and $3, $3, $4  #mask out all other bits besides 12 most sig
		xor $3, $3, $4  #inverse 12 most sig bits
		addi $3, $3, 1  #add 1 to inverse for two's compliment
		j doneNegCheck
	
	POSITIVE:
		li $6, 0
		j doneNegCheck
	
	doneNegCheck:
		j $ra #return to caller
	#get 2's compliment
	
