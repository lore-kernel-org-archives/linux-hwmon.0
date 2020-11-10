Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7BEC388F7
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 11:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F2720795
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Nov 2020 11:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="bVrBNHXc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731898AbgKJL3A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Nov 2020 06:29:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731588AbgKJL2x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Nov 2020 06:28:53 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A43C0613D1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 03:28:53 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c9so2638108wml.5
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2020 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wv/1zH8BOwsn27fpscx7RB25TZ1M2ckWvcMUa7jbq8o=;
        b=bVrBNHXcNahdAyE52ABHm5PIKmLvHaWenQB57SQGXSncHHEqrl+C3sBijT+8Cr62Qk
         f4Xn+2F2qaBrroaIp5qlW+Fij+HUKjE8tew6Jy789OqU2O3aYeYFfzNmgB7Atz+5LWN1
         JYvPIeAvlkqWA4NaxUAYvsDsM91tEazIzr7Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wv/1zH8BOwsn27fpscx7RB25TZ1M2ckWvcMUa7jbq8o=;
        b=J7WKjFzvoRal7rnIXhXZmS1qNSBpq8pcPMHGrJ6YIOR9EC2uc6Qx7/kVvIpI8JRDK+
         jJpFfvcCnaS3BdZC5k9YJL2vd/vVbZIRu9TELMvM0TiV41xmg3mpSzd+3NNE++Vy6sNu
         IJgji9ooYI8xsNt1dnlZj1xextrd+IKYwQCNJG7tmpH3c4CLBqvGaBJ0kCgYygSvWLak
         6rXT4u1YLCGqIpIHuYUW/7roxxEu4LVQ3RBK/dfNMZhCbmroi+p0Ilzql6lkVKBWfK+p
         RKQsnXMGZUm0ztPx1MkOjjIaoSPxECDlX9BsCOkeM7mS5K96J6koK4JmsEVVgD2jPV9a
         Xgnw==
X-Gm-Message-State: AOAM532s0x9jQP8qgtRQ96yUJ+Kw1YScqVI9r85/5+OdbX87UH41eV9z
        UV+/rgZDSfwm4jk0GYh//suqIA==
X-Google-Smtp-Source: ABdhPJxKB7LIH+le7NrP+fw23qS/o+NhxWkYddkoKmIGDPt2SP9TZO6ciyto8VVC5Pl+ZPjg0WkT0A==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr3998539wml.143.1605007731712;
        Tue, 10 Nov 2020 03:28:51 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id c64sm2575608wmd.41.2020.11.10.03.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 03:28:51 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: pwm-fan: Store device pointer in pwm_fan_ctx
Date:   Tue, 10 Nov 2020 11:28:16 +0000
Message-Id: <20201110112817.52549-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110112817.52549-1-pbarker@konsulko.com>
References: <20201110112817.52549-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This allows us to use dev_err() and friends from functions which only
have a pwm_fan_ctx pointer.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 drivers/hwmon/pwm-fan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..edc0453be25a 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -26,6 +26,7 @@ struct pwm_fan_ctx {
 	struct mutex lock;
 	struct pwm_device *pwm;
 	struct regulator *reg_en;
+	struct device *dev;
 
 	int irq;
 	atomic_t pulses;
@@ -290,6 +291,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->dev = dev;
 	mutex_init(&ctx->lock);
 
 	ctx->pwm = devm_of_pwm_get(dev, dev->of_node, NULL);
-- 
2.29.2

