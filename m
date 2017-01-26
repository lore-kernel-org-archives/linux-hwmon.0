Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33651 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbdAZORw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2017 09:17:52 -0500
Received: by mail-wm0-f68.google.com with SMTP id r144so50784846wme.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2017 06:17:51 -0800 (PST)
From: Andrea Merello <andrea.merello@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Andrea Merello <andrea.merello@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 2/2] DT: add binding documentation for STTS751
Date: Thu, 26 Jan 2017 15:17:43 +0100
Message-Id: <1485440263-26477-2-git-send-email-andrea.merello@gmail.com>
In-Reply-To: <1485440263-26477-1-git-send-email-andrea.merello@gmail.com>
References: <1485440263-26477-1-git-send-email-andrea.merello@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 Documentation/devicetree/bindings/hwmon/stts751.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/stts751.txt

diff --git a/Documentation/devicetree/bindings/hwmon/stts751.txt b/Documentation/devicetree/bindings/hwmon/stts751.txt
new file mode 100644
index 0000000..3ee1dc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/stts751.txt
@@ -0,0 +1,15 @@
+* STTS751 thermometer.
+
+Required node properties:
+- compatible: "stts751"
+- reg: I2C bus address of the device
+
+Optional properties:
+- smbus-timeout-disable: when set, the smbus timeout function will be disabled
+
+Example stts751 node:
+
+temp-sensor {
+	compatible = "stts751";
+	reg = <0x48>;
+}
-- 
2.7.4

