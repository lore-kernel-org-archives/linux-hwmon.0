Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50695 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGDo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:03:44 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/17] hwmon: (lm85) Fix overflows seen when writing voltage limit attributes
Date: Sun,  4 Dec 2016 20:55:34 -0800
Message-Id: <1480913740-5678-11-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into voltage limit attributes can overflow due to an unbound
multiplication.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm85.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 6ff773fcaefb..29c8136ce9c5 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -136,7 +136,8 @@ static const int lm85_scaling[] = {  /* .001 Volts */
 #define SCALE(val, from, to)	(((val) * (to) + ((from) / 2)) / (from))
 
 #define INS_TO_REG(n, val)	\
-		clamp_val(SCALE(val, lm85_scaling[n], 192), 0, 255)
+		SCALE(clamp_val(val, 0, 255 * lm85_scaling[n] / 192), \
+		      lm85_scaling[n], 192)
 
 #define INSEXT_FROM_REG(n, val, ext)	\
 		SCALE(((val) << 4) + (ext), 192 << 4, lm85_scaling[n])
-- 
2.5.0

