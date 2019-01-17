Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE3AC43612
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B42620855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJBxHtM9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfAQVOh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:37 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37568 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfAQVOh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:37 -0500
Received: by mail-pg1-f193.google.com with SMTP id c25so4991001pgb.4
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7LJADRCN+8shgShWOBHjwyDMGExXO85TOTTPvEFiSqE=;
        b=RJBxHtM9JLg6JdaEGYZFqGDHWjDh91rjgYsToeMnTe7hKWGkx2WSvrcXGSBfFYu5OU
         oBLP44q4qnjGguA4yJd/lUTfJT9LjWuH5+58hqPf92QL/bv3Sj0CgHmq+VHp5+RIk0Iq
         Ut17VCckMLtxbi2Lk2VHOy5JM2XEW+K7BGDz7uODw5EiT0CAAv0om+9ImH70fhtEIZBm
         8AIFpprtGVg9I0xPETRJnmZe81zuHQEbs9w1Dwexw7bE3+BE+62ExC0SY+rB0YVE6WMK
         VpufAervZp3SU0zf7YV5hszskRfON/LsoTIkuR3Qr2GJeu/Rayj/jziVFdlwXtFzVcWq
         efeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=7LJADRCN+8shgShWOBHjwyDMGExXO85TOTTPvEFiSqE=;
        b=Yq6mItc9Fa03w5t43iXjLTYMR94TOMuV6/SUIwH9Cxuq3FGka/vb6TAd8uz1m824+z
         MUG/5+k9aoVGq43xnwmyZP1ljwsXnWsq8Nbp/Y2HlCAxStTm9DDi2w/LWLRxth6bznTQ
         4E/ZefeaFwIyhJM7Tn0Y3X5kki0iFDwwWMwNaRXazN8P2b+07mEVknCliFU9KDy5oDH1
         Qz0TAxEmcQ0EqL5AgN5CSdAG8OyAcoyZRijTOVhPXMTOYYNXY8UXkVdqNoeH5tcmoviJ
         GPFvYfKWy5OwGj7xyUjVZfLuY/7nrECPtARSyBhaubYWG5N05xHRlZ3tzJmwjnYW2Zr/
         yJqQ==
X-Gm-Message-State: AJcUukfqo+g2BpG+GbYwBppOXtMEBODE4c4YBpOhLkbg8amg1FdTgVVD
        +B2xZcV34e8Jxjvqd9Vqb+WQJbWL
X-Google-Smtp-Source: ALg8bN7+fG7ms+c3f6GuyKn78FHuSnJ+geFPzmV9xCgnvsEyKf1ukkoWVd0yDpj+fxX8zM9KIGp0RQ==
X-Received: by 2002:a62:e044:: with SMTP id f65mr16366758pfh.208.1547759676150;
        Thu, 17 Jan 2019 13:14:36 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w5sm3781701pfn.89.2019.01.17.13.14.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:35 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 25/29] hwmon: (lm95245) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:45 -0800
Message-Id: <1547759629-23007-26-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm95245.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index 996b50246175..e4cac3a04536 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -421,14 +421,14 @@ static umode_t lm95245_temp_is_visible(const void *data, u32 attr, int channel)
 	case hwmon_temp_max_hyst:
 	case hwmon_temp_crit_alarm:
 	case hwmon_temp_fault:
-		return S_IRUGO;
+		return 0444;
 	case hwmon_temp_type:
 	case hwmon_temp_max:
 	case hwmon_temp_crit:
 	case hwmon_temp_offset:
-		return S_IRUGO | S_IWUSR;
+		return 0644;
 	case hwmon_temp_crit_hyst:
-		return (channel == 0) ? S_IRUGO | S_IWUSR : S_IRUGO;
+		return (channel == 0) ? 0644 : 0444;
 	default:
 		return 0;
 	}
@@ -442,7 +442,7 @@ static umode_t lm95245_is_visible(const void *data,
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			return S_IRUGO | S_IWUSR;
+			return 0644;
 		default:
 			return 0;
 		}
-- 
2.7.4

