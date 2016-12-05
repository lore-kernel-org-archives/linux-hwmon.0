Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50413 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGDa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:03:30 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/17] hwmln: (g762) Fix overflows and crash seen when writing limit attributes
Date: Sun,  4 Dec 2016 20:55:38 -0800
Message-Id: <1480913740-5678-15-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix overflows seen when writing into fan speed limit attributes.
Also fix crash due to division by zero, seen when certain very
large values (such as 4611686018427387904, or 0x4000000000000000)
are written into fan speed limit attributes.

Fixes: 594fbe713bf60 ("Add support for GMT G762/G763 PWM fan controllers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index b96a2a9e4df7..584f9f755a92 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -193,12 +193,13 @@ static inline unsigned int rpm_from_cnt(u8 cnt, u32 clk_freq, u16 p,
  * Convert fan RPM value from sysfs into count value for fan controller
  * register (FAN_SET_CNT).
  */
-static inline unsigned char cnt_from_rpm(u32 rpm, u32 clk_freq, u16 p,
+static inline unsigned char cnt_from_rpm(unsigned long rpm, u32 clk_freq, u16 p,
 					 u8 clk_div, u8 gear_mult)
 {
-	if (!rpm)         /* to stop the fan, set cnt to 255 */
+	if (!rpm || !p || !clk_div)	/* to stop the fan, set cnt to 255 */
 		return 0xff;
 
+	rpm = clamp_val(rpm, 1, ULONG_MAX / (p * clk_div));
 	return clamp_val(((clk_freq * 30 * gear_mult) / (rpm * p * clk_div)),
 			 0, 255);
 }
-- 
2.5.0

