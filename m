Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3413C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 00:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241158AbhLFAFc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 19:05:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhLFAFb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:05:31 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2BFC061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:02:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k37so21115739lfv.3
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iwh1a9nJSEL2Y6XpXGdfJZLbmIt/5VxoaNngz+jDeB0=;
        b=tPsnxpfoOvsvIjN4IkxvZ56BUhCZD1CFWboeQgOECXgGnmFuiB+5GsJY7Qa4ksw2MC
         /TjpNv/ahcAY7kpCgvPBUrSZHm0g7QEbORYYCpaLZxdONhzuVlG7i4btQPSjq9nX/Bc3
         RbvrdWymwIXKHRVPALAoHcfkg7qldjrAB6+t7ldA+YMJKQU2I7wBgqocPNSkk4cnLld0
         Vi4m2zKK72XgQFhvvSH/QrivlaYrL036x9oFUSiisxWkCEWp4LhFxuUwbK0sfrulx/wB
         DEzmWlc+7fsWadsw2Ez27+RlYTQUwPvRwKtCgQlEa6lm/Vk9DJ0H0ISdeKU/uruVFJDb
         P+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iwh1a9nJSEL2Y6XpXGdfJZLbmIt/5VxoaNngz+jDeB0=;
        b=Y7mS41P64rftel2/4Fcxs34kESMoU0OxkOOfXqtDY5McJwOs/97JmheLFnQAa7NqDI
         N23GUfQQ0daf1YXT9LlWAysuknh6F9Lcl2aiSLyiSqsgaUyrOzDEfLll+pUN3LogqZjA
         liHfgB76xtAKtCOjY+771SGtdPgV5oMHLH/wcePgrz/FLVvNaa9XonAjT0FGfb9pvpNa
         ZFkLxYwLDvOSAxanBoSElLJvv9eZ6S3hNB/xwl31nXMz466FC507hrzY1Q0WkRoY1PxT
         deUrgivwXCwDmh6+6mRsYV4gB8i6prspV/AUdxHCjD5bqNtERxlhCy5cmQtNlCBvK0W/
         z89g==
X-Gm-Message-State: AOAM530tV3SyNJm/IszDDU67RbxV1FcBckhaGDAEmCvd+Ax+V+srZ+vA
        qZzWOv/mlY/ivTYCXJDtLnsjcw==
X-Google-Smtp-Source: ABdhPJwJWlAuhHd5u7tJ+Z1dOcssQKU+6jljdU1cR4DnUQfH1TE82TuE2z40YTORk2yUs/Is7E43/w==
X-Received: by 2002:ac2:5499:: with SMTP id t25mr32098421lfk.674.1638748921859;
        Sun, 05 Dec 2021 16:02:01 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m27sm1189021lfp.268.2021.12.05.16.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 16:02:00 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 3/3] hwmon: (ntc_thermistor): Move DT matches to the driver block
Date:   Mon,  6 Dec 2021 00:59:48 +0100
Message-Id: <20211205235948.4167075-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211205235948.4167075-1-linus.walleij@linaro.org>
References: <20211205235948.4167075-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This moves the device tree match data toward the end of the
driver which is the convention, here we can also add ACPI
and similar match data in a conforming manner.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 70 +++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 246e109db462..a3588ec12ca5 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -368,41 +368,6 @@ static int ntc_adc_iio_read(struct ntc_data *data)
 	return uv;
 }
 
-static const struct of_device_id ntc_match[] = {
-	{ .compatible = "epcos,b57330v2103",
-		.data = &ntc_thermistor_id[NTC_B57330V2103]},
-	{ .compatible = "epcos,b57891s0103",
-		.data = &ntc_thermistor_id[NTC_B57891S0103] },
-	{ .compatible = "murata,ncp03wb473",
-		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
-	{ .compatible = "murata,ncp03wf104",
-		.data = &ntc_thermistor_id[NTC_NCP03WF104] },
-	{ .compatible = "murata,ncp15wb473",
-		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
-	{ .compatible = "murata,ncp15wl333",
-		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
-	{ .compatible = "murata,ncp15xh103",
-		.data = &ntc_thermistor_id[NTC_NCP15XH103] },
-	{ .compatible = "murata,ncp18wb473",
-		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
-	{ .compatible = "murata,ncp21wb473",
-		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
-
-	/* Usage of vendor name "ntc" is deprecated */
-	{ .compatible = "ntc,ncp03wb473",
-		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
-	{ .compatible = "ntc,ncp15wb473",
-		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
-	{ .compatible = "ntc,ncp15wl333",
-		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
-	{ .compatible = "ntc,ncp18wb473",
-		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
-	{ .compatible = "ntc,ncp21wb473",
-		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, ntc_match);
-
 static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
 {
 	if (divisor == 0 && dividend == 0)
@@ -671,6 +636,41 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ntc_match[] = {
+	{ .compatible = "epcos,b57330v2103",
+		.data = &ntc_thermistor_id[NTC_B57330V2103]},
+	{ .compatible = "epcos,b57891s0103",
+		.data = &ntc_thermistor_id[NTC_B57891S0103] },
+	{ .compatible = "murata,ncp03wb473",
+		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
+	{ .compatible = "murata,ncp03wf104",
+		.data = &ntc_thermistor_id[NTC_NCP03WF104] },
+	{ .compatible = "murata,ncp15wb473",
+		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
+	{ .compatible = "murata,ncp15wl333",
+		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
+	{ .compatible = "murata,ncp15xh103",
+		.data = &ntc_thermistor_id[NTC_NCP15XH103] },
+	{ .compatible = "murata,ncp18wb473",
+		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
+	{ .compatible = "murata,ncp21wb473",
+		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
+
+	/* Usage of vendor name "ntc" is deprecated */
+	{ .compatible = "ntc,ncp03wb473",
+		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
+	{ .compatible = "ntc,ncp15wb473",
+		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
+	{ .compatible = "ntc,ncp15wl333",
+		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
+	{ .compatible = "ntc,ncp18wb473",
+		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
+	{ .compatible = "ntc,ncp21wb473",
+		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ntc_match);
+
 static struct platform_driver ntc_thermistor_driver = {
 	.driver = {
 		.name = "ntc-thermistor",
-- 
2.31.1

