Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D7EC10F13
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C96F20693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfl/zJhv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbfDEDVO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38887 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbfDEDVO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id g37so2231405plb.5
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=flbyMwUu5h7Kf1UXSMqmGO/9n99g8Raoefp83RLzzU8=;
        b=gfl/zJhvdJ6d8XBvUGCETIvzGHOzQnTd9loPCpOYC7K5wzxnUL3FKf2kGjcrcg2k0N
         hfPUMhyrQwCok+WNlmqNv+H2swLcMoZX0HXP0gFQmaFp1f4Hh9sSGzDwT0WS6xyhzWaN
         hl8LEHBUfKooSZ4Qwxa9J1LFx+m8HkYUbwDwVXyW1/6vxSGSLgaREpBY68IPUITTxEqX
         fFGmQet1+PKQiMmsG0JJSiTtPyTb1LHIU1x36HaQqqE5uSDB+vgM2tYPCRhUteao1bD1
         oY8QYXk2vrmq9dwYMika3JY9ENkf2rLqouBcJaSFbjNa7NTvdE7KuS6hglhm2gUDucpt
         x/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=flbyMwUu5h7Kf1UXSMqmGO/9n99g8Raoefp83RLzzU8=;
        b=W7iYpQigraKxLvix/YEI+MoDXmgG2Eo7N2UDZeNywtFsorilxp68N/1mz0QfWM5O0I
         3ABM9zu5EcfFjPu/XpA9lJ9GZjGCGNFw5wzw4b398zRQPt7vI0ec5UWx3Zkw1OCBPXu/
         kyLTRJ1su9JtaPwdqKGk9WKCi8VvHVsXdxRJtXb47tYp2z8EnpvCsy8VgliqAehMObki
         j/vXzXSK13z9CRwbHYj8ZqwSeZdzJlwKJseQfq711qEJa0ZgrwouCNsPt1qbYKN9nIdv
         syktlrlq29/XARhsn0x08IMFoGUKxtpe+1TK+HtqNpWaouJx45cOh7GBPFNTePHtBCYg
         P+Yw==
X-Gm-Message-State: APjAAAWrnOiq5EmnKr6elSW6Kygm69FFaZXP1Mxg1vuQ6X5lVcjaFvVn
        mDraWDRr3ve1VirXocHdpm4Os97C
X-Google-Smtp-Source: APXvYqwR0ack/hElCAurAytVBd+7/v+YYhaYR1VdC2kjpzaF0grpdU0mIasTRsGQXgtId3YmLAey9g==
X-Received: by 2002:a17:902:bcc9:: with SMTP id o9mr10405132pls.65.1554434472860;
        Thu, 04 Apr 2019 20:21:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b8sm23194673pgq.33.2019.04.04.20.21.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:12 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/16] hwmon: (thmc50) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:50 -0700
Message-Id: <1554434462-6087-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554434462-6087-1-git-send-email-linux@roeck-us.net>
References: <1554434462-6087-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/thmc50.c | 83 +++++++++++++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/thmc50.c b/drivers/hwmon/thmc50.c
index 6a0ee903127e..ae9942331cae 100644
--- a/drivers/hwmon/thmc50.c
+++ b/drivers/hwmon/thmc50.c
@@ -128,16 +128,16 @@ static struct thmc50_data *thmc50_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_analog_out(struct device *dev,
+static ssize_t analog_out_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct thmc50_data *data = thmc50_update_device(dev);
 	return sprintf(buf, "%d\n", data->analog_out);
 }
 
-static ssize_t set_analog_out(struct device *dev,
-			      struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t analog_out_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	struct thmc50_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -166,14 +166,14 @@ static ssize_t set_analog_out(struct device *dev,
 }
 
 /* There is only one PWM mode = DC */
-static ssize_t show_pwm_mode(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t pwm_mode_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "0\n");
 }
 
 /* Temperatures */
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -181,16 +181,17 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", data->temp_input[nr] * 1000);
 }
 
-static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct thmc50_data *data = thmc50_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp_min[nr] * 1000);
 }
 
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct thmc50_data *data = dev_get_drvdata(dev);
@@ -210,16 +211,17 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct thmc50_data *data = thmc50_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp_max[nr] * 1000);
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct thmc50_data *data = dev_get_drvdata(dev);
@@ -239,16 +241,15 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp_critical(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buf)
+static ssize_t temp_critical_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct thmc50_data *data = thmc50_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp_critical[nr] * 1000);
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
@@ -257,29 +258,27 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
 }
 
-#define temp_reg(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO, show_temp,	\
-			NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IRUGO | S_IWUSR,	\
-			show_temp_min, set_temp_min, offset - 1);	\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
-			show_temp_max, set_temp_max, offset - 1);	\
-static SENSOR_DEVICE_ATTR(temp##offset##_crit, S_IRUGO,			\
-			show_temp_critical, NULL, offset - 1);
-
-temp_reg(1);
-temp_reg(2);
-temp_reg(3);
-
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 2);
-
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_analog_out,
-			  set_analog_out, 0);
-static SENSOR_DEVICE_ATTR(pwm1_mode, S_IRUGO, show_pwm_mode, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp_critical, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit, temp_critical, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit, temp_critical, 2);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 2);
+
+static SENSOR_DEVICE_ATTR_RW(pwm1, analog_out, 0);
+static SENSOR_DEVICE_ATTR_RO(pwm1_mode, pwm_mode, 0);
 
 static struct attribute *thmc50_attributes[] = {
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
-- 
2.7.4

