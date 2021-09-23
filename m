Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB63C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 02:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4B0461090
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 02:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238899AbhIWCgd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Sep 2021 22:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238859AbhIWCgd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Sep 2021 22:36:33 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F948C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Sep 2021 19:35:02 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t20so3408881pju.5
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Sep 2021 19:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JysQTf2f7UTKyoMlI8yE3byPldMU73yOnyr+IFIYsn0=;
        b=jGy+4y/RCPpgOOulCPQ5Ug5VUeJK1EU2pPKqAQ8QEWl8hN9GxgBqv/o7YAriGGWp/U
         cOcb1sxBEGABcymF9sR2BPe/1PPl5HEU4Nlljoaz/wry5vpCGK0J5y+KH3IjbhA47uku
         hk+cZRtOKLx67/+L4Hk0eDXEgt0vSMfn5NGDv95BQSX0I80jv0lYBXHfMCzD+z5FLw4h
         INxHWLXPHMUWr4k9mJcEqZDJZPcon7pFtCo2hsaDMcl5gn4deNcPnLynGIa+1RF4Xoc4
         rAWJMr2TRlKcb/aoYRCDVPXysBD3X2V394etLQjEQV/WotXVecm8tOxvjMY1S0VBjmw9
         kbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JysQTf2f7UTKyoMlI8yE3byPldMU73yOnyr+IFIYsn0=;
        b=X0u87dEkbTqkuOwpadrmNWJ61SmvsAWb6t1pgSDj4haOvaS8riy3VnwE2pcqOe1TAu
         FxW7RNX80j8U+73AnEA+aTyump7OiHohZ6cJkJuUHpfwGWkTLBhwdlnqbws9VukGwXDb
         k5Y1ssTxdrkpV4r42qLF3ZYgFEypd1KUG3l+8lgCPe2OshzZ7M6viLFKZ82Px5s4lxKl
         en5PHRfq4UGwY1JyIxLKMuUvEFRpnyvDkEazWGvAppCfK/XGnnGA9vmr8dB4d/ZnQmKG
         gfRmLp6y6TjOJP88CksuTyQIDsyywsAw7CDRq+IJ1zXvy7a2E4cCG0qK/bD6Nuw7OGkm
         wNUw==
X-Gm-Message-State: AOAM533n6QtZlEkzZAhn8BzR2I8gvTydDukizbE23cMutZiXCNko/oPR
        DlhYKhvjMQhi2Mdd0VayJUsFxKrsNYEp3g==
X-Google-Smtp-Source: ABdhPJxOYY+7Q4/RDfFoqcFaxOp+E+SFmSU5tE0Fq4QozZFupgbdIWIMZBDoyq97nNwCC9eXEj9BzQ==
X-Received: by 2002:a17:902:8b86:b0:13d:d600:789f with SMTP id ay6-20020a1709028b8600b0013dd600789fmr2014476plb.73.1632364501424;
        Wed, 22 Sep 2021 19:35:01 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:2ece:a59:43d1:a357])
        by smtp.gmail.com with ESMTPSA id j123sm3856042pgc.77.2021.09.22.19.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 19:35:01 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
Date:   Thu, 23 Sep 2021 11:34:47 +0900
Message-Id: <20210923023448.4190-1-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds an optional property "retain-state-shutdown" as requested by
Billy Tsai.

Billy said:
 "Our platform is BMC that will use a PWM-FAN driver to control the fan
 on the managed host. In our case, we do not want to stop the fan when
 the BMC is reboot, which may cause the temperature of the managed host
 not to be lowered."

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/hwmon/pwm-fan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 17518b4cab1b..1ea0d0562c28 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -38,6 +38,7 @@ struct pwm_fan_ctx {
 	struct pwm_fan_tach *tachs;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
+	bool retain_state_shutdown;
 
 	unsigned int pwm_value;
 	unsigned int pwm_fan_state;
@@ -312,6 +313,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	mutex_init(&ctx->lock);
 
+	ctx->retain_state_shutdown =
+		of_property_read_bool(dev->of_node, "retain-state-shutdown");
+
 	ctx->pwm = devm_of_pwm_get(dev, dev->of_node, NULL);
 	if (IS_ERR(ctx->pwm))
 		return dev_err_probe(dev, PTR_ERR(ctx->pwm), "Could not get PWM\n");
@@ -492,7 +496,10 @@ static int pwm_fan_disable(struct device *dev)
 
 static void pwm_fan_shutdown(struct platform_device *pdev)
 {
-	pwm_fan_disable(&pdev->dev);
+	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
+
+	if (!ctx->retain_state_shutdown)
+		pwm_fan_disable(&pdev->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.25.1

