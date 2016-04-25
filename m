Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:40466 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933421AbcDYTkN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Apr 2016 15:40:13 -0400
From: "Andrew F. Davis" <afd@ti.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 1/2] hwmon: Define binding for the INA3221 hwmon driver
Date: Mon, 25 Apr 2016 14:39:21 -0500
Message-ID: <1461613162-1606-2-git-send-email-afd@ti.com>
In-Reply-To: <1461613162-1606-1-git-send-email-afd@ti.com>
References: <1461613162-1606-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

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
2.8.1

