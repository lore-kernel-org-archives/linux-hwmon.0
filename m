Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D2CC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243411AbiANQfZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243409AbiANQfY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:24 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943E3C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:24 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t9so12819251oie.12
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gvYWAl5Rf5GU2DVghOd8Gqrs+1BvL6D/MpgfNfJUxQ0=;
        b=GjD5NzlcwC9sVivbUuRWP82ko+ukIf+Z65D1eHXt7vW4o5pqOw9bWJT3+sweQnupRo
         3r8dG04a/Z9ZdwKeTiliHheG5I/C1J6zPKXtCrWTbBtDC9HAsxQE1ao5zZLN3xISWswe
         wc3lMVqzP0dqnZXtlXXP7WN1tlPBJBUHXeqAOVZ/oG2pvUh6cCj32m/Uwv+jcZFSotTi
         H6CwxdkTiR7y5el12i9BnhIUFkp4iaT7ktNtkIQZt5dlTIVFFq0TGrX5XKp86vI1j1Pr
         t9Z8UvTe3FUkP+ojlc/0+hTSVgj4Yg6wlsV3UK6/wXvVgdHLIG00rcZITM4UFPabG5KV
         y95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gvYWAl5Rf5GU2DVghOd8Gqrs+1BvL6D/MpgfNfJUxQ0=;
        b=ib74nxuee2ueaVYf+mIN1ARcabXjpkfG+ZMW+flEH5tbmnC86dItpciEu1oLisooWC
         boCkuOhSPNfevlLQhFvraWCxllaBgpmOujm+6069luEOegda4GUhRO3CesOrDz53O97+
         ORELHJ9QsZJJvVP4VnniVB3xqyqyAexMDpCXHoiv9Ya5RZi5K2/UeurmUozqsKcKoQ/J
         I5RUjWnPK1y/+74//i1haKPx7iWgwQ4KmHIU5dEoN1DRByJ+BwJrrx9kqJd2Xq7YD3iL
         ukWeD98nUfnoIN28Ls+cCcY+GW3m5nIcpPbOJHZVxK7sMo02Khs8QjzP0NBoW97+pbYS
         Invw==
X-Gm-Message-State: AOAM533rTSRyYHvxKwbl2UIak+voUGA123j23PvZbjw17sLHIDaN2brs
        bPuOiHupXKuCe5a1MmAiYsIbEfZlp7Y=
X-Google-Smtp-Source: ABdhPJyfydjpaQ4r20YC1Sqi7i9b07/2lGmBYid8RFh1Sw+p540l1K5vAFMISf+A01wEPWbJt9Bx3Q==
X-Received: by 2002:aca:4b03:: with SMTP id y3mr8150901oia.82.1642178123629;
        Fri, 14 Jan 2022 08:35:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f18sm1952967oop.9.2022.01.14.08.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/8] hwmon: (lm83) Use regmap
Date:   Fri, 14 Jan 2022 08:35:08 -0800
Message-Id: <20220114163512.1094472-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Using local caching in this driver had few benefits. It used cached values
for two seconds and then re-read all registers from the chip even if the
user only accessed a single attribute. On top of that, alarm attributes
were stale for up to four seconds (the first status register read reports
and clears an alarm, the second reports it cleared). Use regmap instead
for caching. Do not re-read non-volatile registers, and do not cache
volatile registers.

As part of this change, handle register read and write address differences
in regmap code. This is necessary to avoid problems with caching in the
regmap core, and ultimately simplifies the code.

Also, errors observed when reading from and writing to registers are no
longer ignored.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 176 +++++++++++++++++++++++++++----------------
 1 file changed, 111 insertions(+), 65 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index fdd89cc481fa..c9605957e400 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -21,11 +21,11 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
@@ -77,7 +77,7 @@ enum chips { lm83, lm82 };
 				 (val) < 0 ? ((val) - 500) / 1000 : \
 				 ((val) + 500) / 1000)
 
-static const u8 LM83_REG_R_TEMP[] = {
+static const u8 LM83_REG_TEMP[] = {
 	LM83_REG_R_LOCAL_TEMP,
 	LM83_REG_R_REMOTE1_TEMP,
 	LM83_REG_R_REMOTE2_TEMP,
@@ -89,62 +89,82 @@ static const u8 LM83_REG_R_TEMP[] = {
 	LM83_REG_R_TCRIT,
 };
 
-static const u8 LM83_REG_W_HIGH[] = {
-	LM83_REG_W_LOCAL_HIGH,
-	LM83_REG_W_REMOTE1_HIGH,
-	LM83_REG_W_REMOTE2_HIGH,
-	LM83_REG_W_REMOTE3_HIGH,
-	LM83_REG_W_TCRIT,
-};
-
 /*
  * Client data (each client gets its own)
  */
 
 struct lm83_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	const struct attribute_group *groups[3];
-	struct mutex update_lock;
-	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
-
-	/* registers values */
-	s8 temp[9];	/* 0..3: input 1-4,
-			   4..7: high limit 1-4,
-			   8   : critical limit */
-	u16 alarms; /* bitvector, combined */
 };
 
-static struct lm83_data *lm83_update_device(struct device *dev)
+/* regmap code */
+
+static int lm83_regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
-	struct lm83_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
-		int nr;
-
-		dev_dbg(&client->dev, "Updating lm83 data.\n");
-		for (nr = 0; nr < 9; nr++) {
-			data->temp[nr] =
-			    i2c_smbus_read_byte_data(client,
-			    LM83_REG_R_TEMP[nr]);
-		}
-		data->alarms =
-		    i2c_smbus_read_byte_data(client, LM83_REG_R_STATUS1)
-		    + (i2c_smbus_read_byte_data(client, LM83_REG_R_STATUS2)
-		    << 8);
-
-		data->last_updated = jiffies;
-		data->valid = true;
+	struct i2c_client *client = context;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+	return 0;
+}
+
+/*
+ * The regmap write function maps read register addresses to write register
+ * addresses. This is necessary for regmap register caching to work.
+ * An alternative would be to clear the regmap cache whenever a register is
+ * written, but that would be much more expensive.
+ */
+static int lm83_regmap_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i2c_client *client = context;
+
+	switch (reg) {
+	case LM83_REG_R_CONFIG:
+	case LM83_REG_R_LOCAL_HIGH:
+	case LM83_REG_R_REMOTE2_HIGH:
+		reg += 0x06;
+		break;
+	case LM83_REG_R_REMOTE1_HIGH:
+	case LM83_REG_R_REMOTE3_HIGH:
+	case LM83_REG_R_TCRIT:
+		reg += 0x18;
+		break;
+	default:
+		break;
 	}
 
-	mutex_unlock(&data->update_lock);
+	return i2c_smbus_write_byte_data(client, reg, val);
+}
 
-	return data;
+static bool lm83_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LM83_REG_R_LOCAL_TEMP:
+	case LM83_REG_R_REMOTE1_TEMP:
+	case LM83_REG_R_REMOTE2_TEMP:
+	case LM83_REG_R_REMOTE3_TEMP:
+	case LM83_REG_R_STATUS1:
+	case LM83_REG_R_STATUS2:
+		return true;
+	default:
+		return false;
+	}
 }
 
+static const struct regmap_config lm83_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = lm83_regmap_is_volatile,
+	.reg_read = lm83_regmap_reg_read,
+	.reg_write = lm83_regmap_reg_write,
+};
+
 /*
  * Sysfs stuff
  */
@@ -153,8 +173,15 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm83_data *data = lm83_update_device(dev);
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
+	struct lm83_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(data->regmap, LM83_REG_TEMP[attr->index], &regval);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%d\n", TEMP_FROM_REG((s8)regval));
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -163,38 +190,57 @@ static ssize_t temp_store(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm83_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
+	unsigned int regval;
 	long val;
-	int nr = attr->index;
 	int err;
 
 	err = kstrtol(buf, 10, &val);
 	if (err < 0)
 		return err;
 
-	mutex_lock(&data->update_lock);
-	data->temp[nr] = TEMP_TO_REG(val);
-	i2c_smbus_write_byte_data(client, LM83_REG_W_HIGH[nr - 4],
-				  data->temp[nr]);
-	mutex_unlock(&data->update_lock);
-	return count;
+	regval = TEMP_TO_REG(val);
+	err = regmap_write(data->regmap, LM83_REG_TEMP[attr->index], regval);
+	return err ? : count;
 }
 
 static ssize_t alarms_show(struct device *dev, struct device_attribute *dummy,
 			   char *buf)
 {
-	struct lm83_data *data = lm83_update_device(dev);
-	return sprintf(buf, "%d\n", data->alarms);
+	struct lm83_data *data = dev_get_drvdata(dev);
+	unsigned int alarms, regval;
+	int err;
+
+	err = regmap_read(data->regmap, LM83_REG_R_STATUS1, &regval);
+	if (err < 0)
+		return err;
+	alarms = regval;
+	err = regmap_read(data->regmap, LM83_REG_R_STATUS2, &regval);
+	if (err < 0)
+		return err;
+	alarms |= regval << 8;
+
+	return sprintf(buf, "%u\n", alarms);
 }
 
 static ssize_t alarm_show(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm83_data *data = lm83_update_device(dev);
+	struct lm83_data *data = dev_get_drvdata(dev);
 	int bitnr = attr->index;
-
-	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
+	unsigned int alarm;
+	int reg, err;
+
+	if (bitnr < 8) {
+		reg = LM83_REG_R_STATUS1;
+	} else {
+		reg = LM83_REG_R_STATUS2;
+		bitnr -= 8;
+	}
+	err = regmap_read(data->regmap, reg, &alarm);
+	if (err < 0)
+		return err;
+	return sprintf(buf, "%d\n", (alarm >> bitnr) & 1);
 }
 
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
@@ -326,16 +372,17 @@ MODULE_DEVICE_TABLE(i2c, lm83_id);
 
 static int lm83_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm83_data *data;
 
-	data = devm_kzalloc(&client->dev, sizeof(struct lm83_data),
-			    GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct lm83_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
-	mutex_init(&data->update_lock);
+	data->regmap = devm_regmap_init(dev, NULL, client, &lm83_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
 
 	/*
 	 * Register sysfs hooks
@@ -347,8 +394,7 @@ static int lm83_probe(struct i2c_client *client)
 	if (i2c_match_id(lm83_id, client)->driver_data == lm83)
 		data->groups[1] = &lm83_group_opt;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
-							   client->name,
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, data->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.33.0

