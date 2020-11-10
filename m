Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F34C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 11:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2684120781
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 11:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Iw85vQnK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732116AbgKJL33 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 06:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731824AbgKJL2z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 06:28:55 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009A6C0613D3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 03:28:53 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so5182715wrw.10
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 03:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QcRHLaymtC6v0OYZ8BnRaI3EaRMpepE3kz0XiIhvQbI=;
        b=Iw85vQnKkCDY2Sd5xyZ3Io/Q6m/gzKZeMO3R7ECwEUMejlURv5fghPA073cVptWwe8
         kuA9Tn2IP7k0BGTDGYepbETLQSEhAtiGjHOtuR2tusq8SPXSlAx2atlkdPWpkMQh00hy
         OTs0MdO/z0YkD9kKaWp/v+whzduv/Vxuq8tBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QcRHLaymtC6v0OYZ8BnRaI3EaRMpepE3kz0XiIhvQbI=;
        b=IvIXtRB7tCmWtKrFuI5pTmmEHgzU6tjFPatM389oTyfcCl9NQr0kU+yQC92LBC2EvD
         aiFqOMnkzKfP57/8/DcjKqXYK+oElN7uHYIKlH7ShC4uJZwSvWQWl5M3DQPjqXdu0OiD
         3F8tKiqsTaXeB5LHSwpZLIUxSvaYDMXoRMUIsCUcBPy/c46DKAHI54aEr2AwCUW72kvU
         otYNA8cgZpMWIT+xbGKg8f5l2S7WNoUbyi8VwFVey6xxfjxrr9S4HEFOhRiKO4kw063e
         LbdvzLiOvru04bGN6jI8vanGg5RkeIgdVISgjl/dQjQMv31pA3JcVBfZOr/Np2/6xobv
         e1eA==
X-Gm-Message-State: AOAM532NBc65KNan+NXsAdVNgcv0ualedLD98G0FIqtnBomr/3WIfowQ
        iOJ0o8EoVJKYvmuw/YRGEeYNew==
X-Google-Smtp-Source: ABdhPJycWTY30ADYTD7582nT7r2OtFLtD5BN5ulfeUTBMydHlK8nHVIFPj0dZmCssJz4KpELEb9nFw==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr22393922wrv.69.1605007732794;
        Tue, 10 Nov 2020 03:28:52 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id c64sm2575608wmd.41.2020.11.10.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 03:28:52 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: pwm-fan: Fix RPM calculation
Date:   Tue, 10 Nov 2020 11:28:17 +0000
Message-Id: <20201110112817.52549-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110112817.52549-1-pbarker@konsulko.com>
References: <20201110112817.52549-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

To convert the number of pulses counted into an RPM estimation, we need
to divide by the width of our measurement interval instead of
multiplying by it. If the width of the measurement interval is zero we
bail out instead of dividing by it.

We also don't need to do 64-bit division, with 32-bits we can handle a
fan running at over 4 million RPM.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index edc0453be25a..24cfed4d625e 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -55,14 +55,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
 static void sample_timer(struct timer_list *t)
 {
 	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
+	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
 	int pulses;
-	u64 tmp;
 
-	pulses = atomic_read(&ctx->pulses);
-	atomic_sub(pulses, &ctx->pulses);
-	tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
-	do_div(tmp, ctx->pulses_per_revolution * 1000);
-	ctx->rpm = tmp;
+	if (delta) {
+		pulses = atomic_read(&ctx->pulses);
+		atomic_sub(pulses, &ctx->pulses);
+		ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
+			(ctx->pulses_per_revolution * delta);
+	} else {
+		dev_err(ctx->dev,
+			"Cannot determine fan RPM as time delta is zero\n");
+		ctx->rpm = 0;
+	}
 
 	ctx->sample_start = ktime_get();
 	mod_timer(&ctx->rpm_timer, jiffies + HZ);
-- 
2.29.2

