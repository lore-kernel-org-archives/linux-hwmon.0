Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEF0C4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3FCA20643
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sh8NP/KM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfDDSeC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 14:34:02 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36411 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbfDDSeC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 14:34:02 -0400
Received: by mail-pg1-f194.google.com with SMTP id 85so1652648pgc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Uq6bc3RBb9LXJDUrOFV2sIoBpnRZhaMESpCt2852Ye0=;
        b=sh8NP/KMmTyWfs8gRmGBqO5K4PKkIKyWT8T813d+j/R6M5kX4OpI3ndDF348KIksDz
         zNE2hwp0BRCPDAuVNZwTeCJLHMJu9iUfEyMmMWcHUr6nEQXiU34MvDu8kwqvKn2PZxXC
         TIwNkHUjgn1p/ZEGfwAuJzj4S/0MXyFsoZsmOn5HftWBX8zFE0DX2Nx2zvErARm620s9
         mjt7XH+oPtcIb3R75h/huUiJGGK8T2FicO1wzAGqJDndu0J3ay8P39GQXadAIGX9ZTHh
         96wq9p6ImcmgSkmhQffSDcbx/vYPLIx+tHbkGf5H0LuJPW6p64VeSSLYffNYzY2yfyOl
         hvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Uq6bc3RBb9LXJDUrOFV2sIoBpnRZhaMESpCt2852Ye0=;
        b=D6RcRNyqLdSRc6Nk7DWz2R4TYA86izXoDdmWFlUDXz4/87E30PjO082KYvqQFogZ4C
         BGh+XzCq6PcR3UirleVZmG/xkftgncDF1CCdgApTGvmjp/avl2YE0xFYQ9qsoeZd2XbT
         EX/k+tsqPrf58YBd9LthmiihboM59z0uDU61BLp5N9SyiDB+ymUB51xsNsWE1yhC78fQ
         AS8jjLj5gy3IA0VPTHgogGcVKxNbnpYEvFb+xNnS13ExOzk4uegif2ERCUGWQhGhvVHd
         Y2Wn628t6/dkgh2ExXnuIcq4ZWd1MFKJgS9EQ4X4qkAfoWXF81SyS2l/p95T9hQUIxQF
         jykQ==
X-Gm-Message-State: APjAAAVjlVqMOaqEk0xaHRNm3hnbmkw+PFkuJTTNSBTL+PWlvaLqYbiS
        T4RB++9DIX35S4C9kMo2uL19g8sA
X-Google-Smtp-Source: APXvYqypBIDzRIE/3VA2g3Jz3cCumUShIv6M2es6x+QrgC2aZo0zXoyi743mvn9TMk+2GVXMd0DvMg==
X-Received: by 2002:aa7:9095:: with SMTP id i21mr7522999pfa.134.1554402841460;
        Thu, 04 Apr 2019 11:34:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h184sm46610583pfc.78.2019.04.04.11.34.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 11:34:00 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH 1/4] hwmon: (f71805f) Use request_muxed_region for Super-IO accesses
Date:   Thu,  4 Apr 2019 11:33:55 -0700
Message-Id: <1554402838-19008-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Super-IO accesses may fail on a system with no or unmapped LPC bus.

Unable to handle kernel paging request at virtual address ffffffbffee0002e
pgd = ffffffc1d68d4000
[ffffffbffee0002e] *pgd=0000000000000000, *pud=0000000000000000
Internal error: Oops: 94000046 [#1] PREEMPT SMP
Modules linked in: f71805f(+) hwmon
CPU: 3 PID: 1659 Comm: insmod Not tainted 4.5.0+ #88
Hardware name: linux,dummy-virt (DT)
task: ffffffc1f6665400 ti: ffffffc1d6418000 task.ti: ffffffc1d6418000
PC is at f71805f_find+0x6c/0x358 [f71805f]

Also, other drivers may attempt to access the LPC bus at the same time,
resulting in undefined behavior.

Use request_muxed_region() to ensure that IO access on the requested
address space is supported, and to ensure that access by multiple
drivers is synchronized.

Fixes: e53004e20a58e ("hwmon: New f71805f driver")
Reported-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reported-by: John Garry <john.garry@huawei.com>
Cc: John Garry <john.garry@huawei.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/f71805f.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/f71805f.c b/drivers/hwmon/f71805f.c
index 73c681162653..623736d2a7c1 100644
--- a/drivers/hwmon/f71805f.c
+++ b/drivers/hwmon/f71805f.c
@@ -96,17 +96,23 @@ superio_select(int base, int ld)
 	outb(ld, base + 1);
 }
 
-static inline void
+static inline int
 superio_enter(int base)
 {
+	if (!request_muxed_region(base, 2, DRVNAME))
+		return -EBUSY;
+
 	outb(0x87, base);
 	outb(0x87, base);
+
+	return 0;
 }
 
 static inline void
 superio_exit(int base)
 {
 	outb(0xaa, base);
+	release_region(base, 2);
 }
 
 /*
@@ -1561,7 +1567,7 @@ static int __init f71805f_device_add(unsigned short address,
 static int __init f71805f_find(int sioaddr, unsigned short *address,
 			       struct f71805f_sio_data *sio_data)
 {
-	int err = -ENODEV;
+	int err;
 	u16 devid;
 
 	static const char * const names[] = {
@@ -1569,8 +1575,11 @@ static int __init f71805f_find(int sioaddr, unsigned short *address,
 		"F71872F/FG or F71806F/FG",
 	};
 
-	superio_enter(sioaddr);
+	err = superio_enter(sioaddr);
+	if (err)
+		return err;
 
+	err = -ENODEV;
 	devid = superio_inw(sioaddr, SIO_REG_MANID);
 	if (devid != SIO_FINTEK_ID)
 		goto exit;
-- 
2.7.4

