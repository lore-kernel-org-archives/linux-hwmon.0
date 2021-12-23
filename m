Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E655DC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Dec 2021 20:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350270AbhLWUwa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Dec 2021 15:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhLWUw3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Dec 2021 15:52:29 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72917C061401
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:29 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id v22-20020a9d4e96000000b005799790cf0bso8391942otk.5
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Dec 2021 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yo7PS8I+YlbAL/1kKjiD27nk4OgxGbplSKp+x/ILbiw=;
        b=ALyGsGUkvwDuI3S5qUkTABhg9kvvY5xEoadi9YOLzViMNNI1iJTozeXLQX+HyS8D5D
         KoWI2eqi9n1mfnNxTxkglKrWiUFdBrPjOUceTuaHPEg68qPu6B3w4RfV8Thxm2oDX4f0
         q/tma90QnlszSNk8VVeeneLAAeqk5uFMwtRAEJbK88gRxljp/HTM5F9HIGTJtOhVevzJ
         +DiZblUYOtZQqnNCuDwQlrvTo09NbjFrcb7g4LuBVEqvxMaxp6/K9heRwoJDzoiJzTZb
         Ztm5V0jIMCSEYJoT6Nxrm8iU1O801yp4RJi5N09ejYz8U0TBid6Rf8Xh5lNB/vnx8d9I
         +deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yo7PS8I+YlbAL/1kKjiD27nk4OgxGbplSKp+x/ILbiw=;
        b=gWyjJhYl/zKDtGOoFjckWbR7nb03tDPzfB95R5+WC05OQRRV7Gmd8Hg4gz3dBPSmIy
         tVtEZQ18cmuO1Bad5xRssvZch9vGKCF2bMZeuwljVAZG7I7kLsYARov4W4LVHjR3ySfQ
         sPCjR3c3aeRV1O7tPckHcKgTc7LYJfDnfhu8BXEsZAKmwD2QFH9VfbcHD9oel7/2PsUM
         n1rhO42UxX3Ks3uEcZxzDZzg097F32lQcSqECsMjASSB9+rJvTNpjxeWIZ7Am3ISOieZ
         tWNmpBa+2D825Nc1m/cBgSNLH94wrP6F9Mo89EqdaDEejuO652M95Ce7POmjg5DvNulA
         ++vg==
X-Gm-Message-State: AOAM530oCwD7MRs6mdNuU4oV1XRNsAk0Rglq0eWzQWjY3H574eXuofzY
        aC7w2EtFv/bQs8vUSsDLkPxEobr/QI0=
X-Google-Smtp-Source: ABdhPJzsZiuLlbWW2wUzvR/2JFe0prPm5EGHIJGqhlv4lCDbGAEA5BZpUZ2RgzKlTejARaSmAec9CQ==
X-Received: by 2002:a05:6830:25d6:: with SMTP id d22mr2624432otu.87.1640292748168;
        Thu, 23 Dec 2021 12:52:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w13sm898623oic.24.2021.12.23.12.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 12:52:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Cosmin Tanislav <demonsingur@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 3/6] hwmon: (adt7x10) Use devm_hwmon_device_register_with_info
Date:   Thu, 23 Dec 2021 12:52:16 -0800
Message-Id: <20211223205219.2184104-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
References: <20211223205219.2184104-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Cosmin Tanislav <cosmin.tanislav@analog.com>

Describe the only available channel, implement read, write
and is_visible callbacks.
Also, pass name to core driver for the i2c device so that
it can be used to register hwmon device.

Signed-off-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
Link: https://lore.kernel.org/r/20211221215841.2641417-4-demonsingur@gmail.com
[groeck: Adjusted to use regmap]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7410.c |   2 +-
 drivers/hwmon/adt7x10.c | 249 ++++++++++++++++++++--------------------
 2 files changed, 125 insertions(+), 126 deletions(-)

diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index b1f4497dca05..81950a079c2f 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -84,7 +84,7 @@ static int adt7410_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return adt7x10_probe(&client->dev, NULL, client->irq, regmap);
+	return adt7x10_probe(&client->dev, client->name, client->irq, regmap);
 }
 
 static int adt7410_i2c_remove(struct i2c_client *client)
diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index 47ce1a88a03f..9482fd8fff41 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -8,12 +8,12 @@
  * and adt7410.c from iio-staging by Sonic Zhang <sonic.zhang@analog.com>
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/delay.h>
@@ -55,19 +55,24 @@
 /* Each client has this additional data */
 struct adt7x10_data {
 	struct regmap		*regmap;
-	const char		*name;
-	struct device		*hwmon_dev;
 	struct mutex		update_lock;
 	u8			config;
 	u8			oldconfig;
 	bool			valid;		/* true if temperature valid */
 };
 
-static const u8 ADT7X10_REG_TEMP[4] = {
-	ADT7X10_TEMPERATURE,		/* input */
-	ADT7X10_T_ALARM_HIGH,		/* high */
-	ADT7X10_T_ALARM_LOW,		/* low */
-	ADT7X10_T_CRIT,			/* critical */
+enum {
+	adt7x10_temperature = 0,
+	adt7x10_t_alarm_high,
+	adt7x10_t_alarm_low,
+	adt7x10_t_crit,
+};
+
+static const u8 ADT7X10_REG_TEMP[] = {
+	[adt7x10_temperature] = ADT7X10_TEMPERATURE,		/* input */
+	[adt7x10_t_alarm_high] = ADT7X10_T_ALARM_HIGH,		/* high */
+	[adt7x10_t_alarm_low] = ADT7X10_T_ALARM_LOW,		/* low */
+	[adt7x10_t_crit] = ADT7X10_T_CRIT,			/* critical */
 };
 
 static irqreturn_t adt7x10_irq_handler(int irq, void *private)
@@ -127,18 +132,13 @@ static int ADT7X10_REG_TO_TEMP(struct adt7x10_data *data, s16 reg)
 
 /*-----------------------------------------------------------------------*/
 
-/* sysfs attributes for hwmon */
-
-static ssize_t adt7x10_temp_show(struct device *dev,
-				 struct device_attribute *da, char *buf)
+static int adt7x10_temp_read(struct adt7x10_data *data, int index, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct adt7x10_data *data = dev_get_drvdata(dev);
-	unsigned int val;
+	unsigned int regval;
 	int ret;
 
 	mutex_lock(&data->update_lock);
-	if (attr->index == 0 && !data->valid) {
+	if (index == adt7x10_temperature && !data->valid) {
 		/* wait for valid temperature */
 		ret = adt7x10_temp_ready(data->regmap);
 		if (ret) {
@@ -149,40 +149,27 @@ static ssize_t adt7x10_temp_show(struct device *dev,
 	}
 	mutex_unlock(&data->update_lock);
 
-	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[attr->index], &val);
+	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[index], &regval);
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data, val));
+	*val = ADT7X10_REG_TO_TEMP(data, regval);
+	return 0;
 }
 
-static ssize_t adt7x10_temp_store(struct device *dev,
-				  struct device_attribute *da,
-				  const char *buf, size_t count)
+static int adt7x10_temp_write(struct adt7x10_data *data, int index, long temp)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct adt7x10_data *data = dev_get_drvdata(dev);
-	int nr = attr->index;
-	long temp;
 	int ret;
 
-	ret = kstrtol(buf, 10, &temp);
-	if (ret)
-		return ret;
-
 	mutex_lock(&data->update_lock);
-	ret = regmap_write(data->regmap, ADT7X10_REG_TEMP[nr],
+	ret = regmap_write(data->regmap, ADT7X10_REG_TEMP[index],
 			   ADT7X10_TEMP_TO_REG(temp));
 	mutex_unlock(&data->update_lock);
-	return ret ? : count;
+	return ret;
 }
 
-static ssize_t adt7x10_t_hyst_show(struct device *dev,
-				   struct device_attribute *da, char *buf)
+static int adt7x10_hyst_read(struct adt7x10_data *data, int index, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct adt7x10_data *data = dev_get_drvdata(dev);
-	int nr = attr->index;
 	int hyst, temp, ret;
 
 	mutex_lock(&data->update_lock);
@@ -192,7 +179,7 @@ static ssize_t adt7x10_t_hyst_show(struct device *dev,
 		return ret;
 	}
 
-	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[nr], &temp);
+	ret = regmap_read(data->regmap, ADT7X10_REG_TEMP[index], &temp);
 	mutex_unlock(&data->update_lock);
 	if (ret)
 		return ret;
@@ -203,24 +190,18 @@ static ssize_t adt7x10_t_hyst_show(struct device *dev,
 	 * hysteresis is stored as a 4 bit offset in the device, convert it
 	 * to an absolute value
 	 */
-	if (nr == 2)	/* min has positive offset, others have negative */
+	/* min has positive offset, others have negative */
+	if (index == adt7x10_t_alarm_low)
 		hyst = -hyst;
 
-	return sprintf(buf, "%d\n", ADT7X10_REG_TO_TEMP(data, temp) - hyst);
+	*val = ADT7X10_REG_TO_TEMP(data, temp) - hyst;
+	return 0;
 }
 
-static ssize_t adt7x10_t_hyst_store(struct device *dev,
-				    struct device_attribute *da,
-				    const char *buf, size_t count)
+static int adt7x10_hyst_write(struct adt7x10_data *data, long hyst)
 {
-	struct adt7x10_data *data = dev_get_drvdata(dev);
 	unsigned int regval;
 	int limit, ret;
-	long hyst;
-
-	ret = kstrtol(buf, 10, &hyst);
-	if (ret)
-		return ret;
 
 	mutex_lock(&data->update_lock);
 
@@ -237,14 +218,11 @@ static ssize_t adt7x10_t_hyst_store(struct device *dev,
 	ret = regmap_write(data->regmap, ADT7X10_T_HYST, regval);
 abort:
 	mutex_unlock(&data->update_lock);
-	return ret ? : count;
+	return ret;
 }
 
-static ssize_t adt7x10_alarm_show(struct device *dev,
-				  struct device_attribute *da, char *buf)
+static int adt7x10_alarm_read(struct adt7x10_data *data, int index, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct adt7x10_data *data = dev_get_drvdata(dev);
 	unsigned int status;
 	int ret;
 
@@ -252,48 +230,102 @@ static ssize_t adt7x10_alarm_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%d\n", !!(status & attr->index));
+	*val = !!(status & index);
+
+	return 0;
 }
 
-static ssize_t name_show(struct device *dev, struct device_attribute *da,
-			 char *buf)
+static umode_t adt7x10_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_temp_max:
+	case hwmon_temp_min:
+	case hwmon_temp_crit:
+	case hwmon_temp_max_hyst:
+		return 0644;
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+	case hwmon_temp_min_hyst:
+	case hwmon_temp_crit_hyst:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int adt7x10_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
 	struct adt7x10_data *data = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", data->name);
+	switch (attr) {
+	case hwmon_temp_input:
+		return adt7x10_temp_read(data, adt7x10_temperature, val);
+	case hwmon_temp_max:
+		return adt7x10_temp_read(data, adt7x10_t_alarm_high, val);
+	case hwmon_temp_min:
+		return adt7x10_temp_read(data, adt7x10_t_alarm_low, val);
+	case hwmon_temp_crit:
+		return adt7x10_temp_read(data, adt7x10_t_crit, val);
+	case hwmon_temp_max_hyst:
+		return adt7x10_hyst_read(data, adt7x10_t_alarm_high, val);
+	case hwmon_temp_min_hyst:
+		return adt7x10_hyst_read(data, adt7x10_t_alarm_low, val);
+	case hwmon_temp_crit_hyst:
+		return adt7x10_hyst_read(data, adt7x10_t_crit, val);
+	case hwmon_temp_min_alarm:
+		return adt7x10_alarm_read(data, ADT7X10_STAT_T_LOW, val);
+	case hwmon_temp_max_alarm:
+		return adt7x10_alarm_read(data, ADT7X10_STAT_T_HIGH, val);
+	case hwmon_temp_crit_alarm:
+		return adt7x10_alarm_read(data, ADT7X10_STAT_T_CRIT, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, adt7x10_temp, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, adt7x10_temp, 1);
-static SENSOR_DEVICE_ATTR_RW(temp1_min, adt7x10_temp, 2);
-static SENSOR_DEVICE_ATTR_RW(temp1_crit, adt7x10_temp, 3);
-static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, adt7x10_t_hyst, 1);
-static SENSOR_DEVICE_ATTR_RO(temp1_min_hyst, adt7x10_t_hyst, 2);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_hyst, adt7x10_t_hyst, 3);
-static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, adt7x10_alarm,
-			     ADT7X10_STAT_T_LOW);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, adt7x10_alarm,
-			     ADT7X10_STAT_T_HIGH);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, adt7x10_alarm,
-			     ADT7X10_STAT_T_CRIT);
-static DEVICE_ATTR_RO(name);
-
-static struct attribute *adt7x10_attributes[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	NULL
+static int adt7x10_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	struct adt7x10_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_temp_max:
+		return adt7x10_temp_write(data, adt7x10_t_alarm_high, val);
+	case hwmon_temp_min:
+		return adt7x10_temp_write(data, adt7x10_t_alarm_low, val);
+	case hwmon_temp_crit:
+		return adt7x10_temp_write(data, adt7x10_t_crit, val);
+	case hwmon_temp_max_hyst:
+		return adt7x10_hyst_write(data, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info *adt7x10_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST | HWMON_T_MIN_HYST |
+			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM),
+	NULL,
+};
+
+static const struct hwmon_ops adt7x10_hwmon_ops = {
+	.is_visible = adt7x10_is_visible,
+	.read = adt7x10_read,
+	.write = adt7x10_write,
 };
 
-static const struct attribute_group adt7x10_group = {
-	.attrs = adt7x10_attributes,
+static const struct hwmon_chip_info adt7x10_chip_info = {
+	.ops = &adt7x10_hwmon_ops,
+	.info = adt7x10_info,
 };
 
 static void adt7x10_restore_config(void *private)
@@ -308,6 +340,7 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 {
 	struct adt7x10_data *data;
 	unsigned int config;
+	struct device *hdev;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -315,7 +348,6 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 		return -ENOMEM;
 
 	data->regmap = regmap;
-	data->name = name;
 
 	dev_set_drvdata(dev, data);
 	mutex_init(&data->update_lock);
@@ -346,60 +378,27 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 	}
 	dev_dbg(dev, "Config %02x\n", data->config);
 
-	/* Register sysfs hooks */
-	ret = sysfs_create_group(&dev->kobj, &adt7x10_group);
-	if (ret)
-		return ret;
-
-	/*
-	 * The I2C device will already have it's own 'name' attribute, but for
-	 * the SPI device we need to register it. name will only be non NULL if
-	 * the device doesn't register the 'name' attribute on its own.
-	 */
-	if (name) {
-		ret = device_create_file(dev, &dev_attr_name);
-		if (ret)
-			goto exit_remove;
-	}
-
-	data->hwmon_dev = hwmon_device_register(dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		ret = PTR_ERR(data->hwmon_dev);
-		goto exit_remove_name;
-	}
+	hdev = devm_hwmon_device_register_with_info(dev, name, data,
+						    &adt7x10_chip_info, NULL);
+	if (IS_ERR(hdev))
+		return PTR_ERR(hdev);
 
 	if (irq > 0) {
 		ret = request_threaded_irq(irq, NULL, adt7x10_irq_handler,
 				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				dev_name(dev), dev);
 		if (ret)
-			goto exit_hwmon_device_unregister;
+			return ret;
 	}
 
 	return 0;
-
-exit_hwmon_device_unregister:
-	hwmon_device_unregister(data->hwmon_dev);
-exit_remove_name:
-	if (name)
-		device_remove_file(dev, &dev_attr_name);
-exit_remove:
-	sysfs_remove_group(&dev->kobj, &adt7x10_group);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(adt7x10_probe);
 
 void adt7x10_remove(struct device *dev, int irq)
 {
-	struct adt7x10_data *data = dev_get_drvdata(dev);
-
 	if (irq > 0)
 		free_irq(irq, dev);
-
-	hwmon_device_unregister(data->hwmon_dev);
-	if (data->name)
-		device_remove_file(dev, &dev_attr_name);
-	sysfs_remove_group(&dev->kobj, &adt7x10_group);
 }
 EXPORT_SYMBOL_GPL(adt7x10_remove);
 
-- 
2.33.0

