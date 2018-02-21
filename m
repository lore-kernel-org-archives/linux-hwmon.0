Return-Path: <jae.hyun.yoo@linux.intel.com>
Return-path: <jae.hyun.yoo@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au,
	andrew@aj.id.au,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	benh@kernel.crashing.org,
	andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 5/8] [PATCH [5/8] Documentation: dt-bindings: Add a document for PECI hwmon client driver
Date: Wed, 21 Feb 2018 08:16:03 -0800
Message-Id: <20180221161606.32247-6-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
List-ID: <linux-hwmon@vger.kernel.org>

This commit adds a dt-bindings document for a generic PECI hwmon client
driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/hwmon/peci-hwmon.txt       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
new file mode 100644
index 000000000000..831813158884
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
@@ -0,0 +1,27 @@
+Bindings for Intel PECI (Platform Environment Control Interface) hwmon driver.
+
+Required properties:
+- compatible
+	Should be "intel,peci-hwmon".
+
+- reg
+	Should contain address of a client CPU. Address range of CPU clients is
+	starting from 0x30 based on PECI specification.
+	<0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
+
+Example:
+	peci-bus@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		< more properties >
+
+		peci-hwmon@cpu0 {
+			compatible = "intel,peci-hwmon";
+			reg = <0x30>;
+		};
+
+		peci-hwmon@cpu1 {
+			compatible = "intel,peci-hwmon";
+			reg = <0x31>;
+		};
+	};
-- 
2.16.1
