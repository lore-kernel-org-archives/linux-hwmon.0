Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0760AC4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAA5320693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNcwpQ40"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbfDEDVK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39931 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbfDEDVK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id b65so2231878plb.6
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=QCn7qTDrmn3pjpedZjgjvL9SfbiG5K2SOxV2HQUs/6o=;
        b=mNcwpQ40DjaSLlpt0aAYM02lCY0G1vO14yVz5MgXoCJtP7O5Ly9UR7O1+Z3occ/M6E
         lAY6Us85L2r26dfyPBMXTc3R493QxX6wg9GHDJcdzeFBrpJbWf+H+RYgod5aENigjiqj
         sRPl+dqxvGWmxvCa1FQliszA3kUrEQzvpLgMEnnH8jhWRejSNgbEZa5wERmXp1lRwUxs
         Apx3LyccW3Mpi0upplkUbmBg6n3k7NC5q6/3PuL/vsnnB2+DyLr5piG5lua9wlklomvJ
         40TmC05DmA83QPkjlNvW8qCrEuMeTWVnWYwM+V4pFjTYXeoYPLNM0rvm97KaV1La86QK
         yLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=QCn7qTDrmn3pjpedZjgjvL9SfbiG5K2SOxV2HQUs/6o=;
        b=iq46GSkgx9PhOWRFkgxYir88IdOGYgO84xcQBd5xlYlyil1KJqgs+tkXxknjJ8OwqN
         bToT3EcnLgPrcfkpaHSJZm7lpW++Gk5nx4vVUwRF89vaZkkeTJsI/MQwo+UK5ECzqu3a
         xxRbDl5B+fXvgDQdmWFG6NLAryY8GesVTmX4Z4ghnoK3LRI7mOnqpxcu2+sgFGHLx1vs
         DlUTvsaK5qI7pSY771V/G6vwU+zVcMWAmP0CidSjvb+jBeUJu9nfU5hNgpZgD/zCIh6G
         wzKeQ3ArmgR7TnsLzKAYDKQW/Fgc4LHYLzG7BPcnbd3hBuzMJCn5KjFfsUL9zhM5AnA8
         4UEg==
X-Gm-Message-State: APjAAAW2/WXs9vrhwb//BPIvGwCAezU3afKAAbe/tf/khAKpkO+qTODR
        g02vv1sKqVE+pMytXhGvMSRoudAp
X-Google-Smtp-Source: APXvYqx8DporwzPhN2KKpL+7a/P/1+0XE2vNH8Bg1XNc/PxI0m+IaGeSjLpD3SfZRyB4ynN7QBrdwQ==
X-Received: by 2002:a17:902:aa91:: with SMTP id d17mr10477093plr.43.1554434468685;
        Thu, 04 Apr 2019 20:21:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13sm25473056pfi.172.2019.04.04.20.21.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:07 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/16] hwmon: (adm1025) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:47 -0700
Message-Id: <1554434462-6087-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
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
 drivers/hwmon/adm1025.c | 98 +++++++++++++++++++++++++------------------------
 1 file changed, 51 insertions(+), 47 deletions(-)

diff --git a/drivers/hwmon/adm1025.c b/drivers/hwmon/adm1025.c
index 1e4dad36f5ef..ec437cc9e739 100644
--- a/drivers/hwmon/adm1025.c
+++ b/drivers/hwmon/adm1025.c
@@ -174,7 +174,7 @@ static struct adm1025_data *adm1025_update_device(struct device *dev)
  */
 
 static ssize_t
-show_in(struct device *dev, struct device_attribute *attr, char *buf)
+in_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
@@ -183,7 +183,7 @@ show_in(struct device *dev, struct device_attribute *attr, char *buf)
 }
 
 static ssize_t
-show_in_min(struct device *dev, struct device_attribute *attr, char *buf)
+in_min_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
@@ -192,7 +192,7 @@ show_in_min(struct device *dev, struct device_attribute *attr, char *buf)
 }
 
 static ssize_t
-show_in_max(struct device *dev, struct device_attribute *attr, char *buf)
+in_max_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
@@ -201,7 +201,7 @@ show_in_max(struct device *dev, struct device_attribute *attr, char *buf)
 }
 
 static ssize_t
-show_temp(struct device *dev, struct device_attribute *attr, char *buf)
+temp_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
@@ -209,7 +209,7 @@ show_temp(struct device *dev, struct device_attribute *attr, char *buf)
 }
 
 static ssize_t
-show_temp_min(struct device *dev, struct device_attribute *attr, char *buf)
+temp_min_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
@@ -217,15 +217,15 @@ show_temp_min(struct device *dev, struct device_attribute *attr, char *buf)
 }
 
 static ssize_t
-show_temp_max(struct device *dev, struct device_attribute *attr, char *buf)
+temp_max_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[index]));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = dev_get_drvdata(dev);
@@ -245,8 +245,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = dev_get_drvdata(dev);
@@ -266,22 +266,28 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define set_in(offset) \
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO, \
-	show_in, NULL, offset); \
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IWUSR | S_IRUGO, \
-	show_in_min, set_in_min, offset); \
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IWUSR | S_IRUGO, \
-	show_in_max, set_in_max, offset)
-set_in(0);
-set_in(1);
-set_in(2);
-set_in(3);
-set_in(4);
-set_in(5);
-
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
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
+
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = dev_get_drvdata(dev);
@@ -301,8 +307,9 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-	const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int index = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = dev_get_drvdata(dev);
@@ -322,15 +329,12 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define set_temp(offset) \
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO, \
-	show_temp, NULL, offset - 1); \
-static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IWUSR | S_IRUGO, \
-	show_temp_min, set_temp_min, offset - 1); \
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IWUSR | S_IRUGO, \
-	show_temp_max, set_temp_max, offset - 1)
-set_temp(1);
-set_temp(2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
 
 static ssize_t
 alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -341,21 +345,21 @@ alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
 static DEVICE_ATTR_RO(alarms);
 
 static ssize_t
-show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
+alarm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct adm1025_data *data = adm1025_update_device(dev);
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, show_alarm, NULL, 14);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp1_fault, alarm, 14);
 
 static ssize_t
 cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
-- 
2.7.4

