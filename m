Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34991 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752170AbdBEVFb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Feb 2017 16:05:31 -0500
From: Christian Lamparter <chunkeey@googlemail.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc: Christian Lamparter <chunkeey@googlemail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Wei Ni <wni@nvidia.com>
Subject: [RFC 1/2] devicetree: add lm90 thermal_zone sensor support
Date: Sun,  5 Feb 2017 22:03:15 +0100
Message-Id: <e2c150ce1312a524ea0a524f3d476f910333ae82.1486327509.git.chunkeey@googlemail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch updates the LM90's devicetree definition to
include the #thermal-sensor-cells property as well as
the sensor constants in include/dt-bindings/thermal/lm90.h.

Cc: Wei Ni <wni@nvidia.com>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
I'm aware that there was atleast one previous attempt to add
thermal_zone temperature sensors for the LM90 module. This was
discussed on:
<http://www.gossamer-threads.com/lists/linux/kernel/1992853>
<https://lkml.org/lkml/2014/3/4/194>

This RFC is meant to get it going again. As I would really
like to have this functionality for the Netgear WNDR4700.
This router uses a G781 to measure the SoCs temperature
in order to regulate a TC654 fan-controller.
<https://git.lede-project.org/?p=source.git;a=commit;h=9e0fd1b52ad1f805a308bf6a5a13236f352fd962>
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
index 5e637e2b3ff9..8c2ea8a18064 100644
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
index 000000000000..39d90f3e63ee
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
+#define LM90_REMOTE_TEMPERATURE 0
+#define LM90_LOCAL_TEMPERATURE 1
+#define LM90_REMOTE2_TEMPERATURE 2
+
+#endif
-- 
2.11.0

