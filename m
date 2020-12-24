Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F9BC433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Dec 2020 01:16:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 437E122517
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Dec 2020 01:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgLXBQx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Dec 2020 20:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbgLXBQw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Dec 2020 20:16:52 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485E3C061794
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 17:16:12 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h22so1585535lfu.2
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 17:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czptFay4sxNBxdeX/6m7zLzHRzM7f7t5O5r/8rNb9WY=;
        b=MOitgnklA9nPkbQDPPZWhF3Newd29xfvrKfIyeL3ceJwWHM9u9R4qREux9s6XUHTNo
         HWIRA5ttZjedSn4AAGtKxhcrpyat9BTyo0iz/lGnygYM3O/qabPBcFB5LgYzU5QaCyQh
         GvBMUuAqc5ulkso4GDL1bfSEUjnMrfSS4uPfLEPWGaszn8QE2CNqvZ6HiY3f/RYCeVXt
         ATWe4fCB7vSZdCncGFZpbQOL+CeFjwJXhAB8aJMd+PEgzNQ8uc2ZTF+0kZOcycOc0m0e
         01yGm2wxfWgtCrf1v2ko2TdGG8adJBD+kChssaXP7pybT/9lNVVhat1iifUVFm/dyM9i
         HlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czptFay4sxNBxdeX/6m7zLzHRzM7f7t5O5r/8rNb9WY=;
        b=ug9/0DiURiR8R2CDLRNSiELoobl72Uv0ZKVGiHZHhUz7aR352Nwc+0qBsR5+LMe/+X
         EmYwFV9Qe7P+723jEZhKu4AzlyEoa96GQ7wxOyr1jf4U+iIvjhe1QHHtifZlTZY4TFVI
         y/P3dg157BArRJ0JPNZHAol0DZ+dfKb0aMA7cWh8ZiziZy/iyN+lokSL1ln2DutjgqLr
         7oCafh2sLscILqXZ8F/DwxgtzduzYdxuO2LkOULnrNW4/0rha/yTx2wCnaxpTa3C1FSs
         0tGJ+gbMR9FifLA1p8C6TPjd0mRBQKE9iBoRj1kAOkC+EZvW8ZfIUEbwSCr+p7W6bL5k
         b5EA==
X-Gm-Message-State: AOAM533dNOKQo/nE5eH6z6xNBSR0j3BAGbv6H244zM59sgTFGkSDfBOs
        41nMfdzsnGXpV9H+Aer4wDb6rg==
X-Google-Smtp-Source: ABdhPJyXNecBYFgx3Lc+NnQfjxozy15FNnezF3UuBFNN3Yscr2dukVi6HX35a7/f/F8czxE2M+K9nQ==
X-Received: by 2002:a05:651c:1027:: with SMTP id w7mr12338558ljm.297.1608772570839;
        Wed, 23 Dec 2020 17:16:10 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id v7sm3416210lfg.9.2020.12.23.17.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 17:16:10 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org
Subject: [PATCH v2] hwmon: (ntc_thermistor): try reading processed
Date:   Thu, 24 Dec 2020 02:16:07 +0100
Message-Id: <20201224011607.1059534-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Before trying the custom method of reading the sensor
as raw and then converting, just use
iio_read_channel_processed() which first tries to
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
Cc: Jonathan Cameron <jic23@cam.ac.uk>
Cc: linux-iio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix the patch to multiply the processed value by
  1000 to get to microvolts from millivolts.
- Fix up the confusion in the commit message.
- Drop pointless comments about the code, we keep the
  original code path around if processed reads don't
  work, nothing bad with that.
---
 drivers/hwmon/ntc_thermistor.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 3aad62a0e661..c1c02cc454fc 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -326,18 +326,33 @@ struct ntc_data {
 static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
 {
 	struct iio_channel *channel = pdata->chan;
-	int raw, uv, ret;
+	int uv, ret;
 
-	ret = iio_read_channel_raw(channel, &raw);
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
+	} else {
+		/*
+		 * The processed channel is in millivolts, so scale this
+		 * to microvolts.
+		 */
+		uv *= 1000;
 	}
 
 	return uv;
-- 
2.29.2

