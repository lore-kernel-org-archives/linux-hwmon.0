Return-Path: <atull@kernel.org>
Return-path: <atull@kernel.org>
From: Alan Tull <atull@kernel.org>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alan Tull <atull@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: add compatible for max1619
Date: Mon, 11 Sep 2017 14:16:48 -0500
Message-Id: <20170911191649.3344-1-atull@kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

Add new device tree bindings document for max1619 device
including a new compatible string.

Signed-off-by: Alan Tull <atull@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 Documentation/devicetree/bindings/hwmon/max1619.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max1619.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max1619.txt b/Documentation/devicetree/bindings/hwmon/max1619.txt
new file mode 100644
index 0000000..c70dbbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max1619.txt
@@ -0,0 +1,12 @@
+Bindings for MAX1619 Temperature Sensor
+
+Required properties:
+- compatible : "maxim,max1619"
+- reg        : I2C address, one of 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, or
+               0x4d, 0x4e
+
+Example:
+	temp@4c {
+		compatible = "maxim,max1619";
+		reg = <0x4c>;
+	};
-- 
2.7.4
