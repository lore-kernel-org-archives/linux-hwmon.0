Return-Path: <SRS0=vQlV=EL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E22BC55179
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Nov 2020 16:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDDEC2080D
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Nov 2020 16:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YSA5TqNv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730854AbgKEQmV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 5 Nov 2020 11:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKEQmV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 5 Nov 2020 11:42:21 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDAAC0613CF
        for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2020 08:42:20 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e6so2543183wro.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2020 08:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LQUi4QNCkeBjCHL4o8+DwLkZZm/NfdNMirZ1wMzh4YI=;
        b=YSA5TqNvKd2zU3fUObWUZT2whTuqWtut5nYw6G5nJT/qwT+8EpZfOPifwsk/wnKxia
         e6OmYi5nHBz5rtqlFZN4A9FmBi2Cx8DIOypzFaclfDXLzSf2fwivdw3o75yattQ37J4d
         utP6P58iipK8KorZzg3Y6ko16IZT4eUqB5lU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LQUi4QNCkeBjCHL4o8+DwLkZZm/NfdNMirZ1wMzh4YI=;
        b=LyIZIXVIht7V2TWUqbny/6vqm+4xnbx/HBbrF9y3JUxXSx1g1ql1bkQ8ExecrwJ3/1
         +Gc04uciMuOyOTVbILZyZCMsW6uSG0pdWsJtxjozTjxGdEFPq4OScMTc/X6O90flmh93
         dg3IZtVGl61+iI460nsmi+zLoKhFEM6O07BMd2ATA5wad3FjmbUdCd8qmRoVdDj28F30
         yZ2FtpWv41j1x7hA39m80SPHQjd5aRsxmZKNxh29fE5ImcEYPXrIcZDzpPZ4j0kLddJe
         93dmTZoTEG2CHScP9HbYJJRyzmLANGyFjHhNHa4oEYABCol7bocV9SMDBh8HeeRIQWJk
         VpDw==
X-Gm-Message-State: AOAM531PR1haTv11fxYPpCzen8kPFgLigP/hcFUwXA7xeKEeNdgi5UJN
        SLwv2GKaD+CAP13IqdNumSx3FVCZfpb4AQ==
X-Google-Smtp-Source: ABdhPJwzdSllNKnOj3cf/yR6RHmY8bx5gCGy85E20jA475tshH6pU9CR4KLkfiksHyMX/HUXwvzDvQ==
X-Received: by 2002:adf:f286:: with SMTP id k6mr4027017wro.34.1604594539695;
        Thu, 05 Nov 2020 08:42:19 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id j13sm3303141wru.86.2020.11.05.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 08:42:19 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: pwm-fan: Fix RPM calculation
Date:   Thu,  5 Nov 2020 16:41:46 +0000
Message-Id: <20201105164146.182254-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
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

As the sample_timer() function is called once per second, delta will usually
be just over 1000 and should never be zero, avoiding the risk of a divide by
zero exception.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..2f2950629892 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -54,14 +54,13 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
 static void sample_timer(struct timer_list *t)
 {
 	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
+	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
 	int pulses;
-	u64 tmp;
 
 	pulses = atomic_read(&ctx->pulses);
 	atomic_sub(pulses, &ctx->pulses);
-	tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
-	do_div(tmp, ctx->pulses_per_revolution * 1000);
-	ctx->rpm = tmp;
+	ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
+		(ctx->pulses_per_revolution * delta);
 
 	ctx->sample_start = ktime_get();
 	mod_timer(&ctx->rpm_timer, jiffies + HZ);
-- 
2.29.2

