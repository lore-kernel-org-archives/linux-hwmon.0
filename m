Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (nct6775) Add support for NCT6796D
Date: Wed, 21 Feb 2018 13:09:39 -0800
Message-Id: <1519247379-29443-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
References: <1519247379-29443-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

NCT6796D is mostly compatible to NCT6795D. It supports an additional
pwm control and fan speed channel.

While we are at it, update documentation for NCT6795D.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/nct6775 |  56 ++++++++-------
 drivers/hwmon/Kconfig       |   5 +-
 drivers/hwmon/nct6775.c     | 172 +++++++++++++++++++++++++++++++-------------
 3 files changed, 157 insertions(+), 76 deletions(-)

diff --git a/Documentation/hwmon/nct6775 b/Documentation/hwmon/nct6775
index 76add4c9cd68..bd59834d310f 100644
--- a/Documentation/hwmon/nct6775
+++ b/Documentation/hwmon/nct6775
@@ -36,6 +36,14 @@ Supported chips:
     Prefix: 'nct6793'
     Addresses scanned: ISA address retrieved from Super I/O registers
     Datasheet: Available from Nuvoton upon request
+  * Nuvoton NCT6795D
+    Prefix: 'nct6795'
+    Addresses scanned: ISA address retrieved from Super I/O registers
+    Datasheet: Available from Nuvoton upon request
+  * Nuvoton NCT6796D
+    Prefix: 'nct6796'
+    Addresses scanned: ISA address retrieved from Super I/O registers
+    Datasheet: Available from Nuvoton upon request
 
 Authors:
         Guenter Roeck <linux@roeck-us.net>
@@ -88,10 +96,10 @@ The mode works for fan1-fan5.
 sysfs attributes
 ----------------
 
-pwm[1-5] - this file stores PWM duty cycle or DC value (fan speed) in range:
+pwm[1-7] - this file stores PWM duty cycle or DC value (fan speed) in range:
 	   0 (lowest speed) to 255 (full)
 
-pwm[1-5]_enable - this file controls mode of fan/temperature control:
+pwm[1-7]_enable - this file controls mode of fan/temperature control:
 	* 0 Fan control disabled (fans set to maximum speed)
 	* 1 Manual mode, write to pwm[0-5] any value 0-255
 	* 2 "Thermal Cruise" mode
@@ -99,16 +107,16 @@ pwm[1-5]_enable - this file controls mode of fan/temperature control:
 	* 4 "Smart Fan III" mode (NCT6775F only)
 	* 5 "Smart Fan IV" mode
 
-pwm[1-5]_mode - controls if output is PWM or DC level
+pwm[1-7]_mode - controls if output is PWM or DC level
         * 0 DC output
         * 1 PWM output
 
 Common fan control attributes
 -----------------------------
 
-pwm[1-5]_temp_sel	Temperature source. Value is temperature sensor index.
+pwm[1-7]_temp_sel	Temperature source. Value is temperature sensor index.
 			For example, select '1' for temp1_input.
-pwm[1-5]_weight_temp_sel
+pwm[1-7]_weight_temp_sel
 			Secondary temperature source. Value is temperature
 			sensor index. For example, select '1' for temp1_input.
 			Set to 0 to disable secondary temperature control.
@@ -116,16 +124,16 @@ pwm[1-5]_weight_temp_sel
 If secondary temperature functionality is enabled, it is controlled with the
 following attributes.
 
-pwm[1-5]_weight_duty_step
+pwm[1-7]_weight_duty_step
 			Duty step size.
-pwm[1-5]_weight_temp_step
+pwm[1-7]_weight_temp_step
 			Temperature step size. With each step over
 			temp_step_base, the value of weight_duty_step is added
 			to the current pwm value.
-pwm[1-5]_weight_temp_step_base
+pwm[1-7]_weight_temp_step_base
 			Temperature at which secondary temperature control kicks
 			in.
-pwm[1-5]_weight_temp_step_tol
+pwm[1-7]_weight_temp_step_tol
 			Temperature step tolerance.
 
 Thermal Cruise mode (2)
@@ -133,9 +141,9 @@ Thermal Cruise mode (2)
 
 If the temperature is in the range defined by:
 
-pwm[1-5]_target_temp	Target temperature, unit millidegree Celsius
+pwm[1-7]_target_temp	Target temperature, unit millidegree Celsius
 			(range 0 - 127000)
-pwm[1-5]_temp_tolerance
+pwm[1-7]_temp_tolerance
 			Target temperature tolerance, unit millidegree Celsius
 
 there are no changes to fan speed. Once the temperature leaves the interval, fan
@@ -143,14 +151,14 @@ speed increases (if temperature is higher that desired) or decreases (if
 temperature is lower than desired), using the following limits and time
 intervals.
 
-pwm[1-5]_start		fan pwm start value (range 1 - 255), to start fan
+pwm[1-7]_start		fan pwm start value (range 1 - 255), to start fan
 			when the temperature is above defined range.
-pwm[1-5]_floor		lowest fan pwm (range 0 - 255) if temperature is below
+pwm[1-7]_floor		lowest fan pwm (range 0 - 255) if temperature is below
 			the defined range. If set to 0, the fan is expected to
 			stop if the temperature is below the defined range.
-pwm[1-5]_step_up_time	milliseconds before fan speed is increased
-pwm[1-5]_step_down_time	milliseconds before fan speed is decreased
-pwm[1-5]_stop_time	how many milliseconds must elapse to switch
+pwm[1-7]_step_up_time	milliseconds before fan speed is increased
+pwm[1-7]_step_down_time	milliseconds before fan speed is decreased
+pwm[1-7]_stop_time	how many milliseconds must elapse to switch
 			corresponding fan off (when the temperature was below
 			defined range).
 
@@ -159,8 +167,8 @@ Speed Cruise mode (3)
 
 This modes tries to keep the fan speed constant.
 
-fan[1-5]_target		Target fan speed
-fan[1-5]_tolerance
+fan[1-7]_target		Target fan speed
+fan[1-7]_tolerance
 			Target speed tolerance
 
 
@@ -177,19 +185,19 @@ points should be set to higher temperatures and higher pwm values to achieve
 higher fan speeds with increasing temperature. The last data point reflects
 critical temperature mode, in which the fans should run at full speed.
 
-pwm[1-5]_auto_point[1-7]_pwm
+pwm[1-7]_auto_point[1-7]_pwm
 			pwm value to be set if temperature reaches matching
 			temperature range.
-pwm[1-5]_auto_point[1-7]_temp
+pwm[1-7]_auto_point[1-7]_temp
 			Temperature over which the matching pwm is enabled.
-pwm[1-5]_temp_tolerance
+pwm[1-7]_temp_tolerance
 			Temperature tolerance, unit millidegree Celsius
-pwm[1-5]_crit_temp_tolerance
+pwm[1-7]_crit_temp_tolerance
 			Temperature tolerance for critical temperature,
 			unit millidegree Celsius
 
-pwm[1-5]_step_up_time	milliseconds before fan speed is increased
-pwm[1-5]_step_down_time	milliseconds before fan speed is decreased
+pwm[1-7]_step_up_time	milliseconds before fan speed is increased
+pwm[1-7]_step_down_time	milliseconds before fan speed is decreased
 
 Usage Notes
 -----------
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index ef23553ff5cb..15bc62ac5749 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1219,8 +1219,9 @@ config SENSORS_NCT6775
 	help
 	  If you say yes here you get support for the hardware monitoring
 	  functionality of the Nuvoton NCT6106D, NCT6775F, NCT6776F, NCT6779D,
-	  NCT6791D, NCT6792D, NCT6793D, and compatible Super-I/O chips. This
-	  driver replaces the w83627ehf driver for NCT6775F and NCT6776F.
+	  NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D, and compatible
+	  Super-I/O chips. This driver replaces the w83627ehf driver for
+	  NCT6775F and NCT6776F.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called nct6775.
diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 5662b23dbffa..fdf24f008d75 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -41,7 +41,7 @@
  * nct6792d    15      6       6       2+6    0xc910 0xc1    0x5ca3
  * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
  * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
- *
+ * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -68,7 +68,7 @@
 #define USE_ALTERNATE
 
 enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
-	     nct6795 };
+	     nct6795, nct6796 };
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
@@ -80,6 +80,7 @@ static const char * const nct6775_device_names[] = {
 	"nct6792",
 	"nct6793",
 	"nct6795",
+	"nct6796",
 };
 
 static const char * const nct6775_sio_names[] __initconst = {
@@ -91,6 +92,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6792D",
 	"NCT6793D",
 	"NCT6795D",
+	"NCT6796D",
 };
 
 static unsigned short force_id;
@@ -125,6 +127,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6792_ID		0xc910
 #define SIO_NCT6793_ID		0xd120
 #define SIO_NCT6795_ID		0xd350
+#define SIO_NCT6796_ID		0xd420
 #define SIO_ID_MASK		0xFFF0
 
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
@@ -201,7 +204,7 @@ superio_exit(int ioreg)
 #define NUM_REG_ALARM	7	/* Max number of alarm registers */
 #define NUM_REG_BEEP	5	/* Max number of beep registers */
 
-#define NUM_FAN		6
+#define NUM_FAN		7
 
 #define TEMP_SOURCE_VIRTUAL	0x1f
 
@@ -272,26 +275,26 @@ static const u8 NCT6775_PWM_MODE_MASK[] = { 0x01, 0x02, 0x01 };
 /* Advanced Fan control, some values are common for all fans */
 
 static const u16 NCT6775_REG_TARGET[] = {
-	0x101, 0x201, 0x301, 0x801, 0x901, 0xa01 };
+	0x101, 0x201, 0x301, 0x801, 0x901, 0xa01, 0xb01 };
 static const u16 NCT6775_REG_FAN_MODE[] = {
-	0x102, 0x202, 0x302, 0x802, 0x902, 0xa02 };
+	0x102, 0x202, 0x302, 0x802, 0x902, 0xa02, 0xb02 };
 static const u16 NCT6775_REG_FAN_STEP_DOWN_TIME[] = {
-	0x103, 0x203, 0x303, 0x803, 0x903, 0xa03 };
+	0x103, 0x203, 0x303, 0x803, 0x903, 0xa03, 0xb03 };
 static const u16 NCT6775_REG_FAN_STEP_UP_TIME[] = {
-	0x104, 0x204, 0x304, 0x804, 0x904, 0xa04 };
+	0x104, 0x204, 0x304, 0x804, 0x904, 0xa04, 0xb04 };
 static const u16 NCT6775_REG_FAN_STOP_OUTPUT[] = {
-	0x105, 0x205, 0x305, 0x805, 0x905, 0xa05 };
+	0x105, 0x205, 0x305, 0x805, 0x905, 0xa05, 0xb05 };
 static const u16 NCT6775_REG_FAN_START_OUTPUT[] = {
-	0x106, 0x206, 0x306, 0x806, 0x906, 0xa06 };
+	0x106, 0x206, 0x306, 0x806, 0x906, 0xa06, 0xb06 };
 static const u16 NCT6775_REG_FAN_MAX_OUTPUT[] = { 0x10a, 0x20a, 0x30a };
 static const u16 NCT6775_REG_FAN_STEP_OUTPUT[] = { 0x10b, 0x20b, 0x30b };
 
 static const u16 NCT6775_REG_FAN_STOP_TIME[] = {
-	0x107, 0x207, 0x307, 0x807, 0x907, 0xa07 };
+	0x107, 0x207, 0x307, 0x807, 0x907, 0xa07, 0xb07 };
 static const u16 NCT6775_REG_PWM[] = {
-	0x109, 0x209, 0x309, 0x809, 0x909, 0xa09 };
+	0x109, 0x209, 0x309, 0x809, 0x909, 0xa09, 0xb09 };
 static const u16 NCT6775_REG_PWM_READ[] = {
-	0x01, 0x03, 0x11, 0x13, 0x15, 0xa09 };
+	0x01, 0x03, 0x11, 0x13, 0x15, 0xa09, 0xb09 };
 
 static const u16 NCT6775_REG_FAN[] = { 0x630, 0x632, 0x634, 0x636, 0x638 };
 static const u16 NCT6775_REG_FAN_MIN[] = { 0x3b, 0x3c, 0x3d };
@@ -314,7 +317,7 @@ static const u16 NCT6775_REG_TEMP_SOURCE[ARRAY_SIZE(NCT6775_REG_TEMP)] = {
 	0x621, 0x622, 0x623, 0x624, 0x625, 0x626 };
 
 static const u16 NCT6775_REG_TEMP_SEL[] = {
-	0x100, 0x200, 0x300, 0x800, 0x900, 0xa00 };
+	0x100, 0x200, 0x300, 0x800, 0x900, 0xa00, 0xb00 };
 
 static const u16 NCT6775_REG_WEIGHT_TEMP_SEL[] = {
 	0x139, 0x239, 0x339, 0x839, 0x939, 0xa39 };
@@ -330,9 +333,9 @@ static const u16 NCT6775_REG_WEIGHT_TEMP_BASE[] = {
 static const u16 NCT6775_REG_TEMP_OFFSET[] = { 0x454, 0x455, 0x456 };
 
 static const u16 NCT6775_REG_AUTO_TEMP[] = {
-	0x121, 0x221, 0x321, 0x821, 0x921, 0xa21 };
+	0x121, 0x221, 0x321, 0x821, 0x921, 0xa21, 0xb21 };
 static const u16 NCT6775_REG_AUTO_PWM[] = {
-	0x127, 0x227, 0x327, 0x827, 0x927, 0xa27 };
+	0x127, 0x227, 0x327, 0x827, 0x927, 0xa27, 0xb27 };
 
 #define NCT6775_AUTO_TEMP(data, nr, p)	((data)->REG_AUTO_TEMP[nr] + (p))
 #define NCT6775_AUTO_PWM(data, nr, p)	((data)->REG_AUTO_PWM[nr] + (p))
@@ -340,9 +343,9 @@ static const u16 NCT6775_REG_AUTO_PWM[] = {
 static const u16 NCT6775_REG_CRITICAL_ENAB[] = { 0x134, 0x234, 0x334 };
 
 static const u16 NCT6775_REG_CRITICAL_TEMP[] = {
-	0x135, 0x235, 0x335, 0x835, 0x935, 0xa35 };
+	0x135, 0x235, 0x335, 0x835, 0x935, 0xa35, 0xb35 };
 static const u16 NCT6775_REG_CRITICAL_TEMP_TOLERANCE[] = {
-	0x138, 0x238, 0x338, 0x838, 0x938, 0xa38 };
+	0x138, 0x238, 0x338, 0x838, 0x938, 0xa38, 0xb38 };
 
 static const char *const nct6775_temp_label[] = {
 	"",
@@ -414,15 +417,15 @@ static const s8 NCT6776_BEEP_BITS[] = {
 	30, 31 };			/* intrusion0, intrusion1 */
 
 static const u16 NCT6776_REG_TOLERANCE_H[] = {
-	0x10c, 0x20c, 0x30c, 0x80c, 0x90c, 0xa0c };
+	0x10c, 0x20c, 0x30c, 0x80c, 0x90c, 0xa0c, 0xb0c };
 
 static const u8 NCT6776_REG_PWM_MODE[] = { 0x04, 0, 0, 0, 0, 0 };
 static const u8 NCT6776_PWM_MODE_MASK[] = { 0x01, 0, 0, 0, 0, 0 };
 
 static const u16 NCT6776_REG_FAN_MIN[] = {
-	0x63a, 0x63c, 0x63e, 0x640, 0x642, 0x64a };
+	0x63a, 0x63c, 0x63e, 0x640, 0x642, 0x64a, 0x64c };
 static const u16 NCT6776_REG_FAN_PULSES[] = {
-	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
+	0x644, 0x645, 0x646, 0x647, 0x648, 0x649, 0 };
 
 static const u16 NCT6776_REG_WEIGHT_DUTY_BASE[] = {
 	0x13e, 0x23e, 0x33e, 0x83e, 0x93e, 0xa3e };
@@ -497,15 +500,15 @@ static const s8 NCT6779_BEEP_BITS[] = {
 	30, 31 };			/* intrusion0, intrusion1 */
 
 static const u16 NCT6779_REG_FAN[] = {
-	0x4b0, 0x4b2, 0x4b4, 0x4b6, 0x4b8, 0x4ba };
+	0x4b0, 0x4b2, 0x4b4, 0x4b6, 0x4b8, 0x4ba, 0x660 };
 static const u16 NCT6779_REG_FAN_PULSES[] = {
-	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
+	0x644, 0x645, 0x646, 0x647, 0x648, 0x649, 0 };
 
 static const u16 NCT6779_REG_CRITICAL_PWM_ENABLE[] = {
-	0x136, 0x236, 0x336, 0x836, 0x936, 0xa36 };
+	0x136, 0x236, 0x336, 0x836, 0x936, 0xa36, 0xb36 };
 #define NCT6779_CRITICAL_PWM_ENABLE_MASK	0x01
 static const u16 NCT6779_REG_CRITICAL_PWM[] = {
-	0x137, 0x237, 0x337, 0x837, 0x937, 0xa37 };
+	0x137, 0x237, 0x337, 0x837, 0x937, 0xa37, 0xb37 };
 
 static const u16 NCT6779_REG_TEMP[] = { 0x27, 0x150 };
 static const u16 NCT6779_REG_TEMP_MON[] = { 0x73, 0x75, 0x77, 0x79, 0x7b };
@@ -709,6 +712,43 @@ static const char *const nct6795_temp_label[] = {
 
 #define NCT6795_TEMP_MASK	0xbfffff7e
 
+static const char *const nct6796_temp_label[] = {
+	"",
+	"SYSTIN",
+	"CPUTIN",
+	"AUXTIN0",
+	"AUXTIN1",
+	"AUXTIN2",
+	"AUXTIN3",
+	"AUXTIN4",
+	"SMBUSMASTER 0",
+	"SMBUSMASTER 1",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"PECI Agent 0",
+	"PECI Agent 1",
+	"PCH_CHIP_CPU_MAX_TEMP",
+	"PCH_CHIP_TEMP",
+	"PCH_CPU_TEMP",
+	"PCH_MCH_TEMP",
+	"PCH_DIM0_TEMP",
+	"PCH_DIM1_TEMP",
+	"PCH_DIM2_TEMP",
+	"PCH_DIM3_TEMP",
+	"BYTE_TEMP0",
+	"BYTE_TEMP1",
+	"PECI Agent 0 Calibration",
+	"PECI Agent 1 Calibration",
+	"",
+	"Virtual_TEMP"
+};
+
+#define NCT6796_TEMP_MASK	0xbfff03fe
+
 /* NCT6102D/NCT6106D specific data */
 
 #define NCT6106_REG_VBAT	0x318
@@ -1233,11 +1273,13 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6792:
 	case nct6793:
 	case nct6795:
+	case nct6796:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
 		  ((reg & 0xfff0) == 0x4b0 && (reg & 0x000f) < 0x0b) ||
 		  reg == 0x402 ||
 		  reg == 0x63a || reg == 0x63c || reg == 0x63e ||
 		  reg == 0x640 || reg == 0x642 || reg == 0x64a ||
+		  reg == 0x64c || reg == 0x660 ||
 		  reg == 0x73 || reg == 0x75 || reg == 0x77 || reg == 0x79 ||
 		  reg == 0x7b || reg == 0x7d;
 	}
@@ -1586,6 +1628,7 @@ static void nct6775_update_pwm_limits(struct device *dev)
 		case nct6792:
 		case nct6793:
 		case nct6795:
+		case nct6796:
 			reg = nct6775_read_value(data,
 					data->REG_CRITICAL_PWM_ENABLE[i]);
 			if (reg & data->CRITICAL_PWM_ENABLE_MASK)
@@ -2094,6 +2137,8 @@ static umode_t nct6775_fan_is_visible(struct kobject *kobj,
 		return 0;
 	if (nr == 2 && data->BEEP_BITS[FAN_ALARM_BASE + fan] == -1)
 		return 0;
+	if (nr == 3 && !data->REG_FAN_PULSES[fan])
+		return 0;
 	if (nr == 4 && !(data->has_fan_min & BIT(fan)))
 		return 0;
 	if (nr == 5 && data->kind != nct6775)
@@ -3006,6 +3051,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6792:
 		case nct6793:
 		case nct6795:
+		case nct6796:
 			nct6775_write_value(data, data->REG_CRITICAL_PWM[nr],
 					    val);
 			reg = nct6775_read_value(data,
@@ -3361,9 +3407,9 @@ static void
 nct6775_check_fan_inputs(struct nct6775_data *data)
 {
 	bool fan3pin = false, fan4pin = false, fan4min = false;
-	bool fan5pin = false, fan6pin = false;
+	bool fan5pin = false, fan6pin = false, fan7pin = false;
 	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
-	bool pwm6pin = false;
+	bool pwm6pin = false, pwm7pin = false;
 	int sioreg = data->sioreg;
 	int regval;
 
@@ -3424,8 +3470,9 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		regval = superio_inb(sioreg, 0x24);
 		fan3pin = !(regval & 0x80);
 		pwm3pin = regval & 0x08;
-	} else { /* NCT6779D, NCT6791D, NCT6792D, NCT6793D, or NCT6795D */
-		int regval_1b, regval_2a, regval_2f, regval_eb;
+	} else {
+		/* NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D */
+		int regval_1b, regval_2a, regval_2f;
 		bool dsw_en;
 
 		regval = superio_inb(sioreg, 0x1c);
@@ -3447,6 +3494,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			break;
 		case nct6793:
 		case nct6795:
+		case nct6796:
 			regval_1b = superio_inb(sioreg, 0x1b);
 			regval_2a = superio_inb(sioreg, 0x2a);
 			regval_2f = superio_inb(sioreg, 0x2f);
@@ -3458,24 +3506,27 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			if (!fan5pin)
 				fan5pin = regval_1b & BIT(5);
 
-			if (!dsw_en) {
-				fan6pin = regval & BIT(1);
-				pwm6pin = regval & BIT(0);
+			superio_select(sioreg, NCT6775_LD_12);
+			if (data->kind != nct6796) {
+				int regval_eb = superio_inb(sioreg, 0xeb);
+
+				if (!dsw_en) {
+					fan6pin = regval & BIT(1);
+					pwm6pin = regval & BIT(0);
+				}
+
+				if (!fan5pin)
+					fan5pin = regval_eb & BIT(5);
+				if (!pwm5pin)
+					pwm5pin = (regval_eb & BIT(4)) &&
+						!(regval_2a & BIT(0));
+				if (!fan6pin)
+					fan6pin = regval_eb & BIT(3);
+				if (!pwm6pin)
+					pwm6pin = regval_eb & BIT(2);
 			}
 
-			superio_select(sioreg, NCT6775_LD_12);
-			regval_eb = superio_inb(sioreg, 0xeb);
-			if (!fan5pin)
-				fan5pin = regval_eb & BIT(5);
-			if (!pwm5pin)
-				pwm5pin = (regval_eb & BIT(4)) &&
-					   !(regval_2a & BIT(0));
-			if (!fan6pin)
-				fan6pin = regval_eb & BIT(3);
-			if (!pwm6pin)
-				pwm6pin = regval_eb & BIT(2);
-
-			if (data->kind == nct6795) {
+			if (data->kind == nct6795 || data->kind == nct6796) {
 				int regval_ed = superio_inb(sioreg, 0xed);
 
 				if (!fan6pin)
@@ -3486,6 +3537,15 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 					pwm6pin = (regval_2a & BIT(3)) &&
 					  (regval_ed & BIT(2));
 			}
+
+			if (data->kind == nct6796) {
+				int regval_1d = superio_inb(sioreg, 0x1d);
+				int regval_2b = superio_inb(sioreg, 0x2b);
+
+				fan7pin = !(regval_2b & BIT(2));
+				pwm7pin = !(regval_1d & (BIT(2) | BIT(3)));
+			}
+
 			break;
 		default:	/* NCT6779D */
 			break;
@@ -3496,11 +3556,11 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 	/* fan 1 and 2 (0x03) are always present */
 	data->has_fan = 0x03 | (fan3pin << 2) | (fan4pin << 3) |
-		(fan5pin << 4) | (fan6pin << 5);
+		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
 	data->has_fan_min = 0x03 | (fan3pin << 2) | (fan4min << 3) |
-		(fan5pin << 4) | (fan6pin << 5);
+		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
 	data->has_pwm = 0x03 | (pwm3pin << 2) | (pwm4pin << 3) |
-		(pwm5pin << 4) | (pwm6pin << 5);
+		(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
 }
 
 static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
@@ -3859,8 +3919,9 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6792:
 	case nct6793:
 	case nct6795:
+	case nct6796:
 		data->in_num = 15;
-		data->pwm_num = 6;
+		data->pwm_num = (data->kind == nct6796) ? 7 : 6;
 		data->auto_pwm_num = 4;
 		data->has_fan_div = false;
 		data->temp_fixed_num = 6;
@@ -3894,6 +3955,10 @@ static int nct6775_probe(struct platform_device *pdev)
 			data->temp_label = nct6795_temp_label;
 			data->temp_mask = NCT6795_TEMP_MASK;
 			break;
+		case nct6796:
+			data->temp_label = nct6796_temp_label;
+			data->temp_mask = NCT6796_TEMP_MASK;
+			break;
 		}
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
@@ -4162,6 +4227,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6792:
 	case nct6793:
 	case nct6795:
+	case nct6796:
 		break;
 	}
 
@@ -4196,6 +4262,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		case nct6792:
 		case nct6793:
 		case nct6795:
+		case nct6796:
 			tmp |= 0x7e;
 			break;
 		}
@@ -4294,7 +4361,8 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 		superio_outb(sioreg, SIO_REG_ENABLE, data->sio_reg_enable);
 
 	if (data->kind == nct6791 || data->kind == nct6792 ||
-	    data->kind == nct6793 || data->kind == nct6795)
+	    data->kind == nct6793 || data->kind == nct6795 ||
+	    data->kind == nct6796)
 		nct6791_enable_io_mapping(sioreg);
 
 	superio_exit(sioreg);
@@ -4394,6 +4462,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6795_ID:
 		sio_data->kind = nct6795;
 		break;
+	case SIO_NCT6796_ID:
+		sio_data->kind = nct6796;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
@@ -4420,7 +4491,8 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	}
 
 	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
-	    sio_data->kind == nct6793 || sio_data->kind == nct6795)
+	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
+	    sio_data->kind == nct6796)
 		nct6791_enable_io_mapping(sioaddr);
 
 	superio_exit(sioaddr);
-- 
2.7.4
