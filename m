Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5F9C5ACD5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A35E20850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GczFouCw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfARRPS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:18 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34642 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:18 -0500
Received: by mail-pl1-f194.google.com with SMTP id w4so6634260plz.1
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M6tKEm/ZOhGipiMbl/7kYQMhs8TH1OH/+hjhGYmxdX4=;
        b=GczFouCwHwdRAGH683jNYgi++iGpAA60epzWnclZtIwtyHvBKthKEoDRYH20tdD0P0
         tBT/mlTo1YKl4me2nbNywM3HLuWT+kxQpAAgd6cCsQSqzotUG6Rf5P/RC4/4vt1i60QM
         hrfMQWNIvHVzL1wMPCsdVZIMEtldwR1RWGdxzaUUKlGMy+QKCTpNdiBg/yltkyQz7qjW
         vo9O/JQCNb7ZJceyn3RnAPizSPuFNMfvigFcWLmmoOrpgBp6WHnyusQSZEfXw8biJRfC
         MyahZBbXAZeY7Vi69WqYEQa1Hv2erytQqO3gKCOtLhtHfrDBzMtjgMzRRITmgLfN4aPv
         dluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=M6tKEm/ZOhGipiMbl/7kYQMhs8TH1OH/+hjhGYmxdX4=;
        b=OosHrHVc66XT/P6IG901+nNIj7cOVrehLmxJeeOLcvv2iQEZz5iW0JYbCNiB/fdPYl
         pfcC2X+3tPMtAEuDnzs57MlFwZIoXhWCD1aomU5H7VXl72sComot/oU3nbCqX+16VCzK
         HBZSQgvumRjUzL9S2/keZwIPFQ7LVP+3LxaT/otxyRg0cNUssk6mhmc9+lmLtBSr69ST
         BYWwsxla86cHPCZiuzQOqG4fobXEdmPWQB05tP/3ohiaufPxv3taMp46ZvCNsKVnRiJB
         0tslmXIn46aZ2DMGGle+iYXHehUKjdZJrSicYDwmi25eOpiUG9keGxNDDJB9r3cjG5XR
         LGiw==
X-Gm-Message-State: AJcUukf+W+yWwIKfBDHlinMpwWxZEv755fdVYMmekR9uPKJoKM4lIUsI
        tQVlk2gYS3LMpvEVaqXnprFXCPKH
X-Google-Smtp-Source: ALg8bN5SnDQHJxwA2aQgsh+jWO+xFUEyYEtJTaaOF3nECxtBg251i9yOou4bADZLDKAjNQHTKRw9WQ==
X-Received: by 2002:a17:902:346:: with SMTP id 64mr20432539pld.337.1547831716763;
        Fri, 18 Jan 2019 09:15:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm5980155pgl.64.2019.01.18.09.15.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:16 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/30] hwmon: (max6642) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:37 -0800
Message-Id: <1547831700-15865-8-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max6642.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/max6642.c b/drivers/hwmon/max6642.c
index 6520bc51d02a..084b2685b7a5 100644
--- a/drivers/hwmon/max6642.c
+++ b/drivers/hwmon/max6642.c
@@ -206,7 +206,7 @@ static struct max6642_data *max6642_update_device(struct device *dev)
  * Sysfs stuff
  */
 
-static ssize_t show_temp_max10(struct device *dev,
+static ssize_t temp_max10_show(struct device *dev,
 			       struct device_attribute *dev_attr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
@@ -216,8 +216,8 @@ static ssize_t show_temp_max10(struct device *dev,
 		       temp_from_reg10(data->temp_input[attr->index]));
 }
 
-static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t temp_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
 	struct max6642_data *data = max6642_update_device(dev);
@@ -225,8 +225,9 @@ static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", temp_from_reg(data->temp_high[attr2->nr]));
 }
 
-static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
+static ssize_t temp_max_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
 	struct max6642_data *data = dev_get_drvdata(dev);
@@ -245,7 +246,7 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
@@ -253,15 +254,15 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_max10, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp_max10, NULL, 1);
-static SENSOR_DEVICE_ATTR_2(temp1_max, S_IWUSR | S_IRUGO, show_temp_max,
-			    set_temp_max, 0, MAX6642_REG_W_LOCAL_HIGH);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IWUSR | S_IRUGO, show_temp_max,
-			    set_temp_max, 1, MAX6642_REG_W_REMOTE_HIGH);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 4);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_max10, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp_max10, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp_max, 0,
+			       MAX6642_REG_W_LOCAL_HIGH);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp_max, 1,
+			       MAX6642_REG_W_REMOTE_HIGH);
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, 2);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 6);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, 4);
 
 static struct attribute *max6642_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4

