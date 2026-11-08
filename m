Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110420;
	b=C4bjB7+m3XCT0G4txIJ0chP2N7CM6vzOFTF6BxGXyl9sYpS/z9pHysXwRhH8EL6/aPZn
	 gWySfDKo3vwTwV/I0H42zTaeBRgoHayThbuSx/Bg4ZGMYDlTorCqmSliDFR44itk4zn2o
	 4Kz53rsiTWQJZArnxwadHy2bl2kCac8ntHNGMzeVoz4df1YXS9sr5HuiGgmvGSKFVmHCL
	 kPoy6pSDPdIz+sE8wTy9wBz6H2Sw2LH7liQ4KQBdf+6v8KKQtwO3tbJZW1ENIcIbbGR3s
	 cpvtGJNejgNNxpajK/mVfilb8zWdQ3PPcbxhrAvR9j6oustLNrjKdEcSl36bSWHivSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UrC4HyOn/bvPcrrowKsvl5Z1rHtFYFEQwp1knoNMF4Y=;
	b=UP+7ninyjiqpcywD/mDSLx/1KMiopZ6hzhvZ5jPhF0fpcW8WRHkXH6BjRaYqlPhj2Rv0
	 Lu9oeR1WDYrLfKDiB5PRsbD9jBtjo6oroj8ecnZPd8EpQCco1K7Qkwuwm1gQRrk+MlPUO
	 5r4CobWk6tzd+h657iWnuE8jD4VN0upPhguLRhypDwmFGGHvE0engdtlGiSTUYuYImGbS
	 McIyAanj+tY8xVFTWWG0E5cO2eaIWDSSXIIqx5rCJEJ526PlUldjaz/n2FacNnaMH6ptU
	 RTSFx8VO4CKu1IT7GwDZvQKgNAzovX8xhGOUwp47TAOLVlnMJSl63ZFIgud9GP5zfaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbci8Mdy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC82606A321
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC82606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbci8Mdy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so2067085e9.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Nov 2026 20:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110419; x=1794715219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrC4HyOn/bvPcrrowKsvl5Z1rHtFYFEQwp1knoNMF4Y=;
        b=Jbci8MdyDs7lvP0iWjUnTWleyq227tvKbfMkxpoFnHFQtYGZdk/g+ayOvqRwkKuEmU
         XUWVyBexBNKiir6fQT+eEDXF4wJVGEigCcr3PwfW6zGhyTrhqmy4dcwPKMLVqXdEZw8J
         beRgT4GvQzD9aEMdkTOuXelzaeHrZYgqEwxkWt8gVyX2qrKP6TbbweLXttYQLAQm+fVT
         LpQ/mTO63hqbCbb8cTGfMovVxJXSem3VnFPL4VmGlZ3EAO0ML9385pWXkAzxBom8a7qu
         UIHV9Bu1o8ixAEnGOpi48G1e2wPm27j63oGa7ouylS8URrEWlGFIfcG4YsqrR1H6eeGg
         ZZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110419; x=1794715219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrC4HyOn/bvPcrrowKsvl5Z1rHtFYFEQwp1knoNMF4Y=;
        b=MknQ+s9ZKKzeNeyGK4WPdsKjsJWQ6+JTo1kHwwg4OfU9Ua7yK3dX+ZXggqEMUUUK0Q
         Ot3GAna95wfIpWZuSpVE4YCpZvfg7kXU+PH0wxl0x2GJhJPwfQW7JDkZQUCzPDrPH8Z2
         5Tq7VJB12WIJlHI2zux6O93JXIG1LzIT01rlbGVohnj4O/Pjxdmra9XheDXe/XdL2lpt
         gCwhhcvg+BWbQIOwR9u/cFMrdDutmso6T2LKAIE9o0SJ+vrdmul9z2wnOvF1uZrCBlVp
         VBXNS8tkmi2DepJbSyf0KohzZD69iazmjzpKipsL8ST9+BM2bdvbuT94AOz7HrkVKqCf
         JLCg==
X-Forwarded-Encrypted: i=1; AL+hErGe9ENvR1Q3gJ2Q/oLEvCMNjToh+YD5qQ0jNq1mLJ2SLpL7N5FlA3AbsLCmjfBJDKL1ell0MF1j/Tl2ww==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nb+Cah/0tMPaxJ/+rod4pSKkl+KtJVuCnpiE8yw0EF9NI3sFa
	do9LGppde63Uv0inHeN+6xcoz6s5kxeKUlkKLxrtf8DK7TR9aTEGAKQE
X-Gm-Gg: AYBFou13uGAiED/JFFRPFI5efTvoNg/uehVCNxjjLtf5fyOqqPRDOipL357bfS7BtZy
	fYocCL0dSMYWkS+0A8Qoj4sermuZiH6aJzdNj7VjGPTvqJ2BY5uhXTTs5Sx4NFYOWziy1sDMS6l
	HQxn+vieCT4UXpzOv/IDCGPKr+kgF2smmFwebGIOaU8/YCFpxJkJ4YMAoZOmHPdRSflroFC/NEV
	1B5YVs2B83vSpAL9BKMHnyxhO4QBvQx4T+F+c4HUHoGTlG2/yfGf4e7lzMtchSNOLa3kM/4cxZL
	qtkeRQCLJsqfsZzZUltMe4sOeHpwtsJ2fs9IJUbhoIXVOKaR3XwSUWorfFfNL4GV6dX0jb9aAxX
	kxmZIuwHJe061OUmGzHSKijde4jIbf8ZnE1oTiXFPg4cpkUFVUICM4yneMK8yXLTiCDkGnD8ZNG
	jWaV/N+zqoJveVOqCedMzygDvCngqyPQtsA0z8S229Ol4CCo3Ntgsd0hCFj8nxwG+wf11t6t1Yq
	E+jiPW+POS0wyybZTVmH7UP0UF6XJR2NsDexF7nb4IT6edPOoGEC0rGTQdUrPDDnWxpZRonw/sW
	fuj6YGYqlGJsJ9P+kQUBYUJfHxphRzn6dJNU7xmX7B2iAM6GFV/9MNddJ9jo9g==
X-Received: by 2002:a5d:64e3:0:b0:48d:f02e:f7cc with SMTP id ffacd0b85a97d-4958a7c6923mr1114269f8f.24.1794110418848;
        Sat, 07 Nov 2026 20:00:18 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 03:59:55 +0000
Subject: [PATCH 3/3] hwmon: (max31760) Report 0 RPM before the first fan
 speed measurement
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-max31760-fixes-v1-3-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
In-Reply-To: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=976;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=FxbsRDhsAQeAHLIgbcYP9LMu4jEFLcLLaEvT3bHxu9Y=;
 b=wERcTEyMpU2gPovn1JsT0bI0NE5XWiD3a7OxYeL/AYkHtOSIaWXEhy1+V3BnrtT8iQxUQv3nl
 2QSLWq023ovDB2M9l5j7nqaWTYZxYQkEYIc8Y0FRvIl4XHkJcCmWvYx
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The tachometer count registers initialize to 0 until the first
measurement cycle completes after power-on. To prevent division by
zero, tach_to_rpm() clamped tach == 0 to 1, causing it to compute
and report 3,000,000 RPM (60 * 100000 / 1 / 2).

Return 0 RPM when tach == 0 instead.

Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/hwmon/max31760.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index e967555a21af..896bd0326b8c 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -68,8 +68,9 @@ static const int max31760_pwm_freq[] = {33, 150, 1500, 25000};
 
 static int tach_to_rpm(u16 tach)
 {
+	/* The count is 0 until the first measurement */
 	if (tach == 0)
-		tach = 1;
+		return 0;
 
 	return 60 * 100000 / tach / 2;
 }

-- 
2.55.0

