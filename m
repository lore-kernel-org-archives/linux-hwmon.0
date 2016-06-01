Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33262 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036AbcFAJn2 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Jun 2016 05:43:28 -0400
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] hwmon: ina2xx: Document compatible for INA231
Date: Wed, 01 Jun 2016 11:43:12 +0200
Message-id: <1464774192-21887-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Document the compatible for INA231 sensor.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/hwmon/ina2xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
index 9bcd5e87830d..02af0d94e921 100644
--- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
@@ -7,6 +7,7 @@ Required properties:
 	- "ti,ina220" for ina220
 	- "ti,ina226" for ina226
 	- "ti,ina230" for ina230
+	- "ti,ina231" for ina231
 - reg: I2C address
 
 Optional properties:
-- 
1.9.1

