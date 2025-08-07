Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2580BEC
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Aug 2025 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754603493; cv=none; b=IomogVr2gMKDxEVLI+uo8W/JIgbk/73mo/MTHmV6AFFme1QxlxnnBBlikQgIps2uW4BPa3rDoha0znGnoLcNkXMzw+5sHOEBR6++CfRMpTbBmdte+itDpuNCi+2DirJfFajlR+pxeQa3Sqb6MxGtcfTTc+YF2zX4tZcu7Dn17mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754603493; c=relaxed/simple;
	bh=PnrQzuNCNiusPI3fmvdL8N2IZNVPVHT2ybruiMdjfTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXczxjC1NWaft9U9kfZf2c2uWnqmYMpr3RelEmd9ovc/+AGihTElG9Ck19bXT0CIWVYMcTX3RgGTWXK/Wd1WbmoY0gV0Jn6tJFpvf9PCvSZ2Syt73WPgzYsfmOJdM88+BL5tV13JL+5zqFkmnBNM9/bxQ3oNr2uHecRpyshNTmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbWkiEPp; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbWkiEPp"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e7f9bba93fso189280985a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Aug 2025 14:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754603490; x=1755208290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eB9bWi+I3cnRG04FX2D2sxNjgzLBQcgc5uP1PB3PNTY=;
        b=WbWkiEPpWFSzp7JvbYHj2rB5pCPzg+k8B2FQ/xxkVTI41dvW/XhZpF4EDtIMK62NAa
         JlkpvTXy9ZcH99BQoXUDDzJnImUQpx2UrTcZs2k71RAkkyQ1DSMG31vvZKv6BkKEmMKU
         EVO9mUE44IlkJQyrqJLlheUhWwVC7Pd5gZf9xljZy+UuHKa04bLUpUhXOfO4sVRerzX1
         OKKz9xXCHrK/zn6isIs1meXV9KWLFUGLILuYEBrWOw67uzH9bAeGy+qml79npW7msiju
         TYM/vQvdtvKMeM4kXIIr0ndOh0imTggv1JM2vrXVNpneoxu0TFseKZs3S5IAbpTcfhgh
         U+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754603490; x=1755208290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB9bWi+I3cnRG04FX2D2sxNjgzLBQcgc5uP1PB3PNTY=;
        b=qEmcs8TC3u5uEARHCs3nbux6dMyO4d+QmGWaZps+bXtKUUgT/HserHi1AMzxn3O/rr
         RKrD8mkocNuJfncum/necjVh2S0gukVzZK03QrawIMHS39loTw9GjAVI0BpuViHWQZZd
         94oyZex9jhpm7RMskeKVkgTHkeUla2BySMYdnDqdHge2CrwkGGWZUlifPWcfaTge8NB5
         1s53uBMIa96ghgTdk+D/DmFIzYJYsAdY6m8Zhc0RTxAN+1fWaSgG9DfXI1jsMkCk6vOc
         7aN/HAPr0/M/BvYrK5L8Q/kr881rUjetrol0BeE1pW2vQs6OMu6gHvXEPGro5Qu4XPGI
         XmZw==
X-Gm-Message-State: AOJu0YxSrJ9iMqqMTZmdnFepjrWvlyBMsQL9AelGtvwMiildGUpVH3F0
	gv8pzo4TutCAn7QcOXN739EBixvEatOv+dTY4mT1BxyPDfnqJnSLKmoYGlCQY6NnLg==
X-Gm-Gg: ASbGnct2W67IZvdZqlPRlowosowB0zIokH23uXQ05daUihhESvO+Np9BxtxzBXCdiSx
	uekDseSIm95BqnXRr0Q0JASJ3SEXP9lRghxUHPq2Lsf3kX/1qDvonCXlgqXFGSsEiuXxBmmssEC
	ZDWFlWIXAxZm7EQiOxhqSmAjkFwh/VaPpGMnxsakYKw2AUIRCNO+zWvnvBjsXI8nU/KDihEVWEq
	1Bt+TULKkm2W6wU71PVmvhwS5FzQ62eWTrtau5gkypqDSZRiYiK4+idVf3IA87/9bJ2H+DYbspw
	B+UP5jGtJYV2FjGip+EqgZWDgVWGcRi7akHazqIbhVJyd/OgLcSFVaAxmhRNFIcUf7hq3uI0hkD
	/fxz7ZnLMgKhsoADU2ySN7wNLzITO2XExjZXhcQaR0kw=
X-Google-Smtp-Source: AGHT+IGrSVzjT3K1X9CeclhBbjiOCm6TMJC6/VVXZpGBvRm4SmqnvwqvFZGq+kNf0jTuMMns9CQZpQ==
X-Received: by 2002:a05:620a:1a9c:b0:7e6:6048:9ef4 with SMTP id af79cd13be357-7e82c644bc5mr130051085a.5.1754603490087;
        Thu, 07 Aug 2025 14:51:30 -0700 (PDT)
Received: from LUS-PW00NJWH.teslamotors.com ([136.226.78.191])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f597fd2sm1002833785a.14.2025.08.07.14.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 14:51:29 -0700 (PDT)
From: Gregory Fuchedgi <gfuchedgi@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: robert.marko@sartura.hr,
	luka.perkov@sartura.hr,
	Gregory Fuchedgi <gfuchedgi@gmail.com>
Subject: [PATCH] hwmon: (tps23861) add class restrictions and semi-auto mode support
Date: Thu,  7 Aug 2025 14:50:37 -0700
Message-ID: <20250807215037.1891666-1-gfuchedgi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds optional individual per-port device tree nodes, in which ports
can be:
  - restricted by class. For example, class = <2> for a port would only enable
    power if class 1 or class 2 were negotiated. Requires interrupt handler to
    be configured if class != 4 (max supported). This is because hardware cannot
    be set with acceptable classes in advance. So the driver would enable
    Semi-Auto mode and in the interrupt handler would check negotiated class
    against device tree config and enable power only if it is acceptable class.
  - fully disabled. For boards that do not use all 4 ports. This would put
    disabled ports in Off state and would hide corresponding hwmon files.
  - off by default. The port is kept disabled, until enabled via corresponding
    in_enable in sysfs.

The driver keeps current behavior of using Auto mode for all ports if no
per-port device tree nodes given.

This commit also adds optional reset and shutdown pin support:
  - if reset pin is configured the chip will be reset in probe.
  - if both reset and shutdown pins are configured the driver would keep ports
    shut down while configuring the tps23861 over i2c. Having both shutdown and
    reset pins ensures no PoE activity happens while i2c configuration is
    happening.

Signed-off-by: Gregory Fuchedgi <gfuchedgi@gmail.com>
---
 .../bindings/hwmon/ti,tps23861.yaml           |  78 +++++-
 Documentation/hwmon/tps23861.rst              |   6 +-
 drivers/hwmon/tps23861.c                      | 253 +++++++++++++++++-
 3 files changed, 325 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
index ee7de53e1918..328050656ab8 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
@@ -24,12 +24,34 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
   shunt-resistor-micro-ohms:
     description: The value of current sense resistor in microohms.
     default: 255000
     minimum: 250000
     maximum: 255000
 
+  reset-gpios:
+    description: Optional GPIO for the reset pin.
+    maxItems: 1
+
+  shutdown-gpios:
+    description: |
+      Optional GPIO for the shutdown pin. Used to prevent PoE activity before
+      the driver had a chance to configure the chip.
+    maxItems: 1
+
+  interrupts:
+    description: |
+      The interrupt specifier. Only required if PoE class is restricted to less
+      than class 4 in the device tree.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -37,7 +59,27 @@ required:
 allOf:
   - $ref: hwmon-common.yaml#
 
-unevaluatedProperties: false
+additionalProperties:
+  type: object
+  description: Port specific nodes.
+  required:
+    - reg
+  properties:
+    reg:
+      description: Port index.
+      items:
+        minimum: 0
+        maximum: 3
+
+    class:
+      description: The maximum power class a port should accept.
+      $ref: /schemas/types.yaml#/definitions/uint32
+      minimum: 0
+      maximum: 4
+
+    off-by-default:
+      description: Indicates the port is off by default.
+      type: boolean
 
 examples:
   - |
@@ -51,3 +93,37 @@ examples:
             shunt-resistor-micro-ohms = <255000>;
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        tps23861@28 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ti,tps23861";
+            reg = <0x28>;
+            shunt-resistor-micro-ohms = <255000>;
+            reset-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+            shutdown-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <14 0>;
+            port1@0 {
+                    reg = <0>;
+                    class = <2>; // Max PoE class allowed.
+                    off-by-default;
+            };
+            port2@1 {
+                    reg = <1>;
+                    status = "disabled";
+            };
+            port3@2 {
+                    reg = <2>;
+                    status = "disabled";
+            };
+            port4@3 {
+                    reg = <3>;
+                    status = "disabled";
+            };
+        };
+    };
diff --git a/Documentation/hwmon/tps23861.rst b/Documentation/hwmon/tps23861.rst
index 46d121ff3f31..8deaed0d532f 100644
--- a/Documentation/hwmon/tps23861.rst
+++ b/Documentation/hwmon/tps23861.rst
@@ -22,9 +22,13 @@ and monitoring capabilities.
 
 TPS23861 offers three modes of operation: Auto, Semi-Auto and Manual.
 
-This driver only supports the Auto mode of operation providing monitoring
+This driver supports Auto and Semi-Auto modes of operation providing monitoring
 as well as enabling/disabling the four ports.
 
+Ports that do not have a child device tree entry will operate in Auto mode. If a
+class restriction is defined for a port in the device tree, that port will
+operate in Semi-Auto mode and require an interrupt pin.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
index 4cb3960d5170..9d0feffc2597 100644
--- a/drivers/hwmon/tps23861.c
+++ b/drivers/hwmon/tps23861.c
@@ -10,13 +10,26 @@
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 
+#define MAX_SUPPORTED_POE_CLASS		4
+#define INTERRUPT_STATUS		0x0
+#define INTERRUPT_ENABLE		0x1
+#define INTERRUPT_CLASS			BIT(4)
+#define DETECTION_EVENT			0x5
+#define POWER_STATUS			0x10
+#define PORT_1_ICUT			0x2A
+#define PORT_1_ICUT_MASK		GENMASK(2, 0)
+#define RESET				0x1a
+#define RESET_CLRAIN			0x80
 #define TEMPERATURE			0x2c
 #define INPUT_VOLTAGE_LSB		0x2e
 #define INPUT_VOLTAGE_MSB		0x2f
@@ -102,6 +115,10 @@
 #define TPS23861_GENERAL_MASK_1		0x17
 #define TPS23861_CURRENT_SHUNT_MASK	BIT(0)
 
+#define TPS23861_TIME_RESET_RANGE_US	5, 1000
+#define TPS23861_TIME_POWER_ON_RESET_MS 23
+#define TPS23861_TIME_I2C_MS		20
+
 #define TEMPERATURE_LSB			652 /* 0.652 degrees Celsius */
 #define VOLTAGE_LSB			3662 /* 3.662 mV */
 #define SHUNT_RESISTOR_DEFAULT		255000 /* 255 mOhm */
@@ -110,10 +127,27 @@
 #define RESISTANCE_LSB			110966 /* 11.0966 Ohm*/
 #define RESISTANCE_LSB_LOW		157216 /* 15.7216 Ohm*/
 
+struct tps23861_port_data { // From DT.
+	const char *name;
+	/* Maximum class accepted by the port. The hardware cannot be
+	 * preconfigured to accept certain class only, so classification
+	 * interrupt handler is required to for power-on decision if class is
+	 * not MAX_SUPPORTED_POE_CLASS. */
+	u32 class;
+	/* true if the port is disabled in the DT */
+	bool fully_disabled;
+	/* true if the port shouldn't be enabled on driver init */
+	bool off_by_default;
+};
+
 struct tps23861_data {
 	struct regmap *regmap;
 	u32 shunt_resistor;
 	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *shutdown_gpio;
+	int irq;
+	struct tps23861_port_data ports[TPS23861_NUM_PORTS];
 };
 
 static const struct regmap_config tps23861_regmap_config = {
@@ -205,13 +239,18 @@ static int tps23861_port_enable(struct tps23861_data *data, int channel)
 	regval |= BIT(channel);
 	regval |= BIT(channel + 4);
 	err = regmap_write(data->regmap, DETECT_CLASS_RESTART, regval);
-
-	return err;
+	if (err)
+		return err;
+	return regmap_write(data->regmap, RESET, RESET_CLRAIN);
 }
 
-static umode_t tps23861_is_visible(const void *data, enum hwmon_sensor_types type,
+static umode_t tps23861_is_visible(const void *input_data, enum hwmon_sensor_types type,
 				   u32 attr, int channel)
 {
+	const struct tps23861_data *data = input_data;
+	if (channel < TPS23861_NUM_PORTS && data->ports[channel].fully_disabled) {
+		return 0;
+	}
 	switch (type) {
 	case hwmon_temp:
 		switch (attr) {
@@ -325,10 +364,14 @@ static int tps23861_read_string(struct device *dev,
 				enum hwmon_sensor_types type,
 				u32 attr, int channel, const char **str)
 {
+	struct tps23861_data *data = dev_get_drvdata(dev);
 	switch (type) {
 	case hwmon_in:
 	case hwmon_curr:
-		*str = tps23861_port_label[channel];
+		if (channel < TPS23861_NUM_PORTS)
+			*str = data->ports[channel].name;
+		else
+			*str = tps23861_port_label[channel];
 		break;
 	case hwmon_temp:
 		*str = "Die";
@@ -371,7 +414,7 @@ static const struct hwmon_chip_info tps23861_chip_info = {
 	.info = tps23861_info,
 };
 
-static char *port_operating_mode_string(uint8_t mode_reg, unsigned int port)
+static const char *port_operating_mode_string(uint8_t mode_reg, unsigned int port)
 {
 	unsigned int mode = ~0;
 
@@ -392,7 +435,7 @@ static char *port_operating_mode_string(uint8_t mode_reg, unsigned int port)
 	}
 }
 
-static char *port_detect_status_string(uint8_t status_reg)
+static const char *port_detect_status_string(uint8_t status_reg)
 {
 	switch (FIELD_GET(PORT_STATUS_DETECT_MASK, status_reg)) {
 	case PORT_DETECT_UNKNOWN:
@@ -424,7 +467,7 @@ static char *port_detect_status_string(uint8_t status_reg)
 	}
 }
 
-static char *port_class_status_string(uint8_t status_reg)
+static const char *port_class_status_string(uint8_t status_reg)
 {
 	switch (FIELD_GET(PORT_STATUS_CLASS_MASK, status_reg)) {
 	case PORT_CLASS_UNKNOWN:
@@ -449,12 +492,12 @@ static char *port_class_status_string(uint8_t status_reg)
 	}
 }
 
-static char *port_poe_plus_status_string(uint8_t poe_plus, unsigned int port)
+static const char *port_poe_plus_status_string(uint8_t poe_plus, unsigned int port)
 {
 	return (BIT(port + 4) & poe_plus) ? "Yes" : "No";
 }
 
-static int tps23861_port_resistance(struct tps23861_data *data, int port)
+static unsigned int tps23861_port_resistance(struct tps23861_data *data, int port)
 {
 	unsigned int raw_val;
 	__le16 regval;
@@ -502,17 +545,155 @@ static int tps23861_port_status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(tps23861_port_status);
 
+static inline bool tps23861_auto_mode(struct tps23861_port_data *port)
+{
+	return port->class == MAX_SUPPORTED_POE_CLASS;
+}
+
+static irqreturn_t tps23861_irq_handler(int irq, void *dev_id) {
+	struct tps23861_data *data = (struct tps23861_data *)dev_id;
+	struct tps23861_port_data *ports = data->ports;
+	struct device *dev = &data->client->dev;
+
+	unsigned int intr_status, status, class, i;
+	unsigned int det_status = 0;
+	int ret;
+
+	ret = regmap_read(data->regmap, INTERRUPT_STATUS, &intr_status);
+	if (ret || intr_status == 0) {
+		return IRQ_NONE;
+	}
+	if (intr_status & INTERRUPT_CLASS) {
+		regmap_read(data->regmap, DETECTION_EVENT, &det_status);
+		for (i = 0; i < TPS23861_NUM_PORTS; i++) {
+			if (tps23861_auto_mode(ports+i)) {
+				continue;
+			}
+			if (!(det_status & BIT(i+4)))
+				continue;
+			ret = regmap_read(data->regmap, PORT_1_STATUS+i, &status);
+			if (ret)
+				continue;
+			class = FIELD_GET(PORT_STATUS_CLASS_MASK, status);
+			if (class == PORT_CLASS_0) {
+				/* class 0 is same power as class 3, change 0 to
+				 * 3 for easy comparison */
+				class = 3;
+			}
+			if (class == PORT_CLASS_UNKNOWN ||
+			    class > MAX_SUPPORTED_POE_CLASS) {
+				continue;
+			}
+			if (class > ports[i].class) {
+				dev_info(dev, "%s class mismatch: got %d, want <= %d",
+					 ports[i].name, class, ports[i].class);
+				continue;
+			}
+			regmap_read(data->regmap, POWER_STATUS, &status);
+			if (status & BIT(i)) {
+				continue; /* already enabled */
+			}
+			/* Set ICUT and poe+ according to class. Values in ICUT table happen
+			 * to match class values, so just set class. */
+			regmap_update_bits(data->regmap,
+					   PORT_1_ICUT + i/2,
+					   PORT_1_ICUT_MASK << ((i % 2) * 4),
+					   class << ((i % 2) * 4));
+			regmap_update_bits(data->regmap, POE_PLUS,
+					   BIT(i + 4),
+					   class > 3 ? BIT(i + 4) : 0);
+			dev_info(dev, "%s class %d, enabling power",
+				 ports[i].name, class);
+			regmap_write(data->regmap, POWER_ENABLE, BIT(i));
+		}
+	}
+	regmap_write(data->regmap, RESET, RESET_CLRAIN);
+	return IRQ_HANDLED;
+}
+
+static int tps23861_reset(struct i2c_client *client)
+{
+	struct tps23861_data *data = i2c_get_clientdata(client);
+	unsigned val;
+
+	if (data->reset_gpio) {
+		gpiod_direction_output(data->reset_gpio, true);
+		/* If shutdown pin is defined, use it to keep ports off, while
+		 * turning the chip on for i2c configuration. */
+		if (data->shutdown_gpio)
+			gpiod_direction_output(data->shutdown_gpio, true);
+		usleep_range(TPS23861_TIME_RESET_RANGE_US);
+		gpiod_set_value_cansleep(data->reset_gpio, false);
+		msleep(TPS23861_TIME_POWER_ON_RESET_MS);
+		if (data->shutdown_gpio)
+			gpiod_set_value_cansleep(data->shutdown_gpio, false);
+		msleep(TPS23861_TIME_I2C_MS);
+	}
+
+	/* Check the device is responsive */
+	return regmap_read(data->regmap, OPERATING_MODE, &val);
+}
+
+static void tps23861_init_ports(struct i2c_client *client)
+{
+	struct tps23861_data *data = i2c_get_clientdata(client);
+	struct tps23861_port_data *ports = data->ports;
+	unsigned i, mode;
+
+	for (i = 0; i < TPS23861_NUM_PORTS; i++) {
+		mode = ports[i].fully_disabled       ? OPERATING_MODE_OFF :
+		       tps23861_auto_mode(&ports[i]) ? OPERATING_MODE_AUTO :
+		                                       OPERATING_MODE_SEMI;
+		regmap_update_bits(data->regmap, OPERATING_MODE,
+				   OPERATING_MODE_PORT_1_MASK << (2*i),
+				   mode << (2*i));
+		if (ports[i].fully_disabled)
+			continue;
+		if (ports[i].off_by_default)
+			tps23861_port_disable(data, i);
+		else
+			tps23861_port_enable(data, i);
+	}
+}
+
+
 static int tps23861_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct tps23861_data *data;
+	struct tps23861_port_data *ports;
 	struct device *hwmon_dev;
+	struct gpio_desc *gpio;
+	struct device_node *child;
 	u32 shunt_resistor;
+	int ret;
+	unsigned i;
+	bool need_irq = false;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	ports = data->ports;
+	for (i = 0; i < TPS23861_NUM_PORTS; i++) {
+		ports[i].name = tps23861_port_label[i];
+		ports[i].class = MAX_SUPPORTED_POE_CLASS;
+	}
+
+	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(gpio)) {
+		devm_kfree(dev, data);
+		return -EPROBE_DEFER;
+	}
+	data->reset_gpio = gpio;
+
+	gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_ASIS);
+	if (IS_ERR(gpio)) {
+		devm_kfree(dev, data);
+		return -EPROBE_DEFER;
+	}
+	data->shutdown_gpio = gpio;
+
 	data->client = client;
 	i2c_set_clientdata(client, data);
 
@@ -521,6 +702,56 @@ static int tps23861_probe(struct i2c_client *client)
 		dev_err(dev, "failed to allocate register map\n");
 		return PTR_ERR(data->regmap);
 	}
+	ret = tps23861_reset(client);
+	if (ret) {
+		return -ENODEV;
+	}
+	for_each_child_of_node(dev->of_node, child) {
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i >= TPS23861_NUM_PORTS) {
+			dev_err(dev, "node %s must define 'reg' < %d\n",
+				child->name, TPS23861_NUM_PORTS);
+			continue;
+		}
+		if (!of_device_is_available(child)) {
+			ports[i].fully_disabled = true;
+			continue;
+		}
+		ports[i].name = child->name;
+		ports[i].off_by_default = of_property_read_bool(child, "off-by-default");
+		of_property_read_u32(child, "class", &ports[i].class);
+		if (ports[i].class > MAX_SUPPORTED_POE_CLASS) {
+			dev_err(dev, "%s invalid class, disabling\n", child->name);
+			ports[i].fully_disabled = true;
+			continue;
+		}
+		if (ports[i].class == 0) {
+			/* class 0 is same power as class 3, change 0 to 3 for
+			 * easy comparison */
+			ports[i].class = 3;
+		}
+		need_irq = need_irq || !tps23861_auto_mode(&ports[i]);
+		dev_info(dev, "%s: max class: %d, %s by default\n",
+			 ports[i].name, ports[i].class,
+			 ports[i].off_by_default ? "off" : "on");
+	}
+	if (need_irq) {
+		data->irq = irq_of_parse_and_map(dev->of_node, 0);
+		if (!data->irq) {
+			dev_err(dev, "failed to configure irq\n");
+			return -EINVAL;
+		}
+		ret = devm_request_threaded_irq(dev, data->irq, NULL,
+						tps23861_irq_handler,
+						IRQF_TRIGGER_FALLING,
+						"tps23861_irq", data);
+		if (ret) {
+			dev_err(dev, "failed to request irq %d\n", data->irq);
+			return ret;
+		}
+		dev_info(dev, "irq successfully requested\n");
+		regmap_write(data->regmap, INTERRUPT_ENABLE, INTERRUPT_CLASS);
+	}
 
 	if (!of_property_read_u32(dev->of_node, "shunt-resistor-micro-ohms", &shunt_resistor))
 		data->shunt_resistor = shunt_resistor;
@@ -536,7 +767,9 @@ static int tps23861_probe(struct i2c_client *client)
 				TPS23861_GENERAL_MASK_1,
 				TPS23861_CURRENT_SHUNT_MASK);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+	tps23861_init_ports(client);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, dev->of_node->name,
 							 data, &tps23861_chip_info,
 							 NULL);
 	if (IS_ERR(hwmon_dev))
-- 
2.43.0

