Return-Path: <SRS0=Ii2j=IG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7A6C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Mar 2021 10:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 367A764DFB
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Mar 2021 10:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhCHKDH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Mar 2021 05:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbhCHKCc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Mar 2021 05:02:32 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4A1C06175F
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Mar 2021 02:02:31 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id m11so15276018lji.10
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Mar 2021 02:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQj8Y7bl6W/EwTgFM51ZkEcyxtVI5DMBeB3fwIzUQaU=;
        b=jQ2Yb87wSov9EOAYKKig7gkL5mtFZrgT7jtwVDLmVEVjG7niFZCnS6r9rsFf5VDt84
         UGxEn2W8prRS96gwOj3n3E/nToKAZP4ByR64Hs7y0vvEkz0DhEir+6OijwZmrDu4kEYU
         NSsYBpHPMRU4LOkzqcNgfArlMDbUgyUP5wK8MmbLp5vGEWBUDFGLt1GSXOLeCvtb1TgS
         IqGWpDBhXtnFA0a5BgamnottiCcf9wYflitmY2G4GR0gi48TEasJk/hxLMp2Kgq6N1DW
         qJZflz/jcVjKtWyOgEWdmHnsvDnQT+OacUf039gRCyCdBDPENr9+oOmBLnQHpksnsLeb
         Sz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQj8Y7bl6W/EwTgFM51ZkEcyxtVI5DMBeB3fwIzUQaU=;
        b=FChXRptVtyIBXWAqd5lU5kdVBWRzEHAQoXPmrYA1Asm97Qo2R2cg1y9K8POCFt8mTE
         NEDV9xMiN8jGXiyQITUgraAESUutVLYN676hex39k8ZOGp+9KEMHnV5C4RvsfxNOhtsn
         SfggAGsFwJCIGJFW/H/ZS1wfgeJXVEq51Nx493KEARKMSDwQ0rE6tH1ScvVcUAtXFFmL
         0aOqIaIinP7MMOTJpC1ZG3fWpbjmhn+CvVMjLnJCGrjXNRWOe8k/gI/IwNLygbRdNXcd
         xjKAf16w+KqyF5+V0ewcCyQJf+9DfQNEQ1SU/Lb/WeHzw/1LRt6E2pzScUx+rNUot7n6
         Tnvg==
X-Gm-Message-State: AOAM5333pdoXo9gIZpZNtd7Vug+cdXizNEPqMhz5Zz05u6xMBOBBgWsx
        QHgZ78ORBjFO2hK1aZvBejBJNw==
X-Google-Smtp-Source: ABdhPJyrKjGR1WckL+EvevOldG/9RWm4Yin/HfubNd7pR+J+ntlEZo0nv3ly+Y9EjuIMR/uzyFFheQ==
X-Received: by 2002:a2e:9e17:: with SMTP id e23mr13441080ljk.501.1615197750378;
        Mon, 08 Mar 2021 02:02:30 -0800 (PST)
Received: from localhost.localdomain (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
        by smtp.gmail.com with ESMTPSA id v2sm1425734ljg.89.2021.03.08.02.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:02:30 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        linux-iio@vger.kernel.org
Subject: [PATCH 2/2 v4] hwmon: (ntc_thermistor): try reading processed
Date:   Mon,  8 Mar 2021 11:02:19 +0100
Message-Id: <20210308100219.2732156-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308100219.2732156-1-linus.walleij@linaro.org>
References: <20210308100219.2732156-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Before trying the custom method of reading the sensor
as raw and then converting, we want to use
iio_read_channel_processed_scale() which first tries to
see if the ADC can provide a processed value directly,
else reads raw and applies scaling inside of IIO
using the scale attributes of the ADC. We need to
multiply the scaled value with 1000 to get to
microvolts from millivolts which is what processed
IIO channels returns.

Keep the code that assumes 12bit ADC around as a
fallback.

This gives correct readings on the AB8500 thermistor
inputs used in the Ux500 HREFP520 platform for reading
battery and board temperature.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org
Link: https://lore.kernel.org/linux-iio/20201224011607.1059534-1-linus.walleij@linaro.org/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Split out the new iio_read_channel_processed_scale()
  API addition to a separate patch.
- My suggestion is to apply both patches to the hwmon
  tree.
ChangeLog v2->v3:
- After discussion about v2 we concludes that
  iio_read_channel_processed() could loose precision
  so we introduce a new API to read processed and
  scale.
- Include a link to the v2 discussion for reference.
- For ease of applying to the hwmon tree, keep it all
  in one patch.
- This needs Jonathans ACK to be merged through hwmon.
ChangeLog v1->v2:
- Fix the patch to multiply the processed value by
  1000 to get to microvolts from millivolts.
- Fix up the confusion in the commit message.
- Drop pointless comments about the code, we keep the
  original code path around if processed reads don't
  work, nothing bad with that.
---
 drivers/hwmon/ntc_thermistor.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 3aad62a0e661..8587189c7f15 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -326,18 +326,27 @@ struct ntc_data {
 static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
 {
 	struct iio_channel *channel = pdata->chan;
-	int raw, uv, ret;
+	int uv, ret;
 
-	ret = iio_read_channel_raw(channel, &raw);
+	ret = iio_read_channel_processed_scale(channel, &uv, 1000);
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
+		 * This fallback uses a raw read and then
+		 * assumes the ADC is 12 bits, scaling with
+		 * a factor 1000 to get to microvolts.
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

