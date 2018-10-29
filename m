Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51397 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbeJ2XY1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Oct 2018 19:24:27 -0400
From: Marco Felsch <m.felsch@pengutronix.de>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, tpiepho@impinj.com,
        dmitry.torokhov@gmail.com, kernel@pengutronix.de
Subject: [PATCH v2 1/2] dt-binding: hwmon: add gpio-brownout bindings
Date: Mon, 29 Oct 2018 15:35:20 +0100
Message-Id: <20181029143521.22122-2-m.felsch@pengutronix.de>
In-Reply-To: <20181029143521.22122-1-m.felsch@pengutronix.de>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add dt-bindings for gpio-brownout detection devices. Such a device
determines the voltage good/bad state by the gpio line level.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/hwmon/gpio-brownout.txt          | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/gpio-brownout.txt

diff --git a/Documentation/devicetree/bindings/hwmon/gpio-brownout.txt b/Documentation/devicetree/bindings/hwmon/gpio-brownout.txt
new file mode 100644
index 000000000000..f3272befc8f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/gpio-brownout.txt
@@ -0,0 +1,32 @@
+Device-Tree bindings for GPIO line brownout detection
+
+Required properties:
+- compatible: Must be "gpio-brownout"
+- gpio-brownout,sense-gpios: This gpio is used to detect a brownout. The gpio
+  must support interrupts.
+
+Optional properties:
+- gpio-brownout,dev-list: A list of i2c or spi device phandles. All
+  listed devices will be released from their drivers in the order they listed
+  upon a brownout detection. This can be helpful to avoid a interrupt flood,
+  because some system designs power off all external devices immediately and
+  keep the host on for a certain time.
+
+Example:
+
+i2c3 {
+	temp_core: lm75@48 { };
+	temp_chassis: lm75@49 { };
+};
+
+spi1 {
+	ts: ad7879@1 { };
+};
+
+/ {
+	gpio_brownout {
+		compatible = "gpio-brownout";
+		gpio-brownout,sense-gpios = <&gpio3 3 GPIO_ACTIVE_LOW>;
+		gpio-brownout,dev-list = <&temp_core &ts>;
+	};
+};
-- 
2.19.1
