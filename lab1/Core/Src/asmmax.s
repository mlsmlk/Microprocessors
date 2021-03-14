/*
 * asmmax.s
 */

// unified indicates that we're using a mix of different ARM instructions,
// e.g., 16-bit Thumb and 32-bit ARM instructions may be present (and are)
.syntax unified

// .global exports the label asmMax, which is expected by lab1math.h
.global asmMax

// .section marks a new section in assembly. .text identifies it as source code;
// .rodata marks it as read-only, setting it to go in FLASH, not SRAM
.section .text.rodata

/**
 * void asmMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);
 *
 * R0 = pointer to array
 * R1 = size
 * R2 = pointer to max
 * R3 = pointer to maxIndex
 */

asmMax:
  PUSH 		{R4, R5}		// saving R4 and R5 according to calling convention
  VLDR.f32 	S0, [R0]		// max = array[0] (fp register S0 is used for max)
  MOV 		R4, #0			// maxIndex = 0 (register R4 is used for maxIndex)

loop:
  SUBS		R1, R1, #1		// size = size - 1
  BLT		done			// loop finishes when R1 < 0
  ADD		R5, R0, R1, LSL #2	// calculate base address (in R5) for array element
  VLDR.f32	S1, [R5]		// load element into fp register S1 (from R5)
  VCMP.f32	S0, S1			// compare new element with current max
  VMRS		APSR_nzvc, FPSCR	// load the FP PSR to branch using FP conditions
  BGT		continue		// if max > new element, on to the next element
  VMOV.f32	S0, S1			// otherwise, max = new element
  MOV		R4, R1			// update maxIndex

continue:
  B		loop			// next iteration

done:
  VSTR.f32	S0, [R2]		// store max value in the pointer to max variable given
  STR		R4, [R3]		// store max index in the pointer to maxIndex given
  POP		{R4, R5}		// restore context
  BX LR					// return

