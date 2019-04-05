Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2455DC4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFC4720693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3toEH+E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbfDEDVS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:18 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44446 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id g12so2220817pll.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Meu1HY7goTwtP/Q60KgbyrsnVxBuO13V5zy1FSdbuUE=;
        b=V3toEH+EkhTVcPT0kQF4qbxiVvX3+ZaYqERf1uWmupQrt1YylMTNMkNfYL1Rq2eP4p
         8qM6+txdtJdqjWHUShgJV3XgEljYlpbAZe0YQSRl4fq67CKoz1Ba2UjWgN/N9ITtb04z
         Ecm15CWmy0nX3aso+WHkJwgRB/uwqMpQsovM0MFIYX553hygCgK22+9xZkaPSW0gisiE
         ni801tBMfxEx/fSCYU7BjwwMZ6i/LeRGf03n/PPuUrJvnA6xo7RBqlihrlpgoKNUcMig
         Vq4gmGubqsMybw96qvrjediEaveswqlbd7AIfguIfZWAKDDb9GaJ+rmd8UMs49Iv5FEi
         uyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Meu1HY7goTwtP/Q60KgbyrsnVxBuO13V5zy1FSdbuUE=;
        b=kArdS+ipdZmWRnGn6Zo9KFQeHyXGemAl0o8n2+9+3fw6qYSrA1lZj/STTMdNkhhjNP
         SoaS/wpOZQF260elaGxCBliekIb4xty0MgfIqObaAsSpLih+7sMltiISr6g4ZRtDWVN9
         YLEQexkOX6im3PxGQLJELI7XgjI+Y7cGdu8DlhIJUgDOiT6e3Jjv6nxqxCDMz5u1juIC
         7JK7UmjwkKzAm58DQMgGis1E9lBFkAZYPTqPNw7BG0LWZILOXPP5X0eBl66XRf4NOYGj
         JUnlY2GnW+BGkCT69pau4cYBc5Naoft337b7g+DHVNNzenZcLix28g6W54DPuaSdvtNo
         1/jw==
X-Gm-Message-State: APjAAAWzI/0+BzbNCjnegGcHcCIvfTmvB/HPsuAJgbJbQX4gyH+nqdbo
        qNdIO+0ncIHN9QwbWphrlZQ/+fhn
X-Google-Smtp-Source: APXvYqyHzoLRj7WYFRC0DZwO1MZihmoGTqjjEWehnXlgcwGaGFvtKV8wmI6YBRLm2lRbGqbXqA4Kxg==
X-Received: by 2002:a17:902:a511:: with SMTP id s17mr10407786plq.108.1554434476908;
        Thu, 04 Apr 2019 20:21:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a7sm28102902pfc.45.2019.04.04.20.21.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:16 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/16] hwmon: (lm78) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:53 -0700
Message-Id: <1554434462-6087-7-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm78.c | 114 +++++++++++++++++++++++++--------------------------
 1 file changed, 56 insertions(+), 58 deletions(-)

diff --git a/drivers/hwmon/lm78.c b/drivers/hwmon/lm78.c
index 0cb7ff613b80..eb95947673de 100644
--- a/drivers/hwmon/lm78.c
+++ b/drivers/hwmon/lm78.c
@@ -73,7 +73,6 @@ enum chips { lm78, lm79 };
 #define LM78_REG_CHIPID 0x49
 #define LM78_REG_I2C_ADDR 0x48
 
-
 /*
  * Conversions. Rounding and limit checking is only done on the TO_REG
  * variants.
@@ -147,15 +146,13 @@ struct lm78_data {
 	u16 alarms;		/* Register encoding, combined */
 };
 
-
 static int lm78_read_value(struct lm78_data *data, u8 reg);
 static int lm78_write_value(struct lm78_data *data, u8 reg, u8 value);
 static struct lm78_data *lm78_update_device(struct device *dev);
 static void lm78_init_device(struct lm78_data *data);
 
-
 /* 7 Voltages */
-static ssize_t show_in(struct device *dev, struct device_attribute *da,
+static ssize_t in_show(struct device *dev, struct device_attribute *da,
 		       char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -163,7 +160,7 @@ static ssize_t show_in(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
 }
 
-static ssize_t show_in_min(struct device *dev, struct device_attribute *da,
+static ssize_t in_min_show(struct device *dev, struct device_attribute *da,
 			   char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -171,7 +168,7 @@ static ssize_t show_in_min(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index]));
 }
 
-static ssize_t show_in_max(struct device *dev, struct device_attribute *da,
+static ssize_t in_max_show(struct device *dev, struct device_attribute *da,
 			   char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -179,8 +176,8 @@ static ssize_t show_in_max(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index]));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *da,
-			  const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *da,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm78_data *data = dev_get_drvdata(dev);
@@ -199,8 +196,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *da,
-			  const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *da,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm78_data *data = dev_get_drvdata(dev);
@@ -219,21 +216,27 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *da,
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
-show_in_offset(5);
-show_in_offset(6);
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
+static SENSOR_DEVICE_ATTR_RO(in6_input, in, 6);
+static SENSOR_DEVICE_ATTR_RW(in6_min, in_min, 6);
+static SENSOR_DEVICE_ATTR_RW(in6_max, in_max, 6);
 
 /* Temperature */
 static ssize_t temp1_input_show(struct device *dev,
@@ -300,7 +303,7 @@ static DEVICE_ATTR_RW(temp1_max);
 static DEVICE_ATTR_RW(temp1_max_hyst);
 
 /* 3 Fans */
-static ssize_t show_fan(struct device *dev, struct device_attribute *da,
+static ssize_t fan_show(struct device *dev, struct device_attribute *da,
 			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -310,7 +313,7 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *da,
 		DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *da,
 			    char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -320,8 +323,8 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute *da,
 		DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm78_data *data = dev_get_drvdata(dev);
@@ -340,7 +343,7 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-static ssize_t show_fan_div(struct device *dev, struct device_attribute *da,
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *da,
 			    char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -354,8 +357,8 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *da,
  * least surprise; the user doesn't expect the fan minimum to change just
  * because the divisor changed.
  */
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct lm78_data *data = dev_get_drvdata(dev);
@@ -413,22 +416,17 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
 	return count;
 }
 
-#define show_fan_offset(offset)				\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO,		\
-		show_fan, NULL, offset - 1);			\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_fan_min, set_fan_min, offset - 1);
-
-show_fan_offset(1);
-show_fan_offset(2);
-show_fan_offset(3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
 
 /* Fan 3 divisor is locked in H/W */
-static SENSOR_DEVICE_ATTR(fan1_div, S_IRUGO | S_IWUSR,
-		show_fan_div, set_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, S_IRUGO | S_IWUSR,
-		show_fan_div, set_fan_div, 1);
-static SENSOR_DEVICE_ATTR(fan3_div, S_IRUGO, show_fan_div, NULL, 2);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_div, fan_div, 2);
 
 /* VID */
 static ssize_t cpu0_vid_show(struct device *dev, struct device_attribute *da,
@@ -448,24 +446,24 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *da,
 }
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *da,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *da,
 			  char *buf)
 {
 	struct lm78_data *data = lm78_update_device(dev);
 	int nr = to_sensor_dev_attr(da)->index;
 	return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
 
 static struct attribute *lm78_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4

