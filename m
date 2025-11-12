Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B031063B
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946309; cv=none; b=tGH2OasIyCrtzhXuijOhzNiWP4zVOHEt2aMilq+PVXw3VBuOIzzZzrlW6W4K9CYkw1Vt1EMF7BCFF6ogzjBJVKCdqzj1KDQQoqiTCQIjO+viJkaEyVmGQxByZVZzdcqEcvQEUFFHSx2hBvq9h5FLVoog4yRhvdoEQv/kj6PGMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946309; c=relaxed/simple;
	bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGNvZIYdaDXGKlgRyev9KEI2TC3uTyESoLFTpyIcuo/Yy5v1VBqYvwJO+Ham8JnLyfyOCCiD/bxK82KnGKh4pZRvB2B7l2zIssGIIWeCAs96sVQGso9BpgHCmDaL61YwF7VpjQQnzIcmqobuZTM3GVIo7fSxMZHRXmrLjaJcF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU6cMCxK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU6cMCxK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298287a26c3so7896725ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946307; x=1763551107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=aU6cMCxKtR+CE944lWsCiO5Dv1DxnTnVmxFZ7J4TcQLZZvjBVkHwz0xcu72s0og5Dg
         xbZgzyyjWlirg3gL3kmcknVELZshT9neYBuko4L6oQo4dRrEf5SJ0+MGCUky2xjlC8QB
         4pIGakWQJqEH7qjPnAeHmXUD6mOtPrvWWvTYpR3YgQjiz9e2THUxS7P3LZ6XVmpklI6Z
         QHHhBAoYDElCWToX5rTSG6ptOAJUBOIvWFe1FDBcw8XLh9HAVqrFCBv5UljjHgASg1iA
         J1i9Zf4J9CDWnmZvjsJVv9jI2kN3mXOC/x1qnNhVSA4MYOOjrVubVdUudeyLSb+HnZjy
         W67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946307; x=1763551107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=OXCXrDOt8IqWzn+4Ex76nCdDsUlT9HbkzD7yE4u/NhvIrmGwPJfL9CEAIRK+rOgJ2R
         LSH6EMVGkliuE20HlI8/2cJVjfNt0ytrW4NqbzT1Lpn5R/jKtyiQxzs0e3w3B3DU0OMx
         Rv0b29PuBQFWt9YHC9WIdwXE2F1moqnHZz9+abDp/dGZABy9EENgyf49HF7MZQC42rgP
         5DYCCN7BmsfJg6LKlMlYuYw9tIXx5T75mKHQtC7b94OmECHLS5OP+aZ5JfHuGDU2SXuQ
         zPuSvCX+0KyOX2QqgzBCyaYfKki+ySX/ccVqc5HyVkSZ2w16w/cpfVkyvTej/fH/hj8H
         sk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVifZpStzLnDFcBKCjMTJQAeeDM9cVQ7Ddjmy1gtdk5NXDE6ZEkGDdrMiHCCQybZ+XC9VjDagv2IHw5tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJW1D0UC+KzUBYPsCsPrJwB7xr4bmYUdyGhkygTzimiaeAcOW
	e0kTo12BxOuoV7oeOlc6ujdn7I3pgJCbLXyh3e6bloAQYsJabLNHjCQk
X-Gm-Gg: ASbGncv/YwhL59GWj5hAe1QRLoFPw4nZ9nRWxqR6QHHz6Zm2PwA3AKSHC92ExNIWmDV
	AaerSGkg3dCJ7aBnLf9+snzTXObg6s0HU7rzfupTj083s94Y03cmeqMR8tQG72myqW2HhQB4teO
	l1FaYxhoGglhK0FA04JWPGG+RnPH6wo3ZAqqKVyidOXyRyVENKGoI4bAe4iGnRwE1rDHqTVowLO
	1iBscnmJaBH2/t82uADoJEfxZ8HBC04Dbr28VqB2ZzymipqhraCj8Fqkq0kewT5WKwCy5nJS4Et
	qKvoWjfPsLGfSCOiUfA6LHJ0DmhGz8zEWst1bUDRTeNr0iZWRkv/l0zoo94oZ03Cnix6rDeiM2m
	bcZYaxRjDX2BOnoFAykcTNQJ0KB3U+R/hRWzWan5WMRzgwUXRlw1qKw/RDN/gBqRNYmJVhxqqU6
	k2Bna3yIqQC1asegKq/QMI8tpP/UNpREDdlrb/JMOASYhbFR+iu3a9czersMNCJ/whrC2fIh7G6
	mvHZm9UAi0+MvaXO/JwRmcoPR0+w35hcGO2YmKFDXKnGFxh+f4uNcLWjRcwKPXaxA==
X-Google-Smtp-Source: AGHT+IEImt2oq5AVyAyincVqTizrLP2oINP9hgu+RQmDQEbV/h6h5zM29LTMvGX0qa1Tj+zk9/lS9g==
X-Received: by 2002:a17:902:d60b:b0:294:fb21:ae07 with SMTP id d9443c01a7336-2984ed92d45mr33420405ad.21.1762946307045;
        Wed, 12 Nov 2025 03:18:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:53 +1000
Subject: [PATCH v5 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-7-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUdZA4+/VDxp9c31mWLPB8Z1xzU9H8o5bWfLi7zwL
 fz9vPJZHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKkumMDwv+iDSLuozZuJUz69v8Z79VyVRceJ3QsUthr+n/mbd2rAklWMDLfnfll
 6aovjr827RbynnHifxf4lfqXZyn/z+aa9YGbaXM0MAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.2

