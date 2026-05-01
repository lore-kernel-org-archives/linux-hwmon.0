Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28F2DEA94
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 01:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777599066; cv=none; b=K2bAJkVpEYMvBwgHxJQ/sTI6UNrJ1/69TXEpnoy2EAonedM4bQY6KzBz5F6gMx3sfQ40TPnITLQoQAprjovK7UAoKzsDZSx9+AXkl6vPoBWCo4MAXqk3L/CSGG/9YkwxSkHeDTPMloqyWVcA1ZyzPf1SD0mOK3g8rgu0BlrXbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777599066; c=relaxed/simple;
	bh=EKkx0qAGk8EmonU1c8LsuFyByP9u2oAgYcmiWVB+1NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuK6lzTUoKPMJ415rMjOVafO2i1uRUU9EgLZpBIkw5iVSeM51sfAXeNm6EKmZNYL92R+B0VbrA3PxboJVHxI9VcruaWa4IcbjFCJ2PiCoJujOmXQ687iR/oLn/knqT/z7/jvqTVjeEqBRVhVTqiWmVi6KdTaQ9jkVC0dQgijc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG59a6QR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG59a6QR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8318293f02bso891153b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777599063; x=1778203863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkzYRzM+t1kh1+5fQMB7oUv5FKv1YyiwsIidKWapYTA=;
        b=mG59a6QRV42muKw1UJFSenVy98hs1vmpitirRzFgff2vEr71tt4TMZO45AssCOXh+M
         /RMch0wlSgEKVbYD1hnYxslJk+0abCApwYPN0IcfmcpqObdYQ8nludLS1WTjTzCsfUto
         j46XjOkoSF1iSAVNWVOie4sX+ukM8xSe8GqeHzIRQrrQxdHa1V1OcoNmzYuvsoz1VrCc
         kEyv/KEZjddIqXEEk0FTNXvmA7O/p0q8vAYjcctohBxHUDOCpF+eGGXH+u3yJ8/Z4RCv
         Z2XnCdBEs6B3rWCLJEQ/oAnfIHwYBKgn1U5SwkzUp7Q4Vv4KNPVvFrANEdkuvE7YWtQK
         R1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777599063; x=1778203863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jkzYRzM+t1kh1+5fQMB7oUv5FKv1YyiwsIidKWapYTA=;
        b=C0whA+sRoLykVMgHxsHYSZsSyg+uBJjLVYQQTE14f6Yhpcr/4qBc+YBbFFPkmH/ipn
         mZd9xleBzgJJdFh3FW7KYYeq2RZImYHS7UR/BWFYCLm6dLdg0X1BnJcjKPjljzPwFLdq
         jj/vPyt3LoxmrxBT4P3gyCZvYPL2F2w2MDEph7ygrJbIr5HTbmeRH1Q3ZYcVhQg6f7F4
         WxDTpz+XBeHuY4TSXc4Wgl4qKTpcO8oN8t7s18DzcTS3naorU0bzyyn7n94IsuPtw5MB
         qG91Pjjx4FDWRe1W9tnHSAiEDjklTxu3GHarVD//Cw4zILsjcimfdpr5IzaPsbdLOuhB
         NGeA==
X-Gm-Message-State: AOJu0Yzuu2uj4z7EBxYJ6VhLinAW3KmxIIMl0//qYpPtWVMrTrrg+LOP
	mCjYklvsFtPCkVcCvLqraqehczjtGqkr0C5HnrqB0p7UCRZkTsbusUfKqwVssbstRWU=
X-Gm-Gg: AeBDievMq9tEFIRqVAIfmyg28lH/0qnOgTsXBf3zSwdkt/tdWb34yUKUrkBwT3TsmwT
	mkhupO3DbhoHFd1FECFM11Ci8Y9iZBZ+T/rRii5fH52Jafp8Uc4rauXwux9Neha7wfI39+eIpQY
	4scMW0xsTM4bRNrPhsXkZn3N5o5GdKQiGwf7J0e5B7bPS1pEn5LQGS/le1Hecd6vimTbQcAm2eN
	AjTA/2wKTV+6DtDdfPpx4zsdn382a1WXGK6yh5FQuWjgPwI36/pxvKHBa235u22XHdrlsEIgOVO
	mg6a/usmRobPMKp/9OMIgk7s203o2S0tFKLBC6C+0MTHw4+FRhiMmZiMvsXAh5nKSmZdcyN20v2
	Wbk8rZEbI59uNtS/k2cjyZC5iLxTNvzt7h5MnrPyl/X7YGsBzqGE+CrhDd7vWpr0/xwAPfmSYfD
	aHAy5QTH1uuh6/1shQf7Bqxx1HHmvEeEJmU/QT6JPEXkF2xfTL9/itwjWKp24kaRWO0+GhY4vJS
	GbguA==
X-Received: by 2002:aa7:88c6:0:b0:82c:9c4e:66ca with SMTP id d2e1a72fcca58-834fff74303mr4459102b3a.2.1777599062635;
        Thu, 30 Apr 2026 18:31:02 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158a8432sm1014523b3a.20.2026.04.30.18.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 18:31:02 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v4 3/3] hwmon: (ads7871) Use DMA-safe buffer for SPI writes
Date: Fri,  1 May 2026 07:00:43 +0530
Message-ID: <20260501013044.22756-4-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501013044.22756-1-tabreztalks@gmail.com>
References: <20260501013044.22756-1-tabreztalks@gmail.com>
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
 drivers/hwmon/ads7871.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 3ee04719eefd9..01bd5c9ad841a 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -58,12 +58,13 @@
 #include <linux/hwmon.h>
 #include <linux/err.h>
 #include <linux/delay.h>
-#include <asm/unaligned.h>
+#include <linux/unaligned.h>
 
 #define DEVICE_NAME	"ads7871"
 
 struct ads7871_data {
 	struct spi_device *spi;
+	u8 tx_buf[2] ____cacheline_aligned;
 };
 
 static umode_t ads7871_is_visible(const void *data,
@@ -100,11 +101,12 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
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
@@ -123,7 +125,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	/*MUX_M3_BM forces single ended*/
 	/*This is also where the gain of the PGA would be set*/
-	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
+	ret = ads7871_write_reg8(pdata, REG_GAIN_MUX,
 				 (MUX_CNV_BM | MUX_M3_BM | channel));
 	if (ret < 0)
 		return ret;
@@ -131,6 +133,7 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 	if (ret < 0)
 		return ret;
+
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -150,8 +153,11 @@ static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
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
 
@@ -188,11 +194,17 @@ static int ads7871_probe(struct spi_device *spi)
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
@@ -203,11 +215,6 @@ static int ads7871_probe(struct spi_device *spi)
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

