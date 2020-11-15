Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32046C63697
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Nov 2020 19:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDB4C22450
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Nov 2020 19:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XWLUDuNm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgKOTJZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Nov 2020 14:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgKOTJY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Nov 2020 14:09:24 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CC6C0613D1
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2020 11:09:24 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so11287012pfm.13
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2020 11:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=ujoTivO0ZJwnK7oE4zr4LTdLFw3eF11FNlG4Lc9FRsU=;
        b=XWLUDuNm8sfMSQBx8Enb+OoisiNDWBe07iLBLHlunasah8Io6+jQNEsuxgE+PtnKx4
         XqaU7laR5LoxtFtw7ag3j6BCe9oFpj9m3WmmdUAX1B/HHlR7iXpSuJfatS6MpL6RXNgx
         N/P/i6HZjclYqfStZGqLhcqd19JTpN11lXTNbAc7StqZSvgeh9uvlHjYD3AFPf4HZZLZ
         2VMIiZhIZ5b85C/nHvBcHU+bdvDWAGLm354y20GnbG9pMeIx4Gnhy8ETnPyedQ/YX4gx
         UjdbeUEJL2OhUFIVsAHnUKJDv4U4hVTYVHN/FCVzzWpJ8lG4jRa9nLrSDEpkO/Rm83rr
         uUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ujoTivO0ZJwnK7oE4zr4LTdLFw3eF11FNlG4Lc9FRsU=;
        b=Y0AjrFzlkj4wh9DxtyA2d1FbWDUPFJdaq9pnQzDWkCLPH9OVC6nisZxQ2r8IdXCkdL
         2Ok2XmSzzUr3MSPLHA7BMMdzsAYjm6oSAO3cPcICyXvArSi06TmjIv/LSwOrNE3BH8If
         u1I81aktd9yjgqCUvagZjYIFs4k5zQkojeVjKFQCuQfBJ89quNVqxwROCrhOu6LsInab
         BsBCnIR96lEOBM0YqZED8JG5QhUopz9GYa4d/ogqJtTgNbeJRn+bVZ+KSQviWp/881i/
         G+go1Am/UCPEmPtt/hovuL/OZFgs2GrjIHtgppmmIMEz7cl4A5UGo6OkR4qq2CklLNZL
         NiQA==
X-Gm-Message-State: AOAM5319goO9JCg3Rt2R17gQ95a+5bbw84hggMw45pbZM2F9Od7w5p0K
        K751XRZhJOKU52lSUbY2MwoTLsd7qgAowA==
X-Google-Smtp-Source: ABdhPJzDpvDDoDeAQtR4qPQ1yu0uEmuzbFEazgM7zReICe9a0mIboMZnlkDXc4LXEvKg8T2k0AqWzg==
X-Received: by 2002:a17:90a:708c:: with SMTP id g12mr12536790pjk.36.1605467364349;
        Sun, 15 Nov 2020 11:09:24 -0800 (PST)
Received: from localhost.localdomain ([163.172.76.58])
        by smtp.googlemail.com with ESMTPSA id gk22sm15616211pjb.39.2020.11.15.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 11:09:23 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] hwmon: drivetemp: fix typo temperatire => temperature
Date:   Sun, 15 Nov 2020 19:09:10 +0000
Message-Id: <20201115190910.12539-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch fix a trivial typo temperatire => temperature.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/hwmon/drivetemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 72c760373957..1eb37106a220 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -10,7 +10,7 @@
  *    hwmon: Driver for SCSI/ATA temperature sensors
  *    by Constantin Baranov <const@mimas.ru>, submitted September 2009
  *
- * This drive supports reporting the temperatire of SATA drives. It can be
+ * This drive supports reporting the temperature of SATA drives. It can be
  * easily extended to report the temperature of SCSI drives.
  *
  * The primary means to read drive temperatures and temperature limits
-- 
2.26.2

