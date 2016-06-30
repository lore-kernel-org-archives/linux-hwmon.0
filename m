Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41387 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932131AbcF3NvV (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 30 Jun 2016 09:51:21 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (lm90) Read limit registers only once
Date: Thu, 30 Jun 2016 06:50:59 -0700
Message-Id: <1467294661-23879-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
References: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Read limit registers only once at startup or after errors to improve
driver performance.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 177 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 105 insertions(+), 72 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 2a330bdbf1bc..322a73d3d135 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -508,6 +508,102 @@ static void lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
 	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
 }
 
+static int lm90_update_limits(struct device *dev)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int val;
+
+	val = lm90_read_reg(client, LM90_REG_R_LOCAL_CRIT);
+	if (val < 0)
+		return val;
+	data->temp8[LOCAL_CRIT] = val;
+
+	val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
+	if (val < 0)
+		return val;
+	data->temp8[REMOTE_CRIT] = val;
+
+	val = lm90_read_reg(client, LM90_REG_R_TCRIT_HYST);
+	if (val < 0)
+		return val;
+	data->temp_hyst = val;
+
+	lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
+	if (val < 0)
+		return val;
+	data->temp11[REMOTE_LOW] = val << 8;
+
+	if (data->flags & LM90_HAVE_REM_LIMIT_EXT) {
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWL);
+		if (val < 0)
+			return val;
+		data->temp11[REMOTE_LOW] |= val;
+	}
+
+	val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH);
+	if (val < 0)
+		return val;
+	data->temp11[REMOTE_HIGH] = val << 8;
+
+	if (data->flags & LM90_HAVE_REM_LIMIT_EXT) {
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHL);
+		if (val < 0)
+			return val;
+		data->temp11[REMOTE_HIGH] |= val;
+	}
+
+	if (data->flags & LM90_HAVE_OFFSET) {
+		val = lm90_read16(client, LM90_REG_R_REMOTE_OFFSH,
+				  LM90_REG_R_REMOTE_OFFSL);
+		if (val < 0)
+			return val;
+		data->temp11[REMOTE_OFFSET] = val;
+	}
+
+	if (data->flags & LM90_HAVE_EMERGENCY) {
+		val = lm90_read_reg(client, MAX6659_REG_R_LOCAL_EMERG);
+		if (val < 0)
+			return val;
+		data->temp8[LOCAL_EMERG] = val;
+
+		val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
+		if (val < 0)
+			return val;
+		data->temp8[REMOTE_EMERG] = val;
+	}
+
+	if (data->kind == max6696) {
+		val = lm90_select_remote_channel(client, data, 1);
+		if (val < 0)
+			return val;
+
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
+		if (val < 0)
+			return val;
+		data->temp8[REMOTE2_CRIT] = val;
+
+		val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
+		if (val < 0)
+			return val;
+		data->temp8[REMOTE2_EMERG] = val;
+
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
+		if (val < 0)
+			return val;
+		data->temp11[REMOTE2_LOW] = val << 8;
+
+		val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH);
+		if (val < 0)
+			return val;
+		data->temp11[REMOTE2_HIGH] = val << 8;
+
+		lm90_select_remote_channel(client, data, 0);
+	}
+
+	return 0;
+}
+
 static struct lm90_data *lm90_update_device(struct device *dev)
 {
 	struct lm90_data *data = dev_get_drvdata(dev);
@@ -517,10 +613,19 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
+	if (!data->valid) {
+		val = lm90_update_limits(dev);
+		if (val < 0)
+			goto error;
+	}
+
 	next_update = data->last_updated +
 		      msecs_to_jiffies(data->update_interval);
 	if (time_after(jiffies, next_update) || !data->valid) {
 		dev_dbg(&client->dev, "Updating lm90 data.\n");
+
+		data->valid = 0;
+
 		val = lm90_read_reg(client, LM90_REG_R_LOCAL_LOW);
 		if (val < 0)
 			goto error;
@@ -531,20 +636,6 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 			goto error;
 		data->temp8[LOCAL_HIGH] = val;
 
-		val = lm90_read_reg(client, LM90_REG_R_LOCAL_CRIT);
-		if (val < 0)
-			goto error;
-		data->temp8[LOCAL_CRIT] = val;
-
-		val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
-		if (val < 0)
-			goto error;
-		data->temp8[REMOTE_CRIT] = val;
-		val = lm90_read_reg(client, LM90_REG_R_TCRIT_HYST);
-		if (val < 0)
-			goto error;
-		data->temp_hyst = val;
-
 		if (data->reg_local_ext) {
 			val = lm90_read16(client, LM90_REG_R_LOCAL_TEMP,
 					  data->reg_local_ext);
@@ -563,44 +654,6 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 			goto error;
 		data->temp11[REMOTE_TEMP] = val;
 
-		lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
-		if (val < 0)
-			goto error;
-		data->temp11[REMOTE_LOW] = val << 8;
-		if (data->flags & LM90_HAVE_REM_LIMIT_EXT) {
-			val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWL);
-			if (val < 0)
-				goto error;
-			data->temp11[REMOTE_LOW] |= val;
-		}
-		val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH);
-		if (val < 0)
-			goto error;
-		data->temp11[REMOTE_HIGH] = val << 8;
-		if (data->flags & LM90_HAVE_REM_LIMIT_EXT) {
-			val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHL);
-			if (val < 0)
-				goto error;
-			data->temp11[REMOTE_HIGH] |= val;
-		}
-
-		if (data->flags & LM90_HAVE_OFFSET) {
-			val = lm90_read16(client, LM90_REG_R_REMOTE_OFFSH,
-					  LM90_REG_R_REMOTE_OFFSL);
-			if (val < 0)
-				goto error;
-			data->temp11[REMOTE_OFFSET] = val;
-		}
-		if (data->flags & LM90_HAVE_EMERGENCY) {
-			val = lm90_read_reg(client, MAX6659_REG_R_LOCAL_EMERG);
-			if (val < 0)
-				goto error;
-			data->temp8[LOCAL_EMERG] = val;
-			val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
-			if (val < 0)
-				goto error;
-			data->temp8[REMOTE_EMERG] = val;
-		}
 		val = lm90_read_reg(client, LM90_REG_R_STATUS);
 		if (val < 0)
 			goto error;
@@ -611,32 +664,12 @@ static struct lm90_data *lm90_update_device(struct device *dev)
 			if (val < 0)
 				goto error;
 
-			val = lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT);
-			if (val < 0)
-				goto error;
-			data->temp8[REMOTE2_CRIT] = val;
-
-			val = lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG);
-			if (val < 0)
-				goto error;
-			data->temp8[REMOTE2_EMERG] = val;
-
 			val = lm90_read16(client, LM90_REG_R_REMOTE_TEMPH,
 					  LM90_REG_R_REMOTE_TEMPL);
 			if (val < 0)
 				goto error;
 			data->temp11[REMOTE2_TEMP] = val;
 
-			val = lm90_read_reg(client, LM90_REG_R_REMOTE_LOWH);
-			if (val < 0)
-				goto error;
-			data->temp11[REMOTE2_LOW] = val << 8;
-
-			val = lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH);
-			if (val < 0)
-				goto error;
-			data->temp11[REMOTE2_HIGH] = val << 8;
-
 			lm90_select_remote_channel(client, data, 0);
 
 			val = lm90_read_reg(client, MAX6696_REG_R_STATUS2);
-- 
2.5.0

