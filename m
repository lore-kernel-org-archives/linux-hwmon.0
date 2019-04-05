Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5191AC10F00
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C0B220693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZKtOO62"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbfDEDVQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:16 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35487 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:16 -0400
Received: by mail-pf1-f196.google.com with SMTP id t21so138979pfh.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bOMcYAMp8tBXDqhXm1XR+iFcp05boO5sIHnEbt3bwjI=;
        b=PZKtOO62wBTwlpT3Qu2dysL82GtEghNpl3dAItBBPdZSAisoPxEIndpVXXUOk6gK03
         zUL7T/YkalaKccWUqPq7J6F8pdcFSNdCBqiA0JmE69qYeoWevHAk9mNKc7ZxMpiIHWbg
         ivElC7wglpCeLFLfhg5MkSXW6vVc21ZTrWLYmzLJHUfOqRwel0W4t7X5cAxEZWlS8lM9
         nTme2u0qI+n1+ijBw88hEnf8XF47IXhj2/msap0DGgPFund3f428QhK+8Op8xxTDOkWU
         dfkkn3r7OCTz8B8BNte01Lywkwv/a4gUeUKazXm9N45OouBYLGswmK11O6yDouIslKwd
         cVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=bOMcYAMp8tBXDqhXm1XR+iFcp05boO5sIHnEbt3bwjI=;
        b=gw+MpiFyrzY+REQKnynXvzFQ01bFuyyjF+5sGOPlv3lylNm9ZSzMs3ktqhPkrtp8jI
         8AG6feQTaqICK6PK2Z/a0Hy7aW+5y+eBNFcdk4J8xWzJD/PPVvV6p+9/BRtv+W/Q2pzR
         N9HPvZEdXHoXL8AhXVa4Y/7CTk6hBSM0qD55Ur18wmqLbwGAXt5xDLoBLFDbK2THAQ36
         kqtBJEk1EaqNFFVwOE/zHm2du90wzj5Y1iauKlU4/PiFRh7ykX1pieOdCOa2iY+gPSwM
         JOG4q5OaebbDmk4LlqQbkoREDXqTY5zzl0jJu06E+c2L4eCXBkD824whWXODOpqN8bWI
         7xBQ==
X-Gm-Message-State: APjAAAWNyHSTCjo+aoiXrf0pKyJ3wue8cORizms4pVOqxLmmurN8P5zB
        L4ZUEFZfbxz6zK6bNpdABoBtFllY
X-Google-Smtp-Source: APXvYqwh7/rzzObCHOAvLIJ0Hm1Qd+bFu3uSb5FTH6DNAPplKGiPKsVH/c4bKQyKzcpBB1zWqwtr7w==
X-Received: by 2002:a63:e850:: with SMTP id a16mr9147064pgk.195.1554434475543;
        Thu, 04 Apr 2019 20:21:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t64sm49250770pfa.86.2019.04.04.20.21.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:15 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/16] hwmon: (lm87) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:52 -0700
Message-Id: <1554434462-6087-6-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm87.c | 165 +++++++++++++++++++++++++++------------------------
 1 file changed, 87 insertions(+), 78 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index b48d30760388..644e61eae574 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -276,8 +276,8 @@ static struct lm87_data *lm87_update_device(struct device *dev)
  * Sysfs stuff
  */
 
-static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t in_input_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -286,8 +286,8 @@ static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
 		       data->in_scale[nr]));
 }
 
-static ssize_t show_in_min(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -296,8 +296,8 @@ static ssize_t show_in_min(struct device *dev,
 		       data->in_scale[nr]));
 }
 
-static ssize_t show_in_max(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -306,8 +306,8 @@ static ssize_t show_in_max(struct device *dev,
 		       data->in_scale[nr]));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -327,8 +327,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev,  struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -348,23 +348,32 @@ static ssize_t set_in_max(struct device *dev,  struct device_attribute *attr,
 	return count;
 }
 
-#define set_in(offset) \
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO, \
-		show_in_input, NULL, offset); \
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR, \
-		show_in_min, set_in_min, offset); \
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR, \
-		show_in_max, set_in_max, offset)
-set_in(0);
-set_in(1);
-set_in(2);
-set_in(3);
-set_in(4);
-set_in(5);
-set_in(6);
-set_in(7);
-
-static ssize_t show_temp_input(struct device *dev,
+static SENSOR_DEVICE_ATTR_RO(in0_input, in_input, 0);
+static SENSOR_DEVICE_ATTR_RW(in0_min, in_min, 0);
+static SENSOR_DEVICE_ATTR_RW(in0_max, in_max, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, in_input, 1);
+static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 1);
+static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, in_input, 2);
+static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 2);
+static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, in_input, 3);
+static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 3);
+static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, in_input, 4);
+static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 4);
+static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_input, in_input, 5);
+static SENSOR_DEVICE_ATTR_RW(in5_min, in_min, 5);
+static SENSOR_DEVICE_ATTR_RW(in5_max, in_max, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, in_input, 6);
+static SENSOR_DEVICE_ATTR_RW(in6_min, in_min, 6);
+static SENSOR_DEVICE_ATTR_RW(in6_max, in_max, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_input, in_input, 7);
+static SENSOR_DEVICE_ATTR_RW(in7_min, in_min, 7);
+static SENSOR_DEVICE_ATTR_RW(in7_max, in_max, 7);
+
+static ssize_t temp_input_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
@@ -373,7 +382,7 @@ static ssize_t show_temp_input(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
 }
 
-static ssize_t show_temp_low(struct device *dev,
+static ssize_t temp_low_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
@@ -383,7 +392,7 @@ static ssize_t show_temp_low(struct device *dev,
 		       TEMP_FROM_REG(data->temp_low[nr]));
 }
 
-static ssize_t show_temp_high(struct device *dev,
+static ssize_t temp_high_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
@@ -393,8 +402,9 @@ static ssize_t show_temp_high(struct device *dev,
 		       TEMP_FROM_REG(data->temp_high[nr]));
 }
 
-static ssize_t set_temp_low(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_low_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -413,8 +423,9 @@ static ssize_t set_temp_low(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_temp_high(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t temp_high_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -433,16 +444,15 @@ static ssize_t set_temp_high(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define set_temp(offset) \
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO, \
-		show_temp_input, NULL, offset - 1); \
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR, \
-		show_temp_high, set_temp_high, offset - 1); \
-static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IRUGO | S_IWUSR, \
-		show_temp_low, set_temp_low, offset - 1)
-set_temp(1);
-set_temp(2);
-set_temp(3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_low, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_high, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_low, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_high, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp_input, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_low, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_high, 2);
 
 static ssize_t temp1_crit_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -460,9 +470,9 @@ static ssize_t temp2_crit_show(struct device *dev,
 
 static DEVICE_ATTR_RO(temp1_crit);
 static DEVICE_ATTR_RO(temp2_crit);
-static DEVICE_ATTR(temp3_crit, S_IRUGO, temp2_crit_show, NULL);
+static DEVICE_ATTR(temp3_crit, 0444, temp2_crit_show, NULL);
 
-static ssize_t show_fan_input(struct device *dev,
+static ssize_t fan_input_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
@@ -472,8 +482,8 @@ static ssize_t show_fan_input(struct device *dev,
 		       FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_min(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -482,8 +492,8 @@ static ssize_t show_fan_min(struct device *dev,
 		       FAN_DIV_FROM_REG(data->fan_div[nr])));
 }
 
-static ssize_t show_fan_div(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int nr = to_sensor_dev_attr(attr)->index;
@@ -492,8 +502,9 @@ static ssize_t show_fan_div(struct device *dev,
 		       FAN_DIV_FROM_REG(data->fan_div[nr]));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -519,8 +530,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
  * of least surprise; the user doesn't expect the fan minimum to change just
  * because the divider changed.
  */
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -575,15 +587,12 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define set_fan(offset) \
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO, \
-		show_fan_input, NULL, offset - 1); \
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR, \
-		show_fan_min, set_fan_min, offset - 1); \
-static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR, \
-		show_fan_div, set_fan_div, offset - 1)
-set_fan(1);
-set_fan(2);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
 
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -653,28 +662,28 @@ static ssize_t aout_output_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(aout_output);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 14);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 15);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 14);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 15);
 
 /*
  * Real code
-- 
2.7.4

