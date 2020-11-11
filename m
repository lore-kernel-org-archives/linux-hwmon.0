Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE0FC56201
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Nov 2020 16:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F2AD2072C
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Nov 2020 16:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="IJvGQL+2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgKKQrW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Nov 2020 11:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgKKQrW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Nov 2020 11:47:22 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A420C0617A6
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2020 08:47:20 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id b8so3192407wrn.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2020 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sl6mRWJb6hC+B/3B7ZMIFDt8R8T+DTATTRfELGyMhE4=;
        b=IJvGQL+2FgRTdcH9Fr3MoIumViEpJAa5mwMfIBphrtYTKrixTO/Zt2eAgT2WrfJo7G
         bnlIs0wu7/ryHrHtcB/rawgO2SBH57Lt6XcmB1daodFZjs1fbS3agnf3g3qJEOEOa8Pw
         kYHcBMVaCRy/oqIOkT8+kZko6Ryhx0Mbm6sb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sl6mRWJb6hC+B/3B7ZMIFDt8R8T+DTATTRfELGyMhE4=;
        b=LVxZy+iXxY7TMQ7lS+P7lxlYa+Rq7mHnlG62adxmJldq12pVkLJU2+2deTu/C5IG0K
         W2WzdoUcjKnYUg8jZfnczbGMBZkItYdWQYTrLDoVsmiQBSE7SJuFrkUCnsbmUERBOStU
         776clHEKiUmGy7rY0GTsm/eXKJPPDCtnpQmQlbICL/pstRwZyo0nQNGlh7Zr3sAiKsdo
         +AyQSEM9GWEIlOqX+E4BfCQCtJqad2JgHv56CC95h7O/y/XQL3+rG+/wVlo/g5Ab1q85
         OvBDYCuKoDRLEqJ4K7A49pfurFzn9WIPIZV/bT+VwMHfLgnaHEVmi2WsDc4eqeM83xUa
         IE/g==
X-Gm-Message-State: AOAM530lYUFoAgSWFyhs/FnsLj/1WujU8q11T8idxuO6LEy3XlRAFYBS
        9hyKrHAuRLIGTNdPqYM2ICDCDA==
X-Google-Smtp-Source: ABdhPJx0l/JUortFpH8EE2sqKVul683H7hEAzUN896SDfW6+z94JE/PBuApFQC61BjGmI833n82P0g==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr31015539wrw.226.1605113239205;
        Wed, 11 Nov 2020 08:47:19 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id 71sm3250877wrm.20.2020.11.11.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:47:18 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v5] hwmon: pwm-fan: Fix RPM calculation
Date:   Wed, 11 Nov 2020 16:46:43 +0000
Message-Id: <20201111164643.7087-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

To convert the number of pulses counted into an RPM estimation, we need
to divide by the width of our measurement interval instead of
multiplying by it. If the width of the measurement interval is zero we
don't update the RPM value to avoid dividing by zero.

We also don't need to do 64-bit division, with 32-bits we can handle a
fan running at over 4 million RPM.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---

  Changes from v4:

    * Don't update ctx->sample_start if delta=0.

  Changes from v2:

    * Don't update the RPM value if delta=0.

 drivers/hwmon/pwm-fan.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..1f63807c0399 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -54,16 +54,18 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
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
+
+		ctx->sample_start = ktime_get();
+	}
 
-	ctx->sample_start = ktime_get();
 	mod_timer(&ctx->rpm_timer, jiffies + HZ);
 }
 

base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
-- 
2.29.2

