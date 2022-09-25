Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D31C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiIYRaX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbiIYRaW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:30:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506ED25C74
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:30:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F8C9614F3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D61C433D7;
        Sun, 25 Sep 2022 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664127020;
        bh=cGtLAp3FXPmI68SsrzNVUnFbX/pPpXH4K4sebNDScnw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GTZR8NSVYqqFStip60MpDZvq9fmgYb8QCPk8jJU1ndf9aX8pV8IRu5o3mxkUQv74m
         OmUO2be/IVyfh8gT+7kOq6/SEhU2ZM4yszJhk4mK1NeV8DR8jVi5rk5DKwrQZGCrCk
         XgKc6YWlEKFW2dUfLCZFMnbIq0cmDyU1w51hB39J9YLFes1kBXYGClHxj5hbG868LR
         /7M+9+19CQ4RlddpaIKqpALR6nej7fZ25Mgka8eC0KKUApmPMZkY1nLZXoOtYhgseD
         wDI3iE+CP/e82KdJuJ2G3yHe8lVGHN7/gefN40E24DKBeUSLP+VEU8uQH/8avNBl+s
         xdcRQy3a6zf6Q==
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Roland Stigge <stigge@antcom.de>,
        =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= 
        <dirty.ice.hu@gmail.com>, Ninad Malwade <nmalwade@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 13/18] hwmon: (pwm-fan) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun, 25 Sep 2022 18:27:54 +0100
Message-Id: <20220925172759.3573439-14-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220925172759.3573439-1-jic23@kernel.org>
References: <20220925172759.3573439-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

These newer PM macros allow the compiler to see what code it can remove
if !CONFIG_PM_SLEEP. This allows the removal of #ifdef guards whilst
achieving the same result.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/hwmon/pwm-fan.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 498128eb81f1..dc3d9a22d917 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -639,7 +639,6 @@ static void pwm_fan_shutdown(struct platform_device *pdev)
 	pwm_fan_cleanup(ctx);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pwm_fan_suspend(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
@@ -653,9 +652,8 @@ static int pwm_fan_resume(struct device *dev)
 
 	return set_pwm(ctx, ctx->pwm_value);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pwm_fan_pm, pwm_fan_suspend, pwm_fan_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pwm_fan_pm, pwm_fan_suspend, pwm_fan_resume);
 
 static const struct of_device_id of_pwm_fan_match[] = {
 	{ .compatible = "pwm-fan", },
@@ -668,7 +666,7 @@ static struct platform_driver pwm_fan_driver = {
 	.shutdown	= pwm_fan_shutdown,
 	.driver	= {
 		.name		= "pwm-fan",
-		.pm		= &pwm_fan_pm,
+		.pm		= pm_sleep_ptr(&pwm_fan_pm),
 		.of_match_table	= of_pwm_fan_match,
 	},
 };
-- 
2.37.2

