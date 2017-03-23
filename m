Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:57158 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934357AbdCWNCA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2017 09:02:00 -0400
From: Peter Huewe <peterhuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH 5/5] w83627ehf: Drop support for nct6775/nct6776
Date: Thu, 23 Mar 2017 14:03:08 +0100
Message-Id: <20170323130308.29166-5-peterhuewe@gmx.de>
In-Reply-To: <20170323130308.29166-1-peterhuewe@gmx.de>
References: <20170323130308.29166-1-peterhuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Since there exists a dedicated driver for nct6775/nct6776 it makes sense
to remove support for these chips from this driver, in order to have
only one code base for these types of chips.

This also improves maintainability and readability (and size) of this
driver.

Some not so-obvious changes are:
- removal of fan_debounce module parameter (now unused)
- removal of has_fan_div flag (nct6776 specific)
- w83627ehf_update_fan_div_common -> w83627ehf_update_fan_div
  (no distinction needed anymore)
- w83627ehf_update_pwm_common -> w83627ehf_update_pwm
  (no distinction needed anymore)
- NUM_REG_TEMP changed to ARRAY_SIZE(W83627EHF_REG_TEMP)
  (different number of max temp sensors)
- removal of intrusion1_alarm (nct6776 specific)

v2: Updated Kconfig, Documentation and removed unused temp_sensors (5-9)

Tested on NCT6776F (not probed anymore)

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 Documentation/hwmon/w83627ehf |  36 +--
 drivers/hwmon/Kconfig         |   5 +-
 drivers/hwmon/w83627ehf.c     | 546 ++++--------------------------------------
 3 files changed, 57 insertions(+), 530 deletions(-)

diff --git a/Documentation/hwmon/w83627ehf b/Documentation/hwmon/w83627ehf
index 735c42a85ead..d6b05abc1dcb 100644
--- a/Documentation/hwmon/w83627ehf
+++ b/Documentation/hwmon/w83627ehf
@@ -26,14 +26,6 @@ Supported chips:
     Prefix: 'w83667hg'
     Addresses scanned: ISA address retrieved from Super I/O registers
     Datasheet: Available from Nuvoton upon request
-  * Nuvoton NCT6775F/W83667HG-I
-    Prefix: 'nct6775'
-    Addresses scanned: ISA address retrieved from Super I/O registers
-    Datasheet: Available from Nuvoton upon request
-  * Nuvoton NCT6776F
-    Prefix: 'nct6776'
-    Addresses scanned: ISA address retrieved from Super I/O registers
-    Datasheet: Available from Nuvoton upon request
 
 Authors:
         Jean Delvare <jdelvare@suse.de>
@@ -46,24 +38,22 @@ Description
 -----------
 
 This driver implements support for the Winbond W83627EHF, W83627EHG,
-W83627DHG, W83627DHG-P, W83627UHG, W83667HG, W83667HG-B, W83667HG-I
-(NCT6775F), and NCT6776F super I/O chips. We will refer to them collectively
-as Winbond chips.
+W83627DHG, W83627DHG-P, W83627UHG, W83667HG and W83667HG-B super I/O chips.
+We will refer to them collectively as Winbond chips.
 
-The chips implement 3 to 4 temperature sensors (9 for NCT6775F and NCT6776F),
-2 to 5 fan rotation speed sensors, 8 to 10 analog voltage sensors, one VID
-(except for 627UHG), alarms with beep warnings (control unimplemented),
-and some automatic fan regulation strategies (plus manual fan control mode).
+The chips implement 3 to 4 temperature sensors, 2 to 5 fan rotation speed
+sensors, 8 to 10 analog voltage sensors, one VID (except for 627UHG), alarms
+with beep warnings (control unimplemented), and some automatic fan regulation
+strategies (plus manual fan control mode).
 
-The temperature sensor sources on W82677HG-B, NCT6775F, and NCT6776F are
-configurable. temp4 and higher attributes are only reported if its temperature
-source differs from the temperature sources of the already reported temperature
-sensors. The configured source for each of the temperature sensors is provided
-in tempX_label.
+The temperature sensor sources on W82677HG-B are configurable. temp4 and higher
+attributes are only reported if its temperature source differs from the
+temperature sources of the already reported temperature sensors. The configured
+source for each of the temperature sensors is provided in tempX_label.
 
 Temperatures are measured in degrees Celsius and measurement resolution is 1
 degC for temp1 and and 0.5 degC for temp2 and temp3. For temp4 and higher,
-resolution is 1 degC for W83667HG-B and 0.0 degC for NCT6775F and NCT6776F.
+resolution is 1 degC for W83667HG-B.
 An alarm is triggered when the temperature gets higher than high limit;
 it stays on until the temperature falls below the hysteresis value.
 Alarms are only supported for temp1, temp2, and temp3.
@@ -110,10 +100,8 @@ pwm[1-4]_enable - this file controls mode of fan/temperature control:
 	* 4 "Smart Fan III" mode
 	* 5 "Smart Fan IV" mode
 
-	SmartFan III mode is not supported on NCT6776F.
-
 	SmartFan IV mode is configurable only if it was configured at system
-	startup, and is only supported for W83677HG-B, NCT6775F, and NCT6776F.
+	startup, and is only supported for W83677HG-B.
 	SmartFan IV operational parameters can not be configured at this time,
 	and the various pwm attributes are not used in SmartFan IV mode.
 	The attributes can be written to, which is useful if you plan to
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 0649d53f3d16..38edc81fb87e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1807,7 +1807,7 @@ config SENSORS_W83627HF
 	  will be called w83627hf.
 
 config SENSORS_W83627EHF
-	tristate "Winbond W83627EHF/EHG/DHG/UHG, W83667HG, NCT6775F, NCT6776F"
+	tristate "Winbond W83627EHF/EHG/DHG/UHG, W83667HG"
 	depends on !PPC
 	select HWMON_VID
 	help
@@ -1820,8 +1820,7 @@ config SENSORS_W83627EHF
 	  the Core 2 Duo. And also the W83627UHG, which is a stripped down
 	  version of the W83627DHG (as far as hardware monitoring goes.)
 
-	  This driver also supports Nuvoton W83667HG, W83667HG-B, NCT6775F
-	  (also known as W83667HG-I), and NCT6776F.
+	  This driver also supports Nuvoton W83667HG and W83667HG-B.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called w83627ehf.
diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index c4b755cd506c..000e1e622a5b 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -31,8 +31,6 @@
  *  w83627uhg    8      2       2       3      0xa230 0xc1    0x5ca3
  *  w83667hg     9      5       3       3      0xa510 0xc1    0x5ca3
  *  w83667hg-b   9      5       3       4      0xb350 0xc1    0x5ca3
- *  nct6775f     9      4       3       9      0xb470 0xc1    0x5ca3
- *  nct6776f     9      5       3       9      0xC330 0xc1    0x5ca3
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -53,7 +51,7 @@
 
 enum kinds {
 	w83627ehf, w83627dhg, w83627dhg_p, w83627uhg,
-	w83667hg, w83667hg_b, nct6775, nct6776,
+	w83667hg, w83667hg_b,
 };
 
 /* used to set data->name = w83627ehf_device_names[data->sio_kind] */
@@ -64,18 +62,12 @@ static const char * const w83627ehf_device_names[] = {
 	"w83627uhg",
 	"w83667hg",
 	"w83667hg",
-	"nct6775",
-	"nct6776",
 };
 
 static unsigned short force_id;
 module_param(force_id, ushort, 0);
 MODULE_PARM_DESC(force_id, "Override the detected device ID");
 
-static unsigned short fan_debounce;
-module_param(fan_debounce, ushort, 0);
-MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
-
 #define DRVNAME "w83627ehf"
 
 /*
@@ -100,8 +92,6 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_W83627UHG_ID	0xa230
 #define SIO_W83667HG_ID		0xa510
 #define SIO_W83667HG_B_ID	0xb350
-#define SIO_NCT6775_ID		0xb470
-#define SIO_NCT6776_ID		0xc330
 #define SIO_ID_MASK		0xFFF0
 
 static inline void
@@ -190,11 +180,6 @@ static const u16 W83627EHF_REG_TEMP_CONFIG[] = { 0, 0x152, 0x252, 0 };
 #define W83627EHF_REG_DIODE		0x59
 #define W83627EHF_REG_SMI_OVT		0x4C
 
-/* NCT6775F has its own fan divider registers */
-#define NCT6775_REG_FANDIV1		0x506
-#define NCT6775_REG_FANDIV2		0x507
-#define NCT6775_REG_FAN_DEBOUNCE	0xf0
-
 #define W83627EHF_REG_ALARM1		0x459
 #define W83627EHF_REG_ALARM2		0x45A
 #define W83627EHF_REG_ALARM3		0x45B
@@ -238,28 +223,6 @@ static const u16 W83627EHF_REG_FAN_STEP_OUTPUT_W83667_B[]
 
 static const u16 W83627EHF_REG_TEMP_OFFSET[] = { 0x454, 0x455, 0x456 };
 
-static const u16 NCT6775_REG_TARGET[] = { 0x101, 0x201, 0x301 };
-static const u16 NCT6775_REG_FAN_MODE[] = { 0x102, 0x202, 0x302 };
-static const u16 NCT6775_REG_FAN_STOP_OUTPUT[] = { 0x105, 0x205, 0x305 };
-static const u16 NCT6775_REG_FAN_START_OUTPUT[] = { 0x106, 0x206, 0x306 };
-static const u16 NCT6775_REG_FAN_STOP_TIME[] = { 0x107, 0x207, 0x307 };
-static const u16 NCT6775_REG_PWM[] = { 0x109, 0x209, 0x309 };
-static const u16 NCT6775_REG_FAN_MAX_OUTPUT[] = { 0x10a, 0x20a, 0x30a };
-static const u16 NCT6775_REG_FAN_STEP_OUTPUT[] = { 0x10b, 0x20b, 0x30b };
-static const u16 NCT6775_REG_FAN[] = { 0x630, 0x632, 0x634, 0x636, 0x638 };
-static const u16 NCT6776_REG_FAN_MIN[] = { 0x63a, 0x63c, 0x63e, 0x640, 0x642};
-
-static const u16 NCT6775_REG_TEMP[]
-	= { 0x27, 0x150, 0x250, 0x73, 0x75, 0x77, 0x62b, 0x62c, 0x62d };
-static const u16 NCT6775_REG_TEMP_CONFIG[]
-	= { 0, 0x152, 0x252, 0, 0, 0, 0x628, 0x629, 0x62A };
-static const u16 NCT6775_REG_TEMP_HYST[]
-	= { 0x3a, 0x153, 0x253, 0, 0, 0, 0x673, 0x678, 0x67D };
-static const u16 NCT6775_REG_TEMP_OVER[]
-	= { 0x39, 0x155, 0x255, 0, 0, 0, 0x672, 0x677, 0x67C };
-static const u16 NCT6775_REG_TEMP_SOURCE[]
-	= { 0x621, 0x622, 0x623, 0x100, 0x200, 0x300, 0x624, 0x625, 0x626 };
-
 static const char *const w83667hg_b_temp_label[] = {
 	"SYSTIN",
 	"CPUTIN",
@@ -271,57 +234,7 @@ static const char *const w83667hg_b_temp_label[] = {
 	"PECI Agent 4"
 };
 
-static const char *const nct6775_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN",
-	"AMD SB-TSI",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PECI Agent 2",
-	"PECI Agent 3",
-	"PECI Agent 4",
-	"PECI Agent 5",
-	"PECI Agent 6",
-	"PECI Agent 7",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP"
-};
-
-static const char *const nct6776_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"SMBUSMASTER 2",
-	"SMBUSMASTER 3",
-	"SMBUSMASTER 4",
-	"SMBUSMASTER 5",
-	"SMBUSMASTER 6",
-	"SMBUSMASTER 7",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
-	"BYTE_TEMP"
-};
-
-#define NUM_REG_TEMP	ARRAY_SIZE(NCT6775_REG_TEMP)
+#define NUM_REG_TEMP	ARRAY_SIZE(W83627EHF_REG_TEMP)
 
 static int is_word_sized(u16 reg)
 {
@@ -361,31 +274,6 @@ static unsigned int fan_from_reg8(u16 reg, unsigned int divreg)
 	return 1350000U / (reg << divreg);
 }
 
-static unsigned int fan_from_reg13(u16 reg, unsigned int divreg)
-{
-	if ((reg & 0xff1f) == 0xff1f)
-		return 0;
-
-	reg = (reg & 0x1f) | ((reg & 0xff00) >> 3);
-
-	if (reg == 0)
-		return 0;
-
-	return 1350000U / reg;
-}
-
-static unsigned int fan_from_reg16(u16 reg, unsigned int divreg)
-{
-	if (reg == 0 || reg == 0xffff)
-		return 0;
-
-	/*
-	 * Even though the registers are 16 bit wide, the fan divisor
-	 * still applies.
-	 */
-	return 1350000U / (reg << divreg);
-}
-
 static inline unsigned int
 div_from_reg(u8 reg)
 {
@@ -465,7 +353,6 @@ struct w83627ehf_data {
 	u8 fan_div[5];
 	u8 has_fan;		/* some fan inputs can be disabled */
 	u8 has_fan_min;		/* some fans don't have min register */
-	bool has_fan_div;
 	u8 temp_type[3];
 	s8 temp_offset[3];
 	s16 temp[9];
@@ -586,35 +473,6 @@ static int w83627ehf_write_temp(struct w83627ehf_data *data, u16 reg, u16 value)
 }
 
 /* This function assumes that the caller holds data->update_lock */
-static void nct6775_write_fan_div(struct w83627ehf_data *data, int nr)
-{
-	u8 reg;
-
-	switch (nr) {
-	case 0:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV1) & 0x70)
-		    | (data->fan_div[0] & 0x7);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV1, reg);
-		break;
-	case 1:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV1) & 0x7)
-		    | ((data->fan_div[1] << 4) & 0x70);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV1, reg);
-		break;
-	case 2:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV2) & 0x70)
-		    | (data->fan_div[2] & 0x7);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV2, reg);
-		break;
-	case 3:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV2) & 0x7)
-		    | ((data->fan_div[3] << 4) & 0x70);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV2, reg);
-		break;
-	}
-}
-
-/* This function assumes that the caller holds data->update_lock */
 static void w83627ehf_write_fan_div(struct w83627ehf_data *data, int nr)
 {
 	u8 reg;
@@ -665,32 +523,6 @@ static void w83627ehf_write_fan_div(struct w83627ehf_data *data, int nr)
 	}
 }
 
-static void w83627ehf_write_fan_div_common(struct device *dev,
-					   struct w83627ehf_data *data, int nr)
-{
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
-
-	if (sio_data->kind == nct6776)
-		; /* no dividers, do nothing */
-	else if (sio_data->kind == nct6775)
-		nct6775_write_fan_div(data, nr);
-	else
-		w83627ehf_write_fan_div(data, nr);
-}
-
-static void nct6775_update_fan_div(struct w83627ehf_data *data)
-{
-	u8 i;
-
-	i = w83627ehf_read_value(data, NCT6775_REG_FANDIV1);
-	data->fan_div[0] = i & 0x7;
-	data->fan_div[1] = (i & 0x70) >> 4;
-	i = w83627ehf_read_value(data, NCT6775_REG_FANDIV2);
-	data->fan_div[2] = i & 0x7;
-	if (data->has_fan & (1 << 3))
-		data->fan_div[3] = (i & 0x70) >> 4;
-}
-
 static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
 {
 	int i;
@@ -716,35 +548,6 @@ static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
 	}
 }
 
-static void w83627ehf_update_fan_div_common(struct device *dev,
-					    struct w83627ehf_data *data)
-{
-	if (data->sio_data->kind == nct6776)
-		; /* no dividers, do nothing */
-	else if (data->sio_data->kind == nct6775)
-		nct6775_update_fan_div(data);
-	else
-		w83627ehf_update_fan_div(data);
-}
-
-static void nct6775_update_pwm(struct w83627ehf_data *data)
-{
-	int i;
-	int pwmcfg, fanmodecfg;
-
-	for (i = 0; i < data->pwm_num; i++) {
-		pwmcfg = w83627ehf_read_value(data,
-					      W83627EHF_REG_PWM_ENABLE[i]);
-		fanmodecfg = w83627ehf_read_value(data,
-						  NCT6775_REG_FAN_MODE[i]);
-		data->pwm_mode[i] =
-		  ((pwmcfg >> W83627EHF_PWM_MODE_SHIFT[i]) & 1) ? 0 : 1;
-		data->pwm_enable[i] = ((fanmodecfg >> 4) & 7) + 1;
-		data->tolerance[i] = fanmodecfg & 0x0f;
-		data->pwm[i] = w83627ehf_read_value(data, data->REG_PWM[i]);
-	}
-}
-
 static void w83627ehf_update_pwm(struct w83627ehf_data *data)
 {
 	int i;
@@ -771,21 +574,9 @@ static void w83627ehf_update_pwm(struct w83627ehf_data *data)
 	}
 }
 
-static void w83627ehf_update_pwm_common(struct device *dev,
-					struct w83627ehf_data *data)
-{
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
-
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776)
-		nct6775_update_pwm(data);
-	else
-		w83627ehf_update_pwm(data);
-}
-
 static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
 	int i;
 
 	mutex_lock(&data->update_lock);
@@ -793,7 +584,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 	if (time_after(jiffies, data->last_updated + HZ + HZ/2)
 	 || !data->valid) {
 		/* Fan clock dividers */
-		w83627ehf_update_fan_div_common(dev, data);
+		w83627ehf_update_fan_div(data);
 
 		/* Measured voltages and limits */
 		for (i = 0; i < data->in_num; i++) {
@@ -828,16 +619,13 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 			 * divider can be increased, let's try that for next
 			 * time
 			 */
-			if (data->has_fan_div
-			    && (reg >= 0xff || (sio_data->kind == nct6775
-						&& reg == 0x00))
-			    && data->fan_div[i] < 0x07) {
+			if (reg >= 0xff && data->fan_div[i] < 0x07) {
 				dev_dbg(dev,
 					"Increasing fan%d clock divider from %u to %u\n",
 					i + 1, div_from_reg(data->fan_div[i]),
 					div_from_reg(data->fan_div[i] + 1));
 				data->fan_div[i]++;
-				w83627ehf_write_fan_div_common(dev, data, i);
+				w83627ehf_write_fan_div(data, i);
 				/* Preserve min limit if possible */
 				if ((data->has_fan_min & (1 << i))
 				 && data->fan_min[i] >= 2
@@ -848,7 +636,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 			}
 		}
 
-		w83627ehf_update_pwm_common(dev, data);
+		w83627ehf_update_pwm(data);
 
 		for (i = 0; i < data->pwm_num; i++) {
 			if (!(data->has_fan & (1 << i)))
@@ -930,22 +718,6 @@ static void store_fan_min(struct device *dev, u32 channel, unsigned long val)
 	u8 new_div;
 
 	mutex_lock(&data->update_lock);
-	if (!data->has_fan_div) {
-		/*
-		 * Only NCT6776F for now, so we know that this is a 13 bit
-		 * register
-		 */
-		if (!val) {
-			val = 0xff1f;
-		} else {
-			if (val > 1350000U)
-				val = 135000U;
-			val = 1350000U / val;
-			val = (val & 0x1f) | ((val << 3) & 0xff00);
-		}
-		data->fan_min[nr] = val;
-		goto done;	/* Leave fan divider alone */
-	}
 	if (!val) {
 		/* No min limit, alarm disabled */
 		data->fan_min[nr] = 255;
@@ -994,11 +766,11 @@ static void store_fan_min(struct device *dev, u32 channel, unsigned long val)
 			nr + 1, div_from_reg(data->fan_div[nr]),
 			div_from_reg(new_div));
 		data->fan_div[nr] = new_div;
-		w83627ehf_write_fan_div_common(dev, data, nr);
+		w83627ehf_write_fan_div(data, nr);
 		/* Give the chip time to sample a new speed value */
 		data->last_updated = jiffies;
 	}
-done:
+
 	w83627ehf_write_value(data, data->REG_FAN_MIN[nr], data->fan_min[nr]);
 	mutex_unlock(&data->update_lock);
 }
@@ -1045,7 +817,6 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	u16 reg;
@@ -1060,21 +831,12 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 15);
 
 	mutex_lock(&data->update_lock);
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
-		/* Limit tolerance further for NCT6776F */
-		if (sio_data->kind == nct6776 && val > 7)
-			val = 7;
-		reg = w83627ehf_read_value(data, NCT6775_REG_FAN_MODE[nr]);
+	reg = w83627ehf_read_value(data, W83627EHF_REG_TOLERANCE[nr]);
+	if (nr == 1)
+		reg = (reg & 0x0f) | (val << 4);
+	else
 		reg = (reg & 0xf0) | val;
-		w83627ehf_write_value(data, NCT6775_REG_FAN_MODE[nr], reg);
-	} else {
-		reg = w83627ehf_read_value(data, W83627EHF_REG_TOLERANCE[nr]);
-		if (nr == 1)
-			reg = (reg & 0x0f) | (val << 4);
-		else
-			reg = (reg & 0xf0) | val;
-		w83627ehf_write_value(data, W83627EHF_REG_TOLERANCE[nr], reg);
-	}
+	w83627ehf_write_value(data, W83627EHF_REG_TOLERANCE[nr], reg);
 	data->tolerance[nr] = val;
 	mutex_unlock(&data->update_lock);
 	return count;
@@ -1267,8 +1029,6 @@ clear_caseopen(struct device *dev, struct device_attribute *attr,
 
 static SENSOR_DEVICE_ATTR_2(intrusion0_alarm, 0644, show_caseopen,
 			    clear_caseopen, 0x80, 0x10);
-static SENSOR_DEVICE_ATTR_2(intrusion1_alarm, 0644, show_caseopen,
-			    clear_caseopen, 0x40, 0x40);
 
 static struct attribute *static_sensor_attrs[] = {
 	&sensor_dev_attr_pwm1_stop_time.dev_attr.attr,
@@ -1283,7 +1043,6 @@ static struct attribute *static_sensor_attrs[] = {
 
 static struct attribute *other_sensor_attrs[] = {
 	&dev_attr_cpu0_vid.attr,
-	&sensor_dev_attr_intrusion1_alarm.dev_attr.attr,
 	NULL,
 };
 
@@ -1341,11 +1100,6 @@ static umode_t other_sensor_is_visible(struct kobject *kobj,
 		else
 			return 0444;
 	}
-	if (idx == 1) { /*intrusion1*/
-		if (data->sio_data->kind == nct6776)
-			return 0644;
-	}
-
 	return 0;
 }
 
@@ -1519,15 +1273,6 @@ static inline void w83627ehf_init_device(struct w83627ehf_data *data,
 	}
 }
 
-static void w82627ehf_swap_tempreg(struct w83627ehf_data *data, int r1, int r2)
-{
-	swap(data->temp_src[r1], data->temp_src[r2]);
-	swap(data->reg_temp[r1], data->reg_temp[r2]);
-	swap(data->reg_temp_over[r1], data->reg_temp_over[r2]);
-	swap(data->reg_temp_hyst[r1], data->reg_temp_hyst[r2]);
-	swap(data->reg_temp_config[r1], data->reg_temp_config[r2]);
-}
-
 static void w83627ehf_set_temp_reg_ehf(struct w83627ehf_data *data, int n_temp)
 {
 	int i;
@@ -1553,36 +1298,7 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 		return;
 	}
 
-	/* fan4 and fan5 share some pins with the GPIO and serial flash */
-	if (sio_data->kind == nct6775) {
-		/* On NCT6775, fan4 shares pins with the fdc interface */
-		fan3pin = 1;
-		fan4pin = !(superio_inb(sio_data->sioreg, 0x2A) & 0x80);
-		fan4min = 0;
-		fan5pin = 0;
-	} else if (sio_data->kind == nct6776) {
-		bool gpok = superio_inb(sio_data->sioreg, 0x27) & 0x80;
-
-		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
-		regval = superio_inb(sio_data->sioreg, SIO_REG_ENABLE);
-
-		if (regval & 0x80)
-			fan3pin = gpok;
-		else
-			fan3pin = !(superio_inb(sio_data->sioreg, 0x24) & 0x40);
-
-		if (regval & 0x40)
-			fan4pin = gpok;
-		else
-			fan4pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x01);
-
-		if (regval & 0x20)
-			fan5pin = gpok;
-		else
-			fan5pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x02);
-
-		fan4min = fan4pin;
-	} else if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
+	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
 		fan3pin = 1;
 		fan4pin = superio_inb(sio_data->sioreg, 0x27) & 0x40;
 		fan5pin = superio_inb(sio_data->sioreg, 0x27) & 0x20;
@@ -1598,30 +1314,21 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 	data->has_fan |= (fan3pin << 2);
 	data->has_fan_min |= (fan3pin << 2);
 
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
-		/*
-		 * NCT6775F and NCT6776F don't have the W83627EHF_REG_FANDIV1
-		 * register
-		 */
-		data->has_fan |= (fan4pin << 3) | (fan5pin << 4);
-		data->has_fan_min |= (fan4min << 3) | (fan5pin << 4);
-	} else {
-		/*
-		 * It looks like fan4 and fan5 pins can be alternatively used
-		 * as fan on/off switches, but fan5 control is write only :/
-		 * We assume that if the serial interface is disabled, designers
-		 * connected fan5 as input unless they are emitting log 1, which
-		 * is not the default.
-		 */
-		regval = w83627ehf_read_value(data, W83627EHF_REG_FANDIV1);
-		if ((regval & (1 << 2)) && fan4pin) {
-			data->has_fan |= (1 << 3);
-			data->has_fan_min |= (1 << 3);
-		}
-		if (!(regval & (1 << 1)) && fan5pin) {
-			data->has_fan |= (1 << 4);
-			data->has_fan_min |= (1 << 4);
-		}
+	/*
+	 * It looks like fan4 and fan5 pins can be alternatively used
+	 * as fan on/off switches, but fan5 control is write only :/
+	 * We assume that if the serial interface is disabled, designers
+	 * connected fan5 as input unless they are emitting log 1, which
+	 * is not the default.
+	 */
+	regval = w83627ehf_read_value(data, W83627EHF_REG_FANDIV1);
+	if ((regval & (1 << 2)) && fan4pin) {
+		data->has_fan |= (1 << 3);
+		data->has_fan_min |= (1 << 3);
+	}
+	if (!(regval & (1 << 1)) && fan5pin) {
+		data->has_fan |= (1 << 4);
+		data->has_fan_min |= (1 << 4);
 	}
 }
 
@@ -1812,10 +1519,7 @@ static umode_t w3627ehf_fan_is_visible(const void *_data, u32 attr, int channel)
 	case hwmon_fan_input:
 		return 0444;
 	case hwmon_fan_div:
-		if (data->sio_data->kind != nct6776)
-			return 0444;
-		else
-			return 0;
+		return 0444;
 	case hwmon_fan_min:
 		return 0644;
 	}
@@ -1826,7 +1530,6 @@ static int w3627ehf_write_pwm(struct device *dev, u32 attr, int channel,
 			      long val)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
 	u16 reg;
 
 	switch (attr) {
@@ -1841,10 +1544,6 @@ static int w3627ehf_write_pwm(struct device *dev, u32 attr, int channel,
 		if (val > 1)
 			return -EINVAL;
 
-		/* On NCT67766F, DC mode is only supported for pwm1 */
-		if (sio_data->kind == nct6776 && channel && val != 1)
-			return -EINVAL;
-
 		mutex_lock(&data->update_lock);
 		reg = w83627ehf_read_value(data,
 					   W83627EHF_REG_PWM_ENABLE[channel]);
@@ -1859,29 +1558,15 @@ static int w3627ehf_write_pwm(struct device *dev, u32 attr, int channel,
 	case hwmon_pwm_enable:
 		if (!val || (val > 4 && val != data->pwm_enable_orig[channel]))
 			return -EINVAL;
-		/* SmartFan III mode is not supported on NCT6776F */
-		if (sio_data->kind == nct6776 && val == 4)
-			return -EINVAL;
-
 		mutex_lock(&data->update_lock);
 		data->pwm_enable[channel] = val;
-		if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
-			reg = w83627ehf_read_value(data,
-						   NCT6775_REG_FAN_MODE[channel]);
-			reg &= 0x0f;
-			reg |= (val - 1) << 4;
-			w83627ehf_write_value(data,
-					      NCT6775_REG_FAN_MODE[channel],
-					      reg);
-		} else {
-			reg = w83627ehf_read_value(data,
-						   W83627EHF_REG_PWM_ENABLE[channel]);
-			reg &= ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[channel]);
-			reg |= (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
-			w83627ehf_write_value(data,
-					      W83627EHF_REG_PWM_ENABLE[channel],
-					      reg);
-		}
+		reg = w83627ehf_read_value(data,
+					   W83627EHF_REG_PWM_ENABLE[channel]);
+		reg &= ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[channel]);
+		reg |= (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
+		w83627ehf_write_value(data,
+				      W83627EHF_REG_PWM_ENABLE[channel],
+				      reg);
 		mutex_unlock(&data->update_lock);
 		return 0;
 	default:
@@ -2106,11 +1791,6 @@ static const u32 w3627ehf_temp_config[] = {
 	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST |
 	    HWMON_T_ALARM | HWMON_T_TYPE | HWMON_T_OFFSET,
 	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST,
 	0
 };
 
@@ -2219,15 +1899,13 @@ static int w83627ehf_probe(struct platform_device *pdev)
 
 	/* 627EHG and 627EHF have 10 voltage inputs; 627DHG and 667HG have 9 */
 	data->in_num = (sio_data->kind == w83627ehf) ? 10 : 9;
-	/* 667HG, NCT6775F, and NCT6776F have 3 pwms, and 627UHG has only 2 */
+	/* 667HG has 3 pwms, and 627UHG has only 2 */
 	switch (sio_data->kind) {
 	default:
 		data->pwm_num = 4;
 		break;
 	case w83667hg:
 	case w83667hg_b:
-	case nct6775:
-	case nct6776:
 		data->pwm_num = 3;
 		break;
 	case w83627uhg:
@@ -2239,83 +1917,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	data->have_temp = 0x07;
 
 	/* Deal with temperature register setup first. */
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
-		int mask = 0;
-
-		/*
-		 * Display temperature sensor output only if it monitors
-		 * a source other than one already reported. Always display
-		 * first three temperature registers, though.
-		 */
-		for (i = 0; i < NUM_REG_TEMP; i++) {
-			u8 src;
-
-			data->reg_temp[i] = NCT6775_REG_TEMP[i];
-			data->reg_temp_over[i] = NCT6775_REG_TEMP_OVER[i];
-			data->reg_temp_hyst[i] = NCT6775_REG_TEMP_HYST[i];
-			data->reg_temp_config[i] = NCT6775_REG_TEMP_CONFIG[i];
-
-			src = w83627ehf_read_value(data,
-						   NCT6775_REG_TEMP_SOURCE[i]);
-			src &= 0x1f;
-			if (src && !(mask & (1 << src))) {
-				data->have_temp |= 1 << i;
-				mask |= 1 << src;
-			}
-
-			data->temp_src[i] = src;
-
-			/*
-			 * Now do some register swapping if index 0..2 don't
-			 * point to SYSTIN(1), CPUIN(2), and AUXIN(3).
-			 * Idea is to have the first three attributes
-			 * report SYSTIN, CPUIN, and AUXIN if possible
-			 * without overriding the basic system configuration.
-			 */
-			if (i > 0 && data->temp_src[0] != 1
-			    && data->temp_src[i] == 1)
-				w82627ehf_swap_tempreg(data, 0, i);
-			if (i > 1 && data->temp_src[1] != 2
-			    && data->temp_src[i] == 2)
-				w82627ehf_swap_tempreg(data, 1, i);
-			if (i > 2 && data->temp_src[2] != 3
-			    && data->temp_src[i] == 3)
-				w82627ehf_swap_tempreg(data, 2, i);
-		}
-		if (sio_data->kind == nct6776) {
-			/*
-			 * On NCT6776, AUXTIN and VIN3 pins are shared.
-			 * Only way to detect it is to check if AUXTIN is used
-			 * as a temperature source, and if that source is
-			 * enabled.
-			 *
-			 * If that is the case, disable in6, which reports VIN3.
-			 * Otherwise disable temp3.
-			 */
-			if (data->temp_src[2] == 3) {
-				u8 reg;
-
-				if (data->reg_temp_config[2])
-					reg = w83627ehf_read_value(data,
-						data->reg_temp_config[2]);
-				else
-					reg = 0; /* Assume AUXTIN is used */
-
-				if (reg & 0x01)
-					data->have_temp &= ~(1 << 2);
-				else
-					data->in6_skip = 1;
-			}
-			data->temp_label = nct6776_temp_label;
-		} else {
-			data->temp_label = nct6775_temp_label;
-		}
-		data->have_temp_offset = data->have_temp & 0x07;
-		for (i = 0; i < 3; i++) {
-			if (data->temp_src[i] > 3)
-				data->have_temp_offset &= ~(1 << i);
-		}
-	} else if (sio_data->kind == w83667hg_b) {
+	if (sio_data->kind == w83667hg_b) {
 		u8 reg;
 
 		w83627ehf_set_temp_reg_ehf(data, 4);
@@ -2425,32 +2027,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		data->have_temp_offset = data->have_temp & 0x07;
 	}
 
-	if (sio_data->kind == nct6775) {
-		data->has_fan_div = true;
-		data->fan_from_reg = fan_from_reg16;
-		data->fan_from_reg_min = fan_from_reg8;
-		data->REG_PWM = NCT6775_REG_PWM;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6775_REG_FAN;
-		data->REG_FAN_MIN = W83627EHF_REG_FAN_MIN;
-		data->REG_FAN_START_OUTPUT = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_FAN_STOP_OUTPUT = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_FAN_STOP_TIME = NCT6775_REG_FAN_STOP_TIME;
-		data->REG_FAN_MAX_OUTPUT = NCT6775_REG_FAN_MAX_OUTPUT;
-		data->REG_FAN_STEP_OUTPUT = NCT6775_REG_FAN_STEP_OUTPUT;
-	} else if (sio_data->kind == nct6776) {
-		data->has_fan_div = false;
-		data->fan_from_reg = fan_from_reg13;
-		data->fan_from_reg_min = fan_from_reg13;
-		data->REG_PWM = NCT6775_REG_PWM;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6775_REG_FAN;
-		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
-		data->REG_FAN_START_OUTPUT = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_FAN_STOP_OUTPUT = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_FAN_STOP_TIME = NCT6775_REG_FAN_STOP_TIME;
-	} else if (sio_data->kind == w83667hg_b) {
-		data->has_fan_div = true;
+	if (sio_data->kind == w83667hg_b) {
 		data->fan_from_reg = fan_from_reg8;
 		data->fan_from_reg_min = fan_from_reg8;
 		data->REG_PWM = W83627EHF_REG_PWM;
@@ -2465,7 +2042,6 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		data->REG_FAN_STEP_OUTPUT =
 		  W83627EHF_REG_FAN_STEP_OUTPUT_W83667_B;
 	} else {
-		data->has_fan_div = true;
 		data->fan_from_reg = fan_from_reg8;
 		data->fan_from_reg_min = fan_from_reg8;
 		data->REG_PWM = W83627EHF_REG_PWM;
@@ -2497,8 +2073,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		goto exit_release;
 
 	/* Read VID value */
-	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b ||
-	    sio_data->kind == nct6775 || sio_data->kind == nct6776) {
+	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
 		/*
 		 * W83667HG has different pins for VID input and output, so
 		 * we can get the VID input values directly at logical device D
@@ -2546,30 +2121,15 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (fan_debounce &&
-	    (sio_data->kind == nct6775 || sio_data->kind == nct6776)) {
-		u8 tmp;
-
-		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
-		tmp = superio_inb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE);
-		if (sio_data->kind == nct6776)
-			superio_outb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE,
-				     0x3e | tmp);
-		else
-			superio_outb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE,
-				     0x1e | tmp);
-		pr_info("Enabled fan debounce for chip %s\n", data->name);
-	}
-
 	w83627ehf_check_fan_inputs(sio_data, data);
 
 	superio_exit(sio_data->sioreg);
 
 	/* Read fan clock dividers immediately */
-	w83627ehf_update_fan_div_common(dev, data);
+	w83627ehf_update_fan_div(data);
 
 	/* Read pwm data to save original values */
-	w83627ehf_update_pwm_common(dev, data);
+	w83627ehf_update_pwm(data);
 	for (i = 0; i < data->pwm_num; i++)
 		data->pwm_enable_orig[i] = data->pwm_enable[i];
 
@@ -2604,14 +2164,9 @@ static int w83627ehf_remove(struct platform_device *pdev)
 static int w83627ehf_suspend(struct device *dev)
 {
 	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
 
 	mutex_lock(&data->update_lock);
 	data->vbat = w83627ehf_read_value(data, W83627EHF_REG_VBAT);
-	if (sio_data->kind == nct6775) {
-		data->fandiv1 = w83627ehf_read_value(data, NCT6775_REG_FANDIV1);
-		data->fandiv2 = w83627ehf_read_value(data, NCT6775_REG_FANDIV2);
-	}
 	mutex_unlock(&data->update_lock);
 
 	return 0;
@@ -2620,7 +2175,6 @@ static int w83627ehf_suspend(struct device *dev)
 static int w83627ehf_resume(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = data->sio_data;
 	int i;
 
 	mutex_lock(&data->update_lock);
@@ -2665,10 +2219,6 @@ static int w83627ehf_resume(struct device *dev)
 
 	/* Restore other settings */
 	w83627ehf_write_value(data, W83627EHF_REG_VBAT, data->vbat);
-	if (sio_data->kind == nct6775) {
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
-	}
 
 	/* Force re-reading all values */
 	data->valid = 0;
@@ -2709,8 +2259,6 @@ static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
 	static const char sio_name_W83627UHG[] __initconst = "W83627UHG";
 	static const char sio_name_W83667HG[] __initconst = "W83667HG";
 	static const char sio_name_W83667HG_B[] __initconst = "W83667HG-B";
-	static const char sio_name_NCT6775[] __initconst = "NCT6775F";
-	static const char sio_name_NCT6776[] __initconst = "NCT6776F";
 
 	u16 val;
 	const char *sio_name;
@@ -2754,14 +2302,6 @@ static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
 		sio_data->kind = w83667hg_b;
 		sio_name = sio_name_W83667HG_B;
 		break;
-	case SIO_NCT6775_ID:
-		sio_data->kind = nct6775;
-		sio_name = sio_name_NCT6775;
-		break;
-	case SIO_NCT6776_ID:
-		sio_data->kind = nct6776;
-		sio_name = sio_name_NCT6776;
-		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-- 
2.10.2

