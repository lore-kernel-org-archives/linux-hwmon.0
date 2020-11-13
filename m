Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABEBC55ABD
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C416A2225E
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="rrccujCk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgKMPJj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPJj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:39 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF39C0617A6
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:38 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c17so10228174wrc.11
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eWGvHYLa2aBEzPoqidlg2Pw58TdL7QfyxPylAlX90ls=;
        b=rrccujCkP+6G9oW0Ot+K8OEvOIuXhzd+Pp9SKqpRiBbVUBD8YI1m6RjRI+GtRAJ2zP
         oEH+SooMwE57IJ/FaGh6ZJ8PzNXgMg6NSSX5qPlY4FxG7phBHPSViAhHYX/FIWBcncqp
         02ajRd0cjWveATyG7br9/E1mgOJotU9O+gSpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eWGvHYLa2aBEzPoqidlg2Pw58TdL7QfyxPylAlX90ls=;
        b=ujTWNRZxQK46t9IDKXlM4+i/aDlF5DFNrGRu7NQKc8lECvgu3pUAIbxvUlHIePew49
         67TPcpdRjYDey59mdTOhYGtR2SqeYM1/VbKP3SSSAUV5j1nar6cOZ3Rx0O6u4SpW79AV
         wvwRzlCWQYaN0DkU31k286XlA68homZEKFUb1YPfG3mDDYVFvxDuuZ6ePBr5SQuRZ/yg
         /mYMeaCXFebHSVrZIywIt/n/kr7oHE/vZfZxhVqyPu/xF+HWWywq8hGZl7mXj7GFwoNt
         VCuQp3W54hR6l1H34v3TBlNfrv03e/KyiypG2ttQ44Oi3Xz8g1R1xIasT10l0NRLCezk
         64iw==
X-Gm-Message-State: AOAM533wpBOJZqQ6atTROgls8gMID6dpUHE3A4R7TzzVKtglXiCXYxq0
        /VrV5PSLHk4cLYFkJOum6EJpOw==
X-Google-Smtp-Source: ABdhPJzRJw321ybvRm+nUlSZ3Yq8688KjeNPkrwnGWvByo5vl+1lKpUnUyJ2xwmaf1ZacmyI3TXrAw==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr4171208wro.246.1605280176728;
        Fri, 13 Nov 2020 07:09:36 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id v2sm11368221wrm.96.2020.11.13.07.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:09:36 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 3/4] hwmon: pwm-fan: Store tach data separately
Date:   Fri, 13 Nov 2020 15:08:52 +0000
Message-Id: <20201113150853.155495-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113150853.155495-1-pbarker@konsulko.com>
References: <20201113150853.155495-1-pbarker@konsulko.com>
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
 drivers/hwmon/pwm-fan.c | 66 +++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index c4e0059ccaec..7c75ce78b36a 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -22,17 +22,21 @@
 
 #define MAX_PWM 255
 
-struct pwm_fan_ctx {
-	struct mutex lock;
-	struct pwm_device *pwm;
-	struct regulator *reg_en;
-
+struct pwm_fan_tach {
 	int irq;
 	atomic_t pulses;
 	unsigned int rpm;
 	u8 pulses_per_revolution;
+
 	struct sensor_device_attribute sensor_attr;
+};
 
+struct pwm_fan_ctx {
+	struct mutex lock;
+	struct pwm_device *pwm;
+	struct regulator *reg_en;
+
+	struct pwm_fan_tach *tach;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
 
@@ -49,9 +53,9 @@ struct pwm_fan_ctx {
 /* This handler assumes self resetting edge triggered interrupt. */
 static irqreturn_t pulse_handler(int irq, void *dev_id)
 {
-	struct pwm_fan_ctx *ctx = dev_id;
+	struct pwm_fan_tach *tach = dev_id;
 
-	atomic_inc(&ctx->pulses);
+	atomic_inc(&tach->pulses);
 
 	return IRQ_HANDLED;
 }
@@ -59,14 +63,15 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
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
@@ -138,8 +143,9 @@ static ssize_t rpm_show(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+	struct pwm_fan_tach *tach = ctx->tach;
 
-	return sprintf(buf, "%u\n", ctx->rpm);
+	return sprintf(buf, "%u\n", tach->rpm);
 }
 
 static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
@@ -324,14 +330,22 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	ctx->fan_group.attrs[0] = &sensor_dev_attr_pwm1.dev_attr.attr;
 
 	if (tach_count > 0) {
+		struct pwm_fan_tach *tach;
 		u32 ppr = 2;
 
-		ctx->irq = platform_get_irq(pdev, 0);
-		if (ctx->irq == -EPROBE_DEFER)
-			return ctx->irq;
-		if (ctx->irq > 0) {
-			ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
-					       pdev->name, ctx);
+		ctx->tach = devm_kzalloc(dev, sizeof(struct pwm_fan_tach),
+					 GFP_KERNEL);
+		if (!ctx->tach)
+			return -ENOMEM;
+
+		tach = ctx->tach;
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
@@ -343,21 +357,21 @@ static int pwm_fan_probe(struct platform_device *pdev)
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
 
-		sysfs_attr_init(&ctx->sensor_attr.dev_attr.attr);
+		sysfs_attr_init(&tach->sensor_attr.dev_attr.attr);
 
-		ctx->sensor_attr.dev_attr.attr.name = "fan1_input";
-		ctx->sensor_attr.dev_attr.attr.mode = 0444;
-		ctx->sensor_attr.dev_attr.show = rpm_show;
-		ctx->fan_group.attrs[1] = &ctx->sensor_attr.dev_attr.attr;
+		tach->sensor_attr.dev_attr.attr.name = "fan1_input";
+		tach->sensor_attr.dev_attr.attr.mode = 0444;
+		tach->sensor_attr.dev_attr.show = rpm_show;
+		ctx->fan_group.attrs[1] = &tach->sensor_attr.dev_attr.attr;
 
 		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
-			ctx->irq, ctx->pulses_per_revolution);
+			tach->irq, tach->pulses_per_revolution);
 
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
-- 
2.29.2

