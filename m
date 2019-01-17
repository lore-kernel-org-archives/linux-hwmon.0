Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85048C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47E0220855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVYhXudF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbfAQVO2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:28 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41183 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfAQVO1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:27 -0500
Received: by mail-pg1-f196.google.com with SMTP id m1so4979491pgq.8
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Gpqny1ZgCCva12YzA0cRKMpRTUYDRY6EafoT1V0LQ7k=;
        b=PVYhXudFi4yyxP4P7OUdaWvTzXVFZ3Vq20RnfdZO3RcbwsG+eGKRMC19cdi9Myl6/o
         E8DMNy06Vdllf3BfMi0UssVE+wxxAXIqepnhxI5Mh8by6nAbVg+1BuRtXla3ZWY+e8R5
         oqwKb1tdVUXxlXa+4Q+GjvgkS9oQ//NTVIfQcO6LJn53gpUeVqPBRmZ91C/MFx1PVeKQ
         OMg1/E9fO8Y39bw0j2ciRxyiro511FXHPCDlUsZMrBRFiwkUEXsnun8MPclWQuNatyeB
         PZts8q3MyOj9H6BUoKnrLNI3W5BNTbdIzUFCF0R4kV7pnD9PtCU98o6cHawmoKlA9ubV
         6fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Gpqny1ZgCCva12YzA0cRKMpRTUYDRY6EafoT1V0LQ7k=;
        b=H9FfVwJJjHpLE9Da1Jk9AcHGNz5u6jAp6w2qm2SwfiotLbLN+IzBBVWTtcg9X5Styk
         3ZweStb176jn6ckXZmLF49Oo694Embd6/FxeE+S54NAjp25+c7BHaqCb0oS+73Agi4Si
         +UL/bAvDm6Uv2KjR4U8ymDSXvfKe+jtUN7o1uROzW8/wTeTDiiSDk5xpDlhaQ3WNzlR6
         E+BsMKiPBpT7sJIltPGn2GmYMZa0hFdciFTav0xoo6j+JtOr8LXBqY5oMgeShr+StVnc
         Eks8dSfQXdKC8YBx+R6F1DbXYDYHlFDJFzuPw23gZwIaUi6h/HPoS2ZNkxaQpgLu9eZs
         uAKA==
X-Gm-Message-State: AJcUukddTJk+sc9cbSGeqoGEbj0GpREfvTFXpNVfvN4pNh8fNg9wnxAy
        XtVS6dWTRJ3GoIITgHHI388iTNmI
X-Google-Smtp-Source: ALg8bN45/GLuAKBhadfvh1xJp4de+jeObJm19fXSXKICmBA4glL9cQteVAmmQ/HfnXEKdoZX2aITvQ==
X-Received: by 2002:a62:9fcf:: with SMTP id v76mr10973293pfk.144.1547759665792;
        Thu, 17 Jan 2019 13:14:25 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j197sm2731617pgc.76.2019.01.17.13.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:25 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/29] hwmon: (lm80) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:39 -0800
Message-Id: <1547759629-23007-20-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm80.c | 138 ++++++++++++++++++++++-----------------------------
 1 file changed, 59 insertions(+), 79 deletions(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index f9b8e3e23a8e..54cf24a2b0ed 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -269,7 +269,7 @@ static struct lm80_data *lm80_update_device(struct device *dev)
  * Sysfs stuff
  */
 
-static ssize_t show_in(struct device *dev, struct device_attribute *attr,
+static ssize_t in_show(struct device *dev, struct device_attribute *attr,
 		       char *buf)
 {
 	struct lm80_data *data = lm80_update_device(dev);
@@ -281,8 +281,8 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[nr][index]));
 }
 
-static ssize_t set_in(struct device *dev, struct device_attribute *attr,
-		      const char *buf, size_t count)
+static ssize_t in_store(struct device *dev, struct device_attribute *attr,
+			const char *buf, size_t count)
 {
 	struct lm80_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -303,7 +303,7 @@ static ssize_t set_in(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
+static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int index = to_sensor_dev_attr_2(attr)->index;
@@ -315,8 +315,8 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 		       DIV_FROM_REG(data->fan_div[index])));
 }
 
-static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
-	char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm80_data *data = lm80_update_device(dev);
@@ -325,8 +325,8 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[nr]));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-	const char *buf, size_t count)
+static ssize_t fan_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	int index = to_sensor_dev_attr_2(attr)->index;
 	int nr = to_sensor_dev_attr_2(attr)->nr;
@@ -352,8 +352,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
  * least surprise; the user doesn't expect the fan minimum to change just
  * because the divisor changed.
  */
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-	const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm80_data *data = dev_get_drvdata(dev);
@@ -410,7 +411,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -420,8 +421,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm80_data *data = dev_get_drvdata(dev);
@@ -448,7 +450,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -458,72 +460,50 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR_2(in0_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 0);
-static SENSOR_DEVICE_ATTR_2(in1_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 1);
-static SENSOR_DEVICE_ATTR_2(in2_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 2);
-static SENSOR_DEVICE_ATTR_2(in3_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 3);
-static SENSOR_DEVICE_ATTR_2(in4_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 4);
-static SENSOR_DEVICE_ATTR_2(in5_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 5);
-static SENSOR_DEVICE_ATTR_2(in6_min, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_min, 6);
-static SENSOR_DEVICE_ATTR_2(in0_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 0);
-static SENSOR_DEVICE_ATTR_2(in1_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 1);
-static SENSOR_DEVICE_ATTR_2(in2_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 2);
-static SENSOR_DEVICE_ATTR_2(in3_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 3);
-static SENSOR_DEVICE_ATTR_2(in4_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 4);
-static SENSOR_DEVICE_ATTR_2(in5_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 5);
-static SENSOR_DEVICE_ATTR_2(in6_max, S_IWUSR | S_IRUGO,
-		show_in, set_in, i_max, 6);
-static SENSOR_DEVICE_ATTR_2(in0_input, S_IRUGO, show_in, NULL, i_input, 0);
-static SENSOR_DEVICE_ATTR_2(in1_input, S_IRUGO, show_in, NULL, i_input, 1);
-static SENSOR_DEVICE_ATTR_2(in2_input, S_IRUGO, show_in, NULL, i_input, 2);
-static SENSOR_DEVICE_ATTR_2(in3_input, S_IRUGO, show_in, NULL, i_input, 3);
-static SENSOR_DEVICE_ATTR_2(in4_input, S_IRUGO, show_in, NULL, i_input, 4);
-static SENSOR_DEVICE_ATTR_2(in5_input, S_IRUGO, show_in, NULL, i_input, 5);
-static SENSOR_DEVICE_ATTR_2(in6_input, S_IRUGO, show_in, NULL, i_input, 6);
-static SENSOR_DEVICE_ATTR_2(fan1_min, S_IWUSR | S_IRUGO,
-		show_fan, set_fan_min, f_min, 0);
-static SENSOR_DEVICE_ATTR_2(fan2_min, S_IWUSR | S_IRUGO,
-		show_fan, set_fan_min, f_min, 1);
-static SENSOR_DEVICE_ATTR_2(fan1_input, S_IRUGO, show_fan, NULL, f_input, 0);
-static SENSOR_DEVICE_ATTR_2(fan2_input, S_IRUGO, show_fan, NULL, f_input, 1);
-static SENSOR_DEVICE_ATTR(fan1_div, S_IWUSR | S_IRUGO,
-		show_fan_div, set_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, S_IWUSR | S_IRUGO,
-		show_fan_div, set_fan_div, 1);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, t_input);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp,
-		set_temp, t_hot_max);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO, show_temp,
-		set_temp, t_hot_hyst);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_temp,
-		set_temp, t_os_max);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO, show_temp,
-		set_temp, t_os_hyst);
+static SENSOR_DEVICE_ATTR_2_RW(in0_min, in, i_min, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_min, in, i_min, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_min, in, i_min, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in3_min, in, i_min, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in4_min, in, i_min, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in5_min, in, i_min, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in6_min, in, i_min, 6);
+static SENSOR_DEVICE_ATTR_2_RW(in0_max, in, i_max, 0);
+static SENSOR_DEVICE_ATTR_2_RW(in1_max, in, i_max, 1);
+static SENSOR_DEVICE_ATTR_2_RW(in2_max, in, i_max, 2);
+static SENSOR_DEVICE_ATTR_2_RW(in3_max, in, i_max, 3);
+static SENSOR_DEVICE_ATTR_2_RW(in4_max, in, i_max, 4);
+static SENSOR_DEVICE_ATTR_2_RW(in5_max, in, i_max, 5);
+static SENSOR_DEVICE_ATTR_2_RW(in6_max, in, i_max, 6);
+static SENSOR_DEVICE_ATTR_2_RO(in0_input, in, i_input, 0);
+static SENSOR_DEVICE_ATTR_2_RO(in1_input, in, i_input, 1);
+static SENSOR_DEVICE_ATTR_2_RO(in2_input, in, i_input, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in3_input, in, i_input, 3);
+static SENSOR_DEVICE_ATTR_2_RO(in4_input, in, i_input, 4);
+static SENSOR_DEVICE_ATTR_2_RO(in5_input, in, i_input, 5);
+static SENSOR_DEVICE_ATTR_2_RO(in6_input, in, i_input, 6);
+static SENSOR_DEVICE_ATTR_2_RW(fan1_min, fan, f_min, 0);
+static SENSOR_DEVICE_ATTR_2_RW(fan2_min, fan, f_min, 1);
+static SENSOR_DEVICE_ATTR_2_RO(fan1_input, fan, f_input, 0);
+static SENSOR_DEVICE_ATTR_2_RO(fan2_input, fan, f_input, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, t_hot_max);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp, t_hot_hyst);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp, t_os_max);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, temp, t_os_hyst);
 static DEVICE_ATTR_RO(alarms);
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 13);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 13);
 
 /*
  * Real code
-- 
2.7.4

