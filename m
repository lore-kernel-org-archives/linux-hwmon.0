Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36366 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755005AbdCUDYo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Mar 2017 23:24:44 -0400
Received: by mail-io0-f194.google.com with SMTP id 68so6168981ioh.3
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Mar 2017 20:24:43 -0700 (PDT)
From: Sam Povilus <kernel.development@povil.us>
To: wsa@the-dreams.de, jdelvare@suse.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: Sam Povilus <kernel.development@povil.us>
Subject: [PATCH v5] hwmon: ads7828 optional parameters from the device tree
Date: Mon, 20 Mar 2017 21:24:34 -0600
Message-Id: <20170321032434.9268-1-kernel.development@povil.us>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Adding the ability for the ads7828 and ads7830 to use the device tree to
get their optional parameters, instead of using platform devices. This
allows people using custom boards to also use the ads7828 in a non-default
manner.

v2: conforming to coding style
v3: changing from "_" to "-" for device tree entries
v4: using regulator subsystem for voltage source, renaming differential
    input property
v5: checking for invalid vref values sooner and returning error if they are
    bad, not warning user.

Signed-off-by: Sam Povilus <kernel.development@povil.us>
---
 .../devicetree/bindings/hwmon/ads7828.txt          | 26 ++++++++++++++++++++++
 .../devicetree/bindings/i2c/trivial-devices.txt    |  2 --
 drivers/hwmon/ads7828.c                            | 21 +++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ads7828.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ads7828.txt b/Documentation/devicetree/bindings/hwmon/ads7828.txt
new file mode 100644
index 000000000000..5a0c4a7c6144
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ads7828.txt
@@ -0,0 +1,26 @@
+ads7828 properties
+
+Required properties:
+- compatible: Should be one of
+	       ti,ads7828
+	       ti,ads7830
+- reg: I2C address
+
+Optional properties:
+
+- ti,differential-input
+  Set to use the device in differential mode.
+- vref
+  The external reference on the device is set to this regulators output. If it
+  does not exists the internal reference will be used and output by the ads78xx
+  on the "external vref" pin.
+
+  Example ADS7828 node:
+
+  ads7828: ads@48 {
+  	   comatible = "ti,ads7828";
+	   reg = <0x48>;
+	   vref = <&vref>;
+	   ti,differential-input;
+  };
+
diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index cdd7b48826c3..87648909f6ce 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -163,8 +163,6 @@ st,m41t00		Serial real-time clock (RTC)
 st,m41t62		Serial real-time clock (RTC) with alarm
 st,m41t80		M41T80 - SERIAL ACCESS RTC WITH ALARMS
 taos,tsl2550		Ambient Light Sensor with SMBUS/Two Wire Serial Interface
-ti,ads7828		8-Channels, 12-bit ADC
-ti,ads7830		8-Channels, 8-bit ADC
 ti,tsc2003		I2C Touch-Screen Controller
 ti,tmp102		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
 ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index ee396ff167d9..0be4804a9e59 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -34,6 +34,9 @@
 #include <linux/platform_data/ads7828.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/regulator/consumer.h>
+
+#define MV_TO_UV 1000
 
 /* The ADS7828 registers */
 #define ADS7828_CMD_SD_SE	0x80	/* Single ended inputs */
@@ -118,9 +121,12 @@ static int ads7828_probe(struct i2c_client *client,
 	struct ads7828_data *data;
 	struct device *hwmon_dev;
 	unsigned int vref_mv = ADS7828_INT_VREF_MV;
+	unsigned int vref_uv;
 	bool diff_input = false;
 	bool ext_vref = false;
 	unsigned int regval;
+	struct regulator *reg;
+
 
 	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
 	if (!data)
@@ -131,6 +137,21 @@ static int ads7828_probe(struct i2c_client *client,
 		ext_vref = pdata->ext_vref;
 		if (ext_vref && pdata->vref_mv)
 			vref_mv = pdata->vref_mv;
+	} else if (dev->of_node) {
+		if (of_get_property(dev->of_node, "ti,differential-input",
+				    NULL))
+			diff_input = true;
+		reg = devm_regulator_get_optional(dev, "vref");
+		if (!IS_ERR(reg)) {
+			vref_uv = regulator_get_voltage(reg);
+			if ((vref_uv >= ADS7828_EXT_VREF_MV_MIN * MV_TO_UV) &&
+			    (vref_uv <= ADS7828_EXT_VREF_MV_MAX * MV_TO_UV)) {
+				vref_mv = DIV_ROUND_CLOSEST(vref_uv, MV_TO_UV);
+				ext_vref = true;
+			} else {
+				return  -EINVAL;
+			}
+		}
 	}
 
 	/* Bound Vref with min/max values */
-- 
2.11.0

