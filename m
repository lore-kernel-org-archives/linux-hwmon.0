Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2467C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Nov 2021 02:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbhKYC53 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Nov 2021 21:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238798AbhKYCz3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Nov 2021 21:55:29 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C24FC0698D6
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:59 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l22so12206078lfg.7
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Nov 2021 18:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sysNk/MtA9eShgMwPDGkyoQIaKsUFfBEZqV8IACsDcg=;
        b=rA87TsnEL99v7Mc5Fi9qh3MfkYt0ep7aCOtWvS33Er9pvxLo+51OVpaQefI8z/3GQE
         vBzag5HhoqMMUolyGBRhv+PQyUSWPBaQmjJrCENlbdfSVYwGQnWkB6THYpizA7VaNQ4v
         GeVBehy/4yIdtU/Lu6jnaYHjvJ8pOFNOqIa+cu62cjxsFYOx0FXXnFxIP3VVbWqInRQs
         aj5hOfZ7PX5TWJLGYGboTNxIwBuI5Y1u0XwrirQGVwN38sjrZ6ZD0IQMXrV8dfjfPbjt
         j4D4heJWOV5v3Bbe88I1J2pLZrpqoAvjZaGnmzyBdO679m+u4JEFVJRuSCePIKfJgBDB
         TP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sysNk/MtA9eShgMwPDGkyoQIaKsUFfBEZqV8IACsDcg=;
        b=biZylMq8d0kihvrFW0dTT3qZ51CtngPYW3E8JOhrDEEQVG1b+wPLV0CY10s9b4IT/k
         ahjiZHwXVRPUvicPPl35swiUm73u+bfH8yLtbcTbSjws4YyFNJKki6VHMTB3YDBJej/f
         QtUZdtS8njsnBws4ENjbDQMErzIZ2j1tZNSZuRnOlF/wJxCYziuNXiz5DhNz00Y91WJ4
         I+8i1VndRNd9Jbi+svoDFjZj6UhfN1zTd/AHAd4NTUicGyQGRTWNnjtBWjWbpZgylXXV
         F4rAQ7qmwBFyxRpeCjHuXcbk+1Rct46Fp0iTv471P/Tbv+5SLlZ17IM/tL4yRQJjxfEy
         Ha2w==
X-Gm-Message-State: AOAM532ypoGBOAL3mjqFOhcwyfEF6gRVubsj/1VSA3OFDI4+DoaUYbZ+
        ZM33yZtdMQqL8NLLr9mjkPQSiQ==
X-Google-Smtp-Source: ABdhPJxgd2sqD1K0rZRdu5zYc2W/sGuXl8EKUsDOg/9k4NVbQnEaJf2Vcp/nLCS/afkBFPPxKgJznA==
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr19361070lfu.170.1637806257708;
        Wed, 24 Nov 2021 18:10:57 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m3sm132507lji.112.2021.11.24.18.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 18:10:56 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Subject: [PATCH 3/4] hwmon: (ntc_thermistor) Drop read_uv() depend on OF and IIO
Date:   Thu, 25 Nov 2021 03:08:40 +0100
Message-Id: <20211125020841.3616359-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125020841.3616359-1-linus.walleij@linaro.org>
References: <20211125020841.3616359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The only possible assignment of a function to get a voltage to
convert to a resistance is to use the internal function
ntc_adc_iio_read() which is only available when using IIO
and OF.

Bite the bullet and mandate OF and IIO, drop the read_uv()
callback abstraction and some ifdefs.

As no board is using the platform data, all users are using
OF and IIO anyway.

Cc: Peter Rosin <peda@axentia.se>
Cc: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/Kconfig          |  5 ++--
 drivers/hwmon/ntc_thermistor.c | 49 +++++++++-------------------------
 2 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 64bd3dfba2c4..e491e8f354bb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1414,8 +1414,9 @@ config SENSORS_PC87427
 	  will be called pc87427.
 
 config SENSORS_NTC_THERMISTOR
-	tristate "NTC thermistor support from Murata"
-	depends on !OF || IIO=n || IIO
+	tristate "NTC thermistor support"
+	depends on OF
+	depends on IIO
 	depends on THERMAL || !THERMAL_OF
 	help
 	  This driver supports NTC thermistors sensor reading and its
diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 8a78e899fa12..cedb3ee0f762 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -28,8 +28,7 @@ enum ntc_thermistor_type {
 
 struct ntc_thermistor_platform_data {
 	/*
-	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required to use
-	 * read_uV()
+	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required.
 	 *
 	 * How to setup pullup_ohm, pulldown_ohm, and connect is
 	 * described at Documentation/hwmon/ntc_thermistor.rst
@@ -39,9 +38,7 @@ struct ntc_thermistor_platform_data {
 	 * chan: iio_channel pointer to communicate with the ADC which the
 	 * thermistor is using for conversion of the analog values.
 	 */
-	int (*read_uv)(struct ntc_thermistor_platform_data *);
 	unsigned int pullup_uv;
-
 	unsigned int pullup_ohm;
 	unsigned int pulldown_ohm;
 	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
@@ -346,7 +343,6 @@ struct ntc_data {
 	int n_comp;
 };
 
-#if defined(CONFIG_OF) && IS_ENABLED(CONFIG_IIO)
 static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
 {
 	struct iio_channel *channel = pdata->chan;
@@ -451,20 +447,9 @@ ntc_thermistor_parse_dt(struct device *dev)
 		pdata->connect = NTC_CONNECTED_GROUND;
 
 	pdata->chan = chan;
-	pdata->read_uv = ntc_adc_iio_read;
 
 	return pdata;
 }
-#else
-static struct ntc_thermistor_platform_data *
-ntc_thermistor_parse_dt(struct device *dev)
-{
-	return NULL;
-}
-
-#define ntc_match	NULL
-
-#endif
 
 static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
 {
@@ -594,13 +579,10 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
 {
 	int read_uv;
 
-	if (data->pdata->read_uv) {
-		read_uv = data->pdata->read_uv(data->pdata);
-		if (read_uv < 0)
-			return read_uv;
-		return get_ohm_of_thermistor(data, read_uv);
-	}
-	return -EINVAL;
+	read_uv = ntc_adc_iio_read(data->pdata);
+	if (read_uv < 0)
+		return read_uv;
+	return get_ohm_of_thermistor(data, read_uv);
 }
 
 static int ntc_read(struct device *dev, enum hwmon_sensor_types type,
@@ -681,19 +663,14 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (!pdata->read_uv) {
-		dev_err(dev, "read_uv missing\n");
-		return -EINVAL;
-	}
-
-	if (pdata->read_uv && (pdata->pullup_uv == 0 ||
-				(pdata->pullup_ohm == 0 && pdata->connect ==
-				 NTC_CONNECTED_GROUND) ||
-				(pdata->pulldown_ohm == 0 && pdata->connect ==
-				 NTC_CONNECTED_POSITIVE) ||
-				(pdata->connect != NTC_CONNECTED_POSITIVE &&
-				 pdata->connect != NTC_CONNECTED_GROUND))) {
-		dev_err(dev, "Required data to use read_uv not supplied.\n");
+	if (pdata->pullup_uv == 0 ||
+	    (pdata->pullup_ohm == 0 && pdata->connect ==
+	     NTC_CONNECTED_GROUND) ||
+	    (pdata->pulldown_ohm == 0 && pdata->connect ==
+	     NTC_CONNECTED_POSITIVE) ||
+	    (pdata->connect != NTC_CONNECTED_POSITIVE &&
+	     pdata->connect != NTC_CONNECTED_GROUND)) {
+		dev_err(dev, "Required data to use NTC driver not supplied.\n");
 		return -EINVAL;
 	}
 
-- 
2.31.1

