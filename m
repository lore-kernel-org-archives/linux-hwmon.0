Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:59545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbeEVLYA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 May 2018 07:24:00 -0400
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
Subject: [PATCH RFC V2 1/6] ARM: bcm2835: Add GET_THROTTLED firmware property
Date: Tue, 22 May 2018 13:21:47 +0200
Message-Id: <1526988112-4021-2-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Recent Raspberry Pi firmware provides a mailbox property to detect
under-voltage conditions. Here is the current definition.

The u32 value returned by the firmware is divided into 2 parts:
  - lower 16-bits are the live value
  - upper 16-bits are the history or sticky value

  Bits:
  0: undervoltage
  1: arm frequency capped
  2: currently throttled
  16: undervoltage has occurred
  17: arm frequency capped has occurred
  18: throttling has occurred

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 8ee8991..c4a5c9e 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -75,6 +75,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_EDID_BLOCK =                         0x00030020,
 	RPI_FIRMWARE_GET_CUSTOMER_OTP =                       0x00030021,
 	RPI_FIRMWARE_GET_DOMAIN_STATE =                       0x00030030,
+	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
-- 
2.7.4

