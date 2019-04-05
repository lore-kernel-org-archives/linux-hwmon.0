Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B67C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC0D520693
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 03:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u/NvaB0b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbfDEDVW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 23:21:22 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45325 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbfDEDVW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 23:21:22 -0400
Received: by mail-pl1-f196.google.com with SMTP id bf11so2218707plb.12
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 20:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JCGiqoUjZoEfCl9s321q7caKFm8EFTRmKVgUsYUDf3A=;
        b=u/NvaB0bop4D9dZJf1SI0YsRx6fItXV9pawd2jIE+eiSLIWT8LYt0O0jtKnL20b5Kq
         zeMaWlP0rKvam56Q0JGfQimBTSsejDiUKtnEFUt3vUtv6LGZgL8NkJAr2PDxoNoE33kK
         8BuDBkBBfIUL9YTlwUrNNYebq7d5WW+/u24UbP63JI0i2KDLipAQ5sELFkfiYhsENtrm
         HRO9l/AWhNhdB8kGELhOq74bAnVY4/jDSDo9qsbZT5C+veKarUgexSCuCxex56clbFhC
         dJg3IpKVAvxZ+HvRcsnKx9Zdd86GG0Q+aCINn0L5Am5lm+d/i2lKO3RPpYiyt8yeXDTb
         O0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=JCGiqoUjZoEfCl9s321q7caKFm8EFTRmKVgUsYUDf3A=;
        b=Xc8DYw/vLO2ujEV3C/ESKML0eXt8w6sxmwcrBRd4b5ScyOWvcsbQoR+RfWFs7skjB7
         j8EdQjZHn5OFCAkODsGyrCpr1lANKnnhzkHSlapLs8pO0yk6ebS4vQOFgHlqaOzsUIXf
         25NhEabYvW9kEvoEN1Xmpl3dLNGGMXDrwWh/80DYDjDg/G/+t/gpjdXGx22QbcYrOJ8x
         3FdlieDGD2lE6Tcvpe+m/AexUGzl/D/41ynZU9isAGXVC+0r2wW2ta/SrrVGcHw2NDJH
         W8q8zRcxAqdpK1Fd6WvpCPPv/5w6c9P4hKcwrVeO4VTufmozLSTL+yIa01ctGXyK6Kpy
         2vBQ==
X-Gm-Message-State: APjAAAXRFM1qJzsvY2pl3XgJg9bnOl7Red0SYlR2r9EDFeICrpdccgcF
        TiBRWC24CXCzyQJP+D7SBc24DzJD
X-Google-Smtp-Source: APXvYqyogTEU29XRfWvsGmFqRoBx/FZHb1Pf60DYonXJr377Tw3yCZhlePON2EAAi5uYfavSN7b0ug==
X-Received: by 2002:a17:902:7885:: with SMTP id q5mr10508264pll.12.1554434481210;
        Thu, 04 Apr 2019 20:21:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f15sm12100287pgf.18.2019.04.04.20.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 20:21:20 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andreas Werner <andreas.werner@men.de>
Subject: [PATCH 10/16] hwmon: (menf21bmc_hwmon) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu,  4 Apr 2019 20:20:56 -0700
Message-Id: <1554434462-6087-10-git-send-email-linux@roeck-us.net>
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

Cc: Andreas Werner <andreas.werner@men.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/menf21bmc_hwmon.c | 43 +++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/menf21bmc_hwmon.c b/drivers/hwmon/menf21bmc_hwmon.c
index c29a4c3c6b9e..f540f938fcd9 100644
--- a/drivers/hwmon/menf21bmc_hwmon.c
+++ b/drivers/hwmon/menf21bmc_hwmon.c
@@ -101,7 +101,7 @@ static int menf21bmc_hwmon_get_volt_limits(struct menf21bmc_hwmon *drv_data)
 }
 
 static ssize_t
-show_label(struct device *dev, struct device_attribute *devattr, char *buf)
+label_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
@@ -109,7 +109,7 @@ show_label(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-show_in(struct device *dev, struct device_attribute *devattr, char *buf)
+in_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct menf21bmc_hwmon *drv_data = menf21bmc_hwmon_update(dev);
@@ -121,7 +121,7 @@ show_in(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-show_min(struct device *dev, struct device_attribute *devattr, char *buf)
+min_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct menf21bmc_hwmon *drv_data = dev_get_drvdata(dev);
@@ -130,7 +130,7 @@ show_min(struct device *dev, struct device_attribute *devattr, char *buf)
 }
 
 static ssize_t
-show_max(struct device *dev, struct device_attribute *devattr, char *buf)
+max_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct menf21bmc_hwmon *drv_data = dev_get_drvdata(dev);
@@ -138,21 +138,26 @@ show_max(struct device *dev, struct device_attribute *devattr, char *buf)
 	return sprintf(buf, "%d\n", drv_data->in_max[attr->index]);
 }
 
-#define create_voltage_sysfs(idx)			\
-static SENSOR_DEVICE_ATTR(in##idx##_input, S_IRUGO,	\
-			show_in, NULL, idx);		\
-static SENSOR_DEVICE_ATTR(in##idx##_min, S_IRUGO,	\
-			show_min, NULL, idx);		\
-static SENSOR_DEVICE_ATTR(in##idx##_max, S_IRUGO,	\
-			show_max, NULL, idx);		\
-static SENSOR_DEVICE_ATTR(in##idx##_label, S_IRUGO,	\
-			show_label, NULL, idx);
-
-create_voltage_sysfs(0);
-create_voltage_sysfs(1);
-create_voltage_sysfs(2);
-create_voltage_sysfs(3);
-create_voltage_sysfs(4);
+static SENSOR_DEVICE_ATTR_RO(in0_input, in, 0);
+static SENSOR_DEVICE_ATTR_RO(in0_min, min, 0);
+static SENSOR_DEVICE_ATTR_RO(in0_max, max, 0);
+static SENSOR_DEVICE_ATTR_RO(in0_label, label, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, in, 1);
+static SENSOR_DEVICE_ATTR_RO(in1_min, min, 1);
+static SENSOR_DEVICE_ATTR_RO(in1_max, max, 1);
+static SENSOR_DEVICE_ATTR_RO(in1_label, label, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, in, 2);
+static SENSOR_DEVICE_ATTR_RO(in2_min, min, 2);
+static SENSOR_DEVICE_ATTR_RO(in2_max, max, 2);
+static SENSOR_DEVICE_ATTR_RO(in2_label, label, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, in, 3);
+static SENSOR_DEVICE_ATTR_RO(in3_min, min, 3);
+static SENSOR_DEVICE_ATTR_RO(in3_max, max, 3);
+static SENSOR_DEVICE_ATTR_RO(in3_label, label, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, in, 4);
+static SENSOR_DEVICE_ATTR_RO(in4_min, min, 4);
+static SENSOR_DEVICE_ATTR_RO(in4_max, max, 4);
+static SENSOR_DEVICE_ATTR_RO(in4_label, label, 4);
 
 static struct attribute *menf21bmc_hwmon_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4

