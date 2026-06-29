Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F6418871F
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 23:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777308; cv=none; b=XGGwXw3OPj98ykiSIAjkmoqawQ5cBi4o9Q0NmuFRWTvYiFdtOHflpdnZcSoa7Oj/XQ4xZm0v5LCKNq3syq0PCwpcAw7pM+alpLZYhPTjJMDi04DTy/3ZWTn+N1smWbbHbgOdOb7l9K+0KYA6ojYwfq/RFiSfWdrN/+y0IPujhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777308; c=relaxed/simple;
	bh=4mIyV2wapAnnJSGlHFEJx/XR8mH4yttOrtmtrMfB4Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vf/+qgh+EKcICd+ijM9tFkC+F2eHpNqDq7whL9c82hhYheCylmSWkIL6M6WXc7u74S9scaPvbRzcODTxlyS62s8U0e5w+eqFW7LuHEfMH20scXXrAm2WK4PmW0GULjX/pcG3bqhoM3zFRhKN9UeAeMbfNFQoV2N18PXCCfXnh/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsm9UBxl; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsm9UBxl"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-139f3eaaa49so1524661c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782777306; x=1783382106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sTpPS6wciqjNTaVQCmai131gXvSiSGdWzlrshlTNtsI=;
        b=bsm9UBxljnAf5qb+FPFtBtb4GIAN0IwnFRqeHXkwVkA3qywIH/pyPHi2x5Z7FqU8RP
         R7GJadQGhivDZxV9ioBIcOZY+elUkGlkYIkrHUe86qN60PFsZP50rsf1GL19xvCbPdfd
         DawKq//cn0rEV8SCclkCK84h3YdSkvstMDl7/apVXXhMeFjxXN/gVvPdLapAYDohiLDL
         HvoPFon7OkpJ+Z5fL9C39zzjUgiJealYckqavgzQzeC1HnsWqflxzeA4pYT57qBz8gP5
         LLkbtZ/MBulg7DpBiMEje07l35rbSWvpqOons1WwwWi8vtUSh9Nvr44032cK0vnvNaZj
         JNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782777306; x=1783382106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTpPS6wciqjNTaVQCmai131gXvSiSGdWzlrshlTNtsI=;
        b=jMbr0Ch86Xj5ghykeKGRFSPrs/c27PaUOkFUh1nej5aR8Y/Y4MlpMUXaAjbxX8aE26
         ZXNOC6nQK8RF040DEqcjU4/kQINnlHKXVCErn/M56t1URbMJYfEzlzxiwzK5hIbrgvoT
         vcIivN6FYLQ9ouSvaMQbysu/1Z4apd/6glCOu7xTn971MYejLdJH4Yjg7Q8WG14FtHk7
         /+sXQ9nEqFcJ12vxo+51CnsKSoMfoXaNy0wwhCnTJ54TZf/mPwcY3TwW1vjVWGBwErnT
         /QHfNTsEbRakI2WbpYh/KCkP2f5D/Lx9PwrQhXyOABZjmkyLOlf0zAY+2IyJbjEHqhI7
         S9Vg==
X-Gm-Message-State: AOJu0YxF9I1UZs29K8EhGE6aV7ttY0rf9ZsP9rRnYvcaeiKQ+tNZddI7
	d5B/Xg3CDJSsGzQ2WYCrymbRzZQCm/5RPPTBQ4idWtg9bslwLOjLDJPibTU08A==
X-Gm-Gg: AfdE7cmaTvZiG+sTf1HpUcPUeebbp/Twnel61B1ebOUFYO6hcJtGc6mBSRUrCp5aYsY
	eChG6Jkyj22hU7Mv0QQBgZLbS3OL5py/C7CMzghALPmnGcAhWJK0a28oR/QLde0NqVZo1uZtZNM
	FgjuTHKshBuj/P16n7h7UqRzjuOgHVfPQM0ZcTYQX1CWeWMfvcEbHBMmqBn2NAKfjiZ8EPXhPoP
	YXHZYL5ePJJle2vtym76QwJb1F92TSRjAuelQsD5ABODEKla22N9bUZLHf4n855GbHDlZDPqshw
	ITNyMQmR4khn2XwH0OsHmeiItK+1BQ3HHUXeGiTgNI2TV1NNo7oYQPoGe2MDyLgkIVQ1izKg3qG
	ocOv3R4F7QW3z3zBL8ax70CJjSGgaMZHKgSzgNpreObA5iYY6j2zrCbH61FNldf4ZtxSpHDozPa
	cCWE45mtGVGTtFCODc19b2Vbuykw==
X-Received: by 2002:a05:7022:79f:b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-13b2a0a0e57mr923377c88.0.1782777305916;
        Mon, 29 Jun 2026 16:55:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm1556276c88.3.2026.06.29.16.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 16:55:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tach) Validate the number of tach channels
Date: Mon, 29 Jun 2026 16:55:03 -0700
Message-ID: <20260629235503.2019362-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

In aspeed_create_fan_monitor(), the driver reads raw channel numbers:
ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
Then in aspeed_present_fan_tach(), it uses the unvalidated channel value
to index into the statically-sized tach_present array:
priv->tach_present[ch] = true;
It also uses the unvalidated channel value to calculate MMIO offsets:
val = readl(priv->base + TACH_ASPEED_CTRL(ch));
If the device tree provides a channel number that exceeds the maximum
allowed channels, could this corrupt adjacent memory and trigger
out-of-bounds MMIO accesses?

Fix the problem by validating the number of tachometer channels reported
from of_property_count_u8_elems() and return an error if the number of
tachometer channels exceeds the number of supported channels. Also, in
aspeed_present_fan_tach(), validate the actual channel number in
aspeed_present_fan_tach() and return an error if it exceeds the number
of channels supported by the driver.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260629232305.2013406-1-linux%40roeck-us.net
Fixes: 7e1449cd15d10 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 5d611a8e5269..2cb3f2e1aeb2 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -402,13 +402,16 @@ static const struct hwmon_chip_info aspeed_tach_chip_info = {
 	.info = aspeed_tach_info,
 };
 
-static void aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u8 *tach_ch, int count)
+static int aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u8 *tach_ch, int count)
 {
 	u8 ch, index;
 	u32 val;
 
 	for (index = 0; index < count; index++) {
 		ch = tach_ch[index];
+		if (ch >= TACH_ASPEED_NR_TACHS)
+			return -EINVAL;
+
 		priv->tach_present[ch] = true;
 		priv->tach_divisor = DEFAULT_TACH_DIV;
 
@@ -424,6 +427,7 @@ static void aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u8 *tach_
 
 		aspeed_tach_ch_enable(priv, ch, true);
 	}
+	return 0;
 }
 
 static int aspeed_create_fan_monitor(struct device *dev,
@@ -434,7 +438,7 @@ static int aspeed_create_fan_monitor(struct device *dev,
 	u8 *tach_ch;
 
 	count = of_property_count_u8_elems(child, "tach-ch");
-	if (count < 1)
+	if (count < 1 || count > TACH_ASPEED_NR_TACHS)
 		return -EINVAL;
 	tach_ch = devm_kcalloc(dev, count, sizeof(*tach_ch), GFP_KERNEL);
 	if (!tach_ch)
@@ -443,9 +447,7 @@ static int aspeed_create_fan_monitor(struct device *dev,
 	if (ret)
 		return ret;
 
-	aspeed_present_fan_tach(priv, tach_ch, count);
-
-	return 0;
+	return aspeed_present_fan_tach(priv, tach_ch, count);
 }
 
 static void aspeed_pwm_tach_reset_assert(void *data)
-- 
2.45.2

