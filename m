Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45FCC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9895120855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzR2noyM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbfAQVON (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:13 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39927 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVON (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:13 -0500
Received: by mail-pl1-f195.google.com with SMTP id 101so5297940pld.6
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9JqaKgiveE4F5YM/uK1rASqgM9lKuUgqKdKnKdrCd0I=;
        b=SzR2noyM7zPVxLN2IUpaIY7qYIWtKdae3W6eWfxph46LFkwbq5oHrX3e2Dg5CLVk/R
         nvu/BHh4lblfUIVRVubO9L7aLSPOlYnBzIcmNGIKIk8tgZUNMCzjH1hsqJKaavd3LWu/
         qpskWg9UZoyx63dGLTjtgSOezjgr+J7qnwSPm/xqvikI0x289pOFAh25Aed84FDLa49U
         SrlToND86+xS6dlk5a8mi+/DVa61T1jwzkQPMHAhJ3lWjmfcL6/QsnqEXKcgTWJreu98
         M9zE3BRGpZf13bMZtgDsgybfcBsC8P6ErrMvU6fErr4LwaWyernpTg0kR3szl3/IaEqV
         l5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=9JqaKgiveE4F5YM/uK1rASqgM9lKuUgqKdKnKdrCd0I=;
        b=lcRXeK0cC8za5vhxzezwQFC0+AN+Al37YMogwJsmz7O2s5Za9swVrvmTNQ+P4/o3lV
         iM66+FwRbAkePmwybHaCAsbGzRLou3W3V0eG4jObCiwA6Um8zt7I90wi0ImYxpes+18h
         DVe6RLLDNupXGI4cq0r8jrWAtK6pZeQhJRRoC+00Dyqyqkvd7GqmkvW+mOBpPEtQNq3Q
         95xEoUDz7a7KJ1cgS5tyBhANMwYfC/GonHSjDbfW7y8Ppx1YRjRDZxfjPtk8DF2YCq04
         yRGiZ0NQwnf5UT/NSF/a592LBzwy8FCLfc955gbwmYjH+gfgJI7PGAf+kREys2CeBibW
         1aQA==
X-Gm-Message-State: AJcUukeUcFDEsWR39IYpIQB4RrUwXf1153ZVBdgoyzjHnHvjBkNasHfB
        VccZJVgfab9R4sdqwn2ZUlkytpzN
X-Google-Smtp-Source: ALg8bN4DAaXx7/L/yrQUvUI03rS1UR/Lgltz6RRR6wwF0jh/rHYD5euLOG8DllMsNwCglMtlIOVNcw==
X-Received: by 2002:a17:902:9f89:: with SMTP id g9mr16588815plq.214.1547759651853;
        Thu, 17 Jan 2019 13:14:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s9sm5264094pgl.88.2019.01.17.13.14.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:11 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/29] hwmon: (ina209) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:31 -0800
Message-Id: <1547759629-23007-12-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina209.c | 151 +++++++++++++++++++++----------------------------
 1 file changed, 65 insertions(+), 86 deletions(-)

diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index aa0768ce8aea..e3854463db84 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -230,9 +230,9 @@ static u16 ina209_reg_from_interval(u16 config, long interval)
 	return (config & 0xf807) | (adc << 3) | (adc << 7);
 }
 
-static ssize_t ina209_set_interval(struct device *dev,
-				   struct device_attribute *da,
-				   const char *buf, size_t count)
+static ssize_t ina209_interval_store(struct device *dev,
+				     struct device_attribute *da,
+				     const char *buf, size_t count)
 {
 	struct ina209_data *data = ina209_update_device(dev);
 	long val;
@@ -257,7 +257,7 @@ static ssize_t ina209_set_interval(struct device *dev,
 	return count;
 }
 
-static ssize_t ina209_show_interval(struct device *dev,
+static ssize_t ina209_interval_show(struct device *dev,
 				    struct device_attribute *da, char *buf)
 {
 	struct ina209_data *data = dev_get_drvdata(dev);
@@ -279,10 +279,9 @@ static u16 ina209_reset_history_regs[] = {
 	INA209_POWER_PEAK
 };
 
-static ssize_t ina209_reset_history(struct device *dev,
+static ssize_t ina209_history_store(struct device *dev,
 				    struct device_attribute *da,
-				    const char *buf,
-				    size_t count)
+				    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina209_data *data = dev_get_drvdata(dev);
@@ -306,10 +305,9 @@ static ssize_t ina209_reset_history(struct device *dev,
 	return count;
 }
 
-static ssize_t ina209_set_value(struct device *dev,
-				struct device_attribute *da,
-				const char *buf,
-				size_t count)
+static ssize_t ina209_value_store(struct device *dev,
+				  struct device_attribute *da,
+				  const char *buf, size_t count)
 {
 	struct ina209_data *data = ina209_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -337,9 +335,8 @@ static ssize_t ina209_set_value(struct device *dev,
 	return count;
 }
 
-static ssize_t ina209_show_value(struct device *dev,
-				 struct device_attribute *da,
-				 char *buf)
+static ssize_t ina209_value_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina209_data *data = ina209_update_device(dev);
@@ -352,9 +349,8 @@ static ssize_t ina209_show_value(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%ld\n", val);
 }
 
-static ssize_t ina209_show_alarm(struct device *dev,
-				 struct device_attribute *da,
-				 char *buf)
+static ssize_t ina209_alarm_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina209_data *data = ina209_update_device(dev);
@@ -374,82 +370,65 @@ static ssize_t ina209_show_alarm(struct device *dev,
 }
 
 /* Shunt voltage, history, limits, alarms */
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ina209_show_value, NULL,
-			  INA209_SHUNT_VOLTAGE);
-static SENSOR_DEVICE_ATTR(in0_input_highest, S_IRUGO, ina209_show_value, NULL,
-			  INA209_SHUNT_VOLTAGE_POS_PEAK);
-static SENSOR_DEVICE_ATTR(in0_input_lowest, S_IRUGO, ina209_show_value, NULL,
-			  INA209_SHUNT_VOLTAGE_NEG_PEAK);
-static SENSOR_DEVICE_ATTR(in0_reset_history, S_IWUSR, NULL,
-			  ina209_reset_history, (1 << 0) | (1 << 1));
-static SENSOR_DEVICE_ATTR(in0_max, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_SHUNT_VOLTAGE_POS_WARN);
-static SENSOR_DEVICE_ATTR(in0_min, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_SHUNT_VOLTAGE_NEG_WARN);
-static SENSOR_DEVICE_ATTR(in0_crit_max, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_CRITICAL_DAC_POS);
-static SENSOR_DEVICE_ATTR(in0_crit_min, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_CRITICAL_DAC_NEG);
-
-static SENSOR_DEVICE_ATTR(in0_min_alarm,  S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 11);
-static SENSOR_DEVICE_ATTR(in0_max_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 12);
-static SENSOR_DEVICE_ATTR(in0_crit_min_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 6);
-static SENSOR_DEVICE_ATTR(in0_crit_max_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 7);
+static SENSOR_DEVICE_ATTR_RO(in0_input, ina209_value, INA209_SHUNT_VOLTAGE);
+static SENSOR_DEVICE_ATTR_RO(in0_input_highest, ina209_value,
+			     INA209_SHUNT_VOLTAGE_POS_PEAK);
+static SENSOR_DEVICE_ATTR_RO(in0_input_lowest, ina209_value,
+			     INA209_SHUNT_VOLTAGE_NEG_PEAK);
+static SENSOR_DEVICE_ATTR_WO(in0_reset_history, ina209_history,
+			     (1 << 0) | (1 << 1));
+static SENSOR_DEVICE_ATTR_RW(in0_max, ina209_value,
+			     INA209_SHUNT_VOLTAGE_POS_WARN);
+static SENSOR_DEVICE_ATTR_RW(in0_min, ina209_value,
+			     INA209_SHUNT_VOLTAGE_NEG_WARN);
+static SENSOR_DEVICE_ATTR_RW(in0_crit_max, ina209_value,
+			     INA209_CRITICAL_DAC_POS);
+static SENSOR_DEVICE_ATTR_RW(in0_crit_min, ina209_value,
+			     INA209_CRITICAL_DAC_NEG);
+
+static SENSOR_DEVICE_ATTR_RO(in0_min_alarm, ina209_alarm, 1 << 11);
+static SENSOR_DEVICE_ATTR_RO(in0_max_alarm, ina209_alarm, 1 << 12);
+static SENSOR_DEVICE_ATTR_RO(in0_crit_min_alarm, ina209_alarm, 1 << 6);
+static SENSOR_DEVICE_ATTR_RO(in0_crit_max_alarm, ina209_alarm, 1 << 7);
 
 /* Bus voltage, history, limits, alarms */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ina209_show_value, NULL,
-			  INA209_BUS_VOLTAGE);
-static SENSOR_DEVICE_ATTR(in1_input_highest, S_IRUGO, ina209_show_value, NULL,
-			  INA209_BUS_VOLTAGE_MAX_PEAK);
-static SENSOR_DEVICE_ATTR(in1_input_lowest, S_IRUGO, ina209_show_value, NULL,
-			  INA209_BUS_VOLTAGE_MIN_PEAK);
-static SENSOR_DEVICE_ATTR(in1_reset_history, S_IWUSR, NULL,
-			  ina209_reset_history, (1 << 2) | (1 << 3));
-static SENSOR_DEVICE_ATTR(in1_max, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_BUS_VOLTAGE_OVER_WARN);
-static SENSOR_DEVICE_ATTR(in1_min, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_BUS_VOLTAGE_UNDER_WARN);
-static SENSOR_DEVICE_ATTR(in1_crit_max, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_BUS_VOLTAGE_OVER_LIMIT);
-static SENSOR_DEVICE_ATTR(in1_crit_min, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_BUS_VOLTAGE_UNDER_LIMIT);
-
-static SENSOR_DEVICE_ATTR(in1_min_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 14);
-static SENSOR_DEVICE_ATTR(in1_max_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 15);
-static SENSOR_DEVICE_ATTR(in1_crit_min_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 9);
-static SENSOR_DEVICE_ATTR(in1_crit_max_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 10);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ina209_value, INA209_BUS_VOLTAGE);
+static SENSOR_DEVICE_ATTR_RO(in1_input_highest, ina209_value,
+			     INA209_BUS_VOLTAGE_MAX_PEAK);
+static SENSOR_DEVICE_ATTR_RO(in1_input_lowest, ina209_value,
+			     INA209_BUS_VOLTAGE_MIN_PEAK);
+static SENSOR_DEVICE_ATTR_WO(in1_reset_history, ina209_history,
+			     (1 << 2) | (1 << 3));
+static SENSOR_DEVICE_ATTR_RW(in1_max, ina209_value,
+			     INA209_BUS_VOLTAGE_OVER_WARN);
+static SENSOR_DEVICE_ATTR_RW(in1_min, ina209_value,
+			     INA209_BUS_VOLTAGE_UNDER_WARN);
+static SENSOR_DEVICE_ATTR_RW(in1_crit_max, ina209_value,
+			     INA209_BUS_VOLTAGE_OVER_LIMIT);
+static SENSOR_DEVICE_ATTR_RW(in1_crit_min, ina209_value,
+			     INA209_BUS_VOLTAGE_UNDER_LIMIT);
+
+static SENSOR_DEVICE_ATTR_RO(in1_min_alarm, ina209_alarm, 1 << 14);
+static SENSOR_DEVICE_ATTR_RO(in1_max_alarm, ina209_alarm, 1 << 15);
+static SENSOR_DEVICE_ATTR_RO(in1_crit_min_alarm, ina209_alarm, 1 << 9);
+static SENSOR_DEVICE_ATTR_RO(in1_crit_max_alarm, ina209_alarm, 1 << 10);
 
 /* Power */
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, ina209_show_value, NULL,
-			  INA209_POWER);
-static SENSOR_DEVICE_ATTR(power1_input_highest, S_IRUGO, ina209_show_value,
-			  NULL, INA209_POWER_PEAK);
-static SENSOR_DEVICE_ATTR(power1_reset_history, S_IWUSR, NULL,
-			  ina209_reset_history, 1 << 4);
-static SENSOR_DEVICE_ATTR(power1_max, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_POWER_WARN);
-static SENSOR_DEVICE_ATTR(power1_crit, S_IRUGO | S_IWUSR, ina209_show_value,
-			  ina209_set_value, INA209_POWER_OVER_LIMIT);
-
-static SENSOR_DEVICE_ATTR(power1_max_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 13);
-static SENSOR_DEVICE_ATTR(power1_crit_alarm, S_IRUGO, ina209_show_alarm, NULL,
-			  1 << 8);
+static SENSOR_DEVICE_ATTR_RO(power1_input, ina209_value, INA209_POWER);
+static SENSOR_DEVICE_ATTR_RO(power1_input_highest, ina209_value,
+			     INA209_POWER_PEAK);
+static SENSOR_DEVICE_ATTR_WO(power1_reset_history, ina209_history, 1 << 4);
+static SENSOR_DEVICE_ATTR_RW(power1_max, ina209_value, INA209_POWER_WARN);
+static SENSOR_DEVICE_ATTR_RW(power1_crit, ina209_value,
+			     INA209_POWER_OVER_LIMIT);
+
+static SENSOR_DEVICE_ATTR_RO(power1_max_alarm, ina209_alarm, 1 << 13);
+static SENSOR_DEVICE_ATTR_RO(power1_crit_alarm, ina209_alarm, 1 << 8);
 
 /* Current */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, ina209_show_value, NULL,
-			  INA209_CURRENT);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, ina209_value, INA209_CURRENT);
 
-static SENSOR_DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
-			  ina209_show_interval, ina209_set_interval, 0);
+static SENSOR_DEVICE_ATTR_RW(update_interval, ina209_interval, 0);
 
 /*
  * Finally, construct an array of pointers to members of the above objects,
-- 
2.7.4

