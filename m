Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:16806 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942888AbcJ0Wqz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2016 18:46:55 -0400
From: Clemens Gruber <clemens.gruber@pqgruber.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: [PATCH v2 2/3] hwmon: (mcp3021) add devicetree bindings documentation
Date: Fri, 28 Oct 2016 00:33:44 +0200
Message-Id: <20161027223345.16733-2-clemens.gruber@pqgruber.com>
In-Reply-To: <20161027223345.16733-1-clemens.gruber@pqgruber.com>
References: <20161027223345.16733-1-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Document the devicetree bindings for the Microchip MCP3021/3221.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 Documentation/devicetree/bindings/hwmon/mcp3021.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt

diff --git a/Documentation/devicetree/bindings/hwmon/mcp3021.txt b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
new file mode 100644
index 0000000..294318b
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
+- reference-voltage-microvolt
+	Reference voltage in microvolt (uV)
+
+Example:
+
+mcp3021@4d {
+	compatible = "microchip,mcp3021";
+	reg = <0x4d>;
+
+	reference-voltage-microvolt = <4500000>; /* 4.5 V */
+};
-- 
2.10.1

