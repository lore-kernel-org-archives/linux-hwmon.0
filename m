Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D664847B
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979981; cv=none; b=vA08RMAGJvBFSDBT0znFKoHjeMasgL5C7GqqyMmrq82GvH578kB64T3CM/M4zrw+abH8WE+8fj1hCDexL0PdFO2LUbFSID5xkaFSHlttVLHxI9d0ZwakbJawsFnkE67WqyCooLouI3sUuBh5c5qQrb3vrrjI1HumRrPPegjUvVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979981; c=relaxed/simple;
	bh=C+s6bT6/2j20jTabNKIqStu0kaui9YDR1omiL8wrkfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzMc0FfY9FnfIzAFELfj9Dmye7vHrtaF8iXGJz7tuFgENgzUhVI6/cLEorQiue8VmBhZ94k25f20G6M6SiEi03PRylN9zPv7RkhUa175TZQNF+p3G7QQHkH/RmgoDo516OZ9S4gj2bgjvW/T4OQ8ubBH/4u0TOc+0v4hQs7d9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6q10TPV; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6q10TPV"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3df121f7088so167328b6e.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979979; x=1725584779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ga23vIreQQEwRBzfzcdxyXuLyKBrowy0GqiTT1BBV5w=;
        b=h6q10TPVqKopJnuLcKKjf7ZfIOwe73q6F9jiIpcadGAE4MVPY4a1AR64VgjHmJB5oO
         hfJ2fSCXxjf8kiXIfWqBw6LpjvfRkDdT710PBz/rsbfehfMA6a098ucHCSR2T2MjrtQI
         m+ihthDoZXBOyjdZie1wQLD+3IyNbtubQKeJAD21GODQ7fYcBUhK9knitokPRfQys+KO
         m/PSY1hsAbHNwu8Pcp7CkTU1BCkSPLvfeu8W9AV7H8r9v4GRiTXGObH6pukBVlBTl5hF
         ASsC5tSg7Y+w7p6uIhdauA0hfIGJhU9qwLktRGtKGMXzwLmkWBsG0lZDjaPc1ssJFjtJ
         7tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979979; x=1725584779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ga23vIreQQEwRBzfzcdxyXuLyKBrowy0GqiTT1BBV5w=;
        b=nTVTgPiNRXbf09OhM1GHARqCS79pr3fVjcNhcTsO2eJgF7tTFE4ljiv5Q/rBGHhWjs
         9WVG3R5/B+HNUisemNZPuIRnIlTPwvZCYM/zVT/+7NnO3b0r1WAUPhQkY5cvmeHuUFsx
         yqgdw+aGi/LBxliaZEUfNtunWRuANG7/0MCNEOwu4Dl+gB/++BPpDBhw9D8ODJrePEVv
         VpTAXHcgMEg1hWvuTktSgqY5umevUrbL+QY3d8PGXZHzMCiE/iEKVb6u2Volq+X0bSOT
         eDfHEJjr7TbQ/7Z15F4ntFGXjSM3QTOLOE7ceSh35JTQv1YdD/URVZj0dUCK+NkkYcX1
         SoTQ==
X-Gm-Message-State: AOJu0Yz1GNP2lfWvlZVC6R298UFMlNUUW+B4bPTMCQUq+hhat6zD1tC3
	xf5+rF74eH5RcdOkfiJ4Qr/vOmY7Mt0Lw/iD5OWYQx2MNClX0yrn0d4b0w==
X-Google-Smtp-Source: AGHT+IGj4J484B0uGfmrdOkQWP5DVdZ/QZpWXFUGGrraBMvV6vSnkYN9jH9VvEL3mVsb4LdcrwnEKw==
X-Received: by 2002:a05:6870:6386:b0:25b:6d53:d294 with SMTP id 586e51a60fabf-277901652b2mr5433304fac.23.1724979978663;
        Thu, 29 Aug 2024 18:06:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a3b61sm1722625b3a.48.2024.08.29.18.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 12/14] hwmon: (ina2xx) Pass register to alert limit write functions
Date: Thu, 29 Aug 2024 18:05:52 -0700
Message-ID: <20240830010554.1462861-13-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the to-be-limited register to alert functions and use it to determine
conversion from limit to register value.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: New patch

 drivers/hwmon/ina2xx.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 339d41dfa10e..1cd6fffb1495 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -306,21 +306,19 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, unsigned long val)
+static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, unsigned long val)
 {
-	switch (mask) {
-	case INA226_SHUNT_OVER_VOLTAGE_MASK:
-	case INA226_SHUNT_UNDER_VOLTAGE_MASK:
+	switch (reg) {
+	case INA2XX_SHUNT_VOLTAGE:
 		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
 		val *= data->config->shunt_div;
 		return clamp_val(val, 0, SHRT_MAX);
-	case INA226_BUS_OVER_VOLTAGE_MASK:
-	case INA226_BUS_UNDER_VOLTAGE_MASK:
+	case INA2XX_BUS_VOLTAGE:
 		val = clamp_val(val, 0, 200000);
 		val = (val * 1000) << data->config->bus_voltage_shift;
 		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
 		return clamp_val(val, 0, USHRT_MAX);
-	case INA226_POWER_OVER_LIMIT_MASK:
+	case INA2XX_POWER:
 		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
 		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
 		return clamp_val(val, 0, USHRT_MAX);
@@ -355,7 +353,7 @@ static int ina226_alert_limit_read(struct ina2xx_data *data, u32 mask, int reg,
 	return ret;
 }
 
-static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, long val)
+static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, int reg, long val)
 {
 	struct regmap *regmap = data->regmap;
 	int ret;
@@ -375,7 +373,7 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, long val
 		goto abort;
 
 	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
-			   ina226_alert_to_reg(data, mask, val));
+			   ina226_alert_to_reg(data, reg, val));
 	if (ret < 0)
 		goto abort;
 
@@ -522,10 +520,12 @@ static int ina2xx_in_write(struct device *dev, u32 attr, int channel, long val)
 	case hwmon_in_lcrit:
 		return ina226_alert_limit_write(data,
 			channel ? INA226_BUS_UNDER_VOLTAGE_MASK : INA226_SHUNT_UNDER_VOLTAGE_MASK,
+			channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE,
 			val);
 	case hwmon_in_crit:
 		return ina226_alert_limit_write(data,
 			channel ? INA226_BUS_OVER_VOLTAGE_MASK : INA226_SHUNT_OVER_VOLTAGE_MASK,
+			channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE,
 			val);
 	default:
 		return -EOPNOTSUPP;
@@ -539,7 +539,8 @@ static int ina2xx_power_write(struct device *dev, u32 attr, long val)
 
 	switch (attr) {
 	case hwmon_power_crit:
-		return ina226_alert_limit_write(data, INA226_POWER_OVER_LIMIT_MASK, val);
+		return ina226_alert_limit_write(data, INA226_POWER_OVER_LIMIT_MASK,
+						INA2XX_POWER, val);
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.45.2

