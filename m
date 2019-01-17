Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC8BC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E18520855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+UgkVGk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbfAQVOW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:22 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43578 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVOW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:22 -0500
Received: by mail-pg1-f194.google.com with SMTP id v28so4978052pgk.10
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XllbveoZAxvtFQn5+7wDpRM6B3KCH38Du7cEfoQmOtk=;
        b=V+UgkVGkuzAddilEaqNxAVWR6osck0NC102Ofp8SLb3mJJPcWK/PhILXx6YFAzXb0V
         NSC5ZhmzmjV66FqCYAy23RJ+i1RrFstFYUxaSZHOMr92dEEV1uPFMxoyeLcQZbehkBD4
         7TSCrA3Q4WQ4VUvTFxVCSCkE4oNGqVp0G/6JeVuO5zyVj4d66jO5v30nnbfAiGujdhgY
         3nlCffaQ4px3ZERgmNMdGtPpJLGzwX4AJCeIG44pdrs8tBICcXto2frJ9l2OvN4t0yrV
         D9/0DxLWYP3h9uio4WErqrokKAMFklGkYoW8i1LQF80XnNNds589dSD1vwImXtHkVH8m
         xSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XllbveoZAxvtFQn5+7wDpRM6B3KCH38Du7cEfoQmOtk=;
        b=lFprzPTJRayfIaDzGLgYkQYgmfbsCzeoKI6tVBo2d63kpRAnL1SLIxo4nO0sLaBK2X
         9Gwfzgt9t17OYQN2I33NKhWzw/duV3siQvbPZjue8WpOuHDLQ0MglgJ9tvGBvxH9Ho9G
         qthr5Dwp+EmWj5IKurVEwCLpmvhyVgLs3EPa7sVGYYNGwd0CWMYIz/dqWMeA8Bm1rPc3
         tRYs+UyIeSzQvkr6UmrWV/fTHgvaaAM502Ql3OF+kMAEqdvgO31rIM3HV16lDzqcG0wf
         Ytr3K+1pXubobic2V23H0oxh7oeLlMfWnSmlU9j/wb6jJSYMjFWx8x5dy55ll7Z3An1i
         tAxg==
X-Gm-Message-State: AJcUukfosm3GUSSGNN8U232cZJRVZXiKEWvTIEZbEunmF+IXtXAbdoMC
        LU/PrTOnx8AYMAkdptwMtQyOq5aH
X-Google-Smtp-Source: ALg8bN6zQUVJBr33JHsifgfS+yQyWA0tz+eOf2LbhcAYxvIvijS9P9ElOdN2rJuRKKKBE+KXo12/Qw==
X-Received: by 2002:a62:f247:: with SMTP id y7mr16545048pfl.25.1547759660627;
        Thu, 17 Jan 2019 13:14:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e131sm4757356pfg.75.2019.01.17.13.14.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:19 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Guillaume Ligneul <guillaume.ligneul@gmail.com>
Subject: [PATCH 16/29] hwmon: (lm73) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:36 -0800
Message-Id: <1547759629-23007-17-git-send-email-linux@roeck-us.net>
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

Cc: Guillaume Ligneul <guillaume.ligneul@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm73.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/lm73.c b/drivers/hwmon/lm73.c
index 9653bb870a47..d1d728aa31d2 100644
--- a/drivers/hwmon/lm73.c
+++ b/drivers/hwmon/lm73.c
@@ -62,8 +62,8 @@ struct lm73_data {
 
 /*-----------------------------------------------------------------------*/
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *da,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev, struct device_attribute *da,
+			  const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm73_data *data = dev_get_drvdata(dev);
@@ -81,7 +81,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	return (err < 0) ? err : count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *da,
+static ssize_t temp_show(struct device *dev, struct device_attribute *da,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -98,8 +98,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *da,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", temp);
 }
 
-static ssize_t set_convrate(struct device *dev, struct device_attribute *da,
-			    const char *buf, size_t count)
+static ssize_t convrate_store(struct device *dev, struct device_attribute *da,
+			      const char *buf, size_t count)
 {
 	struct lm73_data *data = dev_get_drvdata(dev);
 	unsigned long convrate;
@@ -133,7 +133,7 @@ static ssize_t set_convrate(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t show_convrate(struct device *dev, struct device_attribute *da,
+static ssize_t convrate_show(struct device *dev, struct device_attribute *da,
 			     char *buf)
 {
 	struct lm73_data *data = dev_get_drvdata(dev);
@@ -143,7 +143,7 @@ static ssize_t show_convrate(struct device *dev, struct device_attribute *da,
 	return scnprintf(buf, PAGE_SIZE, "%hu\n", lm73_convrates[res]);
 }
 
-static ssize_t show_maxmin_alarm(struct device *dev,
+static ssize_t maxmin_alarm_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -168,18 +168,14 @@ static ssize_t show_maxmin_alarm(struct device *dev,
 
 /* sysfs attributes for hwmon */
 
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
-			show_temp, set_temp, LM73_REG_MAX);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
-			show_temp, set_temp, LM73_REG_MIN);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
-			show_temp, NULL, LM73_REG_INPUT);
-static SENSOR_DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
-			show_convrate, set_convrate, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO,
-			show_maxmin_alarm, NULL, LM73_CTRL_HI_SHIFT);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO,
-			show_maxmin_alarm, NULL, LM73_CTRL_LO_SHIFT);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, LM73_REG_MAX);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp, LM73_REG_MIN);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, LM73_REG_INPUT);
+static SENSOR_DEVICE_ATTR_RW(update_interval, convrate, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, maxmin_alarm,
+			     LM73_CTRL_HI_SHIFT);
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, maxmin_alarm,
+			     LM73_CTRL_LO_SHIFT);
 
 static struct attribute *lm73_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

