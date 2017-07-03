Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-he1eur01on0086.outbound.protection.outlook.com ([104.47.0.86]:18930
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750784AbdGCE3O (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jul 2017 00:29:14 -0400
From: Tom Levens <tom.levens@cern.ch>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Mike Looijmans" <mike.looijmans@topic.nl>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
Subject: [PATCH v3 2/3] hwmon: ltc2990: add devicetree binding
Date: Mon, 3 Jul 2017 06:28:59 +0200
Message-ID: <1499056140-6064-2-git-send-email-tom.levens@cern.ch>
In-Reply-To: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
References: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add a devicetree binding for the ltc2990 hwmon driver.

Signed-off-by: Tom Levens <tom.levens@cern.ch>
---
 .../devicetree/bindings/hwmon/ltc2990.txt          | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2990.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltc2990.txt b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
new file mode 100644
index 0000000..f92f540
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
@@ -0,0 +1,36 @@
+ltc2990: Linear Technology LTC2990 power monitor
+
+Required properties:
+- compatible: Must be "lltc,ltc2990"
+- reg: I2C slave address
+- lltc,meas-mode:
+	An array of two integers for configuring the chip measurement mode.
+
+	The first integer defines the bits 2..0 in the control register. In all
+	cases the internal temperature and supply voltage are measured. In
+	addition the following input measurements are enabled per mode:
+
+		0: V1, V2, TR2
+		1: V1-V2, TR2
+		2: V1-V2, V3, V4
+		3: TR1, V3, V4
+		4: TR1, V3-V4
+		5: TR1, TR2
+		6: V1-V2, V3-V4
+		7: V1, V2, V3, V4
+
+	The second integer defines the bits 4..3 in the control register. This
+	allows a subset of the measurements to be enabled:
+
+		0: Internal temperature and supply voltage only
+		1: TR1, V1 or V1-V2 only per mode
+		2: TR2, V3 or V3-V4 only per mode
+		3: All measurements per mode
+
+Example:
+
+ltc2990@4c {
+	compatible = "lltc,ltc2990";
+	reg = <0x4c>;
+	lltc,meas-mode = <7 3>;	/* V1, V2, V3, V4 */
+};
-- 
1.8.3.1

