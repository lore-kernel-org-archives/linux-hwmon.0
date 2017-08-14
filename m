Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: robh+dt@kernel.org, jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 1/3] dt-bindings: i2c: Document the IBM CCF power supply version 1
Date: Mon, 14 Aug 2017 10:26:28 -0500
In-Reply-To: <1502724390-17411-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502724390-17411-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502724390-17411-2-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/i2c/ibm,cffps1.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
new file mode 100644
index 0000000..f68a0a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
@@ -0,0 +1,21 @@
+Device-tree bindings for IBM Common Form Factor Power Supply Version 1
+----------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,cffps1";
+ - reg = < I2C bus address >;		: Address of the power supply on the
+					  I2C bus.
+
+Example:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #interrupt-cells = <1>;
+        < more properties >
+
+        power-supply@68 {
+            compatible = "ibm,cffps1";
+            reg = <0x68>;
+        };
+    };
-- 
1.8.3.1
