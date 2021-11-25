Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B21C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Nov 2021 02:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhKYC5a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Nov 2021 21:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238810AbhKYCz3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Nov 2021 21:55:29 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19325C0698D7
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:11:02 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id u3so12229727lfl.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LiKHdfqSNHA/KZi7sX9wOmmsE2ep6Bx+XNqfYZCkFRc=;
        b=mYz1c6kvCk5YcpQrTyrmuZqHygeEchjKcpSMbkq5ACofoq7Jl7dVIGtwsQAwvHNCeC
         +1r81C6KFjV/KLVeyCWTNrHxKGqOO4HPKn9z+ITt52zzdKpq0Vx/krVfBnn5WdRDBYoU
         +5a44zdESGXhLpJ9uMEBBB2TeOJhVzXEgMdo7xXlT/L4+wdxUl/Gh+3RTZkvQb+MHiVY
         pCIHFV7BcUosXr/XZoK6WewT1Dt0ezyLBoMGnmYnWRQ9Jdj/2SaVanpdF5mRfW25OPR+
         MwDNjJNIX5kQ4dy0X85ibRlRv7vyGw+61WZ0ugf1GpcuC+Hfc+W4lChPYZLlk40K8SfU
         DqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LiKHdfqSNHA/KZi7sX9wOmmsE2ep6Bx+XNqfYZCkFRc=;
        b=UdWuP5DXy5bxFQWvJ67Gz/mv5NWDVgkcmuU+shuAI+vRRXefMEig3BMmEIN4Mn3RTf
         1RhZ+jdGUAiL0ydjMpRlGx7dxv+vZSITTjO0NPcyP/1joxXoOzrWOTtO3pxVv7ixTuAG
         sKebj/rpMheuTf1F/oDUxIEaQ8TYR3vTna5ULAuqPL+xFHm58Dfpqxm8Uplt85l3lz0q
         se0GGqoD5IqUwRBtUTIz3GP8IC+N9FvXofQNJWxLWHjl1648uRMb1Sh2bmwDaoTSSeS6
         unjGVUaY1COa4rOgu9dy9JXZ4vAn+ZCcTCr3x/kpFiG/pB1ffVPC1z1oZfB5duKA35f7
         0hnw==
X-Gm-Message-State: AOAM532RtDwb3WFLFs3uBjkz4XnytKWlR5IbOrj/cC0SYIxCKoJEI3zc
        CxrMxsFnYnLe4AI6p6bUUzft0Q==
X-Google-Smtp-Source: ABdhPJzpmdtGHMHWvZSoxAeBd7m6F8/bajv++6UXNC2NrHGhtVAUsaZCzQFrWqJvgmEOCU86cP9/yg==
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr20619200lfk.148.1637806260366;
        Wed, 24 Nov 2021 18:11:00 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m3sm132507lji.112.2021.11.24.18.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 18:10:59 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 4/4] hwmon: (ntc_thermistor) Merge platform data
Date:   Thu, 25 Nov 2021 03:08:41 +0100
Message-Id: <20211125020841.3616359-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125020841.3616359-1-linus.walleij@linaro.org>
References: <20211125020841.3616359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Allocate one state container for the device: struct ntc_data.
Move all items from struct ntc_thermistor_platform_data into
this struct and simplify.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ntc_thermistor.c | 109 +++++++++++++++------------------
 1 file changed, 48 insertions(+), 61 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index cedb3ee0f762..ed638ebd0923 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -26,25 +26,6 @@ enum ntc_thermistor_type {
 	TYPE_NCPXXXH103,
 };
 
-struct ntc_thermistor_platform_data {
-	/*
-	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required.
-	 *
-	 * How to setup pullup_ohm, pulldown_ohm, and connect is
-	 * described at Documentation/hwmon/ntc_thermistor.rst
-	 *
-	 * pullup/down_ohm: 0 for infinite / not-connected
-	 *
-	 * chan: iio_channel pointer to communicate with the ADC which the
-	 * thermistor is using for conversion of the analog values.
-	 */
-	unsigned int pullup_uv;
-	unsigned int pullup_ohm;
-	unsigned int pulldown_ohm;
-	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
-	struct iio_channel *chan;
-};
-
 struct ntc_compensation {
 	int		temp_c;
 	unsigned int	ohm;
@@ -337,15 +318,30 @@ static const struct ntc_type ntc_type[] = {
 	NTC_TYPE(TYPE_NCPXXXH103,  ncpXXxh103),
 };
 
+/*
+ * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required.
+ *
+ * How to setup pullup_ohm, pulldown_ohm, and connect is
+ * described at Documentation/hwmon/ntc_thermistor.rst
+ *
+ * pullup/down_ohm: 0 for infinite / not-connected
+ *
+ * chan: iio_channel pointer to communicate with the ADC which the
+ * thermistor is using for conversion of the analog values.
+ */
 struct ntc_data {
-	struct ntc_thermistor_platform_data *pdata;
 	const struct ntc_compensation *comp;
 	int n_comp;
+	unsigned int pullup_uv;
+	unsigned int pullup_ohm;
+	unsigned int pulldown_ohm;
+	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
+	struct iio_channel *chan;
 };
 
-static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
+static int ntc_adc_iio_read(struct ntc_data *data)
 {
-	struct iio_channel *channel = pdata->chan;
+	struct iio_channel *channel = data->chan;
 	int uv, ret;
 
 	ret = iio_read_channel_processed_scale(channel, &uv, 1000);
@@ -365,7 +361,7 @@ static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
 		ret = iio_convert_raw_to_processed(channel, raw, &uv, 1000);
 		if (ret < 0) {
 			/* Assume 12 bit ADC with vref at pullup_uv */
-			uv = (pdata->pullup_uv * (s64)raw) >> 12;
+			uv = (data->pullup_uv * (s64)raw) >> 12;
 		}
 	}
 
@@ -407,20 +403,19 @@ static const struct of_device_id ntc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ntc_match);
 
-static struct ntc_thermistor_platform_data *
-ntc_thermistor_parse_dt(struct device *dev)
+static struct ntc_data *ntc_thermistor_parse_dt(struct device *dev)
 {
+	struct ntc_data *data;
 	struct iio_channel *chan;
 	enum iio_chan_type type;
 	struct device_node *np = dev->of_node;
-	struct ntc_thermistor_platform_data *pdata;
 	int ret;
 
 	if (!np)
 		return NULL;
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return ERR_PTR(-ENOMEM);
 
 	chan = devm_iio_channel_get(dev, NULL);
@@ -434,21 +429,21 @@ ntc_thermistor_parse_dt(struct device *dev)
 	if (type != IIO_VOLTAGE)
 		return ERR_PTR(-EINVAL);
 
-	if (of_property_read_u32(np, "pullup-uv", &pdata->pullup_uv))
+	if (of_property_read_u32(np, "pullup-uv", &data->pullup_uv))
 		return ERR_PTR(-ENODEV);
-	if (of_property_read_u32(np, "pullup-ohm", &pdata->pullup_ohm))
+	if (of_property_read_u32(np, "pullup-ohm", &data->pullup_ohm))
 		return ERR_PTR(-ENODEV);
-	if (of_property_read_u32(np, "pulldown-ohm", &pdata->pulldown_ohm))
+	if (of_property_read_u32(np, "pulldown-ohm", &data->pulldown_ohm))
 		return ERR_PTR(-ENODEV);
 
 	if (of_find_property(np, "connected-positive", NULL))
-		pdata->connect = NTC_CONNECTED_POSITIVE;
+		data->connect = NTC_CONNECTED_POSITIVE;
 	else /* status change should be possible if not always on. */
-		pdata->connect = NTC_CONNECTED_GROUND;
+		data->connect = NTC_CONNECTED_GROUND;
 
-	pdata->chan = chan;
+	data->chan = chan;
 
-	return pdata;
+	return data;
 }
 
 static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
@@ -462,24 +457,23 @@ static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
 
 static int get_ohm_of_thermistor(struct ntc_data *data, unsigned int uv)
 {
-	struct ntc_thermistor_platform_data *pdata = data->pdata;
-	u32 puv = pdata->pullup_uv;
+	u32 puv = data->pullup_uv;
 	u64 n, puo, pdo;
-	puo = pdata->pullup_ohm;
-	pdo = pdata->pulldown_ohm;
+	puo = data->pullup_ohm;
+	pdo = data->pulldown_ohm;
 
 	if (uv == 0)
-		return (pdata->connect == NTC_CONNECTED_POSITIVE) ?
+		return (data->connect == NTC_CONNECTED_POSITIVE) ?
 			INT_MAX : 0;
 	if (uv >= puv)
-		return (pdata->connect == NTC_CONNECTED_POSITIVE) ?
+		return (data->connect == NTC_CONNECTED_POSITIVE) ?
 			0 : INT_MAX;
 
-	if (pdata->connect == NTC_CONNECTED_POSITIVE && puo == 0)
+	if (data->connect == NTC_CONNECTED_POSITIVE && puo == 0)
 		n = div_u64(pdo * (puv - uv), uv);
-	else if (pdata->connect == NTC_CONNECTED_GROUND && pdo == 0)
+	else if (data->connect == NTC_CONNECTED_GROUND && pdo == 0)
 		n = div_u64(puo * uv, puv - uv);
-	else if (pdata->connect == NTC_CONNECTED_POSITIVE)
+	else if (data->connect == NTC_CONNECTED_POSITIVE)
 		n = div64_u64_safe(pdo * puo * (puv - uv),
 				puo * uv - pdo * (puv - uv));
 	else
@@ -579,7 +573,7 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
 {
 	int read_uv;
 
-	read_uv = ntc_adc_iio_read(data->pdata);
+	read_uv = ntc_adc_iio_read(data);
 	if (read_uv < 0)
 		return read_uv;
 	return get_ohm_of_thermistor(data, read_uv);
@@ -650,38 +644,31 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id =
 			of_match_device(of_match_ptr(ntc_match), dev);
 	const struct platform_device_id *pdev_id;
-	struct ntc_thermistor_platform_data *pdata;
 	struct device *hwmon_dev;
 	struct ntc_data *data;
 
-	pdata = ntc_thermistor_parse_dt(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
+	data = ntc_thermistor_parse_dt(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
-	if (!pdata) {
+	if (!data) {
 		dev_err(dev, "No platform init data supplied.\n");
 		return -ENODEV;
 	}
 
-	if (pdata->pullup_uv == 0 ||
-	    (pdata->pullup_ohm == 0 && pdata->connect ==
+	if (data->pullup_uv == 0 ||
+	    (data->pullup_ohm == 0 && data->connect ==
 	     NTC_CONNECTED_GROUND) ||
-	    (pdata->pulldown_ohm == 0 && pdata->connect ==
+	    (data->pulldown_ohm == 0 && data->connect ==
 	     NTC_CONNECTED_POSITIVE) ||
-	    (pdata->connect != NTC_CONNECTED_POSITIVE &&
-	     pdata->connect != NTC_CONNECTED_GROUND)) {
+	    (data->connect != NTC_CONNECTED_POSITIVE &&
+	     data->connect != NTC_CONNECTED_GROUND)) {
 		dev_err(dev, "Required data to use NTC driver not supplied.\n");
 		return -EINVAL;
 	}
 
-	data = devm_kzalloc(dev, sizeof(struct ntc_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
 
-	data->pdata = pdata;
-
 	if (pdev_id->driver_data >= ARRAY_SIZE(ntc_type)) {
 		dev_err(dev, "Unknown device type: %lu(%s)\n",
 				pdev_id->driver_data, pdev_id->name);
-- 
2.31.1

