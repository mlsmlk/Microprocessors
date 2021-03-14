################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Startup/subdir.mk
-include Src/subdir.mk
-include Drivers/STM32L4xx_HAL_Driver/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
lab6.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
lab6.list \

OBJCOPY_BIN += \
lab6.bin \


# All Target
all: lab6.elf secondary-outputs

# Tool invocations
lab6.elf: $(OBJS) $(USER_OBJS) C:\Users\malki\Desktop\Ceng\Fall_2020\ECSE444\Labs\lab6\STM32L475VGTX_FLASH.ld
	arm-none-eabi-gcc -o "lab6.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\malki\Desktop\Ceng\Fall_2020\ECSE444\Labs\lab6\STM32L475VGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="lab6.map" -Wl,--gc-sections -static -L"C:\Users\malki\Desktop\Ceng\Fall_2020\ECSE444\Labs\lab6\Lib" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

lab6.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "lab6.list"
	@echo 'Finished building: $@'
	@echo ' '

lab6.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "lab6.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
