Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38326 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752882AbdLDCOA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Dec 2017 21:14:00 -0500
Received: by mail-pg0-f66.google.com with SMTP id f12so7148006pgo.5
        for <linux-hwmon@vger.kernel.org>; Sun, 03 Dec 2017 18:14:00 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lei YU <mine260309@gmail.com>
Subject: [PATCH] hwmon: (w83773g) Fix fault detection and reporting
Date: Sun,  3 Dec 2017 18:13:56 -0800
Message-Id: <1512353636-13985-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Smatch reports:

drivers/hwmon/w83773g.c:105
	get_fault() warn: shift has higher precedence than mask

Code analysis shows that the code is indeed wrong.
Fix it, and while we are at it, drop unnecessary typecast.

Fixes: 86a10c802362 ("hwmon: Add W83773G driver")
Cc: Lei YU <mine260309@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83773g.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 0b97c285b049..e858093ac806 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -102,7 +102,7 @@ static int get_fault(struct regmap *regmap, int index, long *val)
 	if (ret < 0)
 		return ret;
 
-	*val = (u8)regval & 0x04 >> 2;
+	*val = (regval & 0x04) >> 2;
 	return 0;
 }
 
-- 
2.7.4

