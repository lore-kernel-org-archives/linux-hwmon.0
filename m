Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1674EC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5BEB20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT39wF7c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfAQVN4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:13:56 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34199 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfAQVN4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:13:56 -0500
Received: by mail-pl1-f195.google.com with SMTP id w4so5313651plz.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RHfKQOjgJwH0nc4uJqM6MZI1r0AFPRP8kS+34YcxbSM=;
        b=AT39wF7cErtBgcgKJISExwnzRbAgss/qaTCsdtXw94WI7EP1v9+jrVUA4ivkARXSUr
         YD4tlcZI1k5h+RsI/ezb6KBI+6Xhud+7Hvi0kXLOI+bbJTqMEAHVbV90rhHlLAzVDm80
         wDYLO5ryEOpCMm3DTuZks37wX1VTC9QWeOQdG1kBXW678KSFks/jsjLrihE7rym9IUFt
         jDGjSPDhcYKP3+1nVHFXflKy9OwIJISO8V9OQ/WzPr4QM3rtrsA3wXk+DAMd9ixGxK1z
         bdBfBI4ZVX01kGgRtB8WNRVSseBid4bQuhy4hxTfBBj3gdCD4FUx/eFG6exiDZlJTy8D
         ejxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=RHfKQOjgJwH0nc4uJqM6MZI1r0AFPRP8kS+34YcxbSM=;
        b=iiKE7/8FCJAxBb3vHFTSwbn3HhDFVpDVU2u122mhuM0djtmGzKdvUKEyUkhNnOL6Bm
         LR8jNZPlM1c0EwrZKomeW6EBj9chCvbjvszH0UbxfD5O1C6xHUootyYDx3RY+8+xLIGD
         d47uoBWMfuqQ7ecqsC3KkytfhZufoRSwsR+mzwP0ulPE2jEfhu5aVRHh+qw6V9vExBMw
         TPJU+cQ9HLW/0M3RtcohQrsNOqEQ5dFXSVVV/dkuWIB9x5KAOundc9tCO9TJs8vs/FOu
         +YfZMF6OCc693fEC9Lj5eAj9IH/B94VghqF7bBR7Tll0+Sz49tE/pMHfzhyFkVkfmscH
         sHYQ==
X-Gm-Message-State: AJcUukdqMvTzo70EQZWcee8Uy+DMNqBItD9cQUEDrek+bGy+XzLFtXLZ
        bpXCHVuxXKM7+mVvbXJoaiGfXioH
X-Google-Smtp-Source: ALg8bN7ga0e637atIRoGn6A7pYUwthX7+lnr8ZvqU3wg2jdExSO7MmnAaZ99BXXRixflwm+XyIr+bw==
X-Received: by 2002:a17:902:9887:: with SMTP id s7mr16118584plp.199.1547759634666;
        Thu, 17 Jan 2019 13:13:54 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o189sm4649734pfg.117.2019.01.17.13.13.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:13:54 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/29] hwmon: (gl518sm) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:21 -0800
Message-Id: <1547759629-23007-2-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/gl518sm.c | 120 ++++++++++++++++++++++++------------------------
 1 file changed, 59 insertions(+), 61 deletions(-)

diff --git a/drivers/hwmon/gl518sm.c b/drivers/hwmon/gl518sm.c
index b267510daeb2..b7e453298409 100644
--- a/drivers/hwmon/gl518sm.c
+++ b/drivers/hwmon/gl518sm.c
@@ -264,7 +264,7 @@ show(RAW, alarms, alarms);
 show(BOOL, beep_enable, beep_enable);
 show(BEEP_MASK, beep_mask, beep_mask);
 
-static ssize_t show_fan_input(struct device *dev,
+static ssize_t fan_input_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -273,8 +273,8 @@ static ssize_t show_fan_input(struct device *dev,
 					DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_min(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct gl518_data *data = gl518_update_device(dev);
@@ -282,8 +282,8 @@ static ssize_t show_fan_min(struct device *dev,
 					DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_div(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct gl518_data *data = gl518_update_device(dev);
@@ -350,8 +350,9 @@ set_high(IN, in_max3, voltage_max[3], GL518_REG_VIN3_LIMIT);
 set_bits(BOOL, beep_enable, beep_enable, GL518_REG_CONF, 0x04, 2);
 set(BEEP_MASK, beep_mask, beep_mask, GL518_REG_ALARM);
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct gl518_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -383,8 +384,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct gl518_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -427,40 +429,36 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_input1, NULL);
-static DEVICE_ATTR(temp1_max, S_IWUSR|S_IRUGO, show_temp_max1, set_temp_max1);
-static DEVICE_ATTR(temp1_max_hyst, S_IWUSR|S_IRUGO,
-	show_temp_hyst1, set_temp_hyst1);
-static DEVICE_ATTR(fan1_auto, S_IWUSR|S_IRUGO, show_fan_auto1, set_fan_auto1);
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR|S_IRUGO,
-	show_fan_min, set_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IWUSR|S_IRUGO,
-	show_fan_min, set_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan1_div, S_IWUSR|S_IRUGO,
-	show_fan_div, set_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, S_IWUSR|S_IRUGO,
-	show_fan_div, set_fan_div, 1);
-static DEVICE_ATTR(in0_input, S_IRUGO, show_in_input0, NULL);
-static DEVICE_ATTR(in1_input, S_IRUGO, show_in_input1, NULL);
-static DEVICE_ATTR(in2_input, S_IRUGO, show_in_input2, NULL);
-static DEVICE_ATTR(in3_input, S_IRUGO, show_in_input3, NULL);
-static DEVICE_ATTR(in0_min, S_IWUSR|S_IRUGO, show_in_min0, set_in_min0);
-static DEVICE_ATTR(in1_min, S_IWUSR|S_IRUGO, show_in_min1, set_in_min1);
-static DEVICE_ATTR(in2_min, S_IWUSR|S_IRUGO, show_in_min2, set_in_min2);
-static DEVICE_ATTR(in3_min, S_IWUSR|S_IRUGO, show_in_min3, set_in_min3);
-static DEVICE_ATTR(in0_max, S_IWUSR|S_IRUGO, show_in_max0, set_in_max0);
-static DEVICE_ATTR(in1_max, S_IWUSR|S_IRUGO, show_in_max1, set_in_max1);
-static DEVICE_ATTR(in2_max, S_IWUSR|S_IRUGO, show_in_max2, set_in_max2);
-static DEVICE_ATTR(in3_max, S_IWUSR|S_IRUGO, show_in_max3, set_in_max3);
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
-static DEVICE_ATTR(beep_enable, S_IWUSR|S_IRUGO,
-	show_beep_enable, set_beep_enable);
-static DEVICE_ATTR(beep_mask, S_IWUSR|S_IRUGO,
-	show_beep_mask, set_beep_mask);
-
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static DEVICE_ATTR(temp1_input, 0444, show_temp_input1, NULL);
+static DEVICE_ATTR(temp1_max, 0644, show_temp_max1, set_temp_max1);
+static DEVICE_ATTR(temp1_max_hyst, 0644,
+		   show_temp_hyst1, set_temp_hyst1);
+static DEVICE_ATTR(fan1_auto, 0644, show_fan_auto1, set_fan_auto1);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
+static DEVICE_ATTR(in0_input, 0444, show_in_input0, NULL);
+static DEVICE_ATTR(in1_input, 0444, show_in_input1, NULL);
+static DEVICE_ATTR(in2_input, 0444, show_in_input2, NULL);
+static DEVICE_ATTR(in3_input, 0444, show_in_input3, NULL);
+static DEVICE_ATTR(in0_min, 0644, show_in_min0, set_in_min0);
+static DEVICE_ATTR(in1_min, 0644, show_in_min1, set_in_min1);
+static DEVICE_ATTR(in2_min, 0644, show_in_min2, set_in_min2);
+static DEVICE_ATTR(in3_min, 0644, show_in_min3, set_in_min3);
+static DEVICE_ATTR(in0_max, 0644, show_in_max0, set_in_max0);
+static DEVICE_ATTR(in1_max, 0644, show_in_max1, set_in_max1);
+static DEVICE_ATTR(in2_max, 0644, show_in_max2, set_in_max2);
+static DEVICE_ATTR(in3_max, 0644, show_in_max3, set_in_max3);
+static DEVICE_ATTR(alarms, 0444, show_alarms, NULL);
+static DEVICE_ATTR(beep_enable, 0644,
+		   show_beep_enable, set_beep_enable);
+static DEVICE_ATTR(beep_mask, 0644,
+		   show_beep_mask, set_beep_mask);
+
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -468,24 +466,24 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 6);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 6);
 
-static ssize_t show_beep(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t beep_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct gl518_data *data = gl518_update_device(dev);
 	return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
 }
 
-static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t beep_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct gl518_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -511,13 +509,13 @@ static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in0_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 0);
-static SENSOR_DEVICE_ATTR(in1_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 1);
-static SENSOR_DEVICE_ATTR(in2_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 2);
-static SENSOR_DEVICE_ATTR(in3_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 3);
-static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 4);
-static SENSOR_DEVICE_ATTR(fan1_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 5);
-static SENSOR_DEVICE_ATTR(fan2_beep, S_IRUGO|S_IWUSR, show_beep, set_beep, 6);
+static SENSOR_DEVICE_ATTR_RW(in0_beep, beep, 0);
+static SENSOR_DEVICE_ATTR_RW(in1_beep, beep, 1);
+static SENSOR_DEVICE_ATTR_RW(in2_beep, beep, 2);
+static SENSOR_DEVICE_ATTR_RW(in3_beep, beep, 3);
+static SENSOR_DEVICE_ATTR_RW(temp1_beep, beep, 4);
+static SENSOR_DEVICE_ATTR_RW(fan1_beep, beep, 5);
+static SENSOR_DEVICE_ATTR_RW(fan2_beep, beep, 6);
 
 static struct attribute *gl518_attributes[] = {
 	&dev_attr_in3_input.attr,
-- 
2.7.4

