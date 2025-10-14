Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18BD2877E3
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455542; cv=none; b=RvI+TKACDIXJOuWVzmLaBVIDc3h37/HInEZvLYUjScATRmrPV4aCJ0xfOgzSkSLlvYJlpcjhtqexoLTmRCiq/i7ulGYCUzse3mT9gd+6uB5G9jvi4soiqglqGG7xX2XEqCSH+GRsd97Y6igXKYGyCI7RuKa9kGFFeQO/fk+pJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455542; c=relaxed/simple;
	bh=YBMq3PECbLkdXJNpZOQcuz9xxZkAZpUuAKLOLlmZ54Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLL3l3IvbdJs7NLBoUEufREcwYRBEpURgrH8J76ATlilc7kkFP++1r3R7qHYV/C8YSk/j6V/MAcdM3thXpFhmHsUu6lIo1mFRO+tHGo6+GnizmSm0CimQfWJkHgK+2Czhl/HOiiYV9cdcyQ+efCMi5OJl3Wq1jtwp8QvUbVcj+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNeI2NS/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNeI2NS/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78125ed4052so6418344b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455540; x=1761060340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuDT51GMm2ZhSStUj8Y+4zQJmYnncR/EbRMF1fnv3WI=;
        b=ZNeI2NS/Yuux4qAF4HrIKZLvvenfnIEgSp0L+PjHxP2xI7UNRrfnzcQn81XHvxWm9C
         2j39HfSunpHQSEpBJ1z7V7g8elPgiVL2o3FSe5fqbMd6KPVCrGiMusCBwFK063OEOcb0
         Qx9JTG0at22IqDOmbDPP2RByb0ZO9P4/UX134pfRKbg3FZKMHUiIkJiByEu5lEV1t3hE
         wiOCnOE+BcYnsQk3PmYoaoNicykLLYOZLaT0YIhx3/fi3AkLQbrhFyRjzmreFKip6iPQ
         50nnHfTzm9rfL63w4PikHUPWej8Hj9V6YA8u3Zfx9PYdsA3Iq3tHSLAtfaHu6fKKbQ22
         vPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455540; x=1761060340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IuDT51GMm2ZhSStUj8Y+4zQJmYnncR/EbRMF1fnv3WI=;
        b=BAXRPFGG/Tx2kXFBfauut4WJ58fDoyXaIX2rJRrdjQDGlPln5NvWB1/LcxY94a1hJp
         lt7GN6lTyKyNFuTE3TJgan720EYR+1sPq2cE50MxsQ5dS53eMNcyiXTLH+Net0LMHw+v
         uqacYWzvf0OdJ+jyz3JYPh8dbveqzhwbIG0b95BJ/QdLHSJRDtNNNSYzSjFJN8y5npWO
         NOWOfahZFNFLPIRKXV7YweWtGHJAVXU+ZF7eI6puG/I4Iv4ZqIRV5q4+sEAa1XQNXlYj
         sezj5eD8ULuJbw/L9iuDr65++gKjd+VtdgWv0Qk8rzvgGD7T2CZHweeP7Cu3yNzW0Hrw
         M3SA==
X-Gm-Message-State: AOJu0YzF/0WnUNr6odsJqIUrFl5cPB1Ntbd2+8XD6FU6FqxuFZQ9L/g5
	s8EUiXCfOp5kwaub/RfL5XpieXzWqwrGdSbLqtIWNQJ72vA8SajSe3HpM30+XQ==
X-Gm-Gg: ASbGncsOjSqPyJcXoG0NfhfduCGZNEHGGD7o8doOZ73KzhbgfGZ5TRvl6QpFH0lbWv7
	j8MHn3KPl8fNQVlhJCz66tWkdIdWSrdQws1plheTej5bXFAQxwXU4TIEkwRYe54fIco09hj5ARg
	ZCXenwF7wWM/L1MyIvTdMmyVOQtvSnkvHrvrXO454gQtBekT9GIqwAOFx2o9yhX3D7guqyUsbf+
	TS2HSBiBbKCl8P0iKKIl8XcI/evcCnUhLUFCqGSiZFrnx6A47AxwOe0YZQIv69n4MKQYCpFXrzf
	JxEOoNpeKbl90hQNmiXaUx6ko8yV5LFjdFQxrZs3l1CX+c6uAgHqEzklbQpZvGc+qxHVrQopu2d
	wde1lRv+xHIhR1qKD0uaJunkXhAo4wvfqyGU/W9UZd36WQ2iyXlXUCBF4KTPihSDa
X-Google-Smtp-Source: AGHT+IFfFF9DsA1jz9fdbj3k5Le6li5iDfILQfONL9lUa1lKkkXWbVOeSBYiDAas8/1T6og9KZskcA==
X-Received: by 2002:a17:902:e5c5:b0:264:f3ed:ee10 with SMTP id d9443c01a7336-290272157b5mr359325785ad.11.1760455539869;
        Tue, 14 Oct 2025 08:25:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290766cc2a1sm33539995ad.95.2025.10.14.08.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/20] hwmon: (max6639) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:10 -0700
Message-ID: <20251014152515.785203-16-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

While at it, drop unnecessary include of hwmon-sysfs.c.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6639.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index a06346496e1d..99140a2ca995 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -16,9 +16,7 @@
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 
@@ -75,7 +73,6 @@ static const unsigned int freq_table[] = { 20, 33, 50, 100, 5000, 8333, 12500,
  */
 struct max6639_data {
 	struct regmap *regmap;
-	struct mutex update_lock;
 
 	/* Register values initialized only once */
 	u8 ppr[MAX6639_NUM_CHANNELS];	/* Pulses per rotation 0..3 for 1..4 ppr */
@@ -249,16 +246,11 @@ static int max6639_write_fan(struct device *dev, u32 attr, int channel,
 		if (val <= 0 || val > 4)
 			return -EINVAL;
 
-		mutex_lock(&data->update_lock);
 		/* Set Fan pulse per revolution */
 		err = max6639_set_ppr(data, channel, val);
-		if (err < 0) {
-			mutex_unlock(&data->update_lock);
+		if (err < 0)
 			return err;
-		}
 		data->ppr[channel] = val;
-
-		mutex_unlock(&data->update_lock);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -320,21 +312,17 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
 	case hwmon_pwm_input:
 		if (val < 0 || val > 255)
 			return -EINVAL;
-		err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(channel),
-				   val * 120 / 255);
-		return err;
+		return regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(channel),
+				    val * 120 / 255);
 	case hwmon_pwm_freq:
 		val = clamp_val(val, 0, 25000);
 
 		i = find_closest(val, freq_table, ARRAY_SIZE(freq_table));
 
-		mutex_lock(&data->update_lock);
 		err = regmap_update_bits(data->regmap, MAX6639_REG_FAN_CONFIG3(channel),
 					 MAX6639_FAN_CONFIG3_FREQ_MASK, i);
-		if (err < 0) {
-			mutex_unlock(&data->update_lock);
+		if (err < 0)
 			return err;
-		}
 
 		if (i >> 2)
 			err = regmap_set_bits(data->regmap, MAX6639_REG_GCONFIG,
@@ -343,7 +331,6 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
 			err = regmap_clear_bits(data->regmap, MAX6639_REG_GCONFIG,
 						MAX6639_GCONFIG_PWM_FREQ_HI);
 
-		mutex_unlock(&data->update_lock);
 		return err;
 	default:
 		return -EOPNOTSUPP;
@@ -753,8 +740,6 @@ static int max6639_probe(struct i2c_client *client)
 		}
 	}
 
-	mutex_init(&data->update_lock);
-
 	/* Initialize the max6639 chip */
 	err = max6639_init_client(client, data);
 	if (err < 0)
-- 
2.45.2

