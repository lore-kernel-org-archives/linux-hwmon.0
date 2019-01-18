Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B0CC5ACD5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD49C20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lwfu0Zw4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbfARRP2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:28 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45426 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfARRP2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:28 -0500
Received: by mail-pf1-f196.google.com with SMTP id g62so6883393pfd.12
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IqjC+4sRCa4oDhmLxhmydfUMZ2GWp1n4+icmjXcMxzk=;
        b=Lwfu0Zw4E27XRx4C/X3rwoy7d4nRRwIGsthqzajY9GinVeo17LmU7NnTQO/j2wHbqE
         IgSbDMvn3DK9nOjO8lo4eDrD0vl977wHfle+K/DAoIylGNBkcun+vltuGIxIymHiMkkL
         w7SH4/OqT/aMBcRp+bi1UKBo35FMWWlKq182HKKABDsEulQAGhGK4ELOBvvPCj80D2v7
         fesUZeH51eeBHZhyCr0NriPXkTynOp3AebRfb55viizL23QaUxex5Vmd+11oKHs2LL7C
         sZKIxKJ2Putao0JMB2K8ZY+1uqlCd4fIrnZsh6ZGRBFxYR1Rak9cTEReGGFhqEpIWmsM
         Ie8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=IqjC+4sRCa4oDhmLxhmydfUMZ2GWp1n4+icmjXcMxzk=;
        b=gQau0XiS3a6keNqaTg52l6oerkVeUYiZgyEBsBL3iBD/RDdPZDVFYlHfJDPG6x+uxF
         Xnm6SynZyXgNOuZVX+OsuGBFhCHJAtC/mlnApDdyIhB8ULQjrJ1v/+VSPIO7aIYGc2lc
         Da6o219xwqttxBgaD4XnDHnbUGxCDLujRjFl0Bb6IY5AKYEuVjkbUkqNRLOP0+KbVGus
         Qx7MiyFbo9sHRup9QEE8B/9i6EZ9bjXzCsXoTVumZzuVRFihhdseK7plBmLxNaK2zLN1
         h1Itv0KwIb8AUprR584c124IpVg3jBrENhfPgBZHtGXrG+Iij3JGRsIHdY8/h0OY/4Ix
         Adrw==
X-Gm-Message-State: AJcUukexWVKMNhREGijxxGqIzHAGKlwVnyfZA+vPwchhSh5n4II9xuzz
        TSAeoNESxoe2hmcyub76A4gWtt61
X-Google-Smtp-Source: ALg8bN4RDHoPRVKtoOHclIDvlQfwQiexEMFEDB3CzEO2lh4N2GDjQ2RUAKpJibPybw05KwQng2FtFw==
X-Received: by 2002:a65:6215:: with SMTP id d21mr18522601pgv.289.1547831726450;
        Fri, 18 Jan 2019 09:15:26 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k14sm5675506pgs.52.2019.01.18.09.15.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:25 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/30] hwmon: (pc87427) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:43 -0800
Message-Id: <1547831700-15865-14-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/pc87427.c | 317 ++++++++++++++++++++++--------------------------
 1 file changed, 146 insertions(+), 171 deletions(-)

diff --git a/drivers/hwmon/pc87427.c b/drivers/hwmon/pc87427.c
index dc5a9d5ada51..d1a3f2040c00 100644
--- a/drivers/hwmon/pc87427.c
+++ b/drivers/hwmon/pc87427.c
@@ -384,8 +384,8 @@ static struct pc87427_data *pc87427_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_fan_input(struct device *dev, struct device_attribute
-			      *devattr, char *buf)
+static ssize_t fan_input_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -393,8 +393,8 @@ static ssize_t show_fan_input(struct device *dev, struct device_attribute
 	return sprintf(buf, "%lu\n", fan_from_reg(data->fan[nr]));
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute
-			    *devattr, char *buf)
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -402,8 +402,8 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute
 	return sprintf(buf, "%lu\n", fan_from_reg(data->fan_min[nr]));
 }
 
-static ssize_t show_fan_alarm(struct device *dev, struct device_attribute
-			      *devattr, char *buf)
+static ssize_t fan_alarm_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -412,8 +412,8 @@ static ssize_t show_fan_alarm(struct device *dev, struct device_attribute
 				       & FAN_STATUS_LOSPD));
 }
 
-static ssize_t show_fan_fault(struct device *dev, struct device_attribute
-			      *devattr, char *buf)
+static ssize_t fan_fault_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -422,8 +422,9 @@ static ssize_t show_fan_fault(struct device *dev, struct device_attribute
 				       & FAN_STATUS_STALL));
 }
 
-static ssize_t set_fan_min(struct device *dev, struct device_attribute
-			   *devattr, const char *buf, size_t count)
+static ssize_t fan_min_store(struct device *dev,
+			     struct device_attribute *devattr,
+			     const char *buf, size_t count)
 {
 	struct pc87427_data *data = dev_get_drvdata(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -449,49 +450,41 @@ static ssize_t set_fan_min(struct device *dev, struct device_attribute
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan_input, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO, show_fan_input, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO, show_fan_input, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan7_input, S_IRUGO, show_fan_input, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_input, S_IRUGO, show_fan_input, NULL, 7);
-
-static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 1);
-static SENSOR_DEVICE_ATTR(fan3_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 2);
-static SENSOR_DEVICE_ATTR(fan4_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 3);
-static SENSOR_DEVICE_ATTR(fan5_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 4);
-static SENSOR_DEVICE_ATTR(fan6_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 5);
-static SENSOR_DEVICE_ATTR(fan7_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 6);
-static SENSOR_DEVICE_ATTR(fan8_min, S_IWUSR | S_IRUGO,
-			  show_fan_min, set_fan_min, 7);
-
-static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_fan_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_fan_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_alarm, S_IRUGO, show_fan_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_alarm, S_IRUGO, show_fan_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_alarm, S_IRUGO, show_fan_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_fan_alarm, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan7_alarm, S_IRUGO, show_fan_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_alarm, S_IRUGO, show_fan_alarm, NULL, 7);
-
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, show_fan_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, show_fan_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_fault, S_IRUGO, show_fan_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_fault, S_IRUGO, show_fan_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_fault, S_IRUGO, show_fan_fault, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_fault, S_IRUGO, show_fan_fault, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan7_fault, S_IRUGO, show_fan_fault, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_fault, S_IRUGO, show_fan_fault, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan_input, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan_input, 3);
+static SENSOR_DEVICE_ATTR_RO(fan5_input, fan_input, 4);
+static SENSOR_DEVICE_ATTR_RO(fan6_input, fan_input, 5);
+static SENSOR_DEVICE_ATTR_RO(fan7_input, fan_input, 6);
+static SENSOR_DEVICE_ATTR_RO(fan8_input, fan_input, 7);
+
+static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
+static SENSOR_DEVICE_ATTR_RW(fan5_min, fan_min, 4);
+static SENSOR_DEVICE_ATTR_RW(fan6_min, fan_min, 5);
+static SENSOR_DEVICE_ATTR_RW(fan7_min, fan_min, 6);
+static SENSOR_DEVICE_ATTR_RW(fan8_min, fan_min, 7);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_alarm, fan_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_alarm, fan_alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_alarm, fan_alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_alarm, fan_alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(fan5_alarm, fan_alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(fan6_alarm, fan_alarm, 5);
+static SENSOR_DEVICE_ATTR_RO(fan7_alarm, fan_alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan8_alarm, fan_alarm, 7);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_fault, fan_fault, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_fault, fan_fault, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_fault, fan_fault, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_fault, fan_fault, 3);
+static SENSOR_DEVICE_ATTR_RO(fan5_fault, fan_fault, 4);
+static SENSOR_DEVICE_ATTR_RO(fan6_fault, fan_fault, 5);
+static SENSOR_DEVICE_ATTR_RO(fan7_fault, fan_fault, 6);
+static SENSOR_DEVICE_ATTR_RO(fan8_fault, fan_fault, 7);
 
 static struct attribute *pc87427_attributes_fan[8][5] = {
 	{
@@ -568,8 +561,8 @@ static void update_pwm_enable(struct pc87427_data *data, int nr, u8 mode)
 	outb(data->pwm_enable[nr], iobase + PC87427_REG_PWM_ENABLE);
 }
 
-static ssize_t show_pwm_enable(struct device *dev, struct device_attribute
-			       *devattr, char *buf)
+static ssize_t pwm_enable_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -581,8 +574,9 @@ static ssize_t show_pwm_enable(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", pwm_enable);
 }
 
-static ssize_t set_pwm_enable(struct device *dev, struct device_attribute
-			      *devattr, const char *buf, size_t count)
+static ssize_t pwm_enable_store(struct device *dev,
+				struct device_attribute *devattr,
+				const char *buf, size_t count)
 {
 	struct pc87427_data *data = dev_get_drvdata(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -602,8 +596,8 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute
-			*devattr, char *buf)
+static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -611,8 +605,8 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute
 	return sprintf(buf, "%d\n", (int)data->pwm[nr]);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute
-		       *devattr, const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct pc87427_data *data = dev_get_drvdata(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -657,19 +651,15 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-			  show_pwm_enable, set_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO,
-			  show_pwm_enable, set_pwm_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO,
-			  show_pwm_enable, set_pwm_enable, 2);
-static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO,
-			  show_pwm_enable, set_pwm_enable, 3);
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_enable, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_enable, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_enable, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4_enable, pwm_enable, 3);
 
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
 
 static struct attribute *pc87427_attributes_pwm[4][3] = {
 	{
@@ -698,8 +688,8 @@ static const struct attribute_group pc87427_group_pwm[4] = {
 	{ .attrs = pc87427_attributes_pwm[3] },
 };
 
-static ssize_t show_temp_input(struct device *dev, struct device_attribute
-			       *devattr, char *buf)
+static ssize_t temp_input_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -707,8 +697,8 @@ static ssize_t show_temp_input(struct device *dev, struct device_attribute
 	return sprintf(buf, "%ld\n", temp_from_reg(data->temp[nr]));
 }
 
-static ssize_t show_temp_min(struct device *dev, struct device_attribute
-			     *devattr, char *buf)
+static ssize_t temp_min_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -716,8 +706,8 @@ static ssize_t show_temp_min(struct device *dev, struct device_attribute
 	return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_min[nr]));
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute
-			     *devattr, char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -725,8 +715,8 @@ static ssize_t show_temp_max(struct device *dev, struct device_attribute
 	return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_max[nr]));
 }
 
-static ssize_t show_temp_crit(struct device *dev, struct device_attribute
-			      *devattr, char *buf)
+static ssize_t temp_crit_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -734,8 +724,8 @@ static ssize_t show_temp_crit(struct device *dev, struct device_attribute
 	return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_crit[nr]));
 }
 
-static ssize_t show_temp_type(struct device *dev, struct device_attribute
-			      *devattr, char *buf)
+static ssize_t temp_type_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -743,8 +733,9 @@ static ssize_t show_temp_type(struct device *dev, struct device_attribute
 	return sprintf(buf, "%u\n", temp_type_from_reg(data->temp_type[nr]));
 }
 
-static ssize_t show_temp_min_alarm(struct device *dev, struct device_attribute
-				   *devattr, char *buf)
+static ssize_t temp_min_alarm_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -753,8 +744,9 @@ static ssize_t show_temp_min_alarm(struct device *dev, struct device_attribute
 				       & TEMP_STATUS_LOWFLG));
 }
 
-static ssize_t show_temp_max_alarm(struct device *dev, struct device_attribute
-				   *devattr, char *buf)
+static ssize_t temp_max_alarm_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -763,8 +755,9 @@ static ssize_t show_temp_max_alarm(struct device *dev, struct device_attribute
 				       & TEMP_STATUS_HIGHFLG));
 }
 
-static ssize_t show_temp_crit_alarm(struct device *dev, struct device_attribute
-				   *devattr, char *buf)
+static ssize_t temp_crit_alarm_show(struct device *dev,
+				    struct device_attribute *devattr,
+				    char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -773,8 +766,8 @@ static ssize_t show_temp_crit_alarm(struct device *dev, struct device_attribute
 				       & TEMP_STATUS_CRITFLG));
 }
 
-static ssize_t show_temp_fault(struct device *dev, struct device_attribute
-			       *devattr, char *buf)
+static ssize_t temp_fault_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct pc87427_data *data = pc87427_update_device(dev);
 	int nr = to_sensor_dev_attr(devattr)->index;
@@ -783,86 +776,68 @@ static ssize_t show_temp_fault(struct device *dev, struct device_attribute
 				       & TEMP_STATUS_SENSERR));
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp_input, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp_input, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp_input, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_temp_input, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_temp_input, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_min, S_IRUGO, show_temp_min, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_min, S_IRUGO, show_temp_min, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_min, S_IRUGO, show_temp_min, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_min, S_IRUGO, show_temp_min, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_min, S_IRUGO, show_temp_min, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_min, S_IRUGO, show_temp_min, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, show_temp_max, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO, show_temp_max, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IRUGO, show_temp_max, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IRUGO, show_temp_max, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_max, S_IRUGO, show_temp_max, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_max, S_IRUGO, show_temp_max, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp_crit, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IRUGO, show_temp_crit, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IRUGO, show_temp_crit, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_crit, S_IRUGO, show_temp_crit, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_crit, S_IRUGO, show_temp_crit, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_crit, S_IRUGO, show_temp_crit, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_type, S_IRUGO, show_temp_type, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO, show_temp_type, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO, show_temp_type, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_type, S_IRUGO, show_temp_type, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_type, S_IRUGO, show_temp_type, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_type, S_IRUGO, show_temp_type, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO,
-			  show_temp_min_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO,
-			  show_temp_min_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO,
-			  show_temp_min_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_min_alarm, S_IRUGO,
-			  show_temp_min_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_min_alarm, S_IRUGO,
-			  show_temp_min_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_min_alarm, S_IRUGO,
-			  show_temp_min_alarm, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO,
-			  show_temp_max_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO,
-			  show_temp_max_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO,
-			  show_temp_max_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_max_alarm, S_IRUGO,
-			  show_temp_max_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_max_alarm, S_IRUGO,
-			  show_temp_max_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_max_alarm, S_IRUGO,
-			  show_temp_max_alarm, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO,
-			  show_temp_crit_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO,
-			  show_temp_crit_alarm, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO,
-			  show_temp_crit_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_crit_alarm, S_IRUGO,
-			  show_temp_crit_alarm, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_crit_alarm, S_IRUGO,
-			  show_temp_crit_alarm, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_crit_alarm, S_IRUGO,
-			  show_temp_crit_alarm, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, show_temp_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_temp_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_temp_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_fault, S_IRUGO, show_temp_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_fault, S_IRUGO, show_temp_fault, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_fault, S_IRUGO, show_temp_fault, NULL, 5);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_input, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp_input, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp_input, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, temp_input, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_input, temp_input, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_min, temp_min, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_min, temp_min, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_min, temp_min, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_min, temp_min, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_min, temp_min, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_min, temp_min, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_max, temp_max, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_max, temp_max, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_max, temp_max, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit, temp_crit, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit, temp_crit, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_crit, temp_crit, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_crit, temp_crit, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_crit, temp_crit, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_type, temp_type, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_type, temp_type, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_type, temp_type, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_type, temp_type, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_type, temp_type, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_type, temp_type, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, temp_min_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, temp_min_alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_min_alarm, temp_min_alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_min_alarm, temp_min_alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_min_alarm, temp_min_alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_min_alarm, temp_min_alarm, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, temp_max_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, temp_max_alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, temp_max_alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, temp_max_alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_max_alarm, temp_max_alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_max_alarm, temp_max_alarm, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, temp_crit_alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, temp_crit_alarm, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, temp_crit_alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_crit_alarm, temp_crit_alarm, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_crit_alarm, temp_crit_alarm, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_crit_alarm, temp_crit_alarm, 5);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_fault, temp_fault, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, temp_fault, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, temp_fault, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_fault, temp_fault, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_fault, temp_fault, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_fault, temp_fault, 5);
 
 static struct attribute *pc87427_attributes_temp[6][10] = {
 	{
-- 
2.7.4

