Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0CBC4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B49F20693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7pUSsv2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbfDEDVU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:20 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43752 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id z9so2273807pgu.10
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3nj+owydlpEXRVlhg+mtfCfhzjR6fv5teYPDXy9T2Jk=;
        b=S7pUSsv2SKWakNXl1g1AuQrebSL9RrXc855SVsrbTqglcqtMrn6+/rQEu4+/O+y1f5
         1DZyuF0ffhN4CRAVzdOu6KCjC826x5Nl+ZLjSw7bFZ5xu549Oi+v72JV9r0Crix1RlH/
         wIjT9upctZkrieAStoo1dUyBrhXx8JtyW7fdwE+bR+pl7+iFgczr/r9TbE+XEONGizLc
         hfsH/v6X01WZjv+oPXXmTxcHVA31zB4nMZFnM/gkrGybsvgCV4L3ahYWqzrcf3vTPhpj
         dzjtCL4MiqlDdIqnnO8luBnoZQd56uSUeDqYDKtcNnzfPcLT1ooqvtoGAZ+idTXE3uQV
         LrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=3nj+owydlpEXRVlhg+mtfCfhzjR6fv5teYPDXy9T2Jk=;
        b=p28e/5lvWcz9wGhu1y9Q/1boG32bxTARh/XlrLMpWPO21FtTIxaKNhsJPbT0GdNNhA
         oLScmIIxn4ZXN0t+C6EY7/BrD4nE3AMxbk3gws0IRjgowL8D08MwXNwnrBc9bnkuOVGb
         4oKzXw5BkaSMIqHLLmcxjVmOPwK7N4FgkMHsQn+STKRaR/P13WTm8XbbLX/QmIWh7qDc
         dZe1aMqKAko7wq7hXP/T2v6mlD5eXrVo9KBTVMJWt8X1uRxxDruIbyZpXDaNBQN4fwAE
         Tpg9z7FVNn2mTFuuuvN4VTwH/WXVsVRoiRUvpB0Dn8R2thonPUEQJfu05VHpl/oREgTJ
         lZcQ==
X-Gm-Message-State: APjAAAWshhTzcl5PLRjf3Bl9DCcVtYqOL0UvDhLHhgsweC7vrzlZz4CI
        S95Xw3on79kqFGnFf4rK9jB089L3
X-Google-Smtp-Source: APXvYqzMSOa+WGPgZI3uMxKtVObfVcXhPtEMmRHQ7n07+UvROkA7zgZQ2wjJ4L9/e2j9bMBjTUystQ==
X-Received: by 2002:a63:5a20:: with SMTP id o32mr9300801pgb.225.1554434478380;
        Thu, 04 Apr 2019 20:21:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q74sm445374pfc.111.2019.04.04.20.21.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:17 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/16] hwmon: (lm85) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:54 -0700
Message-Id: <1554434462-6087-8-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm85.c | 340 ++++++++++++++++++++++++++-------------------------
 1 file changed, 174 insertions(+), 166 deletions(-)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 235bba054d47..80db367b4c54 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -165,7 +165,6 @@ static inline u16 FAN_TO_REG(unsigned long val)
 #define PWM_TO_REG(val)			clamp_val(val, 0, 255)
 #define PWM_FROM_REG(val)		(val)
 
-
 /*
  * ZONEs have the following parameters:
  *    Limit (low) temp,           1. degC
@@ -563,24 +562,25 @@ static struct lm85_data *lm85_update_device(struct device *dev)
 }
 
 /* 4 Fans */
-static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr]));
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr]));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -599,16 +599,14 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define show_fan_offset(offset)						\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO,			\
-		show_fan, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-		show_fan_min, set_fan_min, offset - 1)
-
-show_fan_offset(1);
-show_fan_offset(2);
-show_fan_offset(3);
-show_fan_offset(4);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
+static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
 
 /* vid, vrm, alarms */
 
@@ -667,44 +665,44 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 18);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 16);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 17);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, show_alarm, NULL, 14);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 15);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 12);
-static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL, 13);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 18);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 16);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 17);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp1_fault, alarm, 14);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 15);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, 12);
+static SENSOR_DEVICE_ATTR_RO(fan4_alarm, alarm, 13);
 
 /* pwm */
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm[nr]));
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -723,8 +721,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm_enable(struct device *dev, struct device_attribute
-		*attr, char *buf)
+static ssize_t pwm_enable_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
@@ -745,8 +743,9 @@ static ssize_t show_pwm_enable(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", enable);
 }
 
-static ssize_t set_pwm_enable(struct device *dev, struct device_attribute
-		*attr, const char *buf, size_t count)
+static ssize_t pwm_enable_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -788,8 +787,8 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute
 	return count;
 }
 
-static ssize_t show_pwm_freq(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t pwm_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
@@ -804,8 +803,9 @@ static ssize_t show_pwm_freq(struct device *dev,
 	return sprintf(buf, "%d\n", freq);
 }
 
-static ssize_t set_pwm_freq(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t pwm_freq_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -841,22 +841,20 @@ static ssize_t set_pwm_freq(struct device *dev,
 	return count;
 }
 
-#define show_pwm_reg(offset)						\
-static SENSOR_DEVICE_ATTR(pwm##offset, S_IRUGO | S_IWUSR,		\
-		show_pwm, set_pwm, offset - 1);				\
-static SENSOR_DEVICE_ATTR(pwm##offset##_enable, S_IRUGO | S_IWUSR,	\
-		show_pwm_enable, set_pwm_enable, offset - 1);		\
-static SENSOR_DEVICE_ATTR(pwm##offset##_freq, S_IRUGO | S_IWUSR,	\
-		show_pwm_freq, set_pwm_freq, offset - 1)
-
-show_pwm_reg(1);
-show_pwm_reg(2);
-show_pwm_reg(3);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_enable, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_freq, pwm_freq, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_enable, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2_freq, pwm_freq, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_enable, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3_freq, pwm_freq, 2);
 
 /* Voltages */
 
-static ssize_t show_in(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
@@ -864,16 +862,16 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 						    data->in_ext[nr]));
 }
 
-static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_min[nr]));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -892,16 +890,16 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_max[nr]));
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -920,27 +918,35 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define show_in_reg(offset)						\
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO,			\
-		show_in, NULL, offset);					\
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR,		\
-		show_in_min, set_in_min, offset);			\
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,		\
-		show_in_max, set_in_max, offset)
-
-show_in_reg(0);
-show_in_reg(1);
-show_in_reg(2);
-show_in_reg(3);
-show_in_reg(4);
-show_in_reg(5);
-show_in_reg(6);
-show_in_reg(7);
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
+static SENSOR_DEVICE_ATTR_RO(in7_input, in, 7);
+static SENSOR_DEVICE_ATTR_RW(in7_min, in_min, 7);
+static SENSOR_DEVICE_ATTR_RW(in7_max, in_max, 7);
 
 /* Temps */
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
@@ -948,16 +954,17 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 						     data->temp_ext[nr]));
 }
 
-static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[nr]));
 }
 
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -979,16 +986,17 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[nr]));
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1010,31 +1018,30 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-#define show_temp_reg(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO,		\
-		show_temp, NULL, offset - 1);				\
-static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IRUGO | S_IWUSR,	\
-		show_temp_min, set_temp_min, offset - 1);		\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
-		show_temp_max, set_temp_max, offset - 1);
-
-show_temp_reg(1);
-show_temp_reg(2);
-show_temp_reg(3);
-
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
 
 /* Automatic PWM control */
 
-static ssize_t show_pwm_auto_channels(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t pwm_auto_channels_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", ZONE_FROM_REG(data->autofan[nr].config));
 }
 
-static ssize_t set_pwm_auto_channels(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t pwm_auto_channels_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1055,16 +1062,17 @@ static ssize_t set_pwm_auto_channels(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_auto_pwm_min(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t pwm_auto_pwm_min_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->autofan[nr].min_pwm));
 }
 
-static ssize_t set_pwm_auto_pwm_min(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t pwm_auto_pwm_min_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1084,16 +1092,18 @@ static ssize_t set_pwm_auto_pwm_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_pwm_auto_pwm_minctl(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t pwm_auto_pwm_minctl_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", data->autofan[nr].min_off);
 }
 
-static ssize_t set_pwm_auto_pwm_minctl(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t pwm_auto_pwm_minctl_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1117,25 +1127,21 @@ static ssize_t set_pwm_auto_pwm_minctl(struct device *dev,
 	return count;
 }
 
-#define pwm_auto(offset)						\
-static SENSOR_DEVICE_ATTR(pwm##offset##_auto_channels,			\
-		S_IRUGO | S_IWUSR, show_pwm_auto_channels,		\
-		set_pwm_auto_channels, offset - 1);			\
-static SENSOR_DEVICE_ATTR(pwm##offset##_auto_pwm_min,			\
-		S_IRUGO | S_IWUSR, show_pwm_auto_pwm_min,		\
-		set_pwm_auto_pwm_min, offset - 1);			\
-static SENSOR_DEVICE_ATTR(pwm##offset##_auto_pwm_minctl,		\
-		S_IRUGO | S_IWUSR, show_pwm_auto_pwm_minctl,		\
-		set_pwm_auto_pwm_minctl, offset - 1)
-
-pwm_auto(1);
-pwm_auto(2);
-pwm_auto(3);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_channels, pwm_auto_channels, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_pwm_min, pwm_auto_pwm_min, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1_auto_pwm_minctl, pwm_auto_pwm_minctl, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_channels, pwm_auto_channels, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_pwm_min, pwm_auto_pwm_min, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_pwm_minctl, pwm_auto_pwm_minctl, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_channels, pwm_auto_channels, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_pwm_min, pwm_auto_pwm_min, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm3_auto_pwm_minctl, pwm_auto_pwm_minctl, 2);
 
 /* Temperature settings for automatic PWM control */
 
-static ssize_t show_temp_auto_temp_off(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_temp_off_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
@@ -1143,8 +1149,9 @@ static ssize_t show_temp_auto_temp_off(struct device *dev,
 		HYST_FROM_REG(data->zone[nr].hyst));
 }
 
-static ssize_t set_temp_auto_temp_off(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t temp_auto_temp_off_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1172,16 +1179,18 @@ static ssize_t set_temp_auto_temp_off(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_auto_temp_min(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_temp_min_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->zone[nr].limit));
 }
 
-static ssize_t set_temp_auto_temp_min(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t temp_auto_temp_min_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1210,8 +1219,9 @@ static ssize_t set_temp_auto_temp_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_auto_temp_max(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_temp_max_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
@@ -1219,8 +1229,9 @@ static ssize_t show_temp_auto_temp_max(struct device *dev,
 		RANGE_FROM_REG(data->zone[nr].range));
 }
 
-static ssize_t set_temp_auto_temp_max(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t temp_auto_temp_max_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1245,16 +1256,18 @@ static ssize_t set_temp_auto_temp_max(struct device *dev,
 	return count;
 }
 
-static ssize_t show_temp_auto_temp_crit(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp_auto_temp_crit_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = lm85_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->zone[nr].critical));
 }
 
-static ssize_t set_temp_auto_temp_crit(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t temp_auto_temp_crit_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct lm85_data *data = dev_get_drvdata(dev);
@@ -1274,23 +1287,18 @@ static ssize_t set_temp_auto_temp_crit(struct device *dev,
 	return count;
 }
 
-#define temp_auto(offset)						\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_temp_off,			\
-		S_IRUGO | S_IWUSR, show_temp_auto_temp_off,		\
-		set_temp_auto_temp_off, offset - 1);			\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_temp_min,			\
-		S_IRUGO | S_IWUSR, show_temp_auto_temp_min,		\
-		set_temp_auto_temp_min, offset - 1);			\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_temp_max,			\
-		S_IRUGO | S_IWUSR, show_temp_auto_temp_max,		\
-		set_temp_auto_temp_max, offset - 1);			\
-static SENSOR_DEVICE_ATTR(temp##offset##_auto_temp_crit,		\
-		S_IRUGO | S_IWUSR, show_temp_auto_temp_crit,		\
-		set_temp_auto_temp_crit, offset - 1);
-
-temp_auto(1);
-temp_auto(2);
-temp_auto(3);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_temp_off, temp_auto_temp_off, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_temp_min, temp_auto_temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_temp_max, temp_auto_temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_auto_temp_crit, temp_auto_temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_temp_off, temp_auto_temp_off, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_temp_min, temp_auto_temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_temp_max, temp_auto_temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_auto_temp_crit, temp_auto_temp_crit, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_temp_off, temp_auto_temp_off, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_temp_min, temp_auto_temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_temp_max, temp_auto_temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_auto_temp_crit, temp_auto_temp_crit, 2);
 
 static struct attribute *lm85_attributes[] = {
 	&sensor_dev_attr_fan1_input.dev_attr.attr,
-- 
2.7.4

