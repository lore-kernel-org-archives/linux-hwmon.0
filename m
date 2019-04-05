Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520B4C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F20220693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUdPtKnn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfDEDVP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40830 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id c207so2456005pfc.7
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S/HS+3Oal2Mu4vnXMiJlXO6nraqRluFwur56tkakw5Y=;
        b=XUdPtKnnOJuO3zbywmPJ72cHtJ5tsWvyhtqSGNE3h9Szohx7wUuVyEbL68dm2mG9H/
         O6vE+quPdE0Tpd16j/qiDSUBXKS1b9mx6/cma7B/IBN9wGkCB6Re2XGD5b/H7zhD6ILU
         m7IRLocRgFaYqZQRZCyoPCcH26XAnpE4FsX19LRPwAAOFsrdaxoAlAsFy7lEsszFSDuD
         9EiCDy5PTL5Hq+r7nDhM/psiFDUpdcqtkMC5QSiilLTl3ja5dem1gB40PohVLj9V2tBw
         r6Nk1wy1Hiqj4kWPds39D1TwxWki0Id0Mh4lCOaOsp2bypJjxjo4yRIyVLYH7cbcUEbn
         +t2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=S/HS+3Oal2Mu4vnXMiJlXO6nraqRluFwur56tkakw5Y=;
        b=b/ulHbw48MQ2kjnroziJCySSdd1rtekU6lJl/fUWdv57Bpi3jscEc6jvYUeLqfWJVw
         tDVWaXDgs3hn15vbOVZHSFzDnMEI49L7i7Z5KVhblzA8g2v7PtPvkwA/TRE1xPJ2IjvY
         0MDfO/J9AC09xQpDeYCU7q6p2QrR95i2qGv4NITRkTWT0S9lGx/sV4ilnPLkezl0bLPD
         BXDiFCEsxqyaOv+XLxINuOpS5BwwiPJY4mAA0Vhbz02a8TeTbJ14zfYn9jV9o90ZC3co
         MczdxD9Z+e8gi7HFUfuaJxqrtoEk2+jw8DI4ZlQ6ccyqQgDBN7YykgFoxvP+527BYV/y
         vAww==
X-Gm-Message-State: APjAAAXWF31cGg2AiaUKIkybMni4aLUzoCJiYQnJ1snsVpZYoHCu7uqe
        7NLZTOUu3xPYmwU3AZFF5vaIRCvV
X-Google-Smtp-Source: APXvYqxSp0vXi6lUc9ZPPVBEGYhxBttZ/ZmhiRZGg/3bX8aKuhSegKFNZD1AmI3NCg0ktYF5halzqw==
X-Received: by 2002:aa7:91d5:: with SMTP id z21mr9866427pfa.222.1554434474203;
        Thu, 04 Apr 2019 20:21:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1sm10898855pfo.158.2019.04.04.20.21.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:13 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/16] hwmon: (adm1031) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:51 -0700
Message-Id: <1554434462-6087-5-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adm1031.c | 201 +++++++++++++++++++++++-------------------------
 1 file changed, 97 insertions(+), 104 deletions(-)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index bcf508269fd6..6b46d8eaa775 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -331,7 +331,7 @@ get_fan_auto_nearest(struct adm1031_data *data, int chan, u8 val, u8 reg)
 	return -EINVAL;
 }
 
-static ssize_t show_fan_auto_channel(struct device *dev,
+static ssize_t fan_auto_channel_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -340,8 +340,8 @@ static ssize_t show_fan_auto_channel(struct device *dev,
 }
 
 static ssize_t
-set_fan_auto_channel(struct device *dev, struct device_attribute *attr,
-		     const char *buf, size_t count)
+fan_auto_channel_store(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -392,13 +392,11 @@ set_fan_auto_channel(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(auto_fan1_channel, S_IRUGO | S_IWUSR,
-		show_fan_auto_channel, set_fan_auto_channel, 0);
-static SENSOR_DEVICE_ATTR(auto_fan2_channel, S_IRUGO | S_IWUSR,
-		show_fan_auto_channel, set_fan_auto_channel, 1);
+static SENSOR_DEVICE_ATTR_RW(auto_fan1_channel, fan_auto_channel, 0);
+static SENSOR_DEVICE_ATTR_RW(auto_fan2_channel, fan_auto_channel, 1);
 
 /* Auto Temps */
-static ssize_t show_auto_temp_off(struct device *dev,
+static ssize_t auto_temp_off_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -406,7 +404,7 @@ static ssize_t show_auto_temp_off(struct device *dev,
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_OFF_FROM_REG(data->auto_temp[nr]));
 }
-static ssize_t show_auto_temp_min(struct device *dev,
+static ssize_t auto_temp_min_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -415,8 +413,8 @@ static ssize_t show_auto_temp_min(struct device *dev,
 		       AUTO_TEMP_MIN_FROM_REG(data->auto_temp[nr]));
 }
 static ssize_t
-set_auto_temp_min(struct device *dev, struct device_attribute *attr,
-		  const char *buf, size_t count)
+auto_temp_min_store(struct device *dev, struct device_attribute *attr,
+		    const char *buf, size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -436,7 +434,7 @@ set_auto_temp_min(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t show_auto_temp_max(struct device *dev,
+static ssize_t auto_temp_max_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -445,8 +443,8 @@ static ssize_t show_auto_temp_max(struct device *dev,
 		       AUTO_TEMP_MAX_FROM_REG(data->auto_temp[nr]));
 }
 static ssize_t
-set_auto_temp_max(struct device *dev, struct device_attribute *attr,
-		  const char *buf, size_t count)
+auto_temp_max_store(struct device *dev, struct device_attribute *attr,
+		    const char *buf, size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -468,28 +466,26 @@ set_auto_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define auto_temp_reg(offset)						\
-static SENSOR_DEVICE_ATTR(auto_temp##offset##_off, S_IRUGO,		\
-		show_auto_temp_off, NULL, offset - 1);			\
-static SENSOR_DEVICE_ATTR(auto_temp##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_auto_temp_min, set_auto_temp_min, offset - 1);	\
-static SENSOR_DEVICE_ATTR(auto_temp##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_auto_temp_max, set_auto_temp_max, offset - 1)
-
-auto_temp_reg(1);
-auto_temp_reg(2);
-auto_temp_reg(3);
+static SENSOR_DEVICE_ATTR_RO(auto_temp1_off, auto_temp_off, 0);
+static SENSOR_DEVICE_ATTR_RW(auto_temp1_min, auto_temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(auto_temp1_max, auto_temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(auto_temp2_off, auto_temp_off, 1);
+static SENSOR_DEVICE_ATTR_RW(auto_temp2_min, auto_temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(auto_temp2_max, auto_temp_max, 1);
+static SENSOR_DEVICE_ATTR_RO(auto_temp3_off, auto_temp_off, 2);
+static SENSOR_DEVICE_ATTR_RW(auto_temp3_min, auto_temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(auto_temp3_max, auto_temp_max, 2);
 
 /* pwm */
-static ssize_t show_pwm(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm[nr]));
 }
-static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -517,12 +513,10 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(auto_fan1_min_pwm, S_IRUGO | S_IWUSR,
-		show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(auto_fan2_min_pwm, S_IRUGO | S_IWUSR,
-		show_pwm, set_pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(auto_fan1_min_pwm, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(auto_fan2_min_pwm, pwm, 1);
 
 /* Fans */
 
@@ -572,9 +566,8 @@ static int trust_fan_readings(struct adm1031_data *data, int chan)
 	return res;
 }
 
-
-static ssize_t show_fan(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
@@ -585,15 +578,15 @@ static ssize_t show_fan(struct device *dev,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t show_fan_div(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", FAN_DIV_FROM_REG(data->fan_div[nr]));
 }
-static ssize_t show_fan_min(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
@@ -601,8 +594,9 @@ static ssize_t show_fan_min(struct device *dev,
 		       FAN_FROM_REG(data->fan_min[nr],
 				    FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -625,8 +619,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -673,21 +668,16 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define fan_offset(offset)						\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO,			\
-		show_fan, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-		show_fan_min, set_fan_min, offset - 1);			\
-static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
-		show_fan_div, set_fan_div, offset - 1)
-
-fan_offset(1);
-fan_offset(2);
-
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
 
 /* Temps */
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
@@ -697,7 +687,7 @@ static ssize_t show_temp(struct device *dev,
 	    (((data->ext_temp[nr] >> ((nr - 1) * 3)) & 7));
 	return sprintf(buf, "%d\n", TEMP_FROM_REG_EXT(data->temp[nr], ext));
 }
-static ssize_t show_temp_offset(struct device *dev,
+static ssize_t temp_offset_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -705,30 +695,30 @@ static ssize_t show_temp_offset(struct device *dev,
 	return sprintf(buf, "%d\n",
 		       TEMP_OFFSET_FROM_REG(data->temp_offset[nr]));
 }
-static ssize_t show_temp_min(struct device *dev,
+static ssize_t temp_min_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[nr]));
 }
-static ssize_t show_temp_max(struct device *dev,
+static ssize_t temp_max_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[nr]));
 }
-static ssize_t show_temp_crit(struct device *dev,
+static ssize_t temp_crit_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit[nr]));
 }
-static ssize_t set_temp_offset(struct device *dev,
-			       struct device_attribute *attr, const char *buf,
-			       size_t count)
+static ssize_t temp_offset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -748,8 +738,9 @@ static ssize_t set_temp_offset(struct device *dev,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -769,8 +760,9 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -790,8 +782,9 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_temp_crit(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t temp_crit_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct adm1031_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -812,21 +805,21 @@ static ssize_t set_temp_crit(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define temp_reg(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO,		\
-		show_temp, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(temp##offset##_offset, S_IRUGO | S_IWUSR,	\
-		show_temp_offset, set_temp_offset, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_temp_min, set_temp_min, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_temp_max, set_temp_max, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_crit, S_IRUGO | S_IWUSR,	\
-		show_temp_crit, set_temp_crit, offset - 1)
-
-temp_reg(1);
-temp_reg(2);
-temp_reg(3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_offset, temp_offset, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_offset, temp_offset, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp_crit, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_offset, temp_offset, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_crit, temp_crit, 2);
 
 /* Alarms */
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
@@ -838,29 +831,29 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev,
-			  struct device_attribute *attr, char *buf)
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	return sprintf(buf, "%d\n", (data->alarm >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO, show_alarm, NULL, 12);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 13);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 14);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan1_fault, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(fan2_fault, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(temp3_min_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, 12);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 13);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 14);
 
 /* Update Interval */
 static const unsigned int update_intervals[] = {
-- 
2.7.4

