Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.tdt.de ([195.243.126.94]:56079 "EHLO mail.dev.tdt.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751895AbdHUIUJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Aug 2017 04:20:09 -0400
From: Florian Eckert <fe@dev.tdt.de>
To: linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (adcxx) Add device tree support
Date: Mon, 21 Aug 2017 10:19:52 +0200
Message-Id: <20170821081952.18508-2-fe@dev.tdt.de>
In-Reply-To: <20170821081952.18508-1-fe@dev.tdt.de>
References: <20170821081952.18508-1-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add device tree supoort for this driver.
Set reference voltage of ADC with the regulator device tree property.
If not set use default 3300000uV (3.3V).

- vref-supply

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
v2:
- use regulator voltage binding
- use dev_dbg
 drivers/hwmon/adcxx.c | 62 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/adcxx.c b/drivers/hwmon/adcxx.c
index 69e0bb97e597..6f3e7d65b5b8 100644
--- a/drivers/hwmon/adcxx.c
+++ b/drivers/hwmon/adcxx.c
@@ -4,6 +4,7 @@
  * The adcxx4s is an AD converter family from National Semiconductor (NS).
  *
  * Copyright (c) 2008 Marc Pignat <marc.pignat@hevs.ch>
+ * Copyright (c) 2017 Florian Eckert <fe@dev.tdt.de>
  *
  * The adcxx4s communicates with a host processor via an SPI/Microwire Bus
  * interface. This driver supports the whole family of devices with name
@@ -46,9 +47,16 @@
 #include <linux/mutex.h>
 #include <linux/mod_devicetable.h>
 #include <linux/spi/spi.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
 
 #define DRVNAME		"adcxx"
 
+#define ADCXX1S  1
+#define ADCXX2S  2
+#define ADCXX4S  4
+#define ADCXX8S  8
+
 struct adcxx {
 	struct device *hwmon_dev;
 	struct mutex lock;
@@ -159,21 +167,60 @@ static struct sensor_device_attribute ad_input[] = {
 	SENSOR_ATTR(in7_input, S_IRUGO, adcxx_read, NULL, 7),
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id adcxx_of_ids[] = {
+	{
+		.compatible = "national,adcxx1s",
+		.data = (void *) ADCXX1S,
+	},
+	{
+		.compatible = "national,adcxx2s",
+		.data = (void *) ADCXX2S,
+	},
+	{
+		.compatible = "national,adcxx4s",
+		.data = (void *) ADCXX4S,
+	},
+	{
+		.compatible = "national,adcxx8s",
+	.	data = (void *) ADCXX8S,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, adcxx_of_ids);
+#endif
+
 /*----------------------------------------------------------------------*/
 
 static int adcxx_probe(struct spi_device *spi)
 {
-	int channels = spi_get_device_id(spi)->driver_data;
+	const struct of_device_id *match;
+	struct regulator *vref;
+	int vref_uv;
+	int channels;
 	struct adcxx *adc;
 	int status;
 	int i;
 
+	match = of_match_device(adcxx_of_ids, &spi->dev);
+	if (match)
+		channels = (int)(uintptr_t)match->data;
+	else
+		channels = spi_get_device_id(spi)->driver_data;
+
 	adc = devm_kzalloc(&spi->dev, sizeof(*adc), GFP_KERNEL);
 	if (!adc)
 		return -ENOMEM;
 
-	/* set a default value for the reference */
-	adc->reference = 3300;
+	vref = devm_regulator_get_optional(&spi->dev, "vref");
+	if (!IS_ERR(vref)) {
+		vref_uv = regulator_get_voltage(vref);
+		adc->reference = DIV_ROUND_CLOSEST(vref_uv, 1000);
+	}
+	if (!adc->reference)
+		adc->reference = 3300;
+	dev_dbg(&spi->dev, "Reference voltage set to %dmV\n", adc->reference);
+
 	adc->channels = channels;
 	mutex_init(&adc->lock);
 
@@ -223,10 +270,10 @@ static int adcxx_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id adcxx_ids[] = {
-	{ "adcxx1s", 1 },
-	{ "adcxx2s", 2 },
-	{ "adcxx4s", 4 },
-	{ "adcxx8s", 8 },
+	{ "adcxx1s", ADCXX1S },
+	{ "adcxx2s", ADCXX2S },
+	{ "adcxx4s", ADCXX4S },
+	{ "adcxx8s", ADCXX8S },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, adcxx_ids);
@@ -234,6 +281,7 @@ MODULE_DEVICE_TABLE(spi, adcxx_ids);
 static struct spi_driver adcxx_driver = {
 	.driver = {
 		.name	= "adcxx",
+		.of_match_table = of_match_ptr(adcxx_of_ids),
 	},
 	.id_table = adcxx_ids,
 	.probe	= adcxx_probe,
-- 
2.11.0

