Return-path: <>
From: "Andrew F. Davis" <afd@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
        Mark
 Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>
CC: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F .
 Davis" <afd@ti.com>
Subject: [PATCH v4 1/2] hwmon: Define binding for the INA3221 hwmon driver
Date: Tue, 31 May 2016 13:37:10 -0500
Message-ID: <20160531183711.9048-2-afd@ti.com>
In-Reply-To: <20160531183711.9048-1-afd@ti.com>
References: <20160531183711.9048-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Define a binding for the INA3221 Triple Current/Voltage Monitor.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/devicetree/bindings/hwmon/ina3221.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
new file mode 100644
index 0000000..8ec908b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
@@ -0,0 +1,19 @@
+Texas Instruments INA3221 Triple I2C Current/Voltage Monitor
+
+Required properties:
+ - compatible		: Should be "ti,ina3221".
+ - reg			: I2C address of the device.
+
+Optional properties:
+ - shunt-resistors	: Shunt resistor values in micro-Ohms for each channel.
+
+Example:
+
+&i2c {
+	hw_monitor@40 {
+		compatible = "ti,ina3221";
+		reg = <0x40>;
+
+		shunt-resistors = <1000>, <2000>, <500>;
+	};
+};
-- 
2.8.3
