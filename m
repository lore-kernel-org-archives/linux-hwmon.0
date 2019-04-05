Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B2BC4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 549D220693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSL4dwkM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbfDEDVb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:31 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38904 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:31 -0400
Received: by mail-pl1-f196.google.com with SMTP id g37so2231699plb.5
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VMlRaxZLTZeI3P9Pa2GrCLDCJn7D3hPxG5EuZyCrlOk=;
        b=TSL4dwkM7DEzyfTyqeK0EdtYr3XfTQUISlxHWabm8SKONwr1zuGvJM4YAtwGOLtk9f
         kqWK6dnfctGxVfqJTVnAzf4VXoOF70TA3p4c4ejMeprpfiqDoKuiNP6YC9FrmlKkIVgF
         ipVWUFjS89TMPVWbePOx61AYklNuBVRWFuAuaujJdnZEC2mX1/c5wL5FbTBn5dF3vrCA
         /dzM9NfY8hFrlEMoXkVcZ0ToRAWTM73oWU/1LqQcplTtkT9I2v6l/GRwWfq04wrfxtF4
         Kvbw58S95Tm0B6gyOnPN2oHdbTz/+7WqU8Vjtbun0zECdjiVm8eYmHksagHeGzSY7CkP
         T7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=VMlRaxZLTZeI3P9Pa2GrCLDCJn7D3hPxG5EuZyCrlOk=;
        b=pOd9qMFnYZkvz1KuHp6brUH4sGni7MWAfvDC5wMV/ybmLC/nJt+EPX+m91/nym9+aV
         Wx8jwhe87ChiI2wcmFUHPcnW565hkDL1tVAjHwi581LggcXLcxtTN15wp/Drex2racwc
         b1uYU/KP3BzzTv+CpNkCUr4GUtPfI3Z/YSVHi8/R7J0SeJmXOSmg1UlzRm/1Sn9iNJsM
         DWJPcxZTjX8gk2uSpi5jGlShfZ9maRXaEiLTL4iWOwbYbelfRXbxSIR4dd7WPmWYwKrN
         oE9vyS4Ny9p8GIC8M7NsBiL3zIKRnVcCZzIcQ7w71FaQzI9tDUi7OhKvbJkXtWLLzqBv
         VqnA==
X-Gm-Message-State: APjAAAXSEMJQeEIReIjPuiHCD9Gk7zbRNjkWHW0jzmqxYjupw3tKlSFh
        TuZqdxZ8vK0+ODU9+FzT/laa9ekH
X-Google-Smtp-Source: APXvYqwIwLSLyl8gksDD8NCAT9Jtasg8CLV1YxR90jbrohIepyrIXNAeZ699zok6dTEgE3N4AYndYQ==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr10508540ple.62.1554434489013;
        Thu, 04 Apr 2019 20:21:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f65sm33086656pff.21.2019.04.04.20.21.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:28 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/16] hwmon: (w83627hf) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:21:01 -0700
Message-Id: <1554434462-6087-15-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/w83627hf.c | 257 +++++++++++++++++++++--------------------------
 1 file changed, 116 insertions(+), 141 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index 8ac89d0781cc..97bbf1af11e8 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -396,7 +396,6 @@ struct w83627hf_data {
 #endif
 };
 
-
 static int w83627hf_probe(struct platform_device *pdev);
 static int w83627hf_remove(struct platform_device *pdev);
 
@@ -482,28 +481,28 @@ static struct platform_driver w83627hf_driver = {
 };
 
 static ssize_t
-show_in_input(struct device *dev, struct device_attribute *devattr, char *buf)
+in_input_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in[nr]));
 }
 static ssize_t
-show_in_min(struct device *dev, struct device_attribute *devattr, char *buf)
+in_min_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in_min[nr]));
 }
 static ssize_t
-show_in_max(struct device *dev, struct device_attribute *devattr, char *buf)
+in_max_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in_max[nr]));
 }
 static ssize_t
-store_in_min(struct device *dev, struct device_attribute *devattr,
+in_min_store(struct device *dev, struct device_attribute *devattr,
 	     const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -522,7 +521,7 @@ store_in_min(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 static ssize_t
-store_in_max(struct device *dev, struct device_attribute *devattr,
+in_max_store(struct device *dev, struct device_attribute *devattr,
 	     const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -540,22 +539,31 @@ store_in_max(struct device *dev, struct device_attribute *devattr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-#define sysfs_vin_decl(offset) \
-static SENSOR_DEVICE_ATTR(in##offset##_input, S_IRUGO,		\
-			  show_in_input, NULL, offset);		\
-static SENSOR_DEVICE_ATTR(in##offset##_min, S_IRUGO|S_IWUSR,	\
-			  show_in_min, store_in_min, offset);	\
-static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO|S_IWUSR,	\
-			  show_in_max, store_in_max, offset);
-
-sysfs_vin_decl(1);
-sysfs_vin_decl(2);
-sysfs_vin_decl(3);
-sysfs_vin_decl(4);
-sysfs_vin_decl(5);
-sysfs_vin_decl(6);
-sysfs_vin_decl(7);
-sysfs_vin_decl(8);
+
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
+static SENSOR_DEVICE_ATTR_RO(in8_input, in_input, 8);
+static SENSOR_DEVICE_ATTR_RW(in8_min, in_min, 8);
+static SENSOR_DEVICE_ATTR_RW(in8_max, in_max, 8);
 
 /* use a different set of functions for in0 */
 static ssize_t show_in_0(struct w83627hf_data *data, char *buf, u8 reg)
@@ -661,7 +669,8 @@ static DEVICE_ATTR_RW(in0_min);
 static DEVICE_ATTR_RW(in0_max);
 
 static ssize_t
-show_fan_input(struct device *dev, struct device_attribute *devattr, char *buf)
+fan_input_show(struct device *dev, struct device_attribute *devattr,
+	       char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -669,7 +678,7 @@ show_fan_input(struct device *dev, struct device_attribute *devattr, char *buf)
 				(long)DIV_FROM_REG(data->fan_div[nr])));
 }
 static ssize_t
-show_fan_min(struct device *dev, struct device_attribute *devattr, char *buf)
+fan_min_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -677,7 +686,7 @@ show_fan_min(struct device *dev, struct device_attribute *devattr, char *buf)
 				(long)DIV_FROM_REG(data->fan_div[nr])));
 }
 static ssize_t
-store_fan_min(struct device *dev, struct device_attribute *devattr,
+fan_min_store(struct device *dev, struct device_attribute *devattr,
 	      const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -697,18 +706,16 @@ store_fan_min(struct device *dev, struct device_attribute *devattr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-#define sysfs_fan_decl(offset)	\
-static SENSOR_DEVICE_ATTR(fan##offset##_input, S_IRUGO,			\
-			  show_fan_input, NULL, offset - 1);		\
-static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
-			  show_fan_min, store_fan_min, offset - 1);
 
-sysfs_fan_decl(1);
-sysfs_fan_decl(2);
-sysfs_fan_decl(3);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan_input, 2);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
 
 static ssize_t
-show_temp(struct device *dev, struct device_attribute *devattr, char *buf)
+temp_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -719,8 +726,7 @@ show_temp(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-show_temp_max(struct device *dev, struct device_attribute *devattr,
-	      char *buf)
+temp_max_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -731,7 +737,7 @@ show_temp_max(struct device *dev, struct device_attribute *devattr,
 }
 
 static ssize_t
-show_temp_max_hyst(struct device *dev, struct device_attribute *devattr,
+temp_max_hyst_show(struct device *dev, struct device_attribute *devattr,
 		   char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -743,7 +749,7 @@ show_temp_max_hyst(struct device *dev, struct device_attribute *devattr,
 }
 
 static ssize_t
-store_temp_max(struct device *dev, struct device_attribute *devattr,
+temp_max_store(struct device *dev, struct device_attribute *devattr,
 	       const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -765,7 +771,7 @@ store_temp_max(struct device *dev, struct device_attribute *devattr,
 }
 
 static ssize_t
-store_temp_max_hyst(struct device *dev, struct device_attribute *devattr,
+temp_max_hyst_store(struct device *dev, struct device_attribute *devattr,
 		    const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -786,17 +792,15 @@ store_temp_max_hyst(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-#define sysfs_temp_decl(offset) \
-static SENSOR_DEVICE_ATTR(temp##offset##_input, S_IRUGO,		\
-			  show_temp, NULL, offset - 1);			\
-static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO|S_IWUSR,	 	\
-			  show_temp_max, store_temp_max, offset - 1);	\
-static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO|S_IWUSR,	\
-			  show_temp_max_hyst, store_temp_max_hyst, offset - 1);
-
-sysfs_temp_decl(1);
-sysfs_temp_decl(2);
-sysfs_temp_decl(3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp_max_hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, temp_max_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, temp_max_hyst, 2);
 
 static ssize_t
 cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -841,27 +845,27 @@ alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
 static DEVICE_ATTR_RO(alarms);
 
 static ssize_t
-show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
+alarm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
 }
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 9);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 16);
-static SENSOR_DEVICE_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL, 17);
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 11);
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 13);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 10);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 16);
+static SENSOR_DEVICE_ATTR_RO(in8_alarm, alarm, 17);
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, 11);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 13);
 
 static ssize_t
 beep_mask_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -902,7 +906,7 @@ beep_mask_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(beep_mask);
 
 static ssize_t
-show_beep(struct device *dev, struct device_attribute *attr, char *buf)
+beep_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83627hf_data *data = w83627hf_update_device(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -910,8 +914,8 @@ show_beep(struct device *dev, struct device_attribute *attr, char *buf)
 }
 
 static ssize_t
-store_beep(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+beep_store(struct device *dev, struct device_attribute *attr, const char *buf,
+	   size_t count)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -959,41 +963,25 @@ store_beep(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(in0_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 0);
-static SENSOR_DEVICE_ATTR(in1_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 1);
-static SENSOR_DEVICE_ATTR(in2_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 2);
-static SENSOR_DEVICE_ATTR(in3_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 3);
-static SENSOR_DEVICE_ATTR(in4_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 8);
-static SENSOR_DEVICE_ATTR(in5_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 9);
-static SENSOR_DEVICE_ATTR(in6_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 10);
-static SENSOR_DEVICE_ATTR(in7_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 16);
-static SENSOR_DEVICE_ATTR(in8_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 17);
-static SENSOR_DEVICE_ATTR(fan1_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 6);
-static SENSOR_DEVICE_ATTR(fan2_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 7);
-static SENSOR_DEVICE_ATTR(fan3_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 11);
-static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 4);
-static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 5);
-static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 13);
-static SENSOR_DEVICE_ATTR(beep_enable, S_IRUGO | S_IWUSR,
-			show_beep, store_beep, 15);
+static SENSOR_DEVICE_ATTR_RW(in0_beep, beep, 0);
+static SENSOR_DEVICE_ATTR_RW(in1_beep, beep, 1);
+static SENSOR_DEVICE_ATTR_RW(in2_beep, beep, 2);
+static SENSOR_DEVICE_ATTR_RW(in3_beep, beep, 3);
+static SENSOR_DEVICE_ATTR_RW(in4_beep, beep, 8);
+static SENSOR_DEVICE_ATTR_RW(in5_beep, beep, 9);
+static SENSOR_DEVICE_ATTR_RW(in6_beep, beep, 10);
+static SENSOR_DEVICE_ATTR_RW(in7_beep, beep, 16);
+static SENSOR_DEVICE_ATTR_RW(in8_beep, beep, 17);
+static SENSOR_DEVICE_ATTR_RW(fan1_beep, beep, 6);
+static SENSOR_DEVICE_ATTR_RW(fan2_beep, beep, 7);
+static SENSOR_DEVICE_ATTR_RW(fan3_beep, beep, 11);
+static SENSOR_DEVICE_ATTR_RW(temp1_beep, beep, 4);
+static SENSOR_DEVICE_ATTR_RW(temp2_beep, beep, 5);
+static SENSOR_DEVICE_ATTR_RW(temp3_beep, beep, 13);
+static SENSOR_DEVICE_ATTR_RW(beep_enable, beep, 15);
 
 static ssize_t
-show_fan_div(struct device *dev, struct device_attribute *devattr, char *buf)
+fan_div_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -1007,7 +995,7 @@ show_fan_div(struct device *dev, struct device_attribute *devattr, char *buf)
  * because the divisor changed.
  */
 static ssize_t
-store_fan_div(struct device *dev, struct device_attribute *devattr,
+fan_div_store(struct device *dev, struct device_attribute *devattr,
 	      const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -1047,15 +1035,12 @@ store_fan_div(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_div, S_IRUGO|S_IWUSR,
-			  show_fan_div, store_fan_div, 0);
-static SENSOR_DEVICE_ATTR(fan2_div, S_IRUGO|S_IWUSR,
-			  show_fan_div, store_fan_div, 1);
-static SENSOR_DEVICE_ATTR(fan3_div, S_IRUGO|S_IWUSR,
-			  show_fan_div, store_fan_div, 2);
+static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_div, fan_div, 2);
 
 static ssize_t
-show_pwm(struct device *dev, struct device_attribute *devattr, char *buf)
+pwm_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -1063,7 +1048,7 @@ show_pwm(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-store_pwm(struct device *dev, struct device_attribute *devattr,
+pwm_store(struct device *dev, struct device_attribute *devattr,
 	  const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -1096,12 +1081,13 @@ store_pwm(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO|S_IWUSR, show_pwm, store_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO|S_IWUSR, show_pwm, store_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO|S_IWUSR, show_pwm, store_pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
 
 static ssize_t
-show_pwm_enable(struct device *dev, struct device_attribute *devattr, char *buf)
+pwm_enable_show(struct device *dev, struct device_attribute *devattr,
+		char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -1109,8 +1095,8 @@ show_pwm_enable(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-store_pwm_enable(struct device *dev, struct device_attribute *devattr,
-	  const char *buf, size_t count)
+pwm_enable_store(struct device *dev, struct device_attribute *devattr,
+		 const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = dev_get_drvdata(dev);
@@ -1134,15 +1120,12 @@ store_pwm_enable(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO|S_IWUSR, show_pwm_enable,
-						  store_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IRUGO|S_IWUSR, show_pwm_enable,
-						  store_pwm_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm3_enable, S_IRUGO|S_IWUSR, show_pwm_enable,
-						  store_pwm_enable, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_enable, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_enable, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_enable, 2);
 
 static ssize_t
-show_pwm_freq(struct device *dev, struct device_attribute *devattr, char *buf)
+pwm_freq_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
 	struct w83627hf_data *data = w83627hf_update_device(dev);
@@ -1155,7 +1138,7 @@ show_pwm_freq(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-store_pwm_freq(struct device *dev, struct device_attribute *devattr,
+pwm_freq_store(struct device *dev, struct device_attribute *devattr,
 	       const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -1186,15 +1169,12 @@ store_pwm_freq(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_freq, S_IRUGO|S_IWUSR,
-			  show_pwm_freq, store_pwm_freq, 0);
-static SENSOR_DEVICE_ATTR(pwm2_freq, S_IRUGO|S_IWUSR,
-			  show_pwm_freq, store_pwm_freq, 1);
-static SENSOR_DEVICE_ATTR(pwm3_freq, S_IRUGO|S_IWUSR,
-			  show_pwm_freq, store_pwm_freq, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm1_freq, pwm_freq, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_freq, pwm_freq, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_freq, pwm_freq, 2);
 
 static ssize_t
-show_temp_type(struct device *dev, struct device_attribute *devattr,
+temp_type_show(struct device *dev, struct device_attribute *devattr,
 	       char *buf)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -1203,7 +1183,7 @@ show_temp_type(struct device *dev, struct device_attribute *devattr,
 }
 
 static ssize_t
-store_temp_type(struct device *dev, struct device_attribute *devattr,
+temp_type_store(struct device *dev, struct device_attribute *devattr,
 		const char *buf, size_t count)
 {
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -1258,13 +1238,9 @@ store_temp_type(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-#define sysfs_temp_type(offset) \
-static SENSOR_DEVICE_ATTR(temp##offset##_type, S_IRUGO | S_IWUSR, \
-			  show_temp_type, store_temp_type, offset - 1);
-
-sysfs_temp_type(1);
-sysfs_temp_type(2);
-sysfs_temp_type(3);
+static SENSOR_DEVICE_ATTR_RW(temp1_type, temp_type, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_type, temp_type, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_type, temp_type, 2);
 
 static ssize_t
 name_show(struct device *dev, struct device_attribute *devattr, char *buf)
@@ -1595,7 +1571,6 @@ static int w83627hf_remove(struct platform_device *pdev)
 	return 0;
 }
 
-
 /* Registers 0x50-0x5f are banked */
 static inline void w83627hf_set_bank(struct w83627hf_data *data, u16 reg)
 {
-- 
2.7.4

