Return-path: <moritz.fischer@ettus.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
To: linux-hwmon@vger.kernel.org
Cc: moritz.fischer@ettus.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	lee.jones@linaro.org,
	olof@lixom.net,
	linux@roeck-us.net,
	jdelvare@suse.com,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 2/3] dt-bindings: hwmon: Add bindings for Google Chromium EC HWMON
Date: Fri,  7 Apr 2017 15:00:09 -0700
Message-Id: <1491602410-31518-2-git-send-email-moritz.fischer@ettus.com>
In-Reply-To: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: Moritz Fischer <mdf@kernel.org>

Add bindings for the Chromium EC HWMON. The Chromium EC HWMON
allows monitoring of temperature sensors and fans attached to the
EC.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 .../devicetree/bindings/hwmon/cros-ec-hwmon.txt    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt b/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
new file mode 100644
index 0000000..4c94869
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
@@ -0,0 +1,25 @@
+Chromium Embedded Controller EC temperature and fan control
+-----------------------------------------------------------
+
+Google's Chromium EC HWMON is a hwmon implemented byimplemented by the Chromium EC
+firmware attached to the Embedded Controller (EC) and controlled via a host-command
+interface.
+
+An EC HWMON node should be only found as a sub-node of the EC node (see
+Documentation/devicetree/bindings/mfd/cros-ec.txt).
+
+Required properties:
+- compatible: Must contain "google,cros-ec-hwmon"
+
+Example:
+	embedded-controller@1e {
+		reg = <0x1e>;
+		compatible = "google,cros-ec-i2c";
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio0>;
+
+		hwmon {
+			compatible = "google,cros-ec-hwmon";
+		};
+};
+
-- 
2.7.4
