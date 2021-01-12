Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B638FC43332
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Jan 2021 13:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7145A23122
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Jan 2021 13:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbhALNL4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:11:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:54640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404378AbhALM6B (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jan 2021 07:58:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51E6B23123;
        Tue, 12 Jan 2021 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610456223;
        bh=huvx6FbaDlrGtA7rGasohIzVoKsnlmlhFZJKqOwooeI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m3o49wdcNwcTP/nowkO0/V058TY7Si266LOuAylz3j+sgfayIP4csQfOPG9uba4AN
         9kJK8NwhKpgNcOnazssIWvH2V8OJoC7ldGTt62q8OpFkGdSdE7q0TweuTpuYc0U1eJ
         v+EStlV8+g5ImgGjun8ViXtbPEfLfQrhQ21SzpscBN7cC+DRtWLfcAmi5kFJ3+OHSc
         3OkKiCykUAjvriD9+soDpVV6KDImjE60nUn3ut4G+xbq9Il+ToeQtGenV7eLqojS1v
         QQmTWuYCuFWVopSMoB8iaDjfOj+IgEYeoFCSdOrzWLZr08wBgItSshhPxRvOWRIyww
         tSU0DLhnaR4bg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 13/28] hwmon: (pwm-fan) Ensure that calculation doesn't discard big period values
Date:   Tue, 12 Jan 2021 07:56:29 -0500
Message-Id: <20210112125645.70739-13-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125645.70739-1-sashal@kernel.org>
References: <20210112125645.70739-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[ Upstream commit 1eda52334e6d13eb1a85f713ce06dd39342b5020 ]

With MAX_PWM being defined to 255 the code

	unsigned long period;
	...
	period = ctx->pwm->args.period;
	state.duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);

calculates a too small value for duty_cycle if the configured period is
big (either by discarding the 64 bit value ctx->pwm->args.period or by
overflowing the multiplication). As this results in a too slow fan and
so maybe an overheating machine better be safe than sorry and error out
in .probe.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Link: https://lore.kernel.org/r/20201215092031.152243-1-u.kleine-koenig@pengutronix.de
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/pwm-fan.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index c88ce77fe6763..df6f042fb605e 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -330,8 +330,18 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->pwm_value = MAX_PWM;
 
-	/* Set duty cycle to maximum allowed and enable PWM output */
 	pwm_init_state(ctx->pwm, &state);
+	/*
+	 * __set_pwm assumes that MAX_PWM * (period - 1) fits into an unsigned
+	 * long. Check this here to prevent the fan running at a too low
+	 * frequency.
+	 */
+	if (state.period > ULONG_MAX / MAX_PWM + 1) {
+		dev_err(dev, "Configured period too big\n");
+		return -EINVAL;
+	}
+
+	/* Set duty cycle to maximum allowed and enable PWM output */
 	state.duty_cycle = ctx->pwm->args.period - 1;
 	state.enabled = true;
 
-- 
2.27.0

