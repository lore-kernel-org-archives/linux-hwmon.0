Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C62D3EFB;
	Fri,  5 Sep 2025 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104945; cv=none; b=YsikghH4O3JxK4pv6WvGNW+qjjhQFJJaLayH4nzjenP1KpW1UOJqd15O+Rq9M0mCRPKKP3HNK5rl4fb+HrgvVf5ia4xeCUe57dxQOh1UW895fuSN9ccjebG3+MiUKGN/j6W2DIoi54kky/IRhIpePNDu8BTKvNMyBgLCmQaJahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104945; c=relaxed/simple;
	bh=QrnL16UJ/1PhUxYAUaIDI/qpJvv5yTbvY2TG4Tv/MQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcjUVV4lVt7qqkIZdPmGnLg6JEneRMl4ohrr4rFaAMd3Q4CZYSXZkwPOGs9mFKdZB6RhqgkkSXi4vYkpcalYi0dNFivJFmMuZrhaWFkJ9DvTDm+uMnsvMOqtF6nIYPzQ3LB24ta8nlnlmqFZznyUuxbht2s3u+wFGPbrtqE45Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7SsUpkM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7SsUpkM"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7722c8d2694so2382975b3a.3;
        Fri, 05 Sep 2025 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104943; x=1757709743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/N8xbmKFAzQtd27iCj9+DtwKoaknfnMO4YTyVgPa7Oc=;
        b=j7SsUpkMzkOL4wzV/lGS+nGyiqT4xXwZ+q5BA14I7gDvoH0z6HbDAWQ74xCtIQieX+
         L9XV1zGkUlsRU6dhwUVcwSCFLdPPT+1ByFEjGYecuBeEEgQz861ht4z02qgRA2hhuPmz
         z9Jw2petGAi7PegcVfUln8vUTtfV+OmXg5zN9RNDNLp3Lui5nyDQghuQUdDGOpXrYl3T
         0zmGwL9VqclZnUtrHfOFsdH3MYSFFjAfR2MdzvJR07vdwkFD0fkibujimzplM2YKhuaH
         y0FNNVKD0XxpEgeQqKXjKPXYGwUL1enGwA+IKWQfNTgcNdBlURX/aky3VDIqPgnsLyWc
         YCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104943; x=1757709743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/N8xbmKFAzQtd27iCj9+DtwKoaknfnMO4YTyVgPa7Oc=;
        b=POxamsQILjSUap2wRDTaml+crxMeIoOIDZ4Q4XTTSwimBlJVTamZLnu8pALy1Pigg4
         XMUNZ68e28mH11ROTfsjcRtqFaVvYqts56K9UABYwVf50+iHCVlZZjVsRVut4RZ+RALD
         zPdn+ew/fRzF2gjVa6sWBmk83E53V9QanCXB7O3rM//ktZKAYDS0QnPKb/W/zpah1sql
         87INBfE5EEtjOg3z56BTPQmtBrA+lUMwJEMqRhrfIl9CHywvMJBTYRzJIUq7KmyEnnY9
         ujzhgcpCpiOTji1KJt7awwzfArA35lhTcA98OEvcCBz9Fg/aP/WQfGFGNyWTJ4HHhpM9
         eo5w==
X-Forwarded-Encrypted: i=1; AJvYcCXDQD1ogbaNlIsndVO6O6XOJYrFgNee7wGGXi6GVu699tCQFlVrO9SnCMI9+LLaXpPWQUBGCWts8JQp@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpeRlCPjkioHfcfWM2ieB/xS30OL9EoBxfK5Way4IDbixtw9n
	kSQ9/c+nRYV1OVmmDESnRz9CIyvbx+LBapOq5Ec7OGn1uCtSputwuvtUqrYUC1uW
X-Gm-Gg: ASbGnctdnKM006XXzbuIHuzAdPqYfDdGFaLz9EJ3ZwcG34pcrVMwl3DfnACHvies6wO
	O32PSLq+l4AOyNECy6EE+kEj1BPr//Z/NiLruQb+hAMdmGldTNNZImrjcgIB3OIoVPDYqsV0IYV
	MagEcSbtVs4TroBVI107inp+Skkjhtp8pW4DVpdaU0ys2/6NShEC1/Jy+uuRhTEwkPceJjfDOvo
	CahNOzvpVf4uilyz82GFsS31Nx9XFlUWsa+R6TaYFYMzTJyed2+MTpWxqXOJXDmW0XgHVYrHR1s
	55H8s7S6s2l/NF/v67KTxr4BIaKw6K3nBO2/9F1aoUj4U7yRlpclZ69GZ6dhu8ebA+cJTY2Xwc3
	oY7wBTrehJqB9pkccMUQzg69wePnGf4v6+p0=
X-Google-Smtp-Source: AGHT+IEwtQuKr2j1j221SyBceermp/s72WlBsjsX02fowMIyXGOgO7l5TCrYpdnFlmxfsoJppcdeZA==
X-Received: by 2002:a05:6a21:33a4:b0:245:fbee:52ed with SMTP id adf61e73a8af0-2534338b0a6mr256105637.30.1757104943266;
        Fri, 05 Sep 2025 13:42:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd092e2aasm20008570a12.21.2025.09.05.13.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/17] hwmon: (ina238) Add support for INA780
Date: Fri,  5 Sep 2025 13:41:57 -0700
Message-ID: <20250905204159.2618403-16-linux@roeck-us.net>
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

INA780 is similar to the other chips in the series, but does not
support the shunt voltage register. Shunt voltage limit registers
have been renamed to current limit registers, but are otherwise
identical.

While the chip does not directly report the shunt voltage, report
it anyway by calculating its value from the current register.

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ina238.rst | 10 +++++++++-
 drivers/hwmon/Kconfig          |  6 +++---
 drivers/hwmon/ina238.c         | 17 ++++++++++++++++-
 3 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index 3c7db4a47056..722760961821 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -32,6 +32,11 @@ Supported chips:
     Datasheet:
 	https://www.ti.com/lit/gpn/ina238
 
+  * Texas Instruments INA780
+
+    Datasheet:
+	https://www.ti.com/product/ina780a
+
   * Silergy SQ52206
 
     Prefix: 'SQ52206'
@@ -56,6 +61,9 @@ INA237 is a functionally equivalent variant of INA238 with slightly
 different accuracy. INA228 is another variant of INA238 with higher ADC
 resolution. This chip also reports the energy.
 
+INA780 is a variant of the chip series with built-in shunt resistor.
+It also reports the energy.
+
 SQ52206 is a mostly compatible chip from Sylergy. It reports the energy
 as well as the peak power consumption.
 
@@ -88,7 +96,7 @@ curr1_max		Maximum current threshold (mA)
 curr1_max_alarm		Maximum current alarm
 
 energy1_input		Energy measurement (uJ)
-				(SQ52206 and INA237 only)
+				(SQ52206, INA237, and INA780 only)
 
 temp1_input		Die temperature measurement (mC)
 temp1_max		Maximum die temperature threshold (mC)
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 23d51e61d993..b0f440011478 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2256,9 +2256,9 @@ config SENSORS_INA238
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  If you say yes here you get support for INA228, INA237, INA238, and
-	  SQ52206 power monitor chips. This driver supports voltage, current,
-	  power, energy, and temperature measurements as well as alarm
+	  If you say yes here you get support for INA228, INA237, INA238,
+	  INA780, and SQ52206 power monitor chips. This driver supports voltage,
+	  current, power, energy, and temperature measurements as well as alarm
 	  configuration.
 
 	  This driver can also be built as a module. If so, the module
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index da5b43184dd1..98255619adeb 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -101,7 +101,7 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
-enum ina238_ids { ina228, ina237, ina238, sq52206 };
+enum ina238_ids { ina228, ina237, ina238, ina780, sq52206 };
 
 struct ina238_config {
 	bool has_20bit_voltage_current; /* vshunt, vbus and current are 20-bit fields */
@@ -155,6 +155,16 @@ static const struct ina238_config ina238_config[] = {
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
 		.temp_resolution = 12,
 	},
+	[ina780] = {
+		.has_20bit_voltage_current = false,
+		.has_energy = true,
+		.has_power_highest = false,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_resolution = 12,
+		.current_lsb = 2400,
+	},
 	[sq52206] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = true,
@@ -836,6 +846,7 @@ static const struct i2c_device_id ina238_id[] = {
 	{ "ina228", ina228 },
 	{ "ina237", ina237 },
 	{ "ina238", ina238 },
+	{ "ina780", ina780 },
 	{ "sq52206", sq52206 },
 	{ }
 };
@@ -854,6 +865,10 @@ static const struct of_device_id __maybe_unused ina238_of_match[] = {
 		.compatible = "ti,ina238",
 		.data = (void *)ina238
 	},
+	{
+		.compatible = "ti,ina780",
+		.data = (void *)ina780
+	},
 	{
 		.compatible = "silergy,sq52206",
 		.data = (void *)sq52206
-- 
2.45.2

