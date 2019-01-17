Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF94C43612
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D36B20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9a6cUvG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbfAQVOc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:32 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36595 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfAQVOc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:32 -0500
Received: by mail-pf1-f195.google.com with SMTP id b85so5431430pfc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WotTsz6+om3jrperZj7Nx/HIO5a1d6AFFi1U84t1LPY=;
        b=P9a6cUvGXSklek6mvJ7/NNMfLIW0OLwrdT+AQO0Wuu7cBdWQknIQEQmosAzRGdpyNm
         sa/0RkIJGV33ul64YpNjhEOCiW9RgXZDTZeV63LsIQjMxCoV+1ASzSl6vSQcmdmJCepr
         nSANJosbMSSCGf5eco0bFijUMHpXYYIxiHYsiLWsM+tFdduM+v6d4EYruMiWDyDcnK0e
         uyRSxH0/cK4t4ZG4w8hvrOE5zLg6kQuA//r3/bsG1P7s/+KXkXZJe5OOGO6lN+BQBLtU
         n3p41dtO9uh25ywY/ANwm6HprG0QUeMw2q+1vqjThH6x3y8nI3jSHGQTQSUklLKI4JYu
         x4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=WotTsz6+om3jrperZj7Nx/HIO5a1d6AFFi1U84t1LPY=;
        b=tGynurjs/5oLvgpGW6yiRcxubMbn3XPWDa5aLhpK5UDNfBlL/oPL4o5UcCIn5geP/8
         0Gv0kKwIxQKAgzpILxOG0NmV6lpqLWki5GhtvgbMUE/Tjx/zULfV6Urdss5OkJ21F4QI
         YaV6qYNIc0YLuPJ5qQfX1XM8HGCU3UlNYsQmwjVUGW/0yOdfMrmz7ltIr1YXQ+yh4sxv
         0E1H9LuH9iPGmXipO6anLXKuCOPcoFsdoWuWHYT7BvgflIo6yBl/4gGWVE0vGmsfRjkz
         Rh8912YnsP1DaMldu8zjDvPL78ONI8livRfTJObLi4HkbOKsePYgEXUTLavWFu4Puvr8
         0eYA==
X-Gm-Message-State: AJcUukeNsBDxW5v0QvopR0Ht9dSlJGS3wtIFlhAa4HJa4zHOXPzElWTF
        BEh9MUJ9vIreHEsbu3NNfx8NwVnP
X-Google-Smtp-Source: ALg8bN4isKQ88kGNCWSn9YxMlqhfyMZkBWoo0Ej2mhMBsB1qgzSerCCNFUMXiP618dy4Eim3boIkew==
X-Received: by 2002:a62:59c9:: with SMTP id k70mr16460276pfj.243.1547759670742;
        Thu, 17 Jan 2019 13:14:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9sm8453651pfd.99.2019.01.17.13.14.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:30 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 22/29] hwmon: (lm92) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:42 -0800
Message-Id: <1547759629-23007-23-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm92.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index e7333f8e185c..39d8afe4279a 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -143,7 +143,7 @@ static struct lm92_data *lm92_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -152,8 +152,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm92_data *data = dev_get_drvdata(dev);
@@ -173,7 +174,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t show_temp_hyst(struct device *dev,
+static ssize_t temp_hyst_show(struct device *dev,
 			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -192,9 +193,9 @@ static ssize_t temp1_min_hyst_show(struct device *dev,
 		       + TEMP_FROM_REG(data->temp[t_hyst]));
 }
 
-static ssize_t set_temp_hyst(struct device *dev,
-			     struct device_attribute *devattr,
-			     const char *buf, size_t count)
+static ssize_t temp_hyst_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm92_data *data = dev_get_drvdata(dev);
@@ -224,7 +225,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", ALARMS_FROM_REG(data->temp[t_input]));
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -232,21 +233,17 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (data->temp[t_input] >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, t_input);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_crit);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO, show_temp_hyst,
-			  set_temp_hyst, t_crit);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_min);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit, temp, t_crit);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, temp_hyst, t_crit);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, t_min);
 static DEVICE_ATTR_RO(temp1_min_hyst);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_max);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO, show_temp_hyst, NULL, t_max);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, t_max);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_hyst, temp_hyst, t_max);
 static DEVICE_ATTR_RO(alarms);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
 
 /*
  * Detection and registration
-- 
2.7.4

