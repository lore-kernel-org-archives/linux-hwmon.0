Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5D2C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243425AbiANQfe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243422AbiANQfc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:32 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324E1C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:32 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id i7-20020a9d68c7000000b0059396529af8so3949643oto.4
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNslqHP4rYbMGaLVAH+7rT36qdkRow7zXw0KfyoMsJk=;
        b=NT+omLGIBdDKzzwDAyEBZwWhXPoD9/Rwc/Y7QCNdSDF2t1U6QCKWwS++GW+6+/8eaW
         Nk52UWsFqjvu8RbfZun2w80nOvO0FttBVBqe9J6oHWD+EjgsvHCDN8R9MfQPN/mhrFOm
         z6EAQmYGNJl9heRA8phFAOiV07D+CmRDOM7vW+Yi8k+3Ar6Tr/Uh8JMg6gdVIi6sRJnj
         aCvoThVNvk1Ww4mK++nja0e2ma9yLrHFDln4ZkxTjFmUeb4TP2b70XKTO8u5j3jxjDsc
         1hXZYUJv3VvJgk7fqLYFBoUQoKKgThMzr1LGDAUc4vJgsnXCq0y9avySLlwM4au4haI0
         Ap2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=XNslqHP4rYbMGaLVAH+7rT36qdkRow7zXw0KfyoMsJk=;
        b=lh+Srzdb0lIamZkQ+BVoyLoyZrzktudZF+wUbO7tBva8SN57suRDuJtc/Ikt2R6/zc
         8tswKgmT5h2LyV2jMWQA8FeKAukvXOnJG5WG6+DZCPnxrsNAz7wfKtpvbFzOUrc16NY7
         eQ6DedmJeX2tlNbN3OTzs9nTtoX8FFYLdcSfPRREqJsRZTFT8h2AeOWRqZb8gvjCM0rw
         Hm013vPi6NN/oCxaaE+/4GVib21aS23IzFfqkZQQqABeHqVPvYycenHW4sk4XrkeeX7p
         RCsIhlZrYNzQZR0Z+Qp7693xIpNKXyQ8AP1akwUrTyucsSx2rIR6/Y6XARM0/So1DhSJ
         GG0Q==
X-Gm-Message-State: AOAM533jBsYNhlHTYTsKn16tLYY42550IfUEiQYHbAaIG0XDxHdc07ua
        vmhhxMj1wh9mpZCWgqswBYs4fsBLlC0=
X-Google-Smtp-Source: ABdhPJz74M5CgvCD2zNfB92HDt6lNd+ew0XOvF40V7tvzb0NZtPASLpjA6jjYE5hv24MjV1o+slK/A==
X-Received: by 2002:a9d:5541:: with SMTP id h1mr7180630oti.115.1642178131234;
        Fri, 14 Jan 2022 08:35:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h6sm1950626ooe.22.2022.01.14.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 8/8] hwmon: (lm83) Convert to use with_info API
Date:   Fri, 14 Jan 2022 08:35:12 -0800
Message-Id: <20220114163512.1094472-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use with_info API to reduce code size and simplify the code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 315 +++++++++++++++++++++++++------------------
 1 file changed, 183 insertions(+), 132 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index d9ee01ca8aed..7047de234ee1 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -18,11 +18,11 @@
  * http://www.national.com/pf/LM/LM82.html
  */
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -71,11 +71,30 @@ static const u8 LM83_REG_TEMP[] = {
 	LM83_REG_R_REMOTE1_TEMP,
 	LM83_REG_R_REMOTE2_TEMP,
 	LM83_REG_R_REMOTE3_TEMP,
+};
+
+static const u8 LM83_REG_MAX[] = {
 	LM83_REG_R_LOCAL_HIGH,
 	LM83_REG_R_REMOTE1_HIGH,
 	LM83_REG_R_REMOTE2_HIGH,
 	LM83_REG_R_REMOTE3_HIGH,
-	LM83_REG_R_TCRIT,
+};
+
+/* alarm and fault registers and bits, indexed by channel */
+static const u8 LM83_ALARM_REG[] = {
+	LM83_REG_R_STATUS1, LM83_REG_R_STATUS2, LM83_REG_R_STATUS1, LM83_REG_R_STATUS2
+};
+
+static const u8 LM83_MAX_ALARM_BIT[] = {
+	BIT(6), BIT(7), BIT(4), BIT(4)
+};
+
+static const u8 LM83_CRIT_ALARM_BIT[] = {
+	BIT(0), BIT(0), BIT(1), BIT(1)
+};
+
+static const u8 LM83_FAULT_BIT[] = {
+	0, BIT(5), BIT(2), BIT(2)
 };
 
 /*
@@ -84,7 +103,7 @@ static const u8 LM83_REG_TEMP[] = {
 
 struct lm83_data {
 	struct regmap *regmap;
-	const struct attribute_group *groups[3];
+	enum chips type;
 };
 
 /* regmap code */
@@ -154,157 +173,197 @@ static const struct regmap_config lm83_regmap_config = {
 	.reg_write = lm83_regmap_reg_write,
 };
 
-/*
- * Sysfs stuff
- */
+/* hwmon API */
 
-static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
+static int lm83_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm83_data *data = dev_get_drvdata(dev);
 	unsigned int regval;
-	int ret;
-
-	ret = regmap_read(data->regmap, LM83_REG_TEMP[attr->index], &regval);
-	if (ret)
-		return ret;
+	int err;
 
-	return sprintf(buf, "%d\n", (s8)regval * 1000);
+	switch (attr) {
+	case hwmon_temp_input:
+		err = regmap_read(data->regmap, LM83_REG_TEMP[channel], &regval);
+		if (err < 0)
+			return err;
+		*val = (s8)regval * 1000;
+		break;
+	case hwmon_temp_max:
+		err = regmap_read(data->regmap, LM83_REG_MAX[channel], &regval);
+		if (err < 0)
+			return err;
+		*val = (s8)regval * 1000;
+		break;
+	case hwmon_temp_crit:
+		err = regmap_read(data->regmap, LM83_REG_R_TCRIT, &regval);
+		if (err < 0)
+			return err;
+		*val = (s8)regval * 1000;
+		break;
+	case hwmon_temp_max_alarm:
+		err = regmap_read(data->regmap, LM83_ALARM_REG[channel], &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & LM83_MAX_ALARM_BIT[channel]);
+		break;
+	case hwmon_temp_crit_alarm:
+		err = regmap_read(data->regmap, LM83_ALARM_REG[channel], &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & LM83_CRIT_ALARM_BIT[channel]);
+		break;
+	case hwmon_temp_fault:
+		err = regmap_read(data->regmap, LM83_ALARM_REG[channel], &regval);
+		if (err < 0)
+			return err;
+		*val = !!(regval & LM83_FAULT_BIT[channel]);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-static ssize_t temp_store(struct device *dev,
-			  struct device_attribute *devattr, const char *buf,
-			  size_t count)
+static int lm83_temp_write(struct device *dev, u32 attr, int channel, long val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm83_data *data = dev_get_drvdata(dev);
 	unsigned int regval;
-	long val;
 	int err;
 
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
 	regval = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
-	err = regmap_write(data->regmap, LM83_REG_TEMP[attr->index], regval);
-	return err ? : count;
+
+	switch (attr) {
+	case hwmon_temp_max:
+		err = regmap_write(data->regmap, LM83_REG_MAX[channel], regval);
+		if (err < 0)
+			return err;
+		break;
+	case hwmon_temp_crit:
+		err = regmap_write(data->regmap, LM83_REG_R_TCRIT, regval);
+		if (err < 0)
+			return err;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
-static ssize_t alarms_show(struct device *dev, struct device_attribute *dummy,
-			   char *buf)
+static int lm83_chip_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct lm83_data *data = dev_get_drvdata(dev);
-	unsigned int alarms, regval;
+	unsigned int regval;
 	int err;
 
-	err = regmap_read(data->regmap, LM83_REG_R_STATUS1, &regval);
-	if (err < 0)
-		return err;
-	alarms = regval;
-	err = regmap_read(data->regmap, LM83_REG_R_STATUS2, &regval);
-	if (err < 0)
-		return err;
-	alarms |= regval << 8;
+	switch (attr) {
+	case hwmon_chip_alarms:
+		err = regmap_read(data->regmap, LM83_REG_R_STATUS1, &regval);
+		if (err < 0)
+			return err;
+		*val = regval;
+		err = regmap_read(data->regmap, LM83_REG_R_STATUS2, &regval);
+		if (err < 0)
+			return err;
+		*val |= regval << 8;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
 
-	return sprintf(buf, "%u\n", alarms);
+	return 0;
 }
 
-static ssize_t alarm_show(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
+static int lm83_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct lm83_data *data = dev_get_drvdata(dev);
-	int bitnr = attr->index;
-	unsigned int alarm;
-	int reg, err;
-
-	if (bitnr < 8) {
-		reg = LM83_REG_R_STATUS1;
-	} else {
-		reg = LM83_REG_R_STATUS2;
-		bitnr -= 8;
+	switch (type) {
+	case hwmon_chip:
+		return lm83_chip_read(dev, attr, channel, val);
+	case hwmon_temp:
+		return lm83_temp_read(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
 	}
-	err = regmap_read(data->regmap, reg, &alarm);
-	if (err < 0)
-		return err;
-	return sprintf(buf, "%d\n", (alarm >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, 4);
-static SENSOR_DEVICE_ATTR_RW(temp2_max, temp, 5);
-static SENSOR_DEVICE_ATTR_RW(temp3_max, temp, 6);
-static SENSOR_DEVICE_ATTR_RW(temp4_max, temp, 7);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp, 8);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit, temp, 8);
-static SENSOR_DEVICE_ATTR_RW(temp3_crit, temp, 8);
-static SENSOR_DEVICE_ATTR_RO(temp4_crit, temp, 8);
-
-/* Individual alarm files */
-static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, alarm, 4);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 8);
-static SENSOR_DEVICE_ATTR_RO(temp4_crit_alarm, alarm, 9);
-static SENSOR_DEVICE_ATTR_RO(temp4_fault, alarm, 10);
-static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, alarm, 12);
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 13);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 15);
-/* Raw alarm file for compatibility */
-static DEVICE_ATTR_RO(alarms);
-
-static struct attribute *lm83_attributes[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit.dev_attr.attr,
-
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-	&dev_attr_alarms.attr,
-	NULL
-};
+static int lm83_write(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_temp:
+		return lm83_temp_write(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
 
-static const struct attribute_group lm83_group = {
-	.attrs = lm83_attributes,
-};
+static umode_t lm83_is_visible(const void *_data, enum hwmon_sensor_types type,
+			       u32 attr, int channel)
+{
+	const struct lm83_data *data = _data;
 
-static struct attribute *lm83_attributes_opt[] = {
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp4_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp4_crit.dev_attr.attr,
-
-	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_crit_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_fault.dev_attr.attr,
-	&sensor_dev_attr_temp4_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
+	/*
+	 * LM82 only supports a single external channel, modeled as channel 2.
+	 */
+	if (data->type == lm82 && (channel == 1 || channel == 3))
+		return 0;
+
+	switch (type) {
+	case hwmon_chip:
+		if (attr == hwmon_chip_alarms)
+			return 0444;
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_max_alarm:
+		case hwmon_temp_crit_alarm:
+			return 0444;
+		case hwmon_temp_fault:
+			if (channel)
+				return 0444;
+			break;
+		case hwmon_temp_max:
+			return 0644;
+		case hwmon_temp_crit:
+			if (channel == 2)
+				return 0644;
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	default:
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *lm83_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT
+			   ),
 	NULL
 };
 
-static const struct attribute_group lm83_group_opt = {
-	.attrs = lm83_attributes_opt,
+static const struct hwmon_ops lm83_hwmon_ops = {
+	.is_visible = lm83_is_visible,
+	.read = lm83_read,
+	.write = lm83_write,
 };
 
-/*
- * Real code
- */
+static const struct hwmon_chip_info lm83_chip_info = {
+	.ops = &lm83_hwmon_ops,
+	.info = lm83_info,
+};
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int lm83_detect(struct i2c_client *client,
@@ -381,18 +440,10 @@ static int lm83_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	/*
-	 * Register sysfs hooks
-	 * The LM82 can only monitor one external diode which is
-	 * at the same register as the LM83 temp3 entry - so we
-	 * declare 1 and 3 common, and then 2 and 4 only for the LM83.
-	 */
-	data->groups[0] = &lm83_group;
-	if (i2c_match_id(lm83_id, client)->driver_data == lm83)
-		data->groups[1] = &lm83_group_opt;
+	data->type = i2c_match_id(lm83_id, client)->driver_data;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   data, data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &lm83_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.33.0

