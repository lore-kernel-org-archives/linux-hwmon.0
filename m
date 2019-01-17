Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECB6C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A5E720855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/rpbUHY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbfAQVOF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:05 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46791 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfAQVOE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:04 -0500
Received: by mail-pf1-f195.google.com with SMTP id c73so5409584pfe.13
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=48LmfwR+pLchJCu5bEeWFFVbtD0D/VnUkQL7IQD9lb4=;
        b=K/rpbUHYbXMzi4fxhT/xg2K65fwp0x+2iHEBKsnofmGKLtudd/ea0WEHdwzFeCozAL
         PMG0h10NKLni6JthhI4fxoUW5nED7S0n4DqUyI39JJUb0o3vFVIlYjy5hGQ2cU+6Udfg
         AR/p0ED/U5PQymDzkQjdtTUgmOk/Ug+LoXP7pJiD6TkPrqk5gEhNU1Kfmzgh/mB6VSAo
         MasKIhlsCIps3Ct7BUx2AiAxFuikMscAcdlY/hfOe8Q9Bfe6AS7rKIR8MR+XGWQUZ3uv
         9V/gT3bIsPXtCHBDJzwCWZDUD1OBylXCjG8p5Ibk9Eq+i9i0MswaHJKC2AiAEUu38nVa
         ZoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=48LmfwR+pLchJCu5bEeWFFVbtD0D/VnUkQL7IQD9lb4=;
        b=lLQAhv4VosVyHx/mamvrqILFTHOXcfvULZkvNtDuc+Q9pfWMGicHJt/h/SBSeztmWK
         TSen8Iel26n0li9pt92NaLV7sQ5M4X3PA0+ojOj5Sm+RMPl1x5dCVwO57LTzU9lcotEJ
         CNFR0U0s6JSc35io748u1fy0grzFLfWjvHUCef9HBJJYy8PexCQtXefHrDhoZHXR5uDd
         8q3coKlcjNJjyg2UQ0ZLCB8drA6GWpuq3104JVw19NOrLzIFuULhyN4Sv940qXe76j+B
         YaW/OvbkV4F6GLtYsiu4WFMCTwwNwsJ3OJ3B6Pu3027h+JWL3WptJSm3vCC6QD2xs806
         l8oA==
X-Gm-Message-State: AJcUukcUiyiJhUW6WwhUeMQlg5PZRs/9MpTDvLInuzQEk4GfpqMQneWY
        RtNX8Smny9wprsKjAH/1mhu1A7/r
X-Google-Smtp-Source: ALg8bN4bUzqdG4/abNZSWrW46WgRTY5HIS6utDfOVVgQNF2XdTyK31GMe29ejZU3z7JS0CG03l9nSA==
X-Received: by 2002:a63:40c6:: with SMTP id n189mr14603054pga.355.1547759643642;
        Thu, 17 Jan 2019 13:14:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w10sm3413319pgi.81.2019.01.17.13.14.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:03 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/29] hwmon: (i5500_temp) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:26 -0800
Message-Id: <1547759629-23007-7-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/i5500_temp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/i5500_temp.c b/drivers/hwmon/i5500_temp.c
index 400e0675a90b..a51038c6597d 100644
--- a/drivers/hwmon/i5500_temp.c
+++ b/drivers/hwmon/i5500_temp.c
@@ -58,7 +58,7 @@ static ssize_t temp1_input_show(struct device *dev,
 	return sprintf(buf, "%ld\n", temp);
 }
 
-static ssize_t show_thresh(struct device *dev,
+static ssize_t thresh_show(struct device *dev,
 			   struct device_attribute *devattr, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->parent);
@@ -72,7 +72,7 @@ static ssize_t show_thresh(struct device *dev,
 	return sprintf(buf, "%ld\n", temp);
 }
 
-static ssize_t show_alarm(struct device *dev,
+static ssize_t alarm_show(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->parent);
@@ -84,11 +84,11 @@ static ssize_t show_alarm(struct device *dev,
 }
 
 static DEVICE_ATTR_RO(temp1_input);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, show_thresh, NULL, 0xE2);
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO, show_thresh, NULL, 0xEC);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO, show_thresh, NULL, 0xEE);
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit, thresh, 0xE2);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_hyst, thresh, 0xEC);
+static SENSOR_DEVICE_ATTR_RO(temp1_max, thresh, 0xEE);
+static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
 
 static struct attribute *i5500_temp_attrs[] = {
 	&dev_attr_temp1_input.attr,
-- 
2.7.4

