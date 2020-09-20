Return-Path: <SRS0=WP0z=C5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFEBC43469
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C85D42085B
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Dckm5oLu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgITSJ7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgITSJ7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Sep 2020 14:09:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4C7C061755
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so10465795wrv.1
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDb2dv5Jxrb/fBrQbxxyoPd7hIv8NZl7cd/jG64Q+Rc=;
        b=Dckm5oLuCi0D0n4lB94OhqKx4GQZhGs27KZ+CXfDB1Vd+Eeb/z3rsA9L/3EWnYDDso
         GNf1hpyqRq6X6Trm95ViRWCg6UVbaNFywm0ZkcTiqW+AHdos8IBN8guAjgo8ssW/QIn3
         +zBqI98xj4HceKBB2fFfaCxJsNniKTZWXHQrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDb2dv5Jxrb/fBrQbxxyoPd7hIv8NZl7cd/jG64Q+Rc=;
        b=aXV1dfkmtplJw3DHrmlVqkWCkDxxtwpRwF6PHIjBOiKfrAgpWO+OPY8nCamDEnrMd7
         nQNUmbIg8M7ygMyG5OK0BD5r+v576CaMzuN+xaTcGovPoA51740zwFPDjRer7bi9sUDe
         n/VPRdIpwkcH9/D0KxW/8xBSXknd3euIqwmaiM4zADWZtVzWyZXOir88qwbQFoqavS4y
         NfURrfY++XBo3BEedLulXXqXVfaLZiikmVecFjDaQlust1eh++eV1xp6gy5jVzclZ60/
         /9jRU/EQ/qZ9/FGFOr3F6TfJGv75Yj5ATXIaIm3Ll5DtagTBEy/QpXoKJj81XoivEhG8
         b6dA==
X-Gm-Message-State: AOAM533se9r0iNoYn6sOdJEifEIrz3IoWfNjNRc9JrT5W9BAAJNUdtoj
        G1OobdZ1w2sTEN0UbVoLskEq8w==
X-Google-Smtp-Source: ABdhPJwYORB1LbCrU1eb/Le+sux3jvgQvq4b1Az7soMozYVUjnRZKa+JEVKkoaMlgbIeCoxGGURKYA==
X-Received: by 2002:a05:6000:151:: with SMTP id r17mr47778902wrx.311.1600625397668;
        Sun, 20 Sep 2020 11:09:57 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id h186sm15823702wmf.24.2020.09.20.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:09:57 -0700 (PDT)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: pwm-fan: Support multiple tachometer inputs
Date:   Sun, 20 Sep 2020 19:09:42 +0100
Message-Id: <20200920180943.352526-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920180943.352526-1-pbarker@konsulko.com>
References: <20200920180943.352526-1-pbarker@konsulko.com>
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
fan2_input, etc up to the number of configured inputs. If no inputs are
configured then no corresponding sysfs files will be created. This
avoids the need for an is_visible function to hide unused fanN_input
sysfs files.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 165 ++++++++++++++++++++++++----------------
 1 file changed, 101 insertions(+), 64 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..d7f8c11b4543 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -22,15 +22,22 @@
 
 #define MAX_PWM 255
 
+struct pwm_fan_tach {
+	int irq;
+	atomic_t pulses;
+	unsigned int rpm;
+	u8 pulses_per_revolution;
+
+	struct sensor_device_attribute sensor_attr;
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
+	int tach_count;
+	struct pwm_fan_tach *tachs;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
 
@@ -39,14 +46,17 @@ struct pwm_fan_ctx {
 	unsigned int pwm_fan_max_state;
 	unsigned int *pwm_fan_cooling_levels;
 	struct thermal_cooling_device *cdev;
+
+	struct attribute_group fan_group;
+	struct attribute_group *fan_groups[2];
 };
 
 /* This handler assumes self resetting edge triggered interrupt. */
 static irqreturn_t pulse_handler(int irq, void *dev_id)
 {
-	struct pwm_fan_ctx *ctx = dev_id;
+	struct pwm_fan_tach *tach = dev_id;
 
-	atomic_inc(&ctx->pulses);
+	atomic_inc(&tach->pulses);
 
 	return IRQ_HANDLED;
 }
@@ -54,16 +64,23 @@ static irqreturn_t pulse_handler(int irq, void *dev_id)
 static void sample_timer(struct timer_list *t)
 {
 	struct pwm_fan_ctx *ctx = from_timer(ctx, t, rpm_timer);
-	int pulses;
-	u64 tmp;
+	ktime_t now = ktime_get();
+	int i;
 
-	pulses = atomic_read(&ctx->pulses);
-	atomic_sub(pulses, &ctx->pulses);
-	tmp = (u64)pulses * ktime_ms_delta(ktime_get(), ctx->sample_start) * 60;
-	do_div(tmp, ctx->pulses_per_revolution * 1000);
-	ctx->rpm = tmp;
+	for (i = 0; i < ctx->tach_count; i++) {
+		struct pwm_fan_tach *tach;
+		int pulses;
+		u64 tmp;
+
+		tach = &ctx->tachs[i];
+		pulses = atomic_read(&tach->pulses);
+		atomic_sub(pulses, &tach->pulses);
+		tmp = (u64)pulses * ktime_ms_delta(now, ctx->sample_start) * 60;
+		do_div(tmp, tach->pulses_per_revolution * 1000);
+		tach->rpm = tmp;
+	}
 
-	ctx->sample_start = ktime_get();
+	ctx->sample_start = now;
 	mod_timer(&ctx->rpm_timer, jiffies + HZ);
 }
 
@@ -131,41 +148,13 @@ static ssize_t rpm_show(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct pwm_fan_tach *tach = &ctx->tachs[sensor_attr->index];
 
-	return sprintf(buf, "%u\n", ctx->rpm);
+	return sprintf(buf, "%u\n", tach->rpm);
 }
 
 static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
-static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
-
-static struct attribute *pwm_fan_attrs[] = {
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	NULL,
-};
-
-static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
-				     int n)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
-
-	/* Hide fan_input in case no interrupt is available  */
-	if (n == 1 && ctx->irq <= 0)
-		return 0;
-
-	return a->mode;
-}
-
-static const struct attribute_group pwm_fan_group = {
-	.attrs = pwm_fan_attrs,
-	.is_visible = pwm_fan_attrs_visible,
-};
-
-static const struct attribute_group *pwm_fan_groups[] = {
-	&pwm_fan_group,
-	NULL,
-};
 
 /* thermal cooling device callbacks */
 static int pwm_fan_get_max_state(struct thermal_cooling_device *cdev,
@@ -284,7 +273,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	struct pwm_state state = { };
-	u32 ppr = 2;
+	size_t sz;
+	unsigned int i;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -298,10 +288,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	ctx->irq = platform_get_irq_optional(pdev, 0);
-	if (ctx->irq == -EPROBE_DEFER)
-		return ctx->irq;
-
 	ctx->reg_en = devm_regulator_get_optional(dev, "fan");
 	if (IS_ERR(ctx->reg_en)) {
 		if (PTR_ERR(ctx->reg_en) != -ENODEV)
@@ -337,26 +323,77 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	of_property_read_u32(dev->of_node, "pulses-per-revolution", &ppr);
-	ctx->pulses_per_revolution = ppr;
-	if (!ctx->pulses_per_revolution) {
-		dev_err(dev, "pulses-per-revolution can't be zero.\n");
-		return -EINVAL;
-	}
+	ctx->tach_count = platform_irq_count(pdev);
+	if (ctx->tach_count < 0)
+		return dev_err_probe(dev, ctx->tach_count,
+				     "Could not get number of fan tachometer inputs\n");
+	dev_dbg(dev, "%d fan tachometer inputs\n", ctx->tach_count);
 
-	if (ctx->irq > 0) {
-		ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
-				       pdev->name, ctx);
-		if (ret) {
-			dev_err(dev, "Failed to request interrupt: %d\n", ret);
-			return ret;
+	sz = (2 + ctx->tach_count) * sizeof(struct attribute *);
+	ctx->fan_group.attrs = devm_kzalloc(dev, sz, GFP_KERNEL);
+	if (!ctx->fan_group.attrs)
+		return -ENOMEM;
+
+	sz = ctx->tach_count * sizeof(struct pwm_fan_tach);
+	ctx->tachs = devm_kzalloc(dev, sz, GFP_KERNEL);
+	if (!ctx->tachs)
+		return -ENOMEM;
+
+	ctx->fan_group.attrs[0] = &sensor_dev_attr_pwm1.dev_attr.attr;
+	for (i = 0; i < ctx->tach_count; i++) {
+		struct pwm_fan_tach *tach = &ctx->tachs[i];
+		u32 ppr = 2;
+		char *name;
+
+		tach->irq = platform_get_irq(pdev, i);
+		if (tach->irq == -EPROBE_DEFER)
+			return tach->irq;
+
+		of_property_read_u32_index(dev->of_node,
+					   "pulses-per-revolution",
+					   i,
+					   &ppr);
+		tach->pulses_per_revolution = ppr;
+		if (!tach->pulses_per_revolution) {
+			dev_err(dev, "pulses-per-revolution can't be zero.\n");
+			return -EINVAL;
 		}
+
+		if (tach->irq > 0) {
+			ret = devm_request_irq(dev, tach->irq, pulse_handler, 0,
+					       pdev->name, tach);
+			if (ret) {
+				dev_err(dev,
+					"Failed to request interrupt: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		sysfs_attr_init(&tach->sensor_attr.dev_attr.attr);
+
+		name = devm_kzalloc(dev, 16, GFP_KERNEL);
+		snprintf(name, 16, "fan%d_input", i + 1);
+		tach->sensor_attr.dev_attr.attr.name = name;
+		tach->sensor_attr.dev_attr.attr.mode = 0444;
+		tach->sensor_attr.dev_attr.show = rpm_show;
+		tach->sensor_attr.index = i;
+		ctx->fan_group.attrs[i + 1] = &tach->sensor_attr.dev_attr.attr;
+
+		dev_dbg(dev, "%s: irq=%d, pulses_per_revolution=%d",
+			name, tach->irq, tach->pulses_per_revolution);
+	}
+
+	if (ctx->tach_count > 0) {
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 	}
 
-	hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan",
-						       ctx, pwm_fan_groups);
+	ctx->fan_groups[0] = &ctx->fan_group;
+
+	hwmon = devm_hwmon_device_register_with_groups(dev,
+			"pwmfan", ctx,
+			(const struct attribute_group **)ctx->fan_groups);
 	if (IS_ERR(hwmon)) {
 		dev_err(dev, "Failed to register hwmon device\n");
 		return PTR_ERR(hwmon);
-- 
2.28.0

