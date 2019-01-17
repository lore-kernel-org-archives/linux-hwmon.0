Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E3EC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF04720855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4vSbHPL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbfAQVOa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:30 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39180 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfAQVOa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:30 -0500
Received: by mail-pg1-f196.google.com with SMTP id w6so4986938pgl.6
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x0+ND3oN1efrXphYsthVrA2mU6vQ0dqg4bRDgsUTLhI=;
        b=P4vSbHPLC2gUZv2mBL/e0oab3dMKOrXACxy+Q4fKc2Kl5I99m6VN5HgZEucbPZr3yE
         9AVDpR1V//yx0eYbAWVGYmH9Inyi82tRwnG8q4Ihfq/EkEGcKh/HrKFYHzT+RMxVsiwC
         VVKUGqKVTrhDzO92WzGiLRxV/5hnpxozkE/keVyAin1tfzmeYSroDK7oOSOmHm6UdLbF
         pOT8t+ipjmMbgxx2Bkzccq+/mwYEm0f/nceDAbIkqwJPNTo7c6WG86F6fP3A/HKueRwC
         WfKxijAbW1PrJTQOdrZ7563wz4YjWlpvhQmaxikhqokvFzj+rFf2sYX3P7S9d4i8VYLb
         5Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=x0+ND3oN1efrXphYsthVrA2mU6vQ0dqg4bRDgsUTLhI=;
        b=Cmj5RBB3W+OpXTpUKzIWMxiMG1UouD+CegpmijVnceUih/sAAzGdEfQqj8osC/uZLi
         TmHnu6kwx26KtrkOqVC5cQO07EyMIM/HqSb6CzVPuTjCNWJlEC/5F0koLVLE9naKxRIJ
         CWFaGbYLdfEmMZsFp2g0Cns258b22qyuky8fzf1MxIVoctd1fFmNOVp+p3mKEIFlbrhx
         +AcrYUMQTX+PbbzL7clG0DmBnDkOc8S+yfps0HLx9Erj3KHEhX7szVItJDHc9bWi6tXI
         dpLSY+8PUX+DA4a9puI/mE4+znchPv205WlI9LRTM1xZ48LuBczWTybgaLDDiBuLrMxl
         AFpQ==
X-Gm-Message-State: AJcUukfUs54SGMP2Ve8CcYDpX5FbPu4XPMQ0E030zzn8UF1+6p+wt57H
        3zoT5xTg5UkpzcwBoh1SIvtvzYgS
X-Google-Smtp-Source: ALg8bN7TfCDqH/am9ITY8nvd92R7nM6mv7XB0Gg3RVaep2bpmOmX7qrTRHSDikwu5FwBh0sR5AO49g==
X-Received: by 2002:a62:a1a:: with SMTP id s26mr16592941pfi.31.1547759669095;
        Thu, 17 Jan 2019 13:14:29 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t3sm2432964pgv.31.2019.01.17.13.14.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:28 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 21/29] hwmon: (lm90) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:41 -0800
Message-Id: <1547759629-23007-22-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm90.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c2f411c290bf..480d70a51778 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1266,17 +1266,17 @@ static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
 	case hwmon_temp_emergency_alarm:
 	case hwmon_temp_emergency_hyst:
 	case hwmon_temp_fault:
-		return S_IRUGO;
+		return 0444;
 	case hwmon_temp_min:
 	case hwmon_temp_max:
 	case hwmon_temp_crit:
 	case hwmon_temp_emergency:
 	case hwmon_temp_offset:
-		return S_IRUGO | S_IWUSR;
+		return 0644;
 	case hwmon_temp_crit_hyst:
 		if (channel == 0)
-			return S_IRUGO | S_IWUSR;
-		return S_IRUGO;
+			return 0644;
+		return 0444;
 	default:
 		return 0;
 	}
@@ -1338,9 +1338,9 @@ static umode_t lm90_chip_is_visible(const void *data, u32 attr, int channel)
 {
 	switch (attr) {
 	case hwmon_chip_update_interval:
-		return S_IRUGO | S_IWUSR;
+		return 0644;
 	case hwmon_chip_alarms:
-		return S_IRUGO;
+		return 0444;
 	default:
 		return 0;
 	}
-- 
2.7.4

