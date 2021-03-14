#include <stdio.h>
#include <math.h>

void cStdDev(float *array, uint32_t size, float *c_std_dev){
	float sum = 0;
	for(int i=0 ; i<size ; i++) {
		sum += array[i];
	}

	float mean = sum/size;

	float variance = 0;
	for(int i=0 ; i<size; i++){
		variance+= (array[i]-mean)*(array[i]-mean)/(size-1);
	}

	(*c_std_dev) = sqrt(variance);
}
