Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F263DCD88
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133296; cv=none; b=KPEcxaTeMayGyrAUcXA3dnfjXWtySB0oHCnkfPcZVgCzxDitOxX/jLzC40Gpe6iEPN+c4hYEai0GG/1lGqVO9W+C2RqAC9O14xYTmbMYiX4SqnQHFfEZVsZkYhDx3A3KahRdU/No4uzqtBe4Xb9VSq6kOIGripHh6H98WSYrm+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133296; c=relaxed/simple;
	bh=XVZ74kjTCH1k/V2zQaV5mtCyd2mv3c8JUHYzlFiRauw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSjkUzdfsyS8pW0SRXBoIOGntnu8WFcwW1F64pHHl/JyFX0Pwj9CdM3MXcZ4EYTlJALZW1AxX5LtghGkqhRc1dA5amlRlLrqtXojcm48bUlkyh0EeHfCpMmNlvvSkgqaH+kYVIwQG+NS2AFYv6KcdJws5khQ5d3sr9qWKcMsQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=lRCK8NWs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="lRCK8NWs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso7318445e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1775133287; x=1775738087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eb1HAXef5skf52adtO4auVlJRKHDtrKZnmcZMkrKii0=;
        b=lRCK8NWsigMg4EMgEnAPwtn6EsOmFXn7wDhkFDm1W7vkq1wUOBQex/NspynGnxihwe
         do2gl3YgVtgJ0U597SpQH+NuouHcRPOnHEVWHqxKBLTCI87krAAQCDrwUQbd2V0eQX/3
         UIR1dyBNFJz7lv5nLHRsPnjyva53pQn9k+Yan/1fJX3wPsFQsVxK1I83c7wcfc0Puqyt
         OMhfi1Uo2i8ZYetAgA0JsUa7Kh1fdnKcjb6Iyw3s8EwDWwryXiL9v+Y0XdCP+10GS9zL
         ou867XmI4DS/IUTRaiIuAM5X67iwjkYFywN1AM9qk9jqu2nRbmmRiBX4cbyMKyuCmkvJ
         7IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775133287; x=1775738087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb1HAXef5skf52adtO4auVlJRKHDtrKZnmcZMkrKii0=;
        b=RTZm/rILORPuTb3rV1lrkU7ofkIdG/ykPJ9u3g8/bOq/cQqBdFk20fGOWXtK4uXLT7
         tObN/y016oyS4wmX2b/V/itbvTZT2w0eRqusccPUk6SPuUkJvyNTnWyRyaFSzU5zgOCh
         RHM3Bo/HykmuanB28eAysVWzEXxsGgxLk07Qa6tcPwLYvUab2KfskiIzsUYK20L4LP2E
         cbCQMl8PSW8U601QY/GvAGGnJzFX0KEHNV4at3lyDw4jZRRu4IVVEX1CGjseBwOQl03Q
         HE19D6KrMxCs6vTGUquSVspHywYVekmv6NayqCU+6iuW7E20zo83BSb0OqpBrKJSzE17
         MMZw==
X-Forwarded-Encrypted: i=1; AJvYcCUVGA6x6DL2oZBhZDMSdRET8H5h0/93GnuZliHkQ8oT3nH2dZ6RfirgzT8X1/fJ5Nhf7xG/L+cRrVHx0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9RY52TJXPeLgLivXEDvF0HNNEKmlPsYaAqRAdCMp1j9pcgB3H
	OHGlj6wpvCzsw35PdexuLT4P97Ml/maSAtpJF3YM30YiNYfiyqcVKU4W2OOeMMZ5ksM=
X-Gm-Gg: ATEYQzwiLctAEIK90/VeGALZf81bBYArFrH9i0HVDGz8XNE4dwdyUs5aniiFgIPcVpZ
	Y3gMoyl4HLXytUYmKeP1VstlyslHUDVT0qd1Vk6NOsQqud5TkwrsQrFZhImGSZ9px2csjiGdw8e
	A0m5S3/OMTvGuubBxUKdWBMjto2O8L8cfNKqTIJo6BsJnsPi+he4ozKGRX0RM93lns2rvzGKGq8
	xda/64ojWxO9gpcW6LwwacB9NGgErNLk1Cxf5oK7aG3E/384LGjAmiAqXEeicF+zjFyR4ESotMW
	h75DTiobF2LHQrsUlCzeurESAu5IizBHa/DrAFmpIAPT01bcc5QFsChmzLS8C2lBlRe14z8I0mL
	h0teRjq4ZbaRzyQrupauAb5TTuN7+u44Mj5Y/lKhXQM8ALK4/bgZhGolRysVtlzfKS3pZfD7o81
	JLEgHRgFIxR5E7JSKQGGs1YHAMlaSOuYPkqyq8qpSuJHTYyqvJB89833Ik5Mhkaay1xWrBuQAxC
	2E9lQteS3iovFkkxKpOHkKLXs8=
X-Received: by 2002:a05:600c:41c1:b0:488:8b52:f7de with SMTP id 5b1f17b1804b1-4888b52f8d1mr31102735e9.12.1775133286997;
        Thu, 02 Apr 2026 05:34:46 -0700 (PDT)
Received: from fedora (d-zg1-236.globalnet.hr. [213.149.36.250])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4887ad9bac6sm97618075e9.4.2026.04.02.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:34:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] hwmon: sparx5: make it selectable for ARCH_LAN969X
Date: Thu,  2 Apr 2026 14:34:24 +0200
Message-ID: <20260402123436.47856-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the same sensor and driver, so make it selectable for
ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5d852e488369..54b7d25576be 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -606,7 +606,7 @@ config SENSORS_I5K_AMB
 
 config SENSORS_SPARX5
 	tristate "Sparx5 SoC temperature sensor"
-	depends on ARCH_SPARX5 || COMPILE_TEST
+	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  If you say yes here you get support for temperature monitoring
 	  with the Microchip Sparx5 SoC.
-- 
2.53.0

