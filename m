Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C15C10F24
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06CDE204EC
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDuFiUMj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731020AbfDEQHY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 Apr 2019 12:07:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45020 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDEQHY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Apr 2019 12:07:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id y13so3510791pfm.11
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Apr 2019 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GzqZmmvm33N4n7bHWTX5Tv1RrAmbYDxDswYPMurVlL0=;
        b=QDuFiUMjLsu/X94FMPfG3PnmlM80bq2x+wt35MgBB31Mfh9Txeko5/aQXNJsELuHiK
         dJrhOSKdE3psqyxg7GRb/PCU1nKmJj+73SiDZdsfC8G6U9MnEmn6Dq6lKW6UqsSqF29n
         21SjbZ7wXxTu2bpfUHY0F34tCpGYfU3M4SeaBEQ8aFYKKOTfTQ5RlT39r4WK1Wy2tNw0
         BWQGp2A6OZHyuSNM28gls7s/we8A6WcEzesYYnk00da3TjknGCPk5KiMwXoQz81SNX+j
         XNFEiomcS15WBh+g4wxFHARX9Tlwov5rlnBlFolxvF9VLoKLrjmPJdARyCA4R0ISGgv7
         sI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=GzqZmmvm33N4n7bHWTX5Tv1RrAmbYDxDswYPMurVlL0=;
        b=oe+UUCEuMZu97ZHIZ+cza8uR0jEGNfYvbuNEqes/qSoinIrBtCjR0/UlBF1MwZj6+O
         qfs6NY90BXM70c8bq+7Y2zJcN0YccMtpSe94+fHF0f06c0sInK6tae/ikt0Qg6Wi6OqV
         oVvGpAWCJzIB1PXZIcPJpdaf7wffda3z/eEk3GB8GZHqBhxlPiKDs/GPTlGpLOXi8rhk
         DsM73j+4JAeLAKRozAc48sMsJX6Q4gFQGw2ltsoc/HsczcYrd6oCok+sbHEYoASppxff
         KcqLamXiGEmp0cpQ9Ck00OYOSoMoVXrdlOSgjemDjqSg71zfRnm+H19bOG6iKB7Na5qQ
         XkQA==
X-Gm-Message-State: APjAAAVacLHrLWz7jH55YvT0IYXoLmc18aOVVYRKZHWXuHY6bDbmYHPv
        4YHWlKCELKHE7uQgrJVTyTOQL3ce
X-Google-Smtp-Source: APXvYqxkhHI0qzmuSfrkYEVxXb1sBQpRKF8zX7aG4LtAWBKkKQE8L+OejmNraliGYap07WlGIenufA==
X-Received: by 2002:aa7:82cb:: with SMTP id f11mr13651465pfn.0.1554480443680;
        Fri, 05 Apr 2019 09:07:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j14sm20410605pfa.57.2019.04.05.09.07.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 09:07:23 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (vt1211) Use request_muxed_region for Super-IO accesses
Date:   Fri,  5 Apr 2019 09:07:19 -0700
Message-Id: <1554480439-30281-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554480439-30281-1-git-send-email-linux@roeck-us.net>
References: <1554480439-30281-1-git-send-email-linux@roeck-us.net>
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

Fixes: 2219cd81a6cd ("hwmon/vt1211: Add probing of alternate config index port")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/vt1211.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index 3a6bfa51cb94..95d5e8ec8b7f 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -226,15 +226,21 @@ static inline void superio_select(int sio_cip, int ldn)
 	outb(ldn, sio_cip + 1);
 }
 
-static inline void superio_enter(int sio_cip)
+static inline int superio_enter(int sio_cip)
 {
+	if (!request_muxed_region(sio_cip, 2, DRVNAME))
+		return -EBUSY;
+
 	outb(0x87, sio_cip);
 	outb(0x87, sio_cip);
+
+	return 0;
 }
 
 static inline void superio_exit(int sio_cip)
 {
 	outb(0xaa, sio_cip);
+	release_region(sio_cip, 2);
 }
 
 /* ---------------------------------------------------------------------
@@ -1282,11 +1288,14 @@ static int __init vt1211_device_add(unsigned short address)
 
 static int __init vt1211_find(int sio_cip, unsigned short *address)
 {
-	int err = -ENODEV;
+	int err;
 	int devid;
 
-	superio_enter(sio_cip);
+	err = superio_enter(sio_cip);
+	if (err)
+		return err;
 
+	err = -ENODEV;
 	devid = force_id ? force_id : superio_inb(sio_cip, SIO_VT1211_DEVID);
 	if (devid != SIO_VT1211_ID)
 		goto EXIT;
-- 
2.7.4

