Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD7BC4361B
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 22:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC07723426
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Dec 2020 22:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgLSWmd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Dec 2020 17:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgLSWmc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Dec 2020 17:42:32 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8284BC0617B0
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 14:41:50 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id a12so14783887lfl.6
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Dec 2020 14:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82OS3pLNd8iUHESUMUxIhbTgIU37vSfj8yHnrTeu96Y=;
        b=TrSct3igLxzJi4/z97dqaidZkhkr01QcRXtp42P0HWxxErrIcM5M/1moUcA25uBMkf
         mNrdJVLAXqj09giY+T1ZqJwAIgjYCoDdPbDTKBT+4En2C9T3FbUMFEtF+9mTaMNwvxis
         NKO6Ff9CdJ2S54zCfljdp/ZcA5rMJaTMqwWBqmY7MzcBO6f3268Y8BN0b4KvOqnNYN1n
         j+eskQ8IFO79uiQ+xQqoezbn9PBNj3WA1cZU3kHwQp9OvRtgMXDDiDEdzGdeObQMMkD8
         GZ/hVFflAS+6iMYqXEohsluX5AWwUloKEbcol2w2fuJGSGInIrsUT126xjVzfuczoM6g
         WXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82OS3pLNd8iUHESUMUxIhbTgIU37vSfj8yHnrTeu96Y=;
        b=tPF/7umeZG7ZF62t/8D8ozf64lvq/KCkJ3qQS7d0Sb7TaKJ9LFNFOV6JfEivV+wy38
         x923P2CqyrE5n5ilre6NI+oJx0iChELHAmoN9Kc9MjmpPmKse52v1GsrNsEa8WcnzH1W
         pPhQjYQk5gkZo7vyck2ZgL2oaDWstvubRU95eRlCRmFFGzardMiPGb7rPbTLOBT0COhd
         ShejuBTAcQWRqI8vxpTiryv4O5UQZPf7dH1vlhyPFaObeNKMZEjPA5yfyQVgo1uEhZqA
         XU32Hqx+aUJsoGKe/kC7HDr9QVhNEBZgaB8djBGR9wWEDOaiRL96IPA7nggywLYP+sIE
         NxtQ==
X-Gm-Message-State: AOAM532Z/Q2cpOkVbW1iCeYLFg0yG5RtmIYlplOPxMcvpElUUY40IVdl
        3ORSfto/SepjhU3EDqMD1VloyA==
X-Google-Smtp-Source: ABdhPJyb4/OE6CfJu11wNoQYGVhclGqX8lAfSXe4t+nUc4gruT1BjchaAm8LF4hX0+js6jjOqSTVkw==
X-Received: by 2002:a2e:8045:: with SMTP id p5mr4553381ljg.289.1608417708792;
        Sat, 19 Dec 2020 14:41:48 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 195sm1368982lfk.109.2020.12.19.14.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 14:41:48 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org
Subject: [PATCH] hwmon: (ntc_thermistor): try reading processed
Date:   Sat, 19 Dec 2020 23:41:43 +0100
Message-Id: <20201219224143.686074-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Before trying the custom method of reading the sensor
as raw and then converting assuming 1000 scaling, just
use iio_read_channel_processed() which first tries to
see if the ADC can provide a processed value directly,
else reads raw and applies scaling inside of IIO
using the scale attributes of the ADC.

The code that hardcodes scaling to 1000 and assumes
a 12bit ADC is very dubious. I keep it around here
but I have a strong urge to just delete it.

This gives correct readings on the AB8500 thermistor
inputs used in the Ux500 HREFP520 platform for reading
battery and board temperature.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>
Cc: linux-iio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 3aad62a0e661..ac0d80faddf6 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -326,18 +326,29 @@ struct ntc_data {
 static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
 {
 	struct iio_channel *channel = pdata->chan;
-	int raw, uv, ret;
+	int uv, ret;
 
-	ret = iio_read_channel_raw(channel, &raw);
+	/* A processed voltage channel will return microvolts */
+	ret = iio_read_channel_processed(channel, &uv);
 	if (ret < 0) {
-		pr_err("read channel() error: %d\n", ret);
-		return ret;
-	}
+		int raw;
 
-	ret = iio_convert_raw_to_processed(channel, raw, &uv, 1000);
-	if (ret < 0) {
-		/* Assume 12 bit ADC with vref at pullup_uv */
-		uv = (pdata->pullup_uv * (s64)raw) >> 12;
+		/*
+		 * FIXME: This fallback to using a raw read and then right
+		 * out assume the ADC is 12 bits and hard-coding scale
+		 * to 1000 seems a bit dangerous. Should it simply be
+		 * deleted?
+		 */
+		ret = iio_read_channel_raw(channel, &raw);
+		if (ret < 0) {
+			pr_err("read channel() error: %d\n", ret);
+			return ret;
+		}
+		ret = iio_convert_raw_to_processed(channel, raw, &uv, 1000);
+		if (ret < 0) {
+			/* Assume 12 bit ADC with vref at pullup_uv */
+			uv = (pdata->pullup_uv * (s64)raw) >> 12;
+		}
 	}
 
 	return uv;
-- 
2.29.2

