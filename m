Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D9AC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CED8420855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKMKscYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbfAQVOZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:25 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43510 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfAQVOZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:25 -0500
Received: by mail-pf1-f194.google.com with SMTP id w73so5416320pfk.10
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QfzNL9EtojQvSqENpETz4VXf9/XIwRpOmfmGpqdVHVc=;
        b=KKMKscYp50UZPf6cW5VuvmL8z0PTtGrtz1RTvZ78elXnlHkKPa7SGmOfR0hPDtdiA0
         U2jxvfV1z+aNUkHyG/r8Nq4e0RsdD80fwFUpRN0uH0lHsYIWcPttuIe3obo4W+bMLcir
         IqUXKF5VcHSLDYC1NgWsXfMdaDXrIgY0zvSlS7ha0DZr0zMbgT0d9FcDI/KEcMsnLRqI
         hZ19zqn/abjq/MyITJfyPiwtIfqIwyjh0Eg8D7M3uherZevIoBkFwxo5ekXio1OpxoqR
         FrJAz/xsXkc5KQ0PewElN98SEokHVNtcPxUIk5Vnc8YBazDDLk3MqcnXHxaUrFpXN5Z6
         V0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=QfzNL9EtojQvSqENpETz4VXf9/XIwRpOmfmGpqdVHVc=;
        b=ENAoozVenThS41sNw+8dVvO1IE3O4RqY7ATB3aZSmb69RFq/r4MZygQK/NX2H6vor1
         qEWH3li73CLzfzXjMW2nPZj25eTIlEUIVr/NOtZQ0QT92lu03GDSQG6olrYvoH2MnQxs
         wIvrJGUoKqlESEc4jEYWCDZhD3SBOtcIs4JU9B/n4Ek/21PN7rcVUzlEUPHnO4gk2YSQ
         vACl7RVqh+y2dRe+DoOMjU4Vr8+URvudda/vOnmqWgjdDY+wd13JQFqAn7HV2Y16Wqg9
         QeXKhS2uBBU0bIMiv8HRBczVau9Avbip3HFhYOfc1fIca+NYP41tMKcHU3d5MJQ7qrzE
         eTvg==
X-Gm-Message-State: AJcUukcTB+fCzN/N5OSpR/DC1dFrpCyI5OEnl2pcL7DBDWHRM7kntm2i
        B+BiIDFiS62DldlUnovbIKWD3ecl
X-Google-Smtp-Source: ALg8bN6HodITU2JEpycSwV7c8+oWi7AMSXxOHcF59f46slFdc74VKtzsmvRpJe/AUV6USYj53pVedg==
X-Received: by 2002:a65:560e:: with SMTP id l14mr14952915pgs.168.1547759664118;
        Thu, 17 Jan 2019 13:14:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z186sm3591119pfz.119.2019.01.17.13.14.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:23 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 18/29] hwmon: (lm77) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:38 -0800
Message-Id: <1547759629-23007-19-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm77.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/lm77.c b/drivers/hwmon/lm77.c
index 69b05cc2f60e..c27073dc24c1 100644
--- a/drivers/hwmon/lm77.c
+++ b/drivers/hwmon/lm77.c
@@ -137,7 +137,7 @@ static struct lm77_data *lm77_update_device(struct device *dev)
 
 /* sysfs stuff */
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -146,7 +146,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", data->temp[attr->index]);
 }
 
-static ssize_t show_temp_hyst(struct device *dev,
+static ssize_t temp_hyst_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -160,8 +160,9 @@ static ssize_t show_temp_hyst(struct device *dev,
 	return sprintf(buf, "%d\n", temp);
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm77_data *data = dev_get_drvdata(dev);
@@ -186,9 +187,9 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
  * hysteresis is stored as a relative value on the chip, so it has to be
  * converted first.
  */
-static ssize_t set_temp_hyst(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+static ssize_t temp_hyst_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct lm77_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -208,7 +209,7 @@ static ssize_t set_temp_hyst(struct device *dev,
 	return count;
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -216,22 +217,18 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, t_input);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_crit);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_min);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_max);
-
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO, show_temp_hyst,
-			  set_temp_hyst, t_crit);
-static SENSOR_DEVICE_ATTR(temp1_min_hyst, S_IRUGO, show_temp_hyst, NULL, t_min);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO, show_temp_hyst, NULL, t_max);
-
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp, t_crit);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, t_min);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, t_max);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, temp_hyst, t_crit);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_hyst, temp_hyst, t_min);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_hyst, temp_hyst, t_max);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
 
 static struct attribute *lm77_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

