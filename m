Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164D1DF755
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079253; cv=none; b=PToTRyYn50TbOYCBFoKtRSRyL+MXB/3v0B9k9Jgdts/Q3l4f3zDsEO5KEQemGzHjrv7CkpBlf3JLQ4Mn4zsLVILnH0z+C2Uv0u2PTD5Qcq7d10URuHNvhc8svuU8Ktq14pWTztD7dpA2yA5Cw2SGTSKzYeCpljilhVJKlUubvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079253; c=relaxed/simple;
	bh=eUVRveT0QuJE/mglDXQJGhC1AZVO9YeFB5k9dTJw7jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeTiVOqjaTEBzv18AYaQGGmmDZGUcDCagMjhYs/wT29O8d6SzPOg4/FWC8y4aBGOECOfrOwwi4wq7o3rwqgV1pkWe+IhvxNMDnlMA32s6BkJJprxnDA+UER2m8MtgnIZzqbCVteFX+3lHITjLS5FAhb32+6KgzrlRcFS6JPRhcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdwawtdS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdwawtdS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2393285b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745079249; x=1745684049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29FUw9/Hxgix1Uz9WJce15eOGjKrI/6EwisvQKPr4DI=;
        b=RdwawtdSTt98Nb/ZQKTBC0KJTR9m3LDrNcC0EULeH1TnPzrXr2Qk3Xc4RIlHnZr0wL
         TbAM/Ez7ocoqTDdXDcPbLubypE0T95BVAuLs4lZ7XoSQCp1sFS/X+/p8WDjPp1qWw+8w
         LYpKG688v7mIHkZPCW8ML9X6w3k6CP4eihqJKZI1g3xKEkLcI/cohiCwGxpsFf7sAlMN
         A1X4RLRHKmuDiXrwa9BIBh5V7lPtHJ8+FgbImPupIfrlxvp/5EaizcX+UQz6QBrLOjfC
         sK/bNPOXSASUcjM5ST/3Doefq7ofR2F6mLrXdRFzLlkthUvkimaZo4zIYk+mz0k5gHhM
         +Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079249; x=1745684049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=29FUw9/Hxgix1Uz9WJce15eOGjKrI/6EwisvQKPr4DI=;
        b=ZC58Sxodhsvm2Wj0rhezxZQeZHw/DXlcv4xYgD8PXECfMI6aZexL/69AjO3SLnFqM/
         O/UvRM/txGQRwcJ1LghHjho7m4OslEdxYh2cQBpvVCR/e3pFChHb0srlWGUYdrX7/MYp
         JHRHvXBWRGhDOs0QsPOaUTW+QwC9MfY+H7PyCTVNmXFi+qkti0PT+KL3kTVAgJkD+6J5
         q17+xGihVvYIRTQwcTBG5np8dwxWEkM9RH4wElbL1x+GanMt/wHQO5b0Y97lRvU8UVlo
         6/YphSibY+EVbknOLXWKt50lt1C6fsIm7yNmbEhyaqrQPPSKBHSghFZwMzXPKaos5Wbw
         WSQQ==
X-Gm-Message-State: AOJu0Ywb1exQsLOR04FOJicdqNtIKqPI3BaycYBobaIcF8UwPSbU6J+M
	2qz6Xi+08YIhsEWU2Tca6ewfBwmPiNO2VytXi97lNaqSTYqqSuY3mXj5Ug==
X-Gm-Gg: ASbGncuniHVgpcC1KHUQmFp2I/HfqvaPbwh6++UoKYBsfUXi2jnn+8MBsPABcZXOQDn
	70Q1n04vFotJxAKJgffVs3n27CaoahAbTVjXdNJV7Y+9QhCXF3/mgkwHSYXJN2bD4LyRd0cgC8d
	eyAql3B/Tz1XfOKvG1h+7mI2oQr1WWvhymQ7eGRA5j/mbzdlJum2ylzUrfHGu+T8NiUajIZdUqG
	a1OE9ILFJSdwMEI64qo/SnCqTKGZ1WHnvE0L7ls7tcpaYsSlS1TU7RSNxHGTwvU952XEeqWDhJd
	YV0cEurKyATebidAW5X8V7xoSX8qPsC4VMbhhN88zMWTr5bCRDRb8A==
X-Google-Smtp-Source: AGHT+IE1qocqkFQdIhpGYJv9IZiBSW49lHgclQNZsKmjng4WFIJDFu44Iwhxhdy8UyVzUNSZ2F3s+w==
X-Received: by 2002:a05:6a00:1a93:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-73dc15d8753mr8088114b3a.16.1745079249295;
        Sat, 19 Apr 2025 09:14:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5960dsm3477926b3a.87.2025.04.19.09.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:14:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yo-Jung Lin <leo.lin@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] hwmon: (spd5118) Support 16-bit addressing for NVMEM accesses
Date: Sat, 19 Apr 2025 09:13:53 -0700
Message-ID: <20250419161356.2528986-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250419161356.2528986-1-linux@roeck-us.net>
References: <20250419161356.2528986-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I3C uses 16-bit register addresses. Setting the page through the legacy
mode access pointer in the legacy mode device configuration register (MR11)
is not needed. This is similar to 16-bit addressing in legacy mode.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index c5ad06b90cbf..92a3cb0bb515 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -66,6 +66,9 @@ static const unsigned short normal_i2c[] = {
 #define SPD5118_EEPROM_BASE		0x80
 #define SPD5118_EEPROM_SIZE		(SPD5118_PAGE_SIZE * SPD5118_NUM_PAGES)
 
+#define PAGE_ADDR0(page)		(((page) & BIT(0)) << 6)
+#define PAGE_ADDR1_4(page)		(((page) & GENMASK(4, 1)) >> 1)
+
 /* Temperature unit in millicelsius */
 #define SPD5118_TEMP_UNIT		(MILLIDEGREE_PER_DEGREE / 4)
 /* Representable temperature range in millicelsius */
@@ -75,6 +78,7 @@ static const unsigned short normal_i2c[] = {
 struct spd5118_data {
 	struct regmap *regmap;
 	struct mutex nvmem_lock;
+	bool is_16bit;
 };
 
 /* hwmon */
@@ -331,11 +335,12 @@ static const struct hwmon_chip_info spd5118_chip_info = {
 
 /* nvmem */
 
-static ssize_t spd5118_nvmem_read_page(struct regmap *regmap, char *buf,
+static ssize_t spd5118_nvmem_read_page(struct spd5118_data *data, char *buf,
 				       unsigned int offset, size_t count)
 {
-	int addr = (offset >> SPD5118_PAGE_SHIFT) * 0x100 + SPD5118_EEPROM_BASE;
-	int err;
+	int page = offset >> SPD5118_PAGE_SHIFT;
+	struct regmap *regmap = data->regmap;
+	int err, addr;
 
 	offset &= SPD5118_PAGE_MASK;
 
@@ -343,6 +348,12 @@ static ssize_t spd5118_nvmem_read_page(struct regmap *regmap, char *buf,
 	if (offset + count > SPD5118_PAGE_SIZE)
 		count = SPD5118_PAGE_SIZE - offset;
 
+	if (data->is_16bit) {
+		addr = SPD5118_EEPROM_BASE | PAGE_ADDR0(page) |
+		  (PAGE_ADDR1_4(page) << 8);
+	} else {
+		addr = page * 0x100 + SPD5118_EEPROM_BASE;
+	}
 	err = regmap_bulk_read(regmap, addr + offset, buf, count);
 	if (err)
 		return err;
@@ -365,7 +376,7 @@ static int spd5118_nvmem_read(void *priv, unsigned int off, void *val, size_t co
 	mutex_lock(&data->nvmem_lock);
 
 	while (count) {
-		ret = spd5118_nvmem_read_page(data->regmap, buf, off, count);
+		ret = spd5118_nvmem_read_page(data, buf, off, count);
 		if (ret < 0) {
 			mutex_unlock(&data->nvmem_lock);
 			return ret;
@@ -516,6 +527,13 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
 	if (!(capability & SPD5118_CAP_TS_SUPPORT))
 		return -ENODEV;
 
+	/*
+	 * 16-bit register addresses are not (yet) supported with I2C.
+	 * Therefore, if this is an I2C device, register addresses must be
+	 * 8 bit wide.
+	 */
+	data->is_16bit = !!i2c_verify_adapter(dev);
+
 	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
 	if (err)
 		return err;
-- 
2.45.2

