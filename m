Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236D4C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D490E2077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6Kw7ORY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfDWNd2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:28 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46520 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNd2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:28 -0400
Received: by mail-pg1-f193.google.com with SMTP id v2so5204038pge.13
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Uq962SE9DlRCWxG3UvCH/7+kxAGwY6qQCB0UflcgdKE=;
        b=i6Kw7ORYp2KNxK0+dqjRXgPvIBWJpVk0LOMi7rLCBq759jdoT89CpURL/NtdlSn6Yv
         2bRJR4+OzF7L4FnIpRFGlRSpFEyYQf7sbSYFE5RgyVqXiSJE49la0qXzlt/CmkOXZ0pE
         2rCMRYOVOKSMyRvxRDM7H4rcqprQbhMWZUkDsMeeNFqxznUPmlIj0eR8MBJkjtmL4lCK
         /RJTyucslJfO+xZCgS1BC0yDRxCVcBLa7iCOBekugPhdUfuU/yeqQMaV2BdJl9SWLKdC
         okzw4KWoJhRNXnnSrDayLPy8cflOG59wiMfYs25mkG415z6DYZ8JjgpPJ9vFUqgFmI31
         quWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Uq962SE9DlRCWxG3UvCH/7+kxAGwY6qQCB0UflcgdKE=;
        b=EYHpGxHgj2Ddll8nAibnZp/lYE3x2TVlYDt6RVAAIdYVK3/KrisjjgYulxiXaGXKvz
         Yiov9NBa6KFkGrWuSeZhuHqbibnly81ZGHgdvuDHWB7BEKYTzqAm/iu202t/3te9f/g7
         QCWHvy0gO22yb4aHrVS9Ya/TJMv34JogTWIrdFpFUo7kZ8RkZdPXVxZTCgdf+co/1Nfs
         vyp/1mn3twEX2DWJE3rqkX/3WLtc9IDmcqZ6EtUpb/XDcezvyAKDI7q8khlOTKiQv/+2
         VZcvIfODXkjGhjorfq/f1gN7R/LS3cKyQYmDDxHJJ8lq278U5c9AeesDxLPfFtB37wlM
         EGuA==
X-Gm-Message-State: APjAAAXEhjb0RwlrrSYJ1L0hrZuBHrlUelDyxsQl2680yoHpz8J6HyqX
        jWLI1iu32p4uGwzW9dPxmo98TJYm
X-Google-Smtp-Source: APXvYqwxqPREoVkDiIkmyFlkyTKIdVLkd3X4Z1V3T6pbYFlO1f8NK8tOmDt0sIMZSXwgnufy2RvyNw==
X-Received: by 2002:a65:5089:: with SMTP id r9mr24540668pgp.14.1556026407125;
        Tue, 23 Apr 2019 06:33:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x6sm39745996pfb.171.2019.04.23.06.33.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:26 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 07/11] hwmon: (max6650) Convert to use devm_hwmon_device_register_with_info
Date:   Tue, 23 Apr 2019 06:33:07 -0700
Message-Id: <1556026391-15360-7-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert driver to use devm_hwmon_device_register_with_info to simplify
the code and to reduce its size.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 505 +++++++++++++++++++++++-------------------------
 1 file changed, 244 insertions(+), 261 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index c02694d70eee..301184172ab1 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -114,7 +114,6 @@ module_param(clock, int, 0444);
 
 struct max6650_data {
 	struct i2c_client *client;
-	const struct attribute_group *groups[3];
 	struct thermal_cooling_device *cooling_dev;
 	struct mutex update_lock;
 	int nr_fans;
@@ -230,26 +229,6 @@ static int max6650_set_operating_mode(struct max6650_data *data, u8 mode)
 	return 0;
 }
 
-static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
-			char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max6650_data *data = max6650_update_device(dev);
-	int rpm;
-
-	/*
-	 * Calculation details:
-	 *
-	 * Each tachometer counts over an interval given by the "count"
-	 * register (0.25, 0.5, 1 or 2 seconds). This module assumes
-	 * that the fans produce two pulses per revolution (this seems
-	 * to be the most common).
-	 */
-
-	rpm = ((data->tach[attr->index] * 120) / DIV_FROM_REG(data->count));
-	return sprintf(buf, "%d\n", rpm);
-}
-
 /*
  * Set the fan speed to the specified RPM (or read back the RPM setting).
  * This works in closed loop mode only. Use pwm1 for open loop speed setting.
@@ -291,26 +270,6 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
  * controlled.
  */
 
-static ssize_t fan1_target_show(struct device *dev,
-				struct device_attribute *devattr, char *buf)
-{
-	struct max6650_data *data = max6650_update_device(dev);
-	int kscale, ktach, rpm;
-
-	/*
-	 * Use the datasheet equation:
-	 *
-	 *    FanSpeed = KSCALE x fCLK / [256 x (KTACH + 1)]
-	 *
-	 * then multiply by 60 to give rpm.
-	 */
-
-	kscale = DIV_FROM_REG(data->config);
-	ktach = data->speed;
-	rpm = 60 * kscale * clock / (256 * (ktach + 1));
-	return sprintf(buf, "%d\n", rpm);
-}
-
 static int max6650_set_target(struct max6650_data *data, unsigned long rpm)
 {
 	int kscale, ktach;
@@ -339,183 +298,8 @@ static int max6650_set_target(struct max6650_data *data, unsigned long rpm)
 					 data->speed);
 }
 
-static ssize_t fan1_target_store(struct device *dev,
-				 struct device_attribute *devattr,
-				 const char *buf, size_t count)
-{
-	struct max6650_data *data = dev_get_drvdata(dev);
-	unsigned long rpm;
-	int err;
-
-	err = kstrtoul(buf, 10, &rpm);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-
-	err = max6650_set_target(data, rpm);
-
-	mutex_unlock(&data->update_lock);
-
-	if (err < 0)
-		return err;
-
-	return count;
-}
-
-/*
- * Get/set the fan speed in open loop mode using pwm1 sysfs file.
- * Speed is given as a relative value from 0 to 255, where 255 is maximum
- * speed. Note that this is done by writing directly to the chip's DAC,
- * it won't change the closed loop speed set by fan1_target.
- * Also note that due to rounding errors it is possible that you don't read
- * back exactly the value you have set.
- */
-
-static ssize_t pwm1_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	struct max6650_data *data = max6650_update_device(dev);
-
-	return sprintf(buf, "%d\n", dac_to_pwm(data->dac,
-					       data->config & MAX6650_CFG_V12));
-}
-
-static ssize_t pwm1_store(struct device *dev,
-			  struct device_attribute *devattr, const char *buf,
-			  size_t count)
-{
-	struct max6650_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long pwm;
-	int err;
-	u8 dac;
-
-	err = kstrtoul(buf, 10, &pwm);
-	if (err)
-		return err;
-
-	pwm = clamp_val(pwm, 0, 255);
-
-	mutex_lock(&data->update_lock);
-	dac = pwm_to_dac(pwm, data->config & MAX6650_CFG_V12);
-	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, dac);
-	if (!err)
-		data->dac = dac;
-	mutex_unlock(&data->update_lock);
-
-	return err < 0 ? err : count;
-}
-
-/*
- * Get/Set controller mode:
- * Possible values:
- * 0 = Fan always on
- * 1 = Open loop, Voltage is set according to speed, not regulated.
- * 2 = Closed loop, RPM for all fans regulated by fan1 tachometer
- * 3 = Fan off
- */
-static ssize_t pwm1_enable_show(struct device *dev,
-				struct device_attribute *devattr, char *buf)
-{
-	struct max6650_data *data = max6650_update_device(dev);
-	int mode = (data->config & MAX6650_CFG_MODE_MASK) >> 4;
-	int sysfs_modes[4] = {0, 3, 2, 1};
-
-	return sprintf(buf, "%d\n", sysfs_modes[mode]);
-}
-
-static ssize_t pwm1_enable_store(struct device *dev,
-				 struct device_attribute *devattr,
-				 const char *buf, size_t count)
-{
-	struct max6650_data *data = dev_get_drvdata(dev);
-	unsigned long mode;
-	int err;
-	const u8 max6650_modes[] = {
-		MAX6650_CFG_MODE_ON,
-		MAX6650_CFG_MODE_OPEN_LOOP,
-		MAX6650_CFG_MODE_CLOSED_LOOP,
-		MAX6650_CFG_MODE_OFF,
-		};
-
-	err = kstrtoul(buf, 10, &mode);
-	if (err)
-		return err;
-
-	if (mode >= ARRAY_SIZE(max6650_modes))
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-
-	max6650_set_operating_mode(data, max6650_modes[mode]);
-
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
-/*
- * Read/write functions for fan1_div sysfs file. The MAX6650 has no such
- * divider. We handle this by converting between divider and counttime:
- *
- * (counttime == k) <==> (divider == 2^k), k = 0, 1, 2, or 3
- *
- * Lower values of k allow to connect a faster fan without the risk of
- * counter overflow. The price is lower resolution. You can also set counttime
- * using the module parameter. Note that the module parameter "prescaler" also
- * influences the behaviour. Unfortunately, there's no sysfs attribute
- * defined for that. See the data sheet for details.
- */
-
-static ssize_t fan1_div_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	struct max6650_data *data = max6650_update_device(dev);
-
-	return sprintf(buf, "%d\n", DIV_FROM_REG(data->count));
-}
-
-static ssize_t fan1_div_store(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
-{
-	struct max6650_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long div;
-	int err;
-
-	err = kstrtoul(buf, 10, &div);
-	if (err)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	switch (div) {
-	case 1:
-		data->count = 0;
-		break;
-	case 2:
-		data->count = 1;
-		break;
-	case 4:
-		data->count = 2;
-		break;
-	case 8:
-		data->count = 3;
-		break;
-	default:
-		mutex_unlock(&data->update_lock);
-		return -EINVAL;
-	}
-
-	i2c_smbus_write_byte_data(client, MAX6650_REG_COUNT, data->count);
-	mutex_unlock(&data->update_lock);
-
-	return count;
-}
-
 /*
- * Get alarm stati:
+ * Get gpio alarm status:
  * Possible values:
  * 0 = no alarm
  * 1 = alarm
@@ -538,17 +322,6 @@ static ssize_t alarm_show(struct device *dev,
 	return sprintf(buf, "%d\n", alarm);
 }
 
-static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
-static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
-static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
-static DEVICE_ATTR_RW(fan1_target);
-static DEVICE_ATTR_RW(fan1_div);
-static DEVICE_ATTR_RW(pwm1_enable);
-static DEVICE_ATTR_RW(pwm1);
-static SENSOR_DEVICE_ATTR_RO(fan1_max_alarm, alarm, MAX6650_ALRM_MAX);
-static SENSOR_DEVICE_ATTR_RO(fan1_min_alarm, alarm, MAX6650_ALRM_MIN);
-static SENSOR_DEVICE_ATTR_RO(fan1_fault, alarm, MAX6650_ALRM_TACH);
 static SENSOR_DEVICE_ATTR_RO(gpio1_alarm, alarm, MAX6650_ALRM_GPIO1);
 static SENSOR_DEVICE_ATTR_RO(gpio2_alarm, alarm, MAX6650_ALRM_GPIO2);
 
@@ -564,11 +337,8 @@ static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 	 */
 
 	devattr = container_of(a, struct device_attribute, attr);
-	if (devattr == &sensor_dev_attr_fan1_max_alarm.dev_attr
-	 || devattr == &sensor_dev_attr_fan1_min_alarm.dev_attr
-	 || devattr == &sensor_dev_attr_fan1_fault.dev_attr
-	 || devattr == &sensor_dev_attr_gpio1_alarm.dev_attr
-	 || devattr == &sensor_dev_attr_gpio2_alarm.dev_attr) {
+	if (devattr == &sensor_dev_attr_gpio1_alarm.dev_attr ||
+	    devattr == &sensor_dev_attr_gpio2_alarm.dev_attr) {
 		if (!(data->alarm_en & to_sensor_dev_attr(devattr)->index))
 			return 0;
 	}
@@ -577,14 +347,6 @@ static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 }
 
 static struct attribute *max6650_attrs[] = {
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&dev_attr_fan1_target.attr,
-	&dev_attr_fan1_div.attr,
-	&dev_attr_pwm1_enable.attr,
-	&dev_attr_pwm1.attr,
-	&sensor_dev_attr_fan1_max_alarm.dev_attr.attr,
-	&sensor_dev_attr_fan1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_fan1_fault.dev_attr.attr,
 	&sensor_dev_attr_gpio1_alarm.dev_attr.attr,
 	&sensor_dev_attr_gpio2_alarm.dev_attr.attr,
 	NULL
@@ -595,21 +357,11 @@ static const struct attribute_group max6650_group = {
 	.is_visible = max6650_attrs_visible,
 };
 
-static struct attribute *max6651_attrs[] = {
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan3_input.dev_attr.attr,
-	&sensor_dev_attr_fan4_input.dev_attr.attr,
+static const struct attribute_group *max6650_groups[] = {
+	&max6650_group,
 	NULL
 };
 
-static const struct attribute_group max6651_group = {
-	.attrs = max6651_attrs,
-};
-
-/*
- * Real code
- */
-
 static int max6650_init_client(struct max6650_data *data,
 			       struct i2c_client *client)
 {
@@ -766,6 +518,241 @@ static void max6650_thermal_unregister(void *data)
 }
 #endif
 
+static int max6650_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct max6650_data *data = max6650_update_device(dev);
+	int mode;
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			*val = dac_to_pwm(data->dac,
+					  data->config & MAX6650_CFG_V12);
+			break;
+		case hwmon_pwm_enable:
+			/*
+			 * Possible values:
+			 * 0 = Fan always on
+			 * 1 = Open loop, Voltage is set according to speed,
+			 *     not regulated.
+			 * 2 = Closed loop, RPM for all fans regulated by fan1
+			 *     tachometer
+			 * 3 = Fan off
+			 */
+			mode = (data->config & MAX6650_CFG_MODE_MASK) >> 4;
+			*val = (4 - mode) & 3; /* {0 1 2 3} -> {0 3 2 1} */
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			/*
+			 * Calculation details:
+			 *
+			 * Each tachometer counts over an interval given by the
+			 * "count" register (0.25, 0.5, 1 or 2 seconds).
+			 * The driver assumes that the fans produce two pulses
+			 * per revolution (this seems to be the most common).
+			 */
+			*val = DIV_ROUND_CLOSEST(data->tach[channel] * 120,
+						 DIV_FROM_REG(data->count));
+			break;
+		case hwmon_fan_div:
+			*val = DIV_FROM_REG(data->count);
+			break;
+		case hwmon_fan_target:
+			/*
+			 * Use the datasheet equation:
+			 *    FanSpeed = KSCALE x fCLK / [256 x (KTACH + 1)]
+			 * then multiply by 60 to give rpm.
+			 */
+			*val = 60 * DIV_FROM_REG(data->config) * clock /
+				(256 * (data->speed + 1));
+			break;
+		case hwmon_fan_min_alarm:
+			*val = !!(data->alarm & MAX6650_ALRM_MIN);
+			data->alarm &= ~MAX6650_ALRM_MIN;
+			data->valid = false;
+			break;
+		case hwmon_fan_max_alarm:
+			*val = !!(data->alarm & MAX6650_ALRM_MAX);
+			data->alarm &= ~MAX6650_ALRM_MAX;
+			data->valid = false;
+			break;
+		case hwmon_fan_fault:
+			*val = !!(data->alarm & MAX6650_ALRM_TACH);
+			data->alarm &= ~MAX6650_ALRM_TACH;
+			data->valid = false;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+const u8 max6650_pwm_modes[] = {
+	MAX6650_CFG_MODE_ON,
+	MAX6650_CFG_MODE_OPEN_LOOP,
+	MAX6650_CFG_MODE_CLOSED_LOOP,
+	MAX6650_CFG_MODE_OFF,
+};
+
+static int max6650_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	struct max6650_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+	u8 reg;
+
+	mutex_lock(&data->update_lock);
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			reg = pwm_to_dac(clamp_val(val, 0, 255),
+					 data->config & MAX6650_CFG_V12);
+			ret = i2c_smbus_write_byte_data(data->client,
+							MAX6650_REG_DAC, reg);
+			if (ret)
+				break;
+			data->dac = reg;
+			break;
+		case hwmon_pwm_enable:
+			if (val < 0 || val >= ARRAY_SIZE(max6650_pwm_modes))
+				return -EINVAL;
+			ret = max6650_set_operating_mode(data,
+						max6650_pwm_modes[val]);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_div:
+			switch (val) {
+			case 1:
+				reg = 0;
+				break;
+			case 2:
+				reg = 1;
+				break;
+			case 4:
+				reg = 2;
+				break;
+			case 8:
+				reg = 3;
+				break;
+			default:
+				ret = -EINVAL;
+				goto error;
+			}
+			ret = i2c_smbus_write_byte_data(data->client,
+							MAX6650_REG_COUNT, reg);
+			if (ret)
+				break;
+			data->count = reg;
+			break;
+		case hwmon_fan_target:
+			if (val < 0) {
+				ret = -EINVAL;
+				break;
+			}
+			ret = max6650_set_target(data, val);
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+error:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static umode_t max6650_is_visible(const void *_data,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel)
+{
+	const struct max6650_data *data = _data;
+
+	if (channel && (channel >= data->nr_fans || type != hwmon_fan))
+		return 0;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_target:
+		case hwmon_fan_div:
+			return 0644;
+		case hwmon_fan_min_alarm:
+			if (data->alarm_en & MAX6650_ALRM_MIN)
+				return 0444;
+			break;
+		case hwmon_fan_max_alarm:
+			if (data->alarm_en & MAX6650_ALRM_MAX)
+				return 0444;
+			break;
+		case hwmon_fan_fault:
+			if (data->alarm_en & MAX6650_ALRM_TACH)
+				return 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+		case hwmon_pwm_enable:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *max6650_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
+			   HWMON_F_MIN_ALARM | HWMON_F_MAX_ALARM |
+			   HWMON_F_FAULT,
+			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	NULL
+};
+
+static const struct hwmon_ops max6650_hwmon_ops = {
+	.read = max6650_read,
+	.write = max6650_write,
+	.is_visible = max6650_is_visible,
+};
+
+static const struct hwmon_chip_info max6650_chip_info = {
+	.ops = &max6650_hwmon_ops,
+	.info = max6650_info,
+};
+
 static int max6650_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -792,14 +779,10 @@ static int max6650_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	data->groups[0] = &max6650_group;
-	/* 3 additional fan inputs for the MAX6651 */
-	if (data->nr_fans == 4)
-		data->groups[1] = &max6651_group;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-							   client->name, data,
-							   data->groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+							 client->name, data,
+							 &max6650_chip_info,
+							 max6650_groups);
 	err = PTR_ERR_OR_ZERO(hwmon_dev);
 	if (err)
 		return err;
-- 
2.7.4

