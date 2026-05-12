Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7A3CE09B
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603364; cv=none; b=N9gU6w+ZNs0X8fz+7LUALHCNpiyoHVnw+5buUKFceMiNc6+DxxPBVpOdNGGByxUDYt7KT9tP/ognobnq7KDuYbuX/87SICNhEC7RjQlTa9scW0EgyIz8OWvaA2vmhVJIjAXa6eAfi+Y8jIJGLdoy0Qbc3SJ7UzVOgZb8Yat8440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603364; c=relaxed/simple;
	bh=n7lDeT5UrmiDqvEe/Ogu6921tW+e2dx7Syh3kNmEwHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tiBru3juAxOwhRyhQNPum6RywzHXr4d2akJU+Dkl79O+VSBSTXgEVgd4QkRzke2m+n0lg/BKmxGvW2RevShO1OYujlgGQdjvsErByHdlLAseY9ZlqS7Ji5ATdrTIIdlWxdoU/+nbxTj8ZIz1BAAvINc8NlP3ey43qtM/l9iOpvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=QSMebNzh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="QSMebNzh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7645adbdso3138028f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778603360; x=1779208160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPxFhw6LjCEqhfhDMkFb+OamE7WILxLGXpSpaMZ6ELY=;
        b=QSMebNzhJCbghWPFAfHokURmhB9o2mbO5iA82XvnjqeYwwushjfxezC6lCCpz8D0G2
         f5EtLS111JBSfy25zDvTkqTZ56vuhImbnLpGkkUeH2XmDPBSaD/Vp5fVdjMhq5kgKRUI
         6TCJ+OcdqQ/en+0V28jek77bOgCE/qClqCffQxPwPScKvhm9LEB3/N8BKfgyXhpAHT2H
         jTI06nWkhMll8+fZse9W2OD5drdKzGldfkIMnsiZk9nFQzxaLrrS3NwF/6Gk81+pQX1v
         i1Afb6RWWU9Av7J8ftwAZ0FPEycVUPrAE9NvR89/1BXBxjV4b3apnISb0ZA9okg2eFMG
         rWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603360; x=1779208160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPxFhw6LjCEqhfhDMkFb+OamE7WILxLGXpSpaMZ6ELY=;
        b=rvcK0Vo9W6TLGZSstQSXEoUTct7Uoo1NNWdbvO0/VqifMCFhmc9TZTPLfCHyO3SVhv
         AmvSboLV/VyYIC1gDfCcJTU2da95r04UvcSxEDQrHMqJZPYByjzFuFFoeYEfJ6ObeTBe
         kL63lsesgOa2F9vCiGhdPvfITcVz7hfCy6BKrASwGL7gN7NRDhtD4xuDORJSSCeccru3
         4KJlBaoxOQRqR6UKdIqIC/Ial634Ho4pMqmIRCKXEgEJnFFjuO5rQ4jRTrzd3cCBhd6N
         4XcO4TN47FJ56a2Zzq+A0r5drlR6+dAeDOvGvk1KPxAmn9hV1jaqrRzTgnh69oE7TQnt
         ac4A==
X-Gm-Message-State: AOJu0Yw0GDXUvQR/libLLZWetNnNYkqkACtvb8b7XcREl+NNWGzRjlvW
	0OwJvWCmiXruECxcVj1SjgtUtKYbM1oPe3nDWUfnVSP0vW1ERFRpAsnFgJ2ZqAbT3+Q=
X-Gm-Gg: Acq92OG3im2NHvA25NoHVpBgpey+nWEL7n9L83GKeVx14s/7+t8/v31O5cPNSgNVrCv
	yjSi1tWjNar79BpGlm8E9uYAGSoWNQWe+fEeiz9/8xqfaQp11BkfMPu+2Xsqfx2w/JpBZ2AjCNw
	CAPonHPq+McZaJs/uujbNSEK3lrFS3p0j3XApQjJaq4+X+nSFm6G5kiRoaeKe3z0XhGGqDwdA4n
	ieje+JFjVCIcPXBVZlCFVpd3VATuvK713g8hD/ka23DYbSrwaE/w0R1797zQ/CS4TXEsL7ABtLq
	GBElu4m+axAp0zRPgFoyJxcbWRpG8npKAijHR6PNmagrt4aWn9bqjuxe9ftQzp2eUT+ReyEsHhU
	vJV6m/Cp+e4LkwEbLsA7oTFlvW4MSPDzSLE2phCEVFy8Kgfb+YgzgfNN43zlPGf/uJ43reZK+v0
	mGBH/GZl2Cp7Y0thErzfs44Ba09GYQ71e+YjF8rhDzu+MYmyeaGqI/zXQRjgvVoGo6tRJS+Zewg
	N6MvABKe7xxSzk=
X-Received: by 2002:a05:6000:1acc:b0:43d:7883:87ce with SMTP id ffacd0b85a97d-45b1441c919mr5977499f8f.34.1778603359814;
        Tue, 12 May 2026 09:29:19 -0700 (PDT)
Received: from localhost (p200300f65f114e08229f8c404acd2182.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:229f:8c40:4acd:2182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45491e94c0fsm34909286f8f.32.2026.05.12.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:29:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Wensheng Wang <wenswang@yeah.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] hwmon: (pmbus/mp2869) Remove unused driver data
Date: Tue, 12 May 2026 18:28:56 +0200
Message-ID:  <dcfcc82a93da77b55503998c5c7acf2a80c4a615.1778603083.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778603083.git.ukleinek@kernel.org>
References: <cover.1778603083.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=n7lDeT5UrmiDqvEe/Ogu6921tW+e2dx7Syh3kNmEwHE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqA1VLEFCIy4Nf1bdX1+orz8SDJK21eF6lmm+bQ /GymVqcB3CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagNVSwAKCRCPgPtYfRL+ TtlpB/4pR8fNUmEG/0Yk8WGJ9TRjvcgiaVqRLFIavKTrd8u1SkSgSm/nrTdINnCSG9Jx1HOvehS f40M42cK21tN2LEFjFPJlyMxLBMLE9gm8VbwjSnKOlLM91J8lClNK2Z63hr0dHvDJD2DGQTLONh IkFPL5dgiboKcGCZqkHcLcNpw8JUywEVc2RqO1FECOLM835sCOdx0JApAEWnq28DSTMrukdqzou FWqfx08BTSd5wyuyWhcQWq1AQkcGR60+vETlQ2+xZb8W2miR0bDPvQkyigaxHqvnR1FgMmuREHa kLpTCmMMZ0+EsFl/cTdTC3y7OXEXA5OAfp4AC4ifWjiwLYZh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver doesn't make use of the i2c .driver_data and the of .data. So
drop the useless and irritating assignments.

While touching all these lines, use named initializers for the i2c
device ids and convert to the most common usage of spacing in such
arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/pmbus/mp2869.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2869.c b/drivers/hwmon/pmbus/mp2869.c
index 4647892e5112..d345be920429 100644
--- a/drivers/hwmon/pmbus/mp2869.c
+++ b/drivers/hwmon/pmbus/mp2869.c
@@ -632,20 +632,20 @@ static int mp2869_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mp2869_id[] = {
-	{"mp2869", 0},
-	{"mp29608", 1},
-	{"mp29612", 2},
-	{"mp29816", 3},
-	{}
+	{ .name = "mp2869" },
+	{ .name = "mp29608" },
+	{ .name = "mp29612" },
+	{ .name = "mp29816" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp2869_id);
 
 static const struct of_device_id __maybe_unused mp2869_of_match[] = {
-	{.compatible = "mps,mp2869", .data = (void *)0},
-	{.compatible = "mps,mp29608", .data = (void *)1},
-	{.compatible = "mps,mp29612", .data = (void *)2},
-	{.compatible = "mps,mp29816", .data = (void *)3},
-	{}
+	{ .compatible = "mps,mp2869" },
+	{ .compatible = "mps,mp29608" },
+	{ .compatible = "mps,mp29612" },
+	{ .compatible = "mps,mp29816" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mp2869_of_match);
 
-- 
2.47.3

