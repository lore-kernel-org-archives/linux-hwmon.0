Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0EFC5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EA9920850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X701kMTc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbfARRPb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:31 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45966 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfARRPb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:31 -0500
Received: by mail-pg1-f196.google.com with SMTP id y4so6329062pgc.12
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UUh4tfFpkPz03mvzU2sfpk44YtsMU3RPoxkUZyTKXz0=;
        b=X701kMTc/ez7pzSgRq816qRTrahvImJ30HNiZRXJCqkzF9ieOtnLofFvbFGoSN7G1b
         7brSXySdIml5Wk0drapUaiIq80WSmiQb9fE38APz3JW+8AViyWsYgKFO7m+q//gx0SEz
         FbrrdWzOlxO4YNDP1pGnwo1p+d+2bEgsvLW/Ms+9VJZq+iWu5uSohNJMvmnsPeE0KtdN
         KGDbje7ZHfnvnW+zWjqu5G7bF27at0KhBtc+xodwcn6r463GjGRxMQdw7d8UpijV7bda
         iKUMBdFrItPUVF1nSLykyNOTWEvlXNhwSp0YmBsU9QnwoD5r7ut9hiTq3QhBGWbj58CA
         n+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=UUh4tfFpkPz03mvzU2sfpk44YtsMU3RPoxkUZyTKXz0=;
        b=ANmud7Ei4Gbgae4967hFUAgMce+DJ0QjNscvNPH163pKseF04xKyV8M4eecRqCHCxX
         RsDL1+2WCARTCueax2+Ncry47vo4/ffZ8SpoS2Cov4NqzDnilJk7cy95+LXM9aDE77Of
         XAjiAjJtTJ7jDnybJrfpsS5H26ioKfRa5FEQnKiP69eiwgJGlSYCam/NLDh/TtML1W4g
         3Jgs3qVpZQN04uDUBCimvMMOXvSyqpYJvrbXnmI5CoxhxUAirfoxxCfU3MfSplZS9bpb
         5JeNC7cEcPZdFKl3952HgFd2PZV0UdiQjE2OTWo4TCOkzHQJVdWNoCJFfF1WNgQcRgRE
         Z0wA==
X-Gm-Message-State: AJcUuke/MInuxX+4YIctB3OaijN70lbVG89TUDCu1BCBjWww8so/AgkL
        69GJKRUtliuLQbPdtg9Rp5J/ve6N
X-Google-Smtp-Source: ALg8bN7EFhV599vzoct3WEk5FbCMuwbzmDk0vGQ/voE63tIeQzbCA7Dq4LsTveFN1YEN4k//fKFh6A==
X-Received: by 2002:aa7:8542:: with SMTP id y2mr20410079pfn.83.1547831729538;
        Fri, 18 Jan 2019 09:15:29 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d21sm7847469pfo.162.2019.01.18.09.15.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:28 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 15/30] hwmon: (sch5627) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:45 -0800
Message-Id: <1547831700-15865-16-git-send-email-linux@roeck-us.net>
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

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sch5627.c | 146 ++++++++++++++++++++++++------------------------
 1 file changed, 73 insertions(+), 73 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index 91544f2312e6..63cfbc5a86ed 100644
--- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -211,8 +211,8 @@ static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 	return snprintf(buf, PAGE_SIZE, "%s\n", DEVNAME);
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = sch5627_update_device(dev);
@@ -225,8 +225,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_temp_fault(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_fault_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = sch5627_update_device(dev);
@@ -237,8 +237,8 @@ static ssize_t show_temp_fault(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", data->temp[attr->index] == 0);
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = dev_get_drvdata(dev);
@@ -248,8 +248,8 @@ static ssize_t show_temp_max(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_temp_crit(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t temp_crit_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = dev_get_drvdata(dev);
@@ -259,8 +259,8 @@ static ssize_t show_temp_crit(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = sch5627_update_device(dev);
@@ -276,8 +276,8 @@ static ssize_t show_fan(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_fan_fault(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t fan_fault_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = sch5627_update_device(dev);
@@ -289,8 +289,8 @@ static ssize_t show_fan_fault(struct device *dev, struct device_attribute
 			data->fan[attr->index] == 0xffff);
 }
 
-static ssize_t show_fan_min(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t fan_min_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = dev_get_drvdata(dev);
@@ -301,8 +301,8 @@ static ssize_t show_fan_min(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_in(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *devattr,
+		       char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct sch5627_data *data = sch5627_update_device(dev);
@@ -317,8 +317,8 @@ static ssize_t show_in(struct device *dev, struct device_attribute
 	return snprintf(buf, PAGE_SIZE, "%d\n", val);
 }
 
-static ssize_t show_in_label(struct device *dev, struct device_attribute
-	*devattr, char *buf)
+static ssize_t in_label_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
@@ -327,61 +327,61 @@ static ssize_t show_in_label(struct device *dev, struct device_attribute
 }
 
 static DEVICE_ATTR_RO(name);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_temp, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, show_temp, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, show_temp, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, show_temp_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_temp_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_temp_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_fault, S_IRUGO, show_temp_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_fault, S_IRUGO, show_temp_fault, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_fault, S_IRUGO, show_temp_fault, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp7_fault, S_IRUGO, show_temp_fault, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp8_fault, S_IRUGO, show_temp_fault, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, show_temp_max, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IRUGO, show_temp_max, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IRUGO, show_temp_max, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IRUGO, show_temp_max, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_max, S_IRUGO, show_temp_max, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_max, S_IRUGO, show_temp_max, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp7_max, S_IRUGO, show_temp_max, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp8_max, S_IRUGO, show_temp_max, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp_crit, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IRUGO, show_temp_crit, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IRUGO, show_temp_crit, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_crit, S_IRUGO, show_temp_crit, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_crit, S_IRUGO, show_temp_crit, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp6_crit, S_IRUGO, show_temp_crit, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp7_crit, S_IRUGO, show_temp_crit, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp8_crit, S_IRUGO, show_temp_crit, NULL, 7);
-
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, show_fan_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, show_fan_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_fault, S_IRUGO, show_fan_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_fault, S_IRUGO, show_fan_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan1_min, S_IRUGO, show_fan_min, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_min, S_IRUGO, show_fan_min, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_min, S_IRUGO, show_fan_min, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_min, S_IRUGO, show_fan_min, NULL, 3);
-
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, show_in, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, show_in, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, show_in, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, show_in, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, show_in, NULL, 4);
-static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO, show_in_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_label, S_IRUGO, show_in_label, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_label, S_IRUGO, show_in_label, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_label, S_IRUGO, show_in_label, NULL, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_input, temp, 5);
+static SENSOR_DEVICE_ATTR_RO(temp7_input, temp, 6);
+static SENSOR_DEVICE_ATTR_RO(temp8_input, temp, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_fault, temp_fault, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, temp_fault, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, temp_fault, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_fault, temp_fault, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_fault, temp_fault, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_fault, temp_fault, 5);
+static SENSOR_DEVICE_ATTR_RO(temp7_fault, temp_fault, 6);
+static SENSOR_DEVICE_ATTR_RO(temp8_fault, temp_fault, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_max, temp_max, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_max, temp_max, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_max, temp_max, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_max, temp_max, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_max, temp_max, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_max, temp_max, 5);
+static SENSOR_DEVICE_ATTR_RO(temp7_max, temp_max, 6);
+static SENSOR_DEVICE_ATTR_RO(temp8_max, temp_max, 7);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp_crit, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit, temp_crit, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit, temp_crit, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_crit, temp_crit, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_crit, temp_crit, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_crit, temp_crit, 5);
+static SENSOR_DEVICE_ATTR_RO(temp7_crit, temp_crit, 6);
+static SENSOR_DEVICE_ATTR_RO(temp8_crit, temp_crit, 7);
+
+static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_fault, fan_fault, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_fault, fan_fault, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_fault, fan_fault, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_fault, fan_fault, 3);
+static SENSOR_DEVICE_ATTR_RO(fan1_min, fan_min, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_min, fan_min, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_min, fan_min, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_min, fan_min, 3);
+
+static SENSOR_DEVICE_ATTR_RO(in0_input, in, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, in, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, in, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, in, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, in, 4);
+static SENSOR_DEVICE_ATTR_RO(in0_label, in_label, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_label, in_label, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_label, in_label, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_label, in_label, 3);
 
 static struct attribute *sch5627_attributes[] = {
 	&dev_attr_name.attr,
-- 
2.7.4

