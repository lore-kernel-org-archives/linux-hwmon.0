Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB062DCBE6
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885913; cv=none; b=a3hxUwX6ClEWnDhOxQQStd88tYSxvOqAdz9pSEktcECFyuDuutMNICDHmfBjx3gntfphq0nmUzyPu95cIaqiToP61rs1SsWF66bAhVjDxpm7e3FzKODaCNHDSkCOnJUYG4VRwRwxzf9gIfCX2WQLYSfVdRUS1EQwvqE871d7KZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885913; c=relaxed/simple;
	bh=c4T0y/hzZHDuIAz/fbVwxQ6Q4j0rUNvQhG2sxxLl4ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D9ez8qkw3WmC4Rgu/NLZJ2q3iq+c7d2kRDUZ4oEYIpUzvN3xdSD3Ixqx7Y5fLjjR1SX9Ggm9GOBPsLQizi9rIn181fSDI4FZPWZydNgW51ZyeXkGlJH8+XTvStu5JwgJQN9LpuVOIZe0AIX/SfDKihg24EcVPXcr/OKkBKxAu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RJY4P9tC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RJY4P9tC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4805ef35864so65065835e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770885909; x=1771490709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pKMLu2vrVoz0ZANHaXBigtawgekohjYcNvHVashll8=;
        b=RJY4P9tCmNGoU7tLbopsCk9p4SX11tZ9UCCWKGQmw0ZMcm/LSPGdzZOSE2VvJ09ArE
         68s6nrSi+BDicSnp5YNo1QeOPZxcxxXWBJGTFYQgPRqWLk5ufHZqlrA7NjrG8yRqEQA8
         EyVH4k1iQeq/GEKwtqscqjd8d2AFQ5rO8OSKDir7wHX60WT38/xne9ZDVwB92pOKBAZ0
         KCQyTMf3RX98zA61KYMf9v/RqGvpzLA79GO1hDnAYMUc5Wea6rqVsFRA0hnXAXeYV6wX
         ZsISslqHe491IjKGlspWHqi65W2C//fdgt20z+++p/jMHOfA/jTyWjV3F+xBYpQf557S
         xjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770885909; x=1771490709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4pKMLu2vrVoz0ZANHaXBigtawgekohjYcNvHVashll8=;
        b=nWFbfkT+YAucY+pY6j2t0uUP5SuTmYWlZnF++nimwC9Qz8S5DqqVb/O1j2n1c2Qfuk
         TNZxRd9lWmrN9LZv5lmLXjvY7NC2QCgwCbiBRfVJP7TfMAybGkcal+rHE2ZYKe2ShAqz
         kJjTScw1nyYpeRNZ34ER6Z5KVPloCwybB4lTbYHBZAmvf+K1PdKgt6Xa+33MntdNxCGm
         pCRtWWSP7Sqo3mwfv2xvBSgy1qNm0QP0hcVLgd5aJV+Rf0lOEnFv7F/bKUIIjNCDQijc
         fpQSs364BY5a9ZhoppVsMFSmQKGcNgwHy1JGJKCgUdtACP1135nNHROFCcCpBc7k30H+
         09Xg==
X-Gm-Message-State: AOJu0YwgTAX8EK1zKgvs9y2q78NWLBvHR8ph3MZUcJYFTMcd8gOl4VqO
	JlIrCYCtb6d+nOwiX9qWrZuu17EZgBLS21KdxSHicvlrGqoUrIZMNsOCDVq8chRWktI=
X-Gm-Gg: AZuq6aJMI3qt6l3MWJ2HxiuI3g6BrdQ0FAGSQuTFP969jT88KZ4klmQLI0J9KXMQ06j
	vnwHJH9ITGCuvsUK3gDFPcIMflKtoAt2aQCP0e04CjZzUXC/VIURtbFV2SYqNXUMvUjDKL41sp2
	gRTb2QE1imwsX0+Q3nR1+QjjmyLeU4Kjxrn6xYvYpRPog+OyjFwHioQm5h51AzHAa2TTRNxAtRX
	OUqA+oEtCP7PAsqIIWaTNZ697kjI3MCJuifL7NBf75jSkc5XBK3j3tF5WjCerKBhJCEyzElAcT/
	tlNwChCY/dpok+9+6Ugb0k9gKqjOm8zWOsqvX95miG5OOraJUPqZoouJVwgujX4LOmhpNw9wH2D
	yGUBn8eV9dPLsHtok+Q9LUPprwZMAdP0fkcK7h73N7DVdmZWnaJ74gndvNdE6/MrkWKJ0j2QdmK
	4H8CQDAtRRTil4/kwyONzsfqZ4RzXm7/MyvJ7BicUPjY8Uox4SMuzEOUXFNhdaw5vqfzpLDhXfv
	yOdFoAkPQ==
X-Received: by 2002:a05:600c:848d:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-48365716033mr24734255e9.30.1770885908815;
        Thu, 12 Feb 2026 00:45:08 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm82753705e9.13.2026.02.12.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:45:08 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v1 3/3] hwmon: (pmbus/tps1689): Add TPS1689 support
Date: Thu, 12 Feb 2026 10:45:02 +0200
Message-Id: <20260212084502.1795-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212084502.1795-1-sbogdanov@baylibre.com>
References: <20260212084502.1795-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend tps25990 existing driver to support tps1689 eFuse,
since they are sharing command interface and functionality
Update documentation for tps1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 15 ++++---
 drivers/hwmon/pmbus/tps25990.c   | 70 ++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
index 04faec780d26..e8bc9a550bda 100644
--- a/Documentation/hwmon/tps25990.rst
+++ b/Documentation/hwmon/tps25990.rst
@@ -9,26 +9,31 @@ Supported chips:
 
     Prefix: 'tps25990'
 
-  * Datasheet
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
 
-    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+  * TI TPS1689
+
+    Prefix: 'tps1689'
+
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
 
 Author:
 
 	Jerome Brunet <jbrunet@baylibre.com>
+	Stoyan Bogdanov <sbogdanov@baylibre.com>
 
 Description
 -----------
 
-This driver implements support for TI TPS25990 eFuse.
+This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
 This is an integrated, high-current circuit protection and power
 management device with PMBUS interface
 
-Device compliant with:
+Devices are compliant with:
 
 - PMBus rev 1.3 interface.
 
-Device supports direct format for reading input voltages,
+Devices supports direct format for reading input voltages,
 output voltage, input current, input power and temperature.
 
 Due to the specificities of the chip, all history reset attributes
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 268e361b6fd3..3d4056724303 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -370,6 +370,15 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
+struct local_direct_value tps1689_local_info = {
+	.m[TPS25990_VIN_OVF] = 3984,
+	.b[TPS25990_VIN_OVF] = -63750,
+	.R[TPS25990_VIN_OVF] = -3,
+	.m[TPS25990_IIN_OCF] = 7111,
+	.b[TPS25990_IIN_OCF] = -2133,
+	.R[TPS25990_IIN_OCF] = -2,
+};
+
 struct local_direct_value tps25590_local_info = {
 	.m[TPS25990_VIN_OVF] = 10163,
 	.b[TPS25990_VIN_OVF] = -30081,
@@ -379,6 +388,60 @@ struct local_direct_value tps25590_local_info = {
 	.R[TPS25990_IIN_OCF] = -6,
 };
 
+static struct pmbus_driver_info tps1689_base_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_VOLTAGE_IN] = 1166,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.m[PSC_VOLTAGE_OUT] = 1166,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_TEMPERATURE] = 140,
+	.b[PSC_TEMPERATURE] = 32103,
+	.R[PSC_TEMPERATURE] = -2,
+	/*
+	 * Current and Power measurement depends on the ohm value
+	 * of Rimon. m is multiplied by 1000 below to have an integer
+	 * and -3 is added to R to compensate.
+	 */
+	.format[PSC_CURRENT_IN] = direct,
+	.m[PSC_CURRENT_IN] = 9548,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = -6,
+	.format[PSC_CURRENT_OUT] = direct,
+	.m[PSC_CURRENT_OUT] = 24347,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -3,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 2775,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -4,
+	.func[0] = (PMBUS_HAVE_VIN |
+		    PMBUS_HAVE_VOUT |
+		    PMBUS_HAVE_VMON |
+		    PMBUS_HAVE_IIN |
+		    PMBUS_HAVE_PIN |
+		    PMBUS_HAVE_TEMP |
+		    PMBUS_HAVE_STATUS_VOUT |
+		    PMBUS_HAVE_STATUS_IOUT |
+		    PMBUS_HAVE_STATUS_INPUT |
+		    PMBUS_HAVE_STATUS_TEMP |
+		    PMBUS_HAVE_SAMPLES),
+
+	.read_word_data = tps25990_read_word_data,
+	.write_word_data = tps25990_write_word_data,
+	.read_byte_data = tps25990_read_byte_data,
+	.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+	.reg_desc = tps25990_reg_desc,
+	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+};
+
 static struct pmbus_driver_info tps25990_base_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -428,18 +491,25 @@ static struct pmbus_driver_info tps25990_base_info = {
 #endif
 };
 
+struct tps25990_data data_tps1689 = {
+	.info = &tps1689_base_info,
+	.info_local = &tps1689_local_info,
+};
+
 struct tps25990_data data_tps25990 = {
 	.info = &tps25990_base_info,
 	.info_local = &tps25590_local_info,
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ .name = "tps1689", .driver_data = (kernel_ulong_t)&data_tps1689 },
 	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = &data_tps1689 },
 	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
 	{}
 };
-- 
2.34.1

