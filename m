Return-path: <daniel@makrotopia.org>
Date: Mon, 1 Aug 2016 12:08:58 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Guenter Roeck <linux@roeck-us.net>, Axel Lin <axel.lin@ingics.com>,
	Per =?iso-8859-1?Q?Dal=E9n?= <per.dalen@appeartv.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (ltc4151) Add devicetree binding for ltc4151
Message-ID: <20160801100853.GA4250@makrotopia.org>
References: <20160727144859.GA18846@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160727144859.GA18846@rob-hp-laptop>
List-ID: <linux-hwmon@vger.kernel.org>

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: add description and -micro-ohms unit suffix to property

 Documentation/devicetree/bindings/hwmon/ltc4151.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc4151.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltc4151.txt b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
new file mode 100644
index 0000000..d008a5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
@@ -0,0 +1,18 @@
+LTC4151 High Voltage I2C Current and Voltage Monitor
+
+Required properties:
+- compatible: Must be "lltc,ltc4151"
+- reg: I2C address
+
+Optional properties:
+- shunt-resistor-micro-ohms
+	Shunt resistor value in micro-Ohms
+	Defaults to <1000> if unset.
+
+Example:
+
+ltc4151@6e {
+	compatible = "lltc,ltc4151";
+	reg = <0x6e>;
+	shunt-resistor-micro-ohms = <1500>;
+};
-- 
2.9.2
