Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:42666 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942019AbcJSO2r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Oct 2016 10:28:47 -0400
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH 2/2] hwmon: (mcp3021) add devicetree bindings documentation
Date: Wed, 19 Oct 2016 11:40:56 +0200
Message-Id: <20161019094056.24508-1-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Documents the devicetree bindings for the Microchip MCP3021/3221.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 Documentation/devicetree/bindings/hwmon/mcp3021.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt

diff --git a/Documentation/devicetree/bindings/hwmon/mcp3021.txt b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
new file mode 100644
index 0000000..e1d1e62
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
@@ -0,0 +1,21 @@
+mcp3021 properties
+
+Required properties:
+- compatible: Must be one of the following:
+	- "microchip,mcp3021" for mcp3021
+	- "microchip,mcp3221" for mcp3221
+- reg: I2C address
+
+Optional properties:
+
+- reference-voltage
+	Reference voltage in millivolt (mV)
+
+Example:
+
+mcp3021@4d {
+	compatible = "microchip,mcp3021";
+	reg = <0x4d>;
+
+	reference-voltage = <4500>; /* 4.5 V */
+};
-- 
2.10.0

