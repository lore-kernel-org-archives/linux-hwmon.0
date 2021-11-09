Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127ABC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B906103C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhKIXvL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Nov 2021 18:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhKIXvL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Nov 2021 18:51:11 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C966EC061764
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Nov 2021 15:48:24 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id q124so1802606oig.3
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Nov 2021 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h7pmOqG46g4yzuDH4wjb8XKl1SAgWH0uxrNAXFCphKo=;
        b=KhFP973gKrD7MVNUhupHb9w6Fr6F+TFZn4UiFOXV8vm3SF2eeIes6ru/sTvJzsDB8N
         UwgaMV/pFwwmbdJGK8NfYBhDeraWo0DHXNixRSoapUXucTWGBgiFOZ18VLQlvC6VSyXm
         IyAhM2osHfyRgK+grryssKLwj148PzjjB6uL31xN37H9XZbF7enqw0tKvzKsYFb/BOmn
         W61FVN22ZQD9k0cR1tTccuXXfC6NuUOQJ+8aqxi60W2hO8WHRruNSFN27VS3AaPcsaCn
         XxPyUNBPNA/uiKul5D8zLeQ9Lye9NHkTCRIj10RqJPHBZFjKLNl16erf2J/2RMSrQ1zE
         XHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=h7pmOqG46g4yzuDH4wjb8XKl1SAgWH0uxrNAXFCphKo=;
        b=MNhQjQDD0txkQuo6rRMXvb+L6Wd5Vsq19KkwD/olRVy7V40IdtTa2sKe3TkUYDeyrI
         zpsQBbPviDm8jXx4YTYNfUZ5t350jc37oJHlyEk7STtNIL2L5/eWlAECCAO4WGRjLd7j
         Icx7hhhFNM9zJj0Ziw7t7y0WUP4w0McQnE3xEvmceWCNzvDRY9s6M/qHU0afRd5QbTsf
         L0RQrnPYRNUbxRZAxRPtVCGnfWQ0vxdoO4Fy+rccujqpoAREZHpjqnTiw/GOmfF0ZvtL
         rkg/U0L50UTNhhaJbsYChVt+GgDE3gUeskeI3nMZTH4FWhIdm1ZZh5f1bXYBOziaJo/J
         TVag==
X-Gm-Message-State: AOAM533RlPmR8AXktdMvD2friTYflnsOOHebCaFz4u5elkCaFi7j3S3F
        ji+cJ0onjgr4aIUecsWwuoZ5NopvY1A=
X-Google-Smtp-Source: ABdhPJxBoMP64hfV8YbUPYeLBMKArDxuYpBUFBSHYXl+rJYJlmjLPJXlr2KZ5TDjnAJDGEbKdZge5g==
X-Received: by 2002:aca:280f:: with SMTP id 15mr9166305oix.129.1636501703542;
        Tue, 09 Nov 2021 15:48:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p133sm7750254oia.11.2021.11.09.15.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 15:48:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (tmp401) Convert to _info API
Date:   Tue,  9 Nov 2021 15:48:12 -0800
Message-Id: <20211109234814.3724798-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109234814.3724798-1-linux@roeck-us.net>
References: <20211109234814.3724798-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The new API is cleaner and reduces code size significantly.
All chip accesses are 'hidden' in chip access to prepare for using
regmap. Local caching code is removed, to be replaced by regmap based
caching in a follow-up patch.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp401.c | 733 +++++++++++++++++++----------------------
 1 file changed, 347 insertions(+), 386 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 29c857a76c9e..f595d8555370 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -18,17 +18,14 @@
  * and thus has 16 bits registers for its value and limit instead of 8 bits.
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/bitops.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/sysfs.h>
+#include <linux/slab.h>
 
 /* Addresses to scan */
 static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4c, 0x4d,
@@ -55,7 +52,7 @@ static const u8 TMP401_TEMP_MSB_READ[7][3] = {
 	{ 0x05, 0x07, 0x15 },	/* high limit */
 	{ 0x20, 0x19, 0x1a },	/* therm (crit) limit */
 	{ 0x30, 0x34, 0x00 },	/* lowest */
-	{ 0x32, 0x36, 0x00 },	/* highest */
+	{ 0x32, 0xf6, 0x00 },	/* highest */
 };
 
 static const u8 TMP401_TEMP_MSB_WRITE[7][3] = {
@@ -64,7 +61,7 @@ static const u8 TMP401_TEMP_MSB_WRITE[7][3] = {
 	{ 0x0B, 0x0D, 0x15 },	/* high limit */
 	{ 0x20, 0x19, 0x1a },	/* therm (crit) limit */
 	{ 0x30, 0x34, 0x00 },	/* lowest */
-	{ 0x32, 0x36, 0x00 },	/* highest */
+	{ 0x32, 0xf6, 0x00 },	/* highest */
 };
 
 /* [0] = fault, [1] = low, [2] = high, [3] = therm/crit */
@@ -117,309 +114,264 @@ MODULE_DEVICE_TABLE(i2c, tmp401_id);
 
 struct tmp401_data {
 	struct i2c_client *client;
-	const struct attribute_group *groups[3];
 	struct mutex update_lock;
-	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
 	enum chips kind;
 
-	unsigned int update_interval;	/* in milliseconds */
+	bool extended_range;
 
-	/* register values */
-	u8 status[4];
-	u8 config;
-	u16 temp[7][3];
-	u8 temp_crit_hyst;
+	/* hwmon API configuration data */
+	u32 chip_channel_config[4];
+	struct hwmon_channel_info chip_info;
+	u32 temp_channel_config[4];
+	struct hwmon_channel_info temp_info;
+	const struct hwmon_channel_info *info[3];
+	struct hwmon_chip_info chip;
 };
 
-/*
- * Sysfs attr show / store functions
- */
-
-static int tmp401_register_to_temp(u16 reg, u8 config)
+static int tmp401_register_to_temp(u16 reg, bool extended)
 {
 	int temp = reg;
 
-	if (config & TMP401_CONFIG_RANGE)
+	if (extended)
 		temp -= 64 * 256;
 
 	return DIV_ROUND_CLOSEST(temp * 125, 32);
 }
 
-static u16 tmp401_temp_to_register(long temp, u8 config, int zbits)
+static u16 tmp401_temp_to_register(long temp, bool extended, int zbits)
 {
-	if (config & TMP401_CONFIG_RANGE) {
+	if (extended) {
 		temp = clamp_val(temp, -64000, 191000);
 		temp += 64000;
-	} else
+	} else {
 		temp = clamp_val(temp, 0, 127000);
+	}
 
 	return DIV_ROUND_CLOSEST(temp * (1 << (8 - zbits)), 1000) << zbits;
 }
 
-static int tmp401_update_device_reg16(struct i2c_client *client,
-				      struct tmp401_data *data)
-{
-	int i, j, val;
-	int num_regs = data->kind == tmp411 ? 6 : 4;
-	int num_sensors = data->kind == tmp432 ? 3 : 2;
-
-	for (i = 0; i < num_sensors; i++) {		/* local / r1 / r2 */
-		for (j = 0; j < num_regs; j++) {	/* temp / low / ... */
-			u8 regaddr;
-
-			regaddr = TMP401_TEMP_MSB_READ[j][i];
-			if (j == 3) { /* crit is msb only */
-				val = i2c_smbus_read_byte_data(client, regaddr);
-			} else {
-				val = i2c_smbus_read_word_swapped(client,
-								  regaddr);
-			}
-			if (val < 0)
-				return val;
-
-			data->temp[j][i] = j == 3 ? val << 8 : val;
-		}
-	}
-	return 0;
-}
-
-static struct tmp401_data *tmp401_update_device(struct device *dev)
+static int tmp401_reg_read(struct tmp401_data *data, unsigned int reg)
 {
-	struct tmp401_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	struct tmp401_data *ret = data;
-	int i, val;
-	unsigned long next_update;
+	int val, regval;
 
-	mutex_lock(&data->update_lock);
-
-	next_update = data->last_updated +
-		      msecs_to_jiffies(data->update_interval);
-	if (time_after(jiffies, next_update) || !data->valid) {
-		if (data->kind != tmp432) {
-			/*
-			 * The driver uses the TMP432 status format internally.
-			 * Convert status to TMP432 format for other chips.
-			 */
-			val = i2c_smbus_read_byte_data(client, TMP401_STATUS);
-			if (val < 0) {
-				ret = ERR_PTR(val);
-				goto abort;
-			}
-			data->status[0] =
-			  (val & TMP401_STATUS_REMOTE_OPEN) >> 1;
-			data->status[1] =
-			  ((val & TMP401_STATUS_REMOTE_LOW) >> 2) |
-			  ((val & TMP401_STATUS_LOCAL_LOW) >> 5);
-			data->status[2] =
-			  ((val & TMP401_STATUS_REMOTE_HIGH) >> 3) |
-			  ((val & TMP401_STATUS_LOCAL_HIGH) >> 6);
-			data->status[3] = val & (TMP401_STATUS_LOCAL_CRIT
-						| TMP401_STATUS_REMOTE_CRIT);
-		} else {
-			for (i = 0; i < ARRAY_SIZE(data->status); i++) {
-				val = i2c_smbus_read_byte_data(client,
-							TMP432_STATUS_REG[i]);
-				if (val < 0) {
-					ret = ERR_PTR(val);
-					goto abort;
-				}
-				data->status[i] = val;
-			}
-		}
-
-		val = i2c_smbus_read_byte_data(client, TMP401_CONFIG_READ);
-		if (val < 0) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->config = val;
-		val = tmp401_update_device_reg16(client, data);
-		if (val < 0) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		val = i2c_smbus_read_byte_data(client, TMP401_TEMP_CRIT_HYST);
-		if (val < 0) {
-			ret = ERR_PTR(val);
-			goto abort;
+	switch (reg) {
+	case 0:			/* local temp msb */
+	case 1:			/* remote temp msb */
+	case 5:			/* local temp high limit msb */
+	case 6:			/* local temp low limit msb */
+	case 7:			/* remote temp ligh limit msb */
+	case 8:			/* remote temp low limit msb */
+	case 0x15:		/* remote temp 2 high limit msb */
+	case 0x16:		/* remote temp 2 low limit msb */
+	case 0x23:		/* remote temp 2 msb */
+	case 0x30:		/* local temp minimum, tmp411 */
+	case 0x32:		/* local temp maximum, tmp411 */
+	case 0x34:		/* remote temp minimum, tmp411 */
+	case 0xf6:		/* remote temp maximum, tmp411 (really 0x36) */
+		/* work around register overlap between TMP411 and TMP432 */
+		if (reg == 0xf6)
+			reg = 0x36;
+		return i2c_smbus_read_word_swapped(client, reg);
+	case 0x19:		/* critical limits, 8-bit registers */
+	case 0x1a:
+	case 0x20:
+		regval = i2c_smbus_read_byte_data(client, reg);
+		if (regval < 0)
+			return regval;
+		return regval << 8;
+	case 0x1b:
+	case 0x35 ... 0x37:
+		if (data->kind == tmp432)
+			return i2c_smbus_read_byte_data(client, reg);
+		/* simulate TMP432 status registers */
+		regval = i2c_smbus_read_byte_data(client, TMP401_STATUS);
+		if (regval < 0)
+			return regval;
+		val = 0;
+		switch (reg) {
+		case 0x1b:	/* open / fault */
+			if (regval & TMP401_STATUS_REMOTE_OPEN)
+				val |= BIT(1);
+			break;
+		case 0x35:	/* high limit */
+			if (regval & TMP401_STATUS_LOCAL_HIGH)
+				val |= BIT(0);
+			if (regval & TMP401_STATUS_REMOTE_HIGH)
+				val |= BIT(1);
+			break;
+		case 0x36:	/* low limit */
+			if (regval & TMP401_STATUS_LOCAL_LOW)
+				val |= BIT(0);
+			if (regval & TMP401_STATUS_REMOTE_LOW)
+				val |= BIT(1);
+			break;
+		case 0x37:	/* therm / crit limit */
+			if (regval & TMP401_STATUS_LOCAL_CRIT)
+				val |= BIT(0);
+			if (regval & TMP401_STATUS_REMOTE_CRIT)
+				val |= BIT(1);
+			break;
 		}
-		data->temp_crit_hyst = val;
-
-		data->last_updated = jiffies;
-		data->valid = true;
+		return val;
+	default:
+		return i2c_smbus_read_byte_data(client, reg);
 	}
-
-abort:
-	mutex_unlock(&data->update_lock);
-	return ret;
-}
-
-static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	int nr = to_sensor_dev_attr_2(devattr)->nr;
-	int index = to_sensor_dev_attr_2(devattr)->index;
-	struct tmp401_data *data = tmp401_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n",
-		tmp401_register_to_temp(data->temp[nr][index], data->config));
 }
 
-static ssize_t temp_crit_hyst_show(struct device *dev,
-				   struct device_attribute *devattr,
-				   char *buf)
+static int tmp401_reg_write(struct tmp401_data *data, unsigned int reg, unsigned int val)
 {
-	int temp, index = to_sensor_dev_attr(devattr)->index;
-	struct tmp401_data *data = tmp401_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	mutex_lock(&data->update_lock);
-	temp = tmp401_register_to_temp(data->temp[3][index], data->config);
-	temp -= data->temp_crit_hyst * 1000;
-	mutex_unlock(&data->update_lock);
+	struct i2c_client *client = data->client;
 
-	return sprintf(buf, "%d\n", temp);
+	switch (reg) {
+	case 0x0b:		/* local temp high limit msb */
+	case 0x0c:		/* local temp low limit msb */
+	case 0x0d:		/* remote temp ligh limit msb */
+	case 0x0e:		/* remote temp low limit msb */
+	case 0x15:		/* remote temp 2 high limit msb */
+	case 0x16:		/* remote temp 2 low limit msb */
+		return i2c_smbus_write_word_swapped(client, reg, val);
+	case 0x19:		/* critical limits, 8-bit registers */
+	case 0x1a:
+	case 0x20:
+		return i2c_smbus_write_byte_data(client, reg, val >> 8);
+	default:
+		return i2c_smbus_write_byte_data(client, reg, val);
+	}
 }
 
-static ssize_t status_show(struct device *dev,
-			   struct device_attribute *devattr, char *buf)
-{
-	int nr = to_sensor_dev_attr_2(devattr)->nr;
-	int mask = to_sensor_dev_attr_2(devattr)->index;
-	struct tmp401_data *data = tmp401_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+static const u8 tmp401_temp_reg_index[] = {
+	[hwmon_temp_input] = 0,
+	[hwmon_temp_min] = 1,
+	[hwmon_temp_max] = 2,
+	[hwmon_temp_crit] = 3,
+	[hwmon_temp_lowest] = 4,
+	[hwmon_temp_highest] = 5,
+};
 
-	return sprintf(buf, "%d\n", !!(data->status[nr] & mask));
-}
+static const u8 tmp401_status_reg_index[] = {
+	[hwmon_temp_fault] = 0,
+	[hwmon_temp_min_alarm] = 1,
+	[hwmon_temp_max_alarm] = 2,
+	[hwmon_temp_crit_alarm] = 3,
+};
 
-static ssize_t temp_store(struct device *dev,
-			  struct device_attribute *devattr, const char *buf,
-			  size_t count)
+static int tmp401_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
-	int nr = to_sensor_dev_attr_2(devattr)->nr;
-	int index = to_sensor_dev_attr_2(devattr)->index;
 	struct tmp401_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	long val;
-	u16 reg;
-	u8 regaddr;
-
-	if (kstrtol(buf, 10, &val))
-		return -EINVAL;
-
-	reg = tmp401_temp_to_register(val, data->config, nr == 3 ? 8 : 4);
-
-	mutex_lock(&data->update_lock);
-
-	regaddr = TMP401_TEMP_MSB_WRITE[nr][index];
-	if (nr == 3) { /* crit is msb only */
-		i2c_smbus_write_byte_data(client, regaddr, reg >> 8);
-	} else {
-		/* Hardware expects big endian data --> use _swapped */
-		i2c_smbus_write_word_swapped(client, regaddr, reg);
+	int reg, regval;
+
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+	case hwmon_temp_crit:
+	case hwmon_temp_lowest:
+	case hwmon_temp_highest:
+		reg = TMP401_TEMP_MSB_READ[tmp401_temp_reg_index[attr]][channel];
+		regval = tmp401_reg_read(data, reg);
+		if (regval < 0)
+			return regval;
+		*val = tmp401_register_to_temp(regval, data->extended_range);
+		break;
+	case hwmon_temp_crit_hyst:
+		mutex_lock(&data->update_lock);
+		reg = TMP401_TEMP_MSB_READ[3][channel];
+		regval = tmp401_reg_read(data, reg);
+		if (regval < 0)
+			goto unlock;
+		*val = tmp401_register_to_temp(regval, data->extended_range);
+		regval = tmp401_reg_read(data, TMP401_TEMP_CRIT_HYST);
+		if (regval < 0)
+			goto unlock;
+		*val -= regval * 1000;
+		regval = 0;
+unlock:
+		mutex_unlock(&data->update_lock);
+		if (regval < 0)
+			return regval;
+		break;
+	case hwmon_temp_fault:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+		reg = TMP432_STATUS_REG[tmp401_status_reg_index[attr]];
+		regval = tmp401_reg_read(data, reg);
+		if (regval < 0)
+			return regval;
+		*val = !!(regval & BIT(channel));
+		break;
+	default:
+		return -EOPNOTSUPP;
 	}
-	data->temp[nr][index] = reg;
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
+	return 0;
 }
 
-static ssize_t temp_crit_hyst_store(struct device *dev,
-				    struct device_attribute *devattr,
-				    const char *buf, size_t count)
-{
-	int temp, index = to_sensor_dev_attr(devattr)->index;
-	struct tmp401_data *data = tmp401_update_device(dev);
-	long val;
-	u8 reg;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if (kstrtol(buf, 10, &val))
-		return -EINVAL;
-
-	if (data->config & TMP401_CONFIG_RANGE)
-		val = clamp_val(val, -64000, 191000);
-	else
-		val = clamp_val(val, 0, 127000);
-
-	mutex_lock(&data->update_lock);
-	temp = tmp401_register_to_temp(data->temp[3][index], data->config);
-	val = clamp_val(val, temp - 255000, temp);
-	reg = ((temp - val) + 500) / 1000;
-
-	i2c_smbus_write_byte_data(data->client, TMP401_TEMP_CRIT_HYST,
-				  reg);
-
-	data->temp_crit_hyst = reg;
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-/*
- * Resets the historical measurements of minimum and maximum temperatures.
- * This is done by writing any value to any of the minimum/maximum registers
- * (0x30-0x37).
- */
-static ssize_t reset_temp_history_store(struct device *dev,
-					struct device_attribute *devattr,
-					const char *buf, size_t count)
+static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
+			     long val)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	long val;
-
-	if (kstrtol(buf, 10, &val))
-		return -EINVAL;
+	int reg, regval, ret, temp;
 
-	if (val != 1) {
-		dev_err(dev,
-			"temp_reset_history value %ld not supported. Use 1 to reset the history!\n",
-			val);
-		return -EINVAL;
-	}
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, TMP401_TEMP_MSB_WRITE[5][0], val);
-	data->valid = false;
+	switch (attr) {
+	case hwmon_temp_min:
+	case hwmon_temp_max:
+	case hwmon_temp_crit:
+		reg = TMP401_TEMP_MSB_WRITE[tmp401_temp_reg_index[attr]][channel];
+		regval = tmp401_temp_to_register(val, data->extended_range,
+						 attr == hwmon_temp_crit ? 8 : 4);
+		ret = tmp401_reg_write(data, reg, regval);
+		break;
+	case hwmon_temp_crit_hyst:
+		if (data->extended_range)
+			val = clamp_val(val, -64000, 191000);
+		else
+			val = clamp_val(val, 0, 127000);
+
+		reg = TMP401_TEMP_MSB_READ[3][channel];
+		ret = tmp401_reg_read(data, reg);
+		if (ret < 0)
+			break;
+		temp = tmp401_register_to_temp(ret, data->extended_range);
+		val = clamp_val(val, temp - 255000, temp);
+		regval = ((temp - val) + 500) / 1000;
+		ret = tmp401_reg_write(data, TMP401_TEMP_CRIT_HYST, regval);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
 	mutex_unlock(&data->update_lock);
-
-	return count;
+	return ret;
 }
 
-static ssize_t update_interval_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static int tmp401_chip_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
+	int regval;
+
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		regval = tmp401_reg_read(data, TMP401_CONVERSION_RATE_READ);
+		if (regval < 0)
+			return regval;
+		*val = (1 << (7 - regval)) * 125;
+		break;
+	case hwmon_chip_temp_reset_history:
+		*val = 0;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	return sprintf(buf, "%u\n", data->update_interval);
+	return 0;
 }
 
-static ssize_t update_interval_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
+static int tmp401_set_convrate(struct i2c_client *client, struct tmp401_data *data, long val)
 {
-	struct tmp401_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long val;
 	int err, rate;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-
 	/*
 	 * For valid rates, interval can be calculated as
 	 *	interval = (1 << (7 - rate)) * 125;
@@ -430,130 +382,112 @@ static ssize_t update_interval_store(struct device *dev,
 	 */
 	val = clamp_val(val, 125, 16000);
 	rate = 7 - __fls(val * 4 / (125 * 3));
+	err = i2c_smbus_write_byte_data(client, TMP401_CONVERSION_RATE_WRITE, rate);
+	if (err)
+		return err;
+	return 0;
+}
+
+static int tmp401_chip_write(struct device *dev, u32 attr, int channel, long val)
+{
+	struct tmp401_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int err;
+
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, TMP401_CONVERSION_RATE_WRITE, rate);
-	data->update_interval = (1 << (7 - rate)) * 125;
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		err = tmp401_set_convrate(client, data, val);
+		break;
+	case hwmon_chip_temp_reset_history:
+		if (val != 1) {
+			err = -EINVAL;
+			break;
+		}
+		/*
+		 * Reset history by writing any value to any of the
+		 * minimum/maximum registers (0x30-0x37).
+		 */
+		err = i2c_smbus_write_byte_data(client, 0x30, 0);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err;
 }
 
-static SENSOR_DEVICE_ATTR_2_RO(temp1_input, temp, 0, 0);
-static SENSOR_DEVICE_ATTR_2_RW(temp1_min, temp, 1, 0);
-static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp, 2, 0);
-static SENSOR_DEVICE_ATTR_2_RW(temp1_crit, temp, 3, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, temp_crit_hyst, 0);
-static SENSOR_DEVICE_ATTR_2_RO(temp1_min_alarm, status, 1,
-			       TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2_RO(temp1_max_alarm, status, 2,
-			       TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2_RO(temp1_crit_alarm, status, 3,
-			       TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_input, temp, 0, 1);
-static SENSOR_DEVICE_ATTR_2_RW(temp2_min, temp, 1, 1);
-static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp, 2, 1);
-static SENSOR_DEVICE_ATTR_2_RW(temp2_crit, temp, 3, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_hyst, temp_crit_hyst, 1);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_fault, status, 0, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_min_alarm, status, 1,
-			       TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_max_alarm, status, 2,
-			       TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_crit_alarm, status, 3,
-			       TMP432_STATUS_REMOTE1);
-
-static DEVICE_ATTR_RW(update_interval);
-
-static struct attribute *tmp401_attributes[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-
-	&dev_attr_update_interval.attr,
-
-	NULL
-};
-
-static const struct attribute_group tmp401_group = {
-	.attrs = tmp401_attributes,
-};
-
-/*
- * Additional features of the TMP411 chip.
- * The TMP411 stores the minimum and maximum
- * temperature measured since power-on, chip-reset, or
- * minimum and maximum register reset for both the local
- * and remote channels.
- */
-static SENSOR_DEVICE_ATTR_2_RO(temp1_lowest, temp, 4, 0);
-static SENSOR_DEVICE_ATTR_2_RO(temp1_highest, temp, 5, 0);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_lowest, temp, 4, 1);
-static SENSOR_DEVICE_ATTR_2_RO(temp2_highest, temp, 5, 1);
-static SENSOR_DEVICE_ATTR_WO(temp_reset_history, reset_temp_history, 0);
-
-static struct attribute *tmp411_attributes[] = {
-	&sensor_dev_attr_temp1_highest.dev_attr.attr,
-	&sensor_dev_attr_temp1_lowest.dev_attr.attr,
-	&sensor_dev_attr_temp2_highest.dev_attr.attr,
-	&sensor_dev_attr_temp2_lowest.dev_attr.attr,
-	&sensor_dev_attr_temp_reset_history.dev_attr.attr,
-	NULL
-};
+static int tmp401_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return tmp401_chip_read(dev, attr, channel, val);
+	case hwmon_temp:
+		return tmp401_temp_read(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-static const struct attribute_group tmp411_group = {
-	.attrs = tmp411_attributes,
-};
+static int tmp401_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return tmp401_chip_write(dev, attr, channel, val);
+	case hwmon_temp:
+		return tmp401_temp_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-static SENSOR_DEVICE_ATTR_2_RO(temp3_input, temp, 0, 2);
-static SENSOR_DEVICE_ATTR_2_RW(temp3_min, temp, 1, 2);
-static SENSOR_DEVICE_ATTR_2_RW(temp3_max, temp, 2, 2);
-static SENSOR_DEVICE_ATTR_2_RW(temp3_crit, temp, 3, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_crit_hyst, temp_crit_hyst, 2);
-static SENSOR_DEVICE_ATTR_2_RO(temp3_fault, status, 0, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2_RO(temp3_min_alarm, status, 1,
-			       TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2_RO(temp3_max_alarm, status, 2,
-			       TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2_RO(temp3_crit_alarm, status, 3,
-			       TMP432_STATUS_REMOTE2);
-
-static struct attribute *tmp432_attributes[] = {
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_min.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
-
-	NULL
-};
+static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+		case hwmon_chip_temp_reset_history:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_min_alarm:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_crit_alarm:
+		case hwmon_temp_fault:
+		case hwmon_temp_lowest:
+		case hwmon_temp_highest:
+			return 0444;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+		case hwmon_temp_crit:
+		case hwmon_temp_crit_hyst:
+			return 0644;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+	return 0;
+}
 
-static const struct attribute_group tmp432_group = {
-	.attrs = tmp432_attributes,
+static const struct hwmon_ops tmp401_ops = {
+	.is_visible = tmp401_is_visible,
+	.read = tmp401_read,
+	.write = tmp401_write,
 };
 
-/*
- * Begin non sysfs callback code (aka Real code)
- */
-
 static int tmp401_init_client(struct tmp401_data *data,
 			      struct i2c_client *client)
 {
@@ -561,7 +495,6 @@ static int tmp401_init_client(struct tmp401_data *data,
 
 	/* Set the conversion rate to 2 Hz */
 	i2c_smbus_write_byte_data(client, TMP401_CONVERSION_RATE_WRITE, 5);
-	data->update_interval = 500;
 
 	/* Start conversions (disable shutdown if necessary) */
 	config = i2c_smbus_read_byte_data(client, TMP401_CONFIG_READ);
@@ -571,6 +504,8 @@ static int tmp401_init_client(struct tmp401_data *data,
 	config_orig = config;
 	config &= ~TMP401_CONFIG_SHUTDOWN;
 
+	data->extended_range = !!(config & TMP401_CONFIG_RANGE);
+
 	if (config != config_orig)
 		status = i2c_smbus_write_byte_data(client,
 						   TMP401_CONFIG_WRITE,
@@ -654,9 +589,10 @@ static int tmp401_probe(struct i2c_client *client)
 		"TMP401", "TMP411", "TMP431", "TMP432", "TMP435"
 	};
 	struct device *dev = &client->dev;
+	struct hwmon_channel_info *info;
 	struct device *hwmon_dev;
 	struct tmp401_data *data;
-	int groups = 0, status;
+	int status;
 
 	data = devm_kzalloc(dev, sizeof(struct tmp401_data), GFP_KERNEL);
 	if (!data)
@@ -666,24 +602,49 @@ static int tmp401_probe(struct i2c_client *client)
 	mutex_init(&data->update_lock);
 	data->kind = i2c_match_id(tmp401_id, client)->driver_data;
 
+	/* initialize configuration data */
+	data->chip.ops = &tmp401_ops;
+	data->chip.info = data->info;
+
+	data->info[0] = &data->chip_info;
+	data->info[1] = &data->temp_info;
+
+	info = &data->chip_info;
+	info->type = hwmon_chip;
+	info->config = data->chip_channel_config;
+
+	data->chip_channel_config[0] = HWMON_C_UPDATE_INTERVAL;
+
+	info = &data->temp_info;
+	info->type = hwmon_temp;
+	info->config = data->temp_channel_config;
+
+	data->temp_channel_config[0] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
+	data->temp_channel_config[1] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT;
+
+	if (data->kind == tmp411) {
+		data->temp_channel_config[0] |= HWMON_T_HIGHEST | HWMON_T_LOWEST;
+		data->temp_channel_config[1] |= HWMON_T_HIGHEST | HWMON_T_LOWEST;
+		data->chip_channel_config[0] |= HWMON_C_TEMP_RESET_HISTORY;
+	}
+
+	if (data->kind == tmp432) {
+		data->temp_channel_config[2] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT;
+	}
+
 	/* Initialize the TMP401 chip */
 	status = tmp401_init_client(data, client);
 	if (status < 0)
 		return status;
 
-	/* Register sysfs hooks */
-	data->groups[groups++] = &tmp401_group;
-
-	/* Register additional tmp411 sysfs hooks */
-	if (data->kind == tmp411)
-		data->groups[groups++] = &tmp411_group;
-
-	/* Register additional tmp432 sysfs hooks */
-	if (data->kind == tmp432)
-		data->groups[groups++] = &tmp432_group;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &data->chip, NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-- 
2.33.0

