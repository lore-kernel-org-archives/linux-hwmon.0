Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E442BEFEB
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 02:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777602950; cv=none; b=MlbjP8Y6eFE8ITeaxj8JnHNmTUm2qeo2lbqZMZcWn3EhltWqX05mw4VMWGvWh6qsUY5XpjXhzPjdGpbF5nzmWq4h24z30ia0UvXtVSrvYymYYTT2LU3LKibkxPT09Z9kdNK1/Lnhdmhlbd/7XK1BSoU5BiQWM3jx5nTrkZsMVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777602950; c=relaxed/simple;
	bh=nI7jEuFl5Wx1BRcYnNc+rTGFK7F6A8M4xO6oyFoLWrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQyweRdbolMtCyBeeNw9S/O+qOi2sSD4OUQOw8btzk1PR8uMMSpPAMhzJN3IAGqY8t15iFjzPy53leAjo7DrIe+Pk/pj2LQnvVSnhFp8olrnBsf1zHy8JI2vRYPb4SRgoLpC9otwjAev5puHZXZtJurr9BjkxWbWTvKLIYIcMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kf9ClMGu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kf9ClMGu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad9516a653so7926425ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 19:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777602948; x=1778207748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSnHTefyeA+2hwX9yr/+mpxR4GkNtCtvVO+4GeW9P5U=;
        b=Kf9ClMGuYeuHvyKoEwrVB2k92lRLV1k31k1WmBJWnLobS56JvKzlHmy2CQ8j5E3ElT
         L/arynh51/Fhcs/pOA6HgMl2P2wUjTE2o/Pnz4RL+vpPGCKjvhAMN/4ePvMpiHw0WWfG
         gjHva2//BQrIXi7s4PCEJ5n+boDcQw8RiJzapYWqWi1hyDsf01BmOhM1O1ad8FSXYWKc
         PkKT/vQwRJDUsbR3IJFaYuzv4aFqEblejo8Ax8aTqxbc1XZ+y6R8kFCAmJO48sw8LpS/
         QvFxNcgODDtpICYGWlrRgg9ppqAFDDNWH3sDCYAghrHY6c/9ooGZIdtHiKAtVxO3t+F9
         zPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777602948; x=1778207748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSnHTefyeA+2hwX9yr/+mpxR4GkNtCtvVO+4GeW9P5U=;
        b=IOCTvTZVY6vLNZSBaeoxeyX9QfD/Zd0wobxfn590ETbY5YVJhie6gCksdOtm48zvex
         hcW/oZGrAsmVme08Nz1ViF/fpgNqiHsEgYNTeUuFyIndXXM/O8qIxK38eq/BK05iT0RX
         s9hfQdaShe6pcKBAUKDUjZc7QreVM3dIhXdv+MfV+kTAhpcqX5q/Adyy9sftc7kWXHmJ
         Wq3uY8xLEZTnaA3yN2obiKTr7u04YmvOvpWw2UjXsLNCtnk9wuYSqf4jE3dRhxJNgR9b
         o0Ej05zPhAsASoxI1KdKCKgvKzCn/9Dke9mXALlR/x5f8Ygzd9DDxPcx1D5s4grqXsu2
         5U9g==
X-Gm-Message-State: AOJu0YyfOyNWh0bjwsCloQM/r5ynQjwXD9b8O5gzGceA1mo+PqaLbL5D
	zXCAd1ofrXcRo4MYRPdDxo/iEtxuzboxNr1VlHieVoaoFNE1coNBCZS/
X-Gm-Gg: AeBDiev6pSRYuVINCzKizUp5Wq0UTXYImYDNSBwzTBsFFQEx6jJLpeJG0w/gyTFoLFv
	LU2uf3SWm8Rctw4GpqOXsO27wya7FH/NmNR/3Q7PljwpdvOJEtCXgt7URIug23fmvXTcFCMt4Vh
	HUuYHqcJTr+C6EN2R3msFHgskTyXMzMeeZrBtvt5HIqH7twCOzfe0nkShYL048K8wQZ/VHIXdZm
	W/z1B76v3uVpwa5b9kI+D1vf6YAVexgDGoz+3koqPAPyZmX6F4B0wXFM8sm2TyiFOoH4BGsNiJd
	fVF4mc0o/sTGPJTYC9388xe3xRVag/t0Kbdndt+bC3oV5x6ub+ZSRH0O/sn5naFEIoMFF9WbKKt
	qoiwuS7sFkrBjl1WxEqWhvkt1Tb8kHBbfVlaqRqNgFOjCGFEwRt2YKcvRjAFJCrqmzryMGcW1rh
	v7h8VGgTC+5/GmM2R0xXRKspzkQANcwL065nGD3Zv4jhdcU42qSYJV0Ol6g2aTwuNoIhWlEYZxG
	oZSyjV4Vu/80e2+
X-Received: by 2002:a17:902:b186:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2b9a2546e2dmr41331905ad.38.1777602948495;
        Thu, 30 Apr 2026 19:35:48 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e791sm9341385ad.7.2026.04.30.19.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 19:35:48 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v5 3/3] hwmon: (ads7871) Use DMA-safe buffer for SPI writes
Date: Fri,  1 May 2026 08:05:30 +0530
Message-ID: <20260501023530.31160-4-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501023530.31160-1-tabreztalks@gmail.com>
References: <20260501023530.31160-1-tabreztalks@gmail.com>
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
index 75485a2c16b0b..cbb9a88229c50 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -63,6 +63,7 @@
 #define DEVICE_NAME	"ads7871"
 struct ads7871_data {
 	struct spi_device *spi;
+	u8 tx_buf[2] ____cacheline_aligned;
 };
 
 static umode_t ads7871_is_visible(const void *data,
@@ -99,11 +100,12 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
 	return get_unaligned_le16(rx_buf);
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
@@ -122,7 +124,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	/*MUX_M3_BM forces single ended*/
 	/*This is also where the gain of the PGA would be set*/
-	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
+	ret = ads7871_write_reg8(pdata, REG_GAIN_MUX,
 				 (MUX_CNV_BM | MUX_M3_BM | channel));
 	if (ret < 0)
 		return ret;
@@ -130,6 +132,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 	if (ret < 0)
 		return ret;
+
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -149,8 +152,11 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
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
 
@@ -187,11 +193,17 @@ static int ads7871_probe(struct spi_device *spi)
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
@@ -202,11 +214,6 @@ static int ads7871_probe(struct spi_device *spi)
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

