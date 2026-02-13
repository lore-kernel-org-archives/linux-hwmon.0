Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C865F1D5ABA
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 00:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941723; cv=none; b=V1KfwgZaB4GE61dNft6OiqeMrth1Fw8R4W2S6zx+AiT8xKppul9g/QC7SL4E3feqlJ3n97XR9SirBDlZ+iAGqo5X1CDRuni4TcmgaourWWiCDtzz7SfcdQxiPPbNy/0rBWio97uSmqQOlnecFBxznwQ7Qj0b89T0hqj87lkvs04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941723; c=relaxed/simple;
	bh=1QKFWI4RjXLpuskxjhRHAeiImz6OuzoRskJ/lHHthpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9GYLt4QlgZP1X5TgOZtfG0UXDpO8a+xQi0qLBlSsWqlVxhI8TZwnCwY5ojzEznr8pVsMc//SZpqhU9cRRDBDY93iwEH0pOEv5w+bM2EnuHB/szTNsqb9DFU1p1nmv6EhHbZgZZedo1o0+L/rRMv5P3C+26hnqw89SZ4N1LC5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qOiEEh0R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qOiEEh0R"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so5681435e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 16:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770941720; x=1771546520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSlv+TtmjbR3KEd39LSGtfFdiXlGzzelHhN9IPNFyGE=;
        b=qOiEEh0RzPKvXwIxWnRO29NDtqrcbh6pf0qg7F0ZjkibmkHGQo7MzqKVTOYhiasisK
         +zRyjBeo8M0e35bTIrU77FpG5joaOFWQ0J6lLPeWqZjOc+Hq+M530XK/crJ/LFOxgx+R
         khzLrQIJ+xforHX7k8mk3OA93liYpFce90HvPxdksCyb0w6FryUdSDj1pmWC3iMdF3Ht
         dyMLZc3H1MGVq3FM4oHf2ptcWirtzRvftxNNLu0aUVNYrdRUgFhOKgZCozswx4o950q7
         NCpfgtVW1qmFbFD4FpgfCVHnlmTKC7gpFNIVcYG+I4ENv9b3bL3hgY0AZA/pH9XSgm/H
         TfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941720; x=1771546520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSlv+TtmjbR3KEd39LSGtfFdiXlGzzelHhN9IPNFyGE=;
        b=bBdKgnXzHvu08oy3HC+MPOuD1MaZP9PJEHHpN+YcRr0/TR54nacINZmwLnGPAabKwW
         5vyIWACT2RY0sI4nS0ug2h9lEIkmdOWVZdb0+d6o/sdB1h4T10VYtgHKmlhciEGII4pE
         AQ/EleG7VKcJlzJ8uPhu5r1WyDvWMMh9xhpO+9FuFl9++v09I8b/0LbJiTGmMkGfFtMU
         V2EHnmHj7Ul+wvqdVwXjrJFlfsuljNKtM9IgmnHMmBAn0SzfWUYS1WDcJcdg/ME0qsV+
         ejGHAo3DzQd2uCUVI+T71z8Zu/T9vcSKe7+NiIEnTc7APpKB5iUjTcMOSltBswV7INuL
         tCUA==
X-Gm-Message-State: AOJu0YyTBPDyWumOujUCBNK8Q/ywC0BVnPaZR8gnDg5lcwsRyu0o8L4P
	KUBMywo5Sw8edp+khZqYSO+IjxzYgKqtfkSbJUOWLvFe7PA7mvYGjEVdImQ34Pf7/ro=
X-Gm-Gg: AZuq6aLA9DpL5GhH9pnONtP38JZ18NYCl1Sjo2tmVQMYY5QS6aGcfdy7Td3HeoeRYFp
	tz41TRA2xqyiyTfvP0nzxCOazZlWeYxOLy6e7aNE7x3khc2xRbPSgXvKqKCXEP+mz8a5yqzbPkO
	AqvS37lLRHlUjiayIf2a7pBryoJvpLtvnjpOXvV/JUajpKn/G8NnAEkLTE/9gAkZiRtMzyM/Ubc
	wF56TeEYiwJ6wtcHAnTAViLpSFaRhiiRnxISB0hH+xIPaPmOKEWdwp/VkbDX9CgybenMjbYfUoQ
	9Wm+DewQIX3wPoQT0+Hm6bbHYbxoz6GyIFcL3MrPg7jof0zNlAvBVFh0BqecT3gKj9ocqcpmQ7P
	aDpsqsZZ0MyFb8AI3dQxOJrt9aY0b+jEz1Km79fdWKf/fFPTLpjR8OQVxrM6AChexvD37bzowqt
	LDUN5GM+D/npjZbp/J+hJtbGTQy9IzrxbIQhnAdQMyKUsmfk9I8BFYAOm4UsMEYs+kKGVvcUWhc
	X6Hv+jX6g==
X-Received: by 2002:a05:600c:34c3:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-4837103693emr15594065e9.24.1770941720202;
        Thu, 12 Feb 2026 16:15:20 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm234440945e9.6.2026.02.12.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:15:19 -0800 (PST)
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
Subject: [PATCH v2 3/3] hwmon: (pmbus/tps1689): Add TPS1689 support
Date: Fri, 13 Feb 2026 02:14:08 +0200
Message-Id: <20260213001408.2454567-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213001408.2454567-1-sbogdanov@baylibre.com>
References: <20260213001408.2454567-1-sbogdanov@baylibre.com>
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
index 33f6367f797c..c2da2b89fe2e 100644
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

