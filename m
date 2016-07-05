Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Joachim Eastwood <manabian@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Subject: [PATCH 3/3] ARM: dts: lpc4350-hitex-eval: Fix binding for SE97
Date: Tue,  5 Jul 2016 09:44:33 -0700
Message-Id: <1467737073-7949-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467737073-7949-1-git-send-email-linux@roeck-us.net>
References: <1467737073-7949-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The 'compatible = "nxp,jc42"' binding only happened to work because
the Linux driver is named jc42. The driver now supports generic
bindings for JC-42 compatible chips, so use the generic binding instead.

Cc: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc: Joachim Eastwood <manabian@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index 6c9048d4d03c..c97cba1d26a8 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -424,7 +424,7 @@
 
 	/* NXP SE97BTP with temperature sensor + eeprom */
 	sensor@18 {
-		compatible = "nxp,jc42";
+		compatible = "nxp,se97", "jedec,jc-42.4-temp";
 		reg = <0x18>;
 	};
 
-- 
2.5.0
