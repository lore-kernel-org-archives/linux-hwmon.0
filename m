Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A029CFB
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273987; cv=none; b=nD+GULfjfm0f3P9pTgHYqkawCqX9QqbDDbRyS4ux6w0llAjRQw2xqmDGd0t92arDBc+mdG3YfLb0OG2gfyfq9LokPnz0SPrAmt8MD3ZaY1wGrSycUZvF/fJE1y8jHg2KQZ1fHjeOe3sM24ullz2g87uNEu55zGKuEC37guMgj+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273987; c=relaxed/simple;
	bh=CUBjAHo0a0GiTXAFr/ztsfSI8JUBfEwzpXfjN2Rw82Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gaB129VS9kU0Cy1bm2MHoJ06oCGcJm6Np0j03rwJBpzIV45H4vhHOYm0CBUBHZ0H2OO6DtPdScxe3uvWuqF2rrw3MrcVqyyC5077udCGix7VtXDug5s5RxcUU+rvwgyjSnIVemrWkmmteL4L4QzYJ4DR/qYIR28LQmHjBzxDso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlhjQPOg; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlhjQPOg"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2caeafd16deso254301a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273984; x=1721878784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kML916YJrKJe7LqhvwLQlFlDcJ5D6uky50LwP5en5ME=;
        b=HlhjQPOgFcSEDstq9mtaP/EdNL5IfCD4GOQyoe1pQ+qH2l1Vk5RLBq3Ink/zVa4Rkq
         N4uMyspAnnt5h/WqrCFV/lRxU18LQAlFeCtvIwARwE46/Nwgk7gB1nZr6X/PEtu5FKOU
         bPHHiZYzynNmjUn17i6ytSIvTxfN7L5hOjHLEZKvsSlQfmMjsDjHbxvTwe92x8TkyweE
         /dvOek4AsgbQXwjOu0E4tGkaP9DLK3koUdpoTtRTaopjoaNbUrsRKcoMOVozLfWKNg/K
         +zITTR9wA1IIIv/3UE0ppOT5IVANGp9lG4Ckbdv7akZwqdXVIRzWvQWFnAq5Wfteo72Y
         E5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273984; x=1721878784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kML916YJrKJe7LqhvwLQlFlDcJ5D6uky50LwP5en5ME=;
        b=YNgXrwhUbDfA741+93+Zt/rjF+M7CT4u3vz2gWYFu645yjqS2IOQTsSrRLaOJYvort
         b6mDcMK13yx2oAyaQ7Euqxv3t0JgpclyIbmGUPKzonYEGy0c2182U1JEczd52SYRAETB
         teRSPvpFsMSnQU6B5iF5up0dbAQgO/kKCgCp5KM8tqttWBKWw9BvGtKkOG7L2RcrlPks
         Y23rSxlUZXf8/OmM09WupUEd2tze7qyJzOYKCUGJ28Q/wXgnkoO0MxYikITfsg10eh+R
         VbJoLJm7Zn+uyfrpgDkB15hSXvQmuAFc0p+wbTWyPTxGzgNiLHBP2tAgakB6PRdWswXk
         U8Ag==
X-Gm-Message-State: AOJu0Yzt5ym+Q8A4B1zCilG0A0EqaiSbxYfpotwM/auU1skyoB+fZVDF
	nvzUUdIhNBlvRxT4e3wXIVvRhdPRuSa+xB1LKJgJ4vXLdvG7QYet1rGMqg==
X-Google-Smtp-Source: AGHT+IGF+Ro4HYS5ZKB8LFOmEfoKx8yTfhYBPpApeE48UnmDrxtF/W7VNnHE43+nyUvJH5ljh/WrNw==
X-Received: by 2002:a17:90b:3102:b0:2c2:1d7a:1e10 with SMTP id 98e67ed59e1d1-2cb52691c48mr3052292a91.15.1721273983808;
        Wed, 17 Jul 2024 20:39:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb600eae2esm750080a91.20.2024.07.17.20.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/6] hwmon: (lm95234) Convert to use regmap
Date: Wed, 17 Jul 2024 20:39:32 -0700
Message-Id: <20240718033935.205185-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718033935.205185-1-linux@roeck-us.net>
References: <20240718033935.205185-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use regmap to replace local caching and to be able to use regmap API
functions.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/lm95234.c | 437 +++++++++++++++++-----------------------
 2 files changed, 186 insertions(+), 252 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b60fe2e58ad6..e838a55bb3cb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1532,6 +1532,7 @@ config SENSORS_LM93
 config SENSORS_LM95234
 	tristate "National Semiconductor LM95234 and compatibles"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the LM95233 and LM95234
 	  temperature sensor chips.
diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index a36fa7824da8..7a3aff1d183a 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -13,10 +13,10 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/sysfs.h>
 #include <linux/util_macros.h>
 
@@ -33,6 +33,8 @@ static const unsigned short normal_i2c[] = {
 #define LM95234_REG_STATUS		0x02
 #define LM95234_REG_CONFIG		0x03
 #define LM95234_REG_CONVRATE		0x04
+#define LM95234_REG_ENABLE		0x05
+#define LM95234_REG_FILTER		0x06
 #define LM95234_REG_STS_FAULT		0x07
 #define LM95234_REG_STS_TCRIT1		0x08
 #define LM95234_REG_STS_TCRIT2		0x09
@@ -53,181 +55,72 @@ static const unsigned short normal_i2c[] = {
 
 /* Client data (each client gets its own) */
 struct lm95234_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	const struct attribute_group *groups[3];
 	struct mutex update_lock;
-	unsigned long last_updated, interval;	/* in jiffies */
-	bool valid;		/* false until following fields are valid */
-	/* registers values */
-	int temp[5];		/* temperature (signed) */
-	u32 status;		/* fault/alarm status */
-	u8 tcrit1[5];		/* critical temperature limit */
-	u8 tcrit2[2];		/* high temperature limit */
-	s8 toffset[4];		/* remote temperature offset */
-	u8 thyst;		/* common hysteresis */
-
-	u8 sensor_type;		/* temperature sensor type */
 };
 
-static int lm95234_read_temp(struct i2c_client *client, int index, int *t)
+static int lm95234_read_temp(struct regmap *regmap, int index, int *t)
 {
-	int val;
-	u16 temp = 0;
+	int temp = 0, ret;
+	u32 val;
 
 	if (index) {
-		val = i2c_smbus_read_byte_data(client,
-					       LM95234_REG_UTEMPH(index - 1));
-		if (val < 0)
-			return val;
+		ret = regmap_read(regmap, LM95234_REG_UTEMPH(index - 1), &val);
+		if (ret)
+			return ret;
 		temp = val << 8;
-		val = i2c_smbus_read_byte_data(client,
-					       LM95234_REG_UTEMPL(index - 1));
-		if (val < 0)
-			return val;
+		ret = regmap_read(regmap, LM95234_REG_UTEMPL(index - 1), &val);
+		if (ret)
+			return ret;
 		temp |= val;
-		*t = temp;
 	}
 	/*
 	 * Read signed temperature if unsigned temperature is 0,
 	 * or if this is the local sensor.
 	 */
 	if (!temp) {
-		val = i2c_smbus_read_byte_data(client,
-					       LM95234_REG_TEMPH(index));
-		if (val < 0)
-			return val;
+		ret = regmap_read(regmap, LM95234_REG_TEMPH(index), &val);
+		if (ret)
+			return ret;
 		temp = val << 8;
-		val = i2c_smbus_read_byte_data(client,
-					       LM95234_REG_TEMPL(index));
-		if (val < 0)
-			return val;
-		temp |= val;
-		*t = (s16)temp;
+		ret = regmap_read(regmap, LM95234_REG_TEMPL(index), &val);
+		if (ret)
+			return ret;
+		temp = sign_extend32(temp | val, 15);
 	}
+	*t = DIV_ROUND_CLOSEST(temp * 125, 32);
 	return 0;
 }
 
-static u16 update_intervals[] = { 143, 364, 1000, 2500 };
-
-/* Fill value cache. Must be called with update lock held. */
-
-static int lm95234_fill_cache(struct lm95234_data *data,
-			      struct i2c_client *client)
-{
-	int i, ret;
-
-	ret = i2c_smbus_read_byte_data(client, LM95234_REG_CONVRATE);
-	if (ret < 0)
-		return ret;
-
-	data->interval = msecs_to_jiffies(update_intervals[ret & 0x03]);
-
-	for (i = 0; i < ARRAY_SIZE(data->tcrit1); i++) {
-		ret = i2c_smbus_read_byte_data(client, LM95234_REG_TCRIT1(i));
-		if (ret < 0)
-			return ret;
-		data->tcrit1[i] = ret;
-	}
-	for (i = 0; i < ARRAY_SIZE(data->tcrit2); i++) {
-		ret = i2c_smbus_read_byte_data(client, LM95234_REG_TCRIT2(i));
-		if (ret < 0)
-			return ret;
-		data->tcrit2[i] = ret;
-	}
-	for (i = 0; i < ARRAY_SIZE(data->toffset); i++) {
-		ret = i2c_smbus_read_byte_data(client, LM95234_REG_OFFSET(i));
-		if (ret < 0)
-			return ret;
-		data->toffset[i] = ret;
-	}
-
-	ret = i2c_smbus_read_byte_data(client, LM95234_REG_TCRIT_HYST);
-	if (ret < 0)
-		return ret;
-	data->thyst = ret;
-
-	ret = i2c_smbus_read_byte_data(client, LM95234_REG_REM_MODEL);
-	if (ret < 0)
-		return ret;
-	data->sensor_type = ret;
-
-	return 0;
-}
-
-static int lm95234_update_device(struct lm95234_data *data)
-{
-	struct i2c_client *client = data->client;
-	int ret;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + data->interval) ||
-	    !data->valid) {
-		int i;
-
-		if (!data->valid) {
-			ret = lm95234_fill_cache(data, client);
-			if (ret < 0)
-				goto abort;
-		}
-
-		data->valid = false;
-		for (i = 0; i < ARRAY_SIZE(data->temp); i++) {
-			ret = lm95234_read_temp(client, i, &data->temp[i]);
-			if (ret < 0)
-				goto abort;
-		}
-
-		ret = i2c_smbus_read_byte_data(client, LM95234_REG_STS_FAULT);
-		if (ret < 0)
-			goto abort;
-		data->status = ret;
-
-		ret = i2c_smbus_read_byte_data(client, LM95234_REG_STS_TCRIT1);
-		if (ret < 0)
-			goto abort;
-		data->status |= ret << 8;
-
-		ret = i2c_smbus_read_byte_data(client, LM95234_REG_STS_TCRIT2);
-		if (ret < 0)
-			goto abort;
-		data->status |= ret << 16;
-
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-	ret = 0;
-abort:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
-}
-
 static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
+	int ret, temp;
 
+	ret = lm95234_read_temp(data->regmap, index, &temp);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n",
-		       DIV_ROUND_CLOSEST(data->temp[index] * 125, 32));
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
-	u32 mask = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
+	u8 mask = to_sensor_dev_attr_2(attr)->index;
+	u8 reg = to_sensor_dev_attr_2(attr)->nr;
+	int ret;
+	u32 val;
 
+	ret = regmap_read(data->regmap, reg, &val);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%u", !!(data->status & mask));
+	return sysfs_emit(buf, "%u\n", !!(val & mask));
 }
 
 static ssize_t type_show(struct device *dev, struct device_attribute *attr,
@@ -235,24 +128,23 @@ static ssize_t type_show(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	u8 mask = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
+	u32 val;
+	int ret;
 
+	ret = regmap_read(data->regmap, LM95234_REG_REM_MODEL, &val);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, data->sensor_type & mask ? "1\n" : "2\n");
+	return sysfs_emit(buf, "%s\n", val & mask ? "1" : "2");
 }
 
 static ssize_t type_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
-	unsigned long val;
 	u8 mask = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
-
-	if (ret)
-		return ret;
+	unsigned long val;
+	int ret;
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret < 0)
@@ -261,16 +153,10 @@ static ssize_t type_store(struct device *dev, struct device_attribute *attr,
 	if (val != 1 && val != 2)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	if (val == 1)
-		data->sensor_type |= mask;
-	else
-		data->sensor_type &= ~mask;
-	data->valid = false;
-	i2c_smbus_write_byte_data(data->client, LM95234_REG_REM_MODEL,
-				  data->sensor_type);
-	mutex_unlock(&data->update_lock);
-
+	ret = regmap_update_bits(data->regmap, LM95234_REG_REM_MODEL,
+				 mask, val == 1 ? mask : 0);
+	if (ret)
+		return ret;
 	return count;
 }
 
@@ -279,12 +165,14 @@ static ssize_t tcrit2_show(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
+	int ret;
+	u32 tcrit2;
 
+	ret = regmap_read(data->regmap, LM95234_REG_TCRIT2(index), &tcrit2);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%u", data->tcrit2[index] * 1000);
+	return sysfs_emit(buf, "%u\n", tcrit2 * 1000);
 }
 
 static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
@@ -293,10 +181,7 @@ static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
 	long val;
-	int ret = lm95234_update_device(data);
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = kstrtol(buf, 10, &val);
 	if (ret < 0)
@@ -305,27 +190,38 @@ static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
 	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
 				1000);
 
-	mutex_lock(&data->update_lock);
-	data->tcrit2[index] = val;
-	i2c_smbus_write_byte_data(data->client, LM95234_REG_TCRIT2(index), val);
-	mutex_unlock(&data->update_lock);
-
+	ret = regmap_write(data->regmap, LM95234_REG_TCRIT2(index), val);
+	if (ret)
+		return ret;
 	return count;
 }
 
+static ssize_t tcrit_hyst_show(struct lm95234_data *data, char *buf, int reg)
+{
+	u32 thyst, tcrit;
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = regmap_read(data->regmap, reg, &tcrit);
+	if (ret)
+		goto unlock;
+	ret = regmap_read(data->regmap, LM95234_REG_TCRIT_HYST, &thyst);
+unlock:
+	mutex_unlock(&data->update_lock);
+	if (ret)
+		return ret;
+
+	/* Result can be negative, so be careful with unsigned operands */
+	return sysfs_emit(buf, "%d\n", ((int)tcrit - (int)thyst) * 1000);
+}
+
 static ssize_t tcrit2_hyst_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
 
-	if (ret)
-		return ret;
-
-	/* Result can be negative, so be careful with unsigned operands */
-	return sprintf(buf, "%d",
-		       ((int)data->tcrit2[index] - (int)data->thyst) * 1000);
+	return tcrit_hyst_show(data, buf, LM95234_REG_TCRIT2(index));
 }
 
 static ssize_t tcrit1_show(struct device *dev, struct device_attribute *attr,
@@ -333,8 +229,14 @@ static ssize_t tcrit1_show(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
+	int ret;
+	u32 val;
 
-	return sprintf(buf, "%u", data->tcrit1[index] * 1000);
+	ret = regmap_read(data->regmap, LM95234_REG_TCRIT1(index), &val);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", val * 1000);
 }
 
 static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
@@ -342,11 +244,8 @@ static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
 	long val;
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = kstrtol(buf, 10, &val);
 	if (ret < 0)
@@ -354,10 +253,9 @@ static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
 
 	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
 
-	mutex_lock(&data->update_lock);
-	data->tcrit1[index] = val;
-	i2c_smbus_write_byte_data(data->client, LM95234_REG_TCRIT1(index), val);
-	mutex_unlock(&data->update_lock);
+	ret = regmap_write(data->regmap, LM95234_REG_TCRIT1(index), val);
+	if (ret)
+		return ret;
 
 	return count;
 }
@@ -367,14 +265,8 @@ static ssize_t tcrit1_hyst_show(struct device *dev,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
 
-	if (ret)
-		return ret;
-
-	/* Result can be negative, so be careful with unsigned operands */
-	return sprintf(buf, "%d",
-		       ((int)data->tcrit1[index] - (int)data->thyst) * 1000);
+	return tcrit_hyst_show(data, buf, LM95234_REG_TCRIT1(index));
 }
 
 static ssize_t tcrit1_hyst_store(struct device *dev,
@@ -383,23 +275,28 @@ static ssize_t tcrit1_hyst_store(struct device *dev,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
+	u32 tcrit;
 	long val;
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = kstrtol(buf, 10, &val);
 	if (ret < 0)
 		return ret;
 
-	val = DIV_ROUND_CLOSEST(clamp_val(val, -255000, 255000), 1000);
-	val = clamp_val((int)data->tcrit1[index] - val, 0, 31);
-
 	mutex_lock(&data->update_lock);
-	data->thyst = val;
-	i2c_smbus_write_byte_data(data->client, LM95234_REG_TCRIT_HYST, val);
+
+	ret = regmap_read(data->regmap, LM95234_REG_TCRIT1(index), &tcrit);
+	if (ret)
+		goto unlock;
+
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -255000, 255000), 1000);
+	val = clamp_val((int)tcrit - val, 0, 31);
+
+	ret = regmap_write(data->regmap, LM95234_REG_TCRIT_HYST, val);
+unlock:
 	mutex_unlock(&data->update_lock);
+	if (ret)
+		return ret;
 
 	return count;
 }
@@ -409,12 +306,14 @@ static ssize_t offset_show(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
+	u32 offset;
+	int ret;
 
+	ret = regmap_read(data->regmap, LM95234_REG_OFFSET(index), &offset);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d", data->toffset[index] * 500);
+	return sysfs_emit(buf, "%d\n", sign_extend32(offset, 7) * 500);
 }
 
 static ssize_t offset_store(struct device *dev, struct device_attribute *attr,
@@ -422,11 +321,8 @@ static ssize_t offset_store(struct device *dev, struct device_attribute *attr,
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
-	int ret = lm95234_update_device(data);
 	long val;
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = kstrtol(buf, 10, &val);
 	if (ret < 0)
@@ -435,25 +331,27 @@ static ssize_t offset_store(struct device *dev, struct device_attribute *attr,
 	/* Accuracy is 1/2 degrees C */
 	val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
 
-	mutex_lock(&data->update_lock);
-	data->toffset[index] = val;
-	i2c_smbus_write_byte_data(data->client, LM95234_REG_OFFSET(index), val);
-	mutex_unlock(&data->update_lock);
+	ret = regmap_write(data->regmap, LM95234_REG_OFFSET(index), val);
+	if (ret < 0)
+		return ret;
 
 	return count;
 }
 
+static u16 update_intervals[] = { 143, 364, 1000, 2500 };
+
 static ssize_t update_interval_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
-	int ret = lm95234_update_device(data);
+	u32 convrate;
+	int ret;
 
+	ret = regmap_read(data->regmap, LM95234_REG_CONVRATE, &convrate);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%lu\n",
-		       DIV_ROUND_CLOSEST(data->interval * 1000, HZ));
+	return sysfs_emit(buf, "%u\n", update_intervals[convrate & 0x03]);
 }
 
 static ssize_t update_interval_store(struct device *dev,
@@ -461,23 +359,17 @@ static ssize_t update_interval_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
-	int ret = lm95234_update_device(data);
 	unsigned long val;
-	u8 regval;
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret < 0)
 		return ret;
 
-	regval = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
-
-	mutex_lock(&data->update_lock);
-	data->interval = msecs_to_jiffies(update_intervals[regval]);
-	i2c_smbus_write_byte_data(data->client, LM95234_REG_CONVRATE, regval);
-	mutex_unlock(&data->update_lock);
+	val = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
+	ret = regmap_write(data->regmap, LM95234_REG_CONVRATE, val);
+	if (ret)
+		return ret;
 
 	return count;
 }
@@ -488,10 +380,10 @@ static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
 static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
 static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
 
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, BIT(0) | BIT(1));
-static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, BIT(2) | BIT(3));
-static SENSOR_DEVICE_ATTR_RO(temp4_fault, alarm, BIT(4) | BIT(5));
-static SENSOR_DEVICE_ATTR_RO(temp5_fault, alarm, BIT(6) | BIT(7));
+static SENSOR_DEVICE_ATTR_2_RO(temp2_fault, alarm, LM95234_REG_STS_FAULT, BIT(0) | BIT(1));
+static SENSOR_DEVICE_ATTR_2_RO(temp3_fault, alarm, LM95234_REG_STS_FAULT, BIT(2) | BIT(3));
+static SENSOR_DEVICE_ATTR_2_RO(temp4_fault, alarm, LM95234_REG_STS_FAULT, BIT(4) | BIT(5));
+static SENSOR_DEVICE_ATTR_2_RO(temp5_fault, alarm, LM95234_REG_STS_FAULT, BIT(6) | BIT(7));
 
 static SENSOR_DEVICE_ATTR_RW(temp2_type, type, BIT(1));
 static SENSOR_DEVICE_ATTR_RW(temp3_type, type, BIT(2));
@@ -510,11 +402,11 @@ static SENSOR_DEVICE_ATTR_RO(temp3_max_hyst, tcrit2_hyst, 1);
 static SENSOR_DEVICE_ATTR_RO(temp4_max_hyst, tcrit1_hyst, 3);
 static SENSOR_DEVICE_ATTR_RO(temp5_max_hyst, tcrit1_hyst, 4);
 
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, BIT(0 + 8));
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, BIT(1 + 16));
-static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, alarm, BIT(2 + 16));
-static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, alarm, BIT(3 + 8));
-static SENSOR_DEVICE_ATTR_RO(temp5_max_alarm, alarm, BIT(4 + 8));
+static SENSOR_DEVICE_ATTR_2_RO(temp1_max_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(0));
+static SENSOR_DEVICE_ATTR_2_RO(temp2_max_alarm, alarm, LM95234_REG_STS_TCRIT2, BIT(1));
+static SENSOR_DEVICE_ATTR_2_RO(temp3_max_alarm, alarm, LM95234_REG_STS_TCRIT2, BIT(2));
+static SENSOR_DEVICE_ATTR_2_RO(temp4_max_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(3));
+static SENSOR_DEVICE_ATTR_2_RO(temp5_max_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(4));
 
 static SENSOR_DEVICE_ATTR_RW(temp2_crit, tcrit1, 1);
 static SENSOR_DEVICE_ATTR_RW(temp3_crit, tcrit1, 2);
@@ -522,8 +414,8 @@ static SENSOR_DEVICE_ATTR_RW(temp3_crit, tcrit1, 2);
 static SENSOR_DEVICE_ATTR_RO(temp2_crit_hyst, tcrit1_hyst, 1);
 static SENSOR_DEVICE_ATTR_RO(temp3_crit_hyst, tcrit1_hyst, 2);
 
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, BIT(1 + 8));
-static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, BIT(2 + 8));
+static SENSOR_DEVICE_ATTR_2_RO(temp2_crit_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(1));
+static SENSOR_DEVICE_ATTR_2_RO(temp3_crit_alarm, alarm, LM95234_REG_STS_TCRIT1, BIT(2));
 
 static SENSOR_DEVICE_ATTR_RW(temp2_offset, offset, 0);
 static SENSOR_DEVICE_ATTR_RW(temp3_offset, offset, 1);
@@ -587,6 +479,45 @@ static const struct attribute_group lm95234_group = {
 	.attrs = lm95234_attrs,
 };
 
+static bool lm95234_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LM95234_REG_TEMPH(0) ... LM95234_REG_TEMPH(4):
+	case LM95234_REG_TEMPL(0) ... LM95234_REG_TEMPL(4):
+	case LM95234_REG_UTEMPH(0) ... LM95234_REG_UTEMPH(3):
+	case LM95234_REG_UTEMPL(0) ... LM95234_REG_UTEMPL(3):
+	case LM95234_REG_STS_FAULT:
+	case LM95234_REG_STS_TCRIT1:
+	case LM95234_REG_STS_TCRIT2:
+	case LM95234_REG_REM_MODEL_STS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool lm95234_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LM95234_REG_CONFIG ... LM95234_REG_FILTER:
+	case LM95234_REG_REM_MODEL ... LM95234_REG_OFFSET(3):
+	case LM95234_REG_TCRIT1(0) ... LM95234_REG_TCRIT1(4):
+	case LM95234_REG_TCRIT2(0) ... LM95234_REG_TCRIT2(1):
+	case LM95234_REG_TCRIT_HYST:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config lm95234_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = lm95234_writeable_reg,
+	.volatile_reg = lm95234_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int lm95234_detect(struct i2c_client *client,
 			  struct i2c_board_info *info)
 {
@@ -647,33 +578,30 @@ static int lm95234_detect(struct i2c_client *client,
 	return 0;
 }
 
-static int lm95234_init_client(struct i2c_client *client)
+static int lm95234_init_client(struct device *dev, struct regmap *regmap)
 {
-	int val, model;
+	u32 val, model;
+	int ret;
 
 	/* start conversion if necessary */
-	val = i2c_smbus_read_byte_data(client, LM95234_REG_CONFIG);
-	if (val < 0)
-		return val;
-	if (val & 0x40)
-		i2c_smbus_write_byte_data(client, LM95234_REG_CONFIG,
-					  val & ~0x40);
+	ret = regmap_clear_bits(regmap, LM95234_REG_CONFIG, 0x40);
+	if (ret)
+		return ret;
 
 	/* If diode type status reports an error, try to fix it */
-	val = i2c_smbus_read_byte_data(client, LM95234_REG_REM_MODEL_STS);
-	if (val < 0)
-		return val;
-	model = i2c_smbus_read_byte_data(client, LM95234_REG_REM_MODEL);
-	if (model < 0)
-		return model;
+	ret = regmap_read(regmap, LM95234_REG_REM_MODEL_STS, &val);
+	if (ret < 0)
+		return ret;
+	ret = regmap_read(regmap, LM95234_REG_REM_MODEL, &model);
+	if (ret < 0)
+		return ret;
 	if (model & val) {
-		dev_notice(&client->dev,
+		dev_notice(dev,
 			   "Fixing remote diode type misconfiguration (0x%x)\n",
 			   val);
-		i2c_smbus_write_byte_data(client, LM95234_REG_REM_MODEL,
-					  model & ~val);
+		ret = regmap_write(regmap, LM95234_REG_REM_MODEL, model & ~val);
 	}
-	return 0;
+	return ret;
 }
 
 static int lm95234_probe(struct i2c_client *client)
@@ -682,17 +610,22 @@ static int lm95234_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct lm95234_data *data;
 	struct device *hwmon_dev;
+	struct regmap *regmap;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(struct lm95234_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
+	regmap = devm_regmap_init_i2c(client, &lm95234_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data->regmap = regmap;
 	mutex_init(&data->update_lock);
 
 	/* Initialize the LM95234 chip */
-	err = lm95234_init_client(client);
+	err = lm95234_init_client(dev, regmap);
 	if (err < 0)
 		return err;
 
-- 
2.39.2

