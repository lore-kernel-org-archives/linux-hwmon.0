Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FBBC5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39EB920850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/JGHmQS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfARRPM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:12 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42280 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:11 -0500
Received: by mail-pg1-f196.google.com with SMTP id d72so6334640pga.9
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P9fqa2nOzXteuK2TD5onWB8crnsXkoSBnbHZoib1rew=;
        b=h/JGHmQSane4p6Zd36r2eZZ5j3z4/CtzNVVF5HXGH3CWPohOR/3DEQo2D5YrPw6RuJ
         93+0vHkA2zY4Fb0cXKWz4MEb0lLoo8U0NUo0rJ1AlVwRs7HXoVAMm28P4akBKxtzdYpw
         Hf7A41SvlX1UonDZGnZa2DNAB6M03bkQJoJ8q9v3T26T0EkFykSSI6+Xb9MEezdWQSjo
         5I0m+knipzrCwfNJBES3RM/mRLsymjg7rhuwC3jw8bX3mc87tPmDrD9r5tMi0MGIMPpQ
         st84Zzo4BQCFuZioEimbwSmIAptG0QvujMDpMQ6gCTsSUnNo0Ch19tQErM1fdC6AGA/h
         Rp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=P9fqa2nOzXteuK2TD5onWB8crnsXkoSBnbHZoib1rew=;
        b=rie9bu2bF3RyeuujDFpJ8G0gmpJz28YC1KqdMX9H20nZM+M1H1rhPbErKDEYIwhW9t
         9cu/lemeuUFCww25Sh3ruAFbWIVcvdQr7BV7ubnDdyIF0N8QOrm9dY60HzmrY9AMLn+T
         Ztm/EgoRcbm66CPmYFeMihcXvMajWpzLT075QxhPPJoBXTdfPhBNjRIJ8AjmY3aVymNR
         /9ZPfc83nNLTRivMdZAnXk3XP9seRKIVmyb670LrFVhf8RH8h9ARKT8dYktHX2kbAPuo
         vUj4e38tf9TEOcjFINZMfLF2h3Whk6opbJgspOVefAlgMGWNC4wzLESldEo4b7WNupmW
         qAgw==
X-Gm-Message-State: AJcUukf/SmuejUqcIxzqPEIbDvb+GVSE+zmKpGkHCbR3PexkpYrBG9FZ
        PnLdgyg/C/hSwdyq6rx4hWM987lj
X-Google-Smtp-Source: ALg8bN4Sehjv8fbkO+kE88ZFzU1+yZW4eBi7rHJ76+3Zcx/xS69zq6GJnhJTs6fgVNtOpOHkIrQhFg==
X-Received: by 2002:a62:1c7:: with SMTP id 190mr20195534pfb.46.1547831710417;
        Fri, 18 Jan 2019 09:15:10 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 64sm10261101pff.101.2019.01.18.09.15.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:09 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/30] hwmon: (max1619) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:33 -0800
Message-Id: <1547831700-15865-4-git-send-email-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1619.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 76d966932941..94e345fb2a78 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -145,7 +145,7 @@ static struct max1619_data *max1619_update_device(struct device *dev)
  * Sysfs stuff
  */
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -154,8 +154,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index]));
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			   const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max1619_data *data = dev_get_drvdata(dev);
@@ -180,7 +181,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", data->alarms);
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -188,22 +189,18 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, t_input1);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, t_input2);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_low2);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_high2);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO, show_temp, set_temp,
-			  t_crit2);
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IWUSR | S_IRUGO, show_temp,
-			  set_temp, t_hyst2);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, t_input1);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, t_input2);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp, t_low2);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp, t_high2);
+static SENSOR_DEVICE_ATTR_RW(temp2_crit, temp, t_crit2);
+static SENSOR_DEVICE_ATTR_RW(temp2_crit_hyst, temp, t_hyst2);
 
 static DEVICE_ATTR_RO(alarms);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 4);
 
 static struct attribute *max1619_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

