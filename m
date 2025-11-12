Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE030E0EA
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946288; cv=none; b=W/r/mk5yeuNVbHhijoV8M5X1nLuEZU1OOW5sXAZOgEgGnEVrnl54r4LKsuiISHjwISe5OaRE/z0YS0zFM/m+sIY/TNM4+vlxJJXIeytUkHkVzak4LWAlJi/7sjUgi8/6CQaq51j/UidyjMZVVUdoaOjF5o+CnRfbPPPC1ddF07U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946288; c=relaxed/simple;
	bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2hIl/3hz93exil/AQWe0HjDWv3hfTJKlh0HKatT/DxnvRLfzBYKAm0CMM1H8yzdSNhoSzrABnGaKKuRNhK4qazJk1quUk2+GCAx+bAr0XRZ33hLWW70LtMvtCOXLz1AFWfPqjtDAaDIx0G+EluQiyH9viXNqwY0bLRSg+bqsDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2ch7Ctl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2ch7Ctl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2980d9b7df5so6178755ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946285; x=1763551085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=I2ch7CtltF7ZjK8PZWnMl98TvD+vcCsYo2nQMCkMSJfgU+/XI4nsU8MeXURmvBMj0V
         dggQ52R1mlyS00dRB/AokCUpPEKXsb3WsP19jw+GnufzI3SVI4CsAvbIdrCHrDhwPrNU
         QG9O2wYsoM1bqcKVJwpT1vF2ZuehqtiayXshaPda2+Cz6kqz1sOsT7NKRSwD6nizSoF2
         L+CPQBUGGrJ/H2fFiGjaCypKEfbxHK3Ry4GxQ52QPFma2CrPA5Z2PR6VBDtr/jNdDRFg
         VBu/cJnWDGfx+92e40SEdgke9g2+qLGaUA31i+iP0QElbq6HdjJpfCYi/fgY4QHquRg0
         hs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946285; x=1763551085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=X6KA+B9Iv3UNvibJ/8SDKFggjAR3a8Aq7WOC8XO3PPPu9y/jho0XCXP+Jh9VXV767v
         u3liVgsqaqn8A0OxK5DW+/ZxtkJKlUngohUgzbCAO38NRUbyhvsve6o/MtF3B/bVLeYt
         N9S1SiYa3LEGLWG3rERmEuDT4naptSMZkwjv5jJa0CjQj8T3EtNEgEJ8EGYcT18Aktq4
         i5InGkZMercovdXUruQx0WBdEQ2aL+1C3o+GqxC843H1Jmnwgg8H40jSDMFhOgOkobLd
         JwpVMtU5hq4ZkL/z3BWqmGOcE70t/8ROC5zEOfT/VUuutp3NPeAmNnCfWMOcbtAZEwCO
         81Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWWBAZ1AKKOYqH9mEkh3fYsaEDHr+I4J+4SLTZgWCwgU7K1Fun/lWQbSq08tF/77XixoQvO5ryH3g7P0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4Hh0ACpFF+dyY/zdeCLWP6f/OD2dm0pcLLINAyookp/M8fFH
	+UE8FsBuxhv8Ai76SKRo2ZO6w5aRqK+/Q1m2K0imlZPNZgpfzp7ZUv3SXl0qwE7hJtQ=
X-Gm-Gg: ASbGncvgirCc3MGNMJIKKkYfjBdM8hEFjbsrUqeDKvXl055SFFkqe8zUZ3DHFAm93b/
	Bnxhb2x2Lm5vuePeYCMXm5Opfd6jT631Vbr54mE+3+oJ/Wp3kHk04rxQGFWNisC/Su1Mv2fhzL8
	E/KofWQ2wlBKa4whQjWkBKBXoaFa9/Q11WO979i35usjYP0MmGIQyJVmx8vTnOcZCjJbV21zaOm
	HxoDe8lwrE32NILOvx/fLhzb7mctv96VXk2/T53jRY+LeCv7i7PjK1xr5bY+Ze3ZlldeRTogogu
	x6wfZvrVaKQktEfhLoK3YcQEWFwGgW5RfYIMdSDwbWboO4a2TlTfZ5xKOONxG6/Wq8NR2Y/bj7b
	1N87UDKQxkTH/prqlUWYk490FqLBIvdQ/4gvyW87cSeOTpa7Xv0yDf+vLiv9mftIoE55r6VvOds
	zsKFy9OEe5IKPRmsPraXeLnkuka0H84oYAEn5Dsj2l0le7omAV54ArnjXqJ86/4xueSzAhD8bkU
	LpSw/mVylMaqVWXrjpVNHmfFX4ReQfjVqKL6k3enHDHXmXDlHrrjbQ=
X-Google-Smtp-Source: AGHT+IHA0P4UnsPFIhj4utJwEq6rWs7Nkg1EY8pIQ9eKSlMotkC1tp8iAeDrvqrEcOWVVi+EwKFK9w==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr35066775ad.46.1762946284740;
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:50 +1000
Subject: [PATCH v5 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-4-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUeYXSp6HTiumdkXFc1P4lS9PK9pZfHi1fzZ2ef4u
 HINXwV1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MAptrWmuF/hdDOyUmTfkptiMp9whlc1h/rFWiQ075Z8Ps7E5W4r7/9GRkmt8XcOv9
 ZLjFA4cGDV3ZBzGeuTKy/kmDxwz4r+r3ILmcmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.2

