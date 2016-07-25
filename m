Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from fudo.makrotopia.org ([185.142.180.71]:59033 "EHLO
	fudo.makrotopia.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753207AbcGYRMi (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Jul 2016 13:12:38 -0400
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	 (Exim 4.87)
	(envelope-from <daniel@makrotopia.org>)
	id 1bRjQi-0002JO-Tj
	for linux-hwmon@vger.kernel.org; Mon, 25 Jul 2016 19:12:37 +0200
Date: Mon, 25 Jul 2016 19:12:36 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (ltc4151) Add devicetree binding for ltc4151
Message-ID: <20160725171235.GB2263@makrotopia.org>
References: <5795A144.2020300@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5795A144.2020300@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
(resent to linux-hwmon which by accident wasn't among the receipients)
 Documentation/devicetree/bindings/hwmon/ltc4151.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc4151.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltc4151.txt b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
new file mode 100644
index 0000000..aec69ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
@@ -0,0 +1,18 @@
+ltc4151 properties
+
+Required properties:
+- compatible: Must be "lltc,ltc4151"
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor
+	Shunt resistor value in micro-Ohm
+
+Example:
+
+ltc4151@6e {
+	compatible = "lltc,ltc4151";
+	reg = <0x6e>;
+	shunt-resistor = <1500>;
+};
-- 
2.9.0

