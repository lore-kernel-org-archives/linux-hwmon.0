Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B1E1E520A
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198175; cv=none; b=o81qgR5WB1P9yskN+5bD68oNyMz30yhf97548j0jR5rQ0JEGJ/iJBlkT7CJylq91RXic0oiuR9DcnJN5oxa1+QnTikpZ11aKdpUblQDfmA2rtAn9RCRkzBuFKNOM+CO2xK/zqc4JWvRIL+GDOq1OzwNZJvSXGM0nTmzsE/K1pO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198175; c=relaxed/simple;
	bh=wFnkSUxoYQs64deDm4md1UugE+lxjqSSKbZd1i66CDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LnQsy58dsYpaZaZoFovVFtxfs/e3Ac4UcfIBhRULF2pHdjzx/OMGFcFqeLl1/1n90f0+YHHLM97RLx3HX3QeQzUOd3SvqDC0WV3jfYYQVdj9QbOs9QoWmGz1aSDAqBq0qk08x/AmmS2UqygS69yf8zVMsSytcX4jFJgQpDOLPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgNSvdqC; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgNSvdqC"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81dfdbd86d1so31066697b3.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198173; x=1785802973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qMd5YuwwfiN67Wq+l9yFaJ3wbJ9/YjqS4Jgn0/FeAo=;
        b=lgNSvdqCuApejdw9lu4xZX/r17qWjcHrMhOc663ug7a2jeZ8W5bnOASHIM2rI6U4EG
         IeCp4tGyVI7etsrVhGIS549uthLzJ0IUvEEBZ4EjpFMt1cv12iEBJ7Tgy6ivuHFLRzuF
         82HXcKKLVJFb+zU0PmK2uDTm28G2D0xJ2Z9GSEC2wlHnmRn6Fp8B5wJP0Ld3wgOeuUa4
         sToCMfWcjENAj1cRtQkdht7+p8s42oSS5LW/8kSnlWF2DNMaLSB3K0XpCMsQNheoqcKC
         ogxxLFddSLGnv31fYZ6ADoIAB6e4vWZfUtgxR/8BTPJheq10HlNRzEYt7zeTSOJBlLhT
         PiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198173; x=1785802973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qMd5YuwwfiN67Wq+l9yFaJ3wbJ9/YjqS4Jgn0/FeAo=;
        b=o3MqSeFbokSSJ8SuMi4QtqX77trYEmGQ8Q6eG/i3kkN9N9bzyy/t/SMjakYAZzUnag
         UWNIdp52r1+1uqew1JK2Xduf3FLeIqjAee1I0/u3AfhMoKNfWRhkjullvzdoDpSEbfZ1
         XLYC7mtYclWw3gegGPYiRCP9v72lQHksM3Z3vQdIOjG3WtzblwpXhOvvjbjQ+SYMUoJF
         CpssWfPu0M9CTwohPm1DeBSWnO2sLQgpZIoB8HvAK+VB5sptt4pkhVbQ1P8rv3QtMbES
         U8+DJ3B2N27Lezph/ZJp1m/KUaK77XkMRZYrBy+j2TVALcUXe31K/hZ0xod+Dk166fo+
         5A5w==
X-Gm-Message-State: AOJu0YxZ+R4gjhwpQvxDbCkS9eG/UxJQxXz+Oosoq97fSqh4A+USzPM2
	LI2CsattkoqAZPvYes65EEy0BiEe/GIUxgqmpCNJY8xXloNPhoE8EyrrNIKF03YU
X-Gm-Gg: AR+sD10TePefDRQvfxbLrsqIqLWG/A0l6N8P5HrSLzg38k5Yd8kNCe2pEDZkgHx+ljJ
	5BQkrZk2GsRRQUuU8bVhho+K2S0wc628M6Vwvh4thVli4FOIZ4KCDuikc2bObMuX58082R9rO7w
	Kh8mHys55f3pDIvKaY/y/4iQ78s58SUATJtRmn4I+gSqxpbbZXHsvkrna0RmDAxeum6v9GXWOKM
	X/I0/RxiSMD+kAZ1T9QfuEtdpUTf5yZy4AzY1hoP8QrpGf0ubWn+fImLrx2uPFQcJDCL1sLz9ct
	Q59SVxg6312VLr1SIy0UaGSU1tCiZPuNGTHgtrX0I/Q6ar8a/gMshcziy70jwnlQO44ZZkSZVV3
	IIPTFlsfp3DazCxWaUilFWPXx9ccL0yWkpBSR1bcTPB8m89M2rnYmCEd7J6SkF8iZzMVwDyhiDO
	kAMv2k35kNuhZA3r/Waw==
X-Received: by 2002:a05:690c:305:b0:81e:776b:ba51 with SMTP id 00721157ae682-81f9923f195mr492387b3.58.1785198172999;
        Mon, 27 Jul 2026 17:22:52 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:22:51 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:20 -0300
Subject: [hwmon PATCH v2 4/8] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-4-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
X-Mailer: b4 0.15.2

The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
currently defined with swapped bit values.

According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
Configuration for register 0x69 follows the exact same bit position
layout as register 0x68:
- 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
- 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
- 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
- 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40

Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.

This typo did not cause any functional bugs because these specific
macros are never referenced in the driver code. Instead, the driver
correctly applies the configuration by relying on the modulo parity of
the channel index (e.g., `channel % 2`) to selectively apply either
ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
Since the bit layout is identical between the two configuration
registers, the hardware is currently configured correctly.

Fix the macro definitions to reflect the datasheet accurately and
prevent future bugs or confusion during code review and refactoring.
As this is a purely cosmetic fix with no functional impact, a backport
to stable kernels is not necessary.

Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 0b19b0925d1c..a34635526aaa 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -70,8 +70,8 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define		ADT7470_PWM1_AUTO_MASK		0x80
 #define		ADT7470_PWM_AUTO_MASK		0xC0
 #define ADT7470_REG_PWM34_CFG			0x69
-#define		ADT7470_PWM3_AUTO_MASK		0x40
-#define		ADT7470_PWM4_AUTO_MASK		0x80
+#define		ADT7470_PWM4_AUTO_MASK		0x40
+#define		ADT7470_PWM3_AUTO_MASK		0x80
 #define	ADT7470_REG_PWM_MIN_BASE_ADDR		0x6A
 #define ADT7470_REG_PWM_MIN_MAX_ADDR		0x6D
 #define ADT7470_REG_PWM_TEMP_MIN_BASE_ADDR	0x6E

-- 
2.55.0

