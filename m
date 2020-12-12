Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEBBC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Dec 2020 19:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A1AF22571
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Dec 2020 19:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501939AbgLLTuy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Dec 2020 14:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501917AbgLLTuy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Dec 2020 14:50:54 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57282C061793
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Dec 2020 11:50:14 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id t4so12427330wrr.12
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Dec 2020 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=06gVRLVHFqpjRliaUS/t56MuA9H6kvY944xIPmjZvCQ=;
        b=mZyBKK8pIhTI9bGeCapwg0oYq1INNVcAvuHS0L07cOQbHflcyIO0fNJ9f7bSJ/FHth
         dmLHmsSeXYyjbC86JduFeJvIzcXNXZLp3seQDio30ouPCzm9FIgci3bs85ggLK/YoXhs
         srxAQTkswHncUXZwg8Jd6QVOHBQ8mcdO9u4z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06gVRLVHFqpjRliaUS/t56MuA9H6kvY944xIPmjZvCQ=;
        b=r84ORp+EBqFbC7WHgq9Yc3O3O8iWEBhMvQDfthKEXzirhg2Nb6wp6UNLVUMajZtf+L
         9ltXMdV4ytR4gSHF1H0jHH3szyU0r90Eu8anFicBxLUkLP4bGn1eXFiL37xVJZLQTwOh
         Yn4HqmhjNR+OsZOjkxZTWCNnfIzlxPE6XttB7IHmO0VXFQ4zJu8HqGL2N/uq9B7Ez29r
         ria9f1EaheVxDP6pe1iQUlGu/8ncrGtgw4qfCtu/75FEB6E0gxGoYoCxYJIkBgy3jSeI
         MvpzMmAmSzd2lL0yY2tc6eVsnmpbOag/W9VHjch8209JtSAh83ZyJ7yFmaAHx92BWUjY
         MgJQ==
X-Gm-Message-State: AOAM532rNIq5HI71/jy2HwiQdP5ChFOvmD3wTpU4tZOi6FjfH5Rv5SNA
        53wuFTXhOBA/8FSyE/+rXejDdg==
X-Google-Smtp-Source: ABdhPJyBxIor9K4Uv7JAsHDQalr6r0U9D/ZaV0CpJZb4K2CtZy7Qy94GcdMFkEuG8iQWZnO8DfLgEw==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr20776044wrn.171.1607802613087;
        Sat, 12 Dec 2020 11:50:13 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id u66sm22128086wmg.2.2020.12.12.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 11:50:12 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: pwm-fan: Support multiple fan tachometers
Date:   Sat, 12 Dec 2020 19:50:08 +0000
Message-Id: <20201212195008.6036-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201212195008.6036-1-pbarker@konsulko.com>
References: <20201212195008.6036-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pwm-fan driver is extended to support multiple fan tachometer
signals connected to GPIO inputs. This is intended to support the case
where a single PWM output signal is routed to multiple fans, each of
which have a tachometer output connected back to a GPIO pin.

The number of fan tachometer inputs is determined by the number of
interrupt sources configured for the pwm-fan device. The number of
pulses-per-revolution entries should match the number of interrupt
sources so that each input has a value assigned.

The fan tachometer measurements are exposed as sysfs files fan1_input,
fan2_input, etc up to the number of configured inputs.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 91 ++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 4a7f0e87b08f..cc64bae0ffa8 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -33,7 +33,8 @@ struct pwm_fan_ctx {
 	struct pwm_device *pwm;
 	struct regulator *reg_en;
 
-	struct pwm_fan_tach *tach;
+	int tach_count;
+	struct pwm_fan_tach *tachs;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
 
@@ -44,6 +45,7 @@ struct pwm_fan_ctx {
 	struct thermal_cooling_device *cdev;
 
 	struct hwmon_chip_info info;
+	struct hwmon_channel_info fan_channel;
 };
 
 static const u32 pwm_fan_channel_config_pwm[] = {
@@ -56,16 +58,6 @@ static const struct hwmon_channel_info pwm_fan_channel_pwm = {
 	.config = pwm_fan_channel_config_pwm,
 };
 
-static const u32 pwm_fan_channel_config_fan[] = {
-	HWMON_F_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info pwm_fan_channel_fan = {
-	.type = hwmon_fan,
-	.config = pwm_fan_channel_config_fan,
-};
-
 /* This handler assumes self resetting edge triggered interrupt. */
 static irqreturn_t pulse_handler(int irq, void *dev_id)
 {
@@ -79,15 +71,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
 static void sample_timer(struct timer_list *t)
 {
 	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
-	struct pwm_fan_tach *tach = ctx->tach;
 	unsigned int delta = ktime_ms_delta(ktime_get(), ctx->sample_start);
-	int pulses;
+	int i;
 
 	if (delta) {
-		pulses = atomic_read(&tach->pulses);
-		atomic_sub(pulses, &tach->pulses);
-		tach->rpm = (unsigned int)(pulses * 1000 * 60) /
-			(tach->pulses_per_revolution * delta);
+		for (i = 0; i < ctx->tach_count; i++) {
+			struct pwm_fan_tach *tach = &ctx->tachs[i];
+			int pulses;
+
+			pulses = atomic_read(&tach->pulses);
+			atomic_sub(pulses, &tach->pulses);
+			tach->rpm = (unsigned int)(pulses * 1000 * 60) /
+				(tach->pulses_per_revolution * delta);
+		}
 
 		ctx->sample_start = ktime_get();
 	}
@@ -157,7 +153,7 @@ static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
 		return 0;
 
 	case hwmon_fan:
-		*val = ctx->tach->rpm;
+		*val = ctx->tachs[channel].rpm;
 		return 0;
 
 	default:
@@ -304,8 +300,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	struct pwm_state state = { };
-	int tach_count;
 	const struct hwmon_channel_info **channels;
+	u32 *fan_channel_config;
+	int channel_count = 1;	/* We always have a PWM channel. */
+	int i;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -354,29 +352,41 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	tach_count = platform_irq_count(pdev);
-	if (tach_count < 0)
-		return dev_err_probe(dev, tach_count,
+	ctx->tach_count = platform_irq_count(pdev);
+	if (ctx->tach_count < 0)
+		return dev_err_probe(dev, ctx->tach_count,
 				     "Could not get number of fan tachometer inputs\n");
+	dev_dbg(dev, "%d fan tachometer inputs\n", ctx->tach_count);
 
-	channels = devm_kcalloc(dev, tach_count + 2,
+	if (ctx->tach_count) {
+		channel_count++;	/* We also have a FAN channel. */
+
+		ctx->tachs = devm_kcalloc(dev, ctx->tach_count,
+					  sizeof(struct pwm_fan_tach),
+					  GFP_KERNEL);
+		if (!ctx->tachs)
+			return -ENOMEM;
+
+		ctx->fan_channel.type = hwmon_fan;
+		fan_channel_config = devm_kcalloc(dev, ctx->tach_count + 1,
+						  sizeof(u32), GFP_KERNEL);
+		if (!fan_channel_config)
+			return -ENOMEM;
+		ctx->fan_channel.config = fan_channel_config;
+	}
+
+	channels = devm_kcalloc(dev, channel_count + 1,
 				sizeof(struct hwmon_channel_info *), GFP_KERNEL);
 	if (!channels)
 		return -ENOMEM;
 
 	channels[0] = &pwm_fan_channel_pwm;
 
-	if (tach_count > 0) {
-		struct pwm_fan_tach *tach;
+	for (i = 0; i < ctx->tach_count; i++) {
+		struct pwm_fan_tach *tach = &ctx->tachs[i];
 		u32 ppr = 2;
 
-		tach = devm_kzalloc(dev, sizeof(struct pwm_fan_tach),
-					 GFP_KERNEL);
-		if (!tach)
-			return -ENOMEM;
-		ctx->tach = tach;
-
-		tach->irq = platform_get_irq(pdev, 0);
+		tach->irq = platform_get_irq(pdev, i);
 		if (tach->irq == -EPROBE_DEFER)
 			return tach->irq;
 		if (tach->irq > 0) {
@@ -390,22 +400,27 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			}
 		}
 
-		of_property_read_u32(dev->of_node,
-				     "pulses-per-revolution",
-				     &ppr);
+		of_property_read_u32_index(dev->of_node,
+					   "pulses-per-revolution",
+					   i,
+					   &ppr);
 		tach->pulses_per_revolution = ppr;
 		if (!tach->pulses_per_revolution) {
 			dev_err(dev, "pulses-per-revolution can't be zero.\n");
 			return -EINVAL;
 		}
 
-		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
-			tach->irq, tach->pulses_per_revolution);
+		fan_channel_config[i] = HWMON_F_INPUT;
+
+		dev_dbg(dev, "tach%d: irq=%d, pulses_per_revolution=%d\n",
+			i, tach->irq, tach->pulses_per_revolution);
+	}
 
+	if (ctx->tach_count > 0) {
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 
-		channels[1] = &pwm_fan_channel_fan;
+		channels[1] = &ctx->fan_channel;
 	}
 
 	ctx->info.ops = &pwm_fan_hwmon_ops;
-- 
2.26.2

