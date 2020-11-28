Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C31C63777
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 18:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF907246E2
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 18:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iYhPCMnM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgK1R76 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Nov 2020 12:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733041AbgK1R56 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Nov 2020 12:57:58 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5A5C0A3BE1
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 09:49:14 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id i2so9088762wrs.4
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 09:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWJXix7etR7ol53lyfN4QIUMtYkbtgEfChWSHg07ktY=;
        b=iYhPCMnMdlVRhexYkd0/KP72eUm5RdgTEGFH1v985ukMif/uQdPo/8mVjRhSErj0YS
         j7mCwlyDiRI1pUFcAd9u1RX7+hxYGdV937CflKZwlnlWylyY1wsyP/lnicxVYxEJnz7i
         7y6XcnR6vNgpTYx1NBGP34nW2CVOLz2EFbZt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWJXix7etR7ol53lyfN4QIUMtYkbtgEfChWSHg07ktY=;
        b=nFsgMF/vZZkZKORHK0QirlrIe6xulPxMPgt7p3MzxEuwZsHz/FVsVUu6X+wM4XV+k4
         mgSiplZkXoiI0khmH0cAN2blJHQpZb3MWVb4FLgUoNTZVBOSLYP87lmj2S6QmQHOsYa1
         IjdB2nSPCYqO5wpAuXss7mp0wt5Q4ZtszAOV2WYIh+ZYMbeMm6XPsah8cRaTqjWcErg1
         vRP6vksIwK3B+ke2hoYqPD6u67V99hKBNqhn67XjQOYQ+WBJpBPzUxh4A/JDmFyyLbo/
         xiLmZ4Lq1rIvujfCLaLDdK7CuOJCPzDAoiqdW7ffI3xqPoM9S+NNKnJjyHV9eMhwHQt4
         T7JA==
X-Gm-Message-State: AOAM53114aaTjML2JZMcKFIZdAy6UZ1FI7c0gC5QGmoSOrKB0xvR1jUT
        eNvKChq1ibmXyDa5yipv+1nkHw==
X-Google-Smtp-Source: ABdhPJyDX2d7BqdCwbUplmhK34PZyJU6RoJc8Rk9rsdget8jgjgJTGIQvxAhDoxRBpBdz98t177YbA==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr18762767wro.5.1606585753319;
        Sat, 28 Nov 2020 09:49:13 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id s133sm17991481wmf.38.2020.11.28.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 09:49:12 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: pwm-fan: Refactor pwm_fan_probe
Date:   Sat, 28 Nov 2020 17:49:08 +0000
Message-Id: <20201128174909.26687-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201128174909.26687-1-pbarker@konsulko.com>
References: <20201128174909.26687-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use platform_irq_count to determine the number of fan tachometer inputs
configured in the device tree. At this stage we support either 0 or 1
inputs.

Once we have this information we only need to read the
pulses-per-revolution value if a fan tachometer is actually configured
via an IRQ value.

Also add a debug print of the IRQ number and the pulses-per-revolution
value to aid in investigating issues.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pwm-fan.c | 50 +++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 1f63807c0399..efe2764f42d3 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -286,7 +286,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	struct device *hwmon;
 	int ret;
 	struct pwm_state state = { };
-	u32 ppr = 2;
+	int tach_count;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -300,10 +300,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	ctx->irq = platform_get_irq_optional(pdev, 0);
-	if (ctx->irq == -EPROBE_DEFER)
-		return ctx->irq;
-
 	ctx->reg_en = devm_regulator_get_optional(dev, "fan");
 	if (IS_ERR(ctx->reg_en)) {
 		if (PTR_ERR(ctx->reg_en) != -ENODEV)
@@ -339,20 +335,40 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	of_property_read_u32(dev->of_node, "pulses-per-revolution", &ppr);
-	ctx->pulses_per_revolution = ppr;
-	if (!ctx->pulses_per_revolution) {
-		dev_err(dev, "pulses-per-revolution can't be zero.\n");
-		return -EINVAL;
-	}
+	tach_count = platform_irq_count(pdev);
+	if (tach_count < 0)
+		return dev_err_probe(dev, tach_count,
+				     "Could not get number of fan tachometer inputs\n");
+
+	if (tach_count > 0) {
+		u32 ppr = 2;
+
+		ctx->irq = platform_get_irq(pdev, 0);
+		if (ctx->irq == -EPROBE_DEFER)
+			return ctx->irq;
+		if (ctx->irq > 0) {
+			ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
+					       pdev->name, ctx);
+			if (ret) {
+				dev_err(dev,
+					"Failed to request interrupt: %d\n",
+					ret);
+				return ret;
+			}
+		}
 
-	if (ctx->irq > 0) {
-		ret = devm_request_irq(dev, ctx->irq, pulse_handler, 0,
-				       pdev->name, ctx);
-		if (ret) {
-			dev_err(dev, "Failed to request interrupt: %d\n", ret);
-			return ret;
+		of_property_read_u32(dev->of_node,
+				     "pulses-per-revolution",
+				     &ppr);
+		ctx->pulses_per_revolution = ppr;
+		if (!ctx->pulses_per_revolution) {
+			dev_err(dev, "pulses-per-revolution can't be zero.\n");
+			return -EINVAL;
 		}
+
+		dev_dbg(dev, "tach: irq=%d, pulses_per_revolution=%d\n",
+			ctx->irq, ctx->pulses_per_revolution);
+
 		ctx->sample_start = ktime_get();
 		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 	}
-- 
2.26.2

