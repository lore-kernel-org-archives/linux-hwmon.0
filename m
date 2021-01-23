Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85BCC43381
	for <linux-hwmon@archiver.kernel.org>; Sat, 23 Jan 2021 03:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DDD723B21
	for <linux-hwmon@archiver.kernel.org>; Sat, 23 Jan 2021 03:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbhAWDqX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Jan 2021 22:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbhAWDqO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Jan 2021 22:46:14 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FAAC061223
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Jan 2021 19:44:39 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id h15so1896544pli.8
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Jan 2021 19:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xR8YQMKfgP2HW7WhNJdeAV7/ctNsHW3A/OLYCiFLrok=;
        b=b639/5WXIPJKT58P9xeSP1JaicOfVaw68rgoB6ixWuLWuRnjv1R9nhdQmvtIQhf5uv
         sb8QrtLVBCaVNE/ke2X86B8/akvUSiqo5kNEP1p92wvub6eoMEDRgD6O2KGV/aAHj90A
         MBRtkikOQMmUqYogC9xlA1SIGLpgORIJq6e30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xR8YQMKfgP2HW7WhNJdeAV7/ctNsHW3A/OLYCiFLrok=;
        b=hyY1o99lZaizokNljITrNM9x/vUSy+kJrwhIslekrzpzT3H2pPwkfjYk/zfxe5dkbz
         si7PBcP+r7tJXX5Q/DSMS9TssJw52m+0J9eaqmRaGLZ86rn7UqBml5gpF7nZiYulp5Aj
         RNERX9E9Z/2TJE2YgqEu5r2JfZxwJni7C208jVzW1iWnonmyuK+qCwBJjR4OC89tJfAy
         RJY/3w6srxt/ES3Q/omANOQ8IafQKuIzDwOWODQxo7DV2A1gQ2mECiv2uWNnquW3xn43
         uUSlUIQdvWpeVTq3HwQ63lOOqk5hC8FIUJp1JrNalQfykhkrQ7Qt8H9W2aTcTMND9hrJ
         uGmw==
X-Gm-Message-State: AOAM5318kXsWhpOTC9uFFe90EbjBqdoLxZpWHxzyQgRDFanDaXWS9KeD
        ZHIYRdknkZtWaWIGMiuhJzUx4g==
X-Google-Smtp-Source: ABdhPJxjpyrtoHQKuXYDd99QrdPxjgxKSzYNJ0kZP6Q5tAl++sVk8vA/tI1Q8vi4PiUjKULQZ/QwNQ==
X-Received: by 2002:a17:90a:5d13:: with SMTP id s19mr3332843pji.110.1611373479572;
        Fri, 22 Jan 2021 19:44:39 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id gf23sm10480343pjb.42.2021.01.22.19.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:44:39 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 5/6] hwmon: (lm70) Avoid undefined reference to match table
Date:   Fri, 22 Jan 2021 19:44:27 -0800
Message-Id: <20210123034428.2841052-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210123034428.2841052-1-swboyd@chromium.org>
References: <20210123034428.2841052-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

We're going to remove of_match_ptr() from the definition of
of_match_device() when CONFIG_OF=n. This way we can always be certain
that of_match_device() acts the same when CONFIG_OF is set and when it
isn't. Add of_match_ptr() here so that this doesn't break when that
change is made to the of_match_device() API.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-hwmon@vger.kernel.org>
---

Please ack so Rob can apply.

 drivers/hwmon/lm70.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index ae2b84263a44..e3153ae80634 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -178,7 +178,7 @@ static int lm70_probe(struct spi_device *spi)
 	struct lm70 *p_lm70;
 	int chip;
 
-	of_match = of_match_device(lm70_of_ids, &spi->dev);
+	of_match = of_match_device(of_match_ptr(lm70_of_ids), &spi->dev);
 	if (of_match)
 		chip = (int)(uintptr_t)of_match->data;
 	else {
-- 
https://chromeos.dev

