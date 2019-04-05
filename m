Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29710C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:07:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E65BA204EC
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN820u2k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731016AbfDEQHX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 Apr 2019 12:07:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33342 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDEQHX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Apr 2019 12:07:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id i19so3537645pfd.0
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Apr 2019 09:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=xgRk8BlW2/xdIv8xdtOEOyf/KGXiwgDc31vS8HpSg4g=;
        b=RN820u2kvIbFUJwkcP7QGmExt+8rbguf6jCR3GSRSb7ti2C68F5yY5H6ECQlTO9Bm8
         m9DUibv6mPOi3RG8BJQJ0pBCM/ofT8Fsd5GwA1c2lqprTjMY93Nusemxl2bD+30/iEUf
         l7QbrJ1HEVUzT/puJSQ2oTLAk2sTdV+RhjmljSeQPLG11kpxHQdZp8Hjl3qJQhd4KWTc
         3z4z85GFie7U5c9uN5l9xAILZvJDyzLEboKvyIKEwqchlsTU9PnjF5yM5jds7yQ0/D5O
         xoxZdUZITfIgk0Ywr8ocBUjKgYD3ElULbLvKfwo08tDarlLpHqwlSqnlAaIbRT8OFZd+
         7LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=xgRk8BlW2/xdIv8xdtOEOyf/KGXiwgDc31vS8HpSg4g=;
        b=Dx2jnC8UV5aZIDfJ7EE05ter8cHOaMIl6EQs+MkZq+p2mDIAnPkY5l2GZcRTdELC02
         BPeAeSTIsBkA5tb2tmLGR9eli6lmQWGbzBe+mQ375cn0lvzpuPkn09Gs4pVNsE+HCKeS
         WN7QTn25+0EUPUXQ8TaMEonlOqGfMAWfl9CFb+GgXw9av/WY8RjtDdjbrVO80B68X3j6
         TjnBdgbUGggTA631NtVjDSH9W5A6wq13M+uGrFlG7I5sco5AHKf3ZO7MT5BxCFJiFmOj
         DOF5AWG+L1K6WMz17gCrAEoqtIap80aykFXqPfM3sEOJ4wnIi+rlSgIoeLS9HYnEsYxz
         3q0g==
X-Gm-Message-State: APjAAAVdTCEZhTkDcDNeNCpbONh2JBLHyypg9KPJe1nJQGUjZrzI7YC5
        Y5XTIBG8bIXWRuJYyBD/VFCvIVBG
X-Google-Smtp-Source: APXvYqymJJR941Kxq+9A6XH5EAKoIx8PPEsgNKIrPJ7zXAYbHKfkvgjN8/NSt4iTeuzmmQshNxjb5w==
X-Received: by 2002:a63:f956:: with SMTP id q22mr2046850pgk.210.1554480442126;
        Fri, 05 Apr 2019 09:07:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a72sm5045167pge.0.2019.04.05.09.07.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 09:07:21 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (w83627hf) Use request_muxed_region for Super-IO accesses
Date:   Fri,  5 Apr 2019 09:07:18 -0700
Message-Id: <1554480439-30281-1-git-send-email-linux@roeck-us.net>
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

Fixes: b72656dbc491 ("hwmon: (w83627hf) Stop using globals for I/O port numbers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83627hf.c | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index 97bbf1af11e8..7ca53a28c305 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -130,17 +130,23 @@ superio_select(struct w83627hf_sio_data *sio, int ld)
 	outb(ld,  sio->sioaddr + 1);
 }
 
-static inline void
+static inline int
 superio_enter(struct w83627hf_sio_data *sio)
 {
+	if (!request_muxed_region(sio->sioaddr, 2, DRVNAME))
+		return -EBUSY;
+
 	outb(0x87, sio->sioaddr);
 	outb(0x87, sio->sioaddr);
+
+	return 0;
 }
 
 static inline void
 superio_exit(struct w83627hf_sio_data *sio)
 {
 	outb(0xAA, sio->sioaddr);
+	release_region(sio->sioaddr, 2);
 }
 
 #define W627_DEVID 0x52
@@ -1254,7 +1260,7 @@ static DEVICE_ATTR_RO(name);
 static int __init w83627hf_find(int sioaddr, unsigned short *addr,
 				struct w83627hf_sio_data *sio_data)
 {
-	int err = -ENODEV;
+	int err;
 	u16 val;
 
 	static __initconst char *const names[] = {
@@ -1266,7 +1272,11 @@ static int __init w83627hf_find(int sioaddr, unsigned short *addr,
 	};
 
 	sio_data->sioaddr = sioaddr;
-	superio_enter(sio_data);
+	err = superio_enter(sio_data);
+	if (err)
+		return err;
+
+	err = -ENODEV;
 	val = force_id ? force_id : superio_inb(sio_data, DEVID);
 	switch (val) {
 	case W627_DEVID:
@@ -1619,9 +1629,21 @@ static int w83627thf_read_gpio5(struct platform_device *pdev)
 	struct w83627hf_sio_data *sio_data = dev_get_platdata(&pdev->dev);
 	int res = 0xff, sel;
 
-	superio_enter(sio_data);
+	if (superio_enter(sio_data)) {
+		/*
+		 * Some other driver reserved the address space for itself.
+		 * We don't want to fail driver instantiation because of that,
+		 * so display a warning and keep going.
+		 */
+		dev_warn(&pdev->dev,
+			 "Can not read VID data: Failed to enable SuperIO access\n");
+		return res;
+	}
+
 	superio_select(sio_data, W83627HF_LD_GPIO5);
 
+	res = 0xff;
+
 	/* Make sure these GPIO pins are enabled */
 	if (!(superio_inb(sio_data, W83627THF_GPIO5_EN) & (1<<3))) {
 		dev_dbg(&pdev->dev, "GPIO5 disabled, no VID function\n");
@@ -1652,7 +1674,17 @@ static int w83687thf_read_vid(struct platform_device *pdev)
 	struct w83627hf_sio_data *sio_data = dev_get_platdata(&pdev->dev);
 	int res = 0xff;
 
-	superio_enter(sio_data);
+	if (superio_enter(sio_data)) {
+		/*
+		 * Some other driver reserved the address space for itself.
+		 * We don't want to fail driver instantiation because of that,
+		 * so display a warning and keep going.
+		 */
+		dev_warn(&pdev->dev,
+			 "Can not read VID data: Failed to enable SuperIO access\n");
+		return res;
+	}
+
 	superio_select(sio_data, W83627HF_LD_HWM);
 
 	/* Make sure these GPIO pins are enabled */
-- 
2.7.4

