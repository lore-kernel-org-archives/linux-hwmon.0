Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB582379ED5
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894970; cv=none; b=jlZwBKRpPJbkV/N9rC5nQUAxwOFV7vZRTzQfjF73lasjNB7iwNdpEMuXWwkKqOnfQn4G2b5VRlnoVyKPYOkGuTZ3ojN+JDcz4fs9RiQbqoU2t62VUB/XVq6JprwBw2qOr/D6Lj2BQFB3vTtQQF+hzzuSlT0PkCPj6j6KqqfW0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894970; c=relaxed/simple;
	bh=SGG782v8heskkgCeEQh5ro9Lc0JQOnQsegfm05Pe5/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oQG5LIvUgtAEMNS3d9u3xLiUB7tXIXYI645iDEwdbu3GovzvJWowwqOzuZhRupB1WmBDZNCP3f22oTW4MnKQgZ5RFi/m9zYw+TQCPhs2UPtiisCknnnVAxA0EBmhGNFZi71+1DefIVDebjd3NW+nHvciaZFptvKKhKS14bxHZ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WujUy/GM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WujUy/GM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso61388505e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779894965; x=1780499765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBKA0gQ+xW1wOyleBB29AXk8NtnAnaeMeyXMssYDYpc=;
        b=WujUy/GM7ABdSvg2XdehdtkJbJoCfHERRQA812ySXG/744XAtOzfSFF3PS4YumX1l1
         yeBzIhsQC3Zf9EfGa2SVGu0B51SsjNBMZ6y1OmZp6MqNOMPD7BT8h/OQsPSvAqJJ5Bxy
         RikxKX0ktBXZUTRkq6Z77KslVW/GjAIF5Tavdo4yQO3PYkttkITjQCeE1rkJ89zuvN9O
         X0xkIS/DhkPOc6VJVXqtC1hWwPr053+srw72zW0MBCsOQFO0DVKgcwvrf9ZdOoKRIF6o
         4sfHpFMp2e0VjG6STW61MwwikH31XYLfw+GvUeM5t1jmA2a95lUbBcA7T7Gc+EqHlHpQ
         rVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894965; x=1780499765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBKA0gQ+xW1wOyleBB29AXk8NtnAnaeMeyXMssYDYpc=;
        b=SVcHat88PN+zBFVPoANEuI6WF2zCoA+rhZjzI0I9l7/w+fUk3FCUFTeApF7QP8Disx
         +FSZ2GOZ0OwWvR5E27r268n8m7Bq8Z6tFgwCGUCk7yEsGjV2NEA9uTW/8PLQA/c6W0pn
         u58Z/jnNFkKxV4jBw37G/YkLMae8o5g4Sy0liVTteRf3ZQq5nljZ8MWjVT36QNog3dRj
         kwOr1wpgadeG4s9t4Dnbb0bnJKF5z/Jp1dLecNXldpoGYD7X2WXw7yaJ7V7ZMUz1scKy
         BGcxKfEbuaP0Qbuccyil9X+qO+WvYFensZWfr31bWhwOuaY+6TUdlvUjR5fcDWUhK12Y
         WDFA==
X-Forwarded-Encrypted: i=1; AFNElJ+hp3bvtQJubl/EwAXDyPbRGcRuYY/FsuRhmT9Z8Ft6MnKgzrSWyMsxpVYSsVKx+WT5SiYCbikBgpF/sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GARxPlxemNvj0BxizxyD1eWnm6dXb39imjkp2LAOrnq+/tbz
	Df2t0zP5FFYD7FTjV9aYG/WsnLyR7FBaE3we6b0CheEFM+S9IkE0sa6a2JidzZp+gCY=
X-Gm-Gg: Acq92OGoI8x7Q8+7VvCGPbakfebRSf2CL/TfuY7QU3X4n82Tvvcs+P4ooBLR6NcdwFT
	U28ampnKH3cKI+oet//ZWYXOGB8fnmg11ROs4VRXXhS+9yM4HF7z8A/mcaZV8b5YqLpmyvlLKSm
	VIgApFYbGGrtJhNlNHEgjFhKhFV16caU/kJKaTYy/3QwKoyapsqTdIneoIngpb5b01sp+ShQpIk
	6vrXCFs9hMmME8TiOKVlynfRZKPRDHTML8x3GKtAYHRLCmV0paNlw5Tzw5/kps8GLUXbj6lO81k
	U9cREdilwI2p8Mxgu+2LTu9prtmiVj0RCffV0IEcI8FcspCGgqX06GVHnjIEmWlvW4gtNQDBgc+
	ZmHJiZ1DNBbSDbf2j5VTiDejSmb3uTVTyE913JyGoirhJCjaiD2xRdGm0ESPsjiDBIo1ELhkuCk
	uRo114Qy14sL7M86UXNJo6RZbtaH9Im3aSvZPy+Bei+b+jfSguPfwGHW5beLjfJ1juiiq/TK7FV
	B/YGmVQm0ijbA8/BrwIyINLKA==
X-Received: by 2002:a05:600c:c4a3:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-490426ceed2mr397237005e9.21.1779894964634;
        Wed, 27 May 2026 08:16:04 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490452765f5sm419367545e9.5.2026.05.27.08.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:16:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] hwmon: 
Date: Wed, 27 May 2026 17:15:51 +0200
Message-ID: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3738; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SGG782v8heskkgCeEQh5ro9Lc0JQOnQsegfm05Pe5/w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwqoXEPjhtu6utYDTpQtB8ZlzavCDK5CSA5zV XzX/FvzVcKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcKqAAKCRCPgPtYfRL+ Tl48B/0UFmLrw/2YNxpw6oKq52oQdjKz+1+P2QJgibL321MjIBqXyuFt66y9bIABp+GKKdf8H9E vYaEVbi/o6J9QPcv798Dn30ilhL7M293OSYBrRhNWBLnbl+1ap4XT7gX67+dePfdheFcoGkPu+g LubGGLhTemddTW2qQuzFtvKbjTxO/wtOjBfcgG8cpe5jFZZSO6LfVF3n5oodHhF6X3X2Qz7gy1d CyIvHdt4ld85LxOsU2jSUKV9G3P0Jaz5ij4ZoEc5TJ3DoSbkSiPnmQJhZRIyxebYxH2XhkMcjxW JPWlAjWHAjBxGvvk/Kfcwm4JCV6On8hEK8P33HzAilPBA6MM
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
	index 5d61053e0596..03bc8e859d73 100644
	--- a/drivers/gpio/gpio-pxa.c
	+++ b/drivers/gpio/gpio-pxa.c
	@@ -534,7 +534,7 @@ static struct irq_chip pxa_muxed_gpio_chip = {
	 static int pxa_gpio_nums(struct platform_device *pdev)
	 {
		const struct platform_device_id *id = platform_get_device_id(pdev);
	-	struct pxa_gpio_id *pxa_id = (struct pxa_gpio_id *)id->driver_data;
	+	struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
		int count = 0;
	 
		switch (pxa_id->type) {
	@@ -708,14 +708,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
	 }
	 
	 static const struct platform_device_id gpio_id_table[] = {
	-	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
	-	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
	-	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
	-	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
	-	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
	-	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
	-	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
	-	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
	+	{ .name = "pxa25x-gpio",	.driver_data_ptr = &pxa25x_id },
	+	{ .name = "pxa26x-gpio",	.driver_data_ptr = &pxa26x_id },
	+	{ .name = "pxa27x-gpio",	.driver_data_ptr = &pxa27x_id },
	+	{ .name = "pxa3xx-gpio",	.driver_data_ptr = &pxa3xx_id },
	+	{ .name = "pxa93x-gpio",	.driver_data_ptr = &pxa93x_id },
	+	{ .name = "mmp-gpio",		.driver_data_ptr = &mmp_id },
	+	{ .name = "mmp2-gpio",		.driver_data_ptr = &mmp2_id },
	+	{ .name = "pxa1928-gpio",	.driver_data_ptr = &pxa1928_id },
		{ }
	 };
 
increasing readability due to less casting. Also this results in the
compiler warning:

	drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_nums’:
	drivers/gpio/gpio-pxa.c:537:38: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
	  537 |         struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
	      |                                      ^~

which is a good thing as adding the needed const to fix this warning
improves type safety. (There is no hwmon driver that benefits from this
change, so a driver from a different subsystem was used to show the
benefit.)

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  hwmon: cros_ec: Drop unused assignment of platform_device_id driver
    data
  hwmon: Use named initializers for platform_device_id arrays

 drivers/hwmon/cros_ec_hwmon.c  |  4 ++--
 drivers/hwmon/max197.c         |  4 ++--
 drivers/hwmon/ntc_thermistor.c | 24 ++++++++++++------------
 drivers/hwmon/sht15.c          | 10 +++++-----
 4 files changed, 21 insertions(+), 21 deletions(-)


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

