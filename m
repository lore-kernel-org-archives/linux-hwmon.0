Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42212 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751218AbcITEz5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2016 00:55:57 -0400
From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-hwmon@vger.kernel.org
Cc: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] Documentation: dtb: lm87: Add hwmon binding documentation.
Date: Tue, 20 Sep 2016 16:55:38 +1200
Message-Id: <20160920045538.9548-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds lm87 hwmon device tree node documentation.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/hwmon/lm87.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
new file mode 100644
index 0000000..fefcb48
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
@@ -0,0 +1,14 @@
+*LM87 temprature sensor.
+
+Required properties:
+- compatible: Should be
+	"ti,lm87"
+
+- reg: I2C address
+
+Example:
+
+lm87@2e {
+	compatible = "ti,lm87";
+	reg = <0x2e>;
+};
-- 
2.9.3

