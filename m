Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037E27F19F
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776484117; cv=none; b=lnKNQW7ZxeV/OGRHDsDsBP7mKbOlkwktfBxSdZM8kDRIBV0jDgFghrYKglgOQqlPJocrPoaHdfUUuV7PGc97G1J1oFGatNFECiCjzrAzZR1WAnX9o0R949qHoP5eFRlGR8uxqm2WanA0FJIAxYCZ84JvEUB/76rNeY00ih99Ywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776484117; c=relaxed/simple;
	bh=KlCZSGoNQ2owu6z4cnzLx9ww+W5qqB0R4s7DRzeFrS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYeGE/iySgETLzrgYSSlpYkShsGRam9WbgYvWpoTX/mn3AghAcTj3Qn1hDf/kzye7X+NlcxJumSc7w5sBrUDEF8DfVAEYH6phq8XTXTWwtRaVokJ8Xeqv1ao+TCg8+u6MblvZGM2Ju7HIsoOVZBqsy3snyfblGCcv5kx2B6sAEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojNJKEw+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojNJKEw+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f69adeecbso624751b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 20:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776484115; x=1777088915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv/rI+ADctzcEfXSseQ7mhn237mO7KKBrL7JH0PS3mo=;
        b=ojNJKEw+hCCB+Eb+64Uxfwy8c6mkVACrdaF4Hfsy6pvKear/YBhlLXKXLVdsIjJyIS
         AWTvUxuRKRIF+PPy1Wj0n39OZEZY4jlK8aR3QaapefyPgmUdM2YoTZ1vmH7jPSFH6xg7
         Q60Y+TmIAhwo1mke5NMpz0gdx0FjPmwIc6rbTYGa8BVKgA2iO3VCQTaW3Vn5CunBsH1k
         ZfMXIYpFGp9hNu9EoM6DMQAY0jyd9qrJnui2hi6xxDC3LDtFaLQA+2XtR6jkZN9vgQNA
         tkUbU+w5uPXPzpQ+jbyrpH0+z09QYuyQwgHcFRYupSOw8YVFYsNpElHR4Z3gLUHVeLtn
         EDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776484115; x=1777088915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tv/rI+ADctzcEfXSseQ7mhn237mO7KKBrL7JH0PS3mo=;
        b=NUuTbPdX7uzmfRFBsqZNH2T2h0Vc4V36f2jL5OfbyRKz2ZxAZpQuIZE3fmaH0HfyGH
         i6PE9OBH9H9GBv3PMR8mJHtml33IZHzcXcH1Bwc7vvdsDfD7wd8YYtINfRG3gQrsvSXG
         BPxlZ5m3oy7MLTqXa7BNq8d9wMOM6pxVYMW3pAeZhHPMlRztZbpXD1YQtjjIVklatNe3
         f1m2pU9dHxrIgda/QxjikfV3sH1uwHgFxNya2UM0TCgd5DIZUBJh37vau4cMPpE2SY14
         aPf2z24cmamnaYpZ+dvIt9fegrTubou2sMC6awLZ7/JPwzP6UtndzxLB0cRsg0lyflzN
         8cBA==
X-Gm-Message-State: AOJu0YzrZKsZ8mY713iTzPQD0Nwv0s520wU1H/tf9oQFU5ykYabPtmRf
	EGhfAIQt+bj4Stfp67uolsywr7pOLxmNApXN04nQKUbKfZz6sabxkOf9kBAcPQ==
X-Gm-Gg: AeBDiet1LDGtv52A8+MX2WFDaJQ56yYVuS2WvzyjcWLu66MPnbnSnMSfXRuGNFEeCqE
	shqdBkV0AM1ammKcCEKneEh+80Yge3PrrJHbqYPncuyVJG7qt253hakXnHySUtkRrvm8xqTsII+
	jo2ThgLpcZXJSdmjR0hL3bLnzvkCs9iBLERw2PH+FDOkVWWLF2F6390XUy/R0lPeUtGybWECEUh
	Q2Y2W52a8OdAbFK8tvBZf7c4saZf6wZiE7xEHC4F2tuuER1m6lWhDPwRXVoNPvLBoIsuV57oyaa
	E2BLGML7SreaEdYAakSvEgGTNf8RWOyYcFswuc6k22uoAn5F+QTaeupyWEvpYT8BxCNelr+P9cK
	Admrwpppv4idFQLFMISUTKdXgjc3FaGfTytyk0EkYoUtxTTWgb05tWMekYIbuFdvh/+GkfFmGQX
	59mHBjMVDkhw2ejddqgbkPjnccoXd5IIjn6T0GIvV0kxww5cDauyQIJ71JpfdDmg4ibqsUyqikA
	g==
X-Received: by 2002:a05:6a00:4c0b:b0:82c:e4b4:b04f with SMTP id d2e1a72fcca58-82f8c9d598amr5356680b3a.47.1776484115185;
        Fri, 17 Apr 2026 20:48:35 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([27.4.62.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm3549074b3a.56.2026.04.17.20.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 20:48:34 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v3 3/3] hwmon: (ads7871) Use DMA-safe buffer for SPI writes
Date: Sat, 18 Apr 2026 09:16:01 +0530
Message-ID: <20260418034601.90226-4-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418034601.90226-1-tabreztalks@gmail.com>
References: <20260418034601.90226-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently passes a stack-allocated buffer to spi_write(),
which is incompatible with DMA on systems with CONFIG_VMAP_STACK
enabled.

Move the transfer buffer into the driver's private data structure
to ensure it is DMA-safe. Since this shared buffer now requires
serialization, this change depends on the previous commit which
migrated the driver to the hwmon 'with_info' API.

While moving the logic, also:
- Corrected the sign extension for 14-bit data by casting to s16.
- Scaled the output to millivolts (2500mV full scale
) to comply with the hwmon ABI.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 851b70e9f6ba2..d0f1eec8effbf 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -64,6 +64,7 @@
 
 struct ads7871_data {
 	struct spi_device *spi;
+	u8 tx_buf[2] ____cacheline_aligned;
 };
 
 static umode_t ads7871_is_visible(const void *data,
@@ -97,11 +98,12 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
 	return get_unaligned_le16(buf);
 }
 
-static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
+static int ads7871_write_reg8(struct ads7871_data *pdata, int reg, u8 val)
 {
-	u8 tmp[2] = {reg, val};
+	pdata->tx_buf[0] = reg;
+	pdata->tx_buf[1] = val;
 
-	return spi_write(spi, tmp, sizeof(tmp));
+	return spi_write(pdata->spi, pdata->tx_buf, 2);
 }
 
 static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
@@ -120,7 +122,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	/*MUX_M3_BM forces single ended*/
 	/*This is also where the gain of the PGA would be set*/
-	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
+	ret = ads7871_write_reg8(pdata, REG_GAIN_MUX,
 				 (MUX_CNV_BM | MUX_M3_BM | channel));
 	if (ret < 0)
 		return ret;
@@ -128,6 +130,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 	if (ret < 0)
 		return ret;
+
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -147,8 +150,11 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 		if (raw_val < 0)
 			return raw_val;
 
-		/*result in volts*10000 = (val/8192)*2.5*10000*/
-		*val = ((raw_val >> 2) * 25000) / 8192;
+		/*
+		 * Use (s16) to ensure the sign bit is preserved during the shift.
+		 * Report millivolts (2.5V = 2500mV).
+		 */
+		*val = ((s16)raw_val >> 2) * 2500 / 8192;
 		return 0;
 	}
 
@@ -185,11 +191,17 @@ static int ads7871_probe(struct spi_device *spi)
 	spi->bits_per_word = 8;
 	spi_setup(spi);
 
-	ads7871_write_reg8(spi, REG_SER_CONTROL, 0);
-	ads7871_write_reg8(spi, REG_AD_CONTROL, 0);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	pdata->spi = spi;
+
+	ads7871_write_reg8(pdata, REG_SER_CONTROL, 0);
+	ads7871_write_reg8(pdata, REG_AD_CONTROL, 0);
 
 	val = (OSC_OSCR_BM | OSC_OSCE_BM | OSC_REFE_BM | OSC_BUFE_BM);
-	ads7871_write_reg8(spi, REG_OSC_CONTROL, val);
+	ads7871_write_reg8(pdata, REG_OSC_CONTROL, val);
 	ret = ads7871_read_reg8(spi, REG_OSC_CONTROL);
 
 	dev_dbg(dev, "REG_OSC_CONTROL write:%x, read:%x\n", val, ret);
@@ -200,11 +212,6 @@ static int ads7871_probe(struct spi_device *spi)
 	if (val != ret)
 		return -ENODEV;
 
-	pdata = devm_kzalloc(dev, sizeof(struct ads7871_data), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-
-	pdata->spi = spi;
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, spi->modalias,
 							 pdata,
 							 &ads7871_chip_info,
-- 
2.43.0

