Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3553CC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDB5120855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS8NvAgh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbfAQVOU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34488 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVOU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:20 -0500
Received: by mail-pg1-f196.google.com with SMTP id j10so5000898pga.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ak5yQqZYBwnhl/i08+TDEwF23NtB8vOPcOlwQevEnqQ=;
        b=QS8NvAghpMPlZym8JonA9A6J5MM/Usn0W2RyrsTwp6Zpjc4Q3B0FnAgj4OosOnPVvW
         gENKVopsfbrjcVz8Xxg7Lr6ojv52niOPgQnze0Gx2LqHYQ6b6fabMBgUVEq43CXpVxCZ
         PFTkMaTCDv8ObtThR5bAKVbTH+DSZnfFBuM3CyCFELRuCFPF9XhgahDdVKtBpbSBqxIC
         GACwpu5IECxxN9kDwQyghFA3xsnAFp529UE1cPSvftYmICgeyOtDUQQ9MB6d22I7WjQ+
         OvEf2bmZUzVkeSkgPp8IOEYPNdwwYulQOZF7RniU3l92l5k90OYaJt78zsmBFwCp0JlT
         3xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Ak5yQqZYBwnhl/i08+TDEwF23NtB8vOPcOlwQevEnqQ=;
        b=WnU6Ol8SJGwicTVebHTSwbjM94RPwKH0hzZkh/GDPVys1giLDk5I2s8MRyWIpVMSlF
         cpPZ3/YL+LLizeZPtImcVD7T7JiWyyb2qu4n7wqXRT9rUcfS9Dj0VAiR9//zVgqLNr3v
         qcv0GXJGs6b2UGkrcUGgD1oHc0OU5Dd8rIZpKOeeczkRQtkU4wuwBFaxj+KE55ol34Gw
         wGoycOj/qqawEMMRRqc9cB+73y6669oezP75s2b0+M2oxKhZOV2w/XFC5NwuglvTggk3
         zyfjkOrz0pn20gzvjY3WI0fNiJHEFHrJ6hN/arpqLNoeoP/PIUA99FkfHZdA65u05Uss
         aSZA==
X-Gm-Message-State: AJcUukcdECQipFSbDBftrfKRhV/iqCuWJwnLqNTVmFxPWZJ6xRHLaMXf
        uzJsXzyyj3olIItzT7XE/LzrZOHY
X-Google-Smtp-Source: ALg8bN7KqoDPAW5VwWgQxebVk23OVCvt5NCifaKf07cZTuOjohfLZTGY16F+81SXGQ+2Wf10Fe70qw==
X-Received: by 2002:a62:c583:: with SMTP id j125mr16662591pfg.37.1547759658407;
        Thu, 17 Jan 2019 13:14:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e9sm3487504pff.5.2019.01.17.13.14.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:17 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/29] hwmon: (lineage-pem) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:35 -0800
Message-Id: <1547759629-23007-16-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lineage-pem.c | 77 +++++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/lineage-pem.c b/drivers/hwmon/lineage-pem.c
index 84d791bdb62d..d470295760e2 100644
--- a/drivers/hwmon/lineage-pem.c
+++ b/drivers/hwmon/lineage-pem.c
@@ -282,8 +282,8 @@ static long pem_get_fan(u8 *data, int len, int index)
  * Show boolean, either a fault or an alarm.
  * .nr points to the register, .index is the bit mask to check
  */
-static ssize_t pem_show_bool(struct device *dev,
-			     struct device_attribute *da, char *buf)
+static ssize_t pem_bool_show(struct device *dev, struct device_attribute *da,
+			     char *buf)
 {
 	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
 	struct pem_data *data = pem_update_device(dev);
@@ -296,7 +296,7 @@ static ssize_t pem_show_bool(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", !!status);
 }
 
-static ssize_t pem_show_data(struct device *dev, struct device_attribute *da,
+static ssize_t pem_data_show(struct device *dev, struct device_attribute *da,
 			     char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -312,7 +312,7 @@ static ssize_t pem_show_data(struct device *dev, struct device_attribute *da,
 	return snprintf(buf, PAGE_SIZE, "%ld\n", value);
 }
 
-static ssize_t pem_show_input(struct device *dev, struct device_attribute *da,
+static ssize_t pem_input_show(struct device *dev, struct device_attribute *da,
 			      char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -328,7 +328,7 @@ static ssize_t pem_show_input(struct device *dev, struct device_attribute *da,
 	return snprintf(buf, PAGE_SIZE, "%ld\n", value);
 }
 
-static ssize_t pem_show_fan(struct device *dev, struct device_attribute *da,
+static ssize_t pem_fan_show(struct device *dev, struct device_attribute *da,
 			    char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
@@ -345,53 +345,42 @@ static ssize_t pem_show_fan(struct device *dev, struct device_attribute *da,
 }
 
 /* Voltages */
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, pem_show_data, NULL,
-			  PEM_DATA_VOUT_LSB);
-static SENSOR_DEVICE_ATTR_2(in1_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1, ALRM1_VOUT_OUT_LIMIT);
-static SENSOR_DEVICE_ATTR_2(in1_crit_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1, ALRM1_OV_VOLT_SHUTDOWN);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, pem_show_input, NULL,
-			  PEM_INPUT_VOLTAGE);
-static SENSOR_DEVICE_ATTR_2(in2_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1,
-			    ALRM1_VIN_OUT_LIMIT | ALRM1_PRIMARY_FAULT);
+static SENSOR_DEVICE_ATTR_RO(in1_input, pem_data, PEM_DATA_VOUT_LSB);
+static SENSOR_DEVICE_ATTR_2_RO(in1_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_VOUT_OUT_LIMIT);
+static SENSOR_DEVICE_ATTR_2_RO(in1_crit_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_OV_VOLT_SHUTDOWN);
+static SENSOR_DEVICE_ATTR_RO(in2_input, pem_input, PEM_INPUT_VOLTAGE);
+static SENSOR_DEVICE_ATTR_2_RO(in2_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_VIN_OUT_LIMIT | ALRM1_PRIMARY_FAULT);
 
 /* Currents */
-static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, pem_show_data, NULL,
-			  PEM_DATA_CURRENT);
-static SENSOR_DEVICE_ATTR_2(curr1_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1, ALRM1_VIN_OVERCURRENT);
+static SENSOR_DEVICE_ATTR_RO(curr1_input, pem_data, PEM_DATA_CURRENT);
+static SENSOR_DEVICE_ATTR_2_RO(curr1_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_VIN_OVERCURRENT);
 
 /* Power */
-static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, pem_show_input, NULL,
-			  PEM_INPUT_POWER_LSB);
-static SENSOR_DEVICE_ATTR_2(power1_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1, ALRM1_POWER_LIMIT);
+static SENSOR_DEVICE_ATTR_RO(power1_input, pem_input, PEM_INPUT_POWER_LSB);
+static SENSOR_DEVICE_ATTR_2_RO(power1_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_POWER_LIMIT);
 
 /* Fans */
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, pem_show_fan, NULL,
-			  PEM_FAN_FAN1);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, pem_show_fan, NULL,
-			  PEM_FAN_FAN2);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, pem_show_fan, NULL,
-			  PEM_FAN_FAN3);
-static SENSOR_DEVICE_ATTR_2(fan1_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_2, ALRM2_FAN_FAULT);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, pem_fan, PEM_FAN_FAN1);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, pem_fan, PEM_FAN_FAN2);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, pem_fan, PEM_FAN_FAN3);
+static SENSOR_DEVICE_ATTR_2_RO(fan1_alarm, pem_bool, PEM_DATA_ALARM_2,
+			       ALRM2_FAN_FAULT);
 
 /* Temperatures */
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, pem_show_data, NULL,
-			  PEM_DATA_TEMP);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, pem_show_data, NULL,
-			  PEM_DATA_TEMP_MAX);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, pem_show_data, NULL,
-			  PEM_DATA_TEMP_CRIT);
-static SENSOR_DEVICE_ATTR_2(temp1_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1, ALRM1_TEMP_WARNING);
-static SENSOR_DEVICE_ATTR_2(temp1_crit_alarm, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_1, ALRM1_TEMP_SHUTDOWN);
-static SENSOR_DEVICE_ATTR_2(temp1_fault, S_IRUGO, pem_show_bool, NULL,
-			    PEM_DATA_ALARM_2, ALRM2_TEMP_FAULT);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, pem_data, PEM_DATA_TEMP);
+static SENSOR_DEVICE_ATTR_RO(temp1_max, pem_data, PEM_DATA_TEMP_MAX);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, pem_data, PEM_DATA_TEMP_CRIT);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_TEMP_WARNING);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_crit_alarm, pem_bool, PEM_DATA_ALARM_1,
+			       ALRM1_TEMP_SHUTDOWN);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_fault, pem_bool, PEM_DATA_ALARM_2,
+			       ALRM2_TEMP_FAULT);
 
 static struct attribute *pem_attributes[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,
-- 
2.7.4

