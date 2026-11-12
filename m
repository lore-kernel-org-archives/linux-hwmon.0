Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516788;
	b=lFOcPF+WiL1KRXoBUDWW1VHFo+Ur+7kVuALld+WIndJqLyiH0xalRuRYpTE/he44qNXo
	 OjFHvuExZ6im2novRh6LTWu8OTfi36qYIKsQsg4XYcz4+KMDgL6YeDR0/8rO4i1TxtqWU
	 x0ZSWfJ9hDM/obJYoOucBRkJUX7D7SMP94u7pawUA66ouhQuWxuFoi/ezVEGkB1ctLhzb
	 WvKP0Vo+pCBzPRI2AVzfuGBkxMqKbb3OQE3ldHQaeG7uHPGZb2aDpQ/Cd6Tskptpd56Ii
	 5Yq2gNNE2xs0X3GGEHJLDcOOG957XzTKHkwSwSW6h1cKF2ISjzMtWMLlrGmTIvP64Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9Xq00oiLiGc2yCeGUcv5F3wCwBZ2E2IXMCXnDTbHcs=;
	b=oRTgkEM+CpH5ql26ihf5kRalq6Y2La0abmTGq68m8Mym9R/v0Bo4lpL7xlZzCw8UDy1V
	 eMcyzS/pK35y0zu6ohQT7XDCIqE7pfNrG8bVRNVUtsHSTCGtvXPmL2bivbIrvSVArfThs
	 8LBbgUHhFYjQuLPPNTiMhRlvEwtPmczUDGrFwamHWtQDzpWQ11qWUSMwOY+EWqwvakBcp
	 MWegHaVDmtt0Q1FWTn8TLJsO4+jiAs59MAF1AeiMBIn6gYjuTH8b0FqqFh7MNJPEupdcE
	 0LPEqnKpv4l1SgRmGy3k5HGxoX1Q/dhOqzpI7GcZpM1hvfIEd43gn96xQ0jaCrqIBmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj11fDnO;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59516606A33E
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59516606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj11fDnO
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so2467485e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516787; x=1795121587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9Xq00oiLiGc2yCeGUcv5F3wCwBZ2E2IXMCXnDTbHcs=;
        b=jj11fDnOHoMXE1/1iA5tdgvmutB9Kx9RAGeGlas9T56PIvka3YiTIr1T8DvxL405yx
         edBIGR9Dqg7gXrdCX1sDfyYgcbSVInLCtEFOpwQ56gp212OdAs8OOnKiuex0efKuv4+7
         pQsQaX4Jxwgdm8G/RcDhPWnL78DLcmTZsUHlZKKZnQ606IRDHnaGtfnJ4WCV00ybXIq6
         mdvDEsEeBAu2nxbDKOOgKZXRctvzlaB9Nkpay+TLLTNhbhdTp5rZZKhDneiHl2NRD3SN
         uCtcBMnVIhgHAlvqPtVUH42Up9nNQKrvlQdW8eEJZZSAFt+BM+N4OurBmSbCFnVkJVv/
         TjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516787; x=1795121587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9Xq00oiLiGc2yCeGUcv5F3wCwBZ2E2IXMCXnDTbHcs=;
        b=WS+PGQskwSoc0nhGc8XAXhzqIsFwwss6G2yt3dxtER0xIU1k4WXJvCS74BvRk0gtUH
         fSVpq6t8Q7Up2P1zqIcUGPlpfZxm2Uq5LWTc9NetCjY6dxZE6hwooR/fEgdZ7s5RAWOQ
         dabEoU0gJGlhVyH/BekBALfkLmZnttUIMWy7ss10jm/fA/tXRpty+wT0mY4St2RT+/66
         9LD4yyFIL20TDwvDAWZBhwZsJ8hT+S+9PLBsuxOJ0jhZ/7k3kvsVar6uFyrrVyqWgQlc
         sV598VqamOZ38bxuBGXK52YyzKnohfr1lyDlOE/tRVQT3/cUm/ZoCkeR/3psHFuhKpcC
         CFMA==
X-Forwarded-Encrypted: i=1; AL+hErG3WSMKnbWOmEIkhBNieCM4W823R6DBnAJpvNFRT5UMmqvLz9fQ34RbC8UNOlcDZ+JejJ2aVD1B1hjFLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cIHiHwEEOEIqc3/JJgkVX2SLcfTG9uTIEYqxMyE1ewFfV8bAP
	uGNgPqgieBfx10TZee2yXEMsjbcZXr3Jo1DjFjXOaX+HM7nuB2noTCqk
X-Gm-Gg: AYBFou1w92Q6Rcd1qbgJCdw6i0jkJJLqzbngnj12SLKMEuWfwN9UFQNBWPFaE8rQU7h
	5ymoPJNXVCYgEOzhr2ggz2TjMRHmD1LyKWcIuKFoda7zxT8mRyUiLr6eDaWkxDgGabkQcYlQ388
	kNTgigK0sPG9E2aJexZdY39Ph3HTWU35xlmj3lFNoJ026WQ9rfXvJKab6vukyeIlsQJ+bYto1zK
	VmrFetX/JVHonBeA/sFQW5lQ6PyWiiRFHK/StfN1PmqEvRer4HEgZ+hgmY9CoV5L0YeUOLBIJFL
	8iEmd8MyvaJnviAdwRRXADUQ83Bb6KR2ZPN/ng9QWutaLIf3At+rEwQaiAAkoaIKEHnKfX3tNIz
	XHvXXVwj2YumaemZzn1Sn4nsDa7Zwp/W4fSJpgE3GQZrfA3L+z5z4jvB9CC1C0Mfn177CEkW58o
	LdY9qDdUGq6RVGPyoYkBpLloVFoIHQ1cVuFKRKBvLwLsrfWAEHjA2LabY10FHRKyVyqF9wbqq90
	P5/0lEr/rfxLbvDigzf21GhOIXWZEn2u4vhJTP1VZstjVEVisvSQ9Ejc50rY0LhpFqBK5Qlxk72
	HMYKQnwpvqlqyFySwSg7TrU8SrjTrlDol3Pkx4ekThtwI1MmY8TSA/5n+chgHxgQzDthj/JDh6j
	eDrN6fuF9
X-Received: by 2002:a05:600c:8010:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb55a6a5f0mr9195935e9.19.1794516786608;
        Thu, 12 Nov 2026 12:53:06 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:06 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Mark Brown <broonie@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while the rails are on
Date: Thu, 12 Nov 2026 20:52:27 +0000
Message-ID: <20261112205228.42630-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112205228.42630-1-pmazzini@gmail.com>
References: <20261112205228.42630-1-pmazzini@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver enables VCOM at probe, which keeps the panel's high voltage
rails on for good. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index a0d0b4119bb3..a8bfbf1716a1 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -9,26 +9,43 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/regulator/machine.h>
 
-#define SY7636A_REG_TERMISTOR_READOUT	0x08
+#define SY7636A_REG_FAULT_FLAG		0x07
+#define SY7636A_FAULT_FLAG_PG		BIT(0)
 
 static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *temp)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
-	int ret, reg_val;
-
-	ret = regmap_read(regmap,
-			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
+	u8 buf[2];
+	int ret;
+
+	/*
+	 * The thermistor is sampled while ON_OFF is set, but the first sample
+	 * is only ready after the ADC sampling and conversion time (ADC_SPL +
+	 * ADC_DEL in the datasheet); until then it holds its reset value, 0.
+	 * PG is only set once all rails are up, after the first sample, so
+	 * read it in the same transfer and report the temperature only while
+	 * it is set.
+	 *
+	 * With ON_OFF set but PG low (rails still ramping up, or a fault), no
+	 * temperature is reported even if one may be available. That is
+	 * accepted: the display driver reads the temperature only while it
+	 * holds the rails on, after power good.
+	 */
+	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
 	if (ret)
 		return ret;
 
-	*temp = reg_val * 1000;
+	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
+		return -ENODATA;
+
+	*temp = (s8)buf[1] * 1000;
 
 	return 0;
 }
@@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
 	if (!regmap)
 		return -ENODEV;
 
-	err = devm_regulator_get_enable(&adev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
 							 "sy7636a_temperature", regmap,
 							 &sy7636a_chip_info, NULL);
-- 
2.52.0

