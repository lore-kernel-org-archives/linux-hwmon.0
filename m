Return-Path: <SRS0=7+HN=2M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1965DC2D0C0
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E48E520665
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxhiRDaJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfLVOK4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:56 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45445 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfLVOK4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Dec 2019 09:10:56 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so7837598pfg.12;
        Sun, 22 Dec 2019 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y2NgiqlWrB0g1nYThxREdvdN0lYU2uUNLMalSkDDff8=;
        b=fxhiRDaJnFZagib3CeNKGtfPJXOjuu8y7mIxT8xt2DaPo6QZX13U144wA2Ot02mzta
         mjv+29sTjUQf3vVS4St6SXHNZh+RoQwL8GZlG9n3CuHeHhY2MJlvxH29wN9npcXgBScl
         A/i8RXBYpJ46iLd8xT/NnLhtzhvA2sD2LL8ShHWlSNthfAAGoB+Pwen4GRoUsNpGJAZ3
         NYS/9O52cE7QHiY/yg/RfIlpuJQULU12OrwuEW9VqKq5dRrdsSMqm4Op8UBcZXRDXZq5
         h4KbWg5p+fGlbX5wyUWo1QvUQKF8DI6rUA+Hpw69V4xVqzjfgYn4p0l3edkJOUaWxF35
         xZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y2NgiqlWrB0g1nYThxREdvdN0lYU2uUNLMalSkDDff8=;
        b=osGm1RjeoiS9DNg7ApdQcgKgFtaX6485Xyr2VtUTSZKsXdSvxC+D/c617LxZO4p3IJ
         +VNEztyjOkQj/DBjuiP3snOG+RWXp3ByVWnT09b8s8Q0+cSf0tAmlQlLpfeACP976TU7
         enT9v4osM0pWupK86JIbHdvLf9yqJKnEchuXjd/HBtSiPIotsjnd7MxR9dWT4iyzjzz/
         8o1Y8t/4aQ7Zip5yI6Ud7avO93vd9no98vuYIGVXLcL43CSkFO+1c+P02mxdijJyjuBp
         jZjbX21Gtbdk1UDnhl8Iwnu8mBeGNftG71xTzh0BQSUSjPVBEY7VEKo57sMNNUMXtpJu
         ESxw==
X-Gm-Message-State: APjAAAWGocCcrvZMiFYGiZzsjLzZvKsC54ipiO2cW4ZO5OpAqB/CHIwP
        t7oiGuety6DNiTI8FyhCJQomRb8P9Us=
X-Google-Smtp-Source: APXvYqz19xRqv00GKGiTWaxyYCkFcRGVDz67nDMNvrCZxMzhuk+LP0W777jysfBEOiMp76TRkFPSGQ==
X-Received: by 2002:a65:66da:: with SMTP id c26mr26319588pgw.354.1577023855335;
        Sun, 22 Dec 2019 06:10:55 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id x33sm18320073pga.86.2019.12.22.06.10.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 22 Dec 2019 06:10:54 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (pwm-fan) add option to stop fan on shutdown
Date:   Sun, 22 Dec 2019 23:10:22 +0900
Message-Id: <1577023823-9615-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
References: <1577023823-9615-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pwm-fan driver leaves the fun running when shutting down the system.
(On the other hand the gpio-fan driver stops it.)

This adds an optional property "disable-state-shutdown" in case someone
wants to stop the fun running when shutting down the system.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Kamil Debski <kamil@wypas.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/hwmon/pwm-fan.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 42ffd2e..8775d37 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -33,6 +33,7 @@ struct pwm_fan_ctx {
 	u8 pulses_per_revolution;
 	ktime_t sample_start;
 	struct timer_list rpm_timer;
+	bool disable_state_shutdown;
 
 	unsigned int pwm_value;
 	unsigned int pwm_fan_state;
@@ -292,6 +293,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	mutex_init(&ctx->lock);
 
+	ctx->disable_state_shutdown =
+		of_property_read_bool(dev->of_node, "disable-state-shutdown");
+
 	ctx->pwm = devm_of_pwm_get(dev, dev->of_node, NULL);
 	if (IS_ERR(ctx->pwm)) {
 		ret = PTR_ERR(ctx->pwm);
@@ -390,8 +394,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int pwm_fan_suspend(struct device *dev)
+static int pwm_fan_disable(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 	struct pwm_args args;
@@ -418,6 +421,22 @@ static int pwm_fan_suspend(struct device *dev)
 	return 0;
 }
 
+static void pwm_fan_shutdown(struct platform_device *pdev)
+{
+	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
+
+	if (!ctx->disable_state_shutdown)
+		return;
+
+	pwm_fan_disable(&pdev->dev);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int pwm_fan_suspend(struct device *dev)
+{
+	return pwm_fan_disable(dev);
+}
+
 static int pwm_fan_resume(struct device *dev)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
@@ -455,6 +474,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_fan_match);
 
 static struct platform_driver pwm_fan_driver = {
 	.probe		= pwm_fan_probe,
+	.shutdown	= pwm_fan_shutdown,
 	.driver	= {
 		.name		= "pwm-fan",
 		.pm		= &pwm_fan_pm,
-- 
2.7.4

