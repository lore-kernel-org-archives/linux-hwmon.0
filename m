Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E86C10F0C
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 268A120643
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdNOcIQm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbfDDSeE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 14:34:04 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36846 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbfDDSeD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 14:34:03 -0400
Received: by mail-pl1-f193.google.com with SMTP id ck15so1586030plb.3
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=geaygXebEawsdZr7nPXl2XcaN7cCY3bpFbApbwpxWnw=;
        b=sdNOcIQmedADfxkSSovwycSBUlT4pjHleeZYfEi891aA/d9UYkGmRpr1Eka4Fo18qV
         FuyJZUOc72YSRzqAqGY2gEQJnO4RPHDtmq2jJDKYD3e8B+DmCw7EIwj6rxxJuPvHYHV2
         ZtUztixXzvWPYHif4mlya5g1l/Ua6fopkv6rmTYEohg8go9FYKVfkCcJpTGM8DkwVAbe
         ht9AQs4XSyzk6VH9e/n4cJL/cObyNuzUhWO0XmuXZnQmICV6eSE/vZwX+UPU1rL+toOu
         SAUfOaLWPg4RGYNWw0NNkooQBmOAEliTn4NTtV8aOoK2NeamEAFDecKzau56o7T8cxio
         xLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=geaygXebEawsdZr7nPXl2XcaN7cCY3bpFbApbwpxWnw=;
        b=MEyEQds+NOZOxO7+5RVyGskSNjURkWCKgHTY2C9zr9TT58Ex1s32Oal0MhfaYKCxx5
         lF3ibQVffcqUKde+IODv46CPc/fXk6sRACSwW3qHuFKYxNFFtxHwnILrocej0dpsfqyY
         f6bdv/KBOEJNO8gu9UMedVgrFtKlZndad7Wt/V8VcujlKHqXYe5SFxJ4HIYudxhWimwe
         pIbjOJ33m5JLQQihY4Yg36lmDgBQvHj3XaIVr158bF1Oayuym5j7/xG7ChgMDLkP3spC
         pQcSOxreeRINcGb1mbOu6rw7LMC2bVzcPlu1E9mTcsUI2cPp7yoqgoEKofZr8gE4zE2n
         fnLw==
X-Gm-Message-State: APjAAAWKcKM6P+yQRPDqRLAaQHMzfy2XgnVzx1tCNPGbtdkJ9Uc0pGIZ
        S7D3x0dEEO/+rUsx7VjAFB+voExo
X-Google-Smtp-Source: APXvYqxBR9sRI02Vv5GtsuZ0gLRcx1CHFazLaXlrqfpM1ghvFUrjQFDlJO4kRCu04qEOOFa4zGH39g==
X-Received: by 2002:a17:902:d68d:: with SMTP id v13mr8087891ply.55.1554402842830;
        Thu, 04 Apr 2019 11:34:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10sm29568613pfj.7.2019.04.04.11.34.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 11:34:02 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH 2/4] hwmon: (pc87427) Use request_muxed_region for Super-IO accesses
Date:   Thu,  4 Apr 2019 11:33:56 -0700
Message-Id: <1554402838-19008-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554402838-19008-1-git-send-email-linux@roeck-us.net>
References: <1554402838-19008-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Super-IO accesses may fail on a system with no or unmapped LPC bus.

Also, other drivers may attempt to access the LPC bus at the same time,
resulting in undefined behavior.

Use request_muxed_region() to ensure that IO access on the requested
address space is supported, and to ensure that access by multiple drivers
is synchronized.

Fixes: ba224e2c4f0a7 ("hwmon: New PC87427 hardware monitoring driver")
Reported-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reported-by: John Garry <john.garry@huawei.com>
Cc: John Garry <john.garry@huawei.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pc87427.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pc87427.c b/drivers/hwmon/pc87427.c
index d1a3f2040c00..58eee8fa3e6d 100644
--- a/drivers/hwmon/pc87427.c
+++ b/drivers/hwmon/pc87427.c
@@ -106,6 +106,13 @@ static const char *logdev_str[2] = { DRVNAME " FMC", DRVNAME " HMC" };
 #define LD_IN		1
 #define LD_TEMP		1
 
+static inline int superio_enter(int sioaddr)
+{
+	if (!request_muxed_region(sioaddr, 2, DRVNAME))
+		return -EBUSY;
+	return 0;
+}
+
 static inline void superio_outb(int sioaddr, int reg, int val)
 {
 	outb(reg, sioaddr);
@@ -122,6 +129,7 @@ static inline void superio_exit(int sioaddr)
 {
 	outb(0x02, sioaddr);
 	outb(0x02, sioaddr + 1);
+	release_region(sioaddr, 2);
 }
 
 /*
@@ -1195,7 +1203,11 @@ static int __init pc87427_find(int sioaddr, struct pc87427_sio_data *sio_data)
 {
 	u16 val;
 	u8 cfg, cfg_b;
-	int i, err = 0;
+	int i, err;
+
+	err = superio_enter(sioaddr);
+	if (err)
+		return err;
 
 	/* Identify device */
 	val = force_id ? force_id : superio_inb(sioaddr, SIOREG_DEVID);
-- 
2.7.4

