Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9E0C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BB2D20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiJEFyjf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbfAQVOf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:35 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43594 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfAQVOf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:35 -0500
Received: by mail-pg1-f196.google.com with SMTP id v28so4978331pgk.10
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O4o6rrpdDERbNg7wAWvLpR74oudHi4ZtoHaCGZ8VGHg=;
        b=aiJEFyjf7xWin1A7uXtgfKtYASlQkav49f+eGsGWiidDNTTgv7VNeiDupszktpMzaB
         9NwYe3E90jEADYuMp5Y/2FaJcGZ+EpoJq0Ul2vb44s6Lic/y+wVCz70dTBYFZ3RxusbC
         BzzezBOHsS6l/gRnrYGgas5MHrFIKDsHp0WIdynRpcASOsbNqHS+oUq+DSuPmf8cbpm4
         P+8BhNHVNUIxjR0d9GvUfAvUsXiwDEFLP/vE6gbzfMSGSxVkQuyVe3e2YV7R+9is3w8j
         VL8LW2o9CtLttSDnavOQGml1v5+YwIw8e2BCu7K04k/R0MGdf1SG5oAecEevHj8MLYl3
         QJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=O4o6rrpdDERbNg7wAWvLpR74oudHi4ZtoHaCGZ8VGHg=;
        b=SvgUCvim8utHKoc5ByAYjND01PQR1JXueAEP+mnDMVkDxMrjRNynsHto4cqukmfHsH
         J6nPiERCYLqAiGBgz9dDrWhQe9w+eU520zmf2jAQG1Iwo8bdbZ690Av32dx6Wg69z6ih
         HGlEyUXZ0quC6b37mH7pFZxY88MATV95OGXKxuI4pLmPSubVi7WUgg0tKxM2BsQemy0w
         GDpdUdngyQYg9eAVEVfk6lXXswjbUWLHskIJOawBAtXsDLK8N3jgQ4ppHaVcVcTXo6uz
         eBtRE7vo4AQiIrJtKY/qvMEDg0Z6s5RtZg6WJvT2T/kpFVkC2+c9bDdO1BYobUWyCG8f
         ykuw==
X-Gm-Message-State: AJcUukcTx/zzbEoseeaNcD7Sx1hsjOk8zkCLRccjUDPDCrtFTToKervk
        fSN0XUvWKDefbHlMDVvKT8p9L6vG
X-Google-Smtp-Source: ALg8bN4iRHfgtv7UJtWglt83FTK5UtGHRunQoQwC6Qiw2MdxQCQnEW5VWx9tfXgQnyP1ImZG4UgHLA==
X-Received: by 2002:a63:6150:: with SMTP id v77mr14649236pgb.266.1547759674312;
        Thu, 17 Jan 2019 13:14:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9sm2635401pgd.53.2019.01.17.13.14.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:33 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 24/29] hwmon: (lm95241) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:44 -0800
Message-Id: <1547759629-23007-25-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm95241.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 8c573e6e9726..3ff188937158 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -349,19 +349,19 @@ static umode_t lm95241_is_visible(const void *data,
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			return S_IRUGO | S_IWUSR;
+			return 0644;
 		}
 		break;
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp_input:
-			return S_IRUGO;
+			return 0444;
 		case hwmon_temp_fault:
-			return S_IRUGO;
+			return 0444;
 		case hwmon_temp_min:
 		case hwmon_temp_max:
 		case hwmon_temp_type:
-			return S_IRUGO | S_IWUSR;
+			return 0644;
 		}
 		break;
 	default:
-- 
2.7.4

