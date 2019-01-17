Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5F1C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E52E20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbLvdjXG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfAQVOY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:24 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41179 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfAQVOY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:24 -0500
Received: by mail-pg1-f196.google.com with SMTP id m1so4979424pgq.8
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lJv+Twj8lJ8X6h/Di1z4hJArSKNOCkWdGoySJmvnV4k=;
        b=RbLvdjXGXNrQnv7TihkvoT4kHKZptpXo6oCZ+e0jU2j9sSU8y2qtLLe8Gaq/wccD1k
         zEPV07itajIL8alX7JNcsHXmUdHAyHl7CU/BMgfxGU7hVzMiBtBIlHEc1x+Lx8HOvQYM
         vd4CpEZKXwfpRKF7GfkT9Xd44b3vNwBMFv/btWyQoCe8/4AYYopf43dJpf34ASiP0Pry
         C1oKgbHgwWqHMeu/zp8wLx3NXm2FLnl59jRicO+FmBy8U9GBP1YAGFdpVYiLlV22Oq3v
         3ZThUda5Q5GuZHgG2ba0Z04g4QLcty3ULl0GokDIIRnyCIqbkJi8yzN+W84kMT55mXyI
         jVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=lJv+Twj8lJ8X6h/Di1z4hJArSKNOCkWdGoySJmvnV4k=;
        b=b8s/Y5c8/78O9FPPE/rhfw6zmvREWiNXTp/oV8uLZzAk53CeAcrM3UVyU/7QFRfJEl
         v89Ol92kQrO4U/8zAdJPL0NSWZRLYvrrnivVI37Q1DSj/lK+jaFzDwDKlp//5WQuFNT+
         bTMhPdlNYW+PplRKSFHpsiXbYDrKClupQ86k91FYOrPashCrplWN8f+2lmJeAORLT5hA
         SAWlr7CTZOOpzNGU0qBjzL94B+Uz+vCDx6lFLxvwxeDp8XqVGcNYSyzpvLylgzDLndJY
         5y76IYwqjgwR9T9acLsh5y3bAjkSZGbaEGPL2sa8svpChkRSaBkDnU+3LGbWsVPee17j
         8TxA==
X-Gm-Message-State: AJcUukcewbAT2ncF1iMg3/xyctb516LDf6mIBZOfzR4cs+Wy3zYyYp7I
        U+3X84B5z5fnnLvjUkmSXJmT9Mfb
X-Google-Smtp-Source: ALg8bN40Tyn4Gu9xow0xqneHadf/vH/u9XBPlw5/MJPFB/thK49HisP+HE9fGaIbF9swphLX+GVRHg==
X-Received: by 2002:a63:1d1d:: with SMTP id d29mr15003296pgd.49.1547759662475;
        Thu, 17 Jan 2019 13:14:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t21sm3164798pgg.24.2019.01.17.13.14.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:21 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/29] hwmon: (lm75) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:37 -0800
Message-Id: <1547759629-23007-18-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm75.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 62acb9f16ec5..447af07450f1 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -176,16 +176,16 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			return S_IRUGO;
+			return 0444;
 		}
 		break;
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp_input:
-			return S_IRUGO;
+			return 0444;
 		case hwmon_temp_max:
 		case hwmon_temp_max_hyst:
-			return S_IRUGO | S_IWUSR;
+			return 0644;
 		}
 		break;
 	default:
-- 
2.7.4

