Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160841CDFCA
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769669; cv=none; b=NP4xQsuuHtQ3eIas0EDYWlTGSXtoobdj4wF4NK7pBngGNOhAYIzi9RvA6LcIGfJgtjdysd4bld8kJmmVgsB7DodNnYeFObaAeguyjIJ6aay808/67IJN54f68xG8WZwKiTraCZT4KIqtgKoM3shBTBoL718U4rJrYCF518utDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769669; c=relaxed/simple;
	bh=NyAobdiO3HoTAmrQxiO2Z4htSIRrZQUjNeIAVHrjhRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlk7j9YDf7x1jR3EgCXyfIhbLVngSPYUyFDGlUQLYCL04fPkRqbMecpBa2hVTLCYnnmUYx5vLyTO93OWUuOSym6+0qdqCIWIZ7AmF6oHBDHWo7uyOMK3UXr4pI0EwODSVcHmTZAOu4DMNyFS9mJcJI+fDISd8yjcX0I62Mxed2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzJZgqZD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzJZgqZD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b2503753efso896045ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774769666; x=1775374466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYlYgcMRkuhiOsvN/sx11f/ZNBmAfnPjQBSL3BfX7BI=;
        b=DzJZgqZDv9DEyU7P6B+z9ev+uN5OzjWwTOfwBNG/SO1b46uOcUXIl/S5YLhX3IBsB2
         6kTcjk+8G61Z6kF1bS+xm8udIySn78i/V5Ia+Tbz48a6/7r+XaEc7GN3tpWQiaBLlodz
         LLZbcxyo6xtMWTtw1lhnSeROxZl8SRaKiuoZwKYdz3ulfGrt2kZgvYg9NfDz4xQOal1q
         E6F2/+ktIIkcycuHbZ5FEeg2QGjBuxfMK8UnklekIh9/upTimKzt2sCqidBOsLv/E1KR
         VzaRGMuPvqo2IqlsO3Sw+9laeyJKULb9+DOF5O5aShYIh8MDkPQbI7dbOEqZPEh0h59+
         p75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774769666; x=1775374466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYlYgcMRkuhiOsvN/sx11f/ZNBmAfnPjQBSL3BfX7BI=;
        b=PiRYQrMT3/U4FYuv03OFHqp352VoXvvYiMYAvE/7e1BwuxCdwKGCNLoymvP0C59EGK
         qaRq6YzkJsPV1FMUIv2pdM5Z0KU5QxRePtoJqGVNpjyFgebCDXoeXg4MGtlpLhn1mFDp
         LltVXKdp2KaJFoqrjIwVZ20NCqEhW+0Bkgij/XMpP17v0fsLERbcwusyffAEQe5foOh2
         WE2U8tPEQwKA+aXJYOJSrFc1SCrfTsj1uJjh8u/NA53i6cYz6Png7qNwQpl6dr3meHPu
         lPFXFdJmCRnhmRl+1KHoB9UahJTgKxh5DsV9477d6BGQY6Oj08g6WulVMBLp1ezILHs0
         9QrQ==
X-Gm-Message-State: AOJu0Yz6F58upgfFFgRDbY1IBEQ6ZPEElXTU0ifGN9ai3gkZ3ORncMsZ
	lxF07+5btL9OHWvK+cEpRa88iMXdf26jb4b8BVXoreSMLUzyqjRr/PXD
X-Gm-Gg: ATEYQzy74Y/yhUYJeatESfyH9qcd7SOPYtJ48OGq2RoPoobskze+j6IAKZW0/03mu+b
	YvhWe/1h1k6W/L4CJxR5K2CgqalfWOofQ2S5kNsXNJo4ixMUCoozN8xcdQHseIdj0cuRYtLxEcp
	XDUt7I8Ys/+AXV/ApI1M4f63It5ZYZ12svYVswDmAA6KkBp6LMf4CeM1CjDK2dpJtgDWuMnFmPq
	v1/Yu4MdlhtD/aqEp9d1OV/tYSB/eoAKzINSKAS7DG3WCHWHYcuYm7d1q22aqQRa9AINgBKztbp
	HNYtT2s+pkX0bXJalTpIq8EIgbAu93zhStpmx4FI1Tb01uh1fh/QRPzEAWchKGBROJRGeTx/7Zv
	Dzy+Fnbj3L3yqkwQMkzIJM37SAUvWxFWEt6j+vEYBXtxaj4XVMxRI9ZRJdrS5GrIHXIxhjWRWaZ
	n7gzmRYeT/tRUPiK3/O+NOH3e35Qr6arqQsSgxX4lrCp2J+STFpDnYkhwHBlb3H7jccQ==
X-Received: by 2002:a17:903:2450:b0:2b0:54dc:63e with SMTP id d9443c01a7336-2b0cdcaa6c1mr91673715ad.33.1774769666309;
        Sun, 29 Mar 2026 00:34:26 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm42266995ad.35.2026.03.29.00.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:34:25 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v2 2/2] hwmon: (ads7871) Use DMA-safe buffer for SPI writes
Date: Sun, 29 Mar 2026 13:03:52 +0530
Message-ID: <20260329073352.270451-3-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329073352.270451-1-tabreztalks@gmail.com>
References: <20260329073352.270451-1-tabreztalks@gmail.com>
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
 drivers/hwmon/ads7871.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 41a1e9bbd4050..cd58c960690f1 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -63,6 +63,7 @@
 
 struct ads7871_data {
 	struct spi_device *spi;
+	u8 tx_buf[2] ____cacheline_aligned;
 };
 static umode_t ads7871_is_visible(const void *data,
 				  enum hwmon_sensor_types type,
@@ -78,6 +79,7 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
 {
 	int ret;
 
+
 	reg = reg | INST_READ_BM;
 	ret = spi_w8r8(spi, reg);
 	return ret;
@@ -92,11 +94,12 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
 	return ret;
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
@@ -115,7 +118,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	/*MUX_M3_BM forces single ended*/
 	/*This is also where the gain of the PGA would be set*/
-	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
+	ret = ads7871_write_reg8(pdata, REG_GAIN_MUX,
 				 (MUX_CNV_BM | MUX_M3_BM | channel));
 	if (ret < 0)
 		return ret;
@@ -123,6 +126,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 	if (ret < 0)
 		return ret;
+
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -142,8 +146,11 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
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
 
@@ -180,11 +187,17 @@ static int ads7871_probe(struct spi_device *spi)
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
@@ -195,11 +208,6 @@ static int ads7871_probe(struct spi_device *spi)
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

