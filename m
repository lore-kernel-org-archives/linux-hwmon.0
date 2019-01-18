Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9A8C5ACD5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2BC920896
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfZcUTkT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfARRPV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:21 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41283 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:21 -0500
Received: by mail-pl1-f194.google.com with SMTP id u6so6608611plm.8
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4oIsdjxGOCijNl1RPtgUN3eQ/DxJibsPZFtSzV9a5Wk=;
        b=FfZcUTkTbJVqGHVN4/DpP2b4SjSmQl4EVvfrV6M2ypEYHkEIiUTBVgthQPoqjfKguN
         4fV71WDEMJoWxiWRCSCDSJB5swKHq/p6C+MPiCWX7RqglQMmqgQzsB4rYQfGHjYMMRbS
         o5DuhP4RyG2oayrrdFbXzzir2oVqqKNXUDht8J8povDUKa5OOXakWrvCLja1UD+2Rqs5
         HYnRaa01DIO2R5cPk6dQDI4fbmvp1G8xli+OrnFsHrXAhQdNC06YzD/eYLDBx9H+K9aB
         r5lB17keUwcreZs9037aamivFluzHTRrjTDWuqKYGcZQxQFwGHwlyyB0+i4PKo5Dkf5A
         v36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=4oIsdjxGOCijNl1RPtgUN3eQ/DxJibsPZFtSzV9a5Wk=;
        b=BipvhHOVJ/OFP13TcEptlZv7R44243BhkCvsgFeA4FPQRkkrq68uajLl4d+Cklj4xZ
         GSPXCSmCDWeSl26yRUvtURAc1SuglqMHct55OSOhvpFCH91g3coI4irjkf6WezJfOdON
         +v3qMeqX3GlUoX5Hqe+pmhWtL76iE8nq9viZdNwX/ZXcTsyE9MnEs0fxggMx2nOMdiXf
         vr7RT7cZBj7EVW/+V1sSzAn2PATpzDNvMjNxnQJELMeNpeqK7yJuEhrkfFmQxSeet4FX
         KtxEPA4MtP2LuRXnJaF3EYKZyXjAYP2Ia504s5S8MRpj7rd0i8PFA4Dp6L4I5XRJr5D+
         tyiQ==
X-Gm-Message-State: AJcUukeP1D7h0wIQmgAShFQQJb+UPgTAo7bSNDO/h/O+v2yv+fn4iC46
        0/CuZT/8ijkDnMnWSXfgCBxJydAp
X-Google-Smtp-Source: ALg8bN7+lS8obRssZA1e+xOopXdqyWj81qe4zXa1YE9D37e0JAM1eJZAokuMMOZT4DLAzCvl3jUjHQ==
X-Received: by 2002:a17:902:9897:: with SMTP id s23mr19199113plp.69.1547831720010;
        Fri, 18 Jan 2019 09:15:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 125sm6227005pfx.159.2019.01.18.09.15.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:19 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/30] hwmon: (mc13783-adc) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:39 -0800
Message-Id: <1547831700-15865-10-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/mc13783-adc.c | 49 ++++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/mc13783-adc.c b/drivers/hwmon/mc13783-adc.c
index 825b922a3f92..ff147e5e1b8c 100644
--- a/drivers/hwmon/mc13783-adc.c
+++ b/drivers/hwmon/mc13783-adc.c
@@ -63,8 +63,9 @@ static int mc13783_adc_read(struct device *dev,
 	return 0;
 }
 
-static ssize_t mc13783_adc_read_bp(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t mc13783_adc_bp_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	unsigned val;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -86,8 +87,9 @@ static ssize_t mc13783_adc_read_bp(struct device *dev,
 	return sprintf(buf, "%u\n", val);
 }
 
-static ssize_t mc13783_adc_read_gp(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t mc13783_adc_gp_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	unsigned val;
 	int ret = mc13783_adc_read(dev, devattr, &val);
@@ -104,8 +106,9 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,
 	return sprintf(buf, "%u\n", val);
 }
 
-static ssize_t mc13783_adc_read_uid(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t mc13783_adc_uid_show(struct device *dev,
+				    struct device_attribute *devattr,
+				    char *buf)
 {
 	unsigned int val;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -125,8 +128,9 @@ static ssize_t mc13783_adc_read_uid(struct device *dev,
 	return sprintf(buf, "%u\n", val);
 }
 
-static ssize_t mc13783_adc_read_temp(struct device *dev,
-		struct device_attribute *devattr, char *buf)
+static ssize_t mc13783_adc_temp_show(struct device *dev,
+				     struct device_attribute *devattr,
+				     char *buf)
 {
 	unsigned int val;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -156,21 +160,20 @@ static ssize_t mc13783_adc_read_temp(struct device *dev,
 }
 
 static DEVICE_ATTR_RO(name);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, mc13783_adc_read_bp, NULL, 2);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, mc13783_adc_read_gp, NULL, 5);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, mc13783_adc_read_gp, NULL, 6);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, mc13783_adc_read_gp, NULL, 7);
-static SENSOR_DEVICE_ATTR(in8_input, S_IRUGO, mc13783_adc_read_gp, NULL, 8);
-static SENSOR_DEVICE_ATTR(in9_input, S_IRUGO, mc13783_adc_read_gp, NULL, 9);
-static SENSOR_DEVICE_ATTR(in10_input, S_IRUGO, mc13783_adc_read_gp, NULL, 10);
-static SENSOR_DEVICE_ATTR(in11_input, S_IRUGO, mc13783_adc_read_gp, NULL, 11);
-static SENSOR_DEVICE_ATTR(in12_input, S_IRUGO, mc13783_adc_read_gp, NULL, 12);
-static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, mc13783_adc_read_gp, NULL, 13);
-static SENSOR_DEVICE_ATTR(in14_input, S_IRUGO, mc13783_adc_read_gp, NULL, 14);
-static SENSOR_DEVICE_ATTR(in15_input, S_IRUGO, mc13783_adc_read_gp, NULL, 15);
-static SENSOR_DEVICE_ATTR(in16_input, S_IRUGO, mc13783_adc_read_uid, NULL, 16);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
-			  mc13783_adc_read_temp, NULL, 17);
+static SENSOR_DEVICE_ATTR_RO(in2_input, mc13783_adc_bp, 2);
+static SENSOR_DEVICE_ATTR_RO(in5_input, mc13783_adc_gp, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, mc13783_adc_gp, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_input, mc13783_adc_gp, 7);
+static SENSOR_DEVICE_ATTR_RO(in8_input, mc13783_adc_gp, 8);
+static SENSOR_DEVICE_ATTR_RO(in9_input, mc13783_adc_gp, 9);
+static SENSOR_DEVICE_ATTR_RO(in10_input, mc13783_adc_gp, 10);
+static SENSOR_DEVICE_ATTR_RO(in11_input, mc13783_adc_gp, 11);
+static SENSOR_DEVICE_ATTR_RO(in12_input, mc13783_adc_gp, 12);
+static SENSOR_DEVICE_ATTR_RO(in13_input, mc13783_adc_gp, 13);
+static SENSOR_DEVICE_ATTR_RO(in14_input, mc13783_adc_gp, 14);
+static SENSOR_DEVICE_ATTR_RO(in15_input, mc13783_adc_gp, 15);
+static SENSOR_DEVICE_ATTR_RO(in16_input, mc13783_adc_uid, 16);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, mc13783_adc_temp, 17);
 
 static struct attribute *mc13783_attr_base[] = {
 	&dev_attr_name.attr,
-- 
2.7.4

