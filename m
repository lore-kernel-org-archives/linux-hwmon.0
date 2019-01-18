Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F61FC5ACD6
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EE6B20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIRexIvr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbfARRPc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:32 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35802 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfARRPc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:32 -0500
Received: by mail-pf1-f196.google.com with SMTP id z9so6911616pfi.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8lGZc+6hLP4/5In4R2y6fI9VDTy/pLmPp1aI2D7OmeI=;
        b=YIRexIvrTjlvFwhkaROQoELxkytsMgp3YMFW8pxo/R6tRbE35+XcbxQFC4hbJjIdY8
         7TvRZtqI3LY3e+vssbigrp2k8DIJ+PafT0xevpzNORo21Ubely7NseUnN1UptdcKSBzL
         tfWBCzhRa2exbP6uAoK9kmJBAf3g6FeX9PLIaRghQNNXHVES1cTQ0dADhkUiVKyAL6B8
         rgT5SCgiYhrUNtUeQtsJlmXNxmbvdq/tl81DLBxiiRWPIWWg/TQdZnwzxyhvIQsusTp9
         7IM+r6zSCNXf29r1s6sDZMiAaUTql6cgHJv/Mas6FZDhUrmbyORaBfkyHZRGhzoyfCEY
         7XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=8lGZc+6hLP4/5In4R2y6fI9VDTy/pLmPp1aI2D7OmeI=;
        b=Xzrmq66zHh4ewYuMWTphufq0fRjpnpXM+YDFLUUkV/FBLh4xmx6Zx3KhjNlE4keCGY
         Ws2JFzhYoJezyzQ8odt3dQiMjHCLdCWxl8MNDJaLvuGOpKhdOHQgZ1humK+QCEVKI0Ty
         epNYNSoghA5P/U63UXamjOi8dRIi3nSrvbRHUTPBADl+zx+S46e0GPgXLTUZf9FB9Kh4
         DtE/Mf9NDm18xjeZ1a2O1K/hcvlQRohRpU+u6eVSiUYzbFVqCPJ33h+b056zA+JNRMU8
         eRksmvFPE4LUESsFJGG+UYxAOHDe5RWq8DKaMG0OYE+ww+e/4P/9el1BMyYt4qjKSj3V
         eUcQ==
X-Gm-Message-State: AJcUukfUrqs4gLEJgQAvBs+gEb5uta5Fnzm+s0cNOmrg/+oUo3EP87Xx
        OpQ6eh/wsSPueHtMH6c4lSj5osuF
X-Google-Smtp-Source: ALg8bN6NRamIbsHowVibyw6ggdHNbspSpq40zM/YYgTo7Q24MRXgFIx8ux6Nw9t9MtTnpva8rMKZXg==
X-Received: by 2002:a62:5910:: with SMTP id n16mr19962291pfb.128.1547831731130;
        Fri, 18 Jan 2019 09:15:31 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n78sm12502526pfk.19.2019.01.18.09.15.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:30 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/30] hwmon: (sch5636) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:46 -0800
Message-Id: <1547831700-15865-17-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/sch5636.c | 202 ++++++++++++++++++++++++------------------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index d24d7b6047f2..2a3825603a77 100644
--- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -170,14 +170,14 @@ static int reg_to_rpm(u16 reg)
 	return 5400540 / reg;
 }
 
-static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
-	char *buf)
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s\n", DEVNAME);
 }
 
-static ssize_t show_in_value(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t in_value_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -192,8 +192,8 @@ static ssize_t show_in_value(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_in_label(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t in_label_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
@@ -201,8 +201,8 @@ static ssize_t show_in_label(struct device *dev, struct device_attribute
 			SCH5636_IN_LABELS[attr->index]);
 }
 
-static ssize_t show_temp_value(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_value_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -215,8 +215,8 @@ static ssize_t show_temp_value(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_temp_fault(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_fault_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -229,8 +229,8 @@ static ssize_t show_temp_fault(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_temp_alarm(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_alarm_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -243,8 +243,8 @@ static ssize_t show_temp_alarm(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_fan_value(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t fan_value_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -260,8 +260,8 @@ static ssize_t show_fan_value(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_fan_fault(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t fan_fault_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -274,8 +274,8 @@ static ssize_t show_fan_fault(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_fan_alarm(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t fan_alarm_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5636_data *data = sch5636_update_device(dev);
@@ -289,95 +289,95 @@ static ssize_t show_fan_alarm(struct device *dev, struct device_attribute
 }
 
 static struct sensor_device_attribute sch5636_attr[] = {
-	SENSOR_ATTR(name, 0444, show_name, NULL, 0),
-	SENSOR_ATTR(in0_input, 0444, show_in_value, NULL, 0),
-	SENSOR_ATTR(in0_label, 0444, show_in_label, NULL, 0),
-	SENSOR_ATTR(in1_input, 0444, show_in_value, NULL, 1),
-	SENSOR_ATTR(in1_label, 0444, show_in_label, NULL, 1),
-	SENSOR_ATTR(in2_input, 0444, show_in_value, NULL, 2),
-	SENSOR_ATTR(in2_label, 0444, show_in_label, NULL, 2),
-	SENSOR_ATTR(in3_input, 0444, show_in_value, NULL, 3),
-	SENSOR_ATTR(in3_label, 0444, show_in_label, NULL, 3),
-	SENSOR_ATTR(in4_input, 0444, show_in_value, NULL, 4),
-	SENSOR_ATTR(in4_label, 0444, show_in_label, NULL, 4),
+	SENSOR_ATTR_RO(name, name, 0),
+	SENSOR_ATTR_RO(in0_input, in_value, 0),
+	SENSOR_ATTR_RO(in0_label, in_label, 0),
+	SENSOR_ATTR_RO(in1_input, in_value, 1),
+	SENSOR_ATTR_RO(in1_label, in_label, 1),
+	SENSOR_ATTR_RO(in2_input, in_value, 2),
+	SENSOR_ATTR_RO(in2_label, in_label, 2),
+	SENSOR_ATTR_RO(in3_input, in_value, 3),
+	SENSOR_ATTR_RO(in3_label, in_label, 3),
+	SENSOR_ATTR_RO(in4_input, in_value, 4),
+	SENSOR_ATTR_RO(in4_label, in_label, 4),
 };
 
 static struct sensor_device_attribute sch5636_temp_attr[] = {
-	SENSOR_ATTR(temp1_input, 0444, show_temp_value, NULL, 0),
-	SENSOR_ATTR(temp1_fault, 0444, show_temp_fault, NULL, 0),
-	SENSOR_ATTR(temp1_alarm, 0444, show_temp_alarm, NULL, 0),
-	SENSOR_ATTR(temp2_input, 0444, show_temp_value, NULL, 1),
-	SENSOR_ATTR(temp2_fault, 0444, show_temp_fault, NULL, 1),
-	SENSOR_ATTR(temp2_alarm, 0444, show_temp_alarm, NULL, 1),
-	SENSOR_ATTR(temp3_input, 0444, show_temp_value, NULL, 2),
-	SENSOR_ATTR(temp3_fault, 0444, show_temp_fault, NULL, 2),
-	SENSOR_ATTR(temp3_alarm, 0444, show_temp_alarm, NULL, 2),
-	SENSOR_ATTR(temp4_input, 0444, show_temp_value, NULL, 3),
-	SENSOR_ATTR(temp4_fault, 0444, show_temp_fault, NULL, 3),
-	SENSOR_ATTR(temp4_alarm, 0444, show_temp_alarm, NULL, 3),
-	SENSOR_ATTR(temp5_input, 0444, show_temp_value, NULL, 4),
-	SENSOR_ATTR(temp5_fault, 0444, show_temp_fault, NULL, 4),
-	SENSOR_ATTR(temp5_alarm, 0444, show_temp_alarm, NULL, 4),
-	SENSOR_ATTR(temp6_input, 0444, show_temp_value, NULL, 5),
-	SENSOR_ATTR(temp6_fault, 0444, show_temp_fault, NULL, 5),
-	SENSOR_ATTR(temp6_alarm, 0444, show_temp_alarm, NULL, 5),
-	SENSOR_ATTR(temp7_input, 0444, show_temp_value, NULL, 6),
-	SENSOR_ATTR(temp7_fault, 0444, show_temp_fault, NULL, 6),
-	SENSOR_ATTR(temp7_alarm, 0444, show_temp_alarm, NULL, 6),
-	SENSOR_ATTR(temp8_input, 0444, show_temp_value, NULL, 7),
-	SENSOR_ATTR(temp8_fault, 0444, show_temp_fault, NULL, 7),
-	SENSOR_ATTR(temp8_alarm, 0444, show_temp_alarm, NULL, 7),
-	SENSOR_ATTR(temp9_input, 0444, show_temp_value, NULL, 8),
-	SENSOR_ATTR(temp9_fault, 0444, show_temp_fault, NULL, 8),
-	SENSOR_ATTR(temp9_alarm, 0444, show_temp_alarm, NULL, 8),
-	SENSOR_ATTR(temp10_input, 0444, show_temp_value, NULL, 9),
-	SENSOR_ATTR(temp10_fault, 0444, show_temp_fault, NULL, 9),
-	SENSOR_ATTR(temp10_alarm, 0444, show_temp_alarm, NULL, 9),
-	SENSOR_ATTR(temp11_input, 0444, show_temp_value, NULL, 10),
-	SENSOR_ATTR(temp11_fault, 0444, show_temp_fault, NULL, 10),
-	SENSOR_ATTR(temp11_alarm, 0444, show_temp_alarm, NULL, 10),
-	SENSOR_ATTR(temp12_input, 0444, show_temp_value, NULL, 11),
-	SENSOR_ATTR(temp12_fault, 0444, show_temp_fault, NULL, 11),
-	SENSOR_ATTR(temp12_alarm, 0444, show_temp_alarm, NULL, 11),
-	SENSOR_ATTR(temp13_input, 0444, show_temp_value, NULL, 12),
-	SENSOR_ATTR(temp13_fault, 0444, show_temp_fault, NULL, 12),
-	SENSOR_ATTR(temp13_alarm, 0444, show_temp_alarm, NULL, 12),
-	SENSOR_ATTR(temp14_input, 0444, show_temp_value, NULL, 13),
-	SENSOR_ATTR(temp14_fault, 0444, show_temp_fault, NULL, 13),
-	SENSOR_ATTR(temp14_alarm, 0444, show_temp_alarm, NULL, 13),
-	SENSOR_ATTR(temp15_input, 0444, show_temp_value, NULL, 14),
-	SENSOR_ATTR(temp15_fault, 0444, show_temp_fault, NULL, 14),
-	SENSOR_ATTR(temp15_alarm, 0444, show_temp_alarm, NULL, 14),
-	SENSOR_ATTR(temp16_input, 0444, show_temp_value, NULL, 15),
-	SENSOR_ATTR(temp16_fault, 0444, show_temp_fault, NULL, 15),
-	SENSOR_ATTR(temp16_alarm, 0444, show_temp_alarm, NULL, 15),
+	SENSOR_ATTR_RO(temp1_input, temp_value, 0),
+	SENSOR_ATTR_RO(temp1_fault, temp_fault, 0),
+	SENSOR_ATTR_RO(temp1_alarm, temp_alarm, 0),
+	SENSOR_ATTR_RO(temp2_input, temp_value, 1),
+	SENSOR_ATTR_RO(temp2_fault, temp_fault, 1),
+	SENSOR_ATTR_RO(temp2_alarm, temp_alarm, 1),
+	SENSOR_ATTR_RO(temp3_input, temp_value, 2),
+	SENSOR_ATTR_RO(temp3_fault, temp_fault, 2),
+	SENSOR_ATTR_RO(temp3_alarm, temp_alarm, 2),
+	SENSOR_ATTR_RO(temp4_input, temp_value, 3),
+	SENSOR_ATTR_RO(temp4_fault, temp_fault, 3),
+	SENSOR_ATTR_RO(temp4_alarm, temp_alarm, 3),
+	SENSOR_ATTR_RO(temp5_input, temp_value, 4),
+	SENSOR_ATTR_RO(temp5_fault, temp_fault, 4),
+	SENSOR_ATTR_RO(temp5_alarm, temp_alarm, 4),
+	SENSOR_ATTR_RO(temp6_input, temp_value, 5),
+	SENSOR_ATTR_RO(temp6_fault, temp_fault, 5),
+	SENSOR_ATTR_RO(temp6_alarm, temp_alarm, 5),
+	SENSOR_ATTR_RO(temp7_input, temp_value, 6),
+	SENSOR_ATTR_RO(temp7_fault, temp_fault, 6),
+	SENSOR_ATTR_RO(temp7_alarm, temp_alarm, 6),
+	SENSOR_ATTR_RO(temp8_input, temp_value, 7),
+	SENSOR_ATTR_RO(temp8_fault, temp_fault, 7),
+	SENSOR_ATTR_RO(temp8_alarm, temp_alarm, 7),
+	SENSOR_ATTR_RO(temp9_input, temp_value, 8),
+	SENSOR_ATTR_RO(temp9_fault, temp_fault, 8),
+	SENSOR_ATTR_RO(temp9_alarm, temp_alarm, 8),
+	SENSOR_ATTR_RO(temp10_input, temp_value, 9),
+	SENSOR_ATTR_RO(temp10_fault, temp_fault, 9),
+	SENSOR_ATTR_RO(temp10_alarm, temp_alarm, 9),
+	SENSOR_ATTR_RO(temp11_input, temp_value, 10),
+	SENSOR_ATTR_RO(temp11_fault, temp_fault, 10),
+	SENSOR_ATTR_RO(temp11_alarm, temp_alarm, 10),
+	SENSOR_ATTR_RO(temp12_input, temp_value, 11),
+	SENSOR_ATTR_RO(temp12_fault, temp_fault, 11),
+	SENSOR_ATTR_RO(temp12_alarm, temp_alarm, 11),
+	SENSOR_ATTR_RO(temp13_input, temp_value, 12),
+	SENSOR_ATTR_RO(temp13_fault, temp_fault, 12),
+	SENSOR_ATTR_RO(temp13_alarm, temp_alarm, 12),
+	SENSOR_ATTR_RO(temp14_input, temp_value, 13),
+	SENSOR_ATTR_RO(temp14_fault, temp_fault, 13),
+	SENSOR_ATTR_RO(temp14_alarm, temp_alarm, 13),
+	SENSOR_ATTR_RO(temp15_input, temp_value, 14),
+	SENSOR_ATTR_RO(temp15_fault, temp_fault, 14),
+	SENSOR_ATTR_RO(temp15_alarm, temp_alarm, 14),
+	SENSOR_ATTR_RO(temp16_input, temp_value, 15),
+	SENSOR_ATTR_RO(temp16_fault, temp_fault, 15),
+	SENSOR_ATTR_RO(temp16_alarm, temp_alarm, 15),
 };
 
 static struct sensor_device_attribute sch5636_fan_attr[] = {
-	SENSOR_ATTR(fan1_input, 0444, show_fan_value, NULL, 0),
-	SENSOR_ATTR(fan1_fault, 0444, show_fan_fault, NULL, 0),
-	SENSOR_ATTR(fan1_alarm, 0444, show_fan_alarm, NULL, 0),
-	SENSOR_ATTR(fan2_input, 0444, show_fan_value, NULL, 1),
-	SENSOR_ATTR(fan2_fault, 0444, show_fan_fault, NULL, 1),
-	SENSOR_ATTR(fan2_alarm, 0444, show_fan_alarm, NULL, 1),
-	SENSOR_ATTR(fan3_input, 0444, show_fan_value, NULL, 2),
-	SENSOR_ATTR(fan3_fault, 0444, show_fan_fault, NULL, 2),
-	SENSOR_ATTR(fan3_alarm, 0444, show_fan_alarm, NULL, 2),
-	SENSOR_ATTR(fan4_input, 0444, show_fan_value, NULL, 3),
-	SENSOR_ATTR(fan4_fault, 0444, show_fan_fault, NULL, 3),
-	SENSOR_ATTR(fan4_alarm, 0444, show_fan_alarm, NULL, 3),
-	SENSOR_ATTR(fan5_input, 0444, show_fan_value, NULL, 4),
-	SENSOR_ATTR(fan5_fault, 0444, show_fan_fault, NULL, 4),
-	SENSOR_ATTR(fan5_alarm, 0444, show_fan_alarm, NULL, 4),
-	SENSOR_ATTR(fan6_input, 0444, show_fan_value, NULL, 5),
-	SENSOR_ATTR(fan6_fault, 0444, show_fan_fault, NULL, 5),
-	SENSOR_ATTR(fan6_alarm, 0444, show_fan_alarm, NULL, 5),
-	SENSOR_ATTR(fan7_input, 0444, show_fan_value, NULL, 6),
-	SENSOR_ATTR(fan7_fault, 0444, show_fan_fault, NULL, 6),
-	SENSOR_ATTR(fan7_alarm, 0444, show_fan_alarm, NULL, 6),
-	SENSOR_ATTR(fan8_input, 0444, show_fan_value, NULL, 7),
-	SENSOR_ATTR(fan8_fault, 0444, show_fan_fault, NULL, 7),
-	SENSOR_ATTR(fan8_alarm, 0444, show_fan_alarm, NULL, 7),
+	SENSOR_ATTR_RO(fan1_input, fan_value, 0),
+	SENSOR_ATTR_RO(fan1_fault, fan_fault, 0),
+	SENSOR_ATTR_RO(fan1_alarm, fan_alarm, 0),
+	SENSOR_ATTR_RO(fan2_input, fan_value, 1),
+	SENSOR_ATTR_RO(fan2_fault, fan_fault, 1),
+	SENSOR_ATTR_RO(fan2_alarm, fan_alarm, 1),
+	SENSOR_ATTR_RO(fan3_input, fan_value, 2),
+	SENSOR_ATTR_RO(fan3_fault, fan_fault, 2),
+	SENSOR_ATTR_RO(fan3_alarm, fan_alarm, 2),
+	SENSOR_ATTR_RO(fan4_input, fan_value, 3),
+	SENSOR_ATTR_RO(fan4_fault, fan_fault, 3),
+	SENSOR_ATTR_RO(fan4_alarm, fan_alarm, 3),
+	SENSOR_ATTR_RO(fan5_input, fan_value, 4),
+	SENSOR_ATTR_RO(fan5_fault, fan_fault, 4),
+	SENSOR_ATTR_RO(fan5_alarm, fan_alarm, 4),
+	SENSOR_ATTR_RO(fan6_input, fan_value, 5),
+	SENSOR_ATTR_RO(fan6_fault, fan_fault, 5),
+	SENSOR_ATTR_RO(fan6_alarm, fan_alarm, 5),
+	SENSOR_ATTR_RO(fan7_input, fan_value, 6),
+	SENSOR_ATTR_RO(fan7_fault, fan_fault, 6),
+	SENSOR_ATTR_RO(fan7_alarm, fan_alarm, 6),
+	SENSOR_ATTR_RO(fan8_input, fan_value, 7),
+	SENSOR_ATTR_RO(fan8_fault, fan_fault, 7),
+	SENSOR_ATTR_RO(fan8_alarm, fan_alarm, 7),
 };
 
 static int sch5636_remove(struct platform_device *pdev)
-- 
2.7.4

