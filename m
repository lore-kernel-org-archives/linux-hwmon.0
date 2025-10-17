Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7933031A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706190; cv=none; b=AsuPo4rK3odi9fQKm2m2gkCdg6Drwzn6EVy4aTb0x36jwR2MCGNdtZy3j1kjq3wE6DDRIrPCK2VGi1F0zuJmuNfChIb29zpuzW6/ynB2CikpuqTFNUJzZW9IIMlmghICSeamWgPjdAbno8D1+ES1ERiNZ7r/tifMfiluBCnNyVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706190; c=relaxed/simple;
	bh=OrpR3rlxs2VTYW0vFM/x0doSgZXzegwGhp68KWLpCNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pg09LV4sh1gE2YVRm8KZr5xqjFmW59cjA8FNYQizB7Lt02DsNFE3ai7in33v6kOAxBCpFUJKj0CxoHMhfOMAAi+6YRurhy1hA2EtH7U9ooC6FiS+9WVSCud6f/9z+nSipow+XbDyOEuma13eKF/cT0RlYWV4Op7s1m7NHD8OXtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfrGGLT7; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfrGGLT7"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7835321bc98so1836555b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706188; x=1761310988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG+WZwGbwQKWGxl8VYiVKTQqiiVm7JN1K4s+2Hen9D8=;
        b=dfrGGLT7UrSQjN+9ka9HQCPcUSb78D9g0yBavqcvZD1LTUri/b1jFVW0qJoEf1/BUJ
         fMkedul2Hii8U964FiZ+rUuilk/yabNa/JjraMTzw6NGarCtPTGb/wTfxO60XGvD7kSo
         4/iqHoOOW8c+zFCSXBhiaQ+SSX32BAwj9sHsSrPbBDgLCVEwd3hrVQNAp7r+xDUBcoWi
         wLUHu9k3d6vkh26U3sofHmajg4B8lkxlHy5DNDAZSIFjIQl/Fs8u31mYDthuNpHoMqxs
         HANd5AFHSqbBTTt7DRD4pQDVo2AvlltZbUT3g3NMhGYT02QftpY+Cv8aOmusfedsOGt/
         jd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706188; x=1761310988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG+WZwGbwQKWGxl8VYiVKTQqiiVm7JN1K4s+2Hen9D8=;
        b=wPV6j1dz/GHsbLIMAcYnEADhjLtl3JQffGEb0Bh77SUtmzIfW2bZzx2fxIO9R190UF
         JA5iXKXfl+mTEjluZ/yVw/MYxx7JExV5ZcL3gFHrnFrXJIJbhnfUUJDG0UJTY1gSp0ny
         9xQkRhPwkqh0qsJ7MWwnND5IuwW90s8udiQg4smHwPm9tjasrZzdVDMSYg4r6nJ0Ibos
         Z+pR+BUkh6Jeqqw4Y4BcZtzZeY4r6uAlqO+jVVax97yMSeGdXSn2VVJZ6pDz2Bp3C3Yw
         u464ew3u5LHeYE/r47zS+QJg7uvees+1otu8Dl0fDPpnqccVq1afk5ZCiCGVfMH9T+sE
         cSdg==
X-Gm-Message-State: AOJu0YypFOWqZB1G2/c9MrLfRDDydWCAwYba/LwXFuVQ7OSIaY/BnCgN
	S9HR8xoN4GHPES+AGboDA9TSsoDaWsAxM2eIWc9GWwvNfthTW/QkOd63mZFH2Q==
X-Gm-Gg: ASbGncsu7hjHyGfjawJFWSpePVM4dnvvMufHkWCK7aYZeynxD1qU9fIOdhOU7iXXoIM
	TM7Z0vvkY4ZLp0DIy7ZzOSTo98pbzGQSSZgCOUXW4AtnhRgRYLnInCIZiEhjAAU3jkftBUqwAoA
	YxNHJpa8c35kqobhhHb4Qz7IxDc+9Ux8MqKF+NY86lK6sgjzY93YYoxkuO6UNIHCCpRcnHZ9BtI
	BYE95kSOnd+tUCwlME3hICzUAHLV6CJTnGpLXWjw4sJZW6RV19g+gvFpLJFG4z8fhtWbUm0goVm
	tdZ7QZoCqwKnApBGOXZSWVGcZfNFfxba1LMc4Ad6QFXaoFTymxK+4Ima+IA9LdWfYqcHWdAzWwr
	XkieLsnWrRvNwUmF+LL15ZSRhy/80/jFKxdZ2MG6tEVkCTn9fK4CyCWkUW6TT3X4oe5bxfvJVR8
	zhQGVbX3KSLjrI
X-Google-Smtp-Source: AGHT+IE3sbTvtmbs7O1VamJT739Hh0uwm3s62N3dLSIO0IcZTXP/KNcEjY/Q4Y4x2/D3pZOHbX3BOg==
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-290dd1f3fc8mr16984285ad.51.1760706187813;
        Fri, 17 Oct 2025 06:03:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aa32c4sm63717975ad.79.2025.10.17.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 20/29] hwmon: (sfctemp) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:12 -0700
Message-ID: <20251017130221.1823453-21-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sfctemp.c | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/sfctemp.c b/drivers/hwmon/sfctemp.c
index fb1da93383d7..b78b2c099a12 100644
--- a/drivers/hwmon/sfctemp.c
+++ b/drivers/hwmon/sfctemp.c
@@ -10,7 +10,6 @@
 #include <linux/hwmon.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -49,8 +48,6 @@
 #define SFCTEMP_K1000	81100L
 
 struct sfctemp {
-	/* serialize access to hardware register and enabled below */
-	struct mutex lock;
 	void __iomem *regs;
 	struct clk *clk_sense;
 	struct clk *clk_bus;
@@ -92,15 +89,14 @@ static void sfctemp_stop(struct sfctemp *sfctemp)
 
 static int sfctemp_enable(struct sfctemp *sfctemp)
 {
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&sfctemp->lock);
 	if (sfctemp->enabled)
-		goto done;
+		return 0;
 
 	ret = clk_prepare_enable(sfctemp->clk_bus);
 	if (ret)
-		goto err;
+		return ret;
 	ret = reset_control_deassert(sfctemp->rst_bus);
 	if (ret)
 		goto err_disable_bus;
@@ -115,9 +111,7 @@ static int sfctemp_enable(struct sfctemp *sfctemp)
 	sfctemp_power_up(sfctemp);
 	sfctemp_run(sfctemp);
 	sfctemp->enabled = true;
-done:
-	mutex_unlock(&sfctemp->lock);
-	return ret;
+	return 0;
 
 err_disable_sense:
 	clk_disable_unprepare(sfctemp->clk_sense);
@@ -125,16 +119,13 @@ static int sfctemp_enable(struct sfctemp *sfctemp)
 	reset_control_assert(sfctemp->rst_bus);
 err_disable_bus:
 	clk_disable_unprepare(sfctemp->clk_bus);
-err:
-	mutex_unlock(&sfctemp->lock);
 	return ret;
 }
 
 static int sfctemp_disable(struct sfctemp *sfctemp)
 {
-	mutex_lock(&sfctemp->lock);
 	if (!sfctemp->enabled)
-		goto done;
+		return 0;
 
 	sfctemp_stop(sfctemp);
 	sfctemp_power_down(sfctemp);
@@ -143,8 +134,6 @@ static int sfctemp_disable(struct sfctemp *sfctemp)
 	reset_control_assert(sfctemp->rst_bus);
 	clk_disable_unprepare(sfctemp->clk_bus);
 	sfctemp->enabled = false;
-done:
-	mutex_unlock(&sfctemp->lock);
 	return 0;
 }
 
@@ -155,22 +144,14 @@ static void sfctemp_disable_action(void *data)
 
 static int sfctemp_convert(struct sfctemp *sfctemp, long *val)
 {
-	int ret;
-
-	mutex_lock(&sfctemp->lock);
-	if (!sfctemp->enabled) {
-		ret = -ENODATA;
-		goto out;
-	}
+	if (!sfctemp->enabled)
+		return -ENODATA;
 
 	/* calculate temperature in milli Celcius */
 	*val = (long)((readl(sfctemp->regs) & SFCTEMP_DOUT_MSK) >> SFCTEMP_DOUT_POS)
 		* SFCTEMP_Y1000 / SFCTEMP_Z - SFCTEMP_K1000;
 
-	ret = 0;
-out:
-	mutex_unlock(&sfctemp->lock);
-	return ret;
+	return 0;
 }
 
 static umode_t sfctemp_is_visible(const void *data, enum hwmon_sensor_types type,
@@ -263,7 +244,6 @@ static int sfctemp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sfctemp);
-	mutex_init(&sfctemp->lock);
 
 	sfctemp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sfctemp->regs))
-- 
2.45.2

