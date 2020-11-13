Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FB4C388F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A46782225D
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="dXybmEmD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgKMPJi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPJi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:38 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77F7C0613D1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:37 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so8811339wmi.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zlVLQ/eSSwM5CkwG1+n/Ft7FPgN9/8zKQeZjhQqRfeo=;
        b=dXybmEmDuBX0Q1fgLUW0rXxBcBqR3kyUaQwV/rqQox5FPWTpQufr/i8HBueAxjobKG
         OA5qR52jYsjNS5ISEomcDIPuMAqZkMMio0ir6XFMJXUGxsOIb0CL2OG34me89wpikBTy
         eOPCiyLAE0fs91tGo4FCVwfzcvpDozki429rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zlVLQ/eSSwM5CkwG1+n/Ft7FPgN9/8zKQeZjhQqRfeo=;
        b=NTOCZD51v9N2XgMeBPqRp8ni+Mr3OFWy8p4uDEcMu93oYMmfHeDvwm7qilifcYlXWp
         48jsUIV05dck7KcsTj1qyOyt6e00WZxH/7MCOgXdXHZUaLws4WomvEMgoSeGSTO4IxvQ
         a0j2xdnAapiUil9Aocw7iAacc1OPnvL/CSJB58uq8DxX1uNR3x20+o17+wT7ftvruWMv
         wLsCflneE1j4y7DHX36iT2qj3HW9yggb7APHBLvSI55K/aPvBa2gG5GAGZ83uoHy4x2x
         aAJ4MExi6rhoaxiYwwwR8F0M1hTMyopT5ElRTxlbf0zFkXktgZUABay6nbpvgpZJELW6
         kWxw==
X-Gm-Message-State: AOAM531wkvXx+ewPHHeu5yaI7V3bKnCrlss8QOyg1266TJae1XZO9MUq
        Bj+NkAxaJtm+lEYH9/huqY/pbw==
X-Google-Smtp-Source: ABdhPJwZSl/Nrkh8PVuucGCJcZccnMJjUUPOD+SvWk9eTg+BfGjZe9a5IFYjEfSfmZbga09ZP4CJ7Q==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr2976635wmo.119.1605280175577;
        Fri, 13 Nov 2020 07:09:35 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id v2sm11368221wrm.96.2020.11.13.07.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:09:35 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/4] hwmon: pwm-fan: Dynamically setup attribute groups
Date:   Fri, 13 Nov 2020 15:08:51 +0000
Message-Id: <20201113150853.155495-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113150853.155495-1-pbarker@konsulko.com>
References: <20201113150853.155495-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Instead of implementing an is_visible function we can dynamically
populate the attribute group for the device based on whether a fan
tachometer input is configured or not.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 55 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index efe2764f42d3..c4e0059ccaec 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -31,6 +31,8 @@ struct pwm_fan_ctx {
 	atomic_t pulses;
 	unsigned int rpm;
 	u8 pulses_per_revolution;
+	struct sensor_device_attribute sensor_attr;
+
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
 
@@ -39,6 +41,9 @@ struct pwm_fan_ctx {
 	unsigned int pwm_fan_max_state;
 	unsigned int *pwm_fan_cooling_levels;
 	struct thermal_cooling_device *cdev;
+
+	struct attribute_group fan_group;
+	struct attribute_group *fan_groups[2];
 };
 
 /* This handler assumes self resetting edge triggered interrupt. */
@@ -138,36 +143,6 @@ static ssize_t rpm_show(struct device *dev,
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
@@ -287,6 +262,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	int ret;
 	struct pwm_state state = { };
 	int tach_count;
+	size_t sz;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -340,6 +316,13 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, tach_count,
 				     "Could not get number of fan tachometer inputs\n");
 
+	sz = (2 + tach_count) * sizeof(struct attribute *);
+	ctx->fan_group.attrs = devm_kzalloc(dev, sz, GFP_KERNEL);
+	if (!ctx->fan_group.attrs)
+		return -ENOMEM;
+
+	ctx->fan_group.attrs[0] = &sensor_dev_attr_pwm1.dev_attr.attr;
+
 	if (tach_count > 0) {
 		u32 ppr = 2;
 
@@ -366,6 +349,13 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
+		sysfs_attr_init(&ctx->sensor_attr.dev_attr.attr);
+
+		ctx->sensor_attr.dev_attr.attr.name = "fan1_input";
+		ctx->sensor_attr.dev_attr.attr.mode = 0444;
+		ctx->sensor_attr.dev_attr.show = rpm_show;
+		ctx->fan_group.attrs[1] = &ctx->sensor_attr.dev_attr.attr;
+
 		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
 			ctx->irq, ctx->pulses_per_revolution);
 
@@ -373,8 +363,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 	}
 
-	hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan",
-						       ctx, pwm_fan_groups);
+	ctx->fan_groups[0] = &ctx->fan_group;
+	hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan", ctx,
+			(const struct attribute_group **)ctx->fan_groups);
 	if (IS_ERR(hwmon)) {
 		dev_err(dev, "Failed to register hwmon device\n");
 		return PTR_ERR(hwmon);
-- 
2.29.2

