Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA9FC433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 04:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0199961930
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 04:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhCVEXf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Mar 2021 00:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCVEXV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Mar 2021 00:23:21 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8624C061574
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Mar 2021 21:23:20 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l79so11744839oib.1
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Mar 2021 21:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=wh8YJTtY/cm1y4BgC9XgPO//ye4c+MJBBJqwjtyWeLM=;
        b=RP01C5gniFVEzMlKfW4w0u10zmO1Yp6H1IBqTTVoh9LKkINLR8jh9bak2UbIoQuRF+
         C+8VnpnZC1/EYB9BEvRvbJOo0ChLD49WWE+Z6Srj7KxFuG6KZuHXXws3HTtfww/o51Df
         npbfJ/NpD6ZezQVKElunHCCYly1SxxczX+QqtGYWA5oZM0R/kqrvAXe0C5dlyUi9waSF
         usmPgx6kLj5hAVl4FV42/l5hGrrlJ7qsbEHZpFblTq2iTgRAwX58qwQoyJ9wYJwEeyNc
         L6TigUkzAOtdG4CseKItoeSbrqDsYmNIs07qr9QgqIq1Enk9y4ptw414GiZwMMoPyZmx
         1GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=wh8YJTtY/cm1y4BgC9XgPO//ye4c+MJBBJqwjtyWeLM=;
        b=DAc3ooplxp7JgF4rkUgQFTZ8DhD4781MzoPx7CO+2KNiEu7/QQ1t+VjpEnuzRi3EAI
         ZU8bS97D3EvAogqEe/aEa5JG2YYyqbPEbSEj/OoN0YMx85r4Em8KjNmksR3NZGkNlNsn
         t6lZiZUZ3maN3ar3Ac1nuvCqJ6YeqEEJcqkzTDly0WDNDObbL0lISxqTV2PaUGyd1pSv
         e7uGG67IV0PNgHQk6n0EZUsIKJjmHOGE5grYKgjWRhOWW21IshI+nPOw1uXgiTy9PBgK
         0EMw1F+x2NwpvLDFon8me8OoA9rSYxGs0dowsquOrOTbMrMHD81UI8z8RomBZVvY87Pk
         arTA==
X-Gm-Message-State: AOAM5337jby0kTak9YPH1p8q5nNxIHXMjXCHM4f5gNOYhgX/dGQOKErU
        tIAsTQjLvN3mjB6XiXT3Khp9xrVhK9M=
X-Google-Smtp-Source: ABdhPJyIY2nCR79BuAxKXupbngu20zihbUaRCG2TT4BsmKygF2ve6gmJyxgGGCoFskg+yMZfIVIJeQ==
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr8859336oie.170.1616386998723;
        Sun, 21 Mar 2021 21:23:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x19sm2806478oor.45.2021.03.21.21.23.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 21:23:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Zihao Tang <tangzihao1@hisilicon.com>,
        Jay Fang <f.fangjian@huawei.com>
Subject: [PATCH] hwmon: replace snprintf in show functions with sysfs_emit
Date:   Sun, 21 Mar 2021 21:23:15 -0700
Message-Id: <20210322042315.150261-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

coccicheck complains about the use of snprintf() in sysfs
show functions.

drivers/hwmon/ina3221.c:701:8-16: WARNING: use scnprintf or sprintf

This results in a large number of patch submissions. Fix it all in
one go using the following coccinelle rules. Use sysfs_emit instead
of scnprintf or sprintf since that makes more sense.

@depends on patch@
identifier show, dev, attr, buf;
@@

ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
{
	<...
  return
-		snprintf(buf, \( PAGE_SIZE \| PAGE_SIZE - 1 \),
+		sysfs_emit(buf,
		...);
	...>
}

@depends on patch@
identifier show, dev, attr, buf, rc;
@@

ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
{
	<...
  rc =
-		snprintf(buf, \( PAGE_SIZE \| PAGE_SIZE - 1 \),
+		sysfs_emit(buf,
		...);
	...>
}

While at it, remove unnecessary braces and as well as unnecessary
else after return statements to address checkpatch warnings in the
resulting patch.

Cc: Zihao Tang <tangzihao1@hisilicon.com>
Cc: Jay Fang <f.fangjian@huawei.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/applesmc.c           | 34 +++++++--------
 drivers/hwmon/ina209.c             |  6 +--
 drivers/hwmon/ina2xx.c             |  2 +-
 drivers/hwmon/ina3221.c            |  2 +-
 drivers/hwmon/lineage-pem.c        |  8 ++--
 drivers/hwmon/ltc2945.c            |  4 +-
 drivers/hwmon/ltc2990.c            |  2 +-
 drivers/hwmon/ltc4151.c            |  2 +-
 drivers/hwmon/ltc4215.c            |  8 ++--
 drivers/hwmon/ltc4222.c            |  4 +-
 drivers/hwmon/ltc4260.c            |  4 +-
 drivers/hwmon/ltc4261.c            |  4 +-
 drivers/hwmon/max16065.c           | 14 +++---
 drivers/hwmon/occ/common.c         | 69 +++++++++++++++---------------
 drivers/hwmon/occ/sysfs.c          |  4 +-
 drivers/hwmon/pmbus/inspur-ipsps.c | 28 ++++++------
 drivers/hwmon/pmbus/pmbus_core.c   |  8 ++--
 drivers/hwmon/s3c-hwmon.c          |  4 +-
 drivers/hwmon/sch5627.c            | 24 +++++------
 drivers/hwmon/sch5636.c            | 20 ++++-----
 drivers/hwmon/smm665.c             |  4 +-
 drivers/hwmon/stts751.c            | 20 ++++-----
 drivers/hwmon/vexpress-hwmon.c     | 12 +++---
 drivers/hwmon/xgene-hwmon.c        | 14 +++---
 24 files changed, 151 insertions(+), 150 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 28b137eedf2e..c31759794a29 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -741,7 +741,7 @@ static void applesmc_idev_poll(struct input_dev *idev)
 static ssize_t applesmc_name_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "applesmc\n");
+	return sysfs_emit(buf, "applesmc\n");
 }
 
 static ssize_t applesmc_position_show(struct device *dev,
@@ -763,8 +763,8 @@ static ssize_t applesmc_position_show(struct device *dev,
 out:
 	if (ret)
 		return ret;
-	else
-		return snprintf(buf, PAGE_SIZE, "(%d,%d,%d)\n", x, y, z);
+
+	return sysfs_emit(buf, "(%d,%d,%d)\n", x, y, z);
 }
 
 static ssize_t applesmc_light_show(struct device *dev,
@@ -804,8 +804,8 @@ static ssize_t applesmc_light_show(struct device *dev,
 out:
 	if (ret)
 		return ret;
-	else
-		return snprintf(sysfsbuf, PAGE_SIZE, "(%d,%d)\n", left, right);
+
+	return sysfs_emit(sysfsbuf, "(%d,%d)\n", left, right);
 }
 
 /* Displays sensor key as label */
@@ -814,7 +814,7 @@ static ssize_t applesmc_show_sensor_label(struct device *dev,
 {
 	const char *key = smcreg.index[to_index(devattr)];
 
-	return snprintf(sysfsbuf, PAGE_SIZE, "%s\n", key);
+	return sysfs_emit(sysfsbuf, "%s\n", key);
 }
 
 /* Displays degree Celsius * 1000 */
@@ -832,7 +832,7 @@ static ssize_t applesmc_show_temperature(struct device *dev,
 
 	temp = 250 * (value >> 6);
 
-	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(sysfsbuf, "%d\n", temp);
 }
 
 static ssize_t applesmc_show_fan_speed(struct device *dev,
@@ -851,7 +851,7 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 		return ret;
 
 	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
-	return snprintf(sysfsbuf, PAGE_SIZE, "%u\n", speed);
+	return sysfs_emit(sysfsbuf, "%u\n", speed);
 }
 
 static ssize_t applesmc_store_fan_speed(struct device *dev,
@@ -891,7 +891,7 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
 		return ret;
 
 	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
-	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", manual);
+	return sysfs_emit(sysfsbuf, "%d\n", manual);
 }
 
 static ssize_t applesmc_store_fan_manual(struct device *dev,
@@ -943,14 +943,14 @@ static ssize_t applesmc_show_fan_position(struct device *dev,
 
 	if (ret)
 		return ret;
-	else
-		return snprintf(sysfsbuf, PAGE_SIZE, "%s\n", buffer+4);
+
+	return sysfs_emit(sysfsbuf, "%s\n", buffer + 4);
 }
 
 static ssize_t applesmc_calibrate_show(struct device *dev,
 				struct device_attribute *attr, char *sysfsbuf)
 {
-	return snprintf(sysfsbuf, PAGE_SIZE, "(%d,%d)\n", rest_x, rest_y);
+	return sysfs_emit(sysfsbuf, "(%d,%d)\n", rest_x, rest_y);
 }
 
 static ssize_t applesmc_calibrate_store(struct device *dev,
@@ -992,7 +992,7 @@ static ssize_t applesmc_key_count_show(struct device *dev,
 
 	count = ((u32)buffer[0]<<24) + ((u32)buffer[1]<<16) +
 						((u32)buffer[2]<<8) + buffer[3];
-	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", count);
+	return sysfs_emit(sysfsbuf, "%d\n", count);
 }
 
 static ssize_t applesmc_key_at_index_read_show(struct device *dev,
@@ -1020,7 +1020,7 @@ static ssize_t applesmc_key_at_index_data_length_show(struct device *dev,
 	if (IS_ERR(entry))
 		return PTR_ERR(entry);
 
-	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", entry->len);
+	return sysfs_emit(sysfsbuf, "%d\n", entry->len);
 }
 
 static ssize_t applesmc_key_at_index_type_show(struct device *dev,
@@ -1032,7 +1032,7 @@ static ssize_t applesmc_key_at_index_type_show(struct device *dev,
 	if (IS_ERR(entry))
 		return PTR_ERR(entry);
 
-	return snprintf(sysfsbuf, PAGE_SIZE, "%s\n", entry->type);
+	return sysfs_emit(sysfsbuf, "%s\n", entry->type);
 }
 
 static ssize_t applesmc_key_at_index_name_show(struct device *dev,
@@ -1044,13 +1044,13 @@ static ssize_t applesmc_key_at_index_name_show(struct device *dev,
 	if (IS_ERR(entry))
 		return PTR_ERR(entry);
 
-	return snprintf(sysfsbuf, PAGE_SIZE, "%s\n", entry->key);
+	return sysfs_emit(sysfsbuf, "%s\n", entry->key);
 }
 
 static ssize_t applesmc_key_at_index_show(struct device *dev,
 				struct device_attribute *attr, char *sysfsbuf)
 {
-	return snprintf(sysfsbuf, PAGE_SIZE, "%d\n", key_at_index);
+	return sysfs_emit(sysfsbuf, "%d\n", key_at_index);
 }
 
 static ssize_t applesmc_key_at_index_store(struct device *dev,
diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index f4c7b5f76359..fc3007c3e85c 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -259,7 +259,7 @@ static ssize_t ina209_interval_show(struct device *dev,
 {
 	struct ina209_data *data = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", data->update_interval);
+	return sysfs_emit(buf, "%d\n", data->update_interval);
 }
 
 /*
@@ -343,7 +343,7 @@ static ssize_t ina209_value_show(struct device *dev,
 		return PTR_ERR(data);
 
 	val = ina209_from_reg(attr->index, data->regs[attr->index]);
-	return snprintf(buf, PAGE_SIZE, "%ld\n", val);
+	return sysfs_emit(buf, "%ld\n", val);
 }
 
 static ssize_t ina209_alarm_show(struct device *dev,
@@ -363,7 +363,7 @@ static ssize_t ina209_alarm_show(struct device *dev,
 	 * All alarms are in the INA209_STATUS register. To avoid a long
 	 * switch statement, the mask is passed in attr->index
 	 */
-	return snprintf(buf, PAGE_SIZE, "%u\n", !!(status & mask));
+	return sysfs_emit(buf, "%u\n", !!(status & mask));
 }
 
 /* Shunt voltage, history, limits, alarms */
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 8acb2db58c68..00fc70305a89 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -385,7 +385,7 @@ static ssize_t ina226_alert_show(struct device *dev,
 		val = ina226_reg_to_alert(data, attr->index, regval);
 	}
 
-	ret = snprintf(buf, PAGE_SIZE, "%d\n", val);
+	ret = sysfs_emit(buf, "%d\n", val);
 abort:
 	mutex_unlock(&data->config_lock);
 	return ret;
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index d80bd3efcd6d..c602583d19f3 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -698,7 +698,7 @@ static ssize_t ina3221_shunt_show(struct device *dev,
 	unsigned int channel = sd_attr->index;
 	struct ina3221_input *input = &ina->inputs[channel];
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
+	return sysfs_emit(buf, "%d\n", input->shunt_resistor);
 }
 
 static ssize_t ina3221_shunt_store(struct device *dev,
diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index c83eb2fd80eb..1109fffa76fb 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -280,7 +280,7 @@ static ssize_t pem_bool_show(struct device *dev, struct device_attribute *da,
 		return PTR_ERR(data);
 
 	status = data->data_string[attr->nr] & attr->index;
-	return snprintf(buf, PAGE_SIZE, "%d\n", !!status);
+	return sysfs_emit(buf, "%d\n", !!status);
 }
 
 static ssize_t pem_data_show(struct device *dev, struct device_attribute *da,
@@ -296,7 +296,7 @@ static ssize_t pem_data_show(struct device *dev, struct device_attribute *da,
 	value = pem_get_data(data->data_string, sizeof(data->data_string),
 			     attr->index);
 
-	return snprintf(buf, PAGE_SIZE, "%ld\n", value);
+	return sysfs_emit(buf, "%ld\n", value);
 }
 
 static ssize_t pem_input_show(struct device *dev, struct device_attribute *da,
@@ -312,7 +312,7 @@ static ssize_t pem_input_show(struct device *dev, struct device_attribute *da,
 	value = pem_get_input(data->input_string, sizeof(data->input_string),
 			      attr->index);
 
-	return snprintf(buf, PAGE_SIZE, "%ld\n", value);
+	return sysfs_emit(buf, "%ld\n", value);
 }
 
 static ssize_t pem_fan_show(struct device *dev, struct device_attribute *da,
@@ -328,7 +328,7 @@ static ssize_t pem_fan_show(struct device *dev, struct device_attribute *da,
 	value = pem_get_fan(data->fan_speed, sizeof(data->fan_speed),
 			    attr->index);
 
-	return snprintf(buf, PAGE_SIZE, "%ld\n", value);
+	return sysfs_emit(buf, "%ld\n", value);
 }
 
 /* Voltages */
diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index ba9c868a8641..9adebb59f604 100644
--- a/drivers/hwmon/ltc2945.c
+++ b/drivers/hwmon/ltc2945.c
@@ -226,7 +226,7 @@ static ssize_t ltc2945_value_show(struct device *dev,
 	value = ltc2945_reg_to_val(dev, attr->index);
 	if (value < 0)
 		return value;
-	return snprintf(buf, PAGE_SIZE, "%lld\n", value);
+	return sysfs_emit(buf, "%lld\n", value);
 }
 
 static ssize_t ltc2945_value_store(struct device *dev,
@@ -333,7 +333,7 @@ static ssize_t ltc2945_bool_show(struct device *dev,
 	if (fault)		/* Clear reported faults in chip register */
 		regmap_update_bits(regmap, LTC2945_FAULT, attr->index, 0);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", !!fault);
+	return sysfs_emit(buf, "%d\n", !!fault);
 }
 
 /* Input voltages */
diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index fcd31c4fc15e..689f788b8563 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -147,7 +147,7 @@ static ssize_t ltc2990_value_show(struct device *dev,
 	if (unlikely(ret < 0))
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static umode_t ltc2990_attrs_visible(struct kobject *kobj,
diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index 321f54e237bd..13b85367a21f 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -128,7 +128,7 @@ static ssize_t ltc4151_value_show(struct device *dev,
 		return PTR_ERR(data);
 
 	value = ltc4151_get_value(data, attr->index);
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 /*
diff --git a/drivers/hwmon/ltc4215.c b/drivers/hwmon/ltc4215.c
index 7cef3cb2962b..1d18c212054f 100644
--- a/drivers/hwmon/ltc4215.c
+++ b/drivers/hwmon/ltc4215.c
@@ -139,7 +139,7 @@ static ssize_t ltc4215_voltage_show(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	const int voltage = ltc4215_get_voltage(dev, attr->index);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", voltage);
+	return sysfs_emit(buf, "%d\n", voltage);
 }
 
 static ssize_t ltc4215_current_show(struct device *dev,
@@ -147,7 +147,7 @@ static ssize_t ltc4215_current_show(struct device *dev,
 {
 	const unsigned int curr = ltc4215_get_current(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", curr);
+	return sysfs_emit(buf, "%u\n", curr);
 }
 
 static ssize_t ltc4215_power_show(struct device *dev,
@@ -159,7 +159,7 @@ static ssize_t ltc4215_power_show(struct device *dev,
 	/* current in mA * voltage in mV == power in uW */
 	const unsigned int power = abs(output_voltage * curr);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", power);
+	return sysfs_emit(buf, "%u\n", power);
 }
 
 static ssize_t ltc4215_alarm_show(struct device *dev,
@@ -170,7 +170,7 @@ static ssize_t ltc4215_alarm_show(struct device *dev,
 	const u8 reg = data->regs[LTC4215_STATUS];
 	const u32 mask = attr->index;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", !!(reg & mask));
+	return sysfs_emit(buf, "%u\n", !!(reg & mask));
 }
 
 /*
diff --git a/drivers/hwmon/ltc4222.c b/drivers/hwmon/ltc4222.c
index 3efce6d1cb88..d2027ca5c925 100644
--- a/drivers/hwmon/ltc4222.c
+++ b/drivers/hwmon/ltc4222.c
@@ -94,7 +94,7 @@ static ssize_t ltc4222_value_show(struct device *dev,
 	value = ltc4222_get_value(dev, attr->index);
 	if (value < 0)
 		return value;
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t ltc4222_bool_show(struct device *dev,
@@ -112,7 +112,7 @@ static ssize_t ltc4222_bool_show(struct device *dev,
 	if (fault)		/* Clear reported faults in chip register */
 		regmap_update_bits(regmap, attr->nr, attr->index, 0);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", !!fault);
+	return sysfs_emit(buf, "%d\n", !!fault);
 }
 
 /* Voltages */
diff --git a/drivers/hwmon/ltc4260.c b/drivers/hwmon/ltc4260.c
index d0beb43abf3f..75e89cec381e 100644
--- a/drivers/hwmon/ltc4260.c
+++ b/drivers/hwmon/ltc4260.c
@@ -79,7 +79,7 @@ static ssize_t ltc4260_value_show(struct device *dev,
 	value = ltc4260_get_value(dev, attr->index);
 	if (value < 0)
 		return value;
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t ltc4260_bool_show(struct device *dev,
@@ -98,7 +98,7 @@ static ssize_t ltc4260_bool_show(struct device *dev,
 	if (fault)		/* Clear reported faults in chip register */
 		regmap_update_bits(regmap, LTC4260_FAULT, attr->index, 0);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", !!fault);
+	return sysfs_emit(buf, "%d\n", !!fault);
 }
 
 /* Voltages */
diff --git a/drivers/hwmon/ltc4261.c b/drivers/hwmon/ltc4261.c
index 1dab84b52df5..b81e9c3d297b 100644
--- a/drivers/hwmon/ltc4261.c
+++ b/drivers/hwmon/ltc4261.c
@@ -130,7 +130,7 @@ static ssize_t ltc4261_value_show(struct device *dev,
 		return PTR_ERR(data);
 
 	value = ltc4261_get_value(data, attr->index);
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t ltc4261_bool_show(struct device *dev,
@@ -147,7 +147,7 @@ static ssize_t ltc4261_bool_show(struct device *dev,
 	if (fault)		/* Clear reported faults in chip register */
 		i2c_smbus_write_byte_data(data->client, LTC4261_FAULT, ~fault);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", fault ? 1 : 0);
+	return sysfs_emit(buf, "%d\n", fault ? 1 : 0);
 }
 
 /*
diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 0de2da3e5c46..ae3a6a7bdaa2 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -187,7 +187,7 @@ static ssize_t max16065_alarm_show(struct device *dev,
 		i2c_smbus_write_byte_data(data->client,
 					  MAX16065_FAULT(attr2->nr), val);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", !!val);
+	return sysfs_emit(buf, "%d\n", !!val);
 }
 
 static ssize_t max16065_input_show(struct device *dev,
@@ -200,8 +200,8 @@ static ssize_t max16065_input_show(struct device *dev,
 	if (unlikely(adc < 0))
 		return adc;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			ADC_TO_MV(adc, data->range[attr->index]));
+	return sysfs_emit(buf, "%d\n",
+			  ADC_TO_MV(adc, data->range[attr->index]));
 }
 
 static ssize_t max16065_current_show(struct device *dev,
@@ -212,8 +212,8 @@ static ssize_t max16065_current_show(struct device *dev,
 	if (unlikely(data->curr_sense < 0))
 		return data->curr_sense;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			ADC_TO_CURR(data->curr_sense, data->curr_gain));
+	return sysfs_emit(buf, "%d\n",
+			  ADC_TO_CURR(data->curr_sense, data->curr_gain));
 }
 
 static ssize_t max16065_limit_store(struct device *dev,
@@ -249,8 +249,8 @@ static ssize_t max16065_limit_show(struct device *dev,
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(da);
 	struct max16065_data *data = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			data->limit[attr2->nr][attr2->index]);
+	return sysfs_emit(buf, "%d\n",
+			  data->limit[attr2->nr][attr2->index]);
 }
 
 /* Construct a sensor_device_attribute structure for each register */
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 7a5e539b567b..f1ac153d0b56 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -261,7 +261,7 @@ static ssize_t occ_show_temp_1(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t occ_show_temp_2(struct device *dev,
@@ -312,7 +312,7 @@ static ssize_t occ_show_temp_2(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t occ_show_temp_10(struct device *dev,
@@ -366,7 +366,7 @@ static ssize_t occ_show_temp_10(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t occ_show_freq_1(struct device *dev,
@@ -396,7 +396,7 @@ static ssize_t occ_show_freq_1(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t occ_show_freq_2(struct device *dev,
@@ -426,7 +426,7 @@ static ssize_t occ_show_freq_2(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t occ_show_power_1(struct device *dev,
@@ -465,7 +465,7 @@ static ssize_t occ_show_power_1(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+	return sysfs_emit(buf, "%llu\n", val);
 }
 
 static u64 occ_get_powr_avg(u64 *accum, u32 *samples)
@@ -494,9 +494,9 @@ static ssize_t occ_show_power_2(struct device *dev,
 
 	switch (sattr->nr) {
 	case 0:
-		return snprintf(buf, PAGE_SIZE - 1, "%u_%u_%u\n",
-				get_unaligned_be32(&power->sensor_id),
-				power->function_id, power->apss_channel);
+		return sysfs_emit(buf, "%u_%u_%u\n",
+				  get_unaligned_be32(&power->sensor_id),
+				  power->function_id, power->apss_channel);
 	case 1:
 		val = occ_get_powr_avg(&power->accumulator,
 				       &power->update_tag);
@@ -512,7 +512,7 @@ static ssize_t occ_show_power_2(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+	return sysfs_emit(buf, "%llu\n", val);
 }
 
 static ssize_t occ_show_power_a0(struct device *dev,
@@ -533,8 +533,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 
 	switch (sattr->nr) {
 	case 0:
-		return snprintf(buf, PAGE_SIZE - 1, "%u_system\n",
-				get_unaligned_be32(&power->sensor_id));
+		return sysfs_emit(buf, "%u_system\n",
+				  get_unaligned_be32(&power->sensor_id));
 	case 1:
 		val = occ_get_powr_avg(&power->system.accumulator,
 				       &power->system.update_tag);
@@ -547,8 +547,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->system.value) * 1000000ULL;
 		break;
 	case 4:
-		return snprintf(buf, PAGE_SIZE - 1, "%u_proc\n",
-				get_unaligned_be32(&power->sensor_id));
+		return sysfs_emit(buf, "%u_proc\n",
+				  get_unaligned_be32(&power->sensor_id));
 	case 5:
 		val = occ_get_powr_avg(&power->proc.accumulator,
 				       &power->proc.update_tag);
@@ -561,8 +561,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->proc.value) * 1000000ULL;
 		break;
 	case 8:
-		return snprintf(buf, PAGE_SIZE - 1, "%u_vdd\n",
-				get_unaligned_be32(&power->sensor_id));
+		return sysfs_emit(buf, "%u_vdd\n",
+				  get_unaligned_be32(&power->sensor_id));
 	case 9:
 		val = occ_get_powr_avg(&power->vdd.accumulator,
 				       &power->vdd.update_tag);
@@ -575,8 +575,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		val = get_unaligned_be16(&power->vdd.value) * 1000000ULL;
 		break;
 	case 12:
-		return snprintf(buf, PAGE_SIZE - 1, "%u_vdn\n",
-				get_unaligned_be32(&power->sensor_id));
+		return sysfs_emit(buf, "%u_vdn\n",
+				  get_unaligned_be32(&power->sensor_id));
 	case 13:
 		val = occ_get_powr_avg(&power->vdn.accumulator,
 				       &power->vdn.update_tag);
@@ -592,7 +592,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+	return sysfs_emit(buf, "%llu\n", val);
 }
 
 static ssize_t occ_show_caps_1_2(struct device *dev,
@@ -613,7 +613,7 @@ static ssize_t occ_show_caps_1_2(struct device *dev,
 
 	switch (sattr->nr) {
 	case 0:
-		return snprintf(buf, PAGE_SIZE - 1, "system\n");
+		return sysfs_emit(buf, "system\n");
 	case 1:
 		val = get_unaligned_be16(&caps->cap) * 1000000ULL;
 		break;
@@ -642,7 +642,7 @@ static ssize_t occ_show_caps_1_2(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+	return sysfs_emit(buf, "%llu\n", val);
 }
 
 static ssize_t occ_show_caps_3(struct device *dev,
@@ -663,7 +663,7 @@ static ssize_t occ_show_caps_3(struct device *dev,
 
 	switch (sattr->nr) {
 	case 0:
-		return snprintf(buf, PAGE_SIZE - 1, "system\n");
+		return sysfs_emit(buf, "system\n");
 	case 1:
 		val = get_unaligned_be16(&caps->cap) * 1000000ULL;
 		break;
@@ -689,7 +689,7 @@ static ssize_t occ_show_caps_3(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+	return sysfs_emit(buf, "%llu\n", val);
 }
 
 static ssize_t occ_store_caps_user(struct device *dev,
@@ -732,21 +732,22 @@ static ssize_t occ_show_extended(struct device *dev,
 
 	switch (sattr->nr) {
 	case 0:
-		if (extn->flags & EXTN_FLAG_SENSOR_ID)
-			rc = snprintf(buf, PAGE_SIZE - 1, "%u",
-				      get_unaligned_be32(&extn->sensor_id));
-		else
-			rc = snprintf(buf, PAGE_SIZE - 1, "%02x%02x%02x%02x\n",
-				      extn->name[0], extn->name[1],
-				      extn->name[2], extn->name[3]);
+		if (extn->flags & EXTN_FLAG_SENSOR_ID) {
+			rc = sysfs_emit(buf, "%u",
+					get_unaligned_be32(&extn->sensor_id));
+		} else {
+			rc = sysfs_emit(buf, "%02x%02x%02x%02x\n",
+					extn->name[0], extn->name[1],
+					extn->name[2], extn->name[3]);
+		}
 		break;
 	case 1:
-		rc = snprintf(buf, PAGE_SIZE - 1, "%02x\n", extn->flags);
+		rc = sysfs_emit(buf, "%02x\n", extn->flags);
 		break;
 	case 2:
-		rc = snprintf(buf, PAGE_SIZE - 1, "%02x%02x%02x%02x%02x%02x\n",
-			      extn->data[0], extn->data[1], extn->data[2],
-			      extn->data[3], extn->data[4], extn->data[5]);
+		rc = sysfs_emit(buf, "%02x%02x%02x%02x%02x%02x\n",
+				extn->data[0], extn->data[1], extn->data[2],
+				extn->data[3], extn->data[4], extn->data[5]);
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
index c73be0747e66..03b16abef67f 100644
--- a/drivers/hwmon/occ/sysfs.c
+++ b/drivers/hwmon/occ/sysfs.c
@@ -67,7 +67,7 @@ static ssize_t occ_sysfs_show(struct device *dev,
 		return -EINVAL;
 	}
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t occ_error_show(struct device *dev,
@@ -77,7 +77,7 @@ static ssize_t occ_error_show(struct device *dev,
 
 	occ_update_response(occ);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
+	return sysfs_emit(buf, "%d\n", occ->error);
 }
 
 static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_sysfs_show, NULL, 0);
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 88c5865c4d6f..bf593fd04a1a 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -70,7 +70,7 @@ static ssize_t ipsps_string_show(struct device *dev,
 	p = memscan(data, '#', rc);
 	*p = '\0';
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", data);
+	return sysfs_emit(buf, "%s\n", data);
 }
 
 static ssize_t ipsps_fw_version_show(struct device *dev,
@@ -91,9 +91,9 @@ static ssize_t ipsps_fw_version_show(struct device *dev,
 	if (rc != 6)
 		return -EPROTO;
 
-	return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
-			data[1], data[2]/* < 100 */, data[3]/*< 10*/,
-			data[4], data[5]/* < 100 */);
+	return sysfs_emit(buf, "%u.%02u%u-%u.%02u\n",
+			  data[1], data[2]/* < 100 */, data[3]/*< 10*/,
+			  data[4], data[5]/* < 100 */);
 }
 
 static ssize_t ipsps_mode_show(struct device *dev,
@@ -111,19 +111,19 @@ static ssize_t ipsps_mode_show(struct device *dev,
 
 	switch (rc) {
 	case MODE_ACTIVE:
-		return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
-				MODE_ACTIVE_STRING,
-				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		return sysfs_emit(buf, "[%s] %s %s\n",
+				  MODE_ACTIVE_STRING,
+				  MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
 	case MODE_STANDBY:
-		return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
-				MODE_ACTIVE_STRING,
-				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		return sysfs_emit(buf, "%s [%s] %s\n",
+				  MODE_ACTIVE_STRING,
+				  MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
 	case MODE_REDUNDANCY:
-		return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
-				MODE_ACTIVE_STRING,
-				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		return sysfs_emit(buf, "%s %s [%s]\n",
+				  MODE_ACTIVE_STRING,
+				  MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
 	default:
-		return snprintf(buf, PAGE_SIZE, "unspecified\n");
+		return sysfs_emit(buf, "unspecified\n");
 	}
 }
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 78b3e924f15a..e9e6a47f3bf7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -943,7 +943,7 @@ static ssize_t pmbus_show_boolean(struct device *dev,
 	val = pmbus_get_boolean(client, boolean, attr->index);
 	if (val < 0)
 		return val;
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t pmbus_show_sensor(struct device *dev,
@@ -959,7 +959,7 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 	if (sensor->data < 0)
 		ret = sensor->data;
 	else
-		ret = snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
+		ret = sysfs_emit(buf, "%lld\n", pmbus_reg2data(data, sensor));
 	mutex_unlock(&data->update_lock);
 	return ret;
 }
@@ -995,7 +995,7 @@ static ssize_t pmbus_show_label(struct device *dev,
 {
 	struct pmbus_label *label = to_pmbus_label(da);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", label->label);
+	return sysfs_emit(buf, "%s\n", label->label);
 }
 
 static int pmbus_add_attribute(struct pmbus_data *data, struct attribute *attr)
@@ -2035,7 +2035,7 @@ static ssize_t pmbus_show_samples(struct device *dev,
 	if (val < 0)
 		return val;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t pmbus_set_samples(struct device *dev,
diff --git a/drivers/hwmon/s3c-hwmon.c b/drivers/hwmon/s3c-hwmon.c
index f2703c5460d0..70ae665db477 100644
--- a/drivers/hwmon/s3c-hwmon.c
+++ b/drivers/hwmon/s3c-hwmon.c
@@ -166,7 +166,7 @@ static ssize_t s3c_hwmon_ch_show(struct device *dev,
 	ret *= cfg->mult;
 	ret = DIV_ROUND_CLOSEST(ret, cfg->div);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ret);
+	return sysfs_emit(buf, "%d\n", ret);
 }
 
 /**
@@ -187,7 +187,7 @@ static ssize_t s3c_hwmon_label_show(struct device *dev,
 
 	cfg = pdata->in[sen_attr->index];
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", cfg->name);
+	return sysfs_emit(buf, "%s\n", cfg->name);
 }
 
 /**
diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 039644263101..a7e0d7bcf923 100644
--- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -195,7 +195,7 @@ static int reg_to_rpm(u16 reg)
 static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 	char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", DEVNAME);
+	return sysfs_emit(buf, "%s\n", DEVNAME);
 }
 
 static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
@@ -209,7 +209,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 		return PTR_ERR(data);
 
 	val = reg_to_temp(data->temp[attr->index]);
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t temp_fault_show(struct device *dev,
@@ -221,7 +221,7 @@ static ssize_t temp_fault_show(struct device *dev,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", data->temp[attr->index] == 0);
+	return sysfs_emit(buf, "%d\n", data->temp[attr->index] == 0);
 }
 
 static ssize_t temp_max_show(struct device *dev,
@@ -232,7 +232,7 @@ static ssize_t temp_max_show(struct device *dev,
 	int val;
 
 	val = reg_to_temp_limit(data->temp_max[attr->index]);
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t temp_crit_show(struct device *dev,
@@ -243,7 +243,7 @@ static ssize_t temp_crit_show(struct device *dev,
 	int val;
 
 	val = reg_to_temp_limit(data->temp_crit[attr->index]);
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
@@ -260,7 +260,7 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
 	if (val < 0)
 		return val;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t fan_fault_show(struct device *dev,
@@ -272,8 +272,8 @@ static ssize_t fan_fault_show(struct device *dev,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			data->fan[attr->index] == 0xffff);
+	return sysfs_emit(buf, "%d\n",
+			  data->fan[attr->index] == 0xffff);
 }
 
 static ssize_t fan_min_show(struct device *dev,
@@ -285,7 +285,7 @@ static ssize_t fan_min_show(struct device *dev,
 	if (val < 0)
 		return val;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t in_show(struct device *dev, struct device_attribute *devattr,
@@ -301,7 +301,7 @@ static ssize_t in_show(struct device *dev, struct device_attribute *devattr,
 	val = DIV_ROUND_CLOSEST(
 		data->in[attr->index] * SCH5627_REG_IN_FACTOR[attr->index],
 		10000);
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t in_label_show(struct device *dev,
@@ -309,8 +309,8 @@ static ssize_t in_label_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			SCH5627_IN_LABELS[attr->index]);
+	return sysfs_emit(buf, "%s\n",
+			  SCH5627_IN_LABELS[attr->index]);
 }
 
 static DEVICE_ATTR_RO(name);
diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index 200bb2bfc986..5683a38740f6 100644
--- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -160,7 +160,7 @@ static int reg_to_rpm(u16 reg)
 static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", DEVNAME);
+	return sysfs_emit(buf, "%s\n", DEVNAME);
 }
 
 static ssize_t in_value_show(struct device *dev,
@@ -176,7 +176,7 @@ static ssize_t in_value_show(struct device *dev,
 	val = DIV_ROUND_CLOSEST(
 		data->in[attr->index] * SCH5636_REG_IN_FACTORS[attr->index],
 		255);
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t in_label_show(struct device *dev,
@@ -184,8 +184,8 @@ static ssize_t in_label_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			SCH5636_IN_LABELS[attr->index]);
+	return sysfs_emit(buf, "%s\n",
+			  SCH5636_IN_LABELS[attr->index]);
 }
 
 static ssize_t temp_value_show(struct device *dev,
@@ -199,7 +199,7 @@ static ssize_t temp_value_show(struct device *dev,
 		return PTR_ERR(data);
 
 	val = (data->temp_val[attr->index] - 64) * 1000;
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t temp_fault_show(struct device *dev,
@@ -213,7 +213,7 @@ static ssize_t temp_fault_show(struct device *dev,
 		return PTR_ERR(data);
 
 	val = (data->temp_ctrl[attr->index] & SCH5636_TEMP_WORKING) ? 0 : 1;
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t temp_alarm_show(struct device *dev,
@@ -227,7 +227,7 @@ static ssize_t temp_alarm_show(struct device *dev,
 		return PTR_ERR(data);
 
 	val = (data->temp_ctrl[attr->index] & SCH5636_TEMP_ALARM) ? 1 : 0;
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t fan_value_show(struct device *dev,
@@ -244,7 +244,7 @@ static ssize_t fan_value_show(struct device *dev,
 	if (val < 0)
 		return val;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t fan_fault_show(struct device *dev,
@@ -258,7 +258,7 @@ static ssize_t fan_fault_show(struct device *dev,
 		return PTR_ERR(data);
 
 	val = (data->fan_ctrl[attr->index] & SCH5636_FAN_NOT_PRESENT) ? 1 : 0;
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t fan_alarm_show(struct device *dev,
@@ -272,7 +272,7 @@ static ssize_t fan_alarm_show(struct device *dev,
 		return PTR_ERR(data);
 
 	val = (data->fan_ctrl[attr->index] & SCH5636_FAN_ALARM) ? 1 : 0;
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static struct sensor_device_attribute sch5636_attr[] = {
diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
index b6cbe9810a1b..62906d9c4b86 100644
--- a/drivers/hwmon/smm665.c
+++ b/drivers/hwmon/smm665.c
@@ -351,7 +351,7 @@ static ssize_t smm665_show_crit_alarm(struct device *dev,
 	if (data->faults & (1 << attr->index))
 		val = 1;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t smm665_show_input(struct device *dev,
@@ -366,7 +366,7 @@ static ssize_t smm665_show_input(struct device *dev,
 		return PTR_ERR(data);
 
 	val = smm665_convert(data->adc[adc], adc);
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 #define SMM665_SHOW(what) \
diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
index 6928be6dbe4e..0ed28408aa07 100644
--- a/drivers/hwmon/stts751.c
+++ b/drivers/hwmon/stts751.c
@@ -387,7 +387,7 @@ static ssize_t max_alarm_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->max_alert);
+	return sysfs_emit(buf, "%d\n", priv->max_alert);
 }
 
 static ssize_t min_alarm_show(struct device *dev,
@@ -404,7 +404,7 @@ static ssize_t min_alarm_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->min_alert);
+	return sysfs_emit(buf, "%d\n", priv->min_alert);
 }
 
 static ssize_t input_show(struct device *dev, struct device_attribute *attr,
@@ -419,7 +419,7 @@ static ssize_t input_show(struct device *dev, struct device_attribute *attr,
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->temp);
+	return sysfs_emit(buf, "%d\n", priv->temp);
 }
 
 static ssize_t therm_show(struct device *dev, struct device_attribute *attr,
@@ -427,7 +427,7 @@ static ssize_t therm_show(struct device *dev, struct device_attribute *attr,
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm);
+	return sysfs_emit(buf, "%d\n", priv->therm);
 }
 
 static ssize_t therm_store(struct device *dev, struct device_attribute *attr,
@@ -469,7 +469,7 @@ static ssize_t hyst_show(struct device *dev, struct device_attribute *attr,
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->hyst);
+	return sysfs_emit(buf, "%d\n", priv->hyst);
 }
 
 static ssize_t hyst_store(struct device *dev, struct device_attribute *attr,
@@ -509,7 +509,7 @@ static ssize_t therm_trip_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm_trip);
+	return sysfs_emit(buf, "%d\n", priv->therm_trip);
 }
 
 static ssize_t max_show(struct device *dev, struct device_attribute *attr,
@@ -517,7 +517,7 @@ static ssize_t max_show(struct device *dev, struct device_attribute *attr,
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_max);
+	return sysfs_emit(buf, "%d\n", priv->event_max);
 }
 
 static ssize_t max_store(struct device *dev, struct device_attribute *attr,
@@ -551,7 +551,7 @@ static ssize_t min_show(struct device *dev, struct device_attribute *attr,
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_min);
+	return sysfs_emit(buf, "%d\n", priv->event_min);
 }
 
 static ssize_t min_store(struct device *dev, struct device_attribute *attr,
@@ -585,8 +585,8 @@ static ssize_t interval_show(struct device *dev,
 {
 	struct stts751_priv *priv = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			stts751_intervals[priv->interval]);
+	return sysfs_emit(buf, "%d\n",
+			  stts751_intervals[priv->interval]);
 }
 
 static ssize_t interval_store(struct device *dev,
diff --git a/drivers/hwmon/vexpress-hwmon.c b/drivers/hwmon/vexpress-hwmon.c
index e7109657129a..44d798be3d59 100644
--- a/drivers/hwmon/vexpress-hwmon.c
+++ b/drivers/hwmon/vexpress-hwmon.c
@@ -27,7 +27,7 @@ static ssize_t vexpress_hwmon_label_show(struct device *dev,
 {
 	const char *label = of_get_property(dev->of_node, "label", NULL);
 
-	return snprintf(buffer, PAGE_SIZE, "%s\n", label);
+	return sysfs_emit(buffer, "%s\n", label);
 }
 
 static ssize_t vexpress_hwmon_u32_show(struct device *dev,
@@ -41,8 +41,8 @@ static ssize_t vexpress_hwmon_u32_show(struct device *dev,
 	if (err)
 		return err;
 
-	return snprintf(buffer, PAGE_SIZE, "%u\n", value /
-			to_sensor_dev_attr(dev_attr)->index);
+	return sysfs_emit(buffer, "%u\n", value /
+			  to_sensor_dev_attr(dev_attr)->index);
 }
 
 static ssize_t vexpress_hwmon_u64_show(struct device *dev,
@@ -60,9 +60,9 @@ static ssize_t vexpress_hwmon_u64_show(struct device *dev,
 	if (err)
 		return err;
 
-	return snprintf(buffer, PAGE_SIZE, "%llu\n",
-			div_u64(((u64)value_hi << 32) | value_lo,
-			to_sensor_dev_attr(dev_attr)->index));
+	return sysfs_emit(buffer, "%llu\n",
+			  div_u64(((u64)value_hi << 32) | value_lo,
+				  to_sensor_dev_attr(dev_attr)->index));
 }
 
 static umode_t vexpress_hwmon_attr_is_visible(struct kobject *kobj,
diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 1489e83cb0c4..382ef0395d8e 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -329,14 +329,14 @@ static ssize_t temp1_input_show(struct device *dev,
 
 	temp = sign_extend32(val, TEMP_NEGATIVE_BIT);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", CELSIUS_TO_mCELSIUS(temp));
+	return sysfs_emit(buf, "%d\n", CELSIUS_TO_mCELSIUS(temp));
 }
 
 static ssize_t temp1_label_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "SoC Temperature\n");
+	return sysfs_emit(buf, "SoC Temperature\n");
 }
 
 static ssize_t temp1_critical_alarm_show(struct device *dev,
@@ -345,21 +345,21 @@ static ssize_t temp1_critical_alarm_show(struct device *dev,
 {
 	struct xgene_hwmon_dev *ctx = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ctx->temp_critical_alarm);
+	return sysfs_emit(buf, "%d\n", ctx->temp_critical_alarm);
 }
 
 static ssize_t power1_label_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "CPU power\n");
+	return sysfs_emit(buf, "CPU power\n");
 }
 
 static ssize_t power2_label_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "IO power\n");
+	return sysfs_emit(buf, "IO power\n");
 }
 
 static ssize_t power1_input_show(struct device *dev,
@@ -374,7 +374,7 @@ static ssize_t power1_input_show(struct device *dev,
 	if (rc < 0)
 		return rc;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mWATT_TO_uWATT(val));
+	return sysfs_emit(buf, "%u\n", mWATT_TO_uWATT(val));
 }
 
 static ssize_t power2_input_show(struct device *dev,
@@ -389,7 +389,7 @@ static ssize_t power2_input_show(struct device *dev,
 	if (rc < 0)
 		return rc;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mWATT_TO_uWATT(val));
+	return sysfs_emit(buf, "%u\n", mWATT_TO_uWATT(val));
 }
 
 static DEVICE_ATTR_RO(temp1_label);
-- 
2.17.1

