Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB697C4167B
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Dec 2020 19:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 829672251D
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Dec 2020 19:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407848AbgLLTuy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Dec 2020 14:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407849AbgLLTux (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Dec 2020 14:50:53 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD5EC0613D6
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Dec 2020 11:50:13 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r14so12469830wrn.0
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Dec 2020 11:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AI9UeHJd1RZE3KrYsQdCiIytSWaRnETl3JfwkRodYZk=;
        b=afuYrF6mEP14x7ppUOZC+rR2ueVDX3hM172WKtclxDLDBMsn+RDjicSKaIl5v5bzVw
         a4SUlDweC3hj1KPdMfdG/3KeuDElwqDAveABbILVfGgd2l98MVqxFK9iOAMf1pqjtPiA
         A4MPBNBx8541JaXVGhA7/NVFRw+/eCDOxo3c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AI9UeHJd1RZE3KrYsQdCiIytSWaRnETl3JfwkRodYZk=;
        b=FSTPkRBQ8bRJKiEC16Q3Js8HnQ4DBq/XpWVQ9iC26Yyl/1EXISPR5eOjNjkp09np3p
         ODr32C38lntcNlYqoefsYZxXYp6CuPq6bwECTiGl9dfjqOGClhgSYuTZxKrW1/8uFd+c
         cCvV8/DcCcI9C5aQr5ZsNDjYOMe4PnjVguqLKttv99uXzioHAmtoV2FL576oylnZUf5d
         UHq5jfr9+mT1cF9FtguvmmLJ0ojVhKWGX9GXr3KU1ZIaJugxy4WSWMULbUi0iVOS9Y8Y
         jUouctzEORHfO6x+WjWCp8YD0zCrRoZjxsjNIZS4NKKvKK6n2f3vyzehfCFqcPu6I+vP
         WV6g==
X-Gm-Message-State: AOAM531rZy9/0XwjaX0oaqsyK3rUHG+LD1DIMpzJujSBGHeHyjD2ZRMB
        NwRALbYJw/r2HzlRTVVsY6/qQQ==
X-Google-Smtp-Source: ABdhPJy3N2l/YoMlDKHVcbbZfvlm36APxlq3TRN63FmNBLpx1Wd8B8RWZLbOblkPNi7nd9HE8wesDA==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr20999761wrn.266.1607802612027;
        Sat, 12 Dec 2020 11:50:12 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id u66sm22128086wmg.2.2020.12.12.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 11:50:11 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: pwm-fan: Store tach data separately
Date:   Sat, 12 Dec 2020 19:50:07 +0000
Message-Id: <20201212195008.6036-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201212195008.6036-1-pbarker@konsulko.com>
References: <20201212195008.6036-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The data for the (optional) fan tachometer input is moved to a separate
structure which is only allocated if an input is actually configured.

After this change the pulse IRQ handler takes a pointer to the
tachometer data structure instead of the whole device context.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 52 +++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 777439f48c14..4a7f0e87b08f 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -21,15 +21,19 @@
 
 #define MAX_PWM 255
 
+struct pwm_fan_tach {
+	int irq;
+	atomic_t pulses;
+	unsigned int rpm;
+	u8 pulses_per_revolution;
+};
+
 struct pwm_fan_ctx {
 	struct mutex lock;
 	struct pwm_device *pwm;
 	struct regulator *reg_en;
 
-	int irq;
-	atomic_t pulses;
-	unsigned int rpm;
-	u8 pulses_per_revolution;
+	struct pwm_fan_tach *tach;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
 
@@ -65,9 +69,9 @@ static const struct hwmon_channel_info pwm_fan_channel_fan = {
 /* This handler assumes self resetting edge triggered interrupt. */
 static irqreturn_t pulse_handler(int irq, void *dev_id)
 {
-	struct pwm_fan_ctx *ctx = dev_id;
+	struct pwm_fan_tach *tach = dev_id;
 
-	atomic_inc(&ctx->pulses);
+	atomic_inc(&tach->pulses);
 
 	return IRQ_HANDLED;
 }
@@ -75,14 +79,15 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
 static void sample_timer(struct timer_list *t)
 {
 	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
+	struct pwm_fan_tach *tach = ctx->tach;
 	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
 	int pulses;
 
 	if (delta) {
-		pulses = atomic_read(&ctx->pulses);
-		atomic_sub(pulses, &ctx->pulses);
-		ctx->rpm = (unsigned int)(pulses * 1000 * 60) /
-			(ctx->pulses_per_revolution * delta);
+		pulses = atomic_read(&tach->pulses);
+		atomic_sub(pulses, &tach->pulses);
+		tach->rpm = (unsigned int)(pulses * 1000 * 60) /
+			(tach->pulses_per_revolution * delta);
 
 		ctx->sample_start = ktime_get();
 	}
@@ -152,7 +157,7 @@ static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
 		return 0;
 
 	case hwmon_fan:
-		*val = ctx->rpm;
+		*val = ctx->tach->rpm;
 		return 0;
 
 	default:
@@ -362,14 +367,21 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	channels[0] = &pwm_fan_channel_pwm;
 
 	if (tach_count > 0) {
+		struct pwm_fan_tach *tach;
 		u32 ppr = 2;
 
-		ctx->irq = platform_get_irq(pdev, 0);
-		if (ctx->irq == -EPROBE_DEFER)
-			return ctx->irq;
-		if (ctx->irq > 0) {
-			ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
-					       pdev->name, ctx);
+		tach = devm_kzalloc(dev, sizeof(struct pwm_fan_tach),
+					 GFP_KERNEL);
+		if (!tach)
+			return -ENOMEM;
+		ctx->tach = tach;
+
+		tach->irq = platform_get_irq(pdev, 0);
+		if (tach->irq == -EPROBE_DEFER)
+			return tach->irq;
+		if (tach->irq > 0) {
+			ret = devm_request_irq(dev, tach->irq, pulse_handler, 0,
+					       pdev->name, tach);
 			if (ret) {
 				dev_err(dev,
 					"Failed to request interrupt: %d\n",
@@ -381,14 +393,14 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		of_property_read_u32(dev->of_node,
 				     "pulses-per-revolution",
 				     &ppr);
-		ctx->pulses_per_revolution = ppr;
-		if (!ctx->pulses_per_revolution) {
+		tach->pulses_per_revolution = ppr;
+		if (!tach->pulses_per_revolution) {
 			dev_err(dev, "pulses-per-revolution can't be zero.\n");
 			return -EINVAL;
 		}
 
 		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
-			ctx->irq, ctx->pulses_per_revolution);
+			tach->irq, tach->pulses_per_revolution);
 
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
-- 
2.26.2

