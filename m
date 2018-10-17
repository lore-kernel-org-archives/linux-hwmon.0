Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot1-f73.google.com ([209.85.210.73]:44288 "EHLO
        mail-ot1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbeJRGZE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Oct 2018 02:25:04 -0400
Received: by mail-ot1-f73.google.com with SMTP id s68so20438556ota.11
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Oct 2018 15:27:19 -0700 (PDT)
Date: Wed, 17 Oct 2018 15:27:09 -0700
Message-Id: <20181017222710.254994-1-kunyi@google.com>
Mime-Version: 1.0
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
From: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, kunyi@google.com,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To: unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

adm127x are hot-swap controllers that allow a circuit board to be removed from
or inserted into a live backplane. This patch adds the device tree
bindings documentation.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
new file mode 100644
index 000000000000..1ecd03f3da4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -0,0 +1,25 @@
+adm1275 properties
+
+Required properties:
+- compatible: Must be one of the supported compatible strings:
+	- "adi,adm1075" for adm1075
+	- "adi,adm1272" for adm1272
+	- "adi,adm1275" for adm1275
+	- "adi,adm1276" for adm1276
+	- "adi,adm1278" for adm1278
+	- "adi,adm1293" for adm1293
+	- "adi,adm1294" for adm1294
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor-micro-ohms
+	Shunt resistor value in micro-Ohm
+
+Example:
+
+adm1272@10 {
+	compatible = "adi,adm1272";
+	reg = <0x10>;
+	shunt-resistor-micro-ohms = <500>;
+};
-- 
2.19.1.331.ge82ca0e54c-goog
