Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11797C63798
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 17:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A839E207BC
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 17:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="m6OX7Hhh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391690AbgKZRoR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Nov 2020 12:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391549AbgKZRoR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Nov 2020 12:44:17 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36BAC0617A7
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 09:44:15 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c198so2863093wmd.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWJXix7etR7ol53lyfN4QIUMtYkbtgEfChWSHg07ktY=;
        b=m6OX7HhhnZuMLWJiM/ifYQtMPErjuQKkWnDZlNlt/A5+OM3KjQv8I2SLTy6AjOmJ8g
         d6xtvGAfHH0taN5UHdFXjLQ6u0twOjUHmi6gEHpVBAbnMoYKwHo5Wsh23YjpGXB/zUBZ
         w09THXu9b2oViQfkX265tpprFDRrU3EVJVGvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWJXix7etR7ol53lyfN4QIUMtYkbtgEfChWSHg07ktY=;
        b=VGzVPzt2y8efLEPkmVtjRJca4dTyqFoSJuZmsLPxEGH6Ha9OYWLBRWWva5ntPw2m1P
         0bCFEiUaeAWZ+gEFmu1H0SWEcqUR8UHfslLM5B2xkEVU8xVF0T1qIHO+J1ShUlRmG0Zu
         fsisxIoWtM62rP1c26P1IZSXAwFbxFl2JZFZj41XVja8SnqJHghAhjrnwDDEiQanpGvq
         TnUIg4bfqKqFVNTWg9cWTQiN5/dqVMWgWA9o/GrnHUaK0Yl+xNE4R/yrgTXZkgTbmzuP
         5VBQfV3hxm5YCUcuyaEnqK/DYIm0b2WpbzhVJWovJOCNU5cRuxTgkLGdc6GxMM8ZwkiO
         dQUg==
X-Gm-Message-State: AOAM530O6a4iJhI2uCo5J7zfQ2tjoNsAOim1LBLoQ4AZ6wQI5cjaww+a
        GTx+CYloqKkuuuZSrPcaKR3Z1Q==
X-Google-Smtp-Source: ABdhPJyzWm3GTDDhfhpr27vsDX1LrQv/eioQcE1MdPYb4z6cjzXW7GgsVp1QrU7ayaucYktkBJ8DiA==
X-Received: by 2002:a05:600c:280e:: with SMTP id m14mr4421604wmb.167.1606412654510;
        Thu, 26 Nov 2020 09:44:14 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id h98sm11578582wrh.69.2020.11.26.09.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:44:14 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] hwmon: pwm-fan: Refactor pwm_fan_probe
Date:   Thu, 26 Nov 2020 17:44:07 +0000
Message-Id: <20201126174408.755-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126174408.755-1-pbarker@konsulko.com>
References: <20201126174408.755-1-pbarker@konsulko.com>
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

