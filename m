Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FB9C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 17:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D3E207D3
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 17:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="SQ2XJD79"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgKJRzO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJRzO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 12:55:14 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A389CC0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 09:55:12 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id b6so2340910wrt.4
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EQYx9zH63AvyW1sDHfoz1a/ffE3wZoAVdeE30FDrYYQ=;
        b=SQ2XJD79B5Sdswan6CFyzTrjbzKSW6BDBI9jqf5JNA/fHagQybM5VWi9GMSiRuz7pD
         cBxRINk6ucJwDDdrmoAJCH+Ogj0yForupfipWGPFBiOJsUNXXuCLqIRNP4dNFNVP98Sq
         X5RdVTW0vHzQrKjONrXnWWrguXpfowWFnV8qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EQYx9zH63AvyW1sDHfoz1a/ffE3wZoAVdeE30FDrYYQ=;
        b=Mj5FSllLWM8m12r6IymoeRybpTglXJB+ejcRDfncdwYHqQ5Z1BlbPfrsZGmgM7IV3w
         qe1k2QeY+gDB/6Q7EeCmW1psIFOL5hR4lyV2s+qxTQ6Rtk1FyYsnrXUxhQztMnzQ5089
         zidBwQxYN6rXM0uelXGOBypmHAkpRKbm+7p5rVvfmC502coloeKRaS9azlWJ9j3/hd4e
         v+ptbYMSO6cetQvilothGC3T1yvzCKYtb1/13myXb5XKpvbWxHOl6tIUM5dxo1dbSD5k
         sV8vkgjUmqxrGfZusFEZh3XlOWKD3hRQl673kmDSwBSDCUtfkS+fYJqQRfEiSTDsT6Sq
         bs1g==
X-Gm-Message-State: AOAM533ORfObi4ke1UpCILx/YgK6IYn2bLVCQLPcXcuEuhHpL1Eliqt5
        A1DYhu+kURcHEEqYu0xojdkM5A==
X-Google-Smtp-Source: ABdhPJwvCy7VKDFIyqrRdgvr4XID3fWRw6GdxtBJ/yEI+TTFgYcGDqV95ZZPvRtg2pRtUdMlViW33Q==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr26714946wrs.178.1605030911365;
        Tue, 10 Nov 2020 09:55:11 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id k84sm3917164wmf.42.2020.11.10.09.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:55:10 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v4] hwmon: pwm-fan: Fix RPM calculation
Date:   Tue, 10 Nov 2020 17:54:34 +0000
Message-Id: <20201110175434.2591741-1-pbarker@konsulko.com>
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

  Changes from v2:

    * Don't update the RPM value if delta=0.

 drivers/hwmon/pwm-fan.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..d1fd50c32514 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -54,14 +54,15 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
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
+	}
 
 	ctx->sample_start = ktime_get();
 	mod_timer(&ctx->rpm_timer, jiffies + HZ);

base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
-- 
2.29.2

