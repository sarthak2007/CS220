		.text
		.globl main
main: 	li $v0, 5
		syscall
		addi $a0, $v0, 0 
		li $v0, 1
		syscall

		jr $ra
