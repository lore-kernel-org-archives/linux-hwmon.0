Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 04/10] dt-bindings: i2c: Add P8 OCC hwmon device documentation
Date: Thu, 30 Aug 2018 16:32:35 -0500
In-Reply-To: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1535664761-86018-5-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Document the bindings for I2C-based OCC hwmon device.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
new file mode 100644
index 0000000..5dc5d2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
@@ -0,0 +1,25 @@
+Device-tree bindings for I2C-based On-Chip Controller hwmon device
+------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p8-occ-hwmon";
+ - reg = <I2C address>;			: I2C bus address
+
+Examples:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clock-frequency = <100000>;
+        < more properties >
+
+        occ-hwmon@1 {
+            compatible = "ibm,p8-occ-hwmon";
+            reg = <0x50>;
+        };
+
+        occ-hwmon@2 {
+            compatible = "ibm,p8-occ-hwmon";
+            reg = <0x51>;
+        };
+    };
-- 
1.8.3.1
