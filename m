Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275B9C10F00
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E102720693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPphRHwk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfDEDV1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44670 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDV1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id y13so2445593pfm.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7udxywE3KgWZhezLu5ckAcJo8tFTbpQ0tqaSn0NeidY=;
        b=cPphRHwkXweq2a5r2pOLo+7nycoBC0vq0cUudcy1vjbzJu16tuxEysBFMZYUcLYN8Z
         oPstm5K9PBLASl3ivyimg6osg6iIa32kXQPiGDXQTXkFKhbeAwVYiBNyD/12GS9vZJ9i
         b4lRBafRHx56WXvISUk4l54gHNAjGF/s5zB61xsVzrgOCizhrxFJFOPkTSrt9z+S4CiW
         6Cv7CzeQ4YW0JusEFJKzuMPE11f7eBqTQMnuJ1kvwk9nzq2lJ7FnTsuXrEzLZ/KvEPcO
         AIqfuB0bqOXcIzb8pmoMLrLpk52gKa40JDeKxV+l4L0VPpgzAclWl/MOONjLm46lT9IL
         5JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=7udxywE3KgWZhezLu5ckAcJo8tFTbpQ0tqaSn0NeidY=;
        b=GOwiHVyQUt3me5PQJFwurgSM2aVXwVsKUpgOIjiPJWdgz4mmSFtjiPk809/pCjeObp
         IOjChNHSnrenuNYkIvKRmfWgeUFnO0d/PwP/c+2kUbC7BDuDYqRPv1NDPubewDtv99+h
         jDd91Rj0pTCn2PikpeFgvts/A65YWaHFr1+ixQJsNvAEqVGkmDIE84OCd2TAh4c5+HsH
         cul4xXqINRKaJoLVaof8Ld/VfUa8DxhNohODZeQyQ+hsXt5uRSruFJyJzaUyIZhzX50j
         +m+RCg8j1YlxifAsjmHbDef8tJJrvMTXDX63vuJtnJLqern7PKpBAowa0SIna4Mqd0kn
         i9SA==
X-Gm-Message-State: APjAAAX+sQe+1T2D3HCZ8zvz/alIoSr8JSr4tH6LiGHsK9r2Ssj9doUp
        /eVoVdNOb+zdg6L7HQeGWDI2i8xr
X-Google-Smtp-Source: APXvYqxkJj4Q0OxMOw3BYRDzKCAhhwmfttzdYCu1GsVmFS7NqskZcYaS/01mZ/VyjIa69sCuceeQ0Q==
X-Received: by 2002:a65:6283:: with SMTP id f3mr9452896pgv.108.1554434486365;
        Thu, 04 Apr 2019 20:21:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14sm41815912pft.137.2019.04.04.20.21.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:25 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/16] hwmon: (smsc47m192) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:59 -0700
Message-Id: <1554434462-6087-13-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/smsc47m192.c | 146 ++++++++++++++++++++++++---------------------
 1 file changed, 78 insertions(+), 68 deletions(-)

diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
index 6989408033ec..e5d9222b22f1 100644
--- a/drivers/hwmon/smsc47m192.c
+++ b/drivers/hwmon/smsc47m192.c
@@ -179,8 +179,8 @@ static struct smsc47m192_data *smsc47m192_update_device(struct device *dev)
 }
 
 /* Voltages */
-static ssize_t show_in(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -188,8 +188,8 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[nr], nr));
 }
 
-static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_min_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -197,8 +197,8 @@ static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[nr], nr));
 }
 
-static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in_max_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -206,8 +206,8 @@ static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[nr], nr));
 }
 
-static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -228,8 +228,8 @@ static ssize_t set_in_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -250,26 +250,34 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
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
-show_in_offset(0)
-show_in_offset(1)
-show_in_offset(2)
-show_in_offset(3)
-show_in_offset(4)
-show_in_offset(5)
-show_in_offset(6)
-show_in_offset(7)
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
 
 /* Temperatures */
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -277,8 +285,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
 }
 
-static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -286,8 +294,8 @@ static ssize_t show_temp_min(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[nr]));
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -295,8 +303,9 @@ static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[nr]));
 }
 
-static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_min_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -317,8 +326,9 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -339,8 +349,8 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_temp_offset(struct device *dev, struct device_attribute
-		*attr, char *buf)
+static ssize_t temp_offset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -348,8 +358,9 @@ static ssize_t show_temp_offset(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_offset[nr]));
 }
 
-static ssize_t set_temp_offset(struct device *dev, struct device_attribute
-		*attr, const char *buf, size_t count)
+static ssize_t temp_offset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -385,19 +396,18 @@ static ssize_t set_temp_offset(struct device *dev, struct device_attribute
 	return count;
 }
 
-#define show_temp_index(index)						\
-static SENSOR_DEVICE_ATTR(temp##index##_input, S_IRUGO,			\
-		show_temp, NULL, index-1);				\
-static SENSOR_DEVICE_ATTR(temp##index##_min, S_IRUGO | S_IWUSR,		\
-		show_temp_min, set_temp_min, index-1);			\
-static SENSOR_DEVICE_ATTR(temp##index##_max, S_IRUGO | S_IWUSR,		\
-		show_temp_max, set_temp_max, index-1);			\
-static SENSOR_DEVICE_ATTR(temp##index##_offset, S_IRUGO | S_IWUSR,	\
-		show_temp_offset, set_temp_offset, index-1);
-
-show_temp_index(1)
-show_temp_index(2)
-show_temp_index(3)
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_offset, temp_offset, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RW(temp2_offset, temp_offset, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RW(temp3_offset, temp_offset, 2);
 
 /* VID */
 static ssize_t cpu0_vid_show(struct device *dev,
@@ -434,8 +444,8 @@ static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(vrm);
 
 /* Alarms */
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
@@ -443,19 +453,19 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms & nr) ? 1 : 0);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 0x0010);
-static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 0x0020);
-static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 0x0040);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 0x4000);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 0x8000);
-static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0x0001);
-static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 0x0002);
-static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 0x0004);
-static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 0x0008);
-static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 0x0100);
-static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 0x0200);
-static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 0x0400);
-static SENSOR_DEVICE_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 0x0800);
+static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 0x0010);
+static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 0x0020);
+static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 0x0040);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 0x4000);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, 0x8000);
+static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0x0001);
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 0x0002);
+static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 0x0004);
+static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 0x0008);
+static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 0x0100);
+static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 0x0200);
+static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 0x0400);
+static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 0x0800);
 
 static struct attribute *smsc47m192_attributes[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4

