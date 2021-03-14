.syntax unified
.global asmMul
.section .text.rodata

asmMul:
	VSUB.F32 S2, S2, S2 	//Clear Register
	MOV R4, #0				//R4 Counter = 0

loop:
	ADD R4, R4, #1			// R4 +=1
	VLDR.F32 S0, [R0]		// S0 = array1[i]
	VLDR.F32 S1, [R1]		// S1 = array2[i]
	ADD R0, R0, #4			// i+=1 for array1
	ADD R1, R1, #4			// i+=1 for array2
	VMUL.F32 S1, S0, S1 	// S1 = array1[i] x array2[i]
	VSTR.F32 S1, [R3]		// Store result for ith element
	ADD R3,R3,#4			// i+=1 for result
	CMP R4, R2				// loop finishes when R4 > R2 (R2=size)
	BLT loop

	BX LR					//return
