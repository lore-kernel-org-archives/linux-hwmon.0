Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383F2D97A0
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Oct 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835872; cv=none; b=ivYisfsC8Fu8CDQxpjy3XAcPgIT9Pl1JscTQudSBTLAU1bvmvNnSql0WmnuTkK/r7qMvqF2ilXAwkynccX/L5m3kV9TLITqTx8v5S5Um9Xjr/VKWdjKefQjYOOa/ZjK217egZ8cr7Run0XpNMFCRsRVReO6tV1gU9MkjfHHDCiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835872; c=relaxed/simple;
	bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iN0rdSU1F6KcjAk5Huonm2GNBi7JwuqjdiQtSy1zeTzA4BGechdBuKGcNiVCyUHlNdF0upTgBzpozlPekHTLJgnBgyzvXQbl6Kn7usV3poA+3Wx33sIQsd5hFDCqfp6BjDFqutl/bbgWh4Nz7Rd31FdMC4jtW4MlJooWwZPTe7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0dQyHuI; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0dQyHuI"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5565f0488bso3924095a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Oct 2025 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835869; x=1760440669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=d0dQyHuIUHlob4TsU7gDqxAIBq9R5NjRCkbpWhP8MuON1i025sgILsq7FVzXDydZOh
         qPWPHNS2FG6m6bxnf+vPmjL73DWhMAWFaF+bhcYhyP/mCV/zpnBseRomqkNHjT2UXGqg
         eiF317QRgTCb5Tr6QwAhxiGXlGe5PzzjYNpnXtYMK4P3361A2GrNNKOrC4PPOR1DPw4S
         CHEyZpbAMbPEcnoFI7qvcqqtKJPtkbZDBVmBzW7FkBC9/zDdH6yiPmfxv4S957pPOgGE
         r9l3QIkvKRN2EQaUjJqxBfeUVwV77Kj4z2bBVfDXkSWT+vw0L/9RyTjkIbQX3aNPGk4X
         SnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835869; x=1760440669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=PXc88eigkUR0xi0yw0z24Im6Z9N0iqOtRVVZ47OKw4kwVzcXvrjxzYzda4eB5YW4I+
         oO5xFpQ0NZK7motPihQmmFYvTiIKsLf5vfkNPsEZqd4qnOpI2mT2kC0DI/Sgu0E9tXoA
         S5aXHq0jcOUYzCiIBk5SEr4oUrh0CBUla9sJ9zYMG3O4VARCdxnvt65+S4rU92iCdShu
         DZw3+3lc0PBECSch95WNaEQ6vGr/MFYZeUI8Vwk5KDLOUka/MeublQKFTTQyt9zAOtK9
         7bOsc5QWlp1o3+FETDg7GlOgDbeUNkebWZqphldLOnxV2Et27AjbMrpJctZIYxVsnmro
         0a+g==
X-Forwarded-Encrypted: i=1; AJvYcCXp06MvHSriQlnzJ74QGavEP0I4dTiBzgx54MJa3MxHlycMZwxn/Xz7vt+JVVnw4LjYhSY7JjxVGuPUzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHlGqIGPD4Z5dUkTcLRe5xROax35YGgQBu+9QZqB6VNkR/dxoR
	oUinf4TcvVdLnFuSVaW4iXxDOLhGqgLHM6q668OEfVMSwnJnUQtg8y8O
X-Gm-Gg: ASbGncv08uOQlTz8RM63q48v9eSuUSI48FCd1YjgjxiIs01e3BzvpyynwrhcZxE4e/V
	+l4dQmq8pEiUtJAOX5hcWBJJG2QCcSObYfsj8qObkIMDf4I9xThZdFg8hOlfvcvcfzYAKdj/0bk
	JEiMB3uZzikGM4KSvXTs92RhlU4j4cP3AYaoPGmUiIlu7MKxZ/cnzEOepZoYa4XEdU2uyY60RBT
	CkWBTvlBvaZDLPaVHRkTtIedVPhHDcI5lPwGLy+3F5TIfGOFW/r+kkuQ2JTEelVni/TKrywncyf
	B28EZFVKRAp/QgBFHhs8AWQkeA8TKQNC4quXMSuB2nI0PgvEzsVwn6lfG4FE+24TUw+Ak1sn02q
	WPDtb0L7HuVanGv0QX47PccjB13UNCUlQALirv8UQjxmlF06NVorUSAzbRH/zfkPRrxcVRgGfRA
	SI6jQFO7wQU8OiJIxxbEWNjeWJsPz7xjQxmWwT6nq2RQ==
X-Google-Smtp-Source: AGHT+IE9i3oBNg1pFLD6d8BUkWX8cKqHfuFNCfFyKAraBK4jd7pEhvOYjoDhX88W2UnS1BhGRC1x1w==
X-Received: by 2002:a17:903:384d:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-28e9a61a7c2mr170446145ad.35.1759835869301;
        Tue, 07 Oct 2025 04:17:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:45 +1000
Subject: [PATCH v3 04/13] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-4-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
 bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3dXJ9ryLp7td3nvHxlMaf7RhekWtXnO+6u1a+c5
 mTokmDRUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwERSZjD8z1PXCHr/tatuyhNH
 TSNzgQlHajhkjBo4Ti3YVCZ8YAHHfEaGlXw70kPW1837I/xvyoyIUz7S/9bkft76bqvHpKeZU39
 /5gEA
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
2.51.0

