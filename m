Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18F18EA0
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2024 23:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbT9jLyt"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bbbc6e51d0so4646423b6e.3
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2024 15:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705101271; x=1705706071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZClw6cgDEALmw/l+mv66xwtWFB/XIxsCwxes24KnWK4=;
        b=DbT9jLytpCU/5YN7fXctDMrWv0yH+laysJtRaor1VQCEOg4H4fan8CPA042BrmaJ5+
         P2Rd6W1jsOqp97NTo0iuoeHAfZK+jCj/GBuWmyaQYkbcE77d0vik2F1aqVz79cR6wawA
         CSJ9AATHytKA/frGVKyHTRXmq0G2ax1wSlI3LMM473hpfNaUlZGt/FCwCUgfiuKQPxRq
         3/jfHeyzX7Hk0zZC4mmai9zgfMs+xvYQYH2eLLZHfeNVZkmx3sIKM33/yiw+kDUW+dME
         Qj3vzVrrrSe5u0WDkHG4n5HJz8K/LyubbpD9kdSN/dAKXuS4f/iWx7peuiQvyO+ESinp
         YDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705101271; x=1705706071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZClw6cgDEALmw/l+mv66xwtWFB/XIxsCwxes24KnWK4=;
        b=clqcSJL2LCCsHkFjmwnZRR6IhnlwDMzk0gvG29aL+NY2SVg6ekZK7ZIaQQ6zKJPTX4
         SAensGJskrfJvI0PRGrXlyd8/dg2fsRhgwMw4SS9NPeqDa/KfnMl80uz/wpa12UC3JfT
         Wb6W558+IBBjR9rG3K/QfcIsq+jkLJ4eVN2Oiro+kGq9eUl39UsXYwHmzAhsB9y8Wu92
         8xZ9QI5eab48kGD4UjTnGIfJTyi3NVvSCpHAheIbmyh/IkLC9WEqLjU/Gy9umgEC6WSE
         TR5NESld+PjnDoIjDfWljwPZQKTYoWxTKnYMt39X5oL8qSiobhAakW49VAH7roC64ox0
         VeKg==
X-Gm-Message-State: AOJu0YzE4ekBYqI0gSA5NuN1fDl+vBUnhTVHBxz64ZV/7ulaSRRPf1ib
	49yioKmjj9gihjjisrbkYT++diBA6Tw=
X-Google-Smtp-Source: AGHT+IF7Y7auV8N/Y6cva8nvU8Lz2tHH+P0r3OO01hQp7Ape77tcXOH1JSyhj1HLb9Enwy/mTiYEfg==
X-Received: by 2002:a05:6808:3986:b0:3bd:5ac5:cf07 with SMTP id gq6-20020a056808398600b003bd5ac5cf07mr2373901oib.36.1705101271352;
        Fri, 12 Jan 2024 15:14:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k4-20020a816f04000000b005fb06180ddbsm1732264ywc.145.2024.01.12.15.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 15:14:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH] hwmon: (npcm750-pwm-fan) Fix crash observed when instantiating nuvoton,npcm750-pwm-fan
Date: Fri, 12 Jan 2024 15:14:26 -0800
Message-Id: <20240112231426.806485-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 89fec128d5d1 ("hwmon: (npcm750-pwm-fan) Add NPCM8xx support")
introduced support for PWM fans on Nuvoton's npcm845 SoC. This chip
supports three PWM modules with four PWM channels each. The older npcm750
only supported two PWM modules. The commit did not take into account that
the older SoC only supported two PWM modules. This results in a crash if
npcm750 is instantiated when the code attempts to instantiate the
non-existing third PWM module.

Unable to handle kernel paging request at virtual address e0aa2000 when write
[e0aa2000] *pgd=04ab6811, *pte=00000000, *ppte=00000000
Internal error: Oops: 807 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.7.0-next-20240112-dirty #3
Hardware name: NPCM7XX Chip family
PC is at npcm7xx_pwm_fan_probe+0x204/0x890
LR is at arm_heavy_mb+0x1c/0x38

Fix the problem by detecting the number of supported PWM modules in the
probe function and only instantiating the supported modules.

Fixes: 89fec128d5d1 ("hwmon: (npcm750-pwm-fan) Add NPCM8xx support")
Cc: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/npcm750-pwm-fan.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index d9733da8ea34..904816abb7c4 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -195,6 +195,7 @@ struct npcm7xx_cooling_device {
 struct npcm7xx_pwm_fan_data {
 	void __iomem *pwm_base;
 	void __iomem *fan_base;
+	int pwm_modules;
 	unsigned long pwm_clk_freq;
 	unsigned long fan_clk_freq;
 	struct clk *pwm_clk;
@@ -710,7 +711,7 @@ static u32 npcm7xx_pwm_init(struct npcm7xx_pwm_fan_data *data)
 	/* Setting PWM Prescale Register value register to both modules */
 	prescale_val |= (prescale_val << NPCM7XX_PWM_PRESCALE_SHIFT_CH01);
 
-	for (m = 0; m < NPCM7XX_PWM_MAX_MODULES  ; m++) {
+	for (m = 0; m < data->pwm_modules; m++) {
 		iowrite32(prescale_val, NPCM7XX_PWM_REG_PR(data->pwm_base, m));
 		iowrite32(NPCM7XX_PWM_PRESCALE2_DEFAULT,
 			  NPCM7XX_PWM_REG_CSR(data->pwm_base, m));
@@ -946,6 +947,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	if (!data->info)
 		return -EINVAL;
 
+	data->pwm_modules = data->info->pwm_max_channel / NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm");
 	if (!res) {
 		dev_err(dev, "pwm resource not found\n");
@@ -983,7 +986,7 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	output_freq = npcm7xx_pwm_init(data);
 	npcm7xx_fan_init(data);
 
-	for (cnt = 0; cnt < NPCM7XX_PWM_MAX_MODULES  ; cnt++)
+	for (cnt = 0; cnt < data->pwm_modules; cnt++)
 		mutex_init(&data->pwm_lock[cnt]);
 
 	for (i = 0; i < NPCM7XX_FAN_MAX_MODULE; i++) {
-- 
2.39.2

