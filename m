Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35059 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756659AbcIGMdt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2016 08:33:49 -0400
Received: by mail-wm0-f68.google.com with SMTP id a6so2768779wmc.2
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Sep 2016 05:33:49 -0700 (PDT)
From: Andrea Merello <andrea.merello@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Andrea Merello <andrea.merello@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] DT: add binding documentation for STTS751
Date: Wed,  7 Sep 2016 14:33:37 +0200
Message-Id: <1473251617-4107-2-git-send-email-andrea.merello@gmail.com>
In-Reply-To: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
References: <1473251617-4107-1-git-send-email-andrea.merello@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 Documentation/devicetree/bindings/hwmon/stts751.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/stts751.txt

diff --git a/Documentation/devicetree/bindings/hwmon/stts751.txt b/Documentation/devicetree/bindings/hwmon/stts751.txt
new file mode 100644
index 0000000..277ad46
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/stts751.txt
@@ -0,0 +1,19 @@
+* STTS751 thermometer.
+
+Required node properties:
+- compatible: "stts751"
+- reg: I2C bus address of the device
+
+Optional properties:
+- has-therm: specifies that the "therm" pin is wired
+- has-event: specifies that the "event" pin is wired
+- smbus-timeout-disable: when set, the smbus timeout function will be disabled
+
+Example stts751 node:
+
+temp-sensor {
+	compatible = "stts751";
+	reg = <0x48>;
+	has-therm;
+	has-event;
+}
-- 
2.7.4

