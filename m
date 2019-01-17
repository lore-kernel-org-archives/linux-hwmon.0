Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCE1C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF44220855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftJUvApk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbfAQVOG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:06 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44504 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfAQVOG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:06 -0500
Received: by mail-pf1-f195.google.com with SMTP id u6so5416599pfh.11
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JVs2+vUWrbs1sUEGMyhyGuVRYb9oTyBLjoe+e8rENr0=;
        b=ftJUvApkD4Zdy3sSZzow3osJuAGQYUHhwgbXHRrIlTj0zDOxiCwDdTLEM0lGDR4sut
         ebUcqB/+wf+Tylkkq1PwUjdKPri4nByMRvB7o2bhobGrXquc/eP73PUVlC+/WFjZgQQj
         UHyt0OeBRGYfIR1yP1HhQyMRWSgImaeeoFumfHzKwrDbspguzCRNbIRAu67L2YNNGoep
         p8wKeiuW4rXWZpJrTeknAhVIoU8sb8tkhjyrtTrpHoLALiCub7rab++tC1NCbiWib/9l
         3D682ZfOT83XOY3MdvLIo4kwyRj2UGXtvUSSccRCSkj9B+908gTVHliU1BhBckux8xY2
         wnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=JVs2+vUWrbs1sUEGMyhyGuVRYb9oTyBLjoe+e8rENr0=;
        b=OcS36IImsHyfFfxSySQawS0rff+IZTtEoOOVuk9zEGwgcLb0+LhCcfTz3XTL+uKnKv
         JR4mDZ8rvncGP1nEOBfjQvaoUfHR8KTErIjGLySjP4/Dcx3W8oWNdDXuqjqeA0dOl+TJ
         g7WbToZxeiJVlDoy4fmx8kBX3An5zVZl6TnPsvG5oy6TVY4klZa7Xtg822ptNkrJyg2O
         94ttL1Ut/BQAwsxErIiiBhYfoEdv3RWfsAH0EReiWif/vZIo6CYC4xB5rj8pzXvAfIki
         Y8WDwSeeWTIw06KwEpuo/p8ARplt889p1OTnqLlr1ptk+hlnH8tMm8eOF6nnCvAuKv8z
         HqFA==
X-Gm-Message-State: AJcUukcsiqIo6WBcamGHjqw1A3t70YEqB5Tsoxnk+duWZwJ/fZEyqAgR
        uqOOUKsl5FztdzWp9Yas5J88I6iX
X-Google-Smtp-Source: ALg8bN4fvldp1KZz6iUMFJOU3Nx98XC1HMqNw2f+S2cLjOXCWA8PL1qRXtEqbHDWc/qjo/eAEh195g==
X-Received: by 2002:a63:5402:: with SMTP id i2mr14630604pgb.79.1547759645377;
        Thu, 17 Jan 2019 13:14:05 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w185sm3754858pfb.135.2019.01.17.13.14.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:04 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/29] hwmon: (i5k_amb) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:27 -0800
Message-Id: <1547759629-23007-8-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/i5k_amb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index a4edc43dd060..2cf73d8eec1c 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -296,7 +296,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 			snprintf(iattr->name, AMB_SYSFS_NAME_LEN,
 				 "temp%d_label", d);
 			iattr->s_attr.dev_attr.attr.name = iattr->name;
-			iattr->s_attr.dev_attr.attr.mode = S_IRUGO;
+			iattr->s_attr.dev_attr.attr.mode = 0444;
 			iattr->s_attr.dev_attr.show = show_label;
 			iattr->s_attr.index = k;
 			sysfs_attr_init(&iattr->s_attr.dev_attr.attr);
@@ -311,7 +311,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 			snprintf(iattr->name, AMB_SYSFS_NAME_LEN,
 				 "temp%d_input", d);
 			iattr->s_attr.dev_attr.attr.name = iattr->name;
-			iattr->s_attr.dev_attr.attr.mode = S_IRUGO;
+			iattr->s_attr.dev_attr.attr.mode = 0444;
 			iattr->s_attr.dev_attr.show = show_amb_temp;
 			iattr->s_attr.index = k;
 			sysfs_attr_init(&iattr->s_attr.dev_attr.attr);
@@ -326,7 +326,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 			snprintf(iattr->name, AMB_SYSFS_NAME_LEN,
 				 "temp%d_min", d);
 			iattr->s_attr.dev_attr.attr.name = iattr->name;
-			iattr->s_attr.dev_attr.attr.mode = S_IWUSR | S_IRUGO;
+			iattr->s_attr.dev_attr.attr.mode = 0644;
 			iattr->s_attr.dev_attr.show = show_amb_min;
 			iattr->s_attr.dev_attr.store = store_amb_min;
 			iattr->s_attr.index = k;
@@ -342,7 +342,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 			snprintf(iattr->name, AMB_SYSFS_NAME_LEN,
 				 "temp%d_mid", d);
 			iattr->s_attr.dev_attr.attr.name = iattr->name;
-			iattr->s_attr.dev_attr.attr.mode = S_IWUSR | S_IRUGO;
+			iattr->s_attr.dev_attr.attr.mode = 0644;
 			iattr->s_attr.dev_attr.show = show_amb_mid;
 			iattr->s_attr.dev_attr.store = store_amb_mid;
 			iattr->s_attr.index = k;
@@ -358,7 +358,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 			snprintf(iattr->name, AMB_SYSFS_NAME_LEN,
 				 "temp%d_max", d);
 			iattr->s_attr.dev_attr.attr.name = iattr->name;
-			iattr->s_attr.dev_attr.attr.mode = S_IWUSR | S_IRUGO;
+			iattr->s_attr.dev_attr.attr.mode = 0644;
 			iattr->s_attr.dev_attr.show = show_amb_max;
 			iattr->s_attr.dev_attr.store = store_amb_max;
 			iattr->s_attr.index = k;
@@ -374,7 +374,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 			snprintf(iattr->name, AMB_SYSFS_NAME_LEN,
 				 "temp%d_alarm", d);
 			iattr->s_attr.dev_attr.attr.name = iattr->name;
-			iattr->s_attr.dev_attr.attr.mode = S_IRUGO;
+			iattr->s_attr.dev_attr.attr.mode = 0444;
 			iattr->s_attr.dev_attr.show = show_amb_alarm;
 			iattr->s_attr.index = k;
 			sysfs_attr_init(&iattr->s_attr.dev_attr.attr);
-- 
2.7.4

