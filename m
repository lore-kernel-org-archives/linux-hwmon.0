Return-Path: <SRS0=WP0z=C5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC518C43466
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9924420829
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:10:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ZW7d3oqI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgITSKA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgITSKA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Sep 2020 14:10:00 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F366CC061755
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:59 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l15so10147114wmh.1
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U/3y8aL8xjaXoF5g8eBJHDwrEWSj6qaH/5qg/WgNfb4=;
        b=ZW7d3oqIcEZauhNIVxQ4aPHCTYU5uxTbAVNygwKqonp6VJewXYz+IVpRcB75KKT4aC
         sYaSYu12Z9rs8y3JuDXtHPeSs/1aVEZcqr2qdY+xNuoQr1SGL5JPKUWV2jedZDILWHBe
         phFrC9wZQUiEI4mS0qC9ftRG7EwOBHE83b/hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/3y8aL8xjaXoF5g8eBJHDwrEWSj6qaH/5qg/WgNfb4=;
        b=sH6eYNgCO84zN8cyPfWJuBYCsio4p9LbzcWy6TRfqEi7/E4Z21xi3HBQyqcTR/7p2K
         WtjO2wJ93fe2EGPJBUh2hKqeCrrgGhkb/bgupaP2gS6pn4Eusd3DB7iHohuOwXVwv1kG
         xxrZStOmt1Gu8yft1X9XDzD8d5Z2zmZbgGq6AzPJGcduLwJ5dKoOU2kd8liAVDoV39tA
         PSlVZ9iOpyvVE0sZ+zyLwYkF5QU3eEtoAJTdTKYrmxAsLonM+u090REs7c+F2p/7ZzTX
         p9p4DwLQVIaniRXkuC/pBkUhYaZhyzIwevVoPPWZKpM/fl4T+yaXcOzWIIE5uq3smq+y
         hMew==
X-Gm-Message-State: AOAM531R9GPxfXbnZHyao3jsx0bxzE/dvx2GEwnQ7Bgh/XJ5AgAUbAUg
        qc8SOH8gs8B6CGpb48/3G5Nr2VlmHLTHjQ==
X-Google-Smtp-Source: ABdhPJxTSoh6uhWTEEQhAiaFxpDd3IF2UtVH5inGnGlS0fLIY5EA8zmnLM+Bz1V1NIs5P7uaDMnO0w==
X-Received: by 2002:a1c:f20b:: with SMTP id s11mr27041641wmc.144.1600625398666;
        Sun, 20 Sep 2020 11:09:58 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id h186sm15823702wmf.24.2020.09.20.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:09:58 -0700 (PDT)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: pwm-fan: Fix RPM calculation
Date:   Sun, 20 Sep 2020 19:09:43 +0100
Message-Id: <20200920180943.352526-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920180943.352526-1-pbarker@konsulko.com>
References: <20200920180943.352526-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

To convert the number of pulses counted into an RPM estimation, we need
to divide by the width of our measurement interval instead of
multiplying by it.

We also don't need to do 64-bit division, with 32-bits we can handle a
fan running at over 4 million RPM.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index d7f8c11b4543..2649f6bf1a26 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -65,19 +65,18 @@ static void sample_timer(struct timer_list *t)
 {
 	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
 	ktime_t now = ktime_get();
+	unsigned int delta = ktime_ms_delta(now, ctx->sample_start);
 	int i;
 
 	for (i = 0; i < ctx->tach_count; i++) {
 		struct pwm_fan_tach *tach;
-		int pulses;
-		u64 tmp;
+		unsigned int pulses;
 
 		tach = &ctx->tachs[i];
 		pulses = atomic_read(&tach->pulses);
 		atomic_sub(pulses, &tach->pulses);
-		tmp = (u64)pulses * ktime_ms_delta(now, ctx->sample_start) * 60;
-		do_div(tmp, tach->pulses_per_revolution * 1000);
-		tach->rpm = tmp;
+		tach->rpm = (pulses * 1000 * 60) /
+			(tach->pulses_per_revolution * delta);
 	}
 
 	ctx->sample_start = now;
-- 
2.28.0

