Return-path: <chunkeey@googlemail.com>
From: Christian Lamparter <chunkeey@googlemail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Wei Ni <wni@nvidia.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] devicetree: add lm90 thermal_zone sensor support
Date: Fri, 10 Feb 2017 17:12:29 +0100
Message-Id: <0d274e32ad09daa2f6f7f27f1c36d39da526b66d.1486741517.git.chunkeey@googlemail.com>
In-Reply-To: <2979642.2YCYMDeKdL@debian64>
References: <2979642.2YCYMDeKdL@debian64>
List-ID: <linux-hwmon@vger.kernel.org>

This patch updates the LM90's devicetree definition to
include the #thermal-sensor-cells property as well as
the sensor constants in include/dt-bindings/thermal/lm90.h.

Cc: Wei Ni <wni@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
I've reordered LM90_LOCAL_TEMPERATURE and LM90_REMOTE_TEMPERATURE.
Everything else is the same as in the RFC. This is the only
required patch and it only updates the documentation and binding.
[PATCH 2/2] is optional (as I said I would look at it).
---
 Documentation/devicetree/bindings/hwmon/lm90.txt |  6 ++++++
 MAINTAINERS                                      |  1 +
 include/dt-bindings/thermal/lm90.h               | 12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/thermal/lm90.h

diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt
index e8632486b9ef..97581266e329 100644
--- a/Documentation/devicetree/bindings/hwmon/lm90.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm90.txt
@@ -33,6 +33,11 @@ Optional properties:
               LM90 "-ALERT" pin output.
               See interrupt-controller/interrupts.txt for the format.
 
+- #thermal-sensor-cells: should be set to 1. See thermal/thermal.txt for
+	      details. See <include/dt-bindings/thermal/lm90.h> for the
+	      definition of the local, remote and 2nd remote sensor index
+	      constants.
+
 Example LM90 node:
 
 temp-sensor {
@@ -41,4 +46,5 @@ temp-sensor {
 	vcc-supply = <&palmas_ldo6_reg>;
 	interrupt-parent = <&gpio>;
 	interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
+	#thermal-sensor-cells = <1>;
 }
diff --git a/MAINTAINERS b/MAINTAINERS
index 2be620cea1ed..73972ccebc56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7541,6 +7541,7 @@ S:	Maintained
 F:	Documentation/hwmon/lm90
 F:	Documentation/devicetree/bindings/hwmon/lm90.txt
 F:	drivers/hwmon/lm90.c
+F:	include/dt-bindings/thermal/lm90.h
 
 LM95234 HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
diff --git a/include/dt-bindings/thermal/lm90.h b/include/dt-bindings/thermal/lm90.h
new file mode 100644
index 000000000000..8c2e3095f704
--- /dev/null
+++ b/include/dt-bindings/thermal/lm90.h
@@ -0,0 +1,12 @@
+/*
+ * This header provides constants for the LM90 thermal bindings.
+ */
+
+#ifndef _DT_BINDINGS_THERMAL_LM90_H_
+#define _DT_BINDINGS_THERMAL_LM90_H_
+
+#define LM90_LOCAL_TEMPERATURE 0
+#define LM90_REMOTE_TEMPERATURE 1
+#define LM90_REMOTE2_TEMPERATURE 2
+
+#endif
-- 
2.11.0
