Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BA8C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FD5020693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6x411lE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbfDEDV0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41676 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDV0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id d1so2235137plj.8
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wYRXi/FOg/JOBv6f+s5HV9fGNrWZJbPkwslreIEUzn4=;
        b=L6x411lEQlGYwyADlMtoEcTgXi15JnaeC5JUTHWDKPNqgtZl0cwUYj6spc5ri8M50W
         phObnEdgccZhQYrGtJT2uNr0MUblF86KygDc4qfvUHC/UqJxy4ky1WTcxYodwd3tQxdv
         olTEbqrdeE4N545WS0ah+856b5PmugC0OMjq1WdJh0PQcxDOc9MGeVIm18TV4WAXQwMv
         oFdkdhSTb6eNash+20tWBNmU3D+3beJq8Kt654FQBUbjAbZFaXjtTWIQqw5/G8fkgzIu
         cn7AGk0TROErbEbSV1zALeyqDXSVafnsFm95Vvki/d2/dUewvO2EfxlNiWtOaoUtbydQ
         1EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=wYRXi/FOg/JOBv6f+s5HV9fGNrWZJbPkwslreIEUzn4=;
        b=Sj7RaIO5buicHwLxlNDQ0uHxHUkLWDWLyfHkZ30wyLXpHAZssgueaCYGmKnY1TV+o8
         vwK5xZZ5b4tUphVnHOYy2MN0PD/d4KA3IFga0zD9SME7BVVeK8MrcHYtyjizhKT9FQ1a
         y4oaGV4Zkpe7qMQl2WaHHAKmNBqMZvjJ5MjIkROgXrbdUkKXlGvYyQg/dVGnwcR3tAXt
         xp+YNx1SzHnttBN00ePT6F9w5PHBQjDFqd4pr9MYzzePAlT1EuHie5DO8jSOKyzmbnfX
         YKs8JusYc6MFHD+h1rgYgqqT/uUoJw21MB+IkzyC1QrttyxZpQMtLrB2B6C8UJKLgx3W
         byuQ==
X-Gm-Message-State: APjAAAXthi5kF4X9NrgYWM9gwzl6F1lFgJonenoQJ9kvT5CNyQpYeHml
        5o/CZnme8fTQchC0MWUu42FhNnLF
X-Google-Smtp-Source: APXvYqyfPdu5LNLV2xAO+aubWBn2L2nmfxxUFrAYNEwkdDX/KoCm45sg90+aarEoEPW/VatUXkAR+g==
X-Received: by 2002:a17:902:f094:: with SMTP id go20mr10266967plb.159.1554434484991;
        Thu, 04 Apr 2019 20:21:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b63sm54624589pfj.54.2019.04.04.20.21.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:23 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Roger Lucas <vt8231@hiddenengine.co.uk>
Subject: [PATCH 12/16] hwmon: (vt8231) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:58 -0700
Message-Id: <1554434462-6087-12-git-send-email-linux@roeck-us.net>
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

Cc: Roger Lucas <vt8231@hiddenengine.co.uk>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/vt8231.c | 166 +++++++++++++++++++++++++------------------------
 1 file changed, 85 insertions(+), 81 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 367b5eb53fb6..e2f1a80367e2 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -192,8 +192,8 @@ static inline void vt8231_write_value(struct vt8231_data *data, u8 reg,
 }
 
 /* following are the sysfs callback functions */
-static ssize_t show_in(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -202,8 +202,8 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", ((data->in[nr] - 3) * 10000) / 958);
 }
 
-static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -212,8 +212,8 @@ static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", ((data->in_min[nr] - 3) * 10000) / 958);
 }
 
-static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -222,8 +222,8 @@ static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (((data->in_max[nr] - 3) * 10000) / 958));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -242,8 +242,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -330,19 +330,21 @@ static ssize_t in5_max_store(struct device *dev,
 	return count;
 }
 
-#define define_voltage_sysfs(offset)				\
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO,		\
-		show_in, NULL, offset);				\
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_in_min, set_in_min, offset);		\
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_in_max, set_in_max, offset)
-
-define_voltage_sysfs(0);
-define_voltage_sysfs(1);
-define_voltage_sysfs(2);
-define_voltage_sysfs(3);
-define_voltage_sysfs(4);
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
 
 static DEVICE_ATTR_RO(in5_input);
 static DEVICE_ATTR_RW(in5_min);
@@ -407,8 +409,8 @@ static ssize_t temp1_max_hyst_store(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -416,8 +418,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -425,8 +427,8 @@ static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_MAXMIN_FROM_REG(data->temp_max[nr]));
 }
 
-static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -434,8 +436,9 @@ static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_MAXMIN_FROM_REG(data->temp_min[nr]));
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -453,8 +456,9 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -477,27 +481,30 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
  * Note that these map the Linux temperature sensor numbering (1-6) to the VIA
  * temperature sensor numbering (0-5)
  */
-#define define_temperature_sysfs(offset)				\
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO,		\
-		show_temp, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_temp_max, set_temp_max, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO | S_IWUSR,	\
-		show_temp_min, set_temp_min, offset - 1)
 
 static DEVICE_ATTR_RO(temp1_input);
 static DEVICE_ATTR_RW(temp1_max);
 static DEVICE_ATTR_RW(temp1_max_hyst);
 
-define_temperature_sysfs(2);
-define_temperature_sysfs(3);
-define_temperature_sysfs(4);
-define_temperature_sysfs(5);
-define_temperature_sysfs(6);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
+static SENSOR_DEVICE_ATTR_RW(temp4_max, temp_max, 3);
+static SENSOR_DEVICE_ATTR_RW(temp4_max_hyst, temp_min, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
+static SENSOR_DEVICE_ATTR_RW(temp5_max, temp_max, 4);
+static SENSOR_DEVICE_ATTR_RW(temp5_max_hyst, temp_min, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_input, temp, 5);
+static SENSOR_DEVICE_ATTR_RW(temp6_max, temp_max, 5);
+static SENSOR_DEVICE_ATTR_RW(temp6_max_hyst, temp_min, 5);
 
 /* Fans */
-static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -506,8 +513,8 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 				DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -516,8 +523,8 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
 			DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -525,8 +532,9 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[nr]));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -545,8 +553,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct vt8231_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
@@ -593,17 +602,12 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-
-#define define_fan_sysfs(offset)					\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO,			\
-		show_fan, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
-		show_fan_div, set_fan_div, offset - 1);			\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-		show_fan_min, set_fan_min, offset - 1)
-
-define_fan_sysfs(1);
-define_fan_sysfs(2);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
 
 /* Alarms */
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
@@ -614,27 +618,27 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct vt8231_data *data = vt8231_update_device(dev);
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp4_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp5_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp6_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp4_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp5_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp6_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
 
 static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
-- 
2.7.4

