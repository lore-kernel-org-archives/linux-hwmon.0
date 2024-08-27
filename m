Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B48D517
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772908; cv=none; b=orTidXqqToWg8OY0Pk7G52uk/xFaf5ZzlYFtIeJvWQGTXKLidqMd1hw9LuHFoIWfqChQEIDDgRO3oV7hrx0yINQiP66WwL4QyZqAMGSFfzhWIC4EXqYN8+Otc/slshakLGk6VJkA7WEjbyfNSyc/Q6esB0KjkaT3TfwdxMkoCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772908; c=relaxed/simple;
	bh=QJuL1urQTqLi0RV/vO+ZUiWmT2TTgsdlTukrg6oA/w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl68UvtqEV31Q4KEJ5/7EeOO/uukZG+JufADZQIVDFMpFBlS6jlI7yUOYtHrtFhUg4mWZKiC6zwcLmYSrIlrt9TbI6ZGgidJ+FS8E3SibmUZYwpgW/vKgt8Uo+kuODnEOPyeRuGyoQggRU6pKUOLskJ8U1ujtWynubEXxDMsF14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLd4vQ3K; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLd4vQ3K"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71423273c62so4091966b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772906; x=1725377706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzjaPJsXru0/maw2LmzdmhbHLjPNXrkm9DdhXyTj2tM=;
        b=dLd4vQ3K3JCY/iuSCdzYSwFDT4CDHquqLUHMyw/0oMwK0z8dw26kutZDzhuLQmG85D
         63qUlfuehtNSofkK4xM2Li7pFVKMXMoSkqloZgMot2IlgvhOjbjRcOKspz3n/ZzWoZUq
         VtkYsjdgjbzTHPtVDqt4w5nykUYqZ0qGapgOPSRWALyaTP67j8yVSkpfEvCZEOPRg+fv
         mwOI7D7Rovt+Q2XpiKNYSu5Dt1T4r34IwXO0ToHZsconYQOl/iwhyT+Ad33/RKfnBCGC
         N3mo4zXLnfMZyWSN0CzCU6oEMQMPfryJBMvk0OsIC5u7XwLeVNLKej8ISz6MPmU9Mh12
         Em8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772906; x=1725377706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzjaPJsXru0/maw2LmzdmhbHLjPNXrkm9DdhXyTj2tM=;
        b=m6XyyCrb13mFxAt1STVIJFZSqsJ87yAIsXs6rxLSTvJTj4Nue+0ku8qOBHXI49wXdO
         cQ2gQFCpgcYE6ftaJhjgvVUd5WBdzyninEoOUcew1IAGbncn6jOPmb9VqV/3AqBWlGfT
         6uMj+PQ21qCNZUoyZsvwFU3PZKsdaV1XIpF0QhEK5xvk91HkCiRyrJrm1atQMQySwI0Y
         6fRPu0qDHt5/jEAJbHcA9Y+fQ4qLk42rfW+i4XvSOYHvsg0wtNXXqPjCiYkx2V9TA2lG
         f64+D7WI7v6fDrhODsWA96HcjG0V+mPHCoEE1gnH05hD0udVB2MM2UmKHZnWdZRTiGpX
         Njkg==
X-Gm-Message-State: AOJu0YzXvxTeJ5MKg54VU9U4Qw0f0tYHEh1TZD3oG23pys/PPbJHhLYR
	DudIO74iQQ82F5qZHDVhjZX0ZcaNawXs/zVlELiLb7AsbTq1sDrj9Ia91Q==
X-Google-Smtp-Source: AGHT+IFa2eQdxz6idpcX43Sl4fUnjCLXw37rMHxS9XlxAFpR6G7254vMnfSOqPpWVBYLLDzmx4Ipkg==
X-Received: by 2002:a05:6a20:c896:b0:1c9:1605:2a3a with SMTP id adf61e73a8af0-1cc8b0e74a1mr16375214637.0.1724772905817;
        Tue, 27 Aug 2024 08:35:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434236aeesm8716797b3a.30.2024.08.27.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/11] hwmon: (ina2xx) Mark regmap_config as const
Date: Tue, 27 Aug 2024 08:34:48 -0700
Message-ID: <20240827153455.1344529-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent versions of checkpatch complain that struct regmap_config
should be declared as const.

WARNING: struct regmap_config should normally be const

Doing so reveals a potential problem in the driver: If both supported
chips are present in a single system, the maximum number of registers
may race when devic es are instantiated since max_registers is updated
in the probe function. Solve the problem by setting .max_registers to the
maximum register address of all supported chips. This does not make a
practical difference while fixing the potential race condition and reducing
code complexity.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 1b4170d02c94..9d93190874d7 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -50,10 +50,6 @@
 #define INA226_ALERT_LIMIT		0x07
 #define INA226_DIE_ID			0xFF
 
-/* register count */
-#define INA219_REGISTERS		6
-#define INA226_REGISTERS		8
-
 #define INA2XX_MAX_REGISTERS		8
 
 /* settings - depend on use case */
@@ -95,9 +91,10 @@
  */
 #define INA226_TOTAL_CONV_TIME_DEFAULT	2200
 
-static struct regmap_config ina2xx_regmap_config = {
+static const struct regmap_config ina2xx_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
+	.max_register = INA2XX_MAX_REGISTERS,
 };
 
 enum ina2xx_ids { ina219, ina226 };
@@ -105,7 +102,6 @@ enum ina2xx_ids { ina219, ina226 };
 struct ina2xx_config {
 	u16 config_default;
 	int calibration_value;
-	int registers;
 	int shunt_div;
 	int bus_voltage_shift;
 	int bus_voltage_lsb;	/* uV */
@@ -128,7 +124,6 @@ static const struct ina2xx_config ina2xx_config[] = {
 	[ina219] = {
 		.config_default = INA219_CONFIG_DEFAULT,
 		.calibration_value = 4096,
-		.registers = INA219_REGISTERS,
 		.shunt_div = 100,
 		.bus_voltage_shift = 3,
 		.bus_voltage_lsb = 4000,
@@ -137,7 +132,6 @@ static const struct ina2xx_config ina2xx_config[] = {
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
 		.calibration_value = 2048,
-		.registers = INA226_REGISTERS,
 		.shunt_div = 400,
 		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
@@ -646,8 +640,6 @@ static int ina2xx_probe(struct i2c_client *client)
 
 	ina2xx_set_shunt(data, val);
 
-	ina2xx_regmap_config.max_register = data->config->registers;
-
 	data->regmap = devm_regmap_init_i2c(client, &ina2xx_regmap_config);
 	if (IS_ERR(data->regmap)) {
 		dev_err(dev, "failed to allocate register map\n");
-- 
2.45.2

