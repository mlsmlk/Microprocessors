#include <stdio.h>
#include <stdlib.h>

void cMul(float *array1, float *array2, uint32_t size,float *c_mul){
	for(int i=0; i<size ; i++) {
		c_mul[i] = array1[i]*array2[i];
	}
}
