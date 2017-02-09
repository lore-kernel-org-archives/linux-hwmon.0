Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52122 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752301AbdBITFc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Feb 2017 14:05:32 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/7] hwmon: (it87) Fix pwm4 detection for IT8620 and IT8628
Date: Thu,  9 Feb 2017 07:06:13 -0800
Message-Id: <1486652775-3926-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
References: <1486652775-3926-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

pwm4 is enabled if bit 2 of GPIO control register 4 is disabled,
not when it is enabled. Since the check is for the skip condition,
it is reversed. This applies to both IT8620 and IT8628.

Fixes: 36c4d98a7883d ("hwmon: (it87) Add support for all pwm channels ...")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 85918d8a747a..4f3fabcd470d 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2614,7 +2614,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 		/* Check for pwm4 */
 		reg = superio_inb(sioaddr, IT87_SIO_GPIO4_REG);
-		if (!(reg & BIT(2)))
+		if (reg & BIT(2))
 			sio_data->skip_pwm |= BIT(3);
 
 		/* Check for pwm2, fan2 */
-- 
2.7.4

