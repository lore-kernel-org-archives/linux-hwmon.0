Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B7223322
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 02:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777602944; cv=none; b=WiCBe594zSSMhOuSyGd4vqMW1z4evlhm2di9nqo1+kT+dyREIm5K6gLZNEOfQozpAkPI/MJJTsSgmxLk6ehEt4YYusqoPwImW1mkCmoigOcHdz5WU9m8Zk2IyhajAu1D8SxUCvgKYdoFDojHRRiKKriwm2ocIat2t7PH/yZ7k4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777602944; c=relaxed/simple;
	bh=Aocggj3/ePT4e+jesYw7vvuMFmGQ27GviwPBpJeA378=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdS/tTd/LMskY+F8r2t0mHxgdci/E88i1QFy8SJflVxIpt6p+fvbNeYriOviM+tggeUl6vTPvN3nbgG7kuZu3ir5Bryk/DzfIsf2zo/miTrSw9pfB1wVWhlFM8oJ9bQ2C3ndoBow2+9BVp6dZHbbGQhD1aCBBJeXWnrDXlUIzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAn1fXZH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAn1fXZH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b7adb38d65so14255975ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 19:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777602942; x=1778207742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSfAJ6VemJUOPmI4zNJhVr/AZDIzWGdUsU6uHQklRW0=;
        b=rAn1fXZHJD+cUUsNuJppNI0jtcY1SFSTZVyVBdvAFMZTgojUvRKFZXlBPLUNgOHGue
         yWgWeRPoXaAVzjyb37PHmz7AItj9wTOS/6ufQ64UmuiPrsKSJGwXyDyuJKRkqUc2tDEK
         OJdBX5PThwYjzCZnEduTwOOw9M/fr0xYv1DakaL0ixSTN0OwZyJV/quHTqlkpHsD8ZA6
         gPIUCp3BDXPl0jYB6E5DiYPWtUrcVaP/xSdvOzlWnlgaUnYIueNVdN4M9Mvpas2+rdmA
         8iQn/G8cdTFOWmEDGqECbOeoo5rscT1G3DrtQ3rkzzSMv7xZZ5UONycKyTBNmWpBiOIx
         efZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777602942; x=1778207742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSfAJ6VemJUOPmI4zNJhVr/AZDIzWGdUsU6uHQklRW0=;
        b=BIQrKWtt873hj+5jkT3XjdtLT1lSMQ6X3NiggwcO3sNsESmVSNz135EcRy2J3jIN6H
         4MHjCwH9/ffpZQcxikOnpz7AnZtcmMPMkMc5fZ/9Zne2xV9fGSor8c9/RXX6q9csVfaK
         YeNBH+cajwnsxSmV3yf6Gy81lFIyq04SyMPhQwN7dcuoVn2qWPF77NIvIMBCqs7L6JLg
         GU5oG7eItqsiuwOqzYqj1AePuEoaGNucsx59Wp/lsGh73pynrI8VwkFYknnzkYRGsftt
         2uspGxp0Se61RYmlI/s3jwDTRSTTY2PizPS6jPr7dIJ65vW2NPWeUj1FDYR7ZTD52sKz
         eecw==
X-Gm-Message-State: AOJu0Yx9x8lTzSOSmu7XNZFcxJgHaq2jD9JA4sSbvUNE7A92asPNNMV6
	Ue+QGpe4cQdNODtTPpY56HkdC7GHAAJEQrdQSdrbiIalkM7GHXoTQsZw
X-Gm-Gg: AeBDiesXvHOKbSj1jGcdp0N9l1Q222h4nTtc7QITvhXVR3AA9PNUlH0qlXx2vW4TNV0
	KPxRyXaMgxBCcGQHlTB0zwPG2+OH+dV1qya7+fZihMH/BWdeeKq4x0fPZ/Uu87AVdQjl+mNlWb2
	MKjJchXXbKbm3UjOhNptgUHwIp0u9H3BRzc3u8aAtDm6h41mTY7GBKVanFmlcaSi2InkPyTsWaK
	55tCVdwiOyNt24Vs/UC5rJy0Y6J2/S3vMAVaJsfRrKNsY9Lj9SskCrhEwXrORpUaaw/iDcsrTik
	4I89azyDl4i+r98LPI04A91qOhCZYeYJuuYbhlcVIW9Y3jtwGd7byQMS3vJ2GZdMUBgbaO2RpVs
	PRLM3sATVlif6b9FC2WBBRsMEb79O1otPrpW5b5VxuUalG1wcbeEkliwktp6E+NKiOTIOBtCNJU
	Ij5rKuPx/BPH+EsU/dQngnbfwXdyPzieKcCGCyjz2+lShCa0/rNOZOOmq8y+0UKihwxHT4wmfya
	VhfjBh52mrfEgnO
X-Received: by 2002:a17:903:2ed0:b0:2b2:4a9a:b168 with SMTP id d9443c01a7336-2b9a23175c0mr57603095ad.11.1777602942231;
        Thu, 30 Apr 2026 19:35:42 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e791sm9341385ad.7.2026.04.30.19.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 19:35:41 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit register reads
Date: Fri,  1 May 2026 08:05:28 +0530
Message-ID: <20260501023530.31160-2-tabreztalks@gmail.com>
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

The ads7871_read_reg16() function relies on spi_w8r16() to read the
16-bit sensor output. The ADS7871 device transmits the Least Significant
Byte (LSB) first.

On Little-Endian architectures, spi_w8r16() correctly reconstructs the
16-bit value. However, on Big-Endian architectures, the byte swapping
causes the first received byte (LSB) to be placed in the most significant
byte of the u16, resulting in corrupted voltage readings.

Replace spi_w8r16() with a manual spi_write_then_read() into a byte array,
and safely reconstruct the integer using get_unaligned_le16() to ensure
correct behavior across all architectures. Additionally, use a u8
variable for the command byte to ensure the correct instruction is
transmitted on Big-Endian systems.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 9bfdf9e6bcd77..d77eff430935b 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -59,9 +59,9 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/unaligned.h>
 
 #define DEVICE_NAME	"ads7871"
-
 struct ads7871_data {
 	struct spi_device *spi;
 };
@@ -77,9 +77,17 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
 static int ads7871_read_reg16(struct spi_device *spi, int reg)
 {
 	int ret;
+	u8 tx_cmd;
+	u8 rx_buf[2];
+
 	reg = reg | INST_READ_BM | INST_16BIT_BM;
-	ret = spi_w8r16(spi, reg);
-	return ret;
+	tx_cmd = reg;
+
+	ret = spi_write_then_read(spi, &tx_cmd, 1, rx_buf, 2);
+	if (ret < 0)
+		return ret;
+
+	return get_unaligned_le16(rx_buf);
 }
 
 static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
-- 
2.43.0

