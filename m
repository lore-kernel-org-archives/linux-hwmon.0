Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.andi.de1.cc ([85.214.239.24]:60224 "EHLO
        h2641619.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbeL0POK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Dec 2018 10:14:10 -0500
From: Andreas Kemnade <andreas@kemnade.info>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/2] devicetree: hwmon: Add bindings documentation for HIH6130
Date: Thu, 27 Dec 2018 16:13:49 +0100
Message-Id: <20181227151349.29753-3-andreas@kemnade.info>
In-Reply-To: <20181227151349.29753-1-andreas@kemnade.info>
References: <20181227151349.29753-1-andreas@kemnade.info>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add bindings documentation for HIH6130 driver.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/hwmon/hih6130.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/hih6130.txt

diff --git a/Documentation/devicetree/bindings/hwmon/hih6130.txt b/Documentation/devicetree/bindings/hwmon/hih6130.txt
new file mode 100644
index 000000000000..2c43837af4c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/hih6130.txt
@@ -0,0 +1,12 @@
+Honeywell Humidicon HIH-6130 humidity/temperature sensor
+--------------------------------------------------------
+
+Requires node properties:
+- compatible : "honeywell,hi6130"
+- reg : the I2C address of the device. This is 0x27.
+
+Example:
+	hih6130@27 {
+		compatible = "honeywell,hih6130";
+		reg = <0x27>;
+	};
-- 
2.11.0
