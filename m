Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F54C55ABD
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CA9122249
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 15:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="FCSaLYo3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgKMPJg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPJg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:36 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729E6C0613D1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:36 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 10so8420074wml.2
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 07:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SC6v/9U+HIlsnisZ5co4yMBSoBpm8f6NrRqUBASHBlM=;
        b=FCSaLYo3AnegtxIfnMkLC7divq/Lmt8U5Jpc+kWHyokEMXARdifg1u9BsBEvo2/2Qx
         w0QugCGQQdsBSC8igPLc6TjZDpWLodGL/4ogVqPvlkc7QGwcPr9PTX516xfKeQ6g5xur
         GA90uyWkiowZycaLG4+I8UJlzb+QVGIthVWyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SC6v/9U+HIlsnisZ5co4yMBSoBpm8f6NrRqUBASHBlM=;
        b=WvLOs6fYv17/9M0adHEUyUOgHgEmij2H/K8v5Nl5/VD9BM4cLNz/mOfg64B1DE0qwj
         ZKodF1MlduN+z0w39EMH3e0mk6dEm6Hd4mU3KMG9eEU3UnbS6cudaEP/h5//5clK/CJh
         WhybYZhNDWbdoHJRpdu4p3PSsFf5E9n7KPYlSVXRThxpfKdKMc5SPbiCei/R5SMJTiMl
         +P0gHia9wu1lCIBgVOF10x/LBZ7/2oFbvA9DobePTB8XXT7pL7VMoRgQeNG60+kHQDTF
         hwkxe2zwV1LR/xtBrh1Q1KMZsdFbfwX5BCJg1irjSxRLisher3+S+nWy1iOnRsflm+Ru
         tIrQ==
X-Gm-Message-State: AOAM530b0C15ufQjju2u2HynRTzrN9/6DMmj1WW7+pYcMIMyAnkSivQM
        qukYd9eC1+dUytqGqOJEH9RrvA==
X-Google-Smtp-Source: ABdhPJyeRhF0vcqqQVFDPNNIKMScBufW/HxBk9zFiQHUKMs0Woc/dmd4ExG3nIEtLx44kjfjlo8IrQ==
X-Received: by 2002:a1c:8150:: with SMTP id c77mr3174978wmd.26.1605280174287;
        Fri, 13 Nov 2020 07:09:34 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id v2sm11368221wrm.96.2020.11.13.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:09:33 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/4] hwmon: pwm-fan: Refactor pwm_fan_probe
Date:   Fri, 13 Nov 2020 15:08:50 +0000
Message-Id: <20201113150853.155495-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113150853.155495-1-pbarker@konsulko.com>
References: <20201113150853.155495-1-pbarker@konsulko.com>
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
2.29.2

