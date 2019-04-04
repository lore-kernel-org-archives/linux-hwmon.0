Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09658C10F0C
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D069720643
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 18:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlVh6rS7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbfDDSeG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 14:34:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44795 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbfDDSeG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 14:34:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id g12so1567679pll.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iAPDuAeXrMc4nmtlSZnhC9UOBU1xCgt3/nXqBXEyvTI=;
        b=KlVh6rS7h1n3MXMD/UdOcuDsMFE0ZRty4BuQmXvcxOLFgPq++yk/Tgl8LRWGZREDNz
         aD4GwiHhaw42Al97l7u1bKWLObY/tIYI6khhjF0UfujMFkfTN6FEd9xcC1+qfhZLXtgs
         3Gz3NEDph25UQd3A/S+PTBbTzQhKjDZQcJ5b/t7of4WaFAX/g1e0iADD61QioRjyiDvv
         oaQHAl1kDzG43jxYJssUQuhMSz1ZBRnCo6uY0qFnnnUdfqD2grBumdWY5EVB8YzLbEln
         xoyp/ADDnrO7zlRj82EtYgRRoKAKhbzzf/5G/1ASuLDQsr/HKl90w3OVGxwWnRPc8a5H
         FXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=iAPDuAeXrMc4nmtlSZnhC9UOBU1xCgt3/nXqBXEyvTI=;
        b=MBLGE9s8N+KOfNvdDJVuevkvbT74deTM1le3/2wucFwDFcqtwour3VoEUoB5zjC9KC
         8+LeFAY2wyaK+BoTzxbIKTXUQS8WscdbJJmkHwLjCIFC2ANA7s1b6q7V2IgCOZGCXS3c
         zAXfhaZTkMLF+JWaZ4AtphQblFZCQvIAtFVTTjFlfMAE3wPhBe6afVutCW18Tzq9e1F1
         j5LUcOTHlaBc26E3cYYLwNvNyQjWSFoa+wRVva7Go3vu14guXkromaxBjv9z4oLd+R60
         Cqsfnhf801hvkf3fWBBC3+5X7Cja1eeho2Qan8KouSVo2mXOYUb6YlaGOGpiwsUMfjCo
         v1YQ==
X-Gm-Message-State: APjAAAVBbYFy7GJyORFXT1uhLDnlRU+n1lWgVkJF4wdKdkUyYt+EMt6a
        fH57Ry46t6kxU7olSe50CPAwiGKS
X-Google-Smtp-Source: APXvYqxLJiBYCLRLaDcF0CyKaOHa6B5/DC+hiqQMSmzhMTYKJmlUJJvA/enSFoNwEAjAMrgyh/N12w==
X-Received: by 2002:a17:902:b717:: with SMTP id d23mr7736186pls.260.1554402845645;
        Thu, 04 Apr 2019 11:34:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b9sm14650285pfd.32.2019.04.04.11.34.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 11:34:05 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH 4/4] hwmon: (smsc47b397) Use request_muxed_region for Super-IO accesses
Date:   Thu,  4 Apr 2019 11:33:58 -0700
Message-Id: <1554402838-19008-4-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/smsc47m1.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index c7b6a425e2c0..0736ca6a3aee 100644
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
@@ -531,8 +536,12 @@ static int __init smsc47m1_find(struct smsc47m1_sio_data *sio_data)
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
-- 
2.7.4

