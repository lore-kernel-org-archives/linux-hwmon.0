Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EE57F6
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979967; cv=none; b=LYtF4jJpVpkkXGvTBcUfhXHnWMR0Ff4X09WKd1DUXZoLDpJ/YYXoea7CX62jJHzOLXe4dwYGVamB2xavl5FwVkk4ZFcnu+3mDuMmtjc8GR3IHf5HDYvuAtLXgLIQAIIG//XGJMUF2cElHNkAURKvpOIHjR7GMswMX+5GPzgP5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979967; c=relaxed/simple;
	bh=J+VyZff681gKPpHLjeF8F1nxkVg4nRboIpwl4g6OPtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rg5HaeRWjWpLGC1iQdquT0OFhvmxpgElQBXW604rkxezZT79GQtfx8PSCWszkkKOh6hgMJ/twxcny3MN74Rga44zctArRV5WVOVya9oTyu6qvO6lSJkfWKpV3J/VxW4ci80OsP/miWX4qbkupBIHGEVVTWbLzsFsaXz4B61qI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXa8zs11; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXa8zs11"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20227ba378eso11252485ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979965; x=1725584765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa9zNkvp/8ozyhdAM9OZf8RNw7+V+0Mz065nQw6TwVs=;
        b=CXa8zs11UdlYKJU5gSrPTRzrz6D9LlcRnLLvbBdMqMy6X8VP4LrdADqA/RZyVZaicm
         DIi8atp88b0rNH5rm4/e2nDjh0ZBwbxQGYxu+iPnauNIW3Gy50nQ+MHV3lS+MATomm1A
         Lstm9MK8hREhYQPk8n/e29+F1wVga5PtqqRxjf+PkUxWJrx/di5mV0YUGEaJmYepmQ+g
         6DmkXogs7CmEjX79nVhggO54j7uo9gyRojVaok4/gNCy0aU7CjWZwdGrPvEQI2gg7pD/
         g6wpXu9tThk49j/XYQoNmAbXyIy7lPDP/x+8u/hktara0KSmTMpPDjbiGD3XYGX89EN2
         Msbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979965; x=1725584765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pa9zNkvp/8ozyhdAM9OZf8RNw7+V+0Mz065nQw6TwVs=;
        b=xJ6xxjJEWXcOGFcnj9rjfA2TK2qk7Z7lQcxEgKY5iL1dfqx1++eSWU/2HPGgDUwqbQ
         8n2pUZACpSjSwtQiJiC4/GARfgAp+4hltUQ45GyFZ83Lm7mRMy0M/kydMJgrJhvcfvj1
         sKU9sszkZmvJBp2MWbyUTY9cAedfO9raYfk8lhSSc/dpJWSKi+2TmcwRd07krtWFpCWx
         +aPkyexxI9uVdZtzhUgFM9G6ZNRIFumwX/jlC99BhchFA5Pa1lIEUQrbvqD2bXZq/Mwe
         wWuxkywF7tpUlZSX8mnZRXchGPkRIcY4so6GF3fq50Wqwq36XOPWtIh+cxusUHDjq8/7
         XexQ==
X-Gm-Message-State: AOJu0Yz1pUXU3a/qQLS3lGjAw9BdhoAvXxv4t4aNMuJnOoXFHijByym/
	saUtOp0Tpr+/TPQVlCYd0e1Ts3Mjefm0+vEf9w8kAG/IVIyO9Txcz0L0Zg==
X-Google-Smtp-Source: AGHT+IFTDWtarl3lAb0fhvVICRBoHJ/+rw/ldMnuaD6LhNyzZlrKO4rXiI6XuO1TndAeIW1MZ0HuFA==
X-Received: by 2002:a17:902:ea0a:b0:201:daee:6fae with SMTP id d9443c01a7336-2050c3f9cb4mr49589975ad.48.1724979965109;
        Thu, 29 Aug 2024 18:06:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d02bfsm17152535ad.111.2024.08.29.18.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 04/14] hwmon: (ina2xx) Mark regmap_config as const
Date: Thu, 29 Aug 2024 18:05:44 -0700
Message-ID: <20240830010554.1462861-5-linux@roeck-us.net>
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

Recent versions of checkpatch complain that struct regmap_config
should be declared as const.

WARNING: struct regmap_config should normally be const

Doing so reveals a potential problem in the driver: If both supported
chips are present in a single system, the maximum number of registers
may race when devices are instantiated since max_registers is updated
in the probe function. Solve the problem by setting .max_registers to the
maximum register address of all supported chips. This does not make a
practical difference while fixing the potential race condition and reducing
code complexity.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fixed typo in patch description (devic es -> devices)

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

