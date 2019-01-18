Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30478C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03ED820850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nk+yIAvR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfARRPW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:22 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44990 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:22 -0500
Received: by mail-pf1-f193.google.com with SMTP id u6so6886532pfh.11
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ie1WRXFGcvvFiT1hfJrTIxS60moIJLaKAJ2oQd6+R6k=;
        b=Nk+yIAvR6wqy7GFDMX0jUmuFNqQQcgmUqnQOSkSY7k1Z1tVXQnIxL33a7P3U03HURk
         x+u3sn3554VmGibY+iS1jJ8EVeKGbArq+7Ne8UgWY5dG2zzaCNgZZ3aLViYKDe9LK4RI
         rvOsH79VQh45OMub+DXfN8YX9IZsHP8twfPmX7CcUxgQiodGpIMGqmPgDyt2Ece5AAs3
         pPYSacWfE5Jxat+zqBeG1y7OvikUyyCkYSCsFrNTjDVA5KMAjA2qqi0A7dWe14hGpNjd
         UQZ/JgwV/Se7g3DQFnBlwrvbHKgsDavz/w/QmbT4C8pALzIkhhSKnHfNYOMsoEf98C6p
         bsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ie1WRXFGcvvFiT1hfJrTIxS60moIJLaKAJ2oQd6+R6k=;
        b=N18fHTqrsxQAoutPRAc7Bjkq49kWzoAWzeoK9I3RRnpasVD1irMCX/paChzEZUMbdu
         2sj2cYaMvhYZZKe+aF4oicQqC8rJLIV0hTsmPFzDkm7d2IbSpWhnVdv63uvfdYmxZJJd
         r30xzxDEjRLVOUh5QfsapQRJfoIQp0phY/CbdP7wZ7s32ErOU2p8JTyj2DFWqWY6R/KM
         ung/fxYnVwkcYg+TqIAFKd+hCFqn/lv7//IgbF0100riq49sBsP2UQQUWsp+mG8jgXAH
         jE30xrJz90S6eQBLGJQLx+8CELIB1M+iABGLPn/3VMpuD5vQdcpT5zcDE9yeR8lJCb9E
         ZdCQ==
X-Gm-Message-State: AJcUukdNvgj04AD0hcNG+OUoO49XUdTcve/E+bECi6edP+lOpWnhFODq
        2s0AXjHMsnsIF1lYu+Wn5IU8nR1L
X-Google-Smtp-Source: ALg8bN7/Onndmj0pnZxUMTSV/yiQ3OaEyXIb8C/22I9NXtwJ4vW2W1OQ+w7LHxwd7gK3G2HeacOzfg==
X-Received: by 2002:a63:960a:: with SMTP id c10mr18433387pge.106.1547831721522;
        Fri, 18 Jan 2019 09:15:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v184sm7293772pfb.182.2019.01.18.09.15.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:21 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/30] hwmon: (nct7904) Replace S_<PERMS> with octal values
Date:   Fri, 18 Jan 2019 09:14:40 -0800
Message-Id: <1547831700-15865-11-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/nct7904.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 7815ddf149f6..82c7de7b4639 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -182,7 +182,7 @@ static umode_t nct7904_fan_is_visible(const void *_data, u32 attr, int channel)
 	const struct nct7904_data *data = _data;
 
 	if (attr == hwmon_fan_input && data->fanin_mask & (1 << channel))
-		return S_IRUGO;
+		return 0444;
 	return 0;
 }
 
@@ -225,7 +225,7 @@ static umode_t nct7904_in_is_visible(const void *_data, u32 attr, int channel)
 
 	if (channel > 0 && attr == hwmon_in_input &&
 	    (data->vsen_mask & BIT(index)))
-		return S_IRUGO;
+		return 0444;
 
 	return 0;
 }
@@ -260,10 +260,10 @@ static umode_t nct7904_temp_is_visible(const void *_data, u32 attr, int channel)
 	if (attr == hwmon_temp_input) {
 		if (channel == 0) {
 			if (data->vsen_mask & BIT(17))
-				return S_IRUGO;
+				return 0444;
 		} else {
 			if (data->tcpu_mask & BIT(channel - 1))
-				return S_IRUGO;
+				return 0444;
 		}
 	}
 
@@ -325,7 +325,7 @@ static umode_t nct7904_pwm_is_visible(const void *_data, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_pwm_input:
 	case hwmon_pwm_enable:
-		return S_IRUGO | S_IWUSR;
+		return 0644;
 	default:
 		return 0;
 	}
-- 
2.7.4

