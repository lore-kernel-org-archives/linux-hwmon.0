Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41401 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932120AbcF3NvR (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 30 Jun 2016 09:51:17 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/6] hwmon: (lm90) Use bool for valid flag
Date: Thu, 30 Jun 2016 06:51:00 -0700
Message-Id: <1467294661-23879-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
References: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use bool for valid flag and leave it up to the compiler to find
an optimal representation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 322a73d3d135..c38d6e4e95b5 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -367,7 +367,7 @@ struct lm90_data {
 	struct i2c_client *client;
 	const struct attribute_group *groups[6];
 	struct mutex update_lock;
-	char valid; /* zero until following fields are valid */
+	bool valid;		/* true if register values are valid */
 	unsigned long last_updated; /* in jiffies */
 	int kind;
 	u32 flags;
@@ -624,7 +624,7 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 	if (time_after(jiffies, next_update) || !data->valid) {
 		dev_dbg(&client->dev, "Updating lm90 data.\n");
 
-		data->valid = 0;
+		data->valid = false;
 
 		val = lm90_read_reg(client, LM90_REG_R_LOCAL_LOW);
 		if (val < 0)
@@ -697,7 +697,7 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 		}
 
 		data->last_updated = jiffies;
-		data->valid = 1;
+		data->valid = true;
 	}
 
 error:
-- 
2.5.0

