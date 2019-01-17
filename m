Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D812DC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B76820855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeZ7c6+O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfAQVN6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:13:58 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43471 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfAQVN6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:13:58 -0500
Received: by mail-pf1-f195.google.com with SMTP id w73so5415762pfk.10
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=myDqLJR9fFGAynRH40kLa+Jnj40olR/hxdibz5nHa5M=;
        b=NeZ7c6+OrXxLcejxaNnbuSczZ0/BJSfamgP6Eh/HMf+YYtbYEdCBdFAogy3qDX6LoW
         cJTadlDQjaADyvEmPAuCNsooUANnQfBxHWKja/CArKhy08+O4UesbsWJoCeH0yRBFPld
         4LDlDySw4E48iJXyk2jKbWFMydDNqOLEQMKjBEsBk+GPjYkzDgR7dbX0Tp4VvVS/a9L2
         4z79adc8W6JYJJwADgMHEOhqdxhRDUeokRbhtI8iyWS1IBiSJMBoQdAxG79hChYgx1b/
         tw99bM25m+rFSAqN9lhvmBqi2o7ws9u8RJGJaoIImEiFXurGLqnDVK0GI1RuSA9m+BGF
         E5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=myDqLJR9fFGAynRH40kLa+Jnj40olR/hxdibz5nHa5M=;
        b=kFQ7MWUAFSLrYQVG2uM/Qx5e6YSh/JQNEPDCcoXztroBcgnql9BmXO8CGShxN43Sn/
         J75uIyrfZdzE8FqeLv0SGRUjHmTqIGAB17jtgMxjDjo49lwOP66a2xmgByoqr94g2tsH
         VTGbRWO9zNqK+EdgASUrYce8JNl/3qWte2msqhGfJruKngBEpwbWHU+k1ZZ9SsMC8qrr
         yT8byI7WSnNwn96ecFlWyN9C10bDM4zGV88uPJOm1l+JaDnfP/3PJr6n1zno6DkOeUKi
         xeRhRt+BtToQqfhp/HcQr/9w38mDeFW3I4IiUxAgBlHErbkg4/uwARXa+c9N9LSArrar
         zYEQ==
X-Gm-Message-State: AJcUukcP1AFbOt7WVCvxW05hdsNRFkTA79gRsgD8jpd9RaulVfYPAYfC
        nZNCaGhVNFtptCJmCQjkruPtlgke
X-Google-Smtp-Source: ALg8bN6NAYx6ia7hfZ+hxxcqu3ZoZ/mM9Ig7oQ3E876UxF2pj67MfvIHbIBnBwjoDkHdSdK6wF8JVQ==
X-Received: by 2002:a63:f615:: with SMTP id m21mr15223684pgh.428.1547759636299;
        Thu, 17 Jan 2019 13:13:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e24sm3345280pfi.153.2019.01.17.13.13.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:13:55 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/29] hwmon: (gl520sm) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:22 -0800
Message-Id: <1547759629-23007-3-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/gl520sm.c | 184 ++++++++++++++++++++++--------------------------
 1 file changed, 85 insertions(+), 99 deletions(-)

diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
index 4ff32ee67fb6..7d430ad955fe 100644
--- a/drivers/hwmon/gl520sm.c
+++ b/drivers/hwmon/gl520sm.c
@@ -216,8 +216,8 @@ static DEVICE_ATTR_RO(cpu0_vid);
 #define IN_CLAMP(val)		clamp_val(val, 0, 255 * 19)
 #define IN_TO_REG(val)		DIV_ROUND_CLOSEST(IN_CLAMP(val), 19)
 
-static ssize_t get_in_input(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t in_input_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -229,8 +229,8 @@ static ssize_t get_in_input(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "%d\n", IN_FROM_REG(r));
 }
 
-static ssize_t get_in_min(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -242,8 +242,8 @@ static ssize_t get_in_min(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "%d\n", IN_FROM_REG(r));
 }
 
-static ssize_t get_in_max(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -255,8 +255,8 @@ static ssize_t get_in_max(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "%d\n", IN_FROM_REG(r));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -289,8 +289,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -323,31 +323,21 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, get_in_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, get_in_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, get_in_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, get_in_input, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, get_in_input, NULL, 4);
-static SENSOR_DEVICE_ATTR(in0_min, S_IRUGO | S_IWUSR,
-		get_in_min, set_in_min, 0);
-static SENSOR_DEVICE_ATTR(in1_min, S_IRUGO | S_IWUSR,
-		get_in_min, set_in_min, 1);
-static SENSOR_DEVICE_ATTR(in2_min, S_IRUGO | S_IWUSR,
-		get_in_min, set_in_min, 2);
-static SENSOR_DEVICE_ATTR(in3_min, S_IRUGO | S_IWUSR,
-		get_in_min, set_in_min, 3);
-static SENSOR_DEVICE_ATTR(in4_min, S_IRUGO | S_IWUSR,
-		get_in_min, set_in_min, 4);
-static SENSOR_DEVICE_ATTR(in0_max, S_IRUGO | S_IWUSR,
-		get_in_max, set_in_max, 0);
-static SENSOR_DEVICE_ATTR(in1_max, S_IRUGO | S_IWUSR,
-		get_in_max, set_in_max, 1);
-static SENSOR_DEVICE_ATTR(in2_max, S_IRUGO | S_IWUSR,
-		get_in_max, set_in_max, 2);
-static SENSOR_DEVICE_ATTR(in3_max, S_IRUGO | S_IWUSR,
-		get_in_max, set_in_max, 3);
-static SENSOR_DEVICE_ATTR(in4_max, S_IRUGO | S_IWUSR,
-		get_in_max, set_in_max, 4);
+static SENSOR_DEVICE_ATTR_RO(in0_input, in_input, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, in_input, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, in_input, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, in_input, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, in_input, 4);
+static SENSOR_DEVICE_ATTR_RW(in0_min, in_min, 0);
+static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 1);
+static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 2);
+static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 3);
+static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 4);
+static SENSOR_DEVICE_ATTR_RW(in0_max, in_max, 0);
+static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 1);
+static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 2);
+static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 3);
+static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 4);
 
 #define DIV_FROM_REG(val) (1 << (val))
 #define FAN_FROM_REG(val, div) ((val) == 0 ? 0 : (480000 / ((val) << (div))))
@@ -359,8 +349,8 @@ static SENSOR_DEVICE_ATTR(in4_max, S_IRUGO | S_IWUSR,
 				 DIV_ROUND_CLOSEST(480000, \
 						FAN_CLAMP(val, div) << (div)))
 
-static ssize_t get_fan_input(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t fan_input_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -369,8 +359,8 @@ static ssize_t get_fan_input(struct device *dev, struct device_attribute *attr,
 						 data->fan_div[n]));
 }
 
-static ssize_t get_fan_min(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -379,8 +369,8 @@ static ssize_t get_fan_min(struct device *dev, struct device_attribute *attr,
 						 data->fan_div[n]));
 }
 
-static ssize_t get_fan_div(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -395,8 +385,9 @@ static ssize_t fan1_off_show(struct device *dev,
 	return sprintf(buf, "%d\n", data->fan_off);
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -434,8 +425,9 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan_div_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -508,24 +500,20 @@ static ssize_t fan1_off_store(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan1_min, S_IRUGO | S_IWUSR,
-		get_fan_min, set_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IRUGO | S_IWUSR,
-		get_fan_min, set_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan1_div, S_IRUGO | S_IWUSR,
-		get_fan_div, set_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, S_IRUGO | S_IWUSR,
-		get_fan_div, set_fan_div, 1);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
 static DEVICE_ATTR_RW(fan1_off);
 
 #define TEMP_FROM_REG(val)	(((val) - 130) * 1000)
 #define TEMP_CLAMP(val)		clamp_val(val, -130000, 125000)
 #define TEMP_TO_REG(val)	(DIV_ROUND_CLOSEST(TEMP_CLAMP(val), 1000) + 130)
 
-static ssize_t get_temp_input(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+static ssize_t temp_input_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -533,8 +521,8 @@ static ssize_t get_temp_input(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_input[n]));
 }
 
-static ssize_t get_temp_max(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -542,8 +530,8 @@ static ssize_t get_temp_max(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[n]));
 }
 
-static ssize_t get_temp_max_hyst(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+static ssize_t temp_max_hyst_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	int n = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -551,8 +539,9 @@ static ssize_t get_temp_max_hyst(struct device *dev,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max_hyst[n]));
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -571,8 +560,9 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_temp_max_hyst(struct device *dev, struct device_attribute
-				 *attr, const char *buf, size_t count)
+static ssize_t temp_max_hyst_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -592,16 +582,12 @@ static ssize_t set_temp_max_hyst(struct device *dev, struct device_attribute
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, get_temp_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, get_temp_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR,
-		get_temp_max, set_temp_max, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO | S_IWUSR,
-		get_temp_max, set_temp_max, 1);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR,
-		get_temp_max_hyst, set_temp_max_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp2_max_hyst, S_IRUGO | S_IWUSR,
-		get_temp_max_hyst, set_temp_max_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp_max_hyst, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, temp_max_hyst, 1);
 
 static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -674,8 +660,8 @@ static DEVICE_ATTR_RO(alarms);
 static DEVICE_ATTR_RW(beep_enable);
 static DEVICE_ATTR_RW(beep_mask);
 
-static ssize_t get_alarm(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int bit_nr = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -683,18 +669,18 @@ static ssize_t get_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (data->alarms >> bit_nr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, get_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, get_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, get_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, get_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, get_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, get_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, get_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, get_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, get_alarm, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 7);
 
-static ssize_t get_beep(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static ssize_t beep_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct gl520_data *data = gl520_update_device(dev);
@@ -702,8 +688,8 @@ static ssize_t get_beep(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (data->beep_mask >> bitnr) & 1);
 }
 
-static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t beep_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -729,15 +715,15 @@ static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in0_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 0);
-static SENSOR_DEVICE_ATTR(in1_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 1);
-static SENSOR_DEVICE_ATTR(in2_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 2);
-static SENSOR_DEVICE_ATTR(in3_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 3);
-static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 4);
-static SENSOR_DEVICE_ATTR(fan1_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 5);
-static SENSOR_DEVICE_ATTR(fan2_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 6);
-static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 7);
-static SENSOR_DEVICE_ATTR(in4_beep, S_IRUGO | S_IWUSR, get_beep, set_beep, 7);
+static SENSOR_DEVICE_ATTR_RW(in0_beep, beep, 0);
+static SENSOR_DEVICE_ATTR_RW(in1_beep, beep, 1);
+static SENSOR_DEVICE_ATTR_RW(in2_beep, beep, 2);
+static SENSOR_DEVICE_ATTR_RW(in3_beep, beep, 3);
+static SENSOR_DEVICE_ATTR_RW(temp1_beep, beep, 4);
+static SENSOR_DEVICE_ATTR_RW(fan1_beep, beep, 5);
+static SENSOR_DEVICE_ATTR_RW(fan2_beep, beep, 6);
+static SENSOR_DEVICE_ATTR_RW(temp2_beep, beep, 7);
+static SENSOR_DEVICE_ATTR_RW(in4_beep, beep, 7);
 
 static struct attribute *gl520_attributes[] = {
 	&dev_attr_cpu0_vid.attr,
-- 
2.7.4

