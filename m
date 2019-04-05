Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D21C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8846204EC
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pw229hK9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfDEQFg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 Apr 2019 12:05:36 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34282 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDEQFg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Apr 2019 12:05:36 -0400
Received: by mail-pg1-f195.google.com with SMTP id v12so3317919pgq.1
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Apr 2019 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=XYhsYoEDGB+ZEIE1cuPMz0TSx1PXeGfwjhIziFu45CY=;
        b=pw229hK9j8QGWhl2pRgG7abH/CE4EBtyHpNrXez/ds1PEF2YXBc6Lj8xqI4ImZCcC3
         soQ/cQ0QPDhTdmRSirZX6fQ7xxhyVvj7byMF7CZj5jag9YebDNqH6rkoBXMejSYkw6Ub
         5hRil5wNXCeY6yrtq0vOV1lrNpDgeYMgEdFaCEL7fTh/X+o0OWCYiNN5P5LPjVsdpcYd
         tO0HdcmKw/oO2U43hGBayGPBatmWcNrQwN93NKoXzyPre8lhlBys85OwyYCoaideDURZ
         f2eSkwTaU39QSeaMBie5eonMHMOGCtOBzA8ZBxN0Jt1hT3I+Ei7aQS0GQOcYAhIsmR83
         YRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=XYhsYoEDGB+ZEIE1cuPMz0TSx1PXeGfwjhIziFu45CY=;
        b=M9S8iVDIzPsw2zwTal7D+GujlbbLucBrfJq9nvPTFF2lmJTPXVOr23X/8cRXpLmWH1
         QaEuvgpvSwyxt/OKtstuJkQxi7V1/CL5+KJw5fWweClcDjP1hKHJpbMYFQhXHYAb1Frx
         W/jCYOEGpBnjNEW+x2j++bmqQjZUwtpBtoyyFEiJVPYJaC6FCX+8sEVkYRxdnLvHfsG1
         qkXzza8tSC4KsMoVbPk8dP/x0A1PbwGdkfpJbq/qik1sHxwcKIMg5/cenVJWrrSA7lX5
         Kk4Li4hhcWAIktpBWoqSGDY4sTV3DwfxsZlW499zghGR0FWUinO4Ct67eKzhP6kLbGcm
         w63w==
X-Gm-Message-State: APjAAAVuVHotqhyK3jYSMVXewYGg+DM3sFsCBZWipkfzR87jTxGYXF54
        pr/VbI45bHwjo0sNFWEe+v1bGMuh
X-Google-Smtp-Source: APXvYqw+Y2b2TVNfB4Eay9v4dLYL+YrvaaAYdcuF6qTE6qks7dkfM5lXw+PeJ5vvkoyaSiUYp4wUhA==
X-Received: by 2002:a63:6fc1:: with SMTP id k184mr12639924pgc.239.1554480335516;
        Fri, 05 Apr 2019 09:05:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j67sm29949000pfc.72.2019.04.05.09.05.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 09:05:35 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v2] hwmon: (smsc47m1) Use request_muxed_region for Super-IO accesses
Date:   Fri,  5 Apr 2019 09:05:33 -0700
Message-Id: <1554480333-17945-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
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
v2: Fix subject, handle error in smsc47m1_restore()

 drivers/hwmon/smsc47m1.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 5d0c6eaae6f2..5f92eab24c62 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -73,16 +73,21 @@ superio_inb(int reg)
 /* logical device for fans is 0x0A */
 #define superio_select() superio_outb(0x07, 0x0A)
 
-static inline void
+static inline int
 superio_enter(void)
 {
+	if (!request_muxed_region(REG, 2, DRVNAME))
+		return -EBUSY;
+
 	outb(0x55, REG);
+	return 0;
 }
 
 static inline void
 superio_exit(void)
 {
 	outb(0xAA, REG);
+	release_region(REG, 2);
 }
 
 #define SUPERIO_REG_ACT		0x30
@@ -535,8 +540,12 @@ static int __init smsc47m1_find(struct smsc47m1_sio_data *sio_data)
 {
 	u8 val;
 	unsigned short addr;
+	int err;
+
+	err = superio_enter();
+	if (err)
+		return err;
 
-	superio_enter();
 	val = force_id ? force_id : superio_inb(SUPERIO_REG_DEVID);
 
 	/*
@@ -612,13 +621,14 @@ static int __init smsc47m1_find(struct smsc47m1_sio_data *sio_data)
 static void smsc47m1_restore(const struct smsc47m1_sio_data *sio_data)
 {
 	if ((sio_data->activate & 0x01) == 0) {
-		superio_enter();
-		superio_select();
-
-		pr_info("Disabling device\n");
-		superio_outb(SUPERIO_REG_ACT, sio_data->activate);
-
-		superio_exit();
+		if (!superio_enter()) {
+			superio_select();
+			pr_info("Disabling device\n");
+			superio_outb(SUPERIO_REG_ACT, sio_data->activate);
+			superio_exit();
+		} else {
+			pr_warn("Failed to disable device\n");
+		}
 	}
 }
 
-- 
2.7.4

