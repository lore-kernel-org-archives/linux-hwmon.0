Return-Path: <mail@maciej.szmigiero.name>
Return-path: <mail@maciej.szmigiero.name>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH] hwmon: (it87) Reapply probe path chip registers settings
 after resume
Message-ID: <363dba2e-c228-4b85-897c-e74eb33aed90@maciej.szmigiero.name>
Date: Sun, 23 Jul 2017 18:12:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

After a suspend / resume cycle we possibly need to reapply chip registers
settings that we had set or fixed in a probe path, since they might have
been reset to default values or set incorrectly by a BIOS again.

Tested on a Gigabyte M720-US3 board, which requires routing internal VCCH5V
to in7 (and had it wrong again on resume from S3).

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/hwmon/it87.c | 148 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 112 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4dfc7238313e..e33af2e5f4ce 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -497,6 +497,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 
 struct it87_sio_data {
+	int sioaddr;
 	enum chips type;
 	/* Values read from Super-I/O config space */
 	u8 revision;
@@ -517,6 +518,7 @@ struct it87_sio_data {
  */
 struct it87_data {
 	const struct attribute_group *groups[7];
+	int sioaddr;
 	enum chips type;
 	u32 features;
 	u8 peci_mask;
@@ -2389,10 +2391,11 @@ static const struct attribute_group it87_group_auto_pwm = {
 };
 
 /* SuperIO detection - will change isa_address if a chip is found */
-static int __init it87_find(int sioaddr, unsigned short *address,
+static int __init it87_find(unsigned short *address,
 			    struct it87_sio_data *sio_data)
 {
 	int err;
+	int sioaddr = sio_data->sioaddr;
 	u16 chip_type;
 	const char *board_vendor, *board_name;
 	const struct it87_devices *config;
@@ -2828,13 +2831,13 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	return err;
 }
 
-/* Called when we have found a new IT87. */
-static void it87_init_device(struct platform_device *pdev)
+/* Called when we have found a new IT87 or on resume. */
+static void it87_init_device(struct platform_device *pdev, bool resume)
 {
 	struct it87_sio_data *sio_data = dev_get_platdata(&pdev->dev);
 	struct it87_data *data = platform_get_drvdata(pdev);
 	int tmp, i;
-	u8 mask;
+	u8 mask, fan_main_ctrl;
 
 	/*
 	 * For each PWM channel:
@@ -2849,7 +2852,7 @@ static void it87_init_device(struct platform_device *pdev)
 	 * these have separate registers for the temperature mapping and the
 	 * manual duty cycle.
 	 */
-	for (i = 0; i < NUM_AUTO_PWM; i++) {
+	for (i = 0; !resume && i < NUM_AUTO_PWM; i++) {
 		data->pwm_temp_map[i] = i;
 		data->pwm_duty[i] = 0x7f;	/* Full speed */
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
@@ -2889,14 +2892,18 @@ static void it87_init_device(struct platform_device *pdev)
 
 	/* Check if tachometers are reset manually or by some reason */
 	mask = 0x70 & ~(sio_data->skip_fan << 4);
-	data->fan_main_ctrl = it87_read_value(data, IT87_REG_FAN_MAIN_CTRL);
-	if ((data->fan_main_ctrl & mask) == 0) {
+	fan_main_ctrl = it87_read_value(data, IT87_REG_FAN_MAIN_CTRL);
+	if ((fan_main_ctrl & mask) == 0) {
 		/* Enable all fan tachometers */
-		data->fan_main_ctrl |= mask;
+		fan_main_ctrl |= mask;
 		it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
-				 data->fan_main_ctrl);
+				 fan_main_ctrl);
+	}
+
+	if (!resume) {
+		data->fan_main_ctrl = fan_main_ctrl;
+		data->has_fan = (fan_main_ctrl >> 4) & 0x07;
 	}
-	data->has_fan = (data->fan_main_ctrl >> 4) & 0x07;
 
 	tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
 
@@ -2910,27 +2917,29 @@ static void it87_init_device(struct platform_device *pdev)
 		}
 	}
 
-	/* Check for additional fans */
-	if (has_five_fans(data)) {
-		if (tmp & BIT(4))
-			data->has_fan |= BIT(3); /* fan4 enabled */
-		if (tmp & BIT(5))
-			data->has_fan |= BIT(4); /* fan5 enabled */
-		if (has_six_fans(data) && (tmp & BIT(2)))
-			data->has_fan |= BIT(5); /* fan6 enabled */
-	}
-
-	/* Fan input pins may be used for alternative functions */
-	data->has_fan &= ~sio_data->skip_fan;
+	if (!resume) {
+		/* Check for additional fans */
+		if (has_five_fans(data)) {
+			if (tmp & BIT(4))
+				data->has_fan |= BIT(3); /* fan4 enabled */
+			if (tmp & BIT(5))
+				data->has_fan |= BIT(4); /* fan5 enabled */
+			if (has_six_fans(data) && (tmp & BIT(2)))
+				data->has_fan |= BIT(5); /* fan6 enabled */
+		}
 
-	/* Check if pwm5, pwm6 are enabled */
-	if (has_six_pwm(data)) {
-		/* The following code may be IT8620E specific */
-		tmp = it87_read_value(data, IT87_REG_FAN_DIV);
-		if ((tmp & 0xc0) == 0xc0)
-			sio_data->skip_pwm |= BIT(4);
-		if (!(tmp & BIT(3)))
-			sio_data->skip_pwm |= BIT(5);
+		/* Fan input pins may be used for alternative functions */
+		data->has_fan &= ~sio_data->skip_fan;
+
+		/* Check if pwm5, pwm6 are enabled */
+		if (has_six_pwm(data)) {
+			/* The following code may be IT8620E specific */
+			tmp = it87_read_value(data, IT87_REG_FAN_DIV);
+			if ((tmp & 0xc0) == 0xc0)
+				sio_data->skip_pwm |= BIT(4);
+			if (!(tmp & BIT(3)))
+				sio_data->skip_pwm |= BIT(5);
+		}
 	}
 
 	/* Start monitoring */
@@ -2940,7 +2949,7 @@ static void it87_init_device(struct platform_device *pdev)
 }
 
 /* Return 1 if and only if the PWM interface is safe to use */
-static int it87_check_pwm(struct device *dev)
+static int it87_check_pwm(struct device *dev, bool resume)
 {
 	struct it87_data *data = dev_get_drvdata(dev);
 	/*
@@ -2986,8 +2995,10 @@ static int it87_check_pwm(struct device *dev)
 				 "PWM configuration is too broken to be fixed\n");
 		}
 
-		dev_info(dev,
-			 "Detected broken BIOS defaults, disabling PWM interface\n");
+		if (!resume)
+			dev_info(dev,
+				 "Detected broken BIOS defaults, disabling PWM interface\n");
+
 		return 0;
 	} else if (fix_pwm_polarity) {
 		dev_info(dev,
@@ -3020,6 +3031,7 @@ static int it87_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->addr = res->start;
+	data->sioaddr = sio_data->sioaddr;
 	data->type = sio_data->type;
 	data->features = it87_devices[sio_data->type].features;
 	data->peci_mask = it87_devices[sio_data->type].peci_mask;
@@ -3057,7 +3069,7 @@ static int it87_probe(struct platform_device *pdev)
 	mutex_init(&data->update_lock);
 
 	/* Check PWM configuration */
-	enable_pwm_interface = it87_check_pwm(dev);
+	enable_pwm_interface = it87_check_pwm(dev, false);
 
 	/* Starting with IT8721F, we handle scaling of internal voltages */
 	if (has_12mv_adc(data)) {
@@ -3110,7 +3122,7 @@ static int it87_probe(struct platform_device *pdev)
 	data->has_beep = !!sio_data->beep_pin;
 
 	/* Initialize the IT87 chip */
-	it87_init_device(pdev);
+	it87_init_device(pdev, false);
 
 	if (!sio_data->skip_vid) {
 		data->has_vid = true;
@@ -3140,9 +3152,72 @@ static int it87_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static int it87_resume_sio(struct platform_device *pdev)
+{
+	struct it87_data *data = dev_get_drvdata(&pdev->dev);
+	int err;
+	int reg2c;
+
+	if (!(data->in_internal & BIT(1)))
+		return 0;
+
+	if (has_in7_internal(data))
+		return 0;
+
+	err = superio_enter(data->sioaddr);
+	if (err)
+		return err;
+
+	superio_select(data->sioaddr, GPIO);
+
+	reg2c = superio_inb(data->sioaddr, IT87_SIO_PINX2_REG);
+	if (!(reg2c & BIT(1))) {
+		dev_notice(&pdev->dev,
+			   "Routing internal VCCH5V to in7 again");
+
+		reg2c |= BIT(1);
+		superio_outb(data->sioaddr, IT87_SIO_PINX2_REG,
+			     reg2c);
+	}
+
+	superio_exit(data->sioaddr);
+
+	return 0;
+}
+
+static int __maybe_unused it87_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct it87_data *data = dev_get_drvdata(dev);
+	int err;
+
+	err = it87_resume_sio(pdev);
+	if (err)
+		dev_err(dev,
+			"Unable to resume Super I/O (%d)",
+			err);
+
+	mutex_lock(&data->update_lock);
+
+	it87_check_pwm(dev, true);
+	it87_init_device(pdev, true);
+
+	/* force update */
+	data->valid = 0;
+
+	mutex_unlock(&data->update_lock);
+
+	it87_update_device(dev);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(it87_dev_pm_ops, NULL, it87_resume);
+
 static struct platform_driver it87_driver = {
 	.driver = {
 		.name	= DRVNAME,
+		.pm     = &it87_dev_pm_ops,
 	},
 	.probe	= it87_probe,
 };
@@ -3208,8 +3283,9 @@ static int __init sm_it87_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
+		sio_data.sioaddr = sioaddr[i];
 		isa_address[i] = 0;
-		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
+		err = it87_find(&isa_address[i], &sio_data);
 		if (err || isa_address[i] == 0)
 			continue;
 		/*
