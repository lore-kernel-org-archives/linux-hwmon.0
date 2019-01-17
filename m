Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F979C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C01E20868
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktHbSnlM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbfAQVOo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:44 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33603 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfAQVOo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:44 -0500
Received: by mail-pg1-f194.google.com with SMTP id z11so5000271pgu.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UQav4Opv0hhsKj7mfF9ZhNlerLO3yXWgigWMegpFZUk=;
        b=ktHbSnlM9HkrQidcWsJ3diymAH3naxWACK1G6xn/r1yRsO5cfc0ojJ3atifa3t8ysL
         EFXBKaaL1ktMROba9X5GbtSAlaDIqs3iLzU/Qkz63UAU6gFi9DPyHfrhczEgIODI4peX
         Ei7sBB+kkG09jlEgJnsvgA5gW6dO+YKD72chd1N7TSGz8ppqDzzBl0ucGfQFxyDY6M1D
         Nri5xMybCgaeOxVLSEj0GlxAOCr0TUjVkhiDLn1SoNPcCxEpkS6LPIHmckztV2tmCThb
         ocMdWN1O+zzldUEABjJ9FrE/powIjW89gS0HOmRNLI2AvOZ+UAaotQ8DuoUqZY5O2MKk
         aOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=UQav4Opv0hhsKj7mfF9ZhNlerLO3yXWgigWMegpFZUk=;
        b=EaSxDsD9R/gMtWwFyLAyh2PSYWJPqhAT4evXfsYQQXL/kjFY/fHcU+6FbnJNCZ64gG
         bMwzV99iI5my8fuYF+hcknn8Nm+B6yM/suVmlKENUh6ZnFr+iCQGuKNLQUYoqbMT06xn
         qFijfDbztULiZRKXI/sDH0OWwnR0LX+QlLIBdfIVgzQ5IwEkpF9zZEhm9OLdMq8GnZgm
         PKC1TthhffAIwxBbtHtMSSFZ/dg2re1yAXdNgZ6gmrjtJ43EE+2TivBaDTYs6qa+oskQ
         83aOfOhY8XJF226+7nbZTywBse9cPCoYELlKYHbkY1bylQD6hi+nROf552QeVeOUzV+T
         ImkQ==
X-Gm-Message-State: AJcUukdjzMgxrnKORRY+HOyyIphcJWtwD0sOhNVZKCcrIDB5EM2yxlYx
        KMEU9aGp/vQFWVENiXe6XWMSZH2K
X-Google-Smtp-Source: ALg8bN4UnjachFUkC4H8nZIoyTO7N/hHM3Uz0EnWMJMS2szbPIImn/oqxwm5DZW6TwBklwwnVMGuzw==
X-Received: by 2002:a65:4381:: with SMTP id m1mr14653748pgp.358.1547759682435;
        Thu, 17 Jan 2019 13:14:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n70sm5057409pfi.185.2019.01.17.13.14.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:41 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 29/29] hwmon: (ltc4245) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:49 -0800
Message-Id: <1547759629-23007-30-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ltc4245.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index 082f0a0bd8a0..34d0653ca607 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -362,11 +362,11 @@ static umode_t ltc4245_is_visible(const void *_data,
 		case hwmon_in_input:
 			if (channel > 9 && !data->use_extra_gpios)
 				return 0;
-			return S_IRUGO;
+			return 0444;
 		case hwmon_in_min_alarm:
 			if (channel > 8)
 				return 0;
-			return S_IRUGO;
+			return 0444;
 		default:
 			return 0;
 		}
@@ -374,14 +374,14 @@ static umode_t ltc4245_is_visible(const void *_data,
 		switch (attr) {
 		case hwmon_curr_input:
 		case hwmon_curr_max_alarm:
-			return S_IRUGO;
+			return 0444;
 		default:
 			return 0;
 		}
 	case hwmon_power:
 		switch (attr) {
 		case hwmon_power_input:
-			return S_IRUGO;
+			return 0444;
 		default:
 			return 0;
 		}
-- 
2.7.4

