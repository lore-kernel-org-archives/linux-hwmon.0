Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from atl4mhfb04.myregisteredsite.com ([209.17.115.120]:45366 "EHLO
	atl4mhfb04.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751123AbcHPHZM (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 16 Aug 2016 03:25:12 -0400
Received: from atl4mhob08.myregisteredsite.com (atl4mhob08.myregisteredsite.com [209.17.115.46])
	by atl4mhfb04.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id u7G7NIBB021544
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Aug 2016 03:23:18 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id u7G7NDWN015660
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Aug 2016 03:23:14 -0400
From: Mike Looijmans <mike.looijmans@topic.nl>
To: robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: hjk@hansjkoch.de, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] hwmon: (max6650.c) Add devicetree support documentation
Date: Tue, 16 Aug 2016 09:23:10 +0200
Message-Id: <1471332190-14638-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This adds the devicetree binding documentation for the max6650 fan
controller.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
Associated code changes sent as a separate patch as requested.

 .../devicetree/bindings/hwmon/max6650.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6650.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt b/Documentation/devicetree/bindings/hwmon/max6650.txt
new file mode 100644
index 0000000..2e46e69
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
@@ -0,0 +1,23 @@
+Bindings for MAX6651 and MAX6650 I2C fan controllers
+
+Reference:
+[1]	https://datasheets.maximintegrated.com/en/ds/MAX6650-MAX6651.pdf
+
+Required properties:
+- compatible : One of "maxim,max6650" or "maxim,max6651"
+- reg        : I2C address, one of 0x1b, 0x1f, 0x4b, 0x48.
+
+Optional properties, default is to retain the chip's current setting:
+- maxim,fan-microvolt : The supply voltage of the fan, sets the ADC range to
+			either 5V or 12V. Max value 13500000.
+- maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
+			allow more fine-grained control of slower fans.
+			Valid: 1, 2, 4, 8, 16.
+
+Example:
+	fan-max6650: max6650@1b {
+		reg = <0x1b>;
+		compatible = "maxim,max6650";
+		maxim,fan-microvolt = <12000000>;
+		maxim,fan-prescale = <4>;
+	};
-- 
1.9.1

