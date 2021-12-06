Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D895C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 02:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbhLFCKO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 21:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhLFCKO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 21:10:14 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093A4C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 18:06:46 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d11so18004849ljg.8
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 18:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rsoPIFIn5+zqSPXgDJdPPy2SoSRl7YHAN+dOpGg/k7k=;
        b=w93SchqSYaOYRhnaITLS8UP8CNLWnejns7J1egpWYmioY4txpTIBt5zxQGYnXyd3rf
         1C2itoF2HlmGXvXpAn6rjdLGfp1RKZCzW+PzyOIW3FTJqr901KX9Djamso7fO/uMrdel
         k8Up28i6VzNc5E2udQEOisVVyANpHAoKLLNdOv+Fbo5ID5p36HFB/GUiygORBD5wjvlv
         qYshlqsCR3/yQHDXiHmtnbHe2nqTpKeQluGHzmKqUaGd8NqD4ho1fJfwsIWvQLR2upZo
         Jvbz+q4p3z+iZOvmQHhsB92TBCZGe86HUT7a13Xtv7u79efsBp6dDUaiP9/ac3Jx9UuA
         e8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rsoPIFIn5+zqSPXgDJdPPy2SoSRl7YHAN+dOpGg/k7k=;
        b=4EhjF3fSanz1C7rvgnTmRn5pEum3L+PSUQmimGXzRXulNiurCY1nkESE0qcaCTSaiY
         c3dEHclLnHCH6Yrve91PD8hFiUSVgiIEM6HwK287QasJMfXgzfpxTP/lZfvBhRCOAVhF
         oeFxdJd+8Ao/ST/TBPdtZyPAH0W3Vzt2UBviu/I0Xf0dxi0uuVok/nh7E82FOPKZ6nqE
         cougUl5qSmo7cdfsce30Y5VBzV/lveFXLT/tViH/Xb45Hgo2JGLLWAHF5CJEjCuitWPN
         zEvMCT6UD794VUzrtYblS4t2W7L2hYsWUAKCg0MiBWwWANDqaZDq3OQM5Lv9LNXS8dIT
         70IQ==
X-Gm-Message-State: AOAM531xmKsXj1k7xQZ8OqitYwhnf16fwTSFmJTtcnXfysY7j7hnrrTN
        CXIZ60bP04Y3JpSSqsXHKmOMKQ==
X-Google-Smtp-Source: ABdhPJzh4aYTlX1uy1OqlvW3cS2U9Rt1udy9IIJCitP9fCW8BI7pwV3yatmesrO9SbnWo+e2fgSwKw==
X-Received: by 2002:a2e:86cb:: with SMTP id n11mr33700233ljj.425.1638756404305;
        Sun, 05 Dec 2021 18:06:44 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k8sm1215672lfv.179.2021.12.05.18.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 18:06:43 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 3/3 v2] hwmon: (ntc_thermistor): Move DT matches to the driver block
Date:   Mon,  6 Dec 2021 03:04:23 +0100
Message-Id: <20211206020423.62402-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206020423.62402-1-linus.walleij@linaro.org>
References: <20211206020423.62402-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Rebase, no other changes.
---
 drivers/hwmon/ntc_thermistor.c | 70 +++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 0c8b3dbcb38b..00356c28e8c8 100644
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
@@ -687,6 +652,41 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
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

