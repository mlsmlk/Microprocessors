#include "main.h"
void cMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);
extern void asmMax(float *array, uint32_t size, float *max, uint32_t *maxIndex);

void cStdDev(float *array, uint32_t size, float *c_std_dev);
extern void asmStdDev(float *array, uint32_t size, float *asm_std_dev);

void cMul(float *array1, float *array2, uint32_t size,float *c_mul);
extern void asmMul(float *array1, float *array2,uint32_t size,  float *asm_mul );
