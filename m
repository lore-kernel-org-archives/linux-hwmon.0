Return-Path: <stefan.wahren@i2se.com>
Return-path: <stefan.wahren@i2se.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Phil Elwell <phil@raspberrypi.org>,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 6/6] arm64: defconfig: Enable RPi voltage sensor
Date: Wed, 16 May 2018 15:37:07 +0200
Message-Id: <1526477827-10859-7-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
List-ID: <linux-hwmon@vger.kernel.org>

The patch enables the hwmon driver for the Raspberry Pi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d25121b..5cdecef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -352,6 +352,7 @@ CONFIG_BATTERY_BQ27XXX=y
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_INA2XX=m
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-- 
2.7.4
