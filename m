Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E6DDAB
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758749444; cv=none; b=NMw6Zxg8Cbtv6MSNqGe5w8z8olBYApqtLS+Mn54pEMLlYhS93iOPd+AQTVlUXJBHeue8nfWoc6NvXD7HJE8SWjjncDWEmPXuMgLmL2CjaO7Z8V2XsYKofLUkOF73OBBhH2ZcobSttFgj5Fso0fEC42s3DnMSmN+IIQxGjAVwhLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758749444; c=relaxed/simple;
	bh=r6vJatirenvxNJq5RVo5+xDwbBNx2oZNLAnvjLIizeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GfSS4AJWcDs2un1f7NQwnGma+0yB/jP1nXFE11QHdZCAJUtUlT5XxUuc90FgR+nGDFTQEQKpRZ1RFNGym504IhscQNF0JjjHHt+TRuNFYu+RjKC0ptAQagHZVDOPTCxY7VxU/jFt/qg4oWDt11ReqkB5aYkJFMdwT7DWKNlgMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ZrFvoSuz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ZrFvoSuz"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f2e621ef8so445656b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758749442; x=1759354242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uf8e+i1NQmbBzvEMBLlbeFVnrVkfp1K5SVjnFrmkNpk=;
        b=ZrFvoSuz1IAPwAZp6rzfn63RaVCY1Ax7AxITEUeiwaM7Ga63RcFMnKPzGwEg1enbTA
         ngwZ9RYeyGYwpAgc68epnqwvUqOdyioJTJ5bGJdh9svyhyi1JLRSY406pPdCya/BXoiv
         VQJyJO/tMBZY4xZtHShx5lukxwaY8Il3sIHCm1vBiikWiuQxJhQWxdXQNLvtZJCXBtBO
         bEF0DMP9TE4+U/STOjC2nZ2paXy8ilR5FJ1AzLNm1S3Cevvu9ZmF5lBaxHO9bfOveZEc
         X5rTZjywkh84l6UwmrCPCEPw/QFQIlStBBQsN+k2J+s9bEm7Y1GQlzoE2o67NFb/B2+L
         N76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758749442; x=1759354242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uf8e+i1NQmbBzvEMBLlbeFVnrVkfp1K5SVjnFrmkNpk=;
        b=kqXRweq04iU7/A3khZmIJMyxsKlnzRsZZ8oWmIYxEwqwhYJr0ITY5VBP6FueDjgE6L
         DDLKV0/WS/CTirkuSvzxkpdrKX6wrTZF7v7+df2OYxS8Zw2xC9BLDbFJgUeUrXPsntZh
         V/jLMWRFsulBh7rvW4OnIJPh86TN1dgCtv0ZjhshJpQ4EP24tLJpf9+mR2WPfThFrehZ
         6Theen6Zu1YmpWMK4oKVu2tf3RkSCSE/SZeGFVPOCpRsNl/vtmSILP0AWEcVgky1ZFiM
         lwObkBcIXw0n71vu01Xp2uXxc61Dbf/bQFLLZO4QO35RkN3PmeE/Sd3uB4UZCl56zE2Y
         LK/w==
X-Forwarded-Encrypted: i=1; AJvYcCVPMYWjLg6JHP95a0+6ZtLlfGnVIOm8M0db6Cg5cKoITyeB/vTpCl6AJ0EwgLrAOrNsaAdf90yEMuDCxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9EkqWOWfEfb0TvYcxQN9dBB0VglfQq2tTUa2rHPkysAgSErI
	qPVtG4aaDT+kEuLiqNQ+cHlyQsJuUESDzw7nUVCMTPndydRo8ImKU3ny9RMjlcRjyBA=
X-Gm-Gg: ASbGncsPWXtkBQSsUkDNhE/2ac4nwGpBa2/5sVAEdpxCkBMxwjIVQaofInVFBwXszMo
	I09XxTskjpjYEH6WC4pXCtVbdD6SxZWXWs5+onlNmst6Q/sfFmdOgiTue0wogaxYyp9eqySwGyG
	8V+uItoIo85AniMYVBxpNUPmk3AJFqOdrf//e3+PKz8/xkT6n4wkwcxIDv/onE191PYFlBvdzwZ
	E18Zt1HI/JJsMqqFZ6h1Cn5riaIgJJZ0+/vO+QMDxrHtlGWPl2ASWUaTC6z/0R36dlG8RDwF8P/
	UrpO1mZN5Gf0l0Mb0WyKGxuBE785EpA6NFYzrBaK3VlmaUKfAT2n0VGn0NiyTY3SZPWWeCu0R8P
	25HjBpbvek4sDUjzdru/n8Pdx95VV+sQLtw1r3PXmH8g=
X-Google-Smtp-Source: AGHT+IHDk/mJZU7GjxvepTGSrn5V0zMSz31PMb0YzmQruhmfqOi7Q9v9gnRD+j8qskbbixZ1kv9Pzg==
X-Received: by 2002:a05:6a20:72a8:b0:2c4:c85a:7dad with SMTP id adf61e73a8af0-2e7d6ca978dmr1157135637.46.1758749442471;
        Wed, 24 Sep 2025 14:30:42 -0700 (PDT)
Received: from fedora (d-zg1-232.globalnet.hr. [213.149.36.246])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78102b29688sm3243b3a.57.2025.09.24.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:30:41 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] hwmon: sparx5: make it selectable for ARCH_MICROCHIP
Date: Wed, 24 Sep 2025 23:30:02 +0200
Message-ID: <20250924213027.1887516-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the same sensor and driver, so make it selectable for
ARCH_MICROCHIP.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 840d998f850a..ba2b7b2f6c44 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -632,7 +632,7 @@ config SENSORS_I5K_AMB
 
 config SENSORS_SPARX5
 	tristate "Sparx5 SoC temperature sensor"
-	depends on ARCH_SPARX5 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  If you say yes here you get support for temperature monitoring
 	  with the Microchip Sparx5 SoC.
-- 
2.51.0

