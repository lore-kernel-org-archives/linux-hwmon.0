Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CDAC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 02:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbhLFCJ5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 21:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhLFCJ4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 21:09:56 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5120C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 18:06:28 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i63so18065558lji.3
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZfHB/M9j4piKTENRYKnn/Q4XOFevui2nyTRf4yfxh20=;
        b=J0aK9GR6xxMY1GpeANJMxjgY1JfZGOKyqhCsfQTnHZUi55tvavLakJFdqSclqd7BSu
         DUxUrOr0Rmd48bjgpLuKpS74+SBJf0rwrsEUgtgOaY6Zx0jhA7YGqaTfiYmRHJgedEEg
         kUFG7SzM9zYR/YxQ5EgbxUF2Gr19ptsc1LKCD94XbXmi6Kf5DYlNOyhUZt08aK71smAL
         g+02Q/38GliaTG3S2/3BhEAsMc9/3EBIG1TpJTiFR+0TASCFR/wvDKHULrGL4/eUyC/v
         hVPYsPUR8X1jO43sCs0xEZTfPjZAy/mGfm//Hbfap+SDmXvhJ3vY8vcDcoYfHBJSuMyb
         3bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZfHB/M9j4piKTENRYKnn/Q4XOFevui2nyTRf4yfxh20=;
        b=InOxF84VG+vyWkpypR7loaOkfr5Xp7xk7oAjj5hMyJKTWKkUc1zIcE3N/E0anu4sWR
         AN+jNq4FrbeRzMNAYGBnyie3s0T0maVvMdL+Otw6asItO+R5cVVuFEzY85knqtYWz/DM
         lsTZxkMGPuaOO18kbwK2NxkgUVTfbdjNCuduxiMkpiuUiqJirFNfE8dOMn9DlCMH1q9n
         spGY0bYqQuG/0SGxNeL2FFpNYLb7FG0mxc63z2lVKUCZgwcnZqojDqOW92lwmvBtU5Vb
         KEPlIoDUBDL/fYRxI3sV2nhL17kZHQyYtAFi3JkhYgDNNbWL8LQ/sgou0lADlkPrbolQ
         dKVw==
X-Gm-Message-State: AOAM530yuFv1rsdsx8HGLzMcLM/2vMO0YmlnlERzE+y11pWNdJC8PUmk
        nBd8empk6yjkp/5k2INXmesl7O6V5kcyIQ==
X-Google-Smtp-Source: ABdhPJxUWNinObUWHAVatWz0FEFcGH++fzCSSY/+xXfm1aMSHlX3CmVBhjph/9svMLAq/7TdhwZTMw==
X-Received: by 2002:a2e:9193:: with SMTP id f19mr34455678ljg.60.1638756386944;
        Sun, 05 Dec 2021 18:06:26 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k8sm1215672lfv.179.2021.12.05.18.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 18:06:25 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 1/3 v2] hwmon: (ntc_thermistor): Move and refactor DT parsing
Date:   Mon,  6 Dec 2021 03:04:21 +0100
Message-Id: <20211206020423.62402-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Move the parsing of the DT config right above probe().

Allocate the state container for the driver in probe()
instead of inside the DT config parsing function: as a
result return an int instead of a pointer.

Drop the check for !np: we can only probe from DT right
now so no risk of ending up here.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Instead of inlining the DT probing, keep the separate
  function, but move out the state container allocation
  and return an int.
---
 drivers/hwmon/ntc_thermistor.c | 93 ++++++++++++++++------------------
 1 file changed, 43 insertions(+), 50 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index ed638ebd0923..12435ef66530 100644
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
@@ -638,6 +595,42 @@ static const struct hwmon_chip_info ntc_chip_info = {
 	.info = ntc_info,
 };
 
+static int ntc_thermistor_parse_dt(struct device *dev,
+				   struct ntc_data *data)
+{
+	struct iio_channel *chan;
+	enum iio_chan_type type;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	chan = devm_iio_channel_get(dev, NULL);
+	if (IS_ERR(chan))
+		return PTR_ERR(chan);
+
+	ret = iio_get_channel_type(chan, &type);
+	if (ret < 0)
+		return ret;
+
+	if (type != IIO_VOLTAGE)
+		return -EINVAL;
+
+	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
+		return -ENODEV;
+	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
+		return -ENODEV;
+	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
+		return -ENODEV;
+
+	if (of_find_property(np, "connected-positive", NULL))
+		data->connect = NTC_CONNECTED_POSITIVE;
+	else /* status change should be possible if not always on. */
+		data->connect = NTC_CONNECTED_GROUND;
+
+	data->chan = chan;
+
+	return 0;
+}
+
 static int ntc_thermistor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -646,15 +639,15 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	const struct platform_device_id *pdev_id;
 	struct device *hwmon_dev;
 	struct ntc_data *data;
+	int ret;
 
-	data = ntc_thermistor_parse_dt(dev);
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
 
-	if (!data) {
-		dev_err(dev, "No platform init data supplied.\n");
-		return -ENODEV;
-	}
+	ret = ntc_thermistor_parse_dt(dev, data);
+	if (ret)
+		return ret;
 
 	if (data->pullup_uv == 0 ||
 	    (data->pullup_ohm == 0 && data->connect ==
-- 
2.31.1

