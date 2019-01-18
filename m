Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62777C5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D68720850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr4BsIm7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfARRPR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:17 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34639 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:16 -0500
Received: by mail-pl1-f193.google.com with SMTP id w4so6634227plz.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WWhAuxIqxKCn5jRh1RIcA68ydjXwL5qQyEDtase0sd0=;
        b=Mr4BsIm7/9u/3bKtuyGtuCT3EkTgfpQN9juoCL9yIq4rTS5FbhEI5ZzSllnn3il9Og
         UlPhu98cKOsa0YYEK51UKXJr1BxmNlTQdxX6e7RzigofikMed/16Z+Y0q0PbfcXFIL8R
         /NK+STxtFhXn0pmPUP0ygrFOG5R2xGfL5k126D5Bs5XcTNVCofme7wygAXzGkNHiv+GU
         Cga80qbyKk+7iGF1XTTetWW6aVW76jv/0vIrksG65m/SZlHhggCHs+R2oulUl4/hhymQ
         8dhz1+67bmBL88PGVyPC6McwqZraKJlcbcMLyVSpWqmvC85+NEL6vbCEObECbnL8bxMp
         CrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=WWhAuxIqxKCn5jRh1RIcA68ydjXwL5qQyEDtase0sd0=;
        b=mpUjUeK4M0OnsmiFh3v5Ek2zWnd08WcZHdz8LkTAkxDK1Ed29ZOUVFbvvAR+T/AXgN
         SwGCvNetLfMPVHk6SwzLrU/p6JvMDFGMXGXLXcc6b7eEfAWdcbJIgX9pKSGF74m7eYFe
         iF4Jen2dMNP1pKYu7qHT++e8v/hzv7mRB7F4LqT4mAl2ZT34iAxtIbA2uez4ML8cqywn
         Ek78e9SxUdSRtiJqvfc0JGVK2j2mh8m9Fku4+ZJshD0EPcB+kKBGhMuNczUSR7v0OdID
         PjCLm8SCqvbM8xhuQUmh5WeRMbl3V7HvUuqwhiNkarf1ixy9FR6wro8omTUxW40XiWYC
         Y+iQ==
X-Gm-Message-State: AJcUukdfWxUtZPbv9AzV3dywntFeicp4w056MkpZKJfcLRY17/2UCXRO
        +Bdob2QFfueoNvoe4G/YialvdJf9
X-Google-Smtp-Source: ALg8bN53Uq5B64ng7BfNQ/zS3XbBw0ajagZKuk6pqgp/e+p/C/KEXb/SW9vqou5brRoJklajKVbkNg==
X-Received: by 2002:a17:902:7d82:: with SMTP id a2mr20051137plm.163.1547831715214;
        Fri, 18 Jan 2019 09:15:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm5980120pgl.64.2019.01.18.09.15.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:14 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/30] hwmon: (max6639) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:36 -0800
Message-Id: <1547831700-15865-7-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max6639.c | 92 +++++++++++++++++++++++--------------------------
 1 file changed, 43 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index f98a83c79ff1..fc3ed518f478 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -162,7 +162,7 @@ static struct max6639_data *max6639_update_device(struct device *dev)
 	return ret;
 }
 
-static ssize_t show_temp_input(struct device *dev,
+static ssize_t temp_input_show(struct device *dev,
 			       struct device_attribute *dev_attr, char *buf)
 {
 	long temp;
@@ -176,7 +176,7 @@ static ssize_t show_temp_input(struct device *dev,
 	return sprintf(buf, "%ld\n", temp);
 }
 
-static ssize_t show_temp_fault(struct device *dev,
+static ssize_t temp_fault_show(struct device *dev,
 			       struct device_attribute *dev_attr, char *buf)
 {
 	struct max6639_data *data = max6639_update_device(dev);
@@ -188,7 +188,7 @@ static ssize_t show_temp_fault(struct device *dev,
 	return sprintf(buf, "%d\n", data->temp_fault[attr->index]);
 }
 
-static ssize_t show_temp_max(struct device *dev,
+static ssize_t temp_max_show(struct device *dev,
 			     struct device_attribute *dev_attr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
@@ -197,9 +197,9 @@ static ssize_t show_temp_max(struct device *dev,
 	return sprintf(buf, "%d\n", (data->temp_therm[attr->index] * 1000));
 }
 
-static ssize_t set_temp_max(struct device *dev,
-			    struct device_attribute *dev_attr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *dev_attr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	struct max6639_data *data = dev_get_drvdata(dev);
@@ -220,7 +220,7 @@ static ssize_t set_temp_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_crit(struct device *dev,
+static ssize_t temp_crit_show(struct device *dev,
 			      struct device_attribute *dev_attr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
@@ -229,9 +229,9 @@ static ssize_t show_temp_crit(struct device *dev,
 	return sprintf(buf, "%d\n", (data->temp_alert[attr->index] * 1000));
 }
 
-static ssize_t set_temp_crit(struct device *dev,
-			     struct device_attribute *dev_attr,
-			     const char *buf, size_t count)
+static ssize_t temp_crit_store(struct device *dev,
+			       struct device_attribute *dev_attr,
+			       const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	struct max6639_data *data = dev_get_drvdata(dev);
@@ -252,7 +252,7 @@ static ssize_t set_temp_crit(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_emergency(struct device *dev,
+static ssize_t temp_emergency_show(struct device *dev,
 				   struct device_attribute *dev_attr,
 				   char *buf)
 {
@@ -262,9 +262,9 @@ static ssize_t show_temp_emergency(struct device *dev,
 	return sprintf(buf, "%d\n", (data->temp_ot[attr->index] * 1000));
 }
 
-static ssize_t set_temp_emergency(struct device *dev,
-				  struct device_attribute *dev_attr,
-				  const char *buf, size_t count)
+static ssize_t temp_emergency_store(struct device *dev,
+				    struct device_attribute *dev_attr,
+				    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	struct max6639_data *data = dev_get_drvdata(dev);
@@ -285,8 +285,8 @@ static ssize_t set_temp_emergency(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev,
-			struct device_attribute *dev_attr, char *buf)
+static ssize_t pwm_show(struct device *dev, struct device_attribute *dev_attr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	struct max6639_data *data = dev_get_drvdata(dev);
@@ -294,9 +294,9 @@ static ssize_t show_pwm(struct device *dev,
 	return sprintf(buf, "%d\n", data->pwm[attr->index] * 255 / 120);
 }
 
-static ssize_t set_pwm(struct device *dev,
-		       struct device_attribute *dev_attr,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev,
+			 struct device_attribute *dev_attr, const char *buf,
+			 size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
 	struct max6639_data *data = dev_get_drvdata(dev);
@@ -319,7 +319,7 @@ static ssize_t set_pwm(struct device *dev,
 	return count;
 }
 
-static ssize_t show_fan_input(struct device *dev,
+static ssize_t fan_input_show(struct device *dev,
 			      struct device_attribute *dev_attr, char *buf)
 {
 	struct max6639_data *data = max6639_update_device(dev);
@@ -332,7 +332,7 @@ static ssize_t show_fan_input(struct device *dev,
 		       data->rpm_range));
 }
 
-static ssize_t show_alarm(struct device *dev,
+static ssize_t alarm_show(struct device *dev,
 			  struct device_attribute *dev_attr, char *buf)
 {
 	struct max6639_data *data = max6639_update_device(dev);
@@ -344,34 +344,28 @@ static ssize_t show_alarm(struct device *dev,
 	return sprintf(buf, "%d\n", !!(data->status & (1 << attr->index)));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, show_temp_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_temp_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp_max,
-		set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_temp_max,
-		set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_temp_crit,
-		set_temp_crit, 0);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO, show_temp_crit,
-		set_temp_crit, 1);
-static SENSOR_DEVICE_ATTR(temp1_emergency, S_IWUSR | S_IRUGO,
-		show_temp_emergency, set_temp_emergency, 0);
-static SENSOR_DEVICE_ATTR(temp2_emergency, S_IWUSR | S_IRUGO,
-		show_temp_emergency, set_temp_emergency, 1);
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp1_emergency_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp2_emergency_alarm, S_IRUGO, show_alarm, NULL, 4);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_fault, temp_fault, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, temp_fault, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp_crit, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_emergency, temp_emergency, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_emergency, temp_emergency, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RO(fan1_fault, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(fan2_fault, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp1_emergency_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp2_emergency_alarm, alarm, 4);
 
 
 static struct attribute *max6639_attrs[] = {
-- 
2.7.4

