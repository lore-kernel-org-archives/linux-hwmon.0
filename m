Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFF6C10F0F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 599EA21855
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX+S/2qS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbfDEDVN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38492 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:12 -0400
Received: by mail-pf1-f194.google.com with SMTP id 10so2460260pfo.5
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eKVuVyWwAbY6Um7Oppgp9PguHInIDRBE2AysKMJR9ZY=;
        b=ZX+S/2qSuCETTw39zVok8Ft7KX6lYUZbKVd95sxFl1ZaLB4KbYDIGHxKwsPsNF8/r+
         LXZLX/sZWkeEJGOg0bCmpKlU7cQWiI6+RdcJhPEj4d+tG/FCvurzyDQLia5t5b3q9CNO
         VTJkUmEOosovoREt3LRnZ3istAhn7BiUOhjEa1ABLoCGkCw3tfRWOCuT7zbOE684v20k
         8bIVAWd2K+LXiiUEyRXr8FImWRMGLmNColMDy6xm/YbIVDsas7thfTm4GxBA+juN5Y0u
         MyjFkBj94PCz+2u/9o4SaYXkw8RKTUGXw04ohQMnom3L+Xdw4c4XWoEbu9KvfZIpsqDf
         4LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=eKVuVyWwAbY6Um7Oppgp9PguHInIDRBE2AysKMJR9ZY=;
        b=AKjx4Zvv6toqIpy/0E0kq1lHUXmCsMrWDjbcBYngM0HPVJ1Ltq7Z50Wz3KbvnCpEwz
         gInLN7APDJ1cYvVFOQlg8L99/l4VH8Yp76eovx2Pi7Y6bvI8bX2VrOten3eIHF15SD9Q
         wQ9t0hUBAAe/PWCaMchXeiAM/N7ZSmFeVFz1Wc517OjIFl9mutjYHhmjSEhc1yeSsUwr
         l0l9E9OFwG9zb5oSxPiNim+EPxUreoHhpbBRoMJXxezFdz3iCs1b0IJgLbZjJ3HNENze
         KNApAuZ60YQfnZmuWlhAHdnAed3qe2OTTDJyCdhc+f7rZgm6HqTpfnurnBgetjtrfrbQ
         k+7g==
X-Gm-Message-State: APjAAAXRtMKT5BPp/zU+Mi5t3NfLDrM/udEfeXouxVCxc6Ont9mKSLS0
        rJcKsBAVk53A+BlM7tL31otzThwW
X-Google-Smtp-Source: APXvYqyV80YoBEi0ptBA/IAmB5DHcD0NPxPUUhhcCFnLKrIhbYWCzokflwL1LQAYpwn0scBYFSW4HQ==
X-Received: by 2002:a62:458a:: with SMTP id n10mr9760653pfi.136.1554434471543;
        Thu, 04 Apr 2019 20:21:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 128sm2537806pgb.47.2019.04.04.20.21.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:11 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/16] hwmon: (adm9240) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:49 -0700
Message-Id: <1554434462-6087-3-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adm9240.c | 135 +++++++++++++++++++++++-------------------------
 1 file changed, 65 insertions(+), 70 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 255413fdbde9..000b20f1db71 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -269,16 +269,16 @@ static ssize_t temp1_input_show(struct device *dev,
 	return sprintf(buf, "%d\n", data->temp / 128 * 500); /* 9-bit value */
 }
 
-static ssize_t show_max(struct device *dev, struct device_attribute *devattr,
-		char *buf)
+static ssize_t max_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp_max[attr->index] * 1000);
 }
 
-static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
-		const char *buf, size_t count)
+static ssize_t max_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = dev_get_drvdata(dev);
@@ -299,14 +299,12 @@ static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
 }
 
 static DEVICE_ATTR_RO(temp1_input);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-		show_max, set_max, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
-		show_max, set_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, max, 1);
 
 /* voltage */
-static ssize_t show_in(struct device *dev, struct device_attribute *devattr,
-		char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *devattr,
+		       char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
@@ -314,8 +312,8 @@ static ssize_t show_in(struct device *dev, struct device_attribute *devattr,
 				attr->index));
 }
 
-static ssize_t show_in_min(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t in_min_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
@@ -323,8 +321,8 @@ static ssize_t show_in_min(struct device *dev,
 				attr->index));
 }
 
-static ssize_t show_in_max(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t in_max_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
@@ -332,9 +330,9 @@ static ssize_t show_in_max(struct device *dev,
 				attr->index));
 }
 
-static ssize_t set_in_min(struct device *dev,
-		struct device_attribute *devattr,
-		const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev,
+			    struct device_attribute *devattr, const char *buf,
+			    size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = dev_get_drvdata(dev);
@@ -354,9 +352,9 @@ static ssize_t set_in_min(struct device *dev,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev,
-		struct device_attribute *devattr,
-		const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev,
+			    struct device_attribute *devattr, const char *buf,
+			    size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = dev_get_drvdata(dev);
@@ -376,24 +374,28 @@ static ssize_t set_in_max(struct device *dev,
 	return count;
 }
 
-#define vin(nr)							\
-static SENSOR_DEVICE_ATTR(in##nr##_input, S_IRUGO,		\
-		show_in, NULL, nr);				\
-static SENSOR_DEVICE_ATTR(in##nr##_min, S_IRUGO | S_IWUSR,	\
-		show_in_min, set_in_min, nr);			\
-static SENSOR_DEVICE_ATTR(in##nr##_max, S_IRUGO | S_IWUSR,	\
-		show_in_max, set_in_max, nr);
-
-vin(0);
-vin(1);
-vin(2);
-vin(3);
-vin(4);
-vin(5);
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
 
 /* fans */
-static ssize_t show_fan(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
@@ -401,8 +403,8 @@ static ssize_t show_fan(struct device *dev,
 				1 << data->fan_div[attr->index]));
 }
 
-static ssize_t show_fan_min(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
@@ -410,8 +412,8 @@ static ssize_t show_fan_min(struct device *dev,
 				1 << data->fan_div[attr->index]));
 }
 
-static ssize_t show_fan_div(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t fan_div_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
@@ -429,9 +431,9 @@ static ssize_t show_fan_div(struct device *dev,
  * - otherwise: select fan clock divider to suit fan speed low limit,
  *   measurement code may adjust registers to ensure fan speed reading
  */
-static ssize_t set_fan_min(struct device *dev,
-		struct device_attribute *devattr,
-		const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = dev_get_drvdata(dev);
@@ -489,16 +491,12 @@ static ssize_t set_fan_min(struct device *dev,
 	return count;
 }
 
-#define fan(nr)							\
-static SENSOR_DEVICE_ATTR(fan##nr##_input, S_IRUGO,		\
-		show_fan, NULL, nr - 1);			\
-static SENSOR_DEVICE_ATTR(fan##nr##_div, S_IRUGO,		\
-		show_fan_div, NULL, nr - 1);			\
-static SENSOR_DEVICE_ATTR(fan##nr##_min, S_IRUGO | S_IWUSR,	\
-		show_fan_min, set_fan_min, nr - 1);
-
-fan(1);
-fan(2);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RO(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan2_div, fan_div, 1);
 
 /* alarms */
 static ssize_t alarms_show(struct device *dev,
@@ -509,22 +507,22 @@ static ssize_t alarms_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct adm9240_data *data = adm9240_update_device(dev);
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
 
 /* vid */
 static ssize_t cpu0_vid_show(struct device *dev,
@@ -564,9 +562,8 @@ static ssize_t aout_output_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(aout_output);
 
-static ssize_t chassis_clear(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t alarm_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct adm9240_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -583,8 +580,7 @@ static ssize_t chassis_clear(struct device *dev,
 
 	return count;
 }
-static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR, show_alarm,
-		chassis_clear, 12);
+static SENSOR_DEVICE_ATTR_RW(intrusion0_alarm, alarm, 12);
 
 static struct attribute *adm9240_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
@@ -632,7 +628,6 @@ static struct attribute *adm9240_attrs[] = {
 
 ATTRIBUTE_GROUPS(adm9240);
 
-
 /*** sensor chip detect and driver install ***/
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
-- 
2.7.4

