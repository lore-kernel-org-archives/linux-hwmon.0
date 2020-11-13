Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6399FC63697
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A19C22249
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="QZn2VvKu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgKMPJj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPJj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:39 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE14C0613D1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:39 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h2so8453153wmm.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pAWPrO2/9s7VsqZCjQ34zbmG6M+xaNdfHE34WnneOZk=;
        b=QZn2VvKu+HHXrMfpO40xQzAYWLDj8upVIgTkbOWN2xKzAbXX787rKXAR5V8RcpFmGb
         Pkg5tdRLqrNy3XBcTX7LllCUB08g6Ug/hqER0Rs0FN6mJKV4C9fsYlkyM6fyEbqhv2w9
         4C+2NE6m6gYfABnmpaLkO3mEk0YlFkrLOGs1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pAWPrO2/9s7VsqZCjQ34zbmG6M+xaNdfHE34WnneOZk=;
        b=WgzeGUf28YzQkFQGmFHn6PK2jUHqZtyZzaQ/EpEPWOdg7WuICr8ELFlJGs298ooZQ6
         DbYCicDOiHbfiiJk/+hvsJRaWup2A4SodRfXXjt6djz7LAMHhyI39yJmesQhdnqRa1pt
         yDg0bCQ7FmezzwvYtYO7abR0nNOndMxSQRG5kCys6V6CkDFkhWlIq6oIHEUGbtEQtinN
         Vp1DehnJ5kUkx06LgSVBbBOqWaDeNNCSnmInlagoIGBydUu8//+3y66foqfSsisOzakz
         vg6wY5C+J4HXHdpsg7uw1LLTu8CygE5FvdLjHBMWM4iEBzFTh76VP4S1x3qHeL9sdJim
         BlFw==
X-Gm-Message-State: AOAM531uH5nW6WGbfzF2Tm7rN0+HHeLWGtctm9pGDuCjdxHe7VoTq7q2
        3xETvYSkIVlJ0Sdc97DP2cteqw==
X-Google-Smtp-Source: ABdhPJyBGUMw98cCiEZbk8caErfSsMX1xsLfnNDqpivtp+KsocrKc9ZYKtcTSIYGAw6bvHYBwfU7gg==
X-Received: by 2002:a05:600c:2ccb:: with SMTP id l11mr7309wmc.65.1605280177885;
        Fri, 13 Nov 2020 07:09:37 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id v2sm11368221wrm.96.2020.11.13.07.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:09:37 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 4/4] hwmon: pwm-fan: Support multiple fan tachometers
Date:   Fri, 13 Nov 2020 15:08:53 +0000
Message-Id: <20201113150853.155495-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113150853.155495-1-pbarker@konsulko.com>
References: <20201113150853.155495-1-pbarker@konsulko.com>
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
 drivers/hwmon/pwm-fan.c | 72 ++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 29 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 7c75ce78b36a..03a3b57e2d99 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -36,7 +36,8 @@ struct pwm_fan_ctx {
 	struct pwm_device *pwm;
 	struct regulator *reg_en;
 
-	struct pwm_fan_tach *tach;
+	int tach_count;
+	struct pwm_fan_tach *tachs;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
 
@@ -63,15 +64,19 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
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
@@ -143,7 +148,8 @@ static ssize_t rpm_show(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
-	struct pwm_fan_tach *tach = ctx->tach;
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct pwm_fan_tach *tach = &ctx->tachs[sensor_attr->index];
 
 	return sprintf(buf, "%u\n", tach->rpm);
 }
@@ -267,8 +273,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	struct pwm_state state = { };
-	int tach_count;
 	size_t sz;
+	int i;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -317,30 +323,32 @@ static int pwm_fan_probe(struct platform_device *pdev)
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
 
-	sz = (2 + tach_count) * sizeof(struct attribute *);
+	sz = (2 + ctx->tach_count) * sizeof(struct attribute *);
 	ctx->fan_group.attrs = devm_kzalloc(dev, sz, GFP_KERNEL);
 	if (!ctx->fan_group.attrs)
 		return -ENOMEM;
 
 	ctx->fan_group.attrs[0] = &sensor_dev_attr_pwm1.dev_attr.attr;
 
-	if (tach_count > 0) {
-		struct pwm_fan_tach *tach;
-		u32 ppr = 2;
-
-		ctx->tach = devm_kzalloc(dev, sizeof(struct pwm_fan_tach),
-					 GFP_KERNEL);
-		if (!ctx->tach)
+	if (ctx->tach_count > 0) {
+		sz = ctx->tach_count * sizeof(struct pwm_fan_tach);
+		ctx->tachs = devm_kzalloc(dev, sz, GFP_KERNEL);
+		if (!ctx->tachs)
 			return -ENOMEM;
+	}
 
-		tach = ctx->tach;
+	for (i = 0; i < ctx->tach_count; i++) {
+		struct pwm_fan_tach *tach = &ctx->tachs[i];
+		u32 ppr = 2;
+		char *name;
 
-		tach->irq = platform_get_irq(pdev, 0);
+		tach->irq = platform_get_irq(pdev, i);
 		if (tach->irq == -EPROBE_DEFER)
 			return tach->irq;
 		if (tach->irq > 0) {
@@ -354,9 +362,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
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
@@ -365,14 +374,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 		sysfs_attr_init(&tach->sensor_attr.dev_attr.attr);
 
-		tach->sensor_attr.dev_attr.attr.name = "fan1_input";
+		name = devm_kzalloc(dev, 16, GFP_KERNEL);
+		snprintf(name, 16, "fan%d_input", i + 1);
+		tach->sensor_attr.dev_attr.attr.name = name;
 		tach->sensor_attr.dev_attr.attr.mode = 0444;
 		tach->sensor_attr.dev_attr.show = rpm_show;
-		ctx->fan_group.attrs[1] = &tach->sensor_attr.dev_attr.attr;
+		tach->sensor_attr.index = i;
+		ctx->fan_group.attrs[i + 1] = &tach->sensor_attr.dev_attr.attr;
 
-		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
-			tach->irq, tach->pulses_per_revolution);
+		dev_dbg(dev, "%s: irq=%d, pulses_per_revolution=%d\n",
+			name, tach->irq, tach->pulses_per_revolution);
+	}
 
+	if (ctx->tach_count > 0) {
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 	}
-- 
2.29.2

