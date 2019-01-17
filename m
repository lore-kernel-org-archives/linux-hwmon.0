Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3E4C43444
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31C4220855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4QiJBNS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbfAQVO3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:29 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33506 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfAQVO2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:28 -0500
Received: by mail-pl1-f196.google.com with SMTP id z23so5322823plo.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Uba5H0rwlV7j2FuK+fQbPy+WkZIvLmP+6SR3/X1zUh8=;
        b=D4QiJBNSHK0g2RFSq2eUyy8JY5eWPDv7MDgiEYIcLHWn4WpgysyfAON62G31rCnzto
         4sFEwjfB3uHlPPCYjzj9BU+vHpIBa0xm5vVyP4loMSYYJo57u1NW33bR+4PS5B3TrOAG
         y5PaSJEV8X3ZZWrngJ/CsfJ/0SH+PK9ATs7E1qP3EK5PQm/S5YpbQMG7LSi5rG9JLUbd
         rE0QD9579vP5Pn3VLViKDOvuVJVl+o6Txg1b6WwBzU/YGKIVnNINPD3O13aRWZos1Nkv
         U8LEW9+ZpC6XtAoq2XMV+JiijLXtJIFLDIvUlZs+5KHgSKFwGcDrFIOMDPbXTxu4dDA2
         nK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Uba5H0rwlV7j2FuK+fQbPy+WkZIvLmP+6SR3/X1zUh8=;
        b=RyZoIciPQ4MjKbfAx6VvVYROWY41s8B0Vjslu2I1ulEdSRC8gEm2KwUtiUErV8Hemc
         2vFlxYg6kNNqtVL74fbDyBeXOuPmoVIiv37hsXBAh7hoi8r9aaBfn8cX1J6zhKC7nh2t
         hMYgKdEIfLc/AtSCz8S/8nM4M6YVq7h6JhJSIxM+eDpnFvZIlTkBWczzSXLLL19QmDKu
         GMs/oluvOM0q7fE4KMlt2FLG5gsIlKBkm+9+fuH9qocTuxa9Ztfwi8ANspCr82Y0zt4c
         wJtBAZb5Jyf8MpG6ZcYlAg68d68kBpzvl8xa2RfimxJr9TO0QgB6Q7heAXYCkx/oGjqa
         z+rw==
X-Gm-Message-State: AJcUukfpwbOQmhW28Sd15SFoRzgYQwY4YmtzdcGi/h7QiPAg+djedtVL
        7TyeXIGAWUoSQNQFg8sjRY71y11p
X-Google-Smtp-Source: ALg8bN5UB7wSjWGX/sTqltVPWAKGdlg8ZmmfjlI0VFa5ubf4xSrtuq/WJw/8TL1nt5SgoQk5p9/gVA==
X-Received: by 2002:a17:902:4464:: with SMTP id k91mr15162799pld.13.1547759667439;
        Thu, 17 Jan 2019 13:14:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f67sm5282202pfc.141.2019.01.17.13.14.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:26 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 20/29] hwmon: (lm83) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:40 -0800
Message-Id: <1547759629-23007-21-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm83.c | 62 ++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index cbfd0bb7f135..5bb35dff3d76 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -158,7 +158,7 @@ static struct lm83_data *lm83_update_device(struct device *dev)
  * Sysfs stuff
  */
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
@@ -166,8 +166,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index]));
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm83_data *data = dev_get_drvdata(dev);
@@ -195,8 +196,8 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *dummy,
 	return sprintf(buf, "%d\n", data->alarms);
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute
-			  *devattr, char *buf)
+static ssize_t alarm_show(struct device *dev,
+			  struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm83_data *data = lm83_update_device(dev);
@@ -205,36 +206,31 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp,
-	set_temp, 4);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_temp,
-	set_temp, 5);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_temp,
-	set_temp, 6);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IWUSR | S_IRUGO, show_temp,
-	set_temp, 7);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IRUGO, show_temp, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IWUSR | S_IRUGO, show_temp,
-	set_temp, 8);
-static SENSOR_DEVICE_ATTR(temp4_crit, S_IRUGO, show_temp, NULL, 8);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp, 4);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp, 5);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp, 6);
+static SENSOR_DEVICE_ATTR_RW(temp4_max, temp, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp, 8);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit, temp, 8);
+static SENSOR_DEVICE_ATTR_RW(temp3_crit, temp, 8);
+static SENSOR_DEVICE_ATTR_RO(temp4_crit, temp, 8);
 
 /* Individual alarm files */
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp4_crit_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp4_fault, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(temp4_max_alarm, S_IRUGO, show_alarm, NULL, 12);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 13);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 15);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(temp4_crit_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(temp4_fault, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, alarm, 12);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 13);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 15);
 /* Raw alarm file for compatibility */
 static DEVICE_ATTR_RO(alarms);
 
-- 
2.7.4

