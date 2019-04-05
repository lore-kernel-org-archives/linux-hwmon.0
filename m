Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FED0C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3682820693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTvU9IHY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729697AbfDEDV3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:29 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41053 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDV2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id 188so2453248pfd.8
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rkynHgMn3nOJw2CCW4rDE2cgA5VMZYPSzujI++LWZ30=;
        b=eTvU9IHY/novxpDJ88BATt3iQk9rFbjr4Gn8CiZB56YQZXkhNNAOrynS/VI2qSrvF6
         juyqIqt1ScTtlNZFOWuKwDgcyTCCKjMiHelH0LjBjKlTQ+1NsQTID3wK3zuVUfLVMyja
         qpeJUZ61+kaynpUW4q69VQARULD8q5Q3SPof9LMnWUXeClrwHyAUeRyLSx5BbsntSWTz
         vOVlMd+OOYNYGPqQWFyKqrubvdLst9yJVkK01czU2DCKv7kiUeroZFh4oZR1BaPMkbot
         B3DIfyxMkXPtOe8VeINKqD9YoHTSucNCDVgiAzwASJvZOXGeuBl3Pank5A2dhyz4njh3
         YjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=rkynHgMn3nOJw2CCW4rDE2cgA5VMZYPSzujI++LWZ30=;
        b=JR4+GdaitHszI5ClcL7ryx/fWD8nGfTha9Nuf3r3RQdL4WnCIDTA4lq9PeiKJJzO9P
         xuCuexhvYABQiKsBc71Kqn2RDCR4JaDLmbjTQlUr01Fwfa7wS8w+8P/agxWYRTE+bNHc
         7viF/9FTPnR59ER7Tecb3DtccTNC1A6evAlkkKJc4LwmDXmYEoI+rozzKz5OQbEFkxxF
         QX5oSKzPoaRY1uxPIWZpzqZ1zw+OZKIeVF/a+pEfpRZ0NTfKhKT8IUT8XT9D0Z2KaOWt
         X06BUVxomTcFnp+UvMwD6Zn7t4dw8nwMPUzqz4rGagHw7sbEePUL3mdUjg3Lk079C64E
         EJUA==
X-Gm-Message-State: APjAAAXDwjpIQMRSrGaD+73JeFVIIOMM6E0hRxzzAClRaqxMItF3ljR6
        /HPYYu26LuXnunPfAWzCed2EGZ9T
X-Google-Smtp-Source: APXvYqwl9JzQhaGj2c+VgbvJOcyeA/FrDM0dz5KuTYKEygdJcKXe7rNhLvHAlrt/jcIykHtggrZCng==
X-Received: by 2002:a63:1203:: with SMTP id h3mr9738649pgl.164.1554434487668;
        Thu, 04 Apr 2019 20:21:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23sm29170774pfd.11.2019.04.04.20.21.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:27 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/16] hwmon: (smsc47m1) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:21:00 -0700
Message-Id: <1554434462-6087-14-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/smsc47m1.c | 78 +++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 0736ca6a3aee..5216a936f9b1 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -207,8 +207,8 @@ static struct smsc47m1_data *smsc47m1_update_device(struct device *dev,
 	return data;
 }
 
-static ssize_t get_fan(struct device *dev, struct device_attribute
-		       *devattr, char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
@@ -226,8 +226,8 @@ static ssize_t get_fan(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", rpm);
 }
 
-static ssize_t get_fan_min(struct device *dev, struct device_attribute
-			   *devattr, char *buf)
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
@@ -237,32 +237,32 @@ static ssize_t get_fan_min(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", rpm);
 }
 
-static ssize_t get_fan_div(struct device *dev, struct device_attribute
-			   *devattr, char *buf)
+static ssize_t fan_div_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->index]));
 }
 
-static ssize_t get_fan_alarm(struct device *dev, struct device_attribute
-			     *devattr, char *buf)
+static ssize_t fan_alarm_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	int bitnr = to_sensor_dev_attr(devattr)->index;
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 
-static ssize_t get_pwm(struct device *dev, struct device_attribute
-		       *devattr, char *buf)
+static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm[attr->index]));
 }
 
-static ssize_t get_pwm_en(struct device *dev, struct device_attribute
-			  *devattr, char *buf)
+static ssize_t pwm_en_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = smsc47m1_update_device(dev, 0);
@@ -276,8 +276,9 @@ static ssize_t alarms_show(struct device *dev,
 	return sprintf(buf, "%d\n", data->alarms);
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute
-			   *devattr, const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = dev_get_drvdata(dev);
@@ -312,8 +313,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute
  * of least surprise; the user doesn't expect the fan minimum to change just
  * because the divider changed.
  */
-static ssize_t set_fan_div(struct device *dev, struct device_attribute
-			   *devattr, const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = dev_get_drvdata(dev);
@@ -375,8 +377,8 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute
 	return count;
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute
-		       *devattr, const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = dev_get_drvdata(dev);
@@ -401,8 +403,9 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute
 	return count;
 }
 
-static ssize_t set_pwm_en(struct device *dev, struct device_attribute
-			  *devattr, const char *buf, size_t count)
+static ssize_t pwm_en_store(struct device *dev,
+			    struct device_attribute *devattr, const char *buf,
+			    size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct smsc47m1_data *data = dev_get_drvdata(dev);
@@ -427,23 +430,24 @@ static ssize_t set_pwm_en(struct device *dev, struct device_attribute
 	return count;
 }
 
-#define fan_present(offset)						\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO, get_fan,	\
-		NULL, offset - 1);					\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-		get_fan_min, set_fan_min, offset - 1);			\
-static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
-		get_fan_div, set_fan_div, offset - 1);			\
-static SENSOR_DEVICE_ATTR(fan##offset##_alarm, S_IRUGO, get_fan_alarm,	\
-		NULL, offset - 1);					\
-static SENSOR_DEVICE_ATTR(pwm##offset, S_IRUGO | S_IWUSR,		\
-		get_pwm, set_pwm, offset - 1);				\
-static SENSOR_DEVICE_ATTR(pwm##offset##_enable, S_IRUGO | S_IWUSR,	\
-		get_pwm_en, set_pwm_en, offset - 1)
-
-fan_present(1);
-fan_present(2);
-fan_present(3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, fan_alarm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_en, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, fan_alarm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_en, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RW(fan3_div, fan_div, 2);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, fan_alarm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_en, 2);
 
 static DEVICE_ATTR_RO(alarms);
 
-- 
2.7.4

