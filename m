Return-Path: <thierry.reding@gmail.com>
Return-path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: lm90: Document ti,tmp451 compatible string
Date: Fri, 23 Nov 2018 13:08:46 +0100
Message-Id: <20181123120846.16999-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The TI TMP451 temperature sensors are compatible with the National LM90
temperature sensors.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/hwmon/lm90.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt
index 97581266e329..c76a7ac47c34 100644
--- a/Documentation/devicetree/bindings/hwmon/lm90.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm90.txt
@@ -23,6 +23,7 @@ Required node properties:
 		"onnn,nct1008"
 		"winbond,w83l771"
 		"nxp,sa56004"
+		"ti,tmp451"
 
 - reg: I2C bus address of the device
 
-- 
2.19.1
