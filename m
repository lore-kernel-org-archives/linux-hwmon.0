Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8B9C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7210D20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwDQ/iRr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbfARRP1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:27 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35792 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRP1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:27 -0500
Received: by mail-pf1-f194.google.com with SMTP id z9so6911488pfi.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uGc5Pt2ZA3wDgVTYHsiZVBKPBJY4ypOpMhxAgMz0rLM=;
        b=XwDQ/iRrRDoleGbywC2ng1XBjIJU2Zwbl5sC2CCMi/R5E5ACP911/gnGuMD8L2f1Qi
         IANn977stiCyBKZBsqkunbpYmdWAnxuxA1F10v/uxHqe6OXLhKiJZGhc+ezUNre96Xv2
         grsnuRJNoK9ktuApE25yoW0ujv2i8cZQI8fRQWzKZ3sCkNTqaMJT4P8RvaGMhH96NqPU
         i2/jtFHKAqUxom+N0jQp5cm+rbM4+iE1ThnCN0LARm5xprKFDhspai1QRWmnIpY0Fl5Y
         kUqxpHc8wuv1kjsdDJPoismVbZsRKYa2nV0/+ZTDZqhdl8m1rA48ZPichyWN+RwKnbmf
         T59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=uGc5Pt2ZA3wDgVTYHsiZVBKPBJY4ypOpMhxAgMz0rLM=;
        b=sXdU6gS8j/msLtvN1PyZM1qsLd+g6i8fc3ZYMIBL0fgrI9gn961lGE1x5NHbWdIc7o
         d8Ncns330IDw2bDD7Z+kFtHpOnkUy71BEKSf6Hcsfa9g80gU7xv6SIoAKgZooKwP21Wo
         iGCJENdj7LLHR6k9EcnnWkUpjSN3eSVsB5xQhmQOVCPoauEGD8dF5fgRKlbNjP/UTxZF
         XCrhzmNpi6QekGtzi67VD0svbkgQYZAmrPBMZa4eFlHdK/6oZ8zlfTh1W3ADd9j9afXx
         F8GwK7eATZrdC7sjNgf1nvAqZx279VVIpf9K7mZ4UzSIwwajo+x3ihyQTpWBkKwyngUl
         IEUw==
X-Gm-Message-State: AJcUukfuYk0eMaiX4XDL5ofkvYRvKFjVIiNCZkrY8thZrDNyotpcZjZR
        t6yeUL91sjW7IhBqScmcIIueUrbZ
X-Google-Smtp-Source: ALg8bN5NIap/0eU8aAbQUKfxPMRA8fV6lrK5HvMoPvQeoj2434cC+flfWZ56re+W84QPjghH487HKw==
X-Received: by 2002:a62:e0d8:: with SMTP id d85mr19823240pfm.214.1547831724677;
        Fri, 18 Jan 2019 09:15:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e86sm7413491pfb.6.2019.01.18.09.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:24 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 12/30] hwmon: (pc87360) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:42 -0800
Message-Id: <1547831700-15865-13-git-send-email-linux@roeck-us.net>
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

Cc: Jim Cromie <jim.cromie@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pc87360.c | 427 +++++++++++++++++++++++-------------------------
 1 file changed, 204 insertions(+), 223 deletions(-)

diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
index 7e3697727537..56584f9ab803 100644
--- a/drivers/hwmon/pc87360.c
+++ b/drivers/hwmon/pc87360.c
@@ -254,7 +254,7 @@ static struct platform_driver pc87360_driver = {
  * Sysfs stuff
  */
 
-static ssize_t show_fan_input(struct device *dev,
+static ssize_t fan_input_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -262,7 +262,7 @@ static ssize_t show_fan_input(struct device *dev,
 	return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan[attr->index],
 		       FAN_DIV_FROM_REG(data->fan_status[attr->index])));
 }
-static ssize_t show_fan_min(struct device *dev,
+static ssize_t fan_min_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -270,7 +270,7 @@ static ssize_t show_fan_min(struct device *dev,
 	return sprintf(buf, "%u\n", FAN_FROM_REG(data->fan_min[attr->index],
 		       FAN_DIV_FROM_REG(data->fan_status[attr->index])));
 }
-static ssize_t show_fan_div(struct device *dev,
+static ssize_t fan_div_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -278,7 +278,7 @@ static ssize_t show_fan_div(struct device *dev,
 	return sprintf(buf, "%u\n",
 		       FAN_DIV_FROM_REG(data->fan_status[attr->index]));
 }
-static ssize_t show_fan_status(struct device *dev,
+static ssize_t fan_status_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -286,9 +286,9 @@ static ssize_t show_fan_status(struct device *dev,
 	return sprintf(buf, "%u\n",
 		       FAN_STATUS_FROM_REG(data->fan_status[attr->index]));
 }
-static ssize_t set_fan_min(struct device *dev,
-			   struct device_attribute *devattr, const char *buf,
-	size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -325,24 +325,24 @@ static ssize_t set_fan_min(struct device *dev,
 }
 
 static struct sensor_device_attribute fan_input[] = {
-	SENSOR_ATTR(fan1_input, S_IRUGO, show_fan_input, NULL, 0),
-	SENSOR_ATTR(fan2_input, S_IRUGO, show_fan_input, NULL, 1),
-	SENSOR_ATTR(fan3_input, S_IRUGO, show_fan_input, NULL, 2),
+	SENSOR_ATTR_RO(fan1_input, fan_input, 0),
+	SENSOR_ATTR_RO(fan2_input, fan_input, 1),
+	SENSOR_ATTR_RO(fan3_input, fan_input, 2),
 };
 static struct sensor_device_attribute fan_status[] = {
-	SENSOR_ATTR(fan1_status, S_IRUGO, show_fan_status, NULL, 0),
-	SENSOR_ATTR(fan2_status, S_IRUGO, show_fan_status, NULL, 1),
-	SENSOR_ATTR(fan3_status, S_IRUGO, show_fan_status, NULL, 2),
+	SENSOR_ATTR_RO(fan1_status, fan_status, 0),
+	SENSOR_ATTR_RO(fan2_status, fan_status, 1),
+	SENSOR_ATTR_RO(fan3_status, fan_status, 2),
 };
 static struct sensor_device_attribute fan_div[] = {
-	SENSOR_ATTR(fan1_div, S_IRUGO, show_fan_div, NULL, 0),
-	SENSOR_ATTR(fan2_div, S_IRUGO, show_fan_div, NULL, 1),
-	SENSOR_ATTR(fan3_div, S_IRUGO, show_fan_div, NULL, 2),
+	SENSOR_ATTR_RO(fan1_div, fan_div, 0),
+	SENSOR_ATTR_RO(fan2_div, fan_div, 1),
+	SENSOR_ATTR_RO(fan3_div, fan_div, 2),
 };
 static struct sensor_device_attribute fan_min[] = {
-	SENSOR_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min, set_fan_min, 0),
-	SENSOR_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min, set_fan_min, 1),
-	SENSOR_ATTR(fan3_min, S_IWUSR | S_IRUGO, show_fan_min, set_fan_min, 2),
+	SENSOR_ATTR_RW(fan1_min, fan_min, 0),
+	SENSOR_ATTR_RW(fan2_min, fan_min, 1),
+	SENSOR_ATTR_RW(fan3_min, fan_min, 2),
 };
 
 #define FAN_UNIT_ATTRS(X)		\
@@ -353,7 +353,7 @@ static struct sensor_device_attribute fan_min[] = {
 	NULL				\
 }
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *devattr,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -363,8 +363,8 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *devattr,
 				    FAN_CONFIG_INVERT(data->fan_conf,
 						      attr->index)));
 }
-static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -385,9 +385,9 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
 }
 
 static struct sensor_device_attribute pwm[] = {
-	SENSOR_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 0),
-	SENSOR_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1),
-	SENSOR_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2),
+	SENSOR_ATTR_RW(pwm1, pwm, 0),
+	SENSOR_ATTR_RW(pwm2, pwm, 1),
+	SENSOR_ATTR_RW(pwm3, pwm, 2),
 };
 
 static struct attribute *pc8736x_fan_attr[][5] = {
@@ -402,7 +402,7 @@ static const struct attribute_group pc8736x_fan_attr_group[] = {
 	{ .attrs = pc8736x_fan_attr[2], },
 };
 
-static ssize_t show_in_input(struct device *dev,
+static ssize_t in_input_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -410,7 +410,7 @@ static ssize_t show_in_input(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
 		       data->in_vref));
 }
-static ssize_t show_in_min(struct device *dev,
+static ssize_t in_min_show(struct device *dev,
 			   struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -418,7 +418,7 @@ static ssize_t show_in_min(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index],
 		       data->in_vref));
 }
-static ssize_t show_in_max(struct device *dev,
+static ssize_t in_max_show(struct device *dev,
 			   struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -426,15 +426,16 @@ static ssize_t show_in_max(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index],
 		       data->in_vref));
 }
-static ssize_t show_in_status(struct device *dev,
+static ssize_t in_status_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = pc87360_update_device(dev);
 	return sprintf(buf, "%u\n", data->in_status[attr->index]);
 }
-static ssize_t set_in_min(struct device *dev, struct device_attribute *devattr,
-			  const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev,
+			    struct device_attribute *devattr, const char *buf,
+			    size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -452,8 +453,9 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *devattr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_in_max(struct device *dev, struct device_attribute *devattr,
-			  const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev,
+			    struct device_attribute *devattr, const char *buf,
+			    size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -474,56 +476,56 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *devattr,
 }
 
 static struct sensor_device_attribute in_input[] = {
-	SENSOR_ATTR(in0_input, S_IRUGO, show_in_input, NULL, 0),
-	SENSOR_ATTR(in1_input, S_IRUGO, show_in_input, NULL, 1),
-	SENSOR_ATTR(in2_input, S_IRUGO, show_in_input, NULL, 2),
-	SENSOR_ATTR(in3_input, S_IRUGO, show_in_input, NULL, 3),
-	SENSOR_ATTR(in4_input, S_IRUGO, show_in_input, NULL, 4),
-	SENSOR_ATTR(in5_input, S_IRUGO, show_in_input, NULL, 5),
-	SENSOR_ATTR(in6_input, S_IRUGO, show_in_input, NULL, 6),
-	SENSOR_ATTR(in7_input, S_IRUGO, show_in_input, NULL, 7),
-	SENSOR_ATTR(in8_input, S_IRUGO, show_in_input, NULL, 8),
-	SENSOR_ATTR(in9_input, S_IRUGO, show_in_input, NULL, 9),
-	SENSOR_ATTR(in10_input, S_IRUGO, show_in_input, NULL, 10),
+	SENSOR_ATTR_RO(in0_input, in_input, 0),
+	SENSOR_ATTR_RO(in1_input, in_input, 1),
+	SENSOR_ATTR_RO(in2_input, in_input, 2),
+	SENSOR_ATTR_RO(in3_input, in_input, 3),
+	SENSOR_ATTR_RO(in4_input, in_input, 4),
+	SENSOR_ATTR_RO(in5_input, in_input, 5),
+	SENSOR_ATTR_RO(in6_input, in_input, 6),
+	SENSOR_ATTR_RO(in7_input, in_input, 7),
+	SENSOR_ATTR_RO(in8_input, in_input, 8),
+	SENSOR_ATTR_RO(in9_input, in_input, 9),
+	SENSOR_ATTR_RO(in10_input, in_input, 10),
 };
 static struct sensor_device_attribute in_status[] = {
-	SENSOR_ATTR(in0_status, S_IRUGO, show_in_status, NULL, 0),
-	SENSOR_ATTR(in1_status, S_IRUGO, show_in_status, NULL, 1),
-	SENSOR_ATTR(in2_status, S_IRUGO, show_in_status, NULL, 2),
-	SENSOR_ATTR(in3_status, S_IRUGO, show_in_status, NULL, 3),
-	SENSOR_ATTR(in4_status, S_IRUGO, show_in_status, NULL, 4),
-	SENSOR_ATTR(in5_status, S_IRUGO, show_in_status, NULL, 5),
-	SENSOR_ATTR(in6_status, S_IRUGO, show_in_status, NULL, 6),
-	SENSOR_ATTR(in7_status, S_IRUGO, show_in_status, NULL, 7),
-	SENSOR_ATTR(in8_status, S_IRUGO, show_in_status, NULL, 8),
-	SENSOR_ATTR(in9_status, S_IRUGO, show_in_status, NULL, 9),
-	SENSOR_ATTR(in10_status, S_IRUGO, show_in_status, NULL, 10),
+	SENSOR_ATTR_RO(in0_status, in_status, 0),
+	SENSOR_ATTR_RO(in1_status, in_status, 1),
+	SENSOR_ATTR_RO(in2_status, in_status, 2),
+	SENSOR_ATTR_RO(in3_status, in_status, 3),
+	SENSOR_ATTR_RO(in4_status, in_status, 4),
+	SENSOR_ATTR_RO(in5_status, in_status, 5),
+	SENSOR_ATTR_RO(in6_status, in_status, 6),
+	SENSOR_ATTR_RO(in7_status, in_status, 7),
+	SENSOR_ATTR_RO(in8_status, in_status, 8),
+	SENSOR_ATTR_RO(in9_status, in_status, 9),
+	SENSOR_ATTR_RO(in10_status, in_status, 10),
 };
 static struct sensor_device_attribute in_min[] = {
-	SENSOR_ATTR(in0_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 0),
-	SENSOR_ATTR(in1_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 1),
-	SENSOR_ATTR(in2_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 2),
-	SENSOR_ATTR(in3_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 3),
-	SENSOR_ATTR(in4_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 4),
-	SENSOR_ATTR(in5_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 5),
-	SENSOR_ATTR(in6_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 6),
-	SENSOR_ATTR(in7_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 7),
-	SENSOR_ATTR(in8_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 8),
-	SENSOR_ATTR(in9_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 9),
-	SENSOR_ATTR(in10_min, S_IWUSR | S_IRUGO, show_in_min, set_in_min, 10),
+	SENSOR_ATTR_RW(in0_min, in_min, 0),
+	SENSOR_ATTR_RW(in1_min, in_min, 1),
+	SENSOR_ATTR_RW(in2_min, in_min, 2),
+	SENSOR_ATTR_RW(in3_min, in_min, 3),
+	SENSOR_ATTR_RW(in4_min, in_min, 4),
+	SENSOR_ATTR_RW(in5_min, in_min, 5),
+	SENSOR_ATTR_RW(in6_min, in_min, 6),
+	SENSOR_ATTR_RW(in7_min, in_min, 7),
+	SENSOR_ATTR_RW(in8_min, in_min, 8),
+	SENSOR_ATTR_RW(in9_min, in_min, 9),
+	SENSOR_ATTR_RW(in10_min, in_min, 10),
 };
 static struct sensor_device_attribute in_max[] = {
-	SENSOR_ATTR(in0_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 0),
-	SENSOR_ATTR(in1_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 1),
-	SENSOR_ATTR(in2_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 2),
-	SENSOR_ATTR(in3_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 3),
-	SENSOR_ATTR(in4_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 4),
-	SENSOR_ATTR(in5_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 5),
-	SENSOR_ATTR(in6_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 6),
-	SENSOR_ATTR(in7_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 7),
-	SENSOR_ATTR(in8_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 8),
-	SENSOR_ATTR(in9_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 9),
-	SENSOR_ATTR(in10_max, S_IWUSR | S_IRUGO, show_in_max, set_in_max, 10),
+	SENSOR_ATTR_RW(in0_max, in_max, 0),
+	SENSOR_ATTR_RW(in1_max, in_max, 1),
+	SENSOR_ATTR_RW(in2_max, in_max, 2),
+	SENSOR_ATTR_RW(in3_max, in_max, 3),
+	SENSOR_ATTR_RW(in4_max, in_max, 4),
+	SENSOR_ATTR_RW(in5_max, in_max, 5),
+	SENSOR_ATTR_RW(in6_max, in_max, 6),
+	SENSOR_ATTR_RW(in7_max, in_max, 7),
+	SENSOR_ATTR_RW(in8_max, in_max, 8),
+	SENSOR_ATTR_RW(in9_max, in_max, 9),
+	SENSOR_ATTR_RW(in10_max, in_max, 10),
 };
 
 /* (temp & vin) channel status register alarm bits (pdf sec.11.5.12) */
@@ -537,16 +539,16 @@ static struct sensor_device_attribute in_max[] = {
  * 11.5.2) that (legacy) show_in_alarm() resds (via data->in_alarms)
  */
 
-static ssize_t show_in_min_alarm(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t in_min_alarm_show(struct device *dev,
+				 struct device_attribute *devattr, char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
 
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MIN));
 }
-static ssize_t show_in_max_alarm(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t in_max_alarm_show(struct device *dev,
+				 struct device_attribute *devattr, char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
@@ -555,30 +557,30 @@ static ssize_t show_in_max_alarm(struct device *dev,
 }
 
 static struct sensor_device_attribute in_min_alarm[] = {
-	SENSOR_ATTR(in0_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 0),
-	SENSOR_ATTR(in1_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 1),
-	SENSOR_ATTR(in2_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 2),
-	SENSOR_ATTR(in3_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 3),
-	SENSOR_ATTR(in4_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 4),
-	SENSOR_ATTR(in5_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 5),
-	SENSOR_ATTR(in6_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 6),
-	SENSOR_ATTR(in7_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 7),
-	SENSOR_ATTR(in8_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 8),
-	SENSOR_ATTR(in9_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 9),
-	SENSOR_ATTR(in10_min_alarm, S_IRUGO, show_in_min_alarm, NULL, 10),
+	SENSOR_ATTR_RO(in0_min_alarm, in_min_alarm, 0),
+	SENSOR_ATTR_RO(in1_min_alarm, in_min_alarm, 1),
+	SENSOR_ATTR_RO(in2_min_alarm, in_min_alarm, 2),
+	SENSOR_ATTR_RO(in3_min_alarm, in_min_alarm, 3),
+	SENSOR_ATTR_RO(in4_min_alarm, in_min_alarm, 4),
+	SENSOR_ATTR_RO(in5_min_alarm, in_min_alarm, 5),
+	SENSOR_ATTR_RO(in6_min_alarm, in_min_alarm, 6),
+	SENSOR_ATTR_RO(in7_min_alarm, in_min_alarm, 7),
+	SENSOR_ATTR_RO(in8_min_alarm, in_min_alarm, 8),
+	SENSOR_ATTR_RO(in9_min_alarm, in_min_alarm, 9),
+	SENSOR_ATTR_RO(in10_min_alarm, in_min_alarm, 10),
 };
 static struct sensor_device_attribute in_max_alarm[] = {
-	SENSOR_ATTR(in0_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 0),
-	SENSOR_ATTR(in1_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 1),
-	SENSOR_ATTR(in2_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 2),
-	SENSOR_ATTR(in3_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 3),
-	SENSOR_ATTR(in4_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 4),
-	SENSOR_ATTR(in5_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 5),
-	SENSOR_ATTR(in6_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 6),
-	SENSOR_ATTR(in7_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 7),
-	SENSOR_ATTR(in8_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 8),
-	SENSOR_ATTR(in9_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 9),
-	SENSOR_ATTR(in10_max_alarm, S_IRUGO, show_in_max_alarm, NULL, 10),
+	SENSOR_ATTR_RO(in0_max_alarm, in_max_alarm, 0),
+	SENSOR_ATTR_RO(in1_max_alarm, in_max_alarm, 1),
+	SENSOR_ATTR_RO(in2_max_alarm, in_max_alarm, 2),
+	SENSOR_ATTR_RO(in3_max_alarm, in_max_alarm, 3),
+	SENSOR_ATTR_RO(in4_max_alarm, in_max_alarm, 4),
+	SENSOR_ATTR_RO(in5_max_alarm, in_max_alarm, 5),
+	SENSOR_ATTR_RO(in6_max_alarm, in_max_alarm, 6),
+	SENSOR_ATTR_RO(in7_max_alarm, in_max_alarm, 7),
+	SENSOR_ATTR_RO(in8_max_alarm, in_max_alarm, 8),
+	SENSOR_ATTR_RO(in9_max_alarm, in_max_alarm, 9),
+	SENSOR_ATTR_RO(in10_max_alarm, in_max_alarm, 10),
 };
 
 #define VIN_UNIT_ATTRS(X) \
@@ -651,7 +653,7 @@ static const struct attribute_group pc8736x_vin_group = {
 	.attrs = pc8736x_vin_attr_array,
 };
 
-static ssize_t show_therm_input(struct device *dev,
+static ssize_t therm_input_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -659,7 +661,7 @@ static ssize_t show_therm_input(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in[attr->index],
 		       data->in_vref));
 }
-static ssize_t show_therm_min(struct device *dev,
+static ssize_t therm_min_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -667,7 +669,7 @@ static ssize_t show_therm_min(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[attr->index],
 		       data->in_vref));
 }
-static ssize_t show_therm_max(struct device *dev,
+static ssize_t therm_max_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -675,7 +677,7 @@ static ssize_t show_therm_max(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[attr->index],
 		       data->in_vref));
 }
-static ssize_t show_therm_crit(struct device *dev,
+static ssize_t therm_crit_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -683,7 +685,7 @@ static ssize_t show_therm_crit(struct device *dev,
 	return sprintf(buf, "%u\n", IN_FROM_REG(data->in_crit[attr->index-11],
 		       data->in_vref));
 }
-static ssize_t show_therm_status(struct device *dev,
+static ssize_t therm_status_show(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -691,9 +693,9 @@ static ssize_t show_therm_status(struct device *dev,
 	return sprintf(buf, "%u\n", data->in_status[attr->index]);
 }
 
-static ssize_t set_therm_min(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+static ssize_t therm_min_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -712,9 +714,9 @@ static ssize_t set_therm_min(struct device *dev,
 	return count;
 }
 
-static ssize_t set_therm_max(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+static ssize_t therm_max_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -732,9 +734,9 @@ static ssize_t set_therm_max(struct device *dev,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_therm_crit(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static ssize_t therm_crit_store(struct device *dev,
+				struct device_attribute *devattr,
+				const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -758,38 +760,29 @@ static ssize_t set_therm_crit(struct device *dev,
  * used in the chip to measure voltage across the thermistors
  */
 static struct sensor_device_attribute therm_input[] = {
-	SENSOR_ATTR(temp4_input, S_IRUGO, show_therm_input, NULL, 0 + 11),
-	SENSOR_ATTR(temp5_input, S_IRUGO, show_therm_input, NULL, 1 + 11),
-	SENSOR_ATTR(temp6_input, S_IRUGO, show_therm_input, NULL, 2 + 11),
+	SENSOR_ATTR_RO(temp4_input, therm_input, 0 + 11),
+	SENSOR_ATTR_RO(temp5_input, therm_input, 1 + 11),
+	SENSOR_ATTR_RO(temp6_input, therm_input, 2 + 11),
 };
 static struct sensor_device_attribute therm_status[] = {
-	SENSOR_ATTR(temp4_status, S_IRUGO, show_therm_status, NULL, 0 + 11),
-	SENSOR_ATTR(temp5_status, S_IRUGO, show_therm_status, NULL, 1 + 11),
-	SENSOR_ATTR(temp6_status, S_IRUGO, show_therm_status, NULL, 2 + 11),
+	SENSOR_ATTR_RO(temp4_status, therm_status, 0 + 11),
+	SENSOR_ATTR_RO(temp5_status, therm_status, 1 + 11),
+	SENSOR_ATTR_RO(temp6_status, therm_status, 2 + 11),
 };
 static struct sensor_device_attribute therm_min[] = {
-	SENSOR_ATTR(temp4_min, S_IRUGO | S_IWUSR,
-		    show_therm_min, set_therm_min, 0 + 11),
-	SENSOR_ATTR(temp5_min, S_IRUGO | S_IWUSR,
-		    show_therm_min, set_therm_min, 1 + 11),
-	SENSOR_ATTR(temp6_min, S_IRUGO | S_IWUSR,
-		    show_therm_min, set_therm_min, 2 + 11),
+	SENSOR_ATTR_RW(temp4_min, therm_min, 0 + 11),
+	SENSOR_ATTR_RW(temp5_min, therm_min, 1 + 11),
+	SENSOR_ATTR_RW(temp6_min, therm_min, 2 + 11),
 };
 static struct sensor_device_attribute therm_max[] = {
-	SENSOR_ATTR(temp4_max, S_IRUGO | S_IWUSR,
-		    show_therm_max, set_therm_max, 0 + 11),
-	SENSOR_ATTR(temp5_max, S_IRUGO | S_IWUSR,
-		    show_therm_max, set_therm_max, 1 + 11),
-	SENSOR_ATTR(temp6_max, S_IRUGO | S_IWUSR,
-		    show_therm_max, set_therm_max, 2 + 11),
+	SENSOR_ATTR_RW(temp4_max, therm_max, 0 + 11),
+	SENSOR_ATTR_RW(temp5_max, therm_max, 1 + 11),
+	SENSOR_ATTR_RW(temp6_max, therm_max, 2 + 11),
 };
 static struct sensor_device_attribute therm_crit[] = {
-	SENSOR_ATTR(temp4_crit, S_IRUGO | S_IWUSR,
-		    show_therm_crit, set_therm_crit, 0 + 11),
-	SENSOR_ATTR(temp5_crit, S_IRUGO | S_IWUSR,
-		    show_therm_crit, set_therm_crit, 1 + 11),
-	SENSOR_ATTR(temp6_crit, S_IRUGO | S_IWUSR,
-		    show_therm_crit, set_therm_crit, 2 + 11),
+	SENSOR_ATTR_RW(temp4_crit, therm_crit, 0 + 11),
+	SENSOR_ATTR_RW(temp5_crit, therm_crit, 1 + 11),
+	SENSOR_ATTR_RW(temp6_crit, therm_crit, 2 + 11),
 };
 
 /*
@@ -797,24 +790,27 @@ static struct sensor_device_attribute therm_crit[] = {
  * status register (sec 11.5.12)
  */
 
-static ssize_t show_therm_min_alarm(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static ssize_t therm_min_alarm_show(struct device *dev,
+				    struct device_attribute *devattr,
+				    char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
 
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MIN));
 }
-static ssize_t show_therm_max_alarm(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static ssize_t therm_max_alarm_show(struct device *dev,
+				    struct device_attribute *devattr,
+				    char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
 
 	return sprintf(buf, "%u\n", !!(data->in_status[nr] & CHAN_ALM_MAX));
 }
-static ssize_t show_therm_crit_alarm(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static ssize_t therm_crit_alarm_show(struct device *dev,
+				     struct device_attribute *devattr,
+				     char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
@@ -823,28 +819,19 @@ static ssize_t show_therm_crit_alarm(struct device *dev,
 }
 
 static struct sensor_device_attribute therm_min_alarm[] = {
-	SENSOR_ATTR(temp4_min_alarm, S_IRUGO,
-		    show_therm_min_alarm, NULL, 0 + 11),
-	SENSOR_ATTR(temp5_min_alarm, S_IRUGO,
-		    show_therm_min_alarm, NULL, 1 + 11),
-	SENSOR_ATTR(temp6_min_alarm, S_IRUGO,
-		    show_therm_min_alarm, NULL, 2 + 11),
+	SENSOR_ATTR_RO(temp4_min_alarm, therm_min_alarm, 0 + 11),
+	SENSOR_ATTR_RO(temp5_min_alarm, therm_min_alarm, 1 + 11),
+	SENSOR_ATTR_RO(temp6_min_alarm, therm_min_alarm, 2 + 11),
 };
 static struct sensor_device_attribute therm_max_alarm[] = {
-	SENSOR_ATTR(temp4_max_alarm, S_IRUGO,
-		    show_therm_max_alarm, NULL, 0 + 11),
-	SENSOR_ATTR(temp5_max_alarm, S_IRUGO,
-		    show_therm_max_alarm, NULL, 1 + 11),
-	SENSOR_ATTR(temp6_max_alarm, S_IRUGO,
-		    show_therm_max_alarm, NULL, 2 + 11),
+	SENSOR_ATTR_RO(temp4_max_alarm, therm_max_alarm, 0 + 11),
+	SENSOR_ATTR_RO(temp5_max_alarm, therm_max_alarm, 1 + 11),
+	SENSOR_ATTR_RO(temp6_max_alarm, therm_max_alarm, 2 + 11),
 };
 static struct sensor_device_attribute therm_crit_alarm[] = {
-	SENSOR_ATTR(temp4_crit_alarm, S_IRUGO,
-		    show_therm_crit_alarm, NULL, 0 + 11),
-	SENSOR_ATTR(temp5_crit_alarm, S_IRUGO,
-		    show_therm_crit_alarm, NULL, 1 + 11),
-	SENSOR_ATTR(temp6_crit_alarm, S_IRUGO,
-		    show_therm_crit_alarm, NULL, 2 + 11),
+	SENSOR_ATTR_RO(temp4_crit_alarm, therm_crit_alarm, 0 + 11),
+	SENSOR_ATTR_RO(temp5_crit_alarm, therm_crit_alarm, 1 + 11),
+	SENSOR_ATTR_RO(temp6_crit_alarm, therm_crit_alarm, 2 + 11),
 };
 
 #define THERM_UNIT_ATTRS(X) \
@@ -867,7 +854,7 @@ static const struct attribute_group pc8736x_therm_group = {
 	.attrs = pc8736x_therm_attr_array,
 };
 
-static ssize_t show_temp_input(struct device *dev,
+static ssize_t temp_input_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -875,7 +862,7 @@ static ssize_t show_temp_input(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t show_temp_min(struct device *dev,
+static ssize_t temp_min_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -883,7 +870,7 @@ static ssize_t show_temp_min(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[attr->index]));
 }
 
-static ssize_t show_temp_max(struct device *dev,
+static ssize_t temp_max_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -891,7 +878,7 @@ static ssize_t show_temp_max(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[attr->index]));
 }
 
-static ssize_t show_temp_crit(struct device *dev,
+static ssize_t temp_crit_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -900,7 +887,7 @@ static ssize_t show_temp_crit(struct device *dev,
 		       TEMP_FROM_REG(data->temp_crit[attr->index]));
 }
 
-static ssize_t show_temp_status(struct device *dev,
+static ssize_t temp_status_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -908,9 +895,9 @@ static ssize_t show_temp_status(struct device *dev,
 	return sprintf(buf, "%d\n", data->temp_status[attr->index]);
 }
 
-static ssize_t set_temp_min(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -929,9 +916,9 @@ static ssize_t set_temp_min(struct device *dev,
 	return count;
 }
 
-static ssize_t set_temp_max(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -950,9 +937,9 @@ static ssize_t set_temp_max(struct device *dev,
 	return count;
 }
 
-static ssize_t set_temp_crit(struct device *dev,
-			     struct device_attribute *devattr, const char *buf,
-			     size_t count)
+static ssize_t temp_crit_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct pc87360_data *data = dev_get_drvdata(dev);
@@ -972,38 +959,29 @@ static ssize_t set_temp_crit(struct device *dev,
 }
 
 static struct sensor_device_attribute temp_input[] = {
-	SENSOR_ATTR(temp1_input, S_IRUGO, show_temp_input, NULL, 0),
-	SENSOR_ATTR(temp2_input, S_IRUGO, show_temp_input, NULL, 1),
-	SENSOR_ATTR(temp3_input, S_IRUGO, show_temp_input, NULL, 2),
+	SENSOR_ATTR_RO(temp1_input, temp_input, 0),
+	SENSOR_ATTR_RO(temp2_input, temp_input, 1),
+	SENSOR_ATTR_RO(temp3_input, temp_input, 2),
 };
 static struct sensor_device_attribute temp_status[] = {
-	SENSOR_ATTR(temp1_status, S_IRUGO, show_temp_status, NULL, 0),
-	SENSOR_ATTR(temp2_status, S_IRUGO, show_temp_status, NULL, 1),
-	SENSOR_ATTR(temp3_status, S_IRUGO, show_temp_status, NULL, 2),
+	SENSOR_ATTR_RO(temp1_status, temp_status, 0),
+	SENSOR_ATTR_RO(temp2_status, temp_status, 1),
+	SENSOR_ATTR_RO(temp3_status, temp_status, 2),
 };
 static struct sensor_device_attribute temp_min[] = {
-	SENSOR_ATTR(temp1_min, S_IRUGO | S_IWUSR,
-		    show_temp_min, set_temp_min, 0),
-	SENSOR_ATTR(temp2_min, S_IRUGO | S_IWUSR,
-		    show_temp_min, set_temp_min, 1),
-	SENSOR_ATTR(temp3_min, S_IRUGO | S_IWUSR,
-		    show_temp_min, set_temp_min, 2),
+	SENSOR_ATTR_RW(temp1_min, temp_min, 0),
+	SENSOR_ATTR_RW(temp2_min, temp_min, 1),
+	SENSOR_ATTR_RW(temp3_min, temp_min, 2),
 };
 static struct sensor_device_attribute temp_max[] = {
-	SENSOR_ATTR(temp1_max, S_IRUGO | S_IWUSR,
-		    show_temp_max, set_temp_max, 0),
-	SENSOR_ATTR(temp2_max, S_IRUGO | S_IWUSR,
-		    show_temp_max, set_temp_max, 1),
-	SENSOR_ATTR(temp3_max, S_IRUGO | S_IWUSR,
-		    show_temp_max, set_temp_max, 2),
+	SENSOR_ATTR_RW(temp1_max, temp_max, 0),
+	SENSOR_ATTR_RW(temp2_max, temp_max, 1),
+	SENSOR_ATTR_RW(temp3_max, temp_max, 2),
 };
 static struct sensor_device_attribute temp_crit[] = {
-	SENSOR_ATTR(temp1_crit, S_IRUGO | S_IWUSR,
-		    show_temp_crit, set_temp_crit, 0),
-	SENSOR_ATTR(temp2_crit, S_IRUGO | S_IWUSR,
-		    show_temp_crit, set_temp_crit, 1),
-	SENSOR_ATTR(temp3_crit, S_IRUGO | S_IWUSR,
-		    show_temp_crit, set_temp_crit, 2),
+	SENSOR_ATTR_RW(temp1_crit, temp_crit, 0),
+	SENSOR_ATTR_RW(temp2_crit, temp_crit, 1),
+	SENSOR_ATTR_RW(temp3_crit, temp_crit, 2),
 };
 
 static ssize_t alarms_temp_show(struct device *dev,
@@ -1021,8 +999,9 @@ static DEVICE_ATTR_RO(alarms_temp);
  * 12.3.2) that show_temp_alarm() reads (via data->temp_alarms)
  */
 
-static ssize_t show_temp_min_alarm(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t temp_min_alarm_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
@@ -1030,8 +1009,9 @@ static ssize_t show_temp_min_alarm(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & CHAN_ALM_MIN));
 }
 
-static ssize_t show_temp_max_alarm(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t temp_max_alarm_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
@@ -1039,8 +1019,9 @@ static ssize_t show_temp_max_alarm(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & CHAN_ALM_MAX));
 }
 
-static ssize_t show_temp_crit_alarm(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t temp_crit_alarm_show(struct device *dev,
+				    struct device_attribute *devattr,
+				    char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
@@ -1049,26 +1030,26 @@ static ssize_t show_temp_crit_alarm(struct device *dev,
 }
 
 static struct sensor_device_attribute temp_min_alarm[] = {
-	SENSOR_ATTR(temp1_min_alarm, S_IRUGO, show_temp_min_alarm, NULL, 0),
-	SENSOR_ATTR(temp2_min_alarm, S_IRUGO, show_temp_min_alarm, NULL, 1),
-	SENSOR_ATTR(temp3_min_alarm, S_IRUGO, show_temp_min_alarm, NULL, 2),
+	SENSOR_ATTR_RO(temp1_min_alarm, temp_min_alarm, 0),
+	SENSOR_ATTR_RO(temp2_min_alarm, temp_min_alarm, 1),
+	SENSOR_ATTR_RO(temp3_min_alarm, temp_min_alarm, 2),
 };
 
 static struct sensor_device_attribute temp_max_alarm[] = {
-	SENSOR_ATTR(temp1_max_alarm, S_IRUGO, show_temp_max_alarm, NULL, 0),
-	SENSOR_ATTR(temp2_max_alarm, S_IRUGO, show_temp_max_alarm, NULL, 1),
-	SENSOR_ATTR(temp3_max_alarm, S_IRUGO, show_temp_max_alarm, NULL, 2),
+	SENSOR_ATTR_RO(temp1_max_alarm, temp_max_alarm, 0),
+	SENSOR_ATTR_RO(temp2_max_alarm, temp_max_alarm, 1),
+	SENSOR_ATTR_RO(temp3_max_alarm, temp_max_alarm, 2),
 };
 
 static struct sensor_device_attribute temp_crit_alarm[] = {
-	SENSOR_ATTR(temp1_crit_alarm, S_IRUGO, show_temp_crit_alarm, NULL, 0),
-	SENSOR_ATTR(temp2_crit_alarm, S_IRUGO, show_temp_crit_alarm, NULL, 1),
-	SENSOR_ATTR(temp3_crit_alarm, S_IRUGO, show_temp_crit_alarm, NULL, 2),
+	SENSOR_ATTR_RO(temp1_crit_alarm, temp_crit_alarm, 0),
+	SENSOR_ATTR_RO(temp2_crit_alarm, temp_crit_alarm, 1),
+	SENSOR_ATTR_RO(temp3_crit_alarm, temp_crit_alarm, 2),
 };
 
 #define TEMP_FAULT	0x40	/* open diode */
-static ssize_t show_temp_fault(struct device *dev,
-			struct device_attribute *devattr, char *buf)
+static ssize_t temp_fault_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct pc87360_data *data = pc87360_update_device(dev);
 	unsigned nr = to_sensor_dev_attr(devattr)->index;
@@ -1076,9 +1057,9 @@ static ssize_t show_temp_fault(struct device *dev,
 	return sprintf(buf, "%u\n", !!(data->temp_status[nr] & TEMP_FAULT));
 }
 static struct sensor_device_attribute temp_fault[] = {
-	SENSOR_ATTR(temp1_fault, S_IRUGO, show_temp_fault, NULL, 0),
-	SENSOR_ATTR(temp2_fault, S_IRUGO, show_temp_fault, NULL, 1),
-	SENSOR_ATTR(temp3_fault, S_IRUGO, show_temp_fault, NULL, 2),
+	SENSOR_ATTR_RO(temp1_fault, temp_fault, 0),
+	SENSOR_ATTR_RO(temp2_fault, temp_fault, 1),
+	SENSOR_ATTR_RO(temp3_fault, temp_fault, 2),
 };
 
 #define TEMP_UNIT_ATTRS(X)			\
-- 
2.7.4

