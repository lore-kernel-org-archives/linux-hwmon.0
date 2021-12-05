Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA4EC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 00:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbhLFAFW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 19:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhLFAFW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:05:22 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19486C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:01:54 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b1so20990655lfs.13
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+F3PJbLbQYGNAa8CDSqdzVHmcTZVX0tkllKEeXGns0=;
        b=Zy/kXk6Lb7J47/b6eV4YvUWjKVbCy//1er7eCwZgdnKoaK+x3+bIQNIY5nhI5l3iDU
         nPIQJazrZgiPNHS4dIDpSDtuRw2cQ5iYkj5BG7a5rr08UlC3EjeCE01+Jrakggu7S3jB
         SGwJcU8RBtxvajlxF8DDuRGoMCTKDNr/ju2mT93epFJd/uaq6ebaXU62Ogb/H/Ye8UYw
         ve8DH7yg/cs2z/obz0smke1QsjDvTI3petH0r+MNv6QwDwzLzI72CPykuldNJTxKTWa7
         4/NUdp64FBUYiURC2Diz8OAbI+rXHbI9G7ceVVN+TuKRXgKwQp0/YoSf7iK97rPLRYiB
         1q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+F3PJbLbQYGNAa8CDSqdzVHmcTZVX0tkllKEeXGns0=;
        b=r8PYoG4WJDFN0V3ryqOItofGS3Tj6M4NonyQcOq7P1SLceZfTQDRjNB0NOQmd4TBBQ
         ZkqT9OCJxxi6f88qWt6J+wsAHn4CpzCdPfjHaHR4HE/OWeb7DPLftq7Xl28ynyi7FVs5
         2VOM06q2m9t0cgwBHXeToSkoMtsB2neQrb7bm+HmUBrZm1jA025b0m1DGrjBBs5f1VOg
         sUlAjCBPWV1AFNbC2hyj/gLaXpQzhMP8/sxEQraQg43dfE57eG4h2T6xOwcIB5jM+sWn
         GwlKsWpA9TRPrge5I8P3X7NDJR/kRVpNdDSoCPbm9yVwrAGUJzm8oATdjdRDZqxgdccK
         aUtw==
X-Gm-Message-State: AOAM5321eW96R/0znyLbZcc576DprnjOmaQSFXHmyWcWgsW2fnCkYmhw
        DdR8BTbwHBFeaONyFxYvwTInOO2e80w2hA==
X-Google-Smtp-Source: ABdhPJxpyelwEek6KnJlzpzhUuref/j+nUHQaDN3T5a0XVmee7NE/RFowksbsm4n83SSNmxzsu2hqA==
X-Received: by 2002:a05:6512:2249:: with SMTP id i9mr32813866lfu.62.1638748911747;
        Sun, 05 Dec 2021 16:01:51 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m27sm1189021lfp.268.2021.12.05.16.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 16:01:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 1/3] hwmon: (ntc_thermistor): Inline OF data lookup in probe()
Date:   Mon,  6 Dec 2021 00:59:46 +0100
Message-Id: <20211205235948.4167075-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is no need to allocate the state container and look
up DT properties in a separate function if OF is all we
support. Inline it into probe().

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 76 ++++++++++++----------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index ed638ebd0923..44abcb8a2393 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -403,49 +403,6 @@ static const struct of_device_id ntc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ntc_match);
 
-static struct ntc_data *ntc_thermistor_parse_dt(struct device *dev)
-{
-	struct ntc_data *data;
-	struct iio_channel *chan;
-	enum iio_chan_type type;
-	struct device_node *np = dev->of_node;
-	int ret;
-
-	if (!np)
-		return NULL;
-
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return ERR_PTR(-ENOMEM);
-
-	chan = devm_iio_channel_get(dev, NULL);
-	if (IS_ERR(chan))
-		return ERR_CAST(chan);
-
-	ret = iio_get_channel_type(chan, &type);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	if (type != IIO_VOLTAGE)
-		return ERR_PTR(-EINVAL);
-
-	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
-		return ERR_PTR(-ENODEV);
-	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
-		return ERR_PTR(-ENODEV);
-	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
-		return ERR_PTR(-ENODEV);
-
-	if (of_find_property(np, "connected-positive", NULL))
-		data->connect = NTC_CONNECTED_POSITIVE;
-	else /* status change should be possible if not always on. */
-		data->connect = NTC_CONNECTED_GROUND;
-
-	data->chan = chan;
-
-	return data;
-}
-
 static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
 {
 	if (divisor == 0 && dividend == 0)
@@ -641,20 +598,41 @@ static const struct hwmon_chip_info ntc_chip_info = {
 static int ntc_thermistor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	const struct of_device_id *of_id =
 			of_match_device(of_match_ptr(ntc_match), dev);
 	const struct platform_device_id *pdev_id;
 	struct device *hwmon_dev;
 	struct ntc_data *data;
+	enum iio_chan_type type;
+	int ret;
 
-	data = ntc_thermistor_parse_dt(dev);
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chan = devm_iio_channel_get(dev, NULL);
+	if (IS_ERR(data->chan))
+		return PTR_ERR(data->chan);
+
+	ret = iio_get_channel_type(data->chan, &type);
+	if (ret < 0)
+		return ret;
 
-	if (!data) {
-		dev_err(dev, "No platform init data supplied.\n");
+	if (type != IIO_VOLTAGE)
+		return -EINVAL;
+
+	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
 		return -ENODEV;
-	}
+	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
+		return -ENODEV;
+	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
+		return -ENODEV;
+
+	if (of_find_property(np, "connected-positive", NULL))
+		data->connect = NTC_CONNECTED_POSITIVE;
+	else /* status change should be possible if not always on. */
+		data->connect = NTC_CONNECTED_GROUND;
 
 	if (data->pullup_uv == 0 ||
 	    (data->pullup_ohm == 0 && data->connect ==
-- 
2.31.1

