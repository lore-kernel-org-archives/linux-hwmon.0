Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gloria.sntech.de ([185.11.138.130]:45538 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbeKHBS2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Nov 2018 20:18:28 -0500
From: Heiko Stuebner <heiko@sntech.de>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@bq.com>
Subject: [PATCH] dt-bindings: hwmon: tmp108: add optional interrupts and #thermal-sensor-cells
Date: Wed,  7 Nov 2018 16:47:08 +0100
Message-Id: <20181107154708.422-1-heiko@sntech.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@bq.com>

The tmp108 does have an alert output that can be used as interrupt source
and can of course also be used as part of a thermal sensor setup for things
like thermal-based cpu frequencies, so document the necessary properties.

Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
---
 Documentation/devicetree/bindings/hwmon/tmp108.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt b/Documentation/devicetree/bindings/hwmon/tmp108.txt
index 8c4b10df86d9..54d4beed4ee5 100644
--- a/Documentation/devicetree/bindings/hwmon/tmp108.txt
+++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
@@ -7,6 +7,10 @@ Requires node properties:
 - compatible : "ti,tmp108"
 - reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
 
+Optional properties:
+- interrupts: Reference to the TMP108 alert interrupt.
+- #thermal-sensor-cells: should be set to 0.
+
 Example:
 	tmp108@48 {
 		compatible = "ti,tmp108";
-- 
2.18.0
