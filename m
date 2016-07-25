Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46163 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753879AbcGYVut (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Jul 2016 17:50:49 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (lm90) Add missing assignment
Date: Mon, 25 Jul 2016 14:50:41 -0700
Message-Id: <1469483441-10702-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Coverity reports the following error.

>>>     CID 1364474:  Error handling issues  (CHECKED_RETURN)
>>>     Calling "lm90_read_reg" without checking return value (as is done
>>>     elsewhere 28 out of 29 times).
532             lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
533             if (val < 0)
534                     return val;

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index f51e758ba529..7b3eedf76c62 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -529,7 +529,7 @@ static int lm90_update_limits(struct device *dev)
 		return val;
 	data->temp_hyst = val;
 
-	lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
+	val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
 	if (val < 0)
 		return val;
 	data->temp11[REMOTE_LOW] = val << 8;
-- 
2.5.0

