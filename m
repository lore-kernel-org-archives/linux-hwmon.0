Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D572C11CA
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777687745; cv=none; b=r2s3zX5q2pozatd74U17fkRZkL2pijM6GYLMwPDCMo3t+dJX69EkbDE/Ros1oB+cvyzy7bcFBMAQZZgJzijzuSUc5A1QxQFB4bJ4QZMu7HK3NH1x52L4dzYFFF+tOD5mb3M3RxdyE0KjRoaRtdFCofS477fV99HAz+gzN+faZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777687745; c=relaxed/simple;
	bh=0h5BEMG7ZbzlYE1qYJc8sPYWwfEyMLY79w8gc6hehOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVnYfbh/M0AdlXY+r5NeoH1KTRFt0AiWlW/Hum89hfXbloQBNAH0rTj4VnEtYfj0Neowl8+O0/buVPrbHgnp/4T5Nu4XlSvf/F5EbtNm5pAfuysTvad8CSVHemHID1dOJjXVW4PJSl0tSmqZ8B3QggP9KYwKqSRL4ZuM98u30cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4EKpbFZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4EKpbFZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b23fcf90b2so21917895ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777687743; x=1778292543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv+LaawXWM5Be8S4ugblbJPLa3ayLH0tuydTTKYUZtA=;
        b=Y4EKpbFZuiIRAzAdG+Vq8xHc7oo4RBjvdp+yMxrn2FZ27dU9t4ZZvgqVxiNBbc7vOj
         7Nf9lcRIHiq+XYZ7RBh7gBlo/+N0lbRSVtG6Dw5uBB1Nsuv4T6E/iD/fQMFOAlkqBQAs
         MunNPP7Ums1DYhEfmRz1bhivCFZPP+8Xrpo84FIVAjPOW851MQQM23iWAnLBjR4VH/5V
         ZUuXpeyvDYvRAnKbFGTCl2Rs4wN9fFLcCRYIi8SaqbMmFTGmK1y8OiWCvv+AG9EawIvV
         2dmVaEJfGw/DIZkDrx5nz4FzGpys2h4KogoOXxLZwKIRbR7Gl0OLZdfW+4niIFEGqU7a
         9ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777687743; x=1778292543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fv+LaawXWM5Be8S4ugblbJPLa3ayLH0tuydTTKYUZtA=;
        b=dcZE9af3nF6+ZdMNgxPh3vJX42qyWq2GjgjV7EKTodOZ5bO6nwncrkzptjqv2BLdlK
         lR76cxwHpU52mnYRotH9Gq4HIxDHbeDOzBQDqaxDTZJoa0EsF9rC8fx8AasAqxPNkZTI
         2XBw9dUE9zYwZ3z0oJMjhbud2Qu1jUG5t1kgKfwEyEd8eI336+O34OQgEux5EYGErNdl
         S3u7+tJU1QfAAaFRiind3QrLXLz9v/90Nj21TRj4hUdSn2DdMP4vljU7v87VMgtXP4k7
         1D8keaZS2DYSUie1aFU5WYqqzt6USUsuCmyi/KHY9EpbGWrA7xrVbPgOJAmDIcaYNQ4n
         E2Dg==
X-Gm-Message-State: AOJu0YxOGqsZyr/498sVWPxBzYinnqCPebun8TkyhmmKWHUWXo1gK7Xq
	b/HTNTNJTFCbuf7/UWO+4Z4SgEnipBKWuahQ0baz3BBsqyohOTwsHzXQ/+H6qQ==
X-Gm-Gg: AeBDievxG0FunnsPI2wgMEDhZ2ByGQkw7OkB8FxKKFGmqQ54MQ/KmQODGCxVf+uKXoD
	gBJ3JQsDuwh1Si2TWhwSz5U0M0N1y9eE9JG/pj+OIIkBI/hEQgCYxniCBOslsVn/wKffcwjY/m8
	jbXdriGBKj14/l7HSZ04VGwuqmolWef9e5SM6QL6IUhD9wZ4HV+GroxokA5I4uULWwykZt1dPB8
	BAdDXYSIi26utXC/bu2AZJdQ7nPxGyYISEYdU0kUyVzo+iBuXk2Jptmtp5zGHhKc+j6rWOM+dR/
	h/cienab5xJHHt65Kh4I4zxEPwY0Yqx1eQAzK8/JZvM8x9fR7zFhDaf6nc7QJ8Mh7x2h5Ob9UYG
	dGEQvP5B0FM1fFLFyfE89CP32UaRXly3H/awNJ7hf75G4aHusR7tNUQDn7ewd73IOrmzQhHQ6w8
	aes2oBtvHjVR647Q5D0sGS0ooK4+h8J+4GwCSNCpjamZLwDvExb9p3HsN4B89MnyhCqaGkRIgy+
	qYLqw==
X-Received: by 2002:a17:903:1984:b0:2b2:ec46:dfd4 with SMTP id d9443c01a7336-2b9f25df2fcmr14482125ad.22.1777687742996;
        Fri, 01 May 2026 19:09:02 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae39e91sm34519135ad.56.2026.05.01.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 19:09:02 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	david.laight.linux@gmail.com,
	me@brighamcampbell.com,
	shuah@kernel.org,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v6 3/3] hwmon: (ads7871) Use DMA-safe buffer for SPI writes
Date: Sat,  2 May 2026 07:38:44 +0530
Message-ID: <20260502020844.110038-4-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502020844.110038-1-tabreztalks@gmail.com>
References: <20260502020844.110038-1-tabreztalks@gmail.com>
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
index 8ffcc4c823a60..83ea09a935bc4 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -62,6 +62,7 @@
 #define DEVICE_NAME	"ads7871"
 struct ads7871_data {
 	struct spi_device *spi;
+	u8 tx_buf[2] ____cacheline_aligned;
 };
 
 static umode_t ads7871_is_visible(const void *data,
@@ -94,11 +95,12 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
 	return le16_to_cpu((__force __le16)ret);
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
@@ -117,7 +119,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	/*MUX_M3_BM forces single ended*/
 	/*This is also where the gain of the PGA would be set*/
-	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
+	ret = ads7871_write_reg8(pdata, REG_GAIN_MUX,
 				 (MUX_CNV_BM | MUX_M3_BM | channel));
 	if (ret < 0)
 		return ret;
@@ -125,6 +127,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 	if (ret < 0)
 		return ret;
+
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -144,8 +147,11 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
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
 
@@ -182,11 +188,17 @@ static int ads7871_probe(struct spi_device *spi)
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
@@ -197,11 +209,6 @@ static int ads7871_probe(struct spi_device *spi)
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

