Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ACAC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2614320643
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0v2/Hld"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbfDDSeG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 14:34:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45234 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbfDDSeF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 14:34:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id e24so1765981pfi.12
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VoB3My0/0da2LMx6rKcVFPi1y+5TU3+4RIFjGqWCYzM=;
        b=l0v2/HldvCHco6LWFbVFl6F3HVJtZvDqZ8zsG21bAZ4Otriokot1lR/2TyH3MCWku3
         gad6NDNRGzu0JCJ4nwcOqCvVTP6BTuprkGZrFTsWzWGGwustKz/i4l9Hh5OH5QwCKnKp
         19uIRQe/fKoKtXrj185zm74xc6Ke5s/00l9BnBs9f1oZOFL7VpV5MH+NQngjxsYjAdLp
         Nayk/j7aqrW27uJjYfPQ0V6cRtnH2NlunIs7GAzsVCgox+Bf8l15TCKEwGmhfckMwL+Q
         a1525ot3VpO1iYmbPEQ/7AFE/7Lm0Sko7kYUrnuH6c3oIGT14mVd/lBzIqhg+mFT0rM6
         f1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=VoB3My0/0da2LMx6rKcVFPi1y+5TU3+4RIFjGqWCYzM=;
        b=mFzs/q7HK0oppHEXAa9wpToM/lz9wBgVxqY7e8+PvADszzeFuGXLvWhCu37jN04waK
         RvCUnEnf0X+yyxG6u0dyoYrx4Hp6+WxyGcN8fGvGTMRgsDcDO6rVUKsGHCm++pvv5RYm
         t3zN9Q4Y8b9EzOe1svAgREHDWaaskYM92SdVgrN5fcSuN2VQ+FQxJSfSnAQHbo0OryDz
         4vpmxzrvgbeID5pcn23XRwVEuO3L6S4W1tVcLVYXx4k7uht330gVzu41fsbCsQxH4DoZ
         m+hDY/q7xe/m7OwCQ2ka6XG+gRpVWMqUTxoe/gCTfAMbWs86mKyuqzFl6r6BpfQ6lUQe
         0ZAg==
X-Gm-Message-State: APjAAAVxpsm76V7ONgSfMThlzaRk3ZZqx9mSTnBwy3I4sJC8xwUw52fO
        0RhR5CMmMvSdkBOpZUH9MpGQ8hJi
X-Google-Smtp-Source: APXvYqwc0lDiJS/5mcgcZRm+6TTRiA5Zs4kexxGuqENBfBCpuA/FPGDnh9JKnHWWe/Xow5BypTT0hw==
X-Received: by 2002:a63:ef07:: with SMTP id u7mr7646518pgh.0.1554402844328;
        Thu, 04 Apr 2019 11:34:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i31sm37490370pgi.36.2019.04.04.11.34.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 11:34:03 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH 3/4] hwmon: (smsc47b397) Use request_muxed_region for Super-IO accesses
Date:   Thu,  4 Apr 2019 11:33:57 -0700
Message-Id: <1554402838-19008-3-git-send-email-linux@roeck-us.net>
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

Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")
Reported-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reported-by: John Garry <john.garry@huawei.com>
Cc: John Garry <john.garry@huawei.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/smsc47b397.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/smsc47b397.c b/drivers/hwmon/smsc47b397.c
index c0775084dde0..60e193f2e970 100644
--- a/drivers/hwmon/smsc47b397.c
+++ b/drivers/hwmon/smsc47b397.c
@@ -72,14 +72,19 @@ static inline void superio_select(int ld)
 	superio_outb(0x07, ld);
 }
 
-static inline void superio_enter(void)
+static inline int superio_enter(void)
 {
+	if (!request_muxed_region(REG, 2, DRVNAME))
+		return -EBUSY;
+
 	outb(0x55, REG);
+	return 0;
 }
 
 static inline void superio_exit(void)
 {
 	outb(0xAA, REG);
+	release_region(REG, 2);
 }
 
 #define SUPERIO_REG_DEVID	0x20
@@ -300,8 +305,12 @@ static int __init smsc47b397_find(void)
 	u8 id, rev;
 	char *name;
 	unsigned short addr;
+	int err;
+
+	err = superio_enter();
+	if (err)
+		return err;
 
-	superio_enter();
 	id = force_id ? force_id : superio_inb(SUPERIO_REG_DEVID);
 
 	switch (id) {
-- 
2.7.4

