Return-Path: <peda@axentia.se>
Return-path: <peda@axentia.se>
From: Peter Rosin <peda@axentia.se>
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Russell King <linux@armlinux.org.uk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: at91: disable the nxp,se97b SMBUS timeout on the TSE-850
Date: Mon, 27 Nov 2017 17:31:01 +0100
Message-Id: <20171127163101.27859-3-peda@axentia.se>
In-Reply-To: <20171127163101.27859-1-peda@axentia.se>
References: <20171127163101.27859-1-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

The I2C adapter driver is sometimes slow, causing the SCL line to
be stuck low for more than the stipulated SMBUS timeout of 25-35 ms.
This causes the client device to give up which in turn causes silent
corruption of data. So, disable the SMBUS timeout in the client device.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-tse850-3.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
index 5f29010cdbd8..9b82cc8843e1 100644
--- a/arch/arm/boot/dts/at91-tse850-3.dts
+++ b/arch/arm/boot/dts/at91-tse850-3.dts
@@ -221,6 +221,7 @@
 	jc42@18 {
 		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
 		reg = <0x18>;
+		smbus-timeout-disable;
 	};
 
 	dpot: mcp4651-104@28 {
-- 
2.11.0
