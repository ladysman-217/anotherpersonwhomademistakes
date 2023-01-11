/* Copyright 2013 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* Copyright 2016 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/*
 * config.h - Top-level configuration Chrome EC
 *
 * All configuration settings (CONFIG_*) are defined in this file or in a
 * sub-configuration file (config_chip.h, board.h, etc.) included by this file.
 *
 * Note that this file is included by assembly (.S) files.  Any C-isms such as
 * struct definitions or enums in a sub-configuration file MUST be guarded with
 * #ifndef __ASSEMBLER__ to prevent those C-isms from being evaluated by the
 * assembler.
 */
/*
 * All config options are listed alphabetically and described here.
 *
 * If you add a new config option somewhere in the code, you must add a
 * default value here and describe what it does.
 *
 * To get a list current list, run this command:
 *    git grep " CONFIG_" | grep -o "CONFIG_[A-Za-z0-9_]\+" | sort | uniq
 *
 * Some options are #defined here to enable them by default.  Chips or boards
 * may override this by #undef'ing them in config_chip.h or board.h,
 * respectively.
 *
 * TODO(crosbug.com/p/23758): Describe all of these.  Also describe the
 * HAS_TASK_* macro and how/when it should be used vs. a config define.  And
 * BOARD_*, CHIP_*, and CHIP_FAMILY_*.
 */
/* Add support for sensor FIFO */
/* Define the size of the global fifo, must be a power of 2. */
/* The amount of free entries that trigger an interrupt to the AP. */
/*
 * Sensors in this mask are in forced mode: they needed to be polled
 * at their data rate frequency.
 */
/* Enable accelerometer interrupts. */
/*
 * Support "spoof" mode for sensors.  This allows sensors to have their values
 * spoofed to any arbitrary value.  This is useful for testing.
 */
/* Specify type of accelerometers attached. */
/*
 * lis2dh/lis2de/lng2dm have the same register interface but different
 * supported resolution. In normal mode, lis2dh works in 10-bit resolution,
 * but lis2de/lng2dm only support 8bit resolution.
 *
 * Use the define for your correct chip and the CONFIG_ACCEL_LIS2D_COMMON will
 * automatically get defined.
 */
/*
 * lis2dw12 and lis2dwl have almost the same register interface.
 * lis2dw12 supports 4 low power modes but lis2dwl only supports one. lis2dwl
 * only supports 12 bit resolution under low power mode. But lis2dw12 can
 * support 12 bit or 14 bit resolution at different low power modes. In order
 * to get 14 bit resolution, lis2dwl does not use low power mode and lis2dw12
 * only uses 3 of 4 low power modes.
 *
 * Use the define for your correct chip and the CONFIG_ACCEL_LIS2DW_COMMON will
 * automatically get defined.
 */
/* lis2dw driver support fifo and interrupt, but letting lid accel sensor work
 * at polling mode is a common selection in current usage model. We need get a
 * option to be able to select interrupt or polling (foced mode).
 */
/* Use CONFIG_ACCELGYRO_LSM6DSM for LSM6DSL, LSM6DSM, and/or LSM6DS3 */
/*
 * Some chips have a portion of memory which will remain powered even
 * during a reset.  This is called Always-On, or AON memory, and
 * typically has a separate firmware to manage the memory.  These
 * values can be used to configure the RAM layout for Always-On.
 *
 * See chip/ish/ for an example implementation.
 */
/* Add sensorhub function for LSM6DSM, required if 2nd device attached. */
/* Specify type of Magnetometer attached. */
/* Presence of a Bosh Sensortec BMM150 magnetometer behind a BMIxxx. */
/* Presence of a Bosh Sensortec BMM150 magnetometer behind a LSM6DSM. */
/* Presence of a ST LIS2MDL magnetometer behind a BMIxxx. */
/* Presence of a ST LIS2MDL magnetometer behind a LSM6DSM. */
/* Specify barometer attached */
/* When set, it indicates a secondary sensor is attached behind a BMIxxx. */
/* When set, it indicates a secondary sensor is attached behind a LSM6DSM/L. */
/* Support for BMIxxx hardware orientation sensor */
/* Support for KIONIX KX022 hardware orientation sensor */
/* Define the i2c address of the sensor behind the main sensor, if present. */
/*
 * Define if either CONFIG_BMI_ORIENTATION_SUPPORT or
 * CONFIG_KX022_ORIENTATION_SUPPORT is set.
 */
/* Support the orientation gesture */
/* Support the body_detection */
/* Which sensor body_detection use */
/* Support custom setting of body_detection */
/* The max number of sampling data for 1 second */
/* The threshold of acceleration variance */
/* How much noise affect threshold of variance */
/* The confidence limit of on_body/off_body */
/* The threshold duration to change to off_body */
/*
 * Use the old standard reference frame for accelerometers. The old
 * reference frame is:
 * Z-axis: perpendicular to keyboard, pointing up, such that if the device
 *  is sitting flat on a table, the accel reads +G.
 * X-axis: in the plane of the keyboard, pointing from the front lip to the
 *  hinge, such that if the device is oriented with the front lip touching
 *  the table and the hinge directly above, the accel reads +G.
 * Y-axis: in the plane of the keyboard, pointing to the right, such that
 *  if the device is on it's left side, the accel reads +G.
 *
 * Also, in the old reference frame, the lid accel matches the base accel
 * readings when lid is closed.
 */
/* Set when INT2 is an output */
/* Specify type of Gyrometers attached. */
/*
 * If this is defined, motion_sense sends sensor events to the AP in the format
 * +-----------+
 * | Timestamp |
 * |  Payload  |
 * | Timestamp |
 * |  Payload  |
 * |    ...    |
 * +-----------+
 *
 * If this is not defined, the events will be sent in the format
 * +-----------+
 * |  Payload  |
 * |  Payload  |
 * |  Payload  |
 * |    ...    |
 * | Timestamp |
 * +-----------+
 *
 * The former format enables improved filtering of sensor event timestamps on
 * the AP, but comes with stricter jitter requirements.
 */
/* Sync event driver */
/*
 * How many sync events to buffer before motion_sense gets a chance to run.
 * This is similar to sensor side fifos.
 * Note: for vsync, anything above 2 is probably plenty.
 */
/* Simulate command for sync */
/*
 * Define the event to raise when the sync event happens.
 * Must be within TASK_EVENT_MOTION_INTERRUPT_MASK.
 */
/* Compile chip support for digital-to-analog converter */
/* Compile chip support for analog-to-digital convertor */
/*
 * ADC sample time selection. The value is chip-dependent.
 * TODO: Replace this with CONFIG_ADC_PROFILE entries.
 */
/* Support voltage comparator */
/* Include the ADC analog watchdog feature in the ADC code */
/*
 * Chip-dependent ADC configuration - select one.
 * SINGLE - Sample all inputs once when requested.
 * FAST_CONTINUOUS - Sample all inputs continuously using DMA, with minimal
 *                   sample time.
 */
/* Support AES symmetric-key algorithm */
/* Support AES-GCM */
/*
 * Some ALS modules may be connected to the EC. We need the command, and
 * specific drivers for each module.
 */
/*
 * If defined, BH1730 uses board specific lux calculation formula parameters.
 * If not defined, BH1730 uses default parameters to calculate lux.
 */
/* Define the exact model ID present on the board: SI1141 = 41, SI1142 = 42, */
/* Check if the device revision is supported */
/* Define to include the clear channel driver for the tcs3400 light sensor */
/*
 * Define to use atime tables in anti-saturation algos in the tcs3400 driver.
 * Defining this for a board makes the anti-saturation algorithm much more
 * efficient, but requires the board to have it's lens cover scale and k_channel
 * scales to be determined.  Define this for a board once it's added its
 * cover_scale and k_channel scale factors.
 */
/*
 * Define the event to raise when a sensor interrupt triggers.
 * Must be within TASK_EVENT_MOTION_INTERRUPT_MASK.
 */
/*
 * Enable Si114x to operate in polling mode. This config is used in conjunction
 * with CONFIG_ALS_SI114X_INT_EVENT. When polling is enabled, the read is
 * initiated in the same manner as when interrupts are used, but the event which
 * triggers the irq_handler is generated by deferred call using a fixed delay.
 */
/*
 * Enable tcs3400 to operate without interrupt pin. This config is used in
 * conjunction with CONFIG_ALS_TCS3400_INT_EVENT. When this option is enabled,
 * the read is initiated in the same manner as when interrupts are used, but the
 * event which triggers the irq_handler is generated by deferred call.
 */
/* Define which ALS sensor is used for dimming the lightbar when dark */
/* Link against third_party/cryptoc. */
/* Support AP hang detection host command and state machine */
/* Support AP Warm reset Interrupt. */
/*
 * Enable support for CPU caches behaving according to the ARMv7-M ISA.
 * (so far, only the Cortex-M7 has such caches)
 */
/*
 * Defined if core/ code provides assembly optimized implementation of
 * multiply-accumulate operations (32-bit operands, 64-bit result), for the
 * cores that lack native instructions.
 */
/* Support audio codec. */
/* Audio codec caps. */
/* Support audio codec on DMIC. */
/* Support audio codec software gain on DMIC. */
/* Support audio codec on I2S RX. */
/* Support audio codec on WoV. */
/* Audio codec buffers. */
/*
 * Support controlling the display backlight based on the state of the lid
 * switch.  The EC will disable the backlight when the lid is closed.
 *
 * The GPIO should be named GPIO_ENABLE_BACKLIGHT if active high, or
 * GPIO_ENABLE_BACKLIGHT_L if active low. See CONFIG_BACKLIGHT_LID_ACTIVE_LOW.
 */
/*
 * The backlight GPIO pin is active low and named GPIO_BACKLIGHT_ENABLED_L
 */
/*
 * If defined, EC will enable the backlight signal only if this GPIO is
 * asserted AND the lid is open.  This supports passing the backlight-enable
 * signal from the AP through EC.
 */
/* Support base32 text encoding */
/*****************************************************************************/
/* Battery config */
/*
 * Support battery management and interrogation.
 *
 * This is implied by CONFIG_BATTERY_<device> (below); if not enabled and
 * CONFIG_BATTERY_PRESENT_CUSTOM is also disabled, the board is assumed to not
 * have or support a battery.
 */
/*
 * Compile battery-specific code.
 *
 * Note that some boards have their own unique battery constants / functions.
 * In this case, those are provided in board/(boardname)/battery.c, and none of
 * these are defined.
 * Defining one of these will automatically define CONFIG_BATTERY near the end
 * of this file. If you add a new config here, you'll need to update that
 * check.
 */
/*
 * MAX17055 support alert on voltage, current, temperature, and state-of-charge.
 */
/*
 * Enable full model driver of MAX17055.
 *
 * It provides a better soc estimation. ocv_table needs to be supplied.
 */
/* Compile mock battery support; used by tests. */
/* Maximum time to wake a non-responsive battery, in second */
/*
 * If defined, the charger will check a board specific function for battery hw
 * presence as an additional condition to determine if power on is allowed for
 * factory override, where allowing booting of a bare board with no battery and
 * no power button press is required.
 */
/*
 * battery_is_present() support.
 *
 * Choice of battery driver normally determines the implementation of
 * battery_is_present(); it is also possible to provide a board-specific
 * implementation or note its presence from a GPIO level.
 *
 * If CONFIG_BATTERY is not enabled, a stub implementation that always returns
 * "not present" is provided unless CONFIG_BATTERY_PRESENT_CUSTOM is enabled.
 *
 * These options are mutually exclusive.
 */
/* The board provides a custom battery_is_present() implementation. */
/* Battery is present if the GPIO named by this define reads logic-low. */
/*
 * Compile smart battery support
 *
 * For batteries which support this specification:
 * http://sbs-forum.org/specs/sbdat110.pdf)
 */
/* Chemistry of the battery device */
/*
 * If defined, the board must supply fuel gauge and battery information for
 * each supported battery. This information is then used for battery cut off
 * and to check the charge/discharge FET status.
 */
/*
 * Critical battery shutdown timeout (seconds)
 *
 * If the battery is at extremely low charge (and discharging) or extremely
 * high temperature, the EC will notify the AP and start a timer with the
 * timeout defined here. If the critical condition is not corrected before
 * the timeout expires, the EC will shut down the AP (if the AP is not already
 * off) and then optionally hibernate or cut off battery.
 */
/* Perform a battery cut-off when we reach the battery critical level */
/* If the battery is too hot or too cold, stop charging */
/*
 * Support battery cut-off as host command and console command.
 *
 * Once defined, you have to implement a board_cut_off_battery() function
 * in board/???/battery.c file.
 */
/*
 * The default delay is 1 second. Define this if a board prefers
 * different delay.
 */
/*
 * The board-specific battery.c implements get and set functions to read and
 * write arbirary vendor-specific parameters stored in the battery.
 * See include/battery.h for prototypes.
 */
/*
 * TODO(crosbug.com/p/29467): allows charging of a dead battery that
 * requests nil for current and voltage. Remove this workaround when
 * possible.
 */
/*
 * Check for battery in disconnect state (similar to cut-off state). If this
 * battery is found to be in disconnect state, take it out of this state by
 * force-applying a charge current. This option requires
 * battery_get_disconnect_state() to be defined.
 */
/*
 * Specify the battery percentage at which the host is told it is full.
 * If this value is not specified the default is 97% set in battery.h.
 */
/*
 * Use an alternative method to store battery information: Instead of writing
 * directly to host memory mapped region, this keeps the battery information in
 * ec_response_battery_static/dynamic_info structures, that can then be fetched
 * using host commands, or via EC_ACPI_MEM_BATTERY_INDEX command, which tells
 * the EC to update the shared memory.
 *
 * This is required on dual-battery systems, and on on hostless bases with a
 * battery.
 */
/*
 * Some fuel gauges in battery take some time to return valid battery params
 * when wake form dead battery.
 * It need to do precharge to take valid battery params.
 */
/*
 * Number of batteries, only matters when CONFIG_BATTERY_V2 is used.
 */
/*
 * Smart battery driver should measure the voltage cell imbalance in the battery
 * pack.  This requires a battery driver capable of the measurement.
 */
/*
 * If remaining capacity is x% of full capacity, remaining capacity is set
 * equal to full capacity.
 *
 * Some batteries don't update full capacity timely or don't update it at all.
 * On such systems, compensation is required to guarantee remaining_capacity
 * will be equal to full_capacity eventually. This used to be done in ACPI.
 */
/*
 * Powerd's full_factor. The value comes from:
 *   src/platform2/power_manager/default_prefs/power_supply_full_factor
 */
/*
 * Smart battery pass-through host commands.
 */
/*
 * Expose some data when it is needed.
 * For example, battery disconnect state
 */
/* Include support for Bluetooth LE */
/* Include support for testing the radio for Bluetooth LE */
/* Include support for the HCI and link layers for Bluetooth LE */
/* Include debugging support for the Bluetooth link layer */
/* Include debugging support for Bluetooth HCI */
/* Boot header storage offset. */
/* Size of boot header in storage. */
/*****************************************************************************/
/* Bootblock config */
/* Pack AP-FW bootblock in EC image. */
/*****************************************************************************/
/* EC can choose power signal gpio by schematic version */
/* EC has GPIOs to allow board to reset RTC */
/*
 * Call board_config_post_gpio_init() after GPIOs are initialized.  See
 * include/board_config.h for more information.
 */
/*
 * Call board_config_pre_init() before any inits are called.  See
 * include/board_config.h for more information.
 */
/*
 * EC has the notion of board version either through resistors or EEPROM.
 * The common CONFIG_BOARD_VERSION is defined automatically when one of the
 * specific options is used.
 */
/* The board version comes from Cros Board Info within EEPROM. */
/* The board version function is defined in board code. */
/*
 * The board version is encoded with 3 GPIO signals where GPIO_BOARD_VERSION1
 * is the LSB.
 */
/* EC responses to a board defined I2C slave address */
/*
 * The board is unable to distinguish EC reset from power-on so it should treat
 * all resets as triggered by RESET_PIN even if it is a POWER_ON reset.
 */
/*
 * For some boards on power-on, the EC is reset by the H1 after power-on,
 * so the EC sees 2 resets. This config enables the EC to save a flag
 * on the first power-up restart, and then wait for the second reset before
 * any other setup is done (such as GPIOs, timers, UART etc.)
 * On the second reset, the saved flag is used to detect the previous
 * power-on, and treat the second reset as a power-on instead of a reset.
 *
 * NOTE: Implemented only for npcx
 */
/* Permanent LM4 boot configuration */
/*****************************************************************************/
/* Modify the default behavior to make system bringup easier. */
/*
 * Enable debug prints / asserts that may helpful for debugging board bring-up,
 * but probably shouldn't be enabled for production for performance reasons.
 */
/*****************************************************************************/
/*
 * Support for entering recovery mode using the volume buttons or a dedicated
 * recovery button.  Note that these are *buttons* and not keys in the keyboard
 * matrix.
 */
/*
 * Compile detachable base support
 *
 * Enabled on all boards that have a detachable base.
 */
/*
 * Indicates there is a dedicated recovery button.  Note, that if there are
 * volume buttons, a dedicated recovery button is not needed.  This is intended
 * because if a board has volume buttons, they can do everything a dedicated
 * recovery button can do.
 * For various reasons, on some platforms there may be multiple recovery inputs.
 * See b/149967026.
 */
/*
 * The board has volume up and volume down buttons.  Note, these are *buttons*
 * and not keys in the keyboard matrix.
 */
/*
 * The board has buttons that are connected to ADC pins which pressed and
 * released values are determined by the analog voltage
 */
/*
 * Allow runtime configuration of the buttons[] array
 */
/* Support simulation of a button press using EC tool command */
/*
 * Configuration for button simulation i.e. dependent on
 * CONFIG_HOSTCMD_BUTTON or CONFIG_CMD_BUTTON config.
 */
/*
 * Capsense chip has buttons, too.
 */
/*****************************************************************************/
/* Support CEC */
/*****************************************************************************/
/* Compile charge manager */
/*
 * Number of charge ports excluding type-c ports
 *
 * If defined, the board must define a macro DEDICATED_CHARGE_PORT indicates
 * the dedicated port number.
 *
 * See include/charge_manager.h for more details about dedicated port.
 */
/* Allow charge manager to default to charging from dual-role partners */
/* Handle the external power limit host command in charge manager */
/* Initially enter safe mode, with relaxed port / current selection rules */
/* Leave safe mode when battery pct meets or exceeds this value */
/* The hardware has some input current ramping/back-off mechanism */
/* Compile input current ramping support using software control */
/*****************************************************************************/
/* Charger config */
/* Compile common charge state code. */
/* Compile charger-specific code for these chargers (pick at most one) */
/* Allow run-time completion of the charger driver structure */
/*
 * Board has only one charger chip (default, undef when board contains multiple
 * charger chips
 */
/*
 * Enable the CHG_EN at initialization to turn-on the BGATE which allows voltage
 * to be applied to the battery PACK & wakes the battery if it is in shipmode.
 */
/*
 * BD9995X Power Save Mode
 *
 * Which power save mode should the charger enter when VBUS is removed.  Check
 * driver/bd9995x.h for the power save settings.  By default, no power save mode
 * is enabled.
 */
/*
 * If the battery temperature sense pin is connected to charger,
 * get the battery temperature from the charger.
 */
/*
 * Board specific charging current limit, in mA.  If defined, the charge state
 * machine will not allow the battery to request more current than this.
 */
/*
 * MT6370 backlight control settings.
 * If defined, Panel backlight power is controlled by MT6370.
 */
/*
 * MT6360/MT6370 BC1.2 USB-PHY control.
 * If defined, USB-PHY connection is controlled by GPIO_BC12_DET_EN.
 * Assert GPIO_BC12_DET_EN to detect BC1.2 device, and deassert
 * GPIO_BC12_DET_EN to mux USB-PHY back.
 */
/*
 * Enable/disable system power monitor PSYS function: this enables output
 * from charger chip to SoC.
 */
/*
 * Enable reading PSYS (system power) value, either via "psys" console command,
 * or via charger_get_system_power function.
 */
/*
 * Board supports discharge mode.  In this mode, the battery will discharge
 * even if AC is present.  Used for testing.
 */
/* Board has a custom discharge mode. */
/*
 * Board specific flag used to disable external ILIM pin used to determine input
 * current limit. When defined, the input current limit is decided only by
 * the software register value.
 */
/*
 * Default input current for the board, in mA.  Many boards also use this as the
 * least maximum input current during transients.
 *
 * This value should depend on external power adapter, designed charging
 * voltage, and the maximum power of the running system. For type-C chargers,
 * this should be set to 512 mA in order to not brown-out low-current USB
 * charge ports in accordance with USB-PD r3.0 Sec. 7.3
 */
/*
 * This config option is used to enable IDCHG trigger for prochot. This macro
 * should be set to the desired current limit to draw from the battery before
 * triggering prochot. Note that is has a 512 mA granularity. The function that
 * sets the limit will mask of the lower 10 bits. For this check to be active
 * the bq25710 must be in performance mode and this config option is also used
 * to keep the bq25710 in performance mode when the AP is in S0.
 */
/*
 * Board specific maximum input current limit, in mA.
 */
/*
 * Leave charger VBAT configured to battery-requested voltage under all
 * conditions, even when AC is not present. This may be necessary to work
 * around quirks of certain charger chips, such as the BD9995X.
 */
/*
 * Power thresholds for AP boot
 *
 * If one of the following conditions is met, EC boots AP:
 *
 * 1. Battery charge >= CONFIG_CHARGER_MIN_BAT_PCT_FOR_POWER_ON
 * 2. AC power >= CONFIG_CHARGER_MIN_POWER_MW_FOR_POWER_ON
 * 3. Battery charge >= CONFIG_CHARGER_MIN_BAT_PCT_FOR_POWER_ON_WITH_AC
 *    and
 *    AC power >= CONFIG_CHARGER_MIN_POWER_MW_FOR_POWER_ON_WITH_BATT
 *
 * Note that CONFIG_CHARGER_LIMIT_POWER_THRESH_BAT_PCT/_CHG_MW are thresholds
 * for the OS boot used by Depthcharge. The OS has higher power requirement
 * but PD power is also available.
 *
 * WARNING: Locked RO firmware does not negotiate power greater than 15W via
 * analog signaling.  If the AP requires greater than 15W to boot, then see
 * CONFIG_CHARGER_LIMIT_POWER_THRESH_CHG_MW.
 */
/* Default: 15000 */
/* Default: Disabled */
/* Minimum battery percentage for power on with an imbalanced pack */
/*
 * Maximum battery cell imbalance to accept before considering the pack to be
 * imbalanced, in millivolts.
 */
/* Set this option when using a Narrow VDC (NVDC) charger, such as ISL9237/8. */
/*
 * Low energy thresholds - when battery level is below BAT_PCT and an external
 * charger provides less than CHG_MW of power, inform the AP of the situation
 * through the LIMIT_POWER charge state parameter.  Depthcharge will hold off on
 * the boot for up to 3 seconds while waiting for either condition to clear
 * before starting the kernel.  This wait happens after sw sync in RW mode, so
 * the firmware may set it high enough that PD negotiation is required to clear
 * it.
 *
 * Default: Disabled.  Depthcharge is immediately released to boot the kernel.
 *
 * Setting this value to 15001 will require PD negotiation to be complete prior
 * to releasing depthcharge.  During PD negotiation, the charger will be briefly
 * reduced to about 2.5W for a few hundred ms.
 */
/* Default: CHARGER_MIN_BAT_PCT_FOR_POWER_ON */
/*
 * Enable charger's OTG functions, i.e. make it possible to supply output power
 * from battery.
 */
/*
 * Charger should call battery_override_params() to limit/correct the voltage
 * and current requested by the battery pack before acting on the request.
 */
/*
 * Common code for charger profile override. Should be used with
 * CONFIG_CHARGER_PROFILE_OVERRIDE.
 */
/*
 * Battery voltage threshold ranges for charge profile override.
 * Override it in board.h if battery has multiple threshold ranges.
 */
/* Value of the charge sense resistor, in mOhms */
/* Value of the input current sense resistor, in mOhms */
/*
 * Board has an GPIO pin to enable or disable charging.
 *
 * This GPIO should be named GPIO_CHARGER_EN, if active high. Or
 * GPIO_CHARGER_EN_L if active low.
 */
/* Charger enable GPIO is active low */
/*
 * OCPC - One Charger IC Per Type-C
 *
 * Define this if the board may have multiple charger ICs in the system.  The
 * assumption is that that primary charger is index 0 and is the charger IC
 * connected to the battery FET.  Additionally, `chgnum` is assumed to be the
 * same as the charge port index.
 */
/*
 * Boards using OCPC must define this value in order to seed the starting board
 * battery and system resistance between the secondary charger IC and the
 * battery.  This should be at a minimum the Rds(on) resistance of the BFET plus
 * the series sense resistor.
 */
/* Enable trickle charging */
/* Wireless chargers */
/* For customer initial use */
/*
 * Workaround npcx9 A1 chip's bug for download_from_flash API in th booter.
 * This can be removed when A2 chip is available.
 */
/*****************************************************************************/
/*
 * The chip needs to define special SRAM memory regions as linker sections.
 * Those regions are defined in the special-purpose preprocessed file in
 * chip/<chip_name>/memory_regions.inc using the following macro:
 * REGION(name, attributes, start_address, size)
 *
 * Note: these 'special' regions are NOT cleared at startup contrary to .bss.
 */
/*
 * Chip needs to do pre-init very early in main(), and provides chip_pre_init()
 * to do so.
 */
/*
 * Set the caching attributes of one of the RAM regions to uncached.
 *
 * When defined, CONFIG_CHIP_UNCACHED_REGION must be equal to the name of one
 * of the regions defined in memory_regions.inc for CONFIG_CHIP_MEMORY_REGIONS.
 */
/*
 * When defined, adds a new linker section to store objects that remain resident
 * in ROM/flash. This is useful on ECs that execute all code from RAM and
 * in which the RAM size is smaller than the flash size.
 *
 * Code can force objects into the .init_rom resident section using the
 * __init_rom macro. Objects should accessed using the include/init_rom.h
 * module.
 */
/*
 * This is a convenience macro that causes the .data section to link into
 * the ROM/flash resident section defined above.
 *
 * When enabled, the EC initialization code copies the .data section directly
 * from flash into data RAM.
 *
 * When this is not defined, the bootloader copies the .data section from flash
 * to code RAM. The EC initialization code copies .data from code RAM to data
 * RAM.
 *
 * This is automatically enabled when both CONFIG_CHIP_INIT_ROM_REGION and
 * CONFIG_MAPPED_STORAGE are enabled.
 */
/*****************************************************************************/
/* Chipset config */
/* AP chipset support; pick at most one */
/* Shared chipset support; automatically gets defined below. */
/* Support chipset throttling */
/* Enable additional chipset debugging */
/* Enable chipset reset hook, requires a deferrable function */
/*
 * Enable chipset resume init and suspend complete hooks. These hooks are
 * usually used to initialize/disable the SPI driver, which goes to sleep
 * on suspend. Require to initialize it first such that it can receive a
 * host resume event, that notifies the normal resume hook.
 */
/*
 * Enable turning on PP3300_A rail before PP5000_A rail on the Ice Lake
 * and Tiger Lake chipsets. Enable this option if there is leakage from PP5000_A
 * resources into PP3300_A resources.
 */
/*
 * Enable the EC to drive SLP_S3_L during the G3 to S3 transition. This is
 * needed on TigerLake designs to prevent a glitch on the SLP_S3_L and PCH_PWROK
 * signals during power on.
 */
/*
 * Enable if chipset requires delay between power signals going high
 * and deasserting RSMRST to PCH.
 */
/* Support PMIC reset(using LDO_EN) in chipset */
/* Board requires chipset pre-init callback */
/* Redefine when we need a different power-on sequence on the same chipset. */
/*****************************************************************************/
/*
 * Chip config for clock circuitry
 *	define = crystal / undef = oscillator
 */
/*
 * Indicate if a clock source is connected to stm32f4's high speed external
 * clock signal (HSE) specific input
 */
/*
 * Indicate if a clock source is connected to low speed external (LSE) specific
 * input
 */
/*
 * Chip config for clock source
 *	 define = external crystal oscillator / undef = internal clock source
 */
/*****************************************************************************/
/* Support curve25519 public key cryptography */
/*****************************************************************************/
/* PMIC config */
/* Support firmware long press power-off timer */
/* Support PMIC power control */
/*****************************************************************************/
/*
 * Example functionality that is used to test boards.
 */
/*
 * Enable the blink example.
 *
 * LEDs are used to count in binary.
 *
 * Required Configuration:
 * - CONFIG_BLINK_LEDS        --> List of LEDs (gpio enum names) to use as bits
 */
/*****************************************************************************/
/*
 * Optional console commands
 *
 * Defining these options will enable the corresponding command on the EC
 * console.
 */
/*****************************************************************************/
/* Provide common core code to output panic information without interrupts. */
/*
 * Store a panic log and halt the system for a software-related reasons, such as
 * stack overflow or assertion failure.
 */
/*
 * Certain platforms(e.g. eve, poppy) cannot retain panic info in data ram since
 * VCC is powered down on EC reset. On such platforms, panic data needs to be
 * saved/restored to persistent storage by using chip specific
 * implementations. This option can be enabled by those platforms that have and
 * wish to use chip-implemented panic backup/restore functions.
 */
/*
 * Provide the default GPIO abstraction layer.
 * You want this unless you are doing a really tiny firmware.
 */
/*
 * Provides smaller GPIO names to reduce flash size.  Instead of the 'name'
 * field in GPIO macro it will concat 'port' and 'pin' to reduce flash size.
 */
/*
 * Control the IO pins of IO expander via IO Expander APIs
 *
 * If defined, declare the IOEX pin with macro IOEX. For example:
 *     IOEX(IO_NAME, EXPIN(0, 0, 0), GPIO_OUT_HIGH)
 * For more details, see gpio_list.h.
 *
 * WARNING: make sure none of IOEX IOs are accessed at interrupt level / with
 * interrupts disabled. Doing so may hang the EC because IO expanders may rely
 * on I2C interrupts.
 *
 * Some reasons that not unify the GPIO and IOEX APIs have been disscussed and
 * filed in the crbug.com/985540.
 */
/*
 * EC's supporting powering down GPIO pins.
 * Add flag GPIO_POWER_DOWN and additional API's.
 */
/*
 * Provide common runtime layer code (tasks, hooks ...)
 * You want this unless you are doing a really tiny firmware.
 */
/* Provide common core code to handle the operating system timers. */
/*****************************************************************************/
/*
 * Make it possible for console to be output to different channels that can be
 * turned on and off.
 *
 * This is useful as a developer convenience when the console is crowded with
 * messages, to make it easier to use the interactive console.
 * FAFT and servod also use this feature.
 *
 * Boards may #undef this to reduce image size.
 */
/*
 * Provide additional help on console commands, such as the supported
 * options/usage.
 *
 * Boards may #undef this to reduce image size.
 */
/*
 * Add a .flags field to the console commands data structure, to distinguish
 * some commands from others. The available flags bits are defined in
 * include/console.h
 */
/*
 * One use of the .flags field is to make some console commands restricted, so
 * that they can be disabled or enabled at run time.
 */
/* The default .flags field value is zero, unless overridden with this. */
/*
 * Enable EC_CMD_CONSOLE_READ V1. One could disable this config to prevent
 * kernel from creating the `console_log` debugfs entry.
 */
/*
 * Number of entries in console history buffer.
 *
 * Boards may #undef this to reduce memory usage.
 */
/* Max length of a single line of input */
/* Enable verbose output to UART console and extra timestamp print precision. */
/*****************************************************************************/
/* Support for EC-EC communication */
/*
 * Board is master or slave in EC-EC communication.
 */
/*
 * Board support battery-related functions in EC-EC communication.
 */
/*
 * Enable the experimental console.
 *
 * NOTE: If you enable this experimental console, you will need to run the
 * EC-3PO interactive console in the util directory!  Otherwise, you won't be
 * able to enter any commands.
 */
/* Include CRC-8 utility function */
/*****************************************************************************/
/*
 * Debugging config
 *
 * Note that these options are enabled by default, because they're really
 * handy for debugging systems during bringup and even at factory time.
 *
 * A board may undefine any or all of these to reduce image size and RAM usage,
 * at the cost of debuggability.
 */
/*
 * ASSERT() macros are checked at runtime.  See CONFIG_DEBUG_ASSERT_REBOOTS
 * to see what happens if one fails.
 *
 * Boards may #undef this to reduce image size.
 */
/*
 * Prints a message and reboots if an ASSERT() macro fails at runtime.  When
 * enabled, an ASSERT() which fails will produce a message of the form:
 *
 * ASSERTION FAILURE '<expr>' in function() at file:line
 *
 * If this is not defined, failing ASSERT() will trigger a BKPT instruction
 * instead.
 *
 * Ignored if CONFIG_DEBUG_ASSERT is not defined.
 *
 * Boards may #undef this to reduce image size.
 */
/*
 * On assertion failure, prints only the file name and the line number.
 *
 * Ignored if CONFIG_DEBUG_ASSERT_REBOOTS is not defined.
 *
 * Boards may define this to reduce image size.
 */
/*
 * Disable the write buffer used for default memory map accesses.
 * This turns "Imprecise data bus errors" into "Precise" errors
 * in exception traces at the cost of some performance.
 * This may help identify the offending instruction causing an
 * exception. Supported on cortex-m.
 */
/*
 * Print additional information when exceptions are triggered, such as the
 * fault address, here shown as bfar. This shows the reason for the fault
 * and may help to determine the cause.
 *
 *	=== EXCEPTION: 03 ====== xPSR: 01000000 ===========
 *	r0 :0000000b r1 :00000047 r2 :60000000 r3 :200013dd
 *	r4 :00000000 r5 :080053f4 r6 :200013d0 r7 :00000002
 *	r8 :00000000 r9 :200013de r10:00000000 r11:00000000
 *	r12:00000000 sp :200009a0 lr :08002b85 pc :08003a8a
 *	Precise data bus error, Forced hard fault, Vector catch, bfar = 60000000
 *	cfsr = 00008200, shcsr = 00000000, hfsr = 40000000, dfsr = 00000008
 *
 * If this is not defined, only a register dump will be printed.
 *
 * Boards may #undef this to reduce image size.
 */
/*
 * Print orientation when device orientation changes
 * (requires CONFIG_SENSOR_ORIENTATION)
 */
/* Support Synchronous UART debug printf. */
/* Check for stack overflows on every context switch */
/*****************************************************************************/
/* Support events from devices attached to the EC */
/* Monitor the states of other devices */
/* Support DMA transfers inside the EC */
/* Use the common interrupt handlers for DMA IRQs */
/* Compile extra debugging and tests for the DMA module */
/*
 * If the board supports DRAM, base DRAM address for the chip, where we want
 * to load extra code/data (address from chip address space).
 */
/*
 * If the board supports DRAM, base DRAM address to load the extra code/data
 * (if loaded by AP, this is the AP physical address space).
 */
/* DRAM size. */
/* Usually, EC capable of sensor speeds up to 250 Hz */
/* Maximal EC sampling rate */
/* Support EC chip internal data EEPROM */
/*
 * Support for sending emulated sysrq events to AP (on designs with a keyboard,
 * sysrq is passed as normal key presses).
 */
/* Include code for handling external power */
/* Support detecting external power presence via a GPIO */
/* Default debounce time for external power signal */
/*****************************************************************************/
/* Number of cooling fans. Undef if none. */
/* Percentage to which all fans are set at initiation */
/* Allow board custom fan control */
/* Support fan control while in low-power idle */
/*
 * Fans have non-const configuration.
 */
/*
 * Replace the default fan_percent_to_rpm() function with a board-specific
 * implementation in board.c
 */
/*
 * We normally check and update the fans once per second (HOOK_SECOND). If this
 * is #defined to a postive integer N, we will only update the fans every N
 * seconds instead.
 */
/*****************************************************************************/
/* Flash configuration */
/* This enables console commands and higher-level features */
/* This enables chip-specific access functions */
/* Provide event log stored in flash memory. */
/* Allow deferred (async) flash erase */
/* Flash must be selected for write/erase operations to succeed. */
/* Base address of program memory */
/*
 * EC code can reside on internal or external storage. Only one of these
 * CONFIGs should be defined. CONFIG_INTERNAL_STORAGE implies XIP
 * (eXecute-In-Place) semantics. i.e. code is being fetched directly from
 * storage media.
 */
/*
 * Flash is directly mapped into the EC's address space.  If this is not
 * defined, the flash driver must implement flash_physical_read().
 */
/*
 * Base address of memory-mapped flash storage, for platforms which define
 * CONFIG_MAPPED_STORAGE.
 */
/*
 * Some platforms need to write protect RW independently of all flash.
 */
/*
 * Store persistent write protect for the flash inside the flash data itself.
 * This allows ECs with internal flash to emulate something closer to a SPI
 * flash write protect register.  If this is not defined, write protect state
 * is maintained solely by the physical flash driver.
 */
/*
 * Store the pstate data in its own dedicated bank of flash.  This allows
 * disabling the protect-RO-at-boot flag without rewriting the RO firmware,
 * but costs a bank of flash.
 *
 * If this is not defined, the pstate data is stored inside the RO firmware
 * image itself.  This is more space-efficient, but the only way to clear the
 * flag once it's set is to rewrite the RO firmware (after removing the WP
 * screw, of course).
 */
/*
 * Lock the PSTATE by default (currently only supported when
 * CONFIG_FLASH_PSTATE_BANK is not defined).
 */
/*
 * Enable readout protection.
 */
/*
 * Use Read-out protection status as PSTATE, i.e. after RDP is enabled, we never
 * allow RO protection to be disabled.
 *
 * This is used when we want to prevent read-back of some critical region (e.g.
 * rollback), even in DFU/BOOT0 mode.
 *
 * Note that this significantly changes the behaviour or flash protection,
 * as this tie EC_FLASH_PROTECT_RO_AT_BOOT with RDP status: it makes no
 * sense to be able to unlock RO protection if RDP is enabled, as a custom RO
 * could allow protected regions readback.
 *
 * TODO(crbug.com/888109): Implementation is currently only available on
 * STM32H7 and STM32F4, and requires more documentation.
 */
/*
 * For flash that is segemented in different regions.
 */
/* Number of regions of different size/type */
/* Total size of writable flash */
/* Minimum flash write size (in bytes) */
/* Most efficient flash write size (in bytes) */
/* Protected region of storage belonging to EC */
/* Writable region of storage belonging to EC */
/*****************************************************************************/
/* Fingerprint Sensor Configuration */
/*****************************************************************************/
/* Include a flashmap in the compiled firmware image */
/* Allow EC serial console input to wake up the EC from STOP mode */
/* Enable support for floating point unit */
/*****************************************************************************/
/* Firmware region configuration */
/*
 * Read-only / read-write image configuration.
 * Images may reside on storage (ex. external or internal SPI) at a different
 * offset than when copied to program memory. Hence, two sets of offsets,
 * for STORAGE and for MEMORY.
 */
/* Offset relative to CONFIG_EC_PROTECTED_STORAGE_OFF */
/* Some targets include two RW sections in the image. */
/* This is the offset of the second RW section into the flash. */
/* Offset relative to CONFIG_EC_WRITABLE_STORAGE_OFF */
/*
 * Offset relative to CONFIG_EC_PROTECTED_STORAGE_OFF
 * These define a region of flash used to store ROM resident data objects
 * for RO images.  This is only possible when the program memory is smaller
 * than CONFIG_EC_PROTECTED_STORAGE_SIZE.
 */
/*
 * Offset relative to CONFIG_EC_WRITABLE_STORAGE_OFF
 * These define a region of flash used to store ROM resident data objects
 * for RW images.  This is only possible when the program memory is smaller
 * than CONFIG_EC_WRITABLE_STORAGE_SIZE.
 */
/*
 * NPCX-specific bootheader geometry.
 * TODO(crosbug.com/p/23796): Factor these CONFIGs out.
 */
/*
 * Write protect region offset / size. This region normally encompasses the
 * RO image, but may also contain additional images or data.
 */
/*
 * Rollback protect region. If CONFIG_ROLLBACK is defined to enable the rollback
 * protect region, CONFIG_ROLLBACK_OFF and CONFIG_ROLLBACK_SIZE must be defined
 * too.
 */
/* If defined, add support for storing some entropy in the rollback region. */
/* If defined, protect rollback region readback using MPU. */
/*
 * If defined, inject some locally generated entropy when secret is updated,
 * using board_get_entropy function.
 * Large values may take a long time to generate.
 *
 * This is only meant to add a little bit of extra entropy, when the hardware
 * lacks a random number generator (otherwise, the strong entropy can be
 * directly added to the secret, using rollback_add_entropy).
 */
/* If defined, we can update rollback information (RW can unset this). */
/*
 * Current rollback version. Meaningless for RO (but provides the minimum value
 * that will be written to the rollback protection at flash time).
 *
 * For RW, rollback version included in version structure, used by RO to
 * determine if the RW image is recent enough and can be jumped to.
 *
 * Valid values are >= 0, <= INT32_MAX (positive, 32-bit signed integer).
 */
/*
 * Board Image ec.bin contains a RO firmware.  If not defined, the image will
 * only contain the RW firmware.
 */
/* If defined, another image (RW) exists with more features */
/*
 * If defined, we can use system_get_fw_reset_vector function to decide
 * reset vector of RO/RW firmware for sysjump.
 */
/*****************************************************************************/
/* Motion sensor based gesture recognition information */
/* These all require HAS_TASK_MOTIONSENSE to work */
/* Do we want to detect gestures? */
/* Mask of all sensors used for gesture dectections */
/* some gesture recognition done in software */
/* enable gesture host interface */
/* Sensor sampling interval for gesture recognition */
/* Which sensor to look for double tap recognition */
/* Use for waking up host */
/*
 * Double tap detection parameters
 * Double tap works by looking for two isolated Z-axis accelerometer impulses
 * preceded and followed by relatively calm periods of accelerometer motion.
 *
 * Define an outer and inner window. The inner window specifies how
 * long the tap impulse is expected to last. The outer window specifies the
 * period before the initial tap impluse and after the final tap impulse for
 * which to check for relatively calm periods. In between the two impulses
 * there is a minimum and maximum interstice time allowed.
 *
 * Define an acceleration threshold to dectect a tap, in mg.
 */
/* Which sensor to look for significant motion activity */
/*
 * Significant motion parameters
 * Sigmo state machine looks for movement, waits skip milli-seconds,
 * and check for movement again with proof milli-seconds.
 */
/* Support getting gpio flags. */
/* Do we want to detect the lid angle? */
/* Which sensor is located on the base? */
/* Which sensor is located on the lid? */
/*
 * Allows using the lid angle measurement to determine if peripheral devices
 * should be enabled or disabled, like key scanning, trackpad interrupt.
 */
/*
 * Defer the (re)configuration of motion sensors after the suspend event or
 * resume event.  Sensor power rails may be powered up or down asynchronously
 * from the EC, so it may be necessary to wait some time period before
 * reconfiguring after a transition.
 */
/* Define motion sensor count in board layer */
/* Define when LPC memory space needs to be populated. */
/******************************************************************************/
/* Host to RAM (H2RAM) Memory Mapping */
/* H2RAM Base memory address */
/* H2RAM Size */
/* H2RAM Host LPC I/O base memory address */
/* ISH boot start address */
/*
 * Define the minimal amount of time (in ms) betwen running motion sense task
 * loop.
 */
/*****************************************************************************/
/*
 * Support the host asking the EC about the status of the most recent host
 * command.
 *
 * When the AP is attached to the EC via a serialized bus such as I2C or SPI,
 * it needs a way to minimize the length of time an EC command will tie up the
 * bus (and the kernel driver on the AP).  If this config is defined, the EC
 * may return an in-progress result code for slow commands such as flash
 * erase/write instead of stalling until the command finishes processing, and
 * the AP may then inquire the status of the current command and/or the result
 * of the previous command.
 */
/* clear bit(s) to mask reporting of an EC_HOST_EVENT_XXX event(s) */
/* Config option to support 64-bit hostevents and wake-masks. */
/*
 * The host commands are sorted in the .rodata.hcmds section so use the binary
 * search algorithm to match a command to its handler
 */
/*
 * Host command parameters and response are 32-bit aligned.  This generates
 * much more efficient code on ARM.
 */
/*
 * Include host commands to fetch battery information from
 * ec_response_battery_static/dynamic_info structures, only makes sense when
 * CONFIG_BATTERY_V2 is enabled.
 */
/* Default hcdebug mode, e.g. HCDEBUG_OFF or HCDEBUG_NORMAL */
/* If we have host command task, assume we also are using host events. */
/*
 * Board supports host command to get EC SPI flash info.  This is typically
 * only needed if the factory needs to determine which of several possible SPI
 * flash chips is attached to the EC on a given board.
 */
/*
 * For ECs where the host command interface is I2C, slave
 * address which the EC will respond to.
 */
/*
 * Accept EC host commands over the SPI slave (SPS) interface.
 */
/*
 * Host command rate limiting assures EC will have time to process lower
 * priority tasks even if the AP is hammering the EC with host commands.
 * If there is less than CONFIG_HOSTCMD_RATE_LIMITING_MIN_REST between
 * host commands for CONFIG_HOSTCMD_RATE_LIMITING_PERIOD, then a
 * recess period of CONFIG_HOSTCMD_RATE_LIMITING_RECESS will be
 * enforced.
 */
/* PD MCU supports host commands */
/* EC supports EC_CMD_PD_CHIP_INFO */
/*
 * Use if PD MCU controls charging (selecting charging port and input
 * current limit).
 */
/* Panic when status of PD MCU reflects that it has crashed */
/* Board supports RTC host commands */
/* For access to VBNV on-EC battery-backed storage */
/* EC controls the board's SKU ID and can report that to the AP */
/* Set SKU ID from AP */
/* Command to issue AP reset */
/*
 * Support voltage regulator host command
 * If defined, the board should also implement board functions defined in
 * include/regulator.h
 */
/* Flash commands over PD */
/* Host command to control USB-PD chip */
/* Set entry in PD MCU's device rw_hash table */
/* Enable EC_CMD_LOCATE_CHIP */
/* Command to get the EC uptime (and optionally AP reset stats) */
/* List of host commands whose debug output will be suppressed */
/*****************************************************************************/
/* Enable debugging and profiling statistics for hook functions */
/*****************************************************************************/
/* CRC configuration */
/* Enable the hardware accelerator for CRC computation */
/* Enable the software routine for CRC computation */
/*****************************************************************************/
/* Enable system hibernate */
/* Default delay after shutting down before hibernating */
/* For ECs with multiple wakeup pins, define enabled wakeup pins */
/*
 * If defined, chip hibernation is used. Your board needs to define wake-up
 * signals. Undefine this to use board hibernation capability.
 */
/*
 * Use PSL (Power Switch Logic) for hibernating. It turns off VCC power rail
 * for ultra-low power consumption and uses PSL inputs rely on VSBY power rail
 * to wake up ec and the whole system.
 */
/* Wake up pins have non-const configuration. */
/* In npcx9 and later chips, enhanced PSL features are supported including:
 *   (1) Pulse mode for PSL_OUT signal.
 *   (2) Open-drain for PSL_OUT signal (when Pulse mode is enabled.)
 * These features can be enabled in board configuration file by adding
 * the following bit masks to this flag:
 *   (1) NPCX_PSL_CFG_PSL_OUT_PULSE.
 *   (2) NPCX_PSL_CFG_PSL_OUT_OD.
 * Ex:  #define CONFIG_HIBERNATE_PSL_OUT_FLAGS	 		 (NPCX_PSL_CFG_PSL_OUT_PULSE | NPCX_PSL_CFG_PSL_OUT_OD)
)
 */
/*
 * Enable VCC1_RST pin as the input of PSL wakeup source. When Enabling this,
 * the VCC1_RST pin must be connected to the VSBY supply via an external pull-up
 * resistor of maximum 100K ohm .
 * TODO: Remove this when NPCX9 A2 chip is available because A2
 * chip will enable VCC1_RST to PSL wakeup source and lock it in
 * the booter.
 */
/*
 * Chip supports a 64-bit hardware timer and implements
 * __hw_clock_source_read64 and __hw_clock_source_set64.
 *
 * Chips with this config enabled may optionally define
 * __hw_clock_source_read as a 32-bit set function for
 * latency-sensitive situations.
 */
/* Use a hardware specific udelay(). */
/*****************************************************************************/
/* I2C configuration */
/*
 * Define this option if an i2c bus may be unpowered at a certain point during
 * runtime.  An example could be, a sensor bus which is not needed in lower
 * power states so the power rail for those sensors is completely disabled.
 *
 * If defined, your board must provide a board_is_i2c_port_powered() function.
 */
/*
 * Conservative I2C reading size per single transaction. For example, register
 * of stm32f0 and stm32l4 are limited to be 8 bits for this field.
 */
/*
 * Enable i2c_xfer() for receiving request larger than
 * CONFIG_I2C_CHIP_MAX_READ_SIZE.
 */
/*
 * If defined, makes i2c_xfer callback into board-provided functions before the
 * start and after the end of every I2C transaction. This can be used by boards
 * to implement any I2C device specific quirks e.g. requiring minimum bus-free
 * time between every I2C transaction with a device.
 */
/*
 * EC uses an I2C master interface.
 * Note: if this is defined, i2c_init() will be called
 * automatically at board boot.
 */
/* EC uses an I2C slave interface */
/* Defines I2C operation retry count when slave nack'd(EC_ERROR_BUSY) */
/*
 * I2C SCL gating.
 *
 * If CONFIG_I2C_SCL_GATE_ADDR/PORT is defined, whenever the defined address
 * is addressed, CONFIG_I2C_SCL_GATE_GPIO is set to high. When the I2C
 * transaction is done, the pin is set back to low.
 */
/*
 * Some chip supports two owned slave address. The second slave address is used
 * for other purpose such as board specific i2c commands. This option can be
 * set if user of the second slave address requires larger host packet buffer
 * size.
 */
/*
 * I2C multi-port controller.
 *
 * If CONFIG_I2C_MULTI_PORT_CONTROLLER is defined, a single on-chip I2C
 * controller may have multiple I2C ports attached. Therefore, I2c operations
 * must lock the controller (not just the port) to prevent hardware access
 * conflicts.
 */
/*
 * Enable I2C bitbang driver.
 *
 * If defined, the board must define array i2c_bitbang_ports[] and
 * i2c_bitbang_ports_count (same as i2c_ports/i2c_ports_count), but with
 * port number starting from I2C_PORT_COUNT, and .drv=&bitbang_drv.
 *
 * For example:
 * {"battery", 2, 100, GPIO_I2C3_SCL, GPIO_I2C3_SDA, .drv = &bitbang_drv},
 */
/*
 * If defined, reduce I2C traffic from update functions (i2c_update8/16
 * and i2c_field_update8/16) by skipping the write if the new value is
 * unchanged from the old value. This assumes no side effects from writing an
 * unchanged value back out.
 */
/*
 * Packet error checking support for SMBus.
 *
 * If defined, adds error checking support for i2c_readN, i2c_writeN,
 * i2c_read_string and i2c_write_block. Where
 * - write operation appends an error checking byte at end of transfer, and
 * - read operatoin verifies the correctness of error checking byte from the
 * slave.
 * Set I2C_FLAG on addr_flags parameter to use this feature.
 *
 * This option also enables error checking function on smart batteries.
 */
/* Support I2C HID touchpad interface. */
/*
 * Add hosts-side support for entering programming mode for I2C ITE ECs.
 * Must define ite_dfu_config_t for configuration in board file.
 */
/*****************************************************************************/
/* IPI configuration.  Support mt_scp only for now. */
/* EC support Inter-Processor Interrupt. */
/*
 * IPC0/IPI shared object address. This is the starting address of the send
 * object and the receive object.  Each object contains a buffer.
 */
/* "buffer" size of ipc_shared_obj. */
/* EC support rpmsg name service over IPI. */
/*****************************************************************************/
/* Current/Power monitor */
/*
 * Compile driver for INA219 or INA231 or INA3221.
 * Only one of these may be defined (if any).
 */
/*****************************************************************************/
/* Inductive charging */
/* Enable inductive charging support */
/******************************************************************************/
/* Support IT8801 I/O expander. */
/* Support Nuvoton NCT38xx I/O expander. */
/* Support NXP PCA9534 I/O expander. */
/* Support NXP PCAL6408 I/O expander. */
/* Number of IO Expander ports */
/*****************************************************************************/
/* Number of IRQs supported on the EC chip */
/* Enable LDN for KBC mouse */
/*
 * The IT8320 supports e-flash clock up to 48 MHz (IT8390 maximum is 32 MHz).
 * Enable it if we want better performance of fetching instruction from e-flash.
 *
 * This is valid with PLL frequency equal to 48/96MHz only.
 */
/*
 * Enable it if EC's VBAT won't go low when system's power isn't
 * presented (no battery and no AC)
 * If EC's VSTBY and VBAT(power source of BRAM) aren't connected to the same
 * power rail and VBAT doesn't go low immediately (eg: there is a larger
 * capacitance on the rail) after all power off: PD contract recorded in BRAM
 * won't get cleared (But actually we have unplugged type-c adaptor, so the
 * contract should be cleared).
 */
/* To define it, if I2C channel C and PECI used at the same time. */
/*
 * If this is not defined, the firmware will revert the JTAG selection
 * triggered by the hardware strap pin.
 * Un-define this flag by default for all real platforms. see (b/129908668)
 * If some boards (Ex:EVB) require JTAG function, they can define it in
 * their board.h
 */
/*****************************************************************************/
/* Keyboard config */
/*
 * The Silego reset chip sits in between the EC and the physical keyboard on
 * column 2.  To save power in low-power modes, some Silego variants require
 * the signal to be inverted so that the open-drain output from the EC isn't
 * costing power due to the pull-up resistor in the Silego.
 */
/*
 * Keyboards with the assistant key also move the refresh key matrix to row 3
 * instead of row 2.  This is used by the boot key detection code to determine
 * if the refresh key is held down at boot.
 */
/*
 * Config KSO to start from a different KSO pin. This is to allow some chips
 * to use alternate functions on KSO pins.
 */
/*
 * For certain board configurations, KSI2 or KSI3 will be stuck asserted for all
 * scan columns if the power button is held. We must be aware of this case
 * in order to correctly handle recovery mode key combinations.
 */
/* Enable extra debugging output from keyboard modules */
/*
 * Disables the directly connected keyboard pins and drivers on a particular
 * chip. You might want this enabled if the keyboard is indirectly connected
 * to the EC, perhaps through an I2C controller.
 */
/* The board uses a negative edge-triggered GPIO for keyboard interrupts. */
/* Compile code for 8042 keyboard protocol */
/*
 * Enable code for chromeos vivaldi keyboard (standard for new chromeos devices)
 * This config only takes effect if CONFIG_KEYBOARD_PROTOCOL_8042 is selected. A
 * chromeos device is Vivaldi compatible if the keyboard matrix complies with:
 * go/vivaldi-matrix
 * Vivaldi code enables:
 *  - A response to EC_CMD_GET_KEYBD_CONFIG command from coreboot
 *  - Boards can specify their custom layout for top keys.
 */
/* Compile code for MKBP keyboard protocol */
/* Support keyboard factory test scanning */
/*
 * Keyboard config (struct keyboard_scan_config) is in board.c.  If this is
 * not defined, default values from common/keyboard_scan.c will be used.
 */
/*
 * Support for boot key combinations (e.g. refresh key being held on boot to
 * trigger recovery).
 */
/* Add support for the assistant key. */
/* Add support for a switch that indicates if the device is in tablet mode. */
/*
 * Minimum CPU clocks between scans.  This ensures that keyboard scanning
 * doesn't starve the other EC tasks of CPU when running at a decreased system
 * clock.
 */
/*  Print keyboard scan time intervals. */
/*
 * Support for extra runtime key combinations (e.g. alt+volup+h/r for hibernate
 * and warm reboot, respectively).
 */
/*
 * Allow the board layer keyboard customization. If define, the board layer
 * needs to implement:
 * 1. the function board_keyboard_drive_col() which is used to control
 *    the refresh key column.
 * 2. the scancode_set2 and keycap_label array
 * 3. keyboard_customization.h which is similar to keyboard_config.h
 *
 * Note that if your board has the standard chromeos keyboard layout other
 * than the top row, and you are looking only for top row customization, then
 * you should be looking at overriding board_vivaldi_keybd_config() instead.
 */
/*
 * implement the Combination key for the actual Fn key
 */
/*
 * Allow board-specific 8042 keyboard callback when a key state is changed.
 */
/*
 * Call board-supplied keyboard_suppress_noise() function when the debounced
 * keyboard state changes.  Some boards use this to send a signal to the audio
 * codec to suppress typing noise picked up by the microphone.
 */
/*
 * Enable keyboard testing functionality. This enables a message which receives
 * a list of keyscan events from the AP and processes them.  This will cause
 * keypresses to appear on the AP through the same mechanism as a normal
 * keyboard press.
 *
 * This can be used to spoof keyboard events, so is not normally defined,
 * except during internal testing.
 */
/*
 * Enable quasi-bidirectional buffers for KSO pins. It has an open-drain output
 * and a low-impedance pull-up. The low-impedance pull-up is active when ec
 * changes the output data buffers from 0 to 1, thereby reducing the
 * low-to-high transition time.
 */
/*
 * Add support for keyboards with language ID pins
 */
/*
 * Enable keypad (a palm-sized keyboard section usually placed on the far right)
 */
/*
 * Enable the 8042 AUX port. This is typically used for PS/2 mouse devices.
 * You will need to implement send_aux_data_to_device and lpc_aux_put_char.
 */
/*
 * Support simulate scan code function
 */
/*****************************************************************************/
/*
 * Enable IT8801 pwm module.
 */
/*****************************************************************************/
/* Support common LED interface */
/* Standard LED behavior according to spec given that we have a red-green
 * bicolor led for charging and one power led
 */
/*
 * Support common PWM-controlled LEDs that conform to the Chrome OS LED
 * behaviour specification.
 */
/*
 * Support common PWM-controlled LEDs that do not conform to the Chrom OS LED
 * behavior specification
 */
/*
 * Here are some recommended color settings by default, but a board can change
 * the colors to one of "enum ec_led_colors" as they see fit.
 */
/*
 * By default the PWM LED behaviour is reflected on both LEDs and includes the
 * chipset state, battery state, as well as the charging state.  Enable
 * this CONFIG_* option to show only the charging state on the LEDs.
 */
/*
 * By default the PWM LED behaviour is reflected on both LEDs and includes the
 * chipset state, battery state, as well as the charging state.  Enable
 * this CONFIG_* option to show only the charging state, and only on the LED of
 * the active charge port.
 */
/*
 * How many PWM LEDs does the system have that will be controlled by the common
 * PWM LED policy?  Currently, this may be at most 2.
 */
/*
 * Support GPIO-controlled LEDs for common battery/power
 * states through a board-defined lookup table.
 */
/*
 * Set the battery charge percentage for optional STATE_DISCHARGE_S0_BAT_LOW
 * provided by CONFIG_LED_ONOFF_STATES.
 */
/*
 * Adds a power LED under the control of the board-defined lookup table.
 * Must be used with the CONFIG_LED_ONOFF_STATES option.
 */
/*
 * LEDs for LED_POLICY STD may be inverted.  In this case they are active low
 * and the GPIO names will be GPIO_LED..._L.
 */
/* Support for LED driver chip(s) */
/* Offset in flash where little firmware will live. */
/*
 * Compile lid switch support.
 *
 * This is enabled by default because all boards other than reference boards
 * are for laptops with lid switchs.  Reference boards #undef it.
 */
/*
 * GPIOs to use to detect that the lid is opened.
 *
 * This is a X-macro composed of a list of LID_OPEN(GPIO_xxx) elements defining
 * all the GPIOs to check to find whether the lid is currently opened.
 * If not defined, it is using GPIO_LID_OPEN.
 */
/*
 * Support for turning the lightbar power rails on briefly when the AP is off.
 * Enabling this requires implementing the board-specific lb_power() function
 * to do it (see lb_common.h).
 */
/*
 * For tap sequence, show the last segment in dim to give a better idea of
 * battery percentage.
 */
/*
 * Adds a console command for testing the long long shift right ABI on Cortex-m4
 * (Cr50).
 */
/* Program memory offset for little firmware loader. */
/* Size of little firmware loader. */
/* Little firmware loader storage offset. */
/*
 * Low power idle options. These are disabled by default and all boards that
 * want to use low power idle must define it. When using the LFIOSC, the low
 * frequency clock will be used to conserve even more power when possible.
 *
 * GPIOs which need to trigger interrupts in low power idle must specify the
 * GPIO_INT_DSLEEP flag in gpio_list[].
 *
 * Note that for some processors (e.g. LM4), an active JTAG connection will
 * prevent the EC from using low-power idle.
 */
/* Allows us to enable/disable low power idle mode in runtime. */
/*
 * Enable deep sleep during S0 (ignores SLEEP_MASK_AP_RUN).
 */
/* DMA paging between SRAM and DRAM */
/*
 * Enable HID subsystem using HECI on Intel ISH (Integrated Sensor Hub)
 */
/* Support host command interface over HECI */
/*
 * EC supports x86 host communication with AP. This can either be through LPC
 * or eSPI. The CONFIG_HOSTCMD_X86 will get automatically defined if either
 * CONFIG_HOSTCMD_LPC or CONFIG_HOSTCMD_ESPI are defined. LPC and eSPI are
 * mutually exclusive.
 */
/* Support host command interface over LPC bus. */
/* Support host command interface over eSPI bus. */
/*
 * SLP signals (SLP_S3 and SLP_S4) use virtual wires intead of physical pins
 * with eSPI interface.
 */
/* MCHP next two items are EC eSPI slave configuration */
/* Maximum clock frequence eSPI EC slave advertises
 * Values in MHz are 20, 25, 33, 50, and 66
 */
/* EC eSPI slave advertises IO lanes
 * 0 = Single
 * 1 = Single and Dual
 * 2 = Single and Quad
 * 3 = Single, Dual, and Quad
 */
/* Bit map of eSPI channels EC advertises
 * bit[0] = 1 Peripheral channel
 * bit[1] = 1 Virtual Wire channel
 * bit[2] = 1 OOB channel
 * bit[3] = 1 Flash channel
 */
/* Base address of low power RAM. */
/* Size of low power RAM. */
/* Use Link-Time Optimizations to try to reduce the firmware code size */
/* Provide rudimentary malloc/free like services for shared memory. */
/* Need for a math library */
/* Include sensor online calibration (requires CONFIG_FPU) */
/*
 * Duration after which an entry in the temperature cache is considered stale.
 * Defaults to 5 minutes if not set.
 */
/* Set minimum temperature for accelerometer calibration. */
/* Set maximum temperature for accelerometer calibration. */
/* Set threshold radius for using the Kasa algorithm in accelerometer bias
 * calculation (g).
 */
/* Set threshold radius for using the Newton fit algorithm in accelerometer
 * bias calculation (g).
 */
/* Include code to do online compass calibration */
/* Microchip LPC enable debug messages */
/* Microchip I2C controller slave addresses */
/* Microchip EC SRAM start address */
/* Microchip EC SRAM end address */
/* Microchip EC SRAM size */
/*
 * Define Megachips DisplayPort to HDMI protocol converter/level shifter serial
 * interface.
 */
/* Define clock input to MFT module. */
/* Minute-IA watchdog timer vector number. */
/* Support MKBP event */
/* MKBP events are sent by using host event */
/* MKBP events are sent by using GPIO */
/*
 * MKBP events are notified by using both a GPIO and a host event.
 *
 * You should use this if you are using a GPIO to notify the AP of an MKBP
 * event, and you need an MKBP event to wake the AP in suspend and the AP cannot
 * wake from the GPIO.  Since you are using both a GPIO and a hostevent for the
 * notification, make sure that the S0 hostevent mask does NOT include MKBP
 * events.  Otherwise, you will have multiple consumers for a single event.
 * However, make sure to configure the host event *sleep* mask in coreboot to
 * include MKBP events.  In order to prevent all MKBP events from waking the AP,
 * use CONFIG_MKBP_EVENT_WAKEUP_MASK to filter the events.
 */
/* MKBP events are sent by using HECI on an ISH */
/* MKBP events are sent by using custom method */
/*
 * If using MKBP to send host events, with this option, we can define the host
 * events that should wake the system in suspend.  Some examples are:
 *
 *    EC_HOST_EVENT_MASK(EC_HOST_EVENT_LID_OPEN)
 *    EC_HOST_EVENT_MASK(EC_HOST_EVENT_KEY_PRESSED)
 *
 * The only things that should be in this mask are:
 *    EC_HOST_EVENT_MASK(EC_HOST_EVENT_*)
 */
/*
 * Define which MKBP events should wakeup the system in suspend.  Some examples
 * are:
 *
 *    EC_MKBP_EVENT_KEY_MATRIX
 *    EC_MKBP_EVENT_SWITCH
 *
 * The only things that should be in this mask are EC_MKBP_EVENT_*.
 */
/* Support memory protection unit (MPU) */
/* Do not try hold I/O pins at frozen level during deep sleep */
/* Support one-wire interface */
/* Support One Time Protection structure */
/*
 * Address to store persistent panic data at. By default, this will be
 * at the end of RAM, and have a size of sizeof(struct panic_data)
 */
/* Support PECI interface to x86 processor */
/* Common code for PECI interface to x86 processor */
/*
 * Maximum operating temperature in degrees Celcius used on some x86
 * processors. CPU chip temperature is reported relative to this value and
 * is never reported greater than this value. Processor asserts PROCHOT#
 * and starts throttling frequency and voltage at this temp. Operation may
 * become unreliable if temperature exceeds this limit.
 */
/*****************************************************************************/
/* PMU config */
/*
 * Enable hard-resetting the PMU from the EC.  The implementation is rather
 * hacky; it simply shorts out the 3.3V rail to force the PMIC to panic.  We
 * need this unfortunate hack because it's the only way to reset the I2C engine
 * inside the PMU.
 */
/*
 * Enable this config to make console UART self sufficient (no other
 * initialization required before uart_init(), no interrupts, uart_tx_char()
 * does not exit until character finished transmitting).
 *
 * This is useful during early hardware bringup, each platform needs to
 * implement its own code to support this.
 */
/* Define length of history buffer for port80 messages. */
/*
 * Enable/Disable printing of port80 messages in interrupt context. By default,
 * this is disabled.
 */
/* MAX695x 7 segment driver */
/* Config for power states and port80 message to be displayed on 7 -segment */
/* For customer desgin to show port 80 on 7-segment */
/* For some OS image does not support power button scan code */
/* For customer boot from G3 */
/* Compile common code to support power button debouncing */
/* Configure power button. e.g. BUTTON_FLAG_ACTIVE_HIGH */
/* Allow the power button to send events while the lid is closed */
/* Support sending the power button signal to x86 chipsets */
/* Support sending the power button signal by custom */
/* Set power button state idle at init. Implemented only for npcx. */
/* Timeout before power button task gives up starting system */
/*
 * Enable delay between DSW_PWROK and PWRBTN assertion.
 * If enabled, DSW_PWROK_TO_PWRBTN_US and get_time_dsw_pwrok must be defined
 * as well.
 */
/*
 * The time in usec required for PMC to be ready to detect power button press.
 * Refer to the timing diagram for G3 to S0 on PDG for details.
 */
/*
 * Board provides board_pwrbtn_to_pch function instead of GPIO_PCH_PWRBTN_L
 * as the means for asserting power button signal to PCH.
 */
/* Compile common code for AP power state machine */
/* Enable a task-safe way to control the PP5000 rail. */
/* Support stopping in S5 on shutdown */
/*
 * Detect power signal interrupt storms, defined as more than
 * CONFIG_POWER_SIGNAL_INTERRUPT_STORM_DETECT_THRESHOLD occurences of a single
 * power signal interrupt within one second.
 */
/* Use part of the EC's data EEPROM to hold persistent storage for the AP. */
/* Support S0ix */
/* Support detecting failure to enter a sleep state (S0ix/S3) */
/*
 * Allow the host to self-report its sleep state, in case there is some delay
 * between the host beginning to enter the sleep state and power signals
 * actually reflecting the new state.
 */
/*
 * Implement the '%li' printf format as a *32-bit* integer format,
 * as it might be expected by non-EC code.
 */
/*
 * On x86 systems, define this option if the CPU_PROCHOT signal is active low.
 * This setting also applies to monitoring the PROCHOT input if provided by
 * the board.
 */
/* Support PS/2 interface */
/*
 * Define this option to enable programmable voltage detector which will
 * trigger an interrupt when the voltage drops below a threshold specified
 * by the PVD_THRESHOLD which is a chip specific voltage threshold that
 * must be defined in board.h.
 */
/*****************************************************************************/
/* Support PWM control */
/* Define clock input to PWM module. */
/*****************************************************************************/
/* Support PWM output to display backlight */
/*
 * Support keyboard backlight control
 *
 * You need to define board_kblight_init unless CONFIG_PWM_KBLIGHT is used.
 * For example, lm3509 can be registered as a driver in board_kblight_init.
 */
/*
 * Support PWM output to keyboard backlight
 *
 * This implies CONFIG_KEYBOARD_BACKLIGHT.
 */
/* Support Real-Time Clock (RTC) */
/* Size of each RAM bank in chip, default is CONFIG_RAM_SIZE */
/*
 * Number of RAM banks in chip, default is
 * CONFIG_RAM_SIZE / CONFIG_RAM_BANK_SIZE
 */
/* Base address of RAM for the chip */
/*
 * Base address of ROM for the chip. Only used in no physical flash case (
 * !CONFIG_FLASH_PHYSICAL).
 */
/*
 * CONFIG_DATA_RAM_SIZE and CONFIG_RAM_SIZE indicate size of all data RAM
 * available on the chip in bytes and size of data RAM available for EC in
 * bytes, respectively.
 * Usually, CONFIG_DATA_RAM_SIZE = CONFIG_RAM_SIZE but some chips need to
 * allocate RAM for the mask ROM. Then CONFIG_DATA_RAM_SIZE > CONFIG_RAM_SIZE.
 *
 * CONFIG_CODE_RAM_SIZE indicates the size of all code RAM available on the chip
 * in bytes.  This is needed when a chip with external storage where stored with
 * code section, or a chip without an internal flash but need to protect its
 * code section by MPU.
 * Usually, CONFIG_CODE_RAM_SIZE = CONFIG_RO_SIZE.  However, some chips may
 * have other value, e.g. mt_scp which doesn't have RO image, and the code RAM
 * size is actually its CONFIG_ROM_SIZE plus a reserved memory space.
 *
 * CONFIG_ROM_SIZE indicates the size of ROM allocated by a linker script.  This
 * is only needed when no physical flash present (!CONFIG_FLASH_PHYSICAL).  The
 * ROM region will place common RO sections, e.g. .text, .rodata, .data LMA etc.
 */
/* Support IR357x Link voltage regulator debugging / reprogramming */
/* Support RMA auth challenge-response */
/*
 * Use the p256 curve for RMA challenge-response calculations (x21559 is used
 * by default).
 */
/* Enable hardware Random Number generator support */
/* Support verifying 2048-bit RSA signature */
/* Define the RSA key size. */
/* Use RSA exponent 3 instead of F4 (65537) */
/*
 * Adjust the compiler optimization flags for the RSA code to get a speed-up
 * at the expense of a small code size delta.
 */
/*
 * Verify the RW firmware using the RSA signature.
 * (for accessories without software sync)
 */
/*
 * Disable rwsig jump when the reset source is hard pin-reset. This only work
 * for the case where rwsig task is not used.
 */
/*
 * When RWSIG verification is performed as a task, time to wait from signature
 * verification to an automatic jump to RW (if AP does not request the wait to
 * be interrupted).
 */
/*
 * Defines what type of futility signature type should be used.
 * RWSIG should be used for new designs.
 * Old adapters use the USBPD1 futility signature type.
 */
/*
 * By default the pubkey and sig are put at the end of the first and second
 * half of the total flash, and take up the minimum space possible. You can
 * override those defaults with these.
 */
/* Size of the serial number if needed */
/* Support programmable Mac address field. */
/* Size of the MAC address field if needed. */
/****************************************************************************/
/* Shared objects library. */
/* Support shared objects library between RO and RW. */
/* Size of shared objects library. */
/* Program memory offset of shared objects library. */
/* Storage  offset of sharedobjects library. */
/*
 * If defined, the hash module will save its last computed hash when jumping
 * between EC images.
 */
/* Allow the board to use a GPIO for the SCI# signal. */
/* Support computing of other hash sizes (without the VBOOT code) */
/* Unroll some loops in SHA256_transform for better performance. */
/* Emulate the CLZ (Count Leading Zeros) in software for CPU lacking support */
/* Emulate the CLZ (Count Trailing Zeros) in software for CPU lacking support */
/* Support smbus interface */
/*
 * Deprecated in
 * https://chromium-review.googlesource.com/c/chromiumos/platform/ec/+/1704279
 *
 * It hasn't been used in over 2 years
 * https://chromium-review.googlesource.com/c/chromiumos/platform/ec/+/452459/
 * and was only used by one board (pyro).
 *
 * I2C and SMBus are compatible at the physical layer. The data transfer
 * paradigm is different. Some of our batteries are using SMbus style
 * transfers now, they are just using i2cxfer directly to accomplish it.
 *
 * I doubt the SMBus code will get revived, but we do have it in revision
 * history if we ever need it.
 */
/* #undef CONFIG_SMBUS */
/* Support SPI interfaces */
/* Support deprecated SPI protocol version 2. */
/* Define the SPI port to use to access SPI accelerometer */
/* Support SPI flash */
/* Support SPI flash protection register translation */
/* Define the SPI port to use to access the flash */
/* Select any of the following SPI flash configs that your board uses. */
/* SPI flash part supports SR2 register */
/* Define the SPI port to use to access the fingerprint sensor */
/* Support JEDEC SFDP based Serial NOR flash */
/* Enable SPI_NOR debugging providing additional console output while
 * initializing Serial NOR Flash devices including SFDP discovery. */
/* Maximum Serial NOR flash command size, in Bytes */
/* Maximum Serial NOR flash read size, in Bytes */
/* Maximum Serial NOR flash write size, in Bytes. Note this must be a power of
 * two. */
/* If defined will enable block (64KiB) erase operations. */
/* If defined will read the sector/block to be erased first and only initiate
 * the erase operation if not already in an erased state. The read operation
 * (performed in CONFIG_SPI_NOR_MAX_READ_SIZE chunks) is aborted early if a
 * non "0xff" byte is encountered.
 * !! Make sure there is enough stack space to host a
 * !! CONFIG_SPI_NOR_MAX_READ_SIZE sized buffer before enabling.
 */
/* SPI master feature */
/* SPI master halfduplex/3-wire mode */
/* Support STM32 SPI1 as master. */
/* SPI master configure gpios on init */
/* Support SPI masters without GPIO-specified Chip Selects, instead rely on the
 * SPI master port's hardwired CS pin. */
/* Support MCHP MEC family GP-SPI master(s)
 * Define to 0x01 for GPSPI0 only.
 * Define to 0x02 for GPSPI1 only.
 * Define to 0x03 for both controllers.
 */
/* Default stack size to use for tasks, in bytes */
/* Use 32-bit timer for clock source on stm32. */
/* Compile charger detect for STM32 */
/* Fake hibernate mode */
/*
 * Compile common code to handle simple switch inputs such as the recovery
 * button input from the servo debug interface.
 */
/* Support dedicated recovery signal from servo board */
/*
 * System should remain unlocked even if write protect is enabled.
 *
 * NOTE: This should ONLY be defined during bringup, and should never be
 * defined on a shipping / released platform.
 *
 * When defined, CBI allows ectool to reprogram all the fields. Once undefined,
 * it refuses to change certain fields. (e.g. board version, OEM ID)
 *
 * Also, this will enable PD in RO for TCPMv2.
 */
/*
 * Device can be a tablet as well as a clamshell.
 */
/*
 * Add a virtual switch to indicate when we are in tablet mode.
 */
/*
 * Config to identify what devices use GMR sensor to detect tablet mode. If a
 * board selects this config, it also needs to provide GMR_TABLET_MODE_GPIO_L
 * and direct its interrupt to gmr_tablet_switch_isr.
 */
/*
 * Board provides board_sensor_at_360 method instead of GMR_TABLET_MODE_GPIO_L
 * as the means for determining the state of the flipped-360-degree mode.
 */
/*
 * Add a virtual switch to indicate when detachable device has
 * base attached.
 */
/*
 * Microchip Trace FIFO Debug Port
 */
/*
 * Mirochip EMI region 1 enable
 */
/*****************************************************************************/
/* Task config */
/*
 * List of enabled tasks in ascending priority order. This is normally
 * defined in each board's ec.tasklist file.
 *
 * For each task, use the macro TASK_ALWAYS(n, r, d, s) for base tasks and
 * TASK_NOTEST(n, r, d, s) for tasks that can be excluded in test binaries,
 * where:
 * 'n' is the name of the task
 * 'r' is the main routine of the task
 * 'd' is an opaque parameter passed to the routine at startup
 * 's' is the stack size in bytes; must be a multiple of 8
 *
 * Some cores use TASK_ALWAYS(n, r, d, s, f), where:
 * 'f' is the bit flags for the platform specific information
 *    - MIA_TASK_FLAG_USE_FPU : bit 0, task uses FPU H/W
 *
 * For USB PD tasks, IDs must be in consecutive order and correspond to
 * the port which they are for. See TASK_ID_TO_PD_PORT() macro.
 */
/*
 * List of test tasks.  Same format as CONFIG_TASK_LIST, but used to define
 * additional tasks for a unit test.  Normally defined in
 * test/{testname}.tasklist.
 */
/*
 * List of tasks used by CTS
 *
 * cts.tasklist contains tasks run only for CTS. These tasks are added to the
 * tasks registered in ec.tasklist with higher priority.
 *
 * If a CTS suite does not define its own cts.tasklist, the common list is used
 * (i.e. cts/cts.tasklist).
 */
/*
 * List of tasks that support reset. Tasks listed here must also be included in
 * CONFIG_TASK_LIST.
 *
 * For each task, use macro ENABLE_RESET(n) to enable resets. The parameter n
 * must match the value passed to TASK_{ALWAYS,NOTEST} in CONFIG_TASK_LIST.
 *
 * Tasks that enable resets *must* call task_reset_cleanup() once at the
 * beginning of their main function, and perform task-specific cleanup if
 * necessary.
 *
 * By default, tasks can be reset at any time. To change this behavior, call
 * task_disable_resets() immediately after task_reset_cleanup(), and then enable
 * resets where appropriate.
 *
 * Tasks that predominantly have resets disabled are expected to periodically
 * enable resets, and should always ensure to do so before waiting for long
 * periods (eg when waiting for an event to process).
 */
/*
 * Enable task profiling.
 *
 * Boards may #undef this to reduce image size and RAM usage.
 */
/*****************************************************************************/
/* Mock config */
/*
 * List of mock implementations to pull into the build.
 *
 * This should contain a flat list of MOCK(the-mock-name) elements.
 *
 * This is defined in the following two files:
 * test/{testname}.mocklist
 * fuzz/{fuzzname}.mocklist
 */
/*****************************************************************************/
/* Temperature sensor config */
/* Compile common code for temperature sensor support */
/* Support particular temperature sensor chips */
/* Compile common code for thermistor support */
/* Support particular thermistors */
/*
 * If defined, image includes lookup tables and helper functions that convert
 * thermistor ADC readings into degrees K based off of various circuit
 * configurations.
 */
/*
 * If defined, active-high GPIO which indicates temperature sensor chips are
 * powered.  If not defined, temperature sensors are assumed to be always
 * powered.
 */
/* Compile common code for throttling the CPU based on the temp sensors */
/*
 * Throttle the CPU when battery discharge current is too high. When
 * this feature is enabled, BAT_MAX_DISCHG_CURRENT must be defined in board.h.
 */
/*
 * Throttle the CPU when battery voltage drops below a defined threshold
 * where the board still boots but some components don't function perfectly.
 * When this feature is enabled, BAT_LOW_VOLTAGE_THRESH must be defined in
 * board.h.
 */
/*
 * If defined, dptf is enabled to manage thermals.
 *
 * NOTE: This doesn't mean that thermal control is completely taken care by
 * DPTF. We have some hybrid solutions where the EC still manages the fans.
 */
/*
 * If defined, this indicates to the motion lid driver that the board does not
 * have any GMR sensor and hence DPTF profile selection is required to be done
 * based on lid angle.
 */
/*
 * If defined, device supports multiple DPTF profiles depending upon device mode
 * e.g. clamshell v/s 360-degree flipped mode or base detached v/s attached
 * mode.
 *
 * This config can be used by any driver that does lid angle calculation or base
 * state detection to determine if different profile numbers need to be
 * indicated to the host.
 */
/*****************************************************************************/
/* Touchpad config */
/* Enable touchpad. (You must pick a driver from the options below.) */
/* Enable Elan driver */
/* Enable Goodix GT7288 driver */
/* Enable ST driver */
/* Set I2C port and address (7-bit) */
/*
 * Enable touchpad FW update over USB update protocol, and define touchpad
 * virtual address and size.
 */
/*
 * Include hashes of the touchpad FW in the EC image, passed as TOUCHPAD_FW
 * parameter to make command.
 */
/*****************************************************************************/
/* USART stream config */
/*
 * Each USART stream can be individually enabled and accessible using the
 * stream interface provided in the usart_config struct.
 */
/*****************************************************************************/
/* USB stream config */
/*****************************************************************************/
/* UART HOST COMMAND config */
/* Includes USART as host command interface */
/* Pointer to USART HW config of physical instance */
/*
 * USART baudrate for host command interface.
 * Typically configured at 3000000 to handle use cases
 * like firmware download and big packets in a reasonable time.
 */
/*****************************************************************************/
/* UART config */
/* Baud rate for UARTs */
/* UART index (number) for EC console */
/* UART index (number) for host UART, if present */
/* Use uart_input_filter() to filter UART input. See prototype in uart.h */
/*
 * Allow switching the EC console UART to an alternate pad. This must be
 * used for short transactions only, and EC is only able to receive data on
 * that alternate pad after it has been explicitly switched.
 */
/**
 * This will only be used for Kukui and cortex-m0. Preserve EC reset logs and
 * console logs on SRAM so that the logs will be preserved after EC shutting
 * down or sysjumped. It will keep the contents across EC resets, so we have
 * more information about system states. The contents on SRAM will be cleared
 * when checksum or validity check fails.
 */
/*
 * UART receive buffer size in bytes.  Must be a power of 2 for macros in
 * common/uart_buffering.c to work properly.  Must be larger than
 * CONFIG_CONSOLE_INPUT_LINE_SIZE to copy and paste scripts.
 */
/* Use DMA for UART input */
/*
 * On some platforms, UART receive DMA can't trigger an interrupt when a single
 * character is received.  Those platforms poll for characters every HOOK_TICK.
 * When a character is received, make this many additional checks between then
 * and the next HOOK_TICK, to increase responsiveness of the console to input.
 */
/*
 * UART transmit buffer size in bytes.  Must be a power of 2 for macros in
 * common/uart_buffering.c to work properly.
 */
/* Use DMA for UART output */
/* The DMA channel for UART.  If not defined, default to UART1. */
/* The DMA peripheral request signal for UART TX. STM32 only. */
/* The DMA channel mapping config for stm32f4. */
/* Driver of LN9310 switchcap */
/*****************************************************************************/
/* USB PD config */
/* Config is enabled, if PD interrupt tasks are used. */
/*
 * Enables USB Power Delivery
 *
 * When this config option is enabled, one of the following must be enabled:
 *	CONFIG_USB_PD_TCPMV1 - legacy power delivery state machine
 *	CONFIG_USB_PD_TCPMV2 - current power delivery state machine
 */
/*
 * Enables the Legacy power delivery state machine.
 * NOTE: Should not be used for new designs.
 */
/*
 * Enables PD protocol state names in the TPCMv1 console output.
 * Disable to save ~900 bytes in flash space.
 */
/*
 * Enables Version 2 of the Power Delivery state machine
 *
 * Along with CONFIG_USB_PD_TCPMV2, you must ensure a device type is also
 * enabled otherwise an error will be emitted.
 */
/*
 * Device Types for TCPMv2.
 *
 * Exactly one must be defined when CONFIG_USB_PD_TCPMV2 is defined.
 *
 * VPD - Vconn Powered Device
 * CTVPD - Charge Through Vconn Powered Device
 * DRP_ACC_TRYSRC - Dual Role Port, Audio Accessory, and Try.SRC Device
 */
/*
 * TCPMv2 statemachine layers
 *
 * All layers are defined by default. To opt-out, you must undef in your board.
 * Also these defines don't take effect unless CONFIG_USB_PD_TCPMV2 is also
 * defined.
 *
 * TYPEC_SM - Type-C deals with CC lines voltage level connections
 * PRL_SM - Protocol handles flow and chunking TX and RX messages
 * PE - Policy Engine handles PD communication flow
 */
/* Enables PD Console commands */
/* Enables PD Host commands */
/* Support for USB PD alternate mode */
/* Support for USB PD alternate mode of Downward Facing Port */
/* HPD is sent to the GPU from the EC via a GPIO */
/*
 * HPD is sent to the GPU from the EC via a GPIO, and the HPD GPIO level has
 * to be handled separately.
 */
/* Check if max voltage request is allowed before each request */
/* Default state of PD communication disabled flag */
/*
 * Define this if a board needs custom SNK and/or SRC PDOs.
 *
 * The default SRC PDO is a fixed 5V/1.5A with PDO_FIXED_FLAGS indicating
 * Dual-Role power, USB Communication Capable, and Dual-Role data.
 *
 * The default SNK PDOs are:
 * - Fixed 5V/500mA with the same PDO_FIXED_FLAGS
 * - Variable (non-battery) min 4.75V, max PD_MAX_VOLTAGE_MV, operational
 *   current 3A
 * - Battery min 4.75V, max PD_MAX_VOLTAGE_MV, operational power 15W
 */
/*
 * Do not enable PD communication in RO as a security measure.
 * We don't want to allow communication to outside world until
 * we jump to RW. This can by overridden with the removal of
 * the write protect screw to allow for easier testing.
 *
 * Note: this is assumed for TCPMv2. See also CONFIG_BRINGUP for enabling PD in
 * RO.
 */
/* Default USB data role when a USB PD debug accessory is seen */
/*
 * Define to have a fixed PD Task debug level.
 * Undef to allow runtime change via console command.
 */
/*
 * Define if this board can enable VBUS discharge (eg. through a GPIO-controlled
 * discharge circuit, or through port controller registers) to discharge VBUS
 * rapidly on disconnect. Will be defined automatically when one of the below
 * options is defined.
 */
/* Define if discharge circuit is EC GPIO-controlled. */
/* Define if discharge circuit is using PD discharge registers on TCPC. */
/* Define if discharge circuit is using PD discharge registers on PPC. */
/* Define if this board can act as a dual-role PD port (source and sink) */
/* Define if this board can used TCPC-controlled DRP toggle */
/* Define to reduces VBUS droop caused by inrush current during charging */
/* Initial DRP / toggle policy */
/*
 * Define if VBUS source GPIOs (GPIO_USB_C*_5V_EN) are active-low (and named
 * (..._L) rather than default active-high.
 */
/* Ask charger if VBUS is enabled on a source port, instead of using GPIO */
/*
 * If defined, use a custom function to determine if VBUS is enabled on a
 * source port. The custom function is board_is_sourcing_vbus(port).
 */
/* Dynamic USB PD source capability */
/* Support USB PD flash. */
/* Check whether PD is the sole power source before flash erase operation */
/* Define if this board, operating as a sink, can give power back to a source */
/*
 * PD Rev2.0 functionality is enabled by default. Defining this macro
 * enables PD Rev3.0 functionality.
 */
/* Defined automatically based on on maximum PD revision supported. */
/*
 * Support USB PD 3.0 Extended Messages. This will only take effect if
 * CONFIG_USB_PD_REV30 is also enabled. Note that Chromebooks disabling this
 * config item are non-compliant with PD 3.0, because they have batteries but do
 * not support Get_Battery_Cap or Get_Battery_Status.
 */
/* Major and Minor ChromeOS specific PD device Hardware IDs. */
/* HW & SW version for alternate mode discover identity response (4bits each) */
/* USB PD MCU slave address for host commands */
/* Define if using internal comparator for PD receive */
/* Record main PD events in a circular buffer */
/* The size in bytes of the FIFO used for event logging */
/* Save power by waking up on VBUS rather than polling CC */
/* Allow chip to go into low power idle even when a PD device is attached */
/* Number of USB PD ports */
/*
 * Number of ITE USB PD active ports
 * NOTE: The active port usage should follow the order of ITE TCPC port index.
 */
/* Simple DFP, such as power adapter, will not send discovery VDM on connect */
/* Use comparator module for PD RX interrupt */
/* Use TCPC module (type-C port controller) */
/* Board provides specific TCPC init function */
/* Enable TCPC to enter low power mode */
/*
 * Default debounce when exiting low-power mode before checking CC status.
 * Some TCPCs need additional time following a VBUS change to internally
 * debounce the CC line status and updating the CC_STATUS register.
 */
/* Define EC and TCPC modules are in one integrated chip */
/* Enable the encoding of msg SOP* in bits 31-28 of 32-bit msg header type */
/*
 * The USB4 specification defines compatibility support for USB4 products to
 * interact with existing Thunderbolt 3 products. Enable this config to enter
 * into Thunderbolt-compatible mode between two port partners.
 */
/* Enable to enter into USB4 mode between two port partners */
/* Enable if port is cable of operating as an USB4 device */
/* Enable if port is cable of operating as an USB3.2 device */
/* Enable if the board is Thunderbolt Gen 3 capable */
/* Enable PCIE tunneling if Thunderbolt-Compatible mode is enabled*/
/*
 * The following two macros are ASCII text strings that matches what appears
 * in the USB-IF Product Registration form for this device. These macros are
 * used during VIF generation and they form the product name in the
 * USB Integrator’s List.
 */
/*
 * Should be defined if the device is a TypeC Alt Mode Adapter. This macro
 * is used during VIF generation.
 */
/*
 * A text string, provided by the USB-IF. This macro is used during VIF
 * generation.
 */
/*
 * An ASCII text string that must correspond with the port label given on the
 * device picture submitted to USB-IF by the Vendor along with the VIF. This
 * macro is used during VIF generation.
 */
/*
 * Define if Get_Manufacturer_Info request PD message is supported.
 * Used during VIF generation.
 */
/*
 * Define if both Security_Request and Security_Response PD messages are
 * supported. Used during VIF generation.
 */
/*
 * The number of non-removable batteries in the device. Used duing VIF
 * generation.
 */
/*
 * Track VBUS level in TCPC module. This will only be needed if we're acting
 * as an external TCPC.
 */
/* Enable runtime config the TCPC */
/*
 * Choose one of the following TCPMs (type-C port manager) to manage TCPC. The
 * TCPM stub is used to make direct function calls to TCPC when TCPC is on
 * the same MCU. The TCPCI TCPM uses the standard TCPCI i2c interface to TCPC.
 */
/* PS8XXX series are all supported by a single driver with a build time config
 * listed below (CONFIG_USB_PD_TCPM_PS*) defined to enable the specific product.
 *
 * If a board with the same EC FW is expected to support multiple products here
 * then CONFIG_USB_PD_TCPM_MULTI_PS8XXX MUST be defined then we can enable more
 * than one product config to support them in the runtime. In this case, board
 * is responsible to override function of board_get_ps8xxx_product_id in order
 * to provide the product id per port.
 */
/*
 * Defined automatically by chip and depends on chip. This guards the onboard
 * TCPM driver, but CONFIG_USB_PD_TCPM_ITE_ON_CHIP needs to be defined in
 * board.h for either of these driver to actually be included in the final
 * image.
 */
/*
 * Type-C retimer drivers to be used.
 */
/* Allow run-time configuration of the Burnside Bridge driver structure */
/*
 * Adds an EC console command to erase the ANX7447 OCM flash.
 * Note: this is intended to be a temporary option and
 * won't be needed when ANX7447 are put on boards with OCM already erased
 */
/*
 * Use this config option to enable and internal pullup resistor on the AUX_N
 * and internal pulldown resistor on the AUX_P line. Only use this config
 * option if there are no external pu/pd resistors on these signals. This
 * configuration should be used to avoid noise issues on the DDI1_AUX_N &
 * DDI1_AUX_P signals (b/122873171)
 */
/*
 * Use this to override the TCPCI Device ID value to be 0x0002 for
 * chip rev A1. Early A1 firmware misreports the DID as 0x0001.
 */
/*
 * Use this option if the TCPC port controller supports the optional register
 * 18h CONFIG_STANDARD_OUTPUT to steer the high-speed muxes.
 */
/*
 * The TCPM must know whether VBUS is present in order to make proper state
 * transitions. In addition, charge_manager must know about VBUS presence in
 * order to make charging decisions. VBUS state can be determined by various
 * methods:
 * - Some TCPCs can detect and report the presence of VBUS.
 * - In some configurations, charger ICs can report the presence of VBUS.
 * - On some boards, dedicated VBUS interrupt pins are available.
 * - Some power path controllers (PPC) can report the presence of VBUS.
 *
 * Exactly one of these should be defined for all boards that run the PD
 * state machine.
 */
/* Define if the there is a separate ADC channel for each USB-C Vbus voltage */
/* Define if the there is no hardware to measure Vbus voltage */
/* Define if charger on the board supports VBUS measurement */
/* Define if tcpc on the board supports VBUS measurement */
/* Define the type-c port controller I2C base address. */
/* Use this option to enable Try.SRC mode for Dual Role devices */
/* Set the default minimum battery percentage for Try.Src to be enabled */
/*
 * Set the minimum battery percentage to allow a PD port to send resets as a
 * sink (and risk a hard reset, losing Vbus).  Note this may cause a high-power
 * charger to appear as only a low-power 15W charger until a reset is sent to
 * re-start PD negotiation.
 */
/* Alternative configuration keeping only the TX part of PHY */
/* Use DAC as reference for comparator at 850mV. */
/*
 * Request for a PDO which voltage is closest to PD_PREFER_MV for sink.
 * This config in theory could achieve better charging efficiency.  Note this
 * may not always pick the PD_PREFER_MV if available (if the PDO's
 * power not sufficient for the system), it will pick second closest PDO until
 * the system desired power is low enough to be charged by the designed PDO.
 *
 * If defined, must also define `struct pd_pref_config_t pd_pref_config`.
 */
/*
 * The Fast Role Swap trigger can be implemented in either the TCPC or PPC
 * driver. If either CONFIG_USB_PD_FRS_TCPC or CONFIG_USB_PD_FRS_PPC is set,
 * CONFIG_USB_FRS will be set automatically to enable the protocol-side of FRS.
 */
/*
 * USB Product ID. Each platform (e.g. baseboard set) should have a single
 * VID/PID combination. If there is a big enough change within a platform,
 * then we can differentiate USB topologies by varying the HW version field
 * in the Sink and Source Capabilities Extended messages.
 *
 * To reserve a new PID, use go/usb.
 */
/* PPC needs to be informed of CC polarity */
/*
 * Disable charging from Default(USB) Rp as a type-c supplier. If your device
 * can detect such a supplier by BC 1.2, define this to get more current
 * from a BC 1.2 supplier.
 */
/* USB Type-C Power Path Controllers (PPC) */
/*
 * SYV682x PPC high voltage power path current limit.  Default limit is
 * 3.3A.  See the syv682x header file for permissible values.
 */
/* PPC is capable of gating the SBU lines. */
/* PPC is capable of providing VCONN */
/* PPC has level interrupts and has a dedicated interrupt pin to check */
/* Support for USB type-c superspeed mux */
/*
 * Only configure USB type-c superspeed mux when DFP (for chipsets that
 * don't support being a UFP)
 */
/* Support v1.1 type-C connection state machine */
/* Support for USB type-c vconn. Not needed for captive cables. */
/* Support VCONN swap */
/* USB Binary device Object Store support */
/* USB Device version of product */
/*****************************************************************************/
/* Compile chip support for the USB device controller */
/* Support USB isochronous handler */
/* Common USB / BC1.2 charger detection routines */
/*
 * Used for bc1.2 chips that need to be triggered from data role swaps instead
 * of just VBUS changes.
 */
/*
 * Board only needs one bc12 driver. This includes the case that has multiple
 * chips that use the same driver. Enabled by default.
 *
 * If undefined, board should define a bc12_ports array which associates
 * each port to its bc12 driver.
 */
/* External BC1.2 charger detection devices. */
/* Number of Pericom PI3USB9281 chips present in system */
/* Enable USB serial console module. */
/*
 * Enable USB serial console module using usb stream config.
 * NOTE: CONFIG_USB_CONSOLE and CONFIG_USB_CONSOLE_STREAM should be defined
 * exclusively each other.
 */
/* USB serial console transmit buffer size in bytes. */
/*
 * Enable USB serial console crc32 computation.
 * Also makes console output block on overrun.
 */
/* Support USB HID interface. */
/* Support USB HID keyboard interface. */
/* Support USB HID keyboard backlight. */
/* Support USB HID touchpad interface. */
/* HID touchpad logical dimensions */
/* HID touchpad physical dimensions (tenth of mm) */
/* USB device buffers and descriptors */
/* Disable automatic connection of USB peripheral */
/* Disable automatic initialization of USB peripheral */
/* Support simple control of power to the device's USB ports */
/*
 * Support smart power control to the device's USB ports, using
 * dedicated power control chips.  This potentially enables automatic
 * negotiation of supplying more power to peripherals.
 */
/*
 * GPIOs to enable USB port power have non-const configuration.
 */
/*
 * Support smart power control to the device's USB ports, however only CDP and
 * SDP are supported.  Usually this is the case if all the control lines to the
 * charging port controller are hard-wired.
 */
/*
 * Override the default charging mode for USB smart power control.
 * Value is selected from usb_charge_mode in include/usb_charge.h
 */
/*
 * Smart USB power control can use a full set of control signals to the USB
 * port power chip, or a reduced set.  If this is defined, use the reduced set.
 */
/*  Number of smart USB power ports. */
/*
 * Smart USB power control current limit pins may be inverted.  In this case
 * they are active low and the GPIO names will be GPIO_USBn_ILIM_SEL_L.
 */
/*
 * Support waking up host by setting the K-state on the data lines (requires
 * CONFIG_USB_SUSPEND to be set as well).
 */
/* Support programmable USB device iSerial field. */
/* Support reporting of configuration bMaxPower in mA */
/* Support reporting as self powered in USB configuration. */
/* Support correct handling of USB suspend (host-initiated). */
/* Default pull-up value on the USB-C ports when they are used as source. */
/*
 * Override the pull-up value when only zero or one port is actively sourcing
 * current and we can advertise more current than what is defined by
 * `CONFIG_USB_PD_PULLUP`.
 * Should be defined with one of the tcpc_rp_value.
 */
/*
 * Total current in mA the board can supply to external devices through
 * USB-C ports
 *
 * When a sink device is plugged or unplugged, source current redistribution
 * occurs. If this macro is defined, redistribution occurs in such a way
 * that there is no current drop (e.g. 3A -> 1.5A) on active source ports.
 */
/******************************************************************************/
/* stm32f4 dwc usb configs. */
/* Set USB speed to FS rather than HS */
/******************************************************************************/
/* USB port switch */
/* Allow run-time completion of the usb mux driver structure */
/* Support the AMD FP5 USB/DP Mux */
/*
 * Support the Analogix ANX7440 USB Type-C Active mux with
 * Integrated Re-timers for USB3.1/DisplayPort.
 */
/* Support the ITE IT5205 Type-C USB alternate mode mux. */
/* Support the Pericom PI3USB30532 USB3.0/DP1.2 Matrix Switch */
/* Support the Pericom PI3USB31532 USB3.1/DP1.4 Matrix Switch */
/* Support the Parade PS8740 Type-C Redriving Switch */
/* Support the Parade PS8742 Type-C Redriving Switch */
/* Support the Parade PS8743 Type-C Redriving Switch */
/* 'Virtual' USB mux under host (not EC) control */
/* Enable IT5205H SBU protection switch */
/*****************************************************************************/
/* USB GPIO config */
/*****************************************************************************/
/* USB SPI config */
/*****************************************************************************/
/* USB I2C config */
/* Allowed read/write count for USB over I2C */
/*****************************************************************************/
/* USB Power monitoring interface config */
/*****************************************************************************/
/*
 * USB stream signing config. This allows data read over UART or SPI
 * to have a signature generated that can be used to validate the data
 * offline based on H1's registered key. Used by mn50.
 */
/*****************************************************************************/
/*
 * Support early firmware selection
 *
 * EFS1 is being deprecated. EFS2 is faster, doesn't need two slots, and
 * supports rollback protection.
 *
 * EFS2 runs in the system task (a.k.a. main) and the hook task (for shutdown
 * hook). Their stack sizes must be big enough for sha256.
 */
/* Offset of RW-A image in writable storage when using EFS. */
/* Offset of RW-A signature. */
/* Offset of RW-B image in writable storage when using EFS. */
/* Offset of RW-B signature. */
/* Support computing hash of code for verified boot */
/* Support for secure temporary storage for verified boot */
/* Number of supported slots for secure temporary storage */
/*****************************************************************************/
/* Watchdog config */
/*
 * Compile watchdog timer support.  The watchdog timer will reboot the system
 * if the hook task (which is the lowest-priority task on the system) gets
 * starved for CPU time and isn't able to fire its HOOK_TICK event.
 */
/*
 * Try to detect a watchdog that is about to fire, and print a trace.  This is
 * required on chips such as STM32 where the watchdog timer simply reboots the
 * system without any early warning.
 */
/*
 * The maximum number of times that the watchdog timer may reset
 * before halting the system (or taking some sort of other
 * chip-dependent corrective action).
 */
/* Watchdog period in ms; see also AUX_TIMER_PERIOD_MS */
/*
 * Fire auxiliary timer 500ms before watchdog timer expires. This leaves
 * some time for debug trace to be printed.
 */
/*****************************************************************************/
/* WebUSB config */
/*
 * Enable the WebUSB support and define its URL.
 * Export a WebUSB Platform Descriptor in the Binary Object Store descriptor.
 * The WebUSB landing page URL is equal to 'CONFIG_WEBUSB_URL' plus the
 * https:// prefix.
 * This requires CONFIG_USB_BOS.
 */
/*****************************************************************************/
/*
 * Support controlling power to WiFi, WWAN (3G/LTE), and/or bluetooth modules.
 */
/*
 * Support for WiFi devices that must remain powered in suspend.  Set to the
 * combination of EC_WIRELESS_SWITCH flags (from ec_commands.h) which should
 * be set in suspend.
 */
/* WiFi power control signal is active-low. */
/*
 * Write protect signal is active-high.  If this is defined, there must be a
 * GPIO named GPIO_WP; if not defined, there must be a GPIO names GPIO_WP_L.
 */
/*
 * The write protect signal is always asserted,
 * independently of the GPIO existence or current value.
 */
/*
 * If needed to allocate some free space in the base of the RO or RW section
 * of the image, define these to be equal the required size of the free space.
 */
/* Firmware upgrade options. */
/* A different config for the same update. TODO(vbendeb): dedupe these */
/* Add support for pairing over the USB update interface. */
/* Add support for reading UART buffer from USB update interface. */
/* PDU size for fw update over USB (or TPM). */
/*
 * If defined, charge_get_state returns a special status if battery is
 * discharging and battery is nearly full.
 */
/*
 * Define this if a chip needs to add some information to the common 'version'
 * command output.
 */
/*
 * Define this to enable Cros Board Info support. I2C_EEPROM_PORT and
 * I2C_EEPROM_ADDR must be defined as well.
 */
/*****************************************************************************/
/*
 * ISH config defaults
 */
/*
 * This will be automatically defined below if the board supports power
 * modes that will require the AONTASK functionality.
 */
/*
 * Define the following if the power state support is required.
 */
/*
 * Define the following if the ip accessible power gating is required.
 */
/*
 * Define the following to the number of uSeconds of elapsed time that is
 * required to enter D0I2 and D0I3, if they are supported
 */
/*
 * Define the following if the new specific power management processing
 * after ISH 5.4 is used.
 */
/*
 * Define the following in order to perform power management reset
 * prep IRQ setup when entering a new state
 */
/*
 * Define the following if combined ISR is required for ipc communication
 * between host and ISH.
 */
/*
 * Define the following if there is need to clear ISH fabric error.
 */
/*
 * Define the following if the version of ISH uses Synopsys Designware uart.
 */
/*
 * On Intel devices EC's USB-C port numbers may not be physically equal to
 * AP's USB3 & USB2 port number. Because there can be MAX 15 USB2 ports on
 * PCH and MAX 15 USB3 ports on SOC, based on the complexity of the physical
 * layout of the board, USB3 & USB2 port signals of AP are routed to respective
 * USB-C port of EC. Hence, to configure the Intel Virtual MUX, information of
 * USB3 and USB2 port numbers of the respective USB-C port is needed.
 */
/*
 * TEST ONLY defines (CONFIG_TEST_*)
 *
 * Used to include files for unit and other builds tests.
 */
 /* Define to enable Policy Engine State Machine. */
/* Define to enable USB State Machine framework. */
/*
 * This build is not a complete platform/ec based EC, but instead
 * using the platform/ec zephyr module.
 */
/* Define to supprt factory mode */
/* Define to supprt capsled */
/*****************************************************************************/
/*
 * Include board and core configs, since those hold the CONFIG_ constants for a
 * given configuration.  This guarantees they get included everywhere, and
 * fixes a fairly common bug where we gate out code with #ifndef
 * CONFIG_SOMETHING and but forget to include both of these.
 *
 * Board is included after chip, so that chip defaults can be overridden on a
 * per-board basis as needed.
 */
/* Copyright 2017 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* CPU core BFD configuration */
/* Copyright 2013 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* Linker binary architecture and format */
/* Number of IRQ vectors on the NVIC */
/* Use a bigger console output buffer */
/* Interval between HOOK_TICK notifications */
/*
 * Enable chip_pre_init called from main
 * Used for configuring peripheral block
 * sleep enables.
 */
/*
 * MCHP EC's have I2C master/slave
 * controllers and multiple I2C ports. Any
 * port may be mapped to any controller.
 * Enable multi-port controller feature.
 * Board level configuration determines
 * how many controllers/ports are used and
 * the mapping of port(s) to controller(s).
 * NOTE: Some MCHP reduced pin packages
 * may not implement all 11 I2C ports.
 */
/*
 * MCHP I2C controller is master-slave capable and requires
 * a slave address be programmed even if used as master only.
 * Each I2C controller can respond to two slave address.
 * Define fake slave addresses that aren't used on the I2C port(s)
 * connected to each controller.
 */
/************************************************************************/
/* Memory mapping */
/*
 * MEC1701H has a total of 256KB SRAM.
 *   CODE at 0xE0000 - 0x117FFF, DATA at 0x118000 - 0x11FFFF
 *   MCHP MEC can fetch code from data or data from code.
 */
/************************************************************************/
/* Define our RAM layout. */
/* 64k Data RAM for RO / RW / loader */
/* System stack size */
/* was 1024, temporarily expanded to 2048 for debug */
/* non-standard task stack sizes */
/* temporarily expanded for debug */
/*
 * TODO: Large stack consumption
 * https://code.google.com/p/chrome-os-partner/issues/detail?id=49245
 */
/* dsw original = 800, if stack exceptions expand to 1024 for debug */
/* Default task stack size */
/************************************************************************/
/* Define our flash layout. */
/* Protect bank size 4K bytes */
/* Sector erase size 4K bytes */
/* Minimum write size */
/* One page size for write */
/* Program memory base address */
/* Copyright 2017 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/*
 * mec17xx flash layout:
 * - Non memory-mapped, external SPI.
 * - RW image at the beginning of writable region.
 * - Bootloader at the beginning of protected region, followed by RO image.
 * - Loader + (RO | RW) loaded into program memory.
 */
/* Non-memmapped, external SPI */
/*
 * MEC17xx BootROM uses two 4-byte TAG's at SPI offset 0x0 and 0x04.
 * One valid TAG must be present.
 * TAG's point to a Header which must be located on a 256 byte
 * boundary anywhere in the flash (24-bit addressing).
 * Locate BootROM load Header + LFW + EC_RO at start of second
 * 4KB sector (offset 0x1000).
 * Locate BootROM load Header + EC_RW at start of second half of
 * SPI flash.
 * LFW size is 4KB
 * EC_RO and EC_RW padded sizes from the build are 188KB each.
 * Storage size is 1/2 flash size.
 */
/* Lower 256KB of flash is protected region */
/* Writable storage for EC_RW starts at 256KB */
/* Writeable storage is 256KB */
/* Loader resides at the beginning of program memory */
/* Write protect Loader and RO Image */
/*
 * Write protect LFW + EC_RO
 */
/*
 * RO / RW images follow the loader in program memory. Either RO or RW
 * image will be loaded -- both cannot be loaded at the same time.
 */
/*
 * Total SRAM and the amount allocated for data are specified
 * by CONFIG_MEC_SRAM_SIZE and CONFIG_RAM_SIZE in config_chip.h
 * The little firmware (lfw) loader is resident in first 4KB of Code SRAM.
 * EC_RO/RW size = Total SRAM - Data SRAM - LFW size.
 * !!! EC_RO/RW size MUST be a multiple of flash erase block size.
 * defined by CONFIG_FLASH_ERASE_SIZE in chip/config_chip.h
 * and must be located on a erase block boundary. !!!
 */
/*
 * NOTE: CONFIG_RW_SIZE is passed to chip/mchp/util/pack_ec.py
 */
/*
 * WP region consists of first half of SPI containing TAGs at beginning
 * of SPI flash and header + binary(LFW+EC_RO) an offset aligned on
 * a 256 byte boundary.
 * NOTE: Changing CONFIG_BOOT_HEADER_STORAGE_OFF requires changing
 * parameter --payload_offset of pack_ec.py in build.mk!
 * Two 4-byte TAG's exist at offset 0 and 4 in the SPI flash device.
 * We only use first TAG pointing to LFW + EC_RO.
 * Header size is 128 bytes. Firmware binary is located immediately
 * after the header.
 * Second half of SPI flash contains:
 * Header(128 bytes) + EC_RW
 * EC flash erase/write commands check alginment base on
 * CONFIG_FLASH_ERASE_SIZE defined in config_chip.h
 * NOTE: EC_RO and EC_RW must start at CONFIG_FLASH_ERASE_SIZE or
 * greater aligned boundaries.
 */
/* Loader / lfw image immediately follows the boot header on SPI */
/* RO image immediately follows the loader image */
/*
 * RW image starts at offset 0 of second half of SPI.
 * RW Header not needed.
 */
/************************************************************************/
/* Customize the build */
/* Optional features present on this chip */
/*
 * Enable configuration after ESPI_RESET# de-asserts
 */
/*
 * Enable CPRINT in chip eSPI module
 * Define at board level.
 */
/*
 * Enable EC UART commands in eSPI module useful for debugging.
 */
/*
 * Enable CPRINT debug messages in LPC module
 */
/*
 * Define this to use MEC1701 ROM SPI read API
 * in little firmware module instead of SPI code
 * from this module
 */
/*
 * Use DMA when transmitting commands & data
 * with GPSPI controllers.
 */
/*
 * Use DMA when transmitting command & data of length
 * greater than QMSPI TX FIFO size.
 */
/*
 * Board level gpio.inc is using MCHP data sheet GPIO pin
 * numbers which are octal.
 * MCHP has 6 banks/ports each containing 32 GPIO's.
 * Each bank/port is connected to a GIRQ.
 * Port numbering:
 * GPIO_015 = 13 decimal. Port = 13/32 = 0, bit = 13 % 32 = 13
 * GPIO_0123 = 83 decimal. Port 83/32 = 2, bit = 83 % 32 = 19
 * OR port = 0123 >> 5, bit = 0123 & 037(0x1F) = 023 = 19 decimal.
 * You must use octal GPIO numbers in PIN(gpio_num) macro in
 * gpio.inc files.
 * Example: GPIO 211 in documentation 0211 = 137 = 0x89
 * GPIO(PCH_SLP_S0_L, PIN(0211), GPIO_INPUT | GPIO_PULL_DOWN)
 * OR
 * GPIO(PCH_SLP_S0_L, PIN(0x89), GPIO_INPUT | GPIO_PULL_DOWN)
 */
/* Copyright 2017 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/*
 * Microchip Evaluation Board (EVB) with
 * MEC1701H 144-pin processor card.
 * EVB connected to Intel SKL RVP3 configured
 * for eSPI with Kabylake silicon.
 */
/*
 * Initial board bringup and prevent power button task from
 * generating event to exit G3 state.
 *
 * #define CONFIG_BRINGUP
 */
/* Keyboard features */
/* #define CONFIG_PWM_KBLIGHT */
/* #define CONFIG_KEYBOARD_DEBUG */
/* #define CONFIG_CUSTOMER_PORT80 */
/*
 * Mouse emulation
 */
/*
 * Combination key
 */
/* The Fn key function not ready yet undefined it until the function finish */
/*Assume we should move to CONFIG_PWM_KBLIGHT later*/
/*
 * Debug on EVB with CONFIG_CHIPSET_DEBUG
 * Keep WDG disabled and JTAG enabled.
 * CONFIG_BOARD_PRE_INIT enables JTAG early
 */
/* #define CONFIG_CHIPSET_DEBUG */
/* Add commands to read/write ec serial data structure */
/*
 * DEBUG: Add CRC32 in last 4 bytes of EC_RO/RW binaries
 * in SPI. LFW will use DMA CRC32 HW to check data integrity.
 * #define CONFIG_MCHP_LFW_DEBUG
 */
/*
 * Override Boot-ROM JTAG mode
 * 0x01 = 4-pin standard JTAG
 * 0x03 = ARM 2-pin SWD + 1-pin SWV
 * 0x05 = ARM 2-pin SWD no SWV
 */
/*
 * Enable Trace FIFO Debug port
 * When this is undefined all TRACEn() and tracen()
 * macros are defined as blank.
 * Uncomment this define to enable these messages.
 * Only enable if GPIO's 0171 & 0171 are available therefore
 * define this at the board level.
 */
/* #define CONFIG_MCHP_TFDP */
/*
 * Enable MCHP specific GPIO EC UART commands
 * for debug.
 */
/*
 * Enable CPRINT in chip eSPI module
 * and EC UART test command.
 */
/* #define CONFIG_MCHP_ESPI_DEBUG */
/*
 * Enable board specific ISR on ALL_SYS_PWRGD signal.
 * Requires for handling Kabylake/Skylake RVP3 board's
 * ALL_SYS_PWRGD signal.
 */
/* #define CONFIG_BOARD_EC_HANDLES_ALL_SYS_PWRGD */
/*
 * EVB eSPI test mode (no eSPI master connected)
 */
/*
 * #define EVB_NO_ESPI_TEST_MODE
 */
/*
 * DEBUG
 * Disable ARM Cortex-M4 write buffer so
 * exceptions become synchronous.
 *
 * #define CONFIG_DEBUG_DISABLE_WRITE_BUFFER
 */
/* New eSPI slave configuration items */
/*
 * Maximum clock frequence eSPI EC slave advertises
 * Values in MHz are 20, 25, 33, 50, and 66
 */
/* KBL + EVB fly-wire hook up only supports 20MHz */
/*
 * EC eSPI slave advertises IO lanes
 * 0 = Single
 * 1 = Single and Dual
 * 2 = Single and Quad
 * 3 = Single, Dual, and Quad
 */
/* KBL + EVB fly-wire hook up only support Single mode */
/*
 * Bit map of eSPI channels EC advertises
 * bit[0] = 1 Peripheral channel
 * bit[1] = 1 Virtual Wire channel
 * bit[2] = 1 OOB channel
 * bit[3] = 1 Flash channel
 */
/*
 * Allow dangerous commands.
 * TODO(shawnn): Remove this config before production.
 */
/* Optional features */
/* #define CONFIG_CHARGE_RAMP_SW */
/* Charger parameter */
/*
 * MCHP disable this for Kabylake eSPI bring up
 * #define CONFIG_CHARGER_MIN_BAT_PCT_FOR_POWER_ON 1
 */
/* #define CONFIG_CHIPSET_SKYLAKE */
/* #define CONFIG_CHIPSET_TIGERLAKE */
/* #define CONFIG_HOSTCMD_PD */
/* #define CONFIG_HOSTCMD_PD_PANIC */
/* i2c hid interface for HID mediakeys (brightness, airplane mode) */
/* Leds configuration */
/*
 * Enable MCHP Low Power Idle support
 * and API to power down pins
 * #define CONFIG_LOW_POWER_IDLE
 */
/* #define CONFIG_GPIO_POWER_DOWN */
/*
 * Turn off pin modules during deep sleep.
 * Requires CONFIG_GPIO_POWER_DOWN
 */
/* #define CONFIG_MCHP_DEEP_SLP_GPIO_PWR_DOWN */
/*
 * DEBUG: Configure MEC17xx GPIO060 as 48MHZ_OUT to
 * verify & debug clock is shutdown in heavy sleep.
 */
/*#define CONFIG_MCHP_48MHZ_OUT*/
/*
 * DEBUG: Save and print out PCR sleep enables,
 * clock required, and interrupt aggregator result
 * registers.
 */
/*
 * MCHP debug EC code turn off GCC link-time-optimization
 * #define CONFIG_LTO
 */
/*
 * Use for customer boot from G3
 */
/*
 * MEC1701H SCI is virtual wire on eSPI
 *#define CONFIG_SCI_GPIO GPIO_PCH_SCI_L
 */
/*
 * #define CONFIG_USB_PD_TCPC
 * #define CONFIG_USB_PD_TCPM_STUB
 */
/* TODO FRAMEWORK 
#define CONFIG_VBOOT_HASH
*/
/*
 * MEC1701H loads firmware using QMSPI controller
 * CONFIG_SPI_FLASH_PORT is the index into
 * spi_devices[] in board.c
 */
/*
 * MB use W25Q80 SPI ROM
 * Size : 1M
 */
/*
 * Enable extra SPI flash and generic SPI
 * commands via EC UART
 */
/* common software SHA256 required by vboot and rollback */
/* Enable EMI0 Region 1 */
/*
 * Battery Protect
 */
/* EC's thresholds. 3%: boot, 2%: no boot. Required for soft sync. */
/*
 * Enable MCHP SHA256 hardware accelerator module.
 * API is same as software SHA256 but prefixed with "chip_"
 * #define CONFIG_SHA256_HW
 */
/* enable console command to test HW Hash engine
 * #define CONFIG_CMD_SHA256_TEST
 */
/* Support PWM */
/* Support FAN */
/* Factory mode support */
/* SPI Accelerometer
 * CONFIG_SPI_FLASH_PORT is the index into
 * spi_devices[] in board.c
 */
/*#define CONFIG_SPI_ACCEL_PORT 1*/
/*
 * Enable EC UART commands to read/write
 * motion sensor.
 */
/*#define CONFIG_CMD_ACCELS*/
/*
 * Enable 1 slot of secure temporary storage to support
 * suspend/resume with read/write memory training.
 */
/*
 * Macros for GPIO signals used in common code that don't match the
 * schematic names. Signal names in gpio.inc match the schematic and are
 * then redefined here to so it's more clear which signal is being used for
 * which purpose.
 */
/* LED signals */
/*
#define GPIO_BAT_LED_RED    GPIO_BATT_LOW_LED_L
#define GPIO_BAT_LED_GREEN  GPIO_BATT_CHG_LED_L
*/
/* Power signals */
/* SMBus signals */
/* EVT - DVT cover */
/* I2C ports */
/*
 * Map I2C Ports to Controllers for this board.
 *
 * I2C Controller 0 ---- Port 0 -> PMIC, USB Charger 2
 *                   |-- Port 2 -> USB Charger 1, USB Mux
 *
 * I2C Controller 1 ---- Port 3 -> PD MCU, TCPC
 * I2C Controller 2 ---- Port 4 -> ALS, Accel
 * I2C Controller 3 ---- Port 5 -> Battery, Charger
 *
 * All other ports set to 0xff (not used)
 */
/* GPIO for power signal */
/* Thermal sensors read through PMIC ADC interface */
/* Ambient Light Sensor address */
/* Modules we want to exclude */
/* #undef CONFIG_CONSOLE_CMDHELP */
/*
 * Define CONFIG_HOST_ESPI_VW_POWER_SIGNAL if any power signals from the host
 * are configured as virtual wires.
 */
/******************************************************************************/
/*
 * If CONFIG_USB_POWER_DELIVERY is enabled, make sure either
 * CONFIG_USB_PD_TCPMV1 or CONFIG_USB_PD_TCPMV2 is enabled but not both. Also
 * make sure CONFIG_USB_PD_DECODE_SOP is enabled with CONFIG_USB_PD_TCPMV2
 */
/******************************************************************************/
/*
 * If CONFIG_USB_PD_USB4 is enabled, make sure CONFIG_USBC_SS_MUX and
 * CONFIG_USB_PD_ALT_MODE_DFP is enabled
 */
/******************************************************************************/
/*
 * Automatically define CONFIG_USB_PD_FRS if FRS is enabled in the TCPC or PPC
 */
/******************************************************************************/
/* Disable extended message support if PD 3.0 support is disabled. */
/******************************************************************************/
/*
 * PD 3.0 only retries in TCPC hardware twice (for a total of 3 attempts), while
 * PD 2.0 retires three times (for a total of 4 attempts).
 *
 * Note must be [0-3] since it must fit within 2 bits.
 */
/******************************************************************************/
/*
 * Ensure that CONFIG_USB_PD_TCPMV2 is being used with exactly one device type
 */
/******************************************************************************/
/*
 * Automatically define CONFIG_HOSTCMD_X86 if either child option is defined.
 * Ensure LPC and eSPI are mutually exclusive
 */
/******************************************************************************/
/*
 * Set default code ram size unless it's customized by the chip.
 */
/******************************************************************************/
/*
 * Set default data ram size unless it's customized by the chip.
 */
/* Automatic configuration of RAM banks **************************************/
/* Assume one RAM bank if not specified, auto-compute number of banks        */
/******************************************************************************/
/*
 * Store panic data at end of memory by default, unless otherwise
 * configured.  This is safe because we don't context switch away from
 * the panic handler before rebooting, and stacks and data start at
 * the beginning of RAM.
 */
/******************************************************************************/
/*
 * Set minimum shared memory size, unless it is defined in board file.
 */
/* If RWSIG is used, we may need more space. */
/*
 * We can't use the "MAX" function here, as it is too smart and BUILD_ASSERT
 * calls do not allow it as parameter. BUILD_MAX below works for both compiler
 * and linker.
 */
/* Minimum: 1kb */
/******************************************************************************/
/*
 * Disable the built-in console history if using the experimental console.
 *
 * The experimental console keeps its own session-persistent history which
 * survives EC reboot.  It also requires CRC8 for command integrity.
 */
/******************************************************************************/
/*
 * Automatically define common CONFIG_BOARD_VERSION if any specific option is
 * used.
 */
/******************************************************************************/
/*
 * Thermal throttling AP must have temperature sensor enabled to get
 * the temperature readings.
 */
/******************************************************************************/
/*
 * DPTF must have temperature sensor enabled to get the readings for
 * generating DPTF thresholds events.
 */
/******************************************************************************/
/* The Matrix Keyboard Protocol depends on MKBP events. */
/******************************************************************************/
/* MKBP events delivery methods. */
/******************************************************************************/
/* Set generic orientation config if a specific orientation config is set. */
/*****************************************************************************/
/* Define CONFIG_BATTERY if board has a battery. */
/*****************************************************************************/
/* Define CONFIG_USBC_PPC if board has a USB Type-C Power Path Controller. */
/* The TI SN5S330 supports VCONN and needs to be informed of CC polarity */
/* The SYV682X supports VCONN and needs to be informed of CC polarity */
/*****************************************************************************/
/*
 * Define CONFIG_USB_PD_VBUS_MEASURE_CHARGER if the charger on the board
 * supports VBUS measurement.
 */
/*****************************************************************************/
/*
 * Define CONFIG_USB_PD_VBUS_MEASURE_TCPC if the tcpc on the board supports
 * VBUS measurement.
 */
/*****************************************************************************/
/*
 * Define CONFIG_USB_PD_TCPC_ON_CHIP if we use ITE series TCPM driver
 * on the board.
 */
/*****************************************************************************/
/*
 * Define CONFIG_CHARGER_NARROW_VDC for chargers that use a Narrow VDC power
 * architecture.
 */
/*****************************************************************************/
/*
 * Define CONFIG_BUTTON_TRIGGERED_RECOVERY if a board has a dedicated recovery
 * button.
 */
/*****************************************************************************/
/*
 * Define derived configuration options for EC-EC communication
 */
/*****************************************************************************/
/* Define derived USB PD Discharge common path */
/*****************************************************************************/
/* Define derived config options for DP HPD GPIO */
/*****************************************************************************/
/* Define derived thermistor common path */
/*****************************************************************************/
/* Define derived config options for BC1.2 detection */
/*****************************************************************************/
/*
 * Define CONFIG_LIBCRYPTOC if a board needs to read secret data from the
 * anti-rollback block.
 */
/*****************************************************************************/
/* Fingerprint Sensor Configuration */
/*****************************************************************************/
/*
 * Handle task-dependent configs.
 *
 * This prevent sub-modules from being compiled when the task and parent module
 * are not present.
 */
/*
 * If a board has a chipset task, set the minimum charger power required for
 * powering on to 15W.  This is also the highest power discovered over Type-C by
 * analog signaling.  The EC normally does not communicate using USB PD when the
 * system is locked and in RO, so it would not be able to tell if higher power
 * is available.  However, if a 15W charger is discovered, it's likely that the
 * charger does speak USB PD and we would be able to negotiate more power after
 * booting the AP and jumping to EC RW.
 *
 * If a board needs more or less power to power on, they can re-define this
 * value in their board.h file.
 */
/*
 * The function of MEASURE_BATTERY_IMBALANCE and these variables is to prevent a
 * battery brownout when the management IC reports a state of charge that is
 * higher than CHARGER_MIN_BAT_PCT_FOR_POWER_ON, but an individual cell is lower
 * than the rest of the pack.  The critical term is MAX_IMBALANCE_MV, which must
 * be small enough to ensure that the system can reliably boot even when the
 * battery total state of charge barely passes the
 * CHARGER_MIN_BAT_PCT_FOR_POWER_ON threshold.
 *
 * Lowering CHARGER_MIN_BAT_PCT_IMBALANCED_POWER_ON below
 * CHARGER_MIN_BAT_PCT_FOR_POWER_ON disables this check.  Raising it too high
 * may needlessly prevent boot when the lowest cell can still support the
 * system.
 *
 * As this term is lowered and BATTERY_MAX_IMBALANCE_MV is raised, the risk of
 * cell-undervoltage brownout during startup increases.  Raising this term and
 * lowering MAX_IMBALANCE_MV increases the risk of poor UX when the user must
 * wait longer to turn on their device.
 */
/*
 * WAG.  Imbalanced battery packs in this situation appear to have balanced
 * charge very quickly after beginning the charging cycle, since dV/dQ rapidly
 * decreases as the cell is charged out of deep discharge.  Increasing the value
 * of CHARGER_MIN_BAT_PCT_IMBALANCED_POWER_ON will make a system tolerant of
 * larger values of BATTERY_MAX_IMBALANCE_MV.
 */
/* Certain console cmds are irrelevant without parent modules. */
/*****************************************************************************/
/* Define derived Chipset configs */
/*****************************************************************************/
/*
 * Automatically define CONFIG_ACCEL_LIS2D_COMMON if a child option is defined.
 */
/*
 * Automatically define CONFIG_ACCEL_LIS2DW_COMMON if a child option is defined.
 */
/*
 * CONFIG_ACCEL_LIS2DW12 and CONFIG_ACCEL_LIS2DWL can't be defined at the same
 * time.
 */
/*****************************************************************************/
/* Define derived seven segment display common path */
/*****************************************************************************/
/* Enable PCIE tunneling if the board supports Thunderbolt-Compatible mode */
/*
 * CONFIG_CHIP_INIT_ROM_REGION requires that the chip has defined a
 * ROM resident region to store the .init_rom section.
 *
 * These sections must also not be zero bytes, which will happen if
 * the program size is the same as the flash size.
 */
/*****************************************************************************/
/*
 * Apply fuzzer and test config overrides last, since fuzzers and tests need to
 * override some of the config flags in non-standard ways to mock only parts of
 * the system.
 */
/* Copyright 2018 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* Fuzzer target config flags */
/* Copyright 2013 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* Per-test config flags */
/* Test config flags only apply for test builds */
/*
 * Validity checks to make sure some of the configs above make sense.
 */
/* Enable BMI secondary port if needed. */
/* Enable LSM2MDL secondary port if needed. */
/* Load LIS2MDL driver if needed */
/* Load BMM150 driver if needed */
/* Verify sensorhub is enabled */
/* Fill LPC sense data on X86 architecture. */
/*
 * TODO(crbug.com/888109): Makes sure RDP as PSTATE is only enabled where it
 * makes sense.
 */
/*
 * Define the timeout in milliseconds between when the EC receives a suspend
 * command and when the EC times out and asserts wake because the sleep signal
 * SLP_S0 did not assert.
 */
/*****************************************************************************/
/* ISH power management related definitions */
/*
 * If USB PD Discharge is enabled, verify that CONFIG_USB_PD_DISCHARGE_GPIO
 * and CONFIG_USB_PD_PORT_MAX_COUNT, CONFIG_USB_PD_DISCHARGE_TCPC, or
 * CONFIG_USB_PD_DISCHARGE_PPC is defined.
 */
/* EC Codec Wake-on-Voice related definitions */
/* Set default values for accelerometer calibration if not defined. */
/*
 *  Vivaldi keyboard code to be enabled only if board has selected
 *  CONFIG_KEYBOARD_PROTOCOL_8042 and not disabled CONFIG_KEYBOARD_VIVALDI
 *  explicitly
 */
/******************************************************************************/
/* Check body detection setup */
/* Copyright 2017 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* Copyright 2016 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/*
 * config.h - Top-level configuration Chrome EC
 *
 * All configuration settings (CONFIG_*) are defined in this file or in a
 * sub-configuration file (config_chip.h, board.h, etc.) included by this file.
 *
 * Note that this file is included by assembly (.S) files.  Any C-isms such as
 * struct definitions or enums in a sub-configuration file MUST be guarded with
 * #ifndef __ASSEMBLER__ to prevent those C-isms from being evaluated by the
 * assembler.
 */
/* Copyright 2014 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/* Copyright 2016 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
/*
 * config.h - Top-level configuration Chrome EC
 *
 * All configuration settings (CONFIG_*) are defined in this file or in a
 * sub-configuration file (config_chip.h, board.h, etc.) included by this file.
 *
 * Note that this file is included by assembly (.S) files.  Any C-isms such as
 * struct definitions or enums in a sub-configuration file MUST be guarded with
 * #ifndef __ASSEMBLER__ to prevent those C-isms from being evaluated by the
 * assembler.
 */
/*
 * The signer puts the public key and signature into the RO and RW images
 * (respectively) at known locations after the complete image is assembled. But
 * since we compile the RO & RW images separately, the other image's addresses
 * can't be computed by the linker. So we just hardcode the addresses here.
 * These can be overridden in board.h files if desired.
 */
/*
 * usbpd1 type assumes pubkey location at the end of first half of flash,
 * which might actually be in the PSTATE region.
 */
/* The signature resides at the end of each RW copy */
/* Assume the layout is same as RW_A and it sits right after RW_A */
/*
 * Define the VMA (virtual memory address) of the ROM_RESIDENT region within
 * the EC image. This is full 32-bit address starting from
 * CONFIG_PROGRAM_MEMORY_BASE.
 */
/*
 * Define the VMA (virtual memory address) of the ROM_RESIDENT region.  Instead
 * of a full 32-bit address, set the VMA to be an offset within the flash memory
 * section.  Objects linked into this section can pass the address of the
 * object unmodified to the public APIs of the flash and init_rom modules.
 */
/* Indicates where .data LMA should reside. */
OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(reset)
MEMORY
{
 FLASH (rx) : ORIGIN = (0x000E0000 + ((0 + 0x1000))), LENGTH = ((0x00120000 - 0x000E0000) - 0x00010000 - 0x1000)
 IRAM (rw) : ORIGIN = (0x00120000 - 0x00010000), LENGTH = 0x00010000
 CDRAM (rx) : ORIGIN = 0x000E0000 + ((0 + 0x1000)), LENGTH = ((0x00120000 - 0x000E0000) - 0x00010000 - 0x1000)
}
/*
 * Convenience macros for determining the correct output memory section.
 */
SECTIONS
{
 .text : {
  . = . + 0;
  *(.text.vecttable)
  . = ALIGN(4);
  __image_data_offset = .;
  KEEP(*(.rodata.ver))
  . = ALIGN(4);
  KEEP(*(.rodata.pstate))
  . = ALIGN(4);
  "build/hx20/RW/core/cortex-m/init.o" (.text)
  /* Keep hibernate utility in last code ram block */
  . = ALIGN(4);
  KEEP(*(.after_init))
  __after_init_end = .;
  *(.text*)
  . = ALIGN(4);
  __flash_lpfw_start = .;
  /* Entering deep idle FW for better power consumption */
  KEEP(*(.lowpower_ram))
  . = ALIGN(4);
  __flash_lpfw_end = .;
  __flash_lplfw_start = .;
  /* GDMA utilities for better FW download speed */
  KEEP(*(.lowpower_ram2))
  . = ALIGN(4);
  __flash_lplfw_end = .;
 } > CDRAM AT > FLASH
 . = ALIGN(4);
 .rodata : {
  /* Symbols defined here are declared in link_defs.h */
  __irqprio = .;
  KEEP(*(.rodata.irqprio))
  __irqprio_end = .;
  . = ALIGN(4);
  __cmds = .;
  KEEP(*(SORT(.rodata.cmds*)))
  __cmds_end = .;
  . = ALIGN(4);
  __extension_cmds = .;
  KEEP(*(.rodata.extensioncmds))
  __extension_cmds_end = .;
  . = ALIGN(4);
  __hcmds = .;
  KEEP(*(SORT(.rodata.hcmds*)))
  __hcmds_end = .;
  . = ALIGN(4);
  __mkbp_evt_srcs = .;
  KEEP(*(.rodata.evtsrcs))
  __mkbp_evt_srcs_end = .;
  . = ALIGN(4);
  __hooks_init = .;
  KEEP(*(.rodata.HOOK_INIT))
  __hooks_init_end = .;
  __hooks_pre_freq_change = .;
  KEEP(*(.rodata.HOOK_PRE_FREQ_CHANGE))
  __hooks_pre_freq_change_end = .;
  __hooks_freq_change = .;
  KEEP(*(.rodata.HOOK_FREQ_CHANGE))
  __hooks_freq_change_end = .;
  __hooks_sysjump = .;
  KEEP(*(.rodata.HOOK_SYSJUMP))
  __hooks_sysjump_end = .;
  __hooks_chipset_pre_init = .;
  KEEP(*(.rodata.HOOK_CHIPSET_PRE_INIT))
  __hooks_chipset_pre_init_end = .;
  __hooks_chipset_startup = .;
  KEEP(*(.rodata.HOOK_CHIPSET_STARTUP))
  __hooks_chipset_startup_end = .;
  __hooks_chipset_resume = .;
  KEEP(*(.rodata.HOOK_CHIPSET_RESUME))
  __hooks_chipset_resume_end = .;
  __hooks_chipset_suspend = .;
  KEEP(*(.rodata.HOOK_CHIPSET_SUSPEND))
  __hooks_chipset_suspend_end = .;
  __hooks_chipset_shutdown = .;
  KEEP(*(.rodata.HOOK_CHIPSET_SHUTDOWN))
  __hooks_chipset_shutdown_end = .;
  __hooks_chipset_shutdown_complete = .;
  KEEP(*(.rodata.HOOK_CHIPSET_SHUTDOWN_COMPLETE))
  __hooks_chipset_shutdown_complete_end = .;
  __hooks_chipset_reset = .;
  KEEP(*(.rodata.HOOK_CHIPSET_RESET))
  __hooks_chipset_reset_end = .;
  __hooks_ac_change = .;
  KEEP(*(.rodata.HOOK_AC_CHANGE))
  __hooks_ac_change_end = .;
  __hooks_lid_change = .;
  KEEP(*(.rodata.HOOK_LID_CHANGE))
  __hooks_lid_change_end = .;
  __hooks_tablet_mode_change = .;
  KEEP(*(.rodata.HOOK_TABLET_MODE_CHANGE))
  __hooks_tablet_mode_change_end = .;
  __hooks_base_attached_change = .;
  KEEP(*(.rodata.HOOK_BASE_ATTACHED_CHANGE))
  __hooks_base_attached_change_end = .;
  __hooks_pwrbtn_change = .;
  KEEP(*(.rodata.HOOK_POWER_BUTTON_CHANGE))
  __hooks_pwrbtn_change_end = .;
  __hooks_battery_soc_change = .;
  KEEP(*(.rodata.HOOK_BATTERY_SOC_CHANGE))
  __hooks_battery_soc_change_end = .;
  __hooks_tick = .;
  KEEP(*(.rodata.HOOK_TICK))
  __hooks_tick_end = .;
  __hooks_second = .;
  KEEP(*(.rodata.HOOK_SECOND))
  __hooks_second_end = .;
  __hooks_usb_pd_disconnect = .;
  KEEP(*(.rodata.HOOK_USB_PD_DISCONNECT))
  __hooks_usb_pd_disconnect_end = .;
  __hooks_usb_pd_connect = .;
  KEEP(*(.rodata.HOOK_USB_PD_CONNECT))
  __hooks_usb_pd_connect_end = .;
  __deferred_funcs = .;
  KEEP(*(.rodata.deferred))
  __deferred_funcs_end = .;
  __usb_desc = .;
  KEEP(*(.rodata.usb_desc_conf))
  KEEP(*(SORT(.rodata.usb_desc*)))
  __usb_desc_end = .;
  . = ALIGN(4);
  KEEP(*(.rodata.usb_ep))
  KEEP(*(.rodata.usb_ep.usb_ep_tx))
  KEEP(*(.rodata.usb_ep.usb_ep_rx))
  KEEP(*(.rodata.usb_ep.usb_ep_reset))
  KEEP(*(.rodata.usb_ep.usb_iface_request))
  . = ALIGN(4);
  *(.rodata*)
  /*
		 * When a separate ROM resident section isn't enabled, ensure
		 * the corresponding data objects are linked into the .rodata
		 * section.
		 */
  . = ALIGN(4);
  __init_rom_start = .;
  *(.init.rom)
  __init_rom_end = .;
  . = ALIGN(4);
 } > CDRAM AT > FLASH
 __data_lma_start = .;
 .bss : {
  /*
		 * Align to 512 bytes. This is convenient when some memory block
		 * needs big alignment. This is the beginning of the RAM,
		 * so there is usually no penalty on aligning this.
		 */
  . = ALIGN(512);
  __bss_start = .;
  *(.bss.big_align)
  /* Stacks must be 64-bit aligned */
  . = ALIGN(8);
  *(.bss.system_stack)
  /* Rest of .bss takes care of its own alignment */
  /* Group libtpm2 data so it can be cleared on system reset */
  __bss_libtpm2_start = .;
  /* TPM registers should be cleared at the same time */
  "build/hx20/RW/common/tpm_registers.o*"(.bss)
   *(.bss.Tpm2_common)
  __bss_libtpm2_end = .;
  *(.bss)
  /*
		 * Reserve space for deferred function firing times.
		 * Each time is a uint64_t, each func is a 32-bit pointer,
		 * thus the scaling factor of two. The 8 byte alignment of
		 * uint64_t is required by the ARM ABI.
		 */
  . = ALIGN(8);
  __deferred_until = .;
  . += (__deferred_funcs_end - __deferred_funcs) * (8 / 4);
  __deferred_until_end = .;
 } > IRAM
 .bss.slow : {
  /* Region of RAM reclaimed from the little firmware(LFW). */
  *(.bss.slow)
  /*
		 * Not replacing the loader, so .bss.slow is part of .bss.
		 * It needs to be followed by __bss_end so that .bss.slow
		 * will be zeroed by init.
		 */
  . = ALIGN(4);
  __bss_end = .;
 } > IRAM
 .data : {
  . = ALIGN(4);
  __data_start = .;
  *(.data.tasks)
  /*
		 * Group libtpm2 data so it can be reinitialized on
		 * system reset
		 */
  __data_libtpm2_start = .;
  Tpm2_*(.data)
  /* TPM registers should be reinitialized at the same time */
  "build/hx20/RW/common/tpm_registers.o*"(.data)
  __data_libtpm2_end = .;
  /*
		 * TPM reset currently only clears BSS for the TPM library.
		 * It does not reset any initialized variables in data.
		 * So, make sure there aren't any.
		 */
  ASSERT(__data_libtpm2_start == __data_libtpm2_end,
         "libtpm2 .data section is nonzero");
  *(.data*)
  . = ALIGN(4);
  *(.iram.text)
  . = ALIGN(4);
  __data_end = .;
  /*
		 * Shared memory buffer must be at the end of preallocated
		 * RAM, so it can expand to use all the remaining RAM.
		 */
  __shared_mem_buf = .;
  /* NOTHING MAY GO AFTER THIS! */
 } > IRAM AT > FLASH
 ASSERT((__shared_mem_buf + ((1024) > (0) ? (1024) : (0))) <=
        ((0x00120000 - 0x00010000) + 0x00010000),
        "Not enough space for shared memory.")
 __ram_free = ((0x00120000 - 0x00010000) + 0x00010000) -
       (__shared_mem_buf + ((1024) > (0) ? (1024) : (0)));
 /*
	 * .data is included in the EC image and copied to RAM by the loader.
	 */
 /*
	 * __flash_used is used in flash free calculations by the makefile.
	 * __image_size is stored in the struct image_data header and used
	 * in hash calcuations.
	 */
 __flash_used = (LOADADDR(.data) + SIZEOF(.data)) - ORIGIN(FLASH);
 __image_size = __flash_used;
        /*
         * These linker labels are just for analysis and not used in the code.
         */
 __config_flash_size = 0x100000;
 __config_ro_size = ((0x00120000 - 0x000E0000) - 0x00010000 - 0x1000);
 __config_ec_protected_storage_size = 0x40000;
 __config_rw_size = ((0x00120000 - 0x000E0000) - 0x00010000 - 0x1000);
 __config_ec_writable_storage_size = 0x40000;
 /*
	 * The linker won't notice if the .data section is too big to fit,
	 * apparently because we're sending it into IRAM, not FLASH.
	 * Verify that all sections linked into the FLASH region will fit.
	 */
 ASSERT((LENGTH(FLASH)
        ) >= __flash_used,
        "No room left in the flash")
 /DISCARD/ : { *(.google) }
 /DISCARD/ : { *(.ARM.*) }
}
