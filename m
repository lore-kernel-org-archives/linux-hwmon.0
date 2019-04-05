Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A506C10F0F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2276520693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A52XuhAk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbfDEDVY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:24 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46384 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:23 -0400
Received: by mail-pg1-f195.google.com with SMTP id q1so2266653pgv.13
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iCcZOMIQPloHveOXjCDfo+m/rLS3R7k1IQOgMd4oyqg=;
        b=A52XuhAkhoTJmdbHDeJppvE+rlQnFp4SXagu+jRPSSlixsgJEJOJWCsFqFTsqn6I9Q
         RtkMUA7s7zzqQBtZkBdEBQlgB5qSlnEYgAUdf3eYDm9YjV30bKWTVfnzVnAcPRyzCWX7
         l879m+23cNt3D9sQA8+V2P5zsOjXucPhNPUaWn0abKREgoTWOeqdSLaLaKhlpg4YM4Uq
         LbdkpNYkxX+WqNakAyVjlE+pF+10i3wuL7EvtbOHcEEyBlg2OPvvf7Vr6u5vbQM6BqLK
         eHw/zPIhZKQoXh0E4NQJT289Q0mN7yw1Tt2yXT7AY5KFm/GOdhzTWvIVzDxORDuaZlpb
         NrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=iCcZOMIQPloHveOXjCDfo+m/rLS3R7k1IQOgMd4oyqg=;
        b=WzuFBKMW+DG/CVNub4iO+/Ia5MTxSVal089ABd9Xsirb2vJKwYHKXpVEPFgZFoKXEn
         pOvQ3T2e0lcFRugElaqkDOVBnnzesrwOontnpE+1yVY07xlDOVGg3PCw8aO7yEqUnkSW
         oo2SR3QKVFsdJHvbTy4jasAj092Iy/w3fDB5GpPncqK2SzO+CAu1dSQpuDzdK38Hx+jY
         HcAYtD+WmOr06wraZhLAhPqYnAn1BZEf9g0RhEMGuscWwpngUA6ugPx9/BDTx3VCWfOf
         s41slUaS/dJ2stB/B2uaDFoS8TbHpnJuS96rx1gpmsHvU+NdaI9z8aZJZmgFUBJHqTfs
         6Vtw==
X-Gm-Message-State: APjAAAWwMBUyr7bVZ16xcUeF+JzRp/D92Z8rlZ4FN5EAa/q3Iqgaf43l
        /ZTFtxT1Ufmdp14mKjQwMASIgWCM
X-Google-Smtp-Source: APXvYqxsBgjF5YTDgVkYU+NUn9IhBreN3430IPkaxmMQWizqhRV42SmQ+hx74FxFFgWVVD0zq0SYVw==
X-Received: by 2002:a62:5797:: with SMTP id i23mr9655843pfj.12.1554434482540;
        Thu, 04 Apr 2019 20:21:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g67sm31380621pfg.94.2019.04.04.20.21.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:22 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/16] hwmon: (sis5595) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:57 -0700
Message-Id: <1554434462-6087-11-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/sis5595.c | 92 +++++++++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 48 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 6d789aab54c9..44451b913292 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -67,7 +67,6 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
-
 /*
  * If force_addr is set to anything different from 0, we forcibly enable
  * the device at the given address.
@@ -222,7 +221,7 @@ static struct platform_driver sis5595_driver = {
 };
 
 /* 4 Voltages */
-static ssize_t show_in(struct device *dev, struct device_attribute *da,
+static ssize_t in_show(struct device *dev, struct device_attribute *da,
 		       char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
@@ -231,7 +230,7 @@ static ssize_t show_in(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[nr]));
 }
 
-static ssize_t show_in_min(struct device *dev, struct device_attribute *da,
+static ssize_t in_min_show(struct device *dev, struct device_attribute *da,
 			   char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
@@ -240,7 +239,7 @@ static ssize_t show_in_min(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[nr]));
 }
 
-static ssize_t show_in_max(struct device *dev, struct device_attribute *da,
+static ssize_t in_max_show(struct device *dev, struct device_attribute *da,
 			   char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
@@ -249,8 +248,8 @@ static ssize_t show_in_max(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[nr]));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *da,
-			  const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *da,
+			    const char *buf, size_t count)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -269,8 +268,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *da,
-			  const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *da,
+			    const char *buf, size_t count)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -289,19 +288,21 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-#define show_in_offset(offset)					\
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO,		\
-		show_in, NULL, offset);				\
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_in_min, set_in_min, offset);		\
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_in_max, set_in_max, offset);
-
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
 
 /* Temperature */
 static ssize_t temp1_input_show(struct device *dev,
@@ -368,7 +369,7 @@ static DEVICE_ATTR_RW(temp1_max);
 static DEVICE_ATTR_RW(temp1_max_hyst);
 
 /* 2 Fans */
-static ssize_t show_fan(struct device *dev, struct device_attribute *da,
+static ssize_t fan_show(struct device *dev, struct device_attribute *da,
 			char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
@@ -378,7 +379,7 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *da,
 		DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *da,
 			    char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
@@ -388,8 +389,8 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
 		DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -408,7 +409,7 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t show_fan_div(struct device *dev, struct device_attribute *da,
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *da,
 			    char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
@@ -423,8 +424,8 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *da,
  * least surprise; the user doesn't expect the fan minimum to change just
  * because the divisor changed.
  */
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count)
 {
 	struct sis5595_data *data = dev_get_drvdata(dev);
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -480,16 +481,12 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
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
@@ -500,21 +497,21 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *da,
 			  char *buf)
 {
 	struct sis5595_data *data = sis5595_update_device(dev);
 	int nr = to_sensor_dev_attr(da)->index;
 	return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 15);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 15);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 15);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 15);
 
 static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
@@ -673,7 +670,6 @@ static int sis5595_remove(struct platform_device *pdev)
 	return 0;
 }
 
-
 /* ISA access must be locked explicitly. */
 static int sis5595_read_value(struct sis5595_data *data, u8 reg)
 {
-- 
2.7.4

