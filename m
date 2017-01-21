Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33416 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750943AbdAUT1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2017 14:27:03 -0500
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH 2/2] hwmon: (lm70) Add support for TI TMP122/124
Date: Sat, 21 Jan 2017 11:20:10 -0800
Message-Id: <20170121192010.30681-3-f.fainelli@gmail.com>
In-Reply-To: <20170121192010.30681-1-f.fainelli@gmail.com>
References: <20170121192010.30681-1-f.fainelli@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for Texas Instruments TMP122/124 which are nearly identical to
their TMP121/123 except that they also support programmable temperature
thresholds.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/lm70.txt | 1 +
 Documentation/hwmon/lm70                         | 8 ++++++--
 drivers/hwmon/lm70.c                             | 9 ++++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lm70.txt b/Documentation/devicetree/bindings/hwmon/lm70.txt
index e7fd921aa4f1..ea417a0d32af 100644
--- a/Documentation/devicetree/bindings/hwmon/lm70.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm70.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible: one of
 		"ti,lm70"
 		"ti,tmp121"
+		"ti,tmp122"
 		"ti,lm71"
 		"ti,lm74"
 
diff --git a/Documentation/hwmon/lm70 b/Documentation/hwmon/lm70
index 1bb2db440671..c3a1f2ea017d 100644
--- a/Documentation/hwmon/lm70
+++ b/Documentation/hwmon/lm70
@@ -6,6 +6,8 @@ Supported chips:
     Datasheet: http://www.national.com/pf/LM/LM70.html
   * Texas Instruments TMP121/TMP123
     Information: http://focus.ti.com/docs/prod/folders/print/tmp121.html
+  * Texas Instruments TMP122/TMP124
+    Information: http://www.ti.com/product/tmp122
   * National Semiconductor LM71
     Datasheet: http://www.ti.com/product/LM71
   * National Semiconductor LM74
@@ -35,8 +37,10 @@ As a real (in-tree) example of this "SPI protocol driver" interfacing
 with a "SPI master controller driver", see drivers/spi/spi_lm70llp.c
 and its associated documentation.
 
-The LM74 and TMP121/TMP123 are very similar; main difference is 13-bit
-temperature data (0.0625 degrees celsius resolution).
+The LM74 and TMP121/TMP122/TMP123/TMP124 are very similar; main difference is
+13-bit temperature data (0.0625 degrees celsius resolution).
+
+The TMP122/TMP124 also feature configurable temperature thresholds.
 
 The LM71 is also very similar; main difference is 14-bit temperature
 data (0.03125 degrees celsius resolution).
diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index 52c5cdd00448..543556dc563b 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -46,6 +46,7 @@
 #define LM70_CHIP_TMP121	1	/* TI TMP121/TMP123 */
 #define LM70_CHIP_LM71		2	/* NS LM71 */
 #define LM70_CHIP_LM74		3	/* NS LM74 */
+#define LM70_CHIP_TMP122	4	/* TI TMP122/TMP124 */
 
 struct lm70 {
 	struct spi_device *spi;
@@ -92,7 +93,7 @@ static ssize_t temp1_input_show(struct device *dev,
 	 * Celsius.
 	 * So it's equivalent to multiplying by 0.25 * 1000 = 250.
 	 *
-	 * LM74 and TMP121/TMP123:
+	 * LM74 and TMP121/TMP122/TMP123/TMP124:
 	 * 13 bits of 2's complement data, discard LSB 3 bits,
 	 * resolution 0.0625 degrees celsius.
 	 *
@@ -106,6 +107,7 @@ static ssize_t temp1_input_show(struct device *dev,
 		break;
 
 	case LM70_CHIP_TMP121:
+	case LM70_CHIP_TMP122:
 	case LM70_CHIP_LM74:
 		val = ((int)raw / 8) * 625 / 10;
 		break;
@@ -143,6 +145,10 @@ static const struct of_device_id lm70_of_ids[] = {
 		.data = (void *) LM70_CHIP_TMP121,
 	},
 	{
+		.compatible = "ti,tmp122",
+		.data = (void *) LM70_CHIP_TMP122,
+	},
+	{
 		.compatible = "ti,lm71",
 		.data = (void *) LM70_CHIP_LM71,
 	},
@@ -191,6 +197,7 @@ static int lm70_probe(struct spi_device *spi)
 static const struct spi_device_id lm70_ids[] = {
 	{ "lm70",   LM70_CHIP_LM70 },
 	{ "tmp121", LM70_CHIP_TMP121 },
+	{ "tmp122", LM70_CHIP_TMP122 },
 	{ "lm71",   LM70_CHIP_LM71 },
 	{ "lm74",   LM70_CHIP_LM74 },
 	{ },
-- 
2.9.3

