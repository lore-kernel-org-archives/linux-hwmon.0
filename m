Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42580 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbeIUFyT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 01:54:19 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: Add ina3221 documentation
Date: Thu, 20 Sep 2018 17:07:52 -0700
Message-Id: <20180921000753.21846-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180921000753.21846-1-nicoleotsuka@gmail.com>
References: <20180921000753.21846-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Texas Instruments INA3221 is a triple-channel shunt and bus
voltage monitor. This patch adds a DT binding doc for it.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 .../devicetree/bindings/hwmon/ina3221.txt     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
new file mode 100644
index 000000000000..266c9586c9b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
@@ -0,0 +1,23 @@
+ina3221 properties
+
+Required properties:
+- compatible: Must be "ti,ina3221"
+- reg: I2C address
+
+Optional properties:
+
+- ti,channel1-name:
+- ti,channel2-name:
+- ti,channel3-name:
+	The names of the input sources (described in the schematics)
+	Set the names with "NC" to indicate not-connected channels
+
+Example:
+
+ina3221@40 {
+	compatible = "ti,ina3221";
+	reg = <0x40>;
+	ti,channel1-name = "NC";
+	ti,channel2-name = "VDD_5V0_EXT";
+	ti,channel3-name = "VDD_19V";
+};
-- 
2.17.1
