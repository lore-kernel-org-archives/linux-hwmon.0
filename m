Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1811A6177
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523773; cv=none; b=cl/ZgoBV/TGGxrALSc12lKyZdYdFz3ctByL0SEBb9fFmEoLaXC1/dwWp6fBg6ZYFfmBKVVkMSC3+mmJ5404h61wlVvFf1kY1VfnB6+V+WshEKYWc0KlUzweSWFUGz0VKbDsLcadQO4v1JmlcTtVKlEpnX4cXfC+UvsHunMjrB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523773; c=relaxed/simple;
	bh=hEU4t3zpJFqT+gHtfdmiDePTKORzXQ44Jt5Q2vY9Ci4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YDNIowSnQ6dEs6zGGzp5tOaqONcL7VWbIkxOV6/N9M7rqBpaJKTtfK3cjx7MDtPsyGR9/AgD3Fck+gXcAeOo+5kjErh6iJRZ36c8Wk6k5l3Nl3xVRX8TH87e8pFK4YCYVIH9zh/b5LAOB+LDwWcyAFADXRsnFQglCyWmtBiGNnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8nE0lVM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8nE0lVM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7104f939aaaso1676921b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523770; x=1723128570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zv0TrArq45XgZYbIuFpB/lId/LqjjjZ2YXVdYkvEPdw=;
        b=L8nE0lVMj+hITZ1eFYQ8zrTvwwdG8vkPdkXiwad73cw7Il6MTcFxU9Q+K/x6pQLsc6
         wJ+8l9byPiUrYDPgBe2JKpjiYGTz0PAu8P12z1ive2BU6JJlTSBwclm5dH48ijEYPTMg
         ne9rtOt/vjEGT9QREXnbP0kGI01JgCqLfFvduCU3ZBDi3RdhRGsoJk+r891SAeCOFWXV
         Gbsbc+RQQgAhd1ShVeoxuk9NJbDoLObmv2vT5HQH0ashfpZEILjWfxZF67QYaN8Zvf6b
         9hF7JyMlMU9AQ/hunWVQRBwWuzJIf3HG6JQpb4oUDXEuIIYMlHRdd89Jp57hdVymzfez
         5XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523770; x=1723128570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zv0TrArq45XgZYbIuFpB/lId/LqjjjZ2YXVdYkvEPdw=;
        b=WbabTvZ9zJczIcAxyPZZnF5kgCMCGNMt41joMNnydL7cwuHkgS4RN7lEryaSwkZCak
         gV5TL8Ssk9fxaVM9n2gDuR2KMfCXJBy6wI0CiIdM5MIpdQqpnR2zW+YFknmNM3nLlRRQ
         mn30QzstdFTbqoaz0mq7yDmzJf4zaZ9q2EUSEZR7+cSj1P44aR5/kXoWRhtoBDXnkJiC
         xUivfwnM8M2Qu6Dzvcq7Lo+MWbwdbskcE4y08j1vyc1ZN+awPkD+4+nczJVO22wYlTF2
         gum9WVx4go8Lq+Pzocr/lZWC4xjV1N9ReNiruZ5y7I5WpvUZBAOiWUANC3D8JEANabUA
         Grtw==
X-Gm-Message-State: AOJu0Yw+jIcMuMTxDsKJXQttI0sOe5zHfCvbIlfHoCiU05NnbhOXkpHb
	2gIPzwl8cGMAh1KZeYHzh7oq+/7FrpYKXIf0Lg6N0VE3IMj2PUIP2U3d0A==
X-Google-Smtp-Source: AGHT+IGlicqg5A9vtrePSmoA/l7BssapU3fOMqpSfyVBTdDkBSfLrWCtyJLVnOu+AQKxTz1LwD8PTA==
X-Received: by 2002:a05:6a20:12c1:b0:1bd:260e:be97 with SMTP id adf61e73a8af0-1c69966bad5mr542105637.53.1722523770140;
        Thu, 01 Aug 2024 07:49:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72b89csm11935057b3a.94.2024.08.01.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (lm92) Convert to use regmap
Date: Thu,  1 Aug 2024 07:49:16 -0700
Message-Id: <20240801144918.6156-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801144918.6156-1-linux@roeck-us.net>
References: <20240801144918.6156-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use regmap for local caching and for multi-byte operations to be able
to use regmap API functions and to reduce the need for locking in the
driver.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig |   1 +
 drivers/hwmon/lm92.c  | 204 +++++++++++++++++++++++++++---------------
 2 files changed, 131 insertions(+), 74 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b60fe2e58ad6..b2ace4857130 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1511,6 +1511,7 @@ config SENSORS_LM90
 config SENSORS_LM92
 	tristate "National Semiconductor LM92 and compatibles"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for National Semiconductor LM92
 	  and Maxim MAX6635 sensor chips.
diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index 5ff45a0033f1..89befc7f59a5 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -32,9 +32,9 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 /*
@@ -81,65 +81,40 @@ enum temp_index {
 	t_crit,
 	t_min,
 	t_max,
-	t_hyst,
 	t_num_regs
 };
 
-static const u8 regs[t_num_regs] = {
+static const u8 lm92_regs[t_num_regs] = {
 	[t_input] = LM92_REG_TEMP,
 	[t_crit] = LM92_REG_TEMP_CRIT,
 	[t_min] = LM92_REG_TEMP_LOW,
 	[t_max] = LM92_REG_TEMP_HIGH,
-	[t_hyst] = LM92_REG_TEMP_HYST,
 };
 
 /* Client data (each client gets its own) */
 struct lm92_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	struct mutex update_lock;
 	int resolution;
-	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
-
-	/* registers values */
-	s16 temp[t_num_regs];	/* index with enum temp_index */
 };
 
 /*
  * Sysfs attributes and callback functions
  */
 
-static struct lm92_data *lm92_update_device(struct device *dev)
-{
-	struct lm92_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int i;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ) ||
-	    !data->valid) {
-		dev_dbg(&client->dev, "Updating lm92 data\n");
-		for (i = 0; i < t_num_regs; i++) {
-			data->temp[i] =
-				i2c_smbus_read_word_swapped(client, regs[i]);
-		}
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-
-	mutex_unlock(&data->update_lock);
-
-	return data;
-}
-
 static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm92_data *data = lm92_update_device(dev);
+	struct lm92_data *data = dev_get_drvdata(dev);
+	u32 temp;
+	int err;
 
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
+	err = regmap_read(data->regmap, lm92_regs[attr->index], &temp);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(temp));
 }
 
 static ssize_t temp_store(struct device *dev,
@@ -148,7 +123,7 @@ static ssize_t temp_store(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm92_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
+	struct regmap *regmap = data->regmap;
 	int nr = attr->index;
 	long val;
 	int err;
@@ -157,10 +132,9 @@ static ssize_t temp_store(struct device *dev,
 	if (err)
 		return err;
 
-	mutex_lock(&data->update_lock);
-	data->temp[nr] = TEMP_TO_REG(val, data->resolution);
-	i2c_smbus_write_word_swapped(client, regs[nr], data->temp[nr]);
-	mutex_unlock(&data->update_lock);
+	err = regmap_write(regmap, lm92_regs[nr], TEMP_TO_REG(val, data->resolution));
+	if (err)
+		return err;
 	return count;
 }
 
@@ -168,28 +142,42 @@ static ssize_t temp_hyst_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm92_data *data = lm92_update_device(dev);
+	u32 regs[2] = { lm92_regs[attr->index], LM92_REG_TEMP_HYST };
+	struct lm92_data *data = dev_get_drvdata(dev);
+	u16 regvals[2];
+	int err;
 
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index])
-		       - TEMP_FROM_REG(data->temp[t_hyst]));
+	err = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n",
+		       TEMP_FROM_REG(regvals[0]) - TEMP_FROM_REG(regvals[1]));
 }
 
 static ssize_t temp1_min_hyst_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
-	struct lm92_data *data = lm92_update_device(dev);
+	static u32 regs[2] = { LM92_REG_TEMP_LOW, LM92_REG_TEMP_HYST };
+	struct lm92_data *data = dev_get_drvdata(dev);
+	u16 regvals[2];
+	int err;
 
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[t_min])
-		       + TEMP_FROM_REG(data->temp[t_hyst]));
+	err = regmap_multi_reg_read(data->regmap, regs, regvals, 2);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n",
+		       TEMP_FROM_REG(regvals[0]) + TEMP_FROM_REG(regvals[1]));
 }
 
 static ssize_t temp_hyst_store(struct device *dev,
 			       struct device_attribute *devattr,
 			       const char *buf, size_t count)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm92_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
+	struct regmap *regmap = data->regmap;
+	u32 temp;
 	long val;
 	int err;
 
@@ -199,29 +187,45 @@ static ssize_t temp_hyst_store(struct device *dev,
 
 	val = clamp_val(val, -120000, 220000);
 	mutex_lock(&data->update_lock);
-	data->temp[t_hyst] =
-		TEMP_TO_REG(TEMP_FROM_REG(data->temp[attr->index]) - val,
-			    data->resolution);
-	i2c_smbus_write_word_swapped(client, LM92_REG_TEMP_HYST,
-				     data->temp[t_hyst]);
+	err = regmap_read(regmap, LM92_REG_TEMP_CRIT, &temp);
+	if (err)
+		goto unlock;
+	val = TEMP_TO_REG(TEMP_FROM_REG(temp) - val, data->resolution);
+	err = regmap_write(regmap, LM92_REG_TEMP_HYST, val);
+unlock:
 	mutex_unlock(&data->update_lock);
+	if (err)
+		return err;
 	return count;
 }
 
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	struct lm92_data *data = lm92_update_device(dev);
+	struct lm92_data *data = dev_get_drvdata(dev);
+	u32 temp;
+	int err;
 
-	return sprintf(buf, "%d\n", ALARMS_FROM_REG(data->temp[t_input]));
+	err = regmap_read(data->regmap, LM92_REG_TEMP, &temp);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n", ALARMS_FROM_REG(temp));
 }
 
 static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	struct lm92_data *data = dev_get_drvdata(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
-	struct lm92_data *data = lm92_update_device(dev);
-	return sprintf(buf, "%d\n", (data->temp[t_input] >> bitnr) & 1);
+	u32 temp;
+	int err;
+
+	err = regmap_read(data->regmap, LM92_REG_TEMP, &temp);
+	if (err)
+		return err;
+
+	return sprintf(buf, "%d\n", (temp >> bitnr) & 1);
 }
 
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input);
@@ -240,15 +244,9 @@ static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
  * Detection and registration
  */
 
-static void lm92_init_client(struct i2c_client *client)
+static int lm92_init_client(struct regmap *regmap)
 {
-	u8 config;
-
-	/* Start the conversions if needed */
-	config = i2c_smbus_read_byte_data(client, LM92_REG_CONFIG);
-	if (config & 0x01)
-		i2c_smbus_write_byte_data(client, LM92_REG_CONFIG,
-					  config & 0xFE);
+	return regmap_clear_bits(regmap, LM92_REG_CONFIG, 0x01);
 }
 
 static struct attribute *lm92_attrs[] = {
@@ -300,25 +298,83 @@ static int lm92_detect(struct i2c_client *new_client,
 	return 0;
 }
 
-static int lm92_probe(struct i2c_client *new_client)
+/* regmap */
+
+static int lm92_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
+	int ret;
+
+	if (reg == LM92_REG_CONFIG)
+		ret = i2c_smbus_read_byte_data(context, reg);
+	else
+		ret = i2c_smbus_read_word_swapped(context, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+	return 0;
+}
+
+static int lm92_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	if (reg == LM92_REG_CONFIG)
+		return i2c_smbus_write_byte_data(context, LM92_REG_CONFIG, val);
+
+	return i2c_smbus_write_word_swapped(context, reg, val);
+}
+
+static bool lm92_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	return reg == LM92_REG_TEMP;
+}
+
+static bool lm92_regmap_is_writeable(struct device *dev, unsigned int reg)
+{
+	return reg >= LM92_REG_CONFIG;
+}
+
+static const struct regmap_config lm92_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = LM92_REG_TEMP_HIGH,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = lm92_regmap_is_volatile,
+	.writeable_reg = lm92_regmap_is_writeable,
+};
+
+static const struct regmap_bus lm92_regmap_bus = {
+	.reg_write = lm92_reg_write,
+	.reg_read = lm92_reg_read,
+};
+
+static int lm92_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm92_data *data;
+	struct regmap *regmap;
+	int err;
 
-	data = devm_kzalloc(&new_client->dev, sizeof(struct lm92_data),
-			    GFP_KERNEL);
+	regmap = devm_regmap_init(dev, &lm92_regmap_bus, client,
+				  &lm92_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data = devm_kzalloc(dev, sizeof(struct lm92_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = new_client;
-	data->resolution = (unsigned long)i2c_get_match_data(new_client);
+	data->regmap = regmap;
+	data->resolution = (unsigned long)i2c_get_match_data(client);
 	mutex_init(&data->update_lock);
 
 	/* Initialize the chipset */
-	lm92_init_client(new_client);
+	err = lm92_init_client(regmap);
+	if (err)
+		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(&new_client->dev,
-							   new_client->name,
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
+							   client->name,
 							   data, lm92_groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.39.2

