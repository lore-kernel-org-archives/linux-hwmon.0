Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-by2nam03on0054.outbound.protection.outlook.com ([104.47.42.54]:28980
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751412AbdBOMok (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Feb 2017 07:44:40 -0500
From: Marco Franchi <marco.franchi@nxp.com>
To: <linux@roeck-us.net>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <marcofrk@gmail.com>,
        <FoxPeter@kabelbw.de>, Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH v3 2/2] hwmon: (sht15) Add device tree support
Date: Wed, 15 Feb 2017 10:45:00 -0200
Message-ID: <1487162701-12097-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Allow the driver to work with device tree support.

Based on initial patch submission from Peter Fox.

Tested on a imx7d-sdb board connected to a SHT15 board via Mikro Bus.

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
Changes since v2:
- Propagate the real error code when of_get_named_gpio() fails
- Do not print error on EPROBE_DEFER case
- Changed the sht15_probe_dt function comments to be compatible with the returns values
 Documentation/devicetree/bindings/hwmon/sht15.txt | 25 +++++++++
 drivers/hwmon/sht15.c                             | 68 +++++++++++++++++++++--
 2 files changed, 89 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sht15.txt

diff --git a/Documentation/devicetree/bindings/hwmon/sht15.txt b/Documentation/devicetree/bindings/hwmon/sht15.txt
new file mode 100644
index 0000000..ddbc5a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sht15.txt
@@ -0,0 +1,25 @@
+Sensirion SHT15 Humidity and Temperature Sensor
+
+Required properties:
+
+ - "compatible": must be "sensirion,sht15".
+ - "data-gpios": GPIO connected to the data line.
+ - "clk-gpios": GPIO connected to the clock line.
+ - "vcc-supply": regulator that drives the VCC pin.
+
+Optional properties:
+
+ - "checksum": boolean property that when present enables the CRC validation of the readings.
+ - "no-otp-reload": boolean property that when present indicates not to reload from OTP.
+ - "low-resolution": boolean property that when present indicates that the device operates in
+		low-resolution mode.
+Example:
+
+	temp_humid_sensor: sht15 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sensor>;
+		compatible = "sensirion,sht15";
+		clk-gpios = <&gpio4 12 0>;
+		data-gpios = <&gpio4 13 0>;
+		vcc-supply = <&reg_sht15>;
+	};
diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index f16687c..7f86ded 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/bitrev.h>
+#include <linux/of_gpio.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -911,6 +912,58 @@ static int sht15_invalidate_voltage(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id sht15_dt_match[] = {
+	{ .compatible = "sensirion,sht15" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sht15_dt_match);
+
+/*
+ * This function returns NULL if pdev isn't a device instatiated by dt,
+ * a pointer to pdata if it could successfully get all information
+ * from dt or a negative ERR_PTR() on error.
+ */
+static struct sht15_platform_data *sht15_probe_dt(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct sht15_platform_data *pdata;
+
+	/* no device tree device */
+	if (!np)
+		return NULL;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->gpio_data = of_get_named_gpio(np, "data-gpios", 0);
+	if (pdata->gpio_data < 0) {
+		if (pdata->gpio_data != -EPROBE_DEFER)
+			dev_err(dev, "data-gpios not found\n");
+		return ERR_PTR(pdata->gpio_data);
+	}
+
+	pdata->gpio_sck = of_get_named_gpio(np, "clk-gpios", 0);
+	if (pdata->gpio_sck < 0) {
+		if (pdata->gpio_sck != -EPROBE_DEFER)
+			dev_err(dev, "clk-gpios not found\n");
+		return ERR_PTR(pdata->gpio_sck);
+	}
+
+	pdata->checksum = of_property_read_bool(np, "checksum");
+	pdata->no_otp_reload = of_property_read_bool(np, "no-otp-reload");
+	pdata->low_resolution = of_property_read_bool(np, "low-resolution");
+
+	return pdata;
+}
+#else
+static inline struct sht15_platform_data *sht15_probe_dt(struct device *dev)
+{
+	return NULL;
+}
+#endif
+
 static int sht15_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -928,11 +981,17 @@ static int sht15_probe(struct platform_device *pdev)
 	data->dev = &pdev->dev;
 	init_waitqueue_head(&data->wait_queue);
 
-	if (dev_get_platdata(&pdev->dev) == NULL) {
-		dev_err(&pdev->dev, "no platform data supplied\n");
-		return -EINVAL;
+	data->pdata = sht15_probe_dt(&pdev->dev);
+	if (IS_ERR(data->pdata))
+		return PTR_ERR(data->pdata);
+	if (data->pdata == NULL) {
+		data->pdata = dev_get_platdata(&pdev->dev);
+		if (data->pdata == NULL) {
+			dev_err(&pdev->dev, "no platform data supplied\n");
+			return -EINVAL;
+		}
 	}
-	data->pdata = dev_get_platdata(&pdev->dev);
+
 	data->supply_uv = data->pdata->supply_mv * 1000;
 	if (data->pdata->checksum)
 		data->checksumming = true;
@@ -1075,6 +1134,7 @@ MODULE_DEVICE_TABLE(platform, sht15_device_ids);
 static struct platform_driver sht15_driver = {
 	.driver = {
 		.name = "sht15",
+		.of_match_table = of_match_ptr(sht15_dt_match),
 	},
 	.probe = sht15_probe,
 	.remove = sht15_remove,
-- 
2.7.4

