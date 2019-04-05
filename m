Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26D4C10F00
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B56820693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+uDIJDd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729542AbfDEDVV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39712 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id i17so2462468pfo.6
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7Y4cvfbsPX2MCVa3R4DLJh99UsjC2P09vKc9/chFow0=;
        b=J+uDIJDdiqmDHC8Q1njapSeFnWujDvYoKYzmad+IvVbu8X73Dt1dOHgv2OXhtLCvEY
         38hU99My3Rfr8XwHQdXGKYY+YAoYXOWz4NN0FgVduqoZGXyd+6LcyZfXZ9TBAB3+s2ZA
         zlaiC1MXobSi0ho0g1h5xk8x63dFWI0MsDfLveYPEzATpEDASVIwhjraB1UZ7/uqJWOf
         S+qA9M8toCEpe5o8O5gja8XtnGib2FcB03XSPhyiLb34ALTPNr0fgkoZe9BZfhEiPaGO
         TOGwNwVPoOQJMTHGwykW/epmP+Q9XZPGWzdxxhbjMnZjwHF9Hx3egcETF0447A95oeV0
         n/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=7Y4cvfbsPX2MCVa3R4DLJh99UsjC2P09vKc9/chFow0=;
        b=c6QEciSsP9x0232QyDQdxfRFSq0BOmFcZ4Jhx0kPIX6CwOprYLRt+Z3wg3OGUBW2ad
         UbHacaes10fZzowJrJXruZuN3Fd1K+BsGmujdMhphGQoLNpuTceXr6wkc8zGuHLtC0XV
         JrOypke6ghgl04AjspDKW/jwyeieo5sJzGrhZsJDtBPRZa7BtMDw0esgmoqB6i4+Egx6
         djNW6H/Ttva6CwlPCynQFmqMLDXBGJfj9MLInHCG7U9VHaQl64XEmqAtAXDrC3WJ7Hga
         nLLNGkXUr28MV0ND3ZW3jRFRRpB/4qlX4UF9J+FTxsvnYaGUphSIw7KmpvNBzSuLMppp
         BptA==
X-Gm-Message-State: APjAAAWaiwNR2gxCKyOY/c4aeDcx8/PykgvQjMgk6MuLwc2F5q/9tIkV
        hQ+NSC3/Eyec6XVHxbQWvXGmjTHX
X-Google-Smtp-Source: APXvYqyNJIA/2tzNot0u4AcCwUUJRtRqZzxUgnJAR6YE5KQ0zo0xT2OIDxANSQhd2ej1dnjzUhyY0w==
X-Received: by 2002:a62:26c1:: with SMTP id m184mr10018553pfm.102.1554434479821;
        Thu, 04 Apr 2019 20:21:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y19sm28737587pfn.164.2019.04.04.20.21.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:19 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/16] hwmon: (via686a) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:55 -0700
Message-Id: <1554434462-6087-9-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/via686a.c | 148 ++++++++++++++++++++++++------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index 81f35e3a06b8..259725dec37e 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -47,7 +47,6 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
-
 /*
  * If force_addr is set to anything different from 0, we forcibly enable
  * the device at the given address.
@@ -355,32 +354,32 @@ static void via686a_init_device(struct via686a_data *data);
 /* following are the sysfs callback functions */
 
 /* 7 voltage sensors */
-static ssize_t show_in(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t in_show(struct device *dev, struct device_attribute *da,
+		       char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%ld\n", IN_FROM_REG(data->in[nr], nr));
 }
 
-static ssize_t show_in_min(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t in_min_show(struct device *dev, struct device_attribute *da,
+			   char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%ld\n", IN_FROM_REG(data->in_min[nr], nr));
 }
 
-static ssize_t show_in_max(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t in_max_show(struct device *dev, struct device_attribute *da,
+			   char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%ld\n", IN_FROM_REG(data->in_max[nr], nr));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *da,
-		const char *buf, size_t count) {
+static ssize_t in_min_store(struct device *dev, struct device_attribute *da,
+			    const char *buf, size_t count) {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -398,8 +397,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *da,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_in_max(struct device *dev, struct device_attribute *da,
-		const char *buf, size_t count) {
+static ssize_t in_max_store(struct device *dev, struct device_attribute *da,
+			    const char *buf, size_t count) {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -417,44 +416,48 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *da,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-#define show_in_offset(offset)					\
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO,		\
-		show_in, NULL, offset);				\
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_in_min, set_in_min, offset);		\
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_in_max, set_in_max, offset);
 
-show_in_offset(0);
-show_in_offset(1);
-show_in_offset(2);
-show_in_offset(3);
-show_in_offset(4);
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
 
 /* 3 temperatures */
-static ssize_t show_temp(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t temp_show(struct device *dev, struct device_attribute *da,
+			 char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%ld\n", TEMP_FROM_REG10(data->temp[nr]));
 }
-static ssize_t show_temp_over(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t temp_over_show(struct device *dev, struct device_attribute *da,
+			      char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%ld\n", TEMP_FROM_REG(data->temp_over[nr]));
 }
-static ssize_t show_temp_hyst(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t temp_hyst_show(struct device *dev, struct device_attribute *da,
+			      char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%ld\n", TEMP_FROM_REG(data->temp_hyst[nr]));
 }
-static ssize_t set_temp_over(struct device *dev, struct device_attribute *da,
-		const char *buf, size_t count) {
+static ssize_t temp_over_store(struct device *dev,
+			       struct device_attribute *da, const char *buf,
+			       size_t count) {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -472,8 +475,9 @@ static ssize_t set_temp_over(struct device *dev, struct device_attribute *da,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_temp_hyst(struct device *dev, struct device_attribute *da,
-		const char *buf, size_t count) {
+static ssize_t temp_hyst_store(struct device *dev,
+			       struct device_attribute *da, const char *buf,
+			       size_t count) {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -491,29 +495,28 @@ static ssize_t set_temp_hyst(struct device *dev, struct device_attribute *da,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-#define show_temp_offset(offset)					\
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO,		\
-		show_temp, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_temp_over, set_temp_over, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO | S_IWUSR,	\
-		show_temp_hyst, set_temp_hyst, offset - 1);
 
-show_temp_offset(1);
-show_temp_offset(2);
-show_temp_offset(3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_over, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp_hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_over, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, temp_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_over, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, temp_hyst, 2);
 
 /* 2 Fans */
-static ssize_t show_fan(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t fan_show(struct device *dev, struct device_attribute *da,
+			char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
 				DIV_FROM_REG(data->fan_div[nr])));
 }
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *da,
+			    char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -521,15 +524,15 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
 		FAN_FROM_REG(data->fan_min[nr],
 			     DIV_FROM_REG(data->fan_div[nr])));
 }
-static ssize_t show_fan_div(struct device *dev, struct device_attribute *da,
-		char *buf) {
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *da,
+			    char *buf) {
 	struct via686a_data *data = via686a_update_device(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[nr]));
 }
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
-		const char *buf, size_t count) {
+static ssize_t fan_min_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count) {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -546,8 +549,8 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
-		const char *buf, size_t count) {
+static ssize_t fan_div_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count) {
 	struct via686a_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int nr = attr->index;
@@ -568,16 +571,12 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-#define show_fan_offset(offset)						\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO,			\
-		show_fan, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-		show_fan_min, set_fan_min, offset - 1);			\
-static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
-		show_fan_div, set_fan_div, offset - 1);
-
-show_fan_offset(1);
-show_fan_offset(2);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
 
 /* Alarms */
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
@@ -589,23 +588,23 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct via686a_data *data = via686a_update_device(dev);
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 15);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 15);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
 
 static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
@@ -676,7 +675,6 @@ static struct platform_driver via686a_driver = {
 	.remove		= via686a_remove,
 };
 
-
 /* This is called when the module is loaded */
 static int via686a_probe(struct platform_device *pdev)
 {
-- 
2.7.4

