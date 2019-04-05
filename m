Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0ECC4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E0D220693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENzPjQyh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbfDEDVM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42876 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbfDEDVM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id w25so1002499pfi.9
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/06kcZ8v/Yg+nN1VA8W6fgwHhO5JejKm8rwJdYXoq2E=;
        b=ENzPjQyhLEqW/x4f8diTTb4lIhsO2pv3qLxzLUW/OFNFrQc5dcoxOucVYDzdniXSAX
         W3n1btB4ypTmV9/EessAJjhkAIEhYdQqd5uHU8+UwRwQmETKsfPJ6Iv4YBrblCtVoQxN
         1zmqz8PqecEhXZ3/5MegDOmDq80Dtnh17uWsI861AzjNjjnRpTsIZvNLlcJOyV8jPjs6
         eJuRshsN65NK4K3n585PB6rq0R5hdyaBW4NTJ+M1hjmpalGgEu0jQSLkfYDvrW9bdTIe
         04E33tDumXR7S8Svka17Qan9d1hBZc4sy9O+RVPLaWKYkzvCm7q/Rb96x2h8lMZZpyeo
         ft+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=/06kcZ8v/Yg+nN1VA8W6fgwHhO5JejKm8rwJdYXoq2E=;
        b=geRnHlmJlPhOCMrk7r8QeAOsTALLmJilrEYJKl0aTQWRLYFWlE4wtWQt8UFKvggZ5X
         TdQW97+oz5RzQpFa3rDW/u1w8FBg+occkvpY7FueVXPcanjdG7v3chX/w81Y2Jr2tAeh
         C5sM2oYgM8eEjwUDMzZH+U9POZseHVoBWdKS+AHlrwclbrhuXfgfBTuQzo6qDFWiwDY0
         G5Z2rIFQO+Za+kN+DGTPcx0Rg7zrFHaJjsBfOz365ws8+fTj9sh+aU1aMTG8cMv/5I2Z
         vY5RnjdFoyVP2P8FhJms43kM14w+0tNoVt8DJ5LSjbhbg0srCBFv2HbXO3xcpGHab2F1
         FqPA==
X-Gm-Message-State: APjAAAU5ob0fIthmVrfiqoeRYndjE+9bmjuU9CRcg9/YBx6TebeMO0Qv
        jcnms5czk33N9mxBLr1/3J7qyRfe
X-Google-Smtp-Source: APXvYqzGikrKUnHqRMZyudqwEZ/i7V5at/OfXEIKLnHhcmXSoqyXeQH3Lt9mWFNPDJUJAbterpK8og==
X-Received: by 2002:aa7:9095:: with SMTP id i21mr9853954pfa.134.1554434470082;
        Thu, 04 Apr 2019 20:21:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5sm23619121pgv.15.2019.04.04.20.21.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:09 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/16] hwmon: (adm1026) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:48 -0700
Message-Id: <1554434462-6087-2-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adm1026.c | 416 +++++++++++++++++++++++++-----------------------
 1 file changed, 216 insertions(+), 200 deletions(-)

diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index e43f09a07cd0..d34a68a11036 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -477,24 +477,24 @@ static struct adm1026_data *adm1026_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_in(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in[nr]));
 }
-static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_min[nr]));
 }
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -513,16 +513,16 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_max[nr]));
 }
-static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -542,48 +542,72 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define in_reg(offset)						\
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO, show_in,	\
-		NULL, offset);					\
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_in_min, set_in_min, offset);		\
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_in_max, set_in_max, offset);
-
-
-in_reg(0);
-in_reg(1);
-in_reg(2);
-in_reg(3);
-in_reg(4);
-in_reg(5);
-in_reg(6);
-in_reg(7);
-in_reg(8);
-in_reg(9);
-in_reg(10);
-in_reg(11);
-in_reg(12);
-in_reg(13);
-in_reg(14);
-in_reg(15);
-
-static ssize_t show_in16(struct device *dev, struct device_attribute *attr,
+static SENSOR_DEVICE_ATTR_RO(in0_input, in, 0);
+static SENSOR_DEVICE_ATTR_RW(in0_min, in_min, 0);
+static SENSOR_DEVICE_ATTR_RW(in0_max, in_max, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, in, 1);
+static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 1);
+static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, in, 2);
+static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 2);
+static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, in, 3);
+static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 3);
+static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, in, 4);
+static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 4);
+static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_input, in, 5);
+static SENSOR_DEVICE_ATTR_RW(in5_min, in_min, 5);
+static SENSOR_DEVICE_ATTR_RW(in5_max, in_max, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, in, 6);
+static SENSOR_DEVICE_ATTR_RW(in6_min, in_min, 6);
+static SENSOR_DEVICE_ATTR_RW(in6_max, in_max, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_input, in, 7);
+static SENSOR_DEVICE_ATTR_RW(in7_min, in_min, 7);
+static SENSOR_DEVICE_ATTR_RW(in7_max, in_max, 7);
+static SENSOR_DEVICE_ATTR_RO(in8_input, in, 8);
+static SENSOR_DEVICE_ATTR_RW(in8_min, in_min, 8);
+static SENSOR_DEVICE_ATTR_RW(in8_max, in_max, 8);
+static SENSOR_DEVICE_ATTR_RO(in9_input, in, 9);
+static SENSOR_DEVICE_ATTR_RW(in9_min, in_min, 9);
+static SENSOR_DEVICE_ATTR_RW(in9_max, in_max, 9);
+static SENSOR_DEVICE_ATTR_RO(in10_input, in, 10);
+static SENSOR_DEVICE_ATTR_RW(in10_min, in_min, 10);
+static SENSOR_DEVICE_ATTR_RW(in10_max, in_max, 10);
+static SENSOR_DEVICE_ATTR_RO(in11_input, in, 11);
+static SENSOR_DEVICE_ATTR_RW(in11_min, in_min, 11);
+static SENSOR_DEVICE_ATTR_RW(in11_max, in_max, 11);
+static SENSOR_DEVICE_ATTR_RO(in12_input, in, 12);
+static SENSOR_DEVICE_ATTR_RW(in12_min, in_min, 12);
+static SENSOR_DEVICE_ATTR_RW(in12_max, in_max, 12);
+static SENSOR_DEVICE_ATTR_RO(in13_input, in, 13);
+static SENSOR_DEVICE_ATTR_RW(in13_min, in_min, 13);
+static SENSOR_DEVICE_ATTR_RW(in13_max, in_max, 13);
+static SENSOR_DEVICE_ATTR_RO(in14_input, in, 14);
+static SENSOR_DEVICE_ATTR_RW(in14_min, in_min, 14);
+static SENSOR_DEVICE_ATTR_RW(in14_max, in_max, 14);
+static SENSOR_DEVICE_ATTR_RO(in15_input, in, 15);
+static SENSOR_DEVICE_ATTR_RW(in15_min, in_min, 15);
+static SENSOR_DEVICE_ATTR_RW(in15_max, in_max, 15);
+
+static ssize_t in16_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in[16]) -
 		NEG12_OFFSET);
 }
-static ssize_t show_in16_min(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t in16_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_min[16])
 		- NEG12_OFFSET);
 }
-static ssize_t set_in16_min(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t in16_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -603,15 +627,16 @@ static ssize_t set_in16_min(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t show_in16_max(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t in16_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_max[16])
 			- NEG12_OFFSET);
 }
-static ssize_t set_in16_max(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t in16_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -632,17 +657,14 @@ static ssize_t set_in16_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in16_input, S_IRUGO, show_in16, NULL, 16);
-static SENSOR_DEVICE_ATTR(in16_min, S_IRUGO | S_IWUSR, show_in16_min,
-			  set_in16_min, 16);
-static SENSOR_DEVICE_ATTR(in16_max, S_IRUGO | S_IWUSR, show_in16_max,
-			  set_in16_max, 16);
-
+static SENSOR_DEVICE_ATTR_RO(in16_input, in16, 16);
+static SENSOR_DEVICE_ATTR_RW(in16_min, in16_min, 16);
+static SENSOR_DEVICE_ATTR_RW(in16_max, in16_max, 16);
 
 /* Now add fan read/write functions */
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -650,8 +672,8 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
 		data->fan_div[nr]));
 }
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -659,8 +681,9 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
 		data->fan_div[nr]));
 }
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -681,20 +704,22 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define fan_offset(offset)						\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO, show_fan, NULL,	\
-		offset - 1);						\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-		show_fan_min, set_fan_min, offset - 1);
-
-fan_offset(1);
-fan_offset(2);
-fan_offset(3);
-fan_offset(4);
-fan_offset(5);
-fan_offset(6);
-fan_offset(7);
-fan_offset(8);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
+static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
+static SENSOR_DEVICE_ATTR_RO(fan5_input, fan, 4);
+static SENSOR_DEVICE_ATTR_RW(fan5_min, fan_min, 4);
+static SENSOR_DEVICE_ATTR_RO(fan6_input, fan, 5);
+static SENSOR_DEVICE_ATTR_RW(fan6_min, fan_min, 5);
+static SENSOR_DEVICE_ATTR_RO(fan7_input, fan, 6);
+static SENSOR_DEVICE_ATTR_RW(fan7_min, fan_min, 6);
+static SENSOR_DEVICE_ATTR_RO(fan8_input, fan, 7);
+static SENSOR_DEVICE_ATTR_RW(fan8_min, fan_min, 7);
 
 /* Adjust fan_min to account for new fan divisor */
 static void fixup_fan_min(struct device *dev, int fan, int old_div)
@@ -715,16 +740,17 @@ static void fixup_fan_min(struct device *dev, int fan, int old_div)
 }
 
 /* Now add fan_div read/write functions */
-static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", data->fan_div[nr]);
 }
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -765,38 +791,35 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define fan_offset_div(offset)						\
-static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
-		show_fan_div, set_fan_div, offset - 1);
-
-fan_offset_div(1);
-fan_offset_div(2);
-fan_offset_div(3);
-fan_offset_div(4);
-fan_offset_div(5);
-fan_offset_div(6);
-fan_offset_div(7);
-fan_offset_div(8);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_div, fan_div, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_div, fan_div, 3);
+static SENSOR_DEVICE_ATTR_RW(fan5_div, fan_div, 4);
+static SENSOR_DEVICE_ATTR_RW(fan6_div, fan_div, 5);
+static SENSOR_DEVICE_ATTR_RW(fan7_div, fan_div, 6);
+static SENSOR_DEVICE_ATTR_RW(fan8_div, fan_div, 7);
 
 /* Temps */
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
 }
-static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[nr]));
 }
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -816,16 +839,17 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[nr]));
 }
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -846,30 +870,27 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define temp_reg(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO, show_temp,	\
-		NULL, offset - 1);					\
-static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_temp_min, set_temp_min, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_temp_max, set_temp_max, offset - 1);
-
-
-temp_reg(1);
-temp_reg(2);
-temp_reg(3);
-
-static ssize_t show_temp_offset(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+
+static ssize_t temp_offset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_offset[nr]));
 }
-static ssize_t set_temp_offset(struct device *dev,
-		struct device_attribute *attr, const char *buf,
-		size_t count)
+static ssize_t temp_offset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -890,16 +911,13 @@ static ssize_t set_temp_offset(struct device *dev,
 	return count;
 }
 
-#define temp_offset_reg(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_offset, S_IRUGO | S_IWUSR,	\
-		show_temp_offset, set_temp_offset, offset - 1);
-
-temp_offset_reg(1);
-temp_offset_reg(2);
-temp_offset_reg(3);
+static SENSOR_DEVICE_ATTR_RW(temp1_offset, temp_offset, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_offset, temp_offset, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_offset, temp_offset, 2);
 
-static ssize_t show_temp_auto_point1_temp_hyst(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_point1_temp_hyst_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -907,8 +925,9 @@ static ssize_t show_temp_auto_point1_temp_hyst(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(
 		ADM1026_FAN_ACTIVATION_TEMP_HYST + data->temp_tmin[nr]));
 }
-static ssize_t show_temp_auto_point2_temp(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_point2_temp_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -916,16 +935,18 @@ static ssize_t show_temp_auto_point2_temp(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_tmin[nr] +
 		ADM1026_FAN_CONTROL_TEMP_RANGE));
 }
-static ssize_t show_temp_auto_point1_temp(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_point1_temp_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_tmin[nr]));
 }
-static ssize_t set_temp_auto_point1_temp(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t temp_auto_point1_temp_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -946,18 +967,18 @@ static ssize_t set_temp_auto_point1_temp(struct device *dev,
 	return count;
 }
 
-#define temp_auto_point(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_point1_temp,		\
-		S_IRUGO | S_IWUSR, show_temp_auto_point1_temp,		\
-		set_temp_auto_point1_temp, offset - 1);			\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_point1_temp_hyst, S_IRUGO,\
-		show_temp_auto_point1_temp_hyst, NULL, offset - 1);	\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_point2_temp, S_IRUGO,	\
-		show_temp_auto_point2_temp, NULL, offset - 1);
-
-temp_auto_point(1);
-temp_auto_point(2);
-temp_auto_point(3);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_point1_temp, temp_auto_point1_temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_auto_point1_temp_hyst,
+			     temp_auto_point1_temp_hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_auto_point2_temp, temp_auto_point2_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_point1_temp, temp_auto_point1_temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_auto_point1_temp_hyst,
+			     temp_auto_point1_temp_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_auto_point2_temp, temp_auto_point2_temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_point1_temp, temp_auto_point1_temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_auto_point1_temp_hyst,
+			     temp_auto_point1_temp_hyst, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_auto_point2_temp, temp_auto_point2_temp, 2);
 
 static ssize_t show_temp_crit_enable(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -988,24 +1009,24 @@ static ssize_t set_temp_crit_enable(struct device *dev,
 	return count;
 }
 
-#define temp_crit_enable(offset)				\
-static DEVICE_ATTR(temp##offset##_crit_enable, S_IRUGO | S_IWUSR, \
-	show_temp_crit_enable, set_temp_crit_enable);
+static DEVICE_ATTR(temp1_crit_enable, 0644, show_temp_crit_enable,
+		   set_temp_crit_enable);
+static DEVICE_ATTR(temp2_crit_enable, 0644, show_temp_crit_enable,
+		   set_temp_crit_enable);
+static DEVICE_ATTR(temp3_crit_enable, 0644, show_temp_crit_enable,
+		   set_temp_crit_enable);
 
-temp_crit_enable(1);
-temp_crit_enable(2);
-temp_crit_enable(3);
-
-static ssize_t show_temp_crit(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_crit_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit[nr]));
 }
-static ssize_t set_temp_crit(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_crit_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -1026,13 +1047,9 @@ static ssize_t set_temp_crit(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define temp_crit_reg(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_crit, S_IRUGO | S_IWUSR,	\
-		show_temp_crit, set_temp_crit, offset - 1);
-
-temp_crit_reg(1);
-temp_crit_reg(2);
-temp_crit_reg(3);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp_crit, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_crit, temp_crit, 2);
 
 static ssize_t analog_out_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -1110,7 +1127,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
@@ -1118,34 +1135,34 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%ld\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in9_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in11_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in12_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in13_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(in14_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(in15_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(in16_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 12);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 13);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 14);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 15);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 16);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 17);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 18);
-static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL, 19);
-static SENSOR_DEVICE_ATTR(fan5_alarm, S_IRUGO, show_alarm, NULL, 20);
-static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 21);
-static SENSOR_DEVICE_ATTR(fan7_alarm, S_IRUGO, show_alarm, NULL, 22);
-static SENSOR_DEVICE_ATTR(fan8_alarm, S_IRUGO, show_alarm, NULL, 23);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 24);
-static SENSOR_DEVICE_ATTR(in10_alarm, S_IRUGO, show_alarm, NULL, 25);
-static SENSOR_DEVICE_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL, 26);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in9_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in11_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in12_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in13_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(in14_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(in15_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(in16_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 12);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 13);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 14);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 15);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 16);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 17);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, 18);
+static SENSOR_DEVICE_ATTR_RO(fan4_alarm, alarm, 19);
+static SENSOR_DEVICE_ATTR_RO(fan5_alarm, alarm, 20);
+static SENSOR_DEVICE_ATTR_RO(fan6_alarm, alarm, 21);
+static SENSOR_DEVICE_ATTR_RO(fan7_alarm, alarm, 22);
+static SENSOR_DEVICE_ATTR_RO(fan8_alarm, alarm, 23);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 24);
+static SENSOR_DEVICE_ATTR_RO(in10_alarm, alarm, 25);
+static SENSOR_DEVICE_ATTR_RO(in8_alarm, alarm, 26);
 
 static ssize_t alarm_mask_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -1188,7 +1205,6 @@ static ssize_t alarm_mask_store(struct device *dev,
 
 static DEVICE_ATTR_RW(alarm_mask);
 
-
 static ssize_t gpio_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
@@ -1371,23 +1387,23 @@ static ssize_t pwm1_enable_store(struct device *dev,
 
 /* enable PWM fan control */
 static DEVICE_ATTR_RW(pwm1);
-static DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, pwm1_show, pwm1_store);
-static DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, pwm1_show, pwm1_store);
+static DEVICE_ATTR(pwm2, 0644, pwm1_show, pwm1_store);
+static DEVICE_ATTR(pwm3, 0644, pwm1_show, pwm1_store);
 static DEVICE_ATTR_RW(pwm1_enable);
-static DEVICE_ATTR(pwm2_enable, S_IRUGO | S_IWUSR, pwm1_enable_show,
+static DEVICE_ATTR(pwm2_enable, 0644, pwm1_enable_show,
 		   pwm1_enable_store);
-static DEVICE_ATTR(pwm3_enable, S_IRUGO | S_IWUSR, pwm1_enable_show,
+static DEVICE_ATTR(pwm3_enable, 0644, pwm1_enable_show,
 		   pwm1_enable_store);
 static DEVICE_ATTR_RW(temp1_auto_point1_pwm);
-static DEVICE_ATTR(temp2_auto_point1_pwm, S_IRUGO | S_IWUSR,
-	temp1_auto_point1_pwm_show, temp1_auto_point1_pwm_store);
-static DEVICE_ATTR(temp3_auto_point1_pwm, S_IRUGO | S_IWUSR,
-	temp1_auto_point1_pwm_show, temp1_auto_point1_pwm_store);
+static DEVICE_ATTR(temp2_auto_point1_pwm, 0644,
+		   temp1_auto_point1_pwm_show, temp1_auto_point1_pwm_store);
+static DEVICE_ATTR(temp3_auto_point1_pwm, 0644,
+		   temp1_auto_point1_pwm_show, temp1_auto_point1_pwm_store);
 
 static DEVICE_ATTR_RO(temp1_auto_point2_pwm);
-static DEVICE_ATTR(temp2_auto_point2_pwm, S_IRUGO, temp1_auto_point2_pwm_show,
+static DEVICE_ATTR(temp2_auto_point2_pwm, 0444, temp1_auto_point2_pwm_show,
 		   NULL);
-static DEVICE_ATTR(temp3_auto_point2_pwm, S_IRUGO, temp1_auto_point2_pwm_show,
+static DEVICE_ATTR(temp3_auto_point2_pwm, 0444, temp1_auto_point2_pwm_show,
 		   NULL);
 
 static struct attribute *adm1026_attributes[] = {
-- 
2.7.4

