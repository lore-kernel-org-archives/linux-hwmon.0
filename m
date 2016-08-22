Return-path: <mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] hwmon: (max6650.c) Add devicetree support documentation
Date: Mon, 22 Aug 2016 08:44:32 +0200
Message-Id: <1471848272-3032-1-git-send-email-mike.looijmans@topic.nl>
List-ID: <linux-hwmon@vger.kernel.org>

This adds the devicetree binding documentation for the max6650 fan
controller.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v2: Allow only 12V or 5V supply voltage
 .../devicetree/bindings/hwmon/max6650.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6650.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt b/Documentation/devicetree/bindings/hwmon/max6650.txt
new file mode 100644
index 0000000..d6c10e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
@@ -0,0 +1,23 @@
+Bindings for MAX6651 and MAX6650 I2C fan controllers
+
+Reference:
+[1]	https://datasheets.maximintegrated.com/en/ds/MAX6650-MAX6651.pdf
+
+Required properties:
+- compatible : One of "maxim,max6650" or "maxim,max6651"
+- reg        : I2C address, one of 0x1b, 0x1f, 0x4b, 0x48.
+
+Optional properties, default is to retain the chip's current setting:
+- maxim,fan-microvolt : The supply voltage of the fan, either 5000000 uV or
+			12000000 uV.
+- maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
+			allow more fine-grained control of slower fans.
+			Valid: 1, 2, 4, 8, 16.
+
+Example:
+	fan-max6650: max6650@1b {
+		reg = <0x1b>;
+		compatible = "maxim,max6650";
+		maxim,fan-microvolt = <12000000>;
+		maxim,fan-prescale = <4>;
+	};
-- 
1.9.1
