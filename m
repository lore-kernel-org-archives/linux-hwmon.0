Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:58067 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751060AbeEVLXv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 May 2018 07:23:51 -0400
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 4/6] ARM: bcm2835_defconfig: Enable RPi voltage sensor
Date: Tue, 22 May 2018 13:21:50 +0200
Message-Id: <1526988112-4021-5-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The patch enables the hwmon driver for the Raspberry Pi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/configs/bcm2835_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index e4d188f..e9bc889 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -86,7 +86,7 @@ CONFIG_SPI=y
 CONFIG_SPI_BCM2835=y
 CONFIG_SPI_BCM2835AUX=y
 CONFIG_GPIO_SYSFS=y
-# CONFIG_HWMON is not set
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_THERMAL=y
 CONFIG_BCM2835_THERMAL=y
 CONFIG_WATCHDOG=y
-- 
2.7.4

