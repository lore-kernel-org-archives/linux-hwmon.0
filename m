Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:43399 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752728AbdHIKFd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Aug 2017 06:05:33 -0400
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH v5 1/2] hwmon: (it87) Split out chip registers setting code on
 probe path
Message-ID: <6456c2c9-36a5-6ab4-7842-aa2da80f9522@maciej.szmigiero.name>
Date: Wed, 9 Aug 2017 12:05:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This commit splits out chip registers setting code on probe path to
separate functions so they can be reused for setting the device properly
again when system resumes from suspend.

While we are at it let's also make clear that on IT8720 and IT8782 it's
the VCCH5V line that is (possibly) routed to in7.
This will make it consistent with a similar message that it printed on
IT8783.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
Changes from v1: Move code of common probe / resume steps to new functions
so we don't need to make large parts of probe function conditional on a
newly added 'resume' parameter.

Changes from v2: Code move of common probe / resume steps to new functions
and actual resume functionality split into two, separate patches.

Made a message about VCCH5V being routed to in7 consistent across all
chips.

Changes from v3, v4: Fix patch formatting.

 drivers/hwmon/it87.c | 138 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4dfc7238313e..818f123ac475 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2761,13 +2761,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		uart6 = sio_data->type == it8782 && (reg & BIT(2));
 
 		/*
-		 * The IT8720F has no VIN7 pin, so VCCH should always be
+		 * The IT8720F has no VIN7 pin, so VCCH5V should always be
 		 * routed internally to VIN7 with an internal divider.
 		 * Curiously, there still is a configuration bit to control
 		 * this, which means it can be set incorrectly. And even
 		 * more curiously, many boards out there are improperly
 		 * configured, even though the IT8720F datasheet claims
-		 * that the internal routing of VCCH to VIN7 is the default
+		 * that the internal routing of VCCH5V to VIN7 is the default
 		 * setting. So we force the internal routing in this case.
 		 *
 		 * On IT8782F, VIN7 is multiplexed with one of the UART6 pins.
@@ -2777,7 +2777,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		if ((sio_data->type == it8720 || uart6) && !(reg & BIT(1))) {
 			reg |= BIT(1);
 			superio_outb(sioaddr, IT87_SIO_PINX2_REG, reg);
-			pr_notice("Routing internal VCCH to in7\n");
+			pr_notice("Routing internal VCCH5V to in7\n");
 		}
 		if (reg & BIT(0))
 			sio_data->internal |= BIT(0);
@@ -2828,13 +2828,89 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	return err;
 }
 
+/*
+ * Some chips seem to have default value 0xff for all limit
+ * registers. For low voltage limits it makes no sense and triggers
+ * alarms, so change to 0 instead. For high temperature limits, it
+ * means -1 degree C, which surprisingly doesn't trigger an alarm,
+ * but is still confusing, so change to 127 degrees C.
+ */
+static void it87_check_limit_regs(struct it87_data *data)
+{
+	int i, reg;
+
+	for (i = 0; i < NUM_VIN_LIMIT; i++) {
+		reg = it87_read_value(data, IT87_REG_VIN_MIN(i));
+		if (reg == 0xff)
+			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
+	}
+	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
+		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
+		if (reg == 0xff)
+			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
+	}
+}
+
+/* Check if voltage monitors are reset manually or by some reason */
+static void it87_check_voltage_monitors_reset(struct it87_data *data)
+{
+	int reg;
+
+	reg = it87_read_value(data, IT87_REG_VIN_ENABLE);
+	if ((reg & 0xff) == 0) {
+		/* Enable all voltage monitors */
+		it87_write_value(data, IT87_REG_VIN_ENABLE, 0xff);
+	}
+}
+
+/* Check if tachometers are reset manually or by some reason */
+static void it87_check_tachometers_reset(struct platform_device *pdev)
+{
+	struct it87_sio_data *sio_data = dev_get_platdata(&pdev->dev);
+	struct it87_data *data = platform_get_drvdata(pdev);
+	u8 mask, fan_main_ctrl;
+
+	mask = 0x70 & ~(sio_data->skip_fan << 4);
+	fan_main_ctrl = it87_read_value(data, IT87_REG_FAN_MAIN_CTRL);
+	if ((fan_main_ctrl & mask) == 0) {
+		/* Enable all fan tachometers */
+		fan_main_ctrl |= mask;
+		it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
+				 fan_main_ctrl);
+	}
+}
+
+/* Set tachometers to 16-bit mode if needed */
+static void it87_check_tachometers_16bit_mode(struct platform_device *pdev)
+{
+	struct it87_data *data = platform_get_drvdata(pdev);
+	int reg;
+
+	if (!has_fan16_config(data))
+		return;
+
+	reg = it87_read_value(data, IT87_REG_FAN_16BIT);
+	if (~reg & 0x07 & data->has_fan) {
+		dev_dbg(&pdev->dev,
+			"Setting fan1-3 to 16-bit mode\n");
+		it87_write_value(data, IT87_REG_FAN_16BIT,
+				 reg | 0x07);
+	}
+}
+
+static void it87_start_monitoring(struct it87_data *data)
+{
+	it87_write_value(data, IT87_REG_CONFIG,
+			 (it87_read_value(data, IT87_REG_CONFIG) & 0x3e)
+			 | (update_vbat ? 0x41 : 0x01));
+}
+
 /* Called when we have found a new IT87. */
 static void it87_init_device(struct platform_device *pdev)
 {
 	struct it87_sio_data *sio_data = dev_get_platdata(&pdev->dev);
 	struct it87_data *data = platform_get_drvdata(pdev);
 	int tmp, i;
-	u8 mask;
 
 	/*
 	 * For each PWM channel:
@@ -2855,23 +2931,7 @@ static void it87_init_device(struct platform_device *pdev)
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
 
-	/*
-	 * Some chips seem to have default value 0xff for all limit
-	 * registers. For low voltage limits it makes no sense and triggers
-	 * alarms, so change to 0 instead. For high temperature limits, it
-	 * means -1 degree C, which surprisingly doesn't trigger an alarm,
-	 * but is still confusing, so change to 127 degrees C.
-	 */
-	for (i = 0; i < NUM_VIN_LIMIT; i++) {
-		tmp = it87_read_value(data, IT87_REG_VIN_MIN(i));
-		if (tmp == 0xff)
-			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
-	}
-	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
-		tmp = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
-		if (tmp == 0xff)
-			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
-	}
+	it87_check_limit_regs(data);
 
 	/*
 	 * Temperature channels are not forcibly enabled, as they can be
@@ -2880,38 +2940,19 @@ static void it87_init_device(struct platform_device *pdev)
 	 * run-time through the temp{1-3}_type sysfs accessors if needed.
 	 */
 
-	/* Check if voltage monitors are reset manually or by some reason */
-	tmp = it87_read_value(data, IT87_REG_VIN_ENABLE);
-	if ((tmp & 0xff) == 0) {
-		/* Enable all voltage monitors */
-		it87_write_value(data, IT87_REG_VIN_ENABLE, 0xff);
-	}
+	it87_check_voltage_monitors_reset(data);
+
+	it87_check_tachometers_reset(pdev);
 
-	/* Check if tachometers are reset manually or by some reason */
-	mask = 0x70 & ~(sio_data->skip_fan << 4);
 	data->fan_main_ctrl = it87_read_value(data, IT87_REG_FAN_MAIN_CTRL);
-	if ((data->fan_main_ctrl & mask) == 0) {
-		/* Enable all fan tachometers */
-		data->fan_main_ctrl |= mask;
-		it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
-				 data->fan_main_ctrl);
-	}
 	data->has_fan = (data->fan_main_ctrl >> 4) & 0x07;
 
-	tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
-
-	/* Set tachometers to 16-bit mode if needed */
-	if (has_fan16_config(data)) {
-		if (~tmp & 0x07 & data->has_fan) {
-			dev_dbg(&pdev->dev,
-				"Setting fan1-3 to 16-bit mode\n");
-			it87_write_value(data, IT87_REG_FAN_16BIT,
-					 tmp | 0x07);
-		}
-	}
+	it87_check_tachometers_16bit_mode(pdev);
 
 	/* Check for additional fans */
 	if (has_five_fans(data)) {
+		tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
+
 		if (tmp & BIT(4))
 			data->has_fan |= BIT(3); /* fan4 enabled */
 		if (tmp & BIT(5))
@@ -2933,10 +2974,7 @@ static void it87_init_device(struct platform_device *pdev)
 			sio_data->skip_pwm |= BIT(5);
 	}
 
-	/* Start monitoring */
-	it87_write_value(data, IT87_REG_CONFIG,
-			 (it87_read_value(data, IT87_REG_CONFIG) & 0x3e)
-			 | (update_vbat ? 0x41 : 0x01));
+	it87_start_monitoring(data);
 }
 
 /* Return 1 if and only if the PWM interface is safe to use */
