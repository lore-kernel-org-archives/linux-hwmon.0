Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5B653
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2024 00:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187515; cv=none; b=OUqZTJ1TmsEy4vkWJkJxqHl925DSJnOZvnrUCp6iNLanUM0I2PzDaeBEdMHFLk4PgIz4BsaHbiW6yPULyqSBzkuy9/wRpu6EjyHsqd5GPnxXMMpPz5t2x2JKwjOXRDrLLxrX5Nx0O2LLsGv37jsoMujXRwG9SQNXsds9kvEHHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187515; c=relaxed/simple;
	bh=WANYXfyv0KUr+5xvLtOEf+rQDMgxLfKrTn3IzEGIwTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqVRHzglJLp5exWhVXmCfjtQVARqyewapJE5e6ftg/CWqnGOXvLbUk3Xnyhd3s14QaU/T3sOjM2zO8IDnsTE6jIjHmEBJktrKjuxj+NaN/mG5e98WRlQmktnnlqw7X3ZSAg1oPKtst7H8QWXmqPW2g1MEJVYgO0Qcx5ANjCgjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7YEfQGl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7YEfQGl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc47abc040so14530705ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 17:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726187512; x=1726792312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/D00DiBGLKxOnkSdO1tuO/v3/or67J9YJ+ZAREJiPY=;
        b=S7YEfQGldVapoD9hC/e+bU/NquDxu/PGu9D+SflbIT88hTSj8koAAkqfcy6zdIcUwA
         MBbvJ48SOnj1lRjDdnSEu8zd3gJNY8HH5CqrNP1d8Ur8okY9W7px3oi4cOhl3EeerL0d
         8RUaTws/XUV9gvkrDMmuS0nTVC0FPeiMN6NUTMdGr2kbG9OeBrM1h7vd+U9/wa5oJ5X2
         xmwTkNXzRKHyUDm2sG3rgwrZNLZE/S553knEhg0yjQhUjvIP6tWbpHsXYkZdp7qqeNa+
         eSZ4blT/KNWUBZMkXCh1NKDh7FVuIUSN+oYJzA8agp0rLSl4rq1FZ/i/2dcMfuOY0dAh
         HpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726187512; x=1726792312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/D00DiBGLKxOnkSdO1tuO/v3/or67J9YJ+ZAREJiPY=;
        b=SXKZ6MyBvqMvFz40a9l+C10l5mc4WKktSFftXxFlZDLO3ShiSd65pbofwIVmsMd9HX
         rS/8Gx4OKTO4I+dp/jJQ7Rv7b4bF9v1ueWh1luoqVJQRNSKEFSbLmx64gucw6ijCGulb
         Uy0P0hAErLl/HjfdWW0bRUM7yxdbRlufVUzSvyqI+wggWc8/y0YeCGqP4OVjQFi4U6N7
         oBQVS7Iv/Wjv4hr3pnBxPCmIv9RpBgf8ef9tm4+6dIPJkGXgXuuR1deNVNkfcRgaJiLU
         zT0nvFl4SAn4/7hw1t/dkVDZ3tfscgRqOzEyJYOJlCX9D+M4TrUNX8vnIoy50yh9+Mxt
         IB5Q==
X-Gm-Message-State: AOJu0Yxw4lWJUeas1A14s7PoLr7fopTEqHijhq2yL0PoE5JN7EN5B8mJ
	/PeDyhXS2Llr4tNQCnSHZZQNSKwOzA3WAZlobi/6P+9itn6sEvniY9A6sg==
X-Google-Smtp-Source: AGHT+IHoXi1qbZK4dWWz2/JIGpDMC9Qm6yi3aTbgR8/QeEmsh+boYhd+hRKvBDec8gPKQqAXz7nsKQ==
X-Received: by 2002:a17:903:32d0:b0:207:1737:2c66 with SMTP id d9443c01a7336-2076e3b5c28mr43336305ad.35.1726187511869;
        Thu, 12 Sep 2024 17:31:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af4740bsm19292305ad.90.2024.09.12.17.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 17:31:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Loic Guegan <loic.guegan@mailbox.org>
Subject: [PATCH 2/2] hwmon: (ina260) Add support for INA260
Date: Thu, 12 Sep 2024 17:31:45 -0700
Message-ID: <20240913003145.1931634-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913003145.1931634-1-linux@roeck-us.net>
References: <20240913003145.1931634-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

INA260 is similar to other chips of the series, except it has an internal
shunt resistor. The calibration register is therefore not present. Also,
the current register address was changed, though that does not matter for
the driver since the shunt voltage register (which is now the current
register) value is already used to read the current.

Cc: Loic Guegan <loic.guegan@mailbox.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ina2xx.rst | 23 +++++++++++++++----
 drivers/hwmon/Kconfig          |  5 ++--
 drivers/hwmon/ina2xx.c         | 42 ++++++++++++++++++++++++++++++----
 3 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index 7f1939b40f74..1ce161e6c0bf 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -53,6 +53,16 @@ Supported chips:
 
 	       https://www.ti.com/
 
+  * Texas Instruments INA260
+
+    Prefix: 'ina260'
+
+    Addresses: I2C 0x40 - 0x4f
+
+    Datasheet: Publicly available at the Texas Instruments website
+
+	       https://www.ti.com/
+
 Author: Lothar Felten <lothar.felten@gmail.com>
 
 Description
@@ -72,6 +82,9 @@ INA230 and INA231 are high or low side current shunt and power monitors
 with an I2C interface. The chips monitor both a shunt voltage drop and
 bus supply voltage.
 
+INA260 is a high or low side current and power monitor with integrated shunt
+resistor.
+
 The shunt value in micro-ohms can be set via platform data or device tree at
 compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
 refer to the Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings
@@ -87,16 +100,16 @@ The actual programmed interval may vary from the desired value.
 General sysfs entries
 ---------------------
 
-======================= ===============================
+======================= ===============================================
 in0_input		Shunt voltage(mV) channel
 in1_input		Bus voltage(mV) channel
 curr1_input		Current(mA) measurement channel
 power1_input		Power(uW) measurement channel
-shunt_resistor		Shunt resistance(uOhm) channel
-======================= ===============================
+shunt_resistor		Shunt resistance(uOhm) channel (not for ina260)
+======================= ===============================================
 
-Sysfs entries for ina226, ina230 and ina231 only
-------------------------------------------------
+Additional sysfs entries for ina226, ina230, ina231, and ina260
+---------------------------------------------------------------
 
 ======================= ====================================================
 curr1_lcrit		Critical low current
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 65ea92529406..ecf09cd2510c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2162,11 +2162,12 @@ config SENSORS_INA2XX
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for INA219, INA220, INA226,
-	  INA230, and INA231 power monitor chips.
+	  INA230, INA231, and INA260 power monitor chips.
 
 	  The INA2xx driver is configured for the default configuration of
 	  the part as described in the datasheet.
-	  Default value for Rshunt is 10 mOhms.
+	  Default value for Rshunt is 10 mOhms except for INA260 which has an
+	  internal 2 mOhm shunt resistor.
 	  This driver can also be built as a module. If so, the module
 	  will be called ina2xx.
 
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 03a011c9b73d..cecc80a41a97 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -56,12 +56,14 @@
 /* settings - depend on use case */
 #define INA219_CONFIG_DEFAULT		0x399F	/* PGA=8 */
 #define INA226_CONFIG_DEFAULT		0x4527	/* averages=16 */
+#define INA260_CONFIG_DEFAULT		0x6527	/* averages=16 */
 
 /* worst case is 68.10 ms (~14.6Hz, ina219) */
 #define INA2XX_CONVERSION_RATE		15
 #define INA2XX_MAX_DELAY		69 /* worst case delay in ms */
 
 #define INA2XX_RSHUNT_DEFAULT		10000
+#define INA260_RSHUNT			2000
 
 /* bit mask for reading the averaging setting in the configuration register */
 #define INA226_AVG_RD_MASK		GENMASK(11, 9)
@@ -125,11 +127,12 @@ static const struct regmap_config ina2xx_regmap_config = {
 	.writeable_reg = ina2xx_writeable_reg,
 };
 
-enum ina2xx_ids { ina219, ina226 };
+enum ina2xx_ids { ina219, ina226, ina260 };
 
 struct ina2xx_config {
 	u16 config_default;
 	bool has_alerts;	/* chip supports alerts and limits */
+	bool has_ishunt;	/* chip has internal shunt resistor */
 	int calibration_value;
 	int shunt_div;
 	int bus_voltage_shift;
@@ -157,6 +160,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.bus_voltage_lsb = 4000,
 		.power_lsb_factor = 20,
 		.has_alerts = false,
+		.has_ishunt = false,
 	},
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
@@ -166,6 +170,16 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 25,
 		.has_alerts = true,
+		.has_ishunt = false,
+	},
+	[ina260] = {
+		.config_default = INA260_CONFIG_DEFAULT,
+		.shunt_div = 400,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1250,
+		.power_lsb_factor = 8,
+		.has_alerts = true,
+		.has_ishunt = true,
 	},
 };
 
@@ -257,6 +271,15 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
 	unsigned int regval;
 	int ret, retry;
 
+	if (data->config->has_ishunt) {
+		/* No calibration needed */
+		ret = regmap_read(regmap, reg, &regval);
+		if (ret < 0)
+			return ret;
+		*val = ina2xx_get_value(data, reg, regval);
+		return 0;
+	}
+
 	for (retry = 5; retry; retry--) {
 		ret = regmap_read(regmap, reg, &regval);
 		if (ret < 0)
@@ -686,7 +709,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			if (chip == ina226)
+			if (chip == ina226 || chip == ina260)
 				return 0644;
 			break;
 		default:
@@ -795,7 +818,9 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 	u32 shunt;
 	int ret;
 
-	if (device_property_read_u32(dev, "shunt-resistor", &shunt) < 0)
+	if (data->config->has_ishunt)
+		shunt = INA260_RSHUNT;
+	else if (device_property_read_u32(dev, "shunt-resistor", &shunt) < 0)
 		shunt = INA2XX_RSHUNT_DEFAULT;
 
 	ret = ina2xx_set_shunt(data, shunt);
@@ -815,6 +840,9 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 						FIELD_PREP(INA226_ALERT_POLARITY, active_high));
 	}
 
+	if (data->config->has_ishunt)
+		return 0;
+
 	/*
 	 * Calibration register is set to the best value, which eliminates
 	 * truncation errors on calculating current register in hardware.
@@ -860,7 +888,8 @@ static int ina2xx_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &ina2xx_chip_info,
-							 ina2xx_groups);
+							 data->config->has_ishunt ?
+								NULL : ina2xx_groups);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
@@ -876,6 +905,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina260", ina260 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
@@ -901,6 +931,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina231",
 		.data = (void *)ina226
 	},
+	{
+		.compatible = "ti,ina260",
+		.data = (void *)ina260
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ina2xx_of_match);
-- 
2.45.2

