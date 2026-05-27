Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250B3793BA
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894972; cv=none; b=cx707UU/w09eGJCnDfY5eLGDsoO56n3BNZTeG08aybb3PkAwAguRSzlBtUWJstAn8T14VVnx7ER6EIvcKVHszhtBh4LzUJ8bFt+5cAmyvYcHs8Ujx7+xfUxk1FDDJ468Ny+yAEu5giR/brzSZI2bl9h6xbO7Uq5WfMjNrCnM1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894972; c=relaxed/simple;
	bh=1sxvn/Utzi477+dohvNbU2G9iyzM3qmfnfrWFkCMItY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pW4DJYBNrLzGpPDkwb/U6/whA5RmmbeFcSnCoBVzXWXsBUokedlKiGUmANtoQ63DWMj/N+R7m6kr8lHP+do4ttGqnITFRv1qBLdkjCDLIiqMpyD1amP4azwAIzj73WncQHBshhlePnhTdYUmda4ZRd7DVEF+YA5r3H1rXTSziks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ks1KEU0X; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ks1KEU0X"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43fe62837baso6988147f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779894966; x=1780499766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj+gcFMQIYsXivdfJpoyTNyRaQnSf5LgQGppXL4g3+Y=;
        b=Ks1KEU0XJQXxOMf6prykHL7wp0CqM/rZtS/pykS86w5LMRsHaSNgxUNDHSafXRUiSy
         rvdL2H7F3gDWia/WlDkBJESJ23CBZMR1OzQV2SCFmLC1zs36wTbBrw0K0Eiy4+DclIJJ
         Elmu2dOhVvn2EmHB6JUdzFSKBDmeI0QGQgd/gafNIGSgW2yf9zaFj+C9OMOf1JDzAmHq
         SN3qEtCoBEXnmlKp60DjGBlPDnSK8QQ0XZglhiVDtgtDeJji3LPkotZgtqYQq0iidav1
         DaPfhAvS8l5jFeN/OBjA4Dg+denXXQi1zbv7q9vkIGGyAExJHFXW38MAYNfz8riF9rfb
         4Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894966; x=1780499766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rj+gcFMQIYsXivdfJpoyTNyRaQnSf5LgQGppXL4g3+Y=;
        b=GWB7Y7UzVLZ16ipXHO90MjWHlPpyZ77gc7kC0LM4Yuq80DXLcESUsTNfmzcSlPDHId
         ioiySKZSYzH+oN4hChP7dHEZnIc6XSG9+9bnOFAYbdpVtg6f1p450La0gSaRsQa8XjdQ
         01UWJghb5Oyl8tJ2vrRpt+Zm/RgPCD/1yz8C19afPzvhMxK+wY9GSz58Nqd4ys9iahoe
         EATIPiqsVjJq+RyU6IW3+b6aF9JL8HVZt+nGnGkZ/cQCskk5pCGkac7dh7aVYmTPSqWE
         3FLNziIspPGUrwvHzvCYx/zup5OH6jovvaJMrQ8UJmgXZXIFR7rfUGHTLHLblU7F5u/t
         WhXg==
X-Forwarded-Encrypted: i=1; AFNElJ9fYIsccU22pN0JVFN02sSfmd2j2R/EIyLcob/cJrFYHSyTxZGjHnuDbXjwfTf/FR+8PNGD0KHfv7CABA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3SRqS6uuQt37MMcnWyBOA6iANwmNxsNszn7gWYKByXg10XuN
	rlPvy9rOCClEU9E1xDZQIEkL3P6muRyWkc3LC24vO8VMNSLd7+rTb6kEmQicUXFquAk=
X-Gm-Gg: Acq92OFsaSyfIggCPxX5IKLnbst4l1W0BfFP4h7yyPXQY8ioGz5awxk3t4gMWQQuUAV
	ouRITEKoI+S/eFqHfjrcHPR4jLgU3kQwZm8VWMp8Fw96Tp/S1njxgrVYkzHA+cpdpQ9yaVMm/W5
	XsOv2qLZmKqafcOvn1VyR7W3K2T2/5Nydu/OE4irpW9UL7t9mQ87p/e4k06f4/Bz0JFHUPs3Waf
	P7dPJGgl5V0DxWnPqS+cbXs3FEot7pbePz29aq/8hrQy3nXmXjiXtAzDgvQTulpd4I7mWplRG5J
	GluvHoi6c+x748LH53gPUAip/vevOU56MgZLO5Zn45jvLzenmDwZefaos65GhUhwEcBphAYbCk+
	f+uGrpFpW0OB6ur+s5kl9CO2Y3XHeG8eMWzAoaim+JMO9od9DO0uWdh/6IaGr4XgPsNfWVTq19z
	dWjzraBwy/AMWtdnIWLymY5wJr5exieVjIiH2GRalFp58c8YCZudCYLzk8PYHucRm+FPOLCIzyR
	94Koal56auU/DpJd76gHma9bw==
X-Received: by 2002:a05:6000:4b04:b0:449:9aee:4581 with SMTP id ffacd0b85a97d-45eb38b04d0mr40575316f8f.12.1779894966012;
        Wed, 27 May 2026 08:16:06 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5c27e7sm6696549f8f.35.2026.05.27.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:16:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of platform_device_id driver data
Date: Wed, 27 May 2026 17:15:52 +0200
Message-ID:  <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1sxvn/Utzi477+dohvNbU2G9iyzM3qmfnfrWFkCMItY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwqrACdlQAViE6QR/zVVUQnBwP8Py6aQJ1mFo ayu6BBpuueJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcKqwAKCRCPgPtYfRL+ To4MB/4yO22vowyuO83CxmRhhk1KgUCuNz2VwlPKEIh2sVgTBZn2ppk97HWvvjoTEVhqxq3wIDz WwQRAtCP8sKXT7S6ecOMq2qh6AkPqHuCXfaHfnB+BkjKz2SHb3THJTnGDLWRMEKD3FOfacLK3ma I9zXS6R5biP/5I9ktt9h46gc4uoNI/YpgEoHMWtiV+W9tXtflT0UONHOP0etYQCJ8m9ovHwulp9 Cnb6gD+NdMNv90ZwnfQ4fLIKkGCq8RpC1WNWL41fm/MePZX9XAyJ7E3rae0RApV7D0I6x07af+x wjef2b9ESBpOPFJmOyL9Ks6Dj+xLUNXvHMAs6QkjGfciHaIB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing and use named initializers for
.name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/cros_ec_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 7c308b0a4b9e..f6cf254395a8 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -654,8 +654,8 @@ static int cros_ec_hwmon_resume(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_hwmon_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
 
-- 
2.47.3

