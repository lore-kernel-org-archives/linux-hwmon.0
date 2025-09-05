Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE862D3EDF;
	Fri,  5 Sep 2025 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104948; cv=none; b=a4oUYAyI75Jkyr5v26VvV7dvuxBjNgD2x3Dp7BeBQjOiQR2f9Kdd0EYOPhUsDW9WsEVpwlA3JHJ5DJu96ziky2S+h/HAlLatsLGmIdz6HJs8hNeOPBnqLkL5aAhvejn9DvUj/25+ByuF///hKF6r81NxVBng7K0PwunZrBm4jxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104948; c=relaxed/simple;
	bh=+ccPI1PT+4TT38mPD6jAKIoziJaQYf51FNSiIX4owl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WK3OOO6nMecppUEDVf0BG1ousQb5yPRyq5Zrbi2IIKnHHEDo8P043aLzpW5Y3vzqfUtTN4Bf3GPAVjgFC4OJJ5lk/s1I0Fh5FchTIQ/MlGRhkXImZCYup9wDBJ83ugDiJVtYM8NJtEGQ3S2IjEc3KcS7VGiXmxB0t/0wm2mJtmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZ0uThzF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ0uThzF"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-772301f8ae2so2269235b3a.0;
        Fri, 05 Sep 2025 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104946; x=1757709746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYeEwJltXrjT+vHPZRV06zSXEVE+RtuJ4VrqontrN58=;
        b=mZ0uThzF+nwGlNR9Qy+xPB2+/2kFmGjHlhrJaHvxuhf5lTLkumc/3iapIIt5y9QVvC
         m4KLtqLIvRMzJaZV0GJpg2h3UxDiLNeW0dsCEgZr4Ie3/4JMo6empniYPBJ67M4F3uP1
         g9f1tiKoNkIx79KiYUhQCfqXhxX2LKEx60sJ9xc6r6Y6rdwX5s58nJSqywwDzx7qu/iR
         AFxbO6Bfl5MXxxDlzG01ELXg1CbJWiY9QYgM5Y11Sk9Lz1vUN6U2hq8SFyU+x18KBKYk
         NuLhJNaNsmsZsK9jwBpybo9L/KT3oCrHLfdHnwBF9HfWPuqf+kj6c+Cl7YIzTSu1JQUe
         EK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104946; x=1757709746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYeEwJltXrjT+vHPZRV06zSXEVE+RtuJ4VrqontrN58=;
        b=efANk9GwJvA2eQYwdptNAVWn4OO18N1jQOHm3Em6sL4VZzJBAKrAqqgq8fH/L1Zfqv
         JFLRGjE9vN7OIY+6r6T3lsZ8/KT8jtZPHkvWkGiPIvSXiCbz6wyBHP6QwlwtkxQ6YeFR
         PukVVM2mUbXRx6+jO6ZAdvHnUZvo5YFV31ymZ9wVQLJ/gRuAtP427iSpiPc3sCHoEQR/
         Y0lzy6mQ9Dp7kp2n0kHAujLo1ytrdQFLlGDfsV3U0ThhHeCu/1VggBL8XrHsMmb2tUW2
         lgUWMcTSnuntbialr27GWFQE/ipQpICBCkjX/reorblPjBtTMk+q9f2MWibY8Q6Pu4/2
         55GA==
X-Forwarded-Encrypted: i=1; AJvYcCULoWSGaa+iRiNScivKGcJ7jpYdcJlHGnEF/dXZ/mgUsGdbQGEJXc7BFNcl03ABgWoiQhY9/NSbfESK@vger.kernel.org
X-Gm-Message-State: AOJu0YxIiEbFyl4WT8Shvs8B1K1iLc3v32CtC8Fy1uMuf9xe2y9FiycT
	+pYYXCMbd8Y5VbtySDX4adFH7Dux4ovkzYEsZptof2tZDoE0gE1Z6UZduD9dvvc1
X-Gm-Gg: ASbGnctVgE/8Px9AQVjwHcuJTEqHA0SH0OCNu/ONgaCpThpS7e2wICY8p0xRIT7r17J
	PuBL3ep//3zhX4D49id26gwITTa8+iDvJoYCii/5FZ0/unttkdWQRp3FcBdhjtbE3aZJlhHBCss
	LWVXk2MmFjBYMVXetV8QtZA0V6SsfKO4/g0N/JOS7YlI69gQ8JfWmspaI86roJRGdmlo2ckaOpY
	AhuLIR/pjXhB1b4bjnbFQyGLis2KzxmMgWcHBbhUL7Kjzdp7RZWwVhuFKXY+SeepbpUQlN8w25f
	itgADGJyIb1YaulFyg9MzTN0RzwKC5246eGhMZASOc3U/M/DeJdXbAr+CY/G+5b4ah3Ipnbe3/5
	7GrsS1OZFx/EQ624HIB3gnjVOFcUrXYa6M8B2xLfItbMezNXlxa1MOfNc
X-Google-Smtp-Source: AGHT+IGkpPryL9y0zdrS0OeGOyjkz5gIpXWWM7O56+ZiSUllHd45Li/WBpjFwiwFORQfIkoGa2+ufQ==
X-Received: by 2002:a05:6a20:3d88:b0:24c:2fa1:fdd4 with SMTP id adf61e73a8af0-2533f8c4cf6mr302871637.19.1757104945981;
        Fri, 05 Sep 2025 13:42:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fa7484ec5sm7322299a12.49.2025.09.05.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/17] hwmon: (ina238) Add support for INA700
Date: Fri,  5 Sep 2025 13:41:59 -0700
Message-ID: <20250905204159.2618403-18-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

INA700 is register compatible to INA780 but has different current, power,
and energy LSB values.

While the chip does not directly report the shunt voltage, report
it anyway by calculating its value from the current register.

Cc: Christian Kahr <christian.kahr@sie.at>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ina238.rst |  9 +++++++--
 drivers/hwmon/Kconfig          |  6 +++---
 drivers/hwmon/ina238.c         | 17 ++++++++++++++++-
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index 722760961821..43950d1ec551 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -32,6 +32,11 @@ Supported chips:
     Datasheet:
 	https://www.ti.com/lit/gpn/ina238
 
+  * Texas Instruments INA700
+
+    Datasheet:
+	https://www.ti.com/product/ina700
+
   * Texas Instruments INA780
 
     Datasheet:
@@ -61,8 +66,8 @@ INA237 is a functionally equivalent variant of INA238 with slightly
 different accuracy. INA228 is another variant of INA238 with higher ADC
 resolution. This chip also reports the energy.
 
-INA780 is a variant of the chip series with built-in shunt resistor.
-It also reports the energy.
+INA700 and INA780 are variants of the chip series with built-in shunt resistor.
+They also report the energy.
 
 SQ52206 is a mostly compatible chip from Sylergy. It reports the energy
 as well as the peak power consumption.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b0f440011478..af3107c9ca4a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2257,9 +2257,9 @@ config SENSORS_INA238
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for INA228, INA237, INA238,
-	  INA780, and SQ52206 power monitor chips. This driver supports voltage,
-	  current, power, energy, and temperature measurements as well as alarm
-	  configuration.
+	  INA700, INA780, and SQ52206 power monitor chips. This driver supports
+	  voltage, current, power, energy, and temperature measurements as well
+	  as alarm configuration.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called ina238.
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 98255619adeb..356d19b7675c 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -101,7 +101,7 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
-enum ina238_ids { ina228, ina237, ina238, ina780, sq52206 };
+enum ina238_ids { ina228, ina237, ina238, ina700, ina780, sq52206 };
 
 struct ina238_config {
 	bool has_20bit_voltage_current; /* vshunt, vbus and current are 20-bit fields */
@@ -155,6 +155,16 @@ static const struct ina238_config ina238_config[] = {
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
 		.temp_resolution = 12,
 	},
+	[ina700] = {
+		.has_20bit_voltage_current = false,
+		.has_energy = true,
+		.has_power_highest = false,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_resolution = 12,
+		.current_lsb = 480,
+	},
 	[ina780] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = true,
@@ -846,6 +856,7 @@ static const struct i2c_device_id ina238_id[] = {
 	{ "ina228", ina228 },
 	{ "ina237", ina237 },
 	{ "ina238", ina238 },
+	{ "ina700", ina700 },
 	{ "ina780", ina780 },
 	{ "sq52206", sq52206 },
 	{ }
@@ -865,6 +876,10 @@ static const struct of_device_id __maybe_unused ina238_of_match[] = {
 		.compatible = "ti,ina238",
 		.data = (void *)ina238
 	},
+	{
+		.compatible = "ti,ina700",
+		.data = (void *)ina700
+	},
 	{
 		.compatible = "ti,ina780",
 		.data = (void *)ina780
-- 
2.45.2

