Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:42003 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752358AbeEPNi4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 May 2018 09:38:56 -0400
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 2/6] dt-bindings: hwmon: Add Raspberry Pi voltage sensor
Date: Wed, 16 May 2018 15:37:03 +0200
Message-Id: <1526477827-10859-3-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Recent VC4 firmware provides a hardware-independent way to retrieve the
under-voltage sensor on the following Raspberry Pi boards:
  - Raspberry Pi B+ (via GPIO on SoC)
  - Raspberry Pi A+ (via GPIO on SoC)
  - Raspberry Pi 2 B (via GPIO on SoC)
  - Raspberry Pi 3 B (via GPIO on port expander)
  - Raspberry Pi 3 B+ (via PMIC)

TODO:
  - try to make bcm2835 firmware a bus driver

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/hwmon/raspberrypi-hwmon.txt   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt b/Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
new file mode 100644
index 0000000..ec2523f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/raspberrypi-hwmon.txt
@@ -0,0 +1,19 @@
+Raspberry Pi voltage sensor
+---------------------------
+
+The VC4 firmware exposes a mailbox interface that allows the ARM core
+to access the board's voltage sensor.
+
+Required properties :
+- compatible : Should be "raspberrypi,bcm2835-hwmon"
+
+Example:
+
+firmware: firmware-rpi {
+	compatible = "raspberrypi,bcm2835-firmware";
+	mboxes = <&mailbox>;
+
+	voltage-sensor {
+		compatible = "raspberrypi,bcm2835-hwmon";
+	};
+};
-- 
2.7.4

