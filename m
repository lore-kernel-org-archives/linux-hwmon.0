Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0873176FA7
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Sep 2024 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726662754; cv=none; b=OZJTpiYangUEEBWzkZx6fMnekWQctPlVYHa6DF7IAGH7FZHc3fJZ4NlLwDUIngLLVLeI6QeJtsTSt9f9aAycLjcD6yk3H/385z5Yc2D/qXPxVtfzL9zQ0Sq/8bnXz/PrXLnMRk83pXLNQ4GZhkdkIKhW7Cw9gHGW7wLhKdv1w70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726662754; c=relaxed/simple;
	bh=k/e8sexnbaLpBkVwmoPdX8j/uxUczSy0iafFq7Y1q/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jVXVA73wSqhy5i9LyxrHBVH128A1kgSmpZdbfUBi/5NscKpZK/IuRHZZQA/eLIzpQUtL/xILDKkji582spaEW8CgDhV5PPjIqnHQ0L8Lu11PDbbCdPgQBopgpctInk8Af4a8n1gbiIIxITqtyaJR9WEfaHUihqtOfXa2E6LViuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BCS+CA4G; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BCS+CA4G"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so5751491f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Sep 2024 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726662749; x=1727267549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDK+lSSJW6WOROUYDPuYq7Bhv6BCT719rN9H7IKqmc0=;
        b=BCS+CA4G9NhlQSRObD3liCVTVjc7glMxzf53akswpPXa7im8RT6Igui7BSSb0vJxH5
         y48VqlqgBUPFyG+X5Bvm9b+GLcdhoQHvA3ftk+8IW6MuqlUDfNpDNlZdUNhlrnSiHhtz
         FC5I52G2VH/ufwrTwJ/pEvgvVVajunTpxRCpLEEAHN86ZcVojvOgbY1Lf4DqZMFWlkhP
         YJyIfcbD8x9QCX8xzxKAOXVh59didQxAthjwjIL8VdxsGvncOAawjBxLnRaibudDCJJI
         rEigP8TOeBmImCdYoIqJFmaLhRD9ZM1NxmXL2uW+zFWY2WIpPjJI1J5fO1nTv6WNaDrp
         0Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726662749; x=1727267549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDK+lSSJW6WOROUYDPuYq7Bhv6BCT719rN9H7IKqmc0=;
        b=XVZGlqJQBX8g113I/bwi9KKcDVH83wbYEpAA7d8WRBFETvFXQq0GdaEbgdjKIgN0AA
         7GYHZ6KapyMnwUDDT18AwgzETx6Spf5iaRoMXs4wNAJE0zXa4eYg0Bg1sr98W7iw02DD
         zwoyPQ4BfnNk12EsAgYc5vAB8IhspkwQS1mOCixawmyATW1uMCA7GRNPEaHGR5hYR4Fw
         Pinn97vBCl1HckI4nZbQmuFTsyjjiBc+VWYS4rXCcedxi/i2jHj8JQmD2NQt1AWPrV2Y
         O0fKubhb0lpJctSW9hyEbP66mMkHNFpJ6vQDvDwnAlnJRBUmfjI6Ct4kFxHkBN39wy88
         YaIA==
X-Forwarded-Encrypted: i=1; AJvYcCUXAghJ0YyKyF/VQHa2TtjVn6JeRlM0yOu87zSFw3RYo7PQFUIZY6hQ4jJVlIPuFHvLvoKHB9t9Wt/zDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/kpmNqsAwvyRQmPxD6RMuBrDlDQBOsLHPU4l0b9XeNgf/i8s
	VFr8LuIPtTSW66UuSCdgEaD3nE12kUaaeEyUQn9Fbdc3LVONrvD+Et4aYseMG+0=
X-Google-Smtp-Source: AGHT+IGA3xaFF0ZJQiWZaLuzIrHBgVr6JiKXj5OQo1uhJICm26AP0EC/WU0hNGBC1dM1J0u5Dri3/w==
X-Received: by 2002:a05:6000:1f85:b0:374:c318:2190 with SMTP id ffacd0b85a97d-378d625b64cmr19009269f8f.59.1726662749208;
        Wed, 18 Sep 2024 05:32:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:a2bb:f619:b5e9:672f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061096735sm585401466b.44.2024.09.18.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:32:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Noah Wang <noahwang.wang@outlook.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed, 18 Sep 2024 14:31:49 +0200
Message-ID: <20240918123150.1540161-7-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3337; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=k/e8sexnbaLpBkVwmoPdX8j/uxUczSy0iafFq7Y1q/8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm6sg6ccP7/u2JfayEbAJjQH7vx0OQGulfTDfb+ dK/B/wPQyOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZurIOgAKCRCPgPtYfRL+ Tt+4B/93lJfpp5mtgCS9tkWygcBTaZpX1gf9VZjRBktTZPv0OC7d5zARiNYrlqyoq7jBXhM7OqG ukwlJuO+tVvYvUPloE+XTKQsgLW6Ihk3zVi7GZn4V/GbUyUWj6csMD5NSL8/N/y3MqylHIbdPHW Q/ztIs+3jcG8cqFvOrvS3OzI538Uq4zk9rHMjyVTe6EzoDgcrvi2gXQ0lbSMwRxvrrWnUMNe94G lG0NeN1M+qq7ZHWVL/Ao6hZnP4bT9gdNSxvOYi2D7Q38/Ua5rNq56enZ2g2bhFvXzSytNSEF69G /9XoQwDh8frLRlzGU2WtveEfhqQO3f9STksq7V2yUwQ91re3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While touching these structs, also remove commas after the sentinel
entries and use a consistent indention style.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/amc6821.c      | 2 +-
 drivers/hwmon/pmbus/mp2891.c | 4 ++--
 drivers/hwmon/pmbus/mp2993.c | 4 ++--
 drivers/hwmon/pmbus/mp9941.c | 4 ++--
 drivers/hwmon/sg2042-mcu.c   | 4 ++--
 drivers/hwmon/spd5118.c      | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index ac64b407ed0e..e86027f850c9 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -927,7 +927,7 @@ static int amc6821_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id amc6821_id[] = {
-	{ "amc6821", 0 },
+	{ "amc6821" },
 	{ }
 };
 
diff --git a/drivers/hwmon/pmbus/mp2891.c b/drivers/hwmon/pmbus/mp2891.c
index bb28b15a9103..94ab4ae5fba0 100644
--- a/drivers/hwmon/pmbus/mp2891.c
+++ b/drivers/hwmon/pmbus/mp2891.c
@@ -572,8 +572,8 @@ static int mp2891_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mp2891_id[] = {
-	{"mp2891", 0},
-	{}
+	{ "mp2891" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp2891_id);
 
diff --git a/drivers/hwmon/pmbus/mp2993.c b/drivers/hwmon/pmbus/mp2993.c
index 944593e13231..63691dac2281 100644
--- a/drivers/hwmon/pmbus/mp2993.c
+++ b/drivers/hwmon/pmbus/mp2993.c
@@ -233,8 +233,8 @@ static int mp2993_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mp2993_id[] = {
-	{"mp2993", 0},
-	{}
+	{ "mp2993" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp2993_id);
 
diff --git a/drivers/hwmon/pmbus/mp9941.c b/drivers/hwmon/pmbus/mp9941.c
index 543955cfce67..8ab5fc4d4092 100644
--- a/drivers/hwmon/pmbus/mp9941.c
+++ b/drivers/hwmon/pmbus/mp9941.c
@@ -291,8 +291,8 @@ static int mp9941_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mp9941_id[] = {
-	{"mp9941", 0},
-	{}
+	{ "mp9941" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp9941_id);
 
diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
index 141045769354..aa3fb773602c 100644
--- a/drivers/hwmon/sg2042-mcu.c
+++ b/drivers/hwmon/sg2042-mcu.c
@@ -346,8 +346,8 @@ static void sg2042_mcu_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sg2042_mcu_id[] = {
-	{ "sg2042-hwmon-mcu", 0 },
-	{},
+	{ "sg2042-hwmon-mcu" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sg2042_mcu_id);
 
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index fcbce5a01e55..6cee48a3e5c3 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -671,7 +671,7 @@ static int spd5118_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
 
 static const struct i2c_device_id spd5118_id[] = {
-	{ "spd5118", 0 },
+	{ "spd5118" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, spd5118_id);

base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
-- 
2.45.2

