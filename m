Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409760;
	b=FOueQUgOI0Y9u9GFyEDx7ucqJvwe+ZnBAaUO8a1ZB1BKzMoa19U0WQwFCR1IXuJDN3GI
	 j+cqu1U4ax4m+azqiHbgIvdofovPmJ+CVrxaJRbq5nO8zPXM7lU9XFsP+cUnglHWGWu12
	 teszCj2pgVmcOEwMLOJuQR9WCk9LweKWjVYK+57ohqzUL/dIGJbhmYFJ4F76WbzJLteJh
	 LvOieRZEKvCTYW+n/BBNyjmRvUz3lybVWOazZG3hJ/aVUmMvz4bBrPtaK+pgJrxUK1vyy
	 scTYrb8ko1CThfbKBHJ7X0VyZYyTASfc9BcL7eKKmsyuVV7r+jAs0ro1KlqstkhJfmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8go1W/xdCL14N6kvWnOF+fbieLTRZDFKS0ffzZMhakU=;
	b=KyKcU8sBm9v2YtKs074E3t2ce1Kt/sn8sZg0ySy1+RweOom9iqwubXMXBagArQ0hIA6/
	 Xs33GybXWrsd6oCwhXsKT3D3a2qUFiyRIFn9iiRrqtOEYfv0NTwcY8OUpB/hLdQTs6u6N
	 N697MYYDyfjPb58Qf9jW9Pj7ZtU4jHUbrtGGurfYTqJ12jAWXTBOJpGvh5GlUyiNlCotp
	 eOu4pfUQnE0MLecIw6bokCjAeXfBP5k9LU8dsdCaC7bO/VUsFnOBEJE/UjQXO5f3fcmF+
	 4Kpe9OglesBTHbaHT97YnoZTZf4d4jyBkG/kRt73O8dB288cFxnasJnpykkawCQT25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJpEYJSL;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5899D606A326
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 15:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5899D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJpEYJSL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so39624365e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409758; x=1795014558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8go1W/xdCL14N6kvWnOF+fbieLTRZDFKS0ffzZMhakU=;
        b=qJpEYJSLfx0nZbUUaNUXPByZn6fF1ZsSj1Z6iydSSwmjVgo7Foo7ufVqPJ5bDyNAtV
         u5HGJUvAGOzpTNdAnoeSJnMerGSbxBVt79ItmlzC3QZ4oqIWBpTGkIAYy2oxJorHAWXr
         3cS4ab7nXOJX5sA2BxrS0uB4oMYAtPbnCxQD2QGFk9fiHgeP/sI5k1XK3OgBhpZ+AwMS
         Q6EXmr6FdSHR8JJECCHAuwwRGLmcftGfpcYLl3BkCxp8URhutezFdtuWVX3peV2/kFIF
         dKW7BtMwt8ccGELwsCrtOjazqyD/gGxqI4JHzq6NHiGEgAl54MwUBjOnSdSUcgoxy67Z
         k16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409758; x=1795014558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8go1W/xdCL14N6kvWnOF+fbieLTRZDFKS0ffzZMhakU=;
        b=ZpZeUdij/8uc+uqhaJPZqkh+WFFaMZx6mx9VHZLvn+Hq8CEfgMhz43eJqI3X070i6Z
         HhiaShMLKL66FpJwORQjlsI73V3T/chnasbvsCW1HKSmDVEHVuhxc/MK94OexKZqe2H4
         pvY1TmV5otr4s8Ir6SJKpV9T8kNrGjPTux1srHk1ofoF2xyWrsq1DkG1L72dQ6okKvbV
         IFl1Vh3YL/2vGprm5pjpqcdQ7YZblM9lVTAy6ck6qlDG0ar1QfDeSTbavc8ahbhR5u5w
         NJO4tQh6dcEx2bAFBlb7baSX79dNBpbLHJ5KT9i4rxCBWwoqJon9jl1So2ca+qiKcTGq
         mv4w==
X-Gm-Message-State: APuU4Z/qf7EIaTaPOVXlVnlpNO6KPDRDpr9ElL8sH/e+j/y19XL67n23
	9t5GttWZpRIsom99lNKPFy4I9pFpyJ3wIjpxq5wH88UNEfaZ6DeAN6+iaNvLvynA6w4z6Q==
X-Gm-Gg: AYBFou31BipGio7V2St3szcwJJF+SWnQtIFkB5O7hhXIE7xgNAOoG3czh0R1wXrbicr
	9AgPUgxQMPWL4AZ4Gr6VHchCs8tMHATdAnDPnB5pCX9tcks7SyAYk/YtXnkJNdamNFq43psPmWt
	QpV1V560D0XC2zXQXnmj2giSKCCGt0eUiKZkDXrH+RYMEXYQ3UHEcwgrGUTsAXPyu0XOA04xppK
	C6O5LGKmE00a5Z4g4bGHlkLPU0eawhlWrGBQtlbsYWWfIkMwPKzRAhpv82FO29Yx5yk46hQm7hq
	jlLXV0B3RxxI84mifsoXagrfXVpcTe1rURn//GOaqzlx64cWHFaE5Vq4K7yHnnzvqFCEdT3cpLM
	4vvxEwj4PFcsDTeL4Ze+DNdfT82BkE7SOeUxVJQ0zmU7u3UMPO1k8mu+9ewKuzyvtihR/UsBFri
	i0AxoDcghfaERXUt9XzA3XGMx+5RMoKeUwwoBelICEeZtkWN5V/V33Iu0ulh01YMDDTZ/e8fL+B
	E3JdPEIFE2GKHZiLz4kv7da7+ZFWPyxxFSULoeyj5hUnz1hTvM5Haf5bD8/mkTc8fuWOQUkzyPc
	AjENhCTGDKnLpnF4AK7t
X-Received: by 2002:a05:600c:3f18:b0:4b7:76b8:348f with SMTP id 5b1f17b1804b1-4ba08e209d0mr61133635e9.19.1794409757501;
        Wed, 11 Nov 2026 07:09:17 -0800 (PST)
Received: from sd-lap ([159.26.106.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm10866498f8f.3.2026.11.11.07.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:09:17 -0800 (PST)
From: shadyabh <shady.abh@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shadyabh <shady.abh@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whitelist
Date: Wed, 11 Nov 2026 15:04:35 +0000
Message-ID: <20261111150435.75965-1-shady.abh@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On the Dell Pro Precision 7 16 PW716260 the firmware fan control
cannot be overridden using the default SMM method, writes to pwmX
are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
policy also requests speeds below the minimum sustainable speed of
the fans, so one fan repeatedly stops and restarts every few
seconds at low load.

Add the machine to the fan control whitelist using the
I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
disables automatic fan control, the fans follow the requested
state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
pwm1_enable restores automatic fan control.

Tested on BIOS 1.5.0 with kernel 7.2.15.

Signed-off-by: shadyabh <shady.abh@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843..250d8c1e6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell Pro Precision 7 16 PW716260",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.56.0

