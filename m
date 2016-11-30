Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36350 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcK3Uil (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2016 15:38:41 -0500
Received: by mail-pg0-f67.google.com with SMTP id x23so2292966pgx.3
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Nov 2016 12:38:40 -0800 (PST)
From: John Muir <john@jmuir.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Muir <john@jmuir.com>, John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: [PATCH 2/2] devicetree: hwmon: Add documentation for TMP108 driver.
Date: Wed, 30 Nov 2016 12:36:19 -0800
Message-Id: <1480538179-75901-3-git-send-email-john@jmuir.com>
In-Reply-To: <1480538179-75901-1-git-send-email-john@jmuir.com>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
 <1480538179-75901-1-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simple hwmon binding documentation.

Signed-off-by: John Muir <john@jmuir.com>
---
 Documentation/devicetree/bindings/hwmon/tmp108.txt | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt

diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt b/Documentation/devicetree/bindings/hwmon/tmp108.txt
new file mode 100644
index 0000000..7ba08c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
@@ -0,0 +1,24 @@
+TMP108 temperature sensor
+-------------------------
+
+This device supports I2C only.
+
+Requires node properties:
+- compatible : "ti,tmp108"
+- reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
+
+Optional node properties:
+- ti,thermostat-mode-comparator : (boolean) select the comparator mode for the
+      thermostat rather than the default interrupt-mode.
+
+Example:
+	tmp108@48 {
+		compatible = "ti,tmp108";
+		reg = <0x48>;
+		ti,thermostat-mode-comparator;
+	};
+
+	tmp108@49 {
+		compatible = "ti,tmp108";
+		reg = <0x49>;
+	};
-- 
2.8.0.rc3.226.g39d4020

