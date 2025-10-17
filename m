Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B863314A4
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706207; cv=none; b=P0mvSSX3JnO0y1ZDPIIrrUT/rYOnCINAIk3fwMMaEaTex70LpYIiYlNb0bxkhlX78sHXTdL9WS0TY/VBrzKs4+kgcLberQ/us/wu4ZU+kZUNwXkEvrC3f5+0DbTpxVGMHyQJwT0lHWmtF+gvVGXVB0rBOP/o4LRwHCU3g627M5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706207; c=relaxed/simple;
	bh=Q8Ora9dy/otdqoA+dSCPALpO9zD9iS0SZL0S/2Bbp4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tbp33UhNsePZyK2uHUFAV2EN89/jjg3nzxQguAEI5BHRp02ifVmqV1JJZyf9P0GrPIS3lKQebx6xXF38Q/Br72jOMtPEjcBn4tQ8OQ+aw4bv0Q622avvJL0vsxWowH6MLfCplx5RqGXSznVPiU4IaPPVZS9Q1zpQR4HCWMt9H3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItjJc7j1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItjJc7j1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-290dc63fabbso6576845ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706205; x=1761311005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d2+IQvWeWA402dN/h4+dAhkQys205EkiicrvQqMh7Y=;
        b=ItjJc7j1pQ1esTCXiOaEa8IyZ4QgjWq11kREQwRAhe34qCMiPG7P4G4kWGUL92FvIT
         PHP9TDGfNKGm03Fa0lRfH5HXs7e7OaRajAjsNN0UY8eaVsUtp6xmrU16EN9ghBK4UINR
         yFR0n/WwkyR8d4dkeXl+4BbS8+DyT45CyNgRuZNzbutW4Wotfu44acg7L8jWGP/V3tLb
         mp/dld5uuNMrPO13Aku1dOGCl4NRw6AfPsFGhZc/bN+5AbH0CgBCf4jhn/dWDW1ARblH
         tqTmpZwyaliofxJ6lEvW2pERK6xdeAMIH5amEMmBWlGneSueEsxYYsNpB80jYan/ZnBW
         0gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706205; x=1761311005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7d2+IQvWeWA402dN/h4+dAhkQys205EkiicrvQqMh7Y=;
        b=bp8neJkNgw2CNYU6pnLjvvaX/fhT9OacEY8qw3KbpC/RnawuSKltGYvpYAI08re9eu
         u3yj+fLz9xRU5+q3n2XgOps/j+IIuKoX6I27NHnE90WrGbuOiWtwvD9djOmP5H5F0JPe
         cJTi2xb6lfOQM/qGh3A232PfRIMcCw/z2GEStITH9B6Fll/IZH50nEMqX9nVYgKXcU+k
         a5WwSVjhx1EMFsV7V+GYfM4QKCHWZNHcO8a3vwzoAnz8xhh+gZqPRC9uKnySvI4+0l4u
         7iRrKBj4uHI3f9ZXT3AZFDltMu+Y0lsuvjikgrwoDM+Ko9DWg0qXV9benf+Q5sHMtL9d
         Ba4w==
X-Gm-Message-State: AOJu0Yx9j4Bkk7HaeHREyCj/t5VSGQ2XiZhnPiR1HJ1cNZOAR3CST50m
	Dq4IpuxgRcpp6Uux6vukDFmv5yYTJJuSFA4F9cQ6pkYowVazbfgtps3Vr4R1jg==
X-Gm-Gg: ASbGncu7Rk6B3jlS2+AdjU0263WZf1pphc0tUv8/1+WckId2kWH895K2fwb2vcDXYhT
	qOYfsrG1uOXVjLWUh0bRXq39Rp6tAyYHbDoHC+RiRMn67UmRaEDhrc7wlmIrk+NdbbCXNwy/ES1
	uV3rdid79gsh42G8eYb6fTZvJivcAk8EUBFmyrsd3IwyzV1sRpLIiI0p8PomlvKuIlY6s4nYOZb
	2LQLZdUxpHg1pxBP6HkPTbaSLDCyDzd+/iyeaZfwxzvIDVEXRpAgYmKZ9HOgsl8A87E0jQMZ8RQ
	LHxfksoTtJCgy1V6RtuNVzSYko9zLZRQ0B6ivs77HKgLTlWuXeFuuJDTRSO4xd5JMfpKgCY9lVL
	K2Xga6ExJBc/X0XKNXqQ69sulUCQtx24PLufLVm/lIyzVMR/iGvnp80FNIerxpm6elRva8mxopy
	WIscfSDqJWeNMqxCw6V+EIkL0=
X-Google-Smtp-Source: AGHT+IGOsiUeqpLONkY2hccEjnK25gV1T6lK/AduhuP4XFCb6L1UjrTjLlW5stT8UYECsVAiYeaokw==
X-Received: by 2002:a17:903:46d0:b0:26a:b9b4:8342 with SMTP id d9443c01a7336-290c9cf2ca2mr47677165ad.25.1760706204763;
        Fri, 17 Oct 2025 06:03:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aba3fcsm63275515ad.99.2025.10.17.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 29/29] hwmon: (corsair-psu) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:21 -0700
Message-ID: <20251017130221.1823453-30-linux@roeck-us.net>
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
 drivers/hwmon/npcm750-pwm-fan.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 802c73def428..c8f5e695fb6d 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -4,7 +4,6 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -198,7 +197,6 @@ struct npcm7xx_pwm_fan_data {
 	int pwm_modules;
 	struct clk *pwm_clk;
 	struct clk *fan_clk;
-	struct mutex pwm_lock[NPCM7XX_PWM_MAX_MODULES];
 	spinlock_t fan_lock[NPCM7XX_FAN_MAX_MODULE];
 	int fan_irq[NPCM7XX_FAN_MAX_MODULE];
 	bool pwm_present[NPCM7XX_PWM_MAX_CHN_NUM];
@@ -221,7 +219,6 @@ static int npcm7xx_pwm_config_set(struct npcm7xx_pwm_fan_data *data,
 	/*
 	 * Config PWM Comparator register for setting duty cycle
 	 */
-	mutex_lock(&data->pwm_lock[module]);
 
 	/* write new CMR value  */
 	iowrite32(val, NPCM7XX_PWM_REG_CMRx(data->pwm_base, module, pwm_ch));
@@ -245,7 +242,6 @@ static int npcm7xx_pwm_config_set(struct npcm7xx_pwm_fan_data *data,
 		env_bit = NPCM7XX_PWM_CTRL_CH3_INV_BIT;
 		break;
 	default:
-		mutex_unlock(&data->pwm_lock[module]);
 		return -ENODEV;
 	}
 
@@ -260,8 +256,6 @@ static int npcm7xx_pwm_config_set(struct npcm7xx_pwm_fan_data *data,
 	}
 
 	iowrite32(tmp_buf, NPCM7XX_PWM_REG_CR(data->pwm_base, module));
-	mutex_unlock(&data->pwm_lock[module]);
-
 	return 0;
 }
 
@@ -932,8 +926,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *hwmon;
 	char name[20];
-	int ret, cnt;
 	u32 output_freq;
+	int ret;
 	u32 i;
 
 	np = dev->of_node;
@@ -985,9 +979,6 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	output_freq = npcm7xx_pwm_init(data);
 	npcm7xx_fan_init(data);
 
-	for (cnt = 0; cnt < data->pwm_modules; cnt++)
-		mutex_init(&data->pwm_lock[cnt]);
-
 	for (i = 0; i < NPCM7XX_FAN_MAX_MODULE; i++) {
 		spin_lock_init(&data->fan_lock[i]);
 
-- 
2.45.2

