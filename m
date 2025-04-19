Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10881DF75D
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079253; cv=none; b=t18doKDJ0fCy8WfFiGcI6qvZ8Ne3Ey4CXKMre2+UDAxEEVX5hiN3NjTihQ52F1LwToKmPVR9KFl8NofCGF8qJggv7wLHCJYP+mtS27wxqifoLu3KPI605rWyipr7xpYhlPUOY5t8qVk2xwRROvAIORjoLbiFap3PaMufWloz3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079253; c=relaxed/simple;
	bh=HfOvNRmTrnYq7uZ5W3tf7dReO1r6x15ggQmyTSlSkeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPn7JRKqEwu+nZtBzEKmXNHspBIKnU/yDC8uT0nsmzIDhp9BhXdUyk3WtWkglxaVbd7FHjy7Oug6dK0PsvO6rNGWhxf0DGEueiS/1qdUZLqsUGpuX9upYHLgdVukjN8Wt9XEEIVn2xU77GHFVH2SIS3OMThKqpprUfvoTM8BCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg2rcki8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg2rcki8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so38228815ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 09:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745079251; x=1745684051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efUMDb4S/Z1FeSk/nVMA4SMohFSucI4981VCY3EWPGQ=;
        b=eg2rcki8+B0oDpMKEcF7Ao2sSozMrg++frPsF4f0Fwb4aJ9B7AVY7elymaXPBUNxJY
         i2Orgg9ydQ+R/YrS27Y98yz8mUdMMlKcTwyI7J1cGu5sfSDFOhS7qqrHlXSeZgT5T8eN
         ZP+J0vq4Hf7LonXKdIA85OsXEUDc2mIK5Mza/heS8kjyD+Zf29orJmLfXqTCy3LJgV+B
         YSeZ9hC2BVyiKoxK3fR7M/tF6AfiUeGvkTRqUl/BU5gsohue1q6w6BTqJp7sPNdLN9ry
         i9wAhuktTDyIJzB3jdyVhZxjVQgzErrdFn7RtdUDuqe5Ms7DNqAh1P/3XhgsqmanJysv
         LPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079251; x=1745684051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=efUMDb4S/Z1FeSk/nVMA4SMohFSucI4981VCY3EWPGQ=;
        b=rl4cYgaPS3D+b4s6BN6+s8+oas723SBIENzByvlVh0XVPwAmYybeJAsJkY8aOdyBLp
         udXX4zR3eTtyoEEgxmcqsdXn44Bp1w1Q8DXl/YlxzCzqGZ6CdQlwincH28MxPYYbaKOi
         Fy9hjSbSfl4EhI43I/AqC8OK+jTj4CTxn+YFeECSy4ToLz+S1Ugoss44V+ux9B+zefsU
         RprrB0C9XvHWRbBh+Uv8Y40qiL4ZDV4OK0XijgSGLZhTKb3sH86k29beqJFltPZEEBd6
         5ZcszR7lmfZDHMJySb/3pCf3qv7g2oX8ctKLawKxDQuBR/v0OdhDSygw/QYzg1zIsfF5
         1AMQ==
X-Gm-Message-State: AOJu0YywOY3wjHmKh2JTE0cRze0jpzGiMc2f9/Kca0Wvr7kWH3hf7t6U
	CLV/EjrDLJAGmTCMGYsvPiDPoyCvtnldyu992Ug42adK9YIkHlYSi+8+UA==
X-Gm-Gg: ASbGncsyttHoNfhvfRQevw6oIDESiU5IVSIITzEVlT4X+HqPvFiW9vOnJqzYFvk9lqj
	B8ywusZfcmOS2/Ymn+ibja5hGuYabkhFL1h79QEwwvshThnb+EH8TYHwRhzhUepciGhctSgojkf
	dhA3NxXjHUpp/CXgNnYPf0AkA1tMByPyeom+91HO60k3r6WbLu7KlTjtADgaEf9RC7bI25M3A89
	PViuLP4QbrlYNC5yIdc4xLamsne/rec6O8aKielhxmiERkiZQvYB+WZyOyQrRqCsL099RP3Ushe
	eFxon9RBr6V5YWNbJZ9Y57d+C5xVADYwnAHyHV7Qt4xandkNqzmsOw==
X-Google-Smtp-Source: AGHT+IHnpDmLo3j8sJsi2Vt+nq5ApedY2Sr8VUbf7QqfgMYl6KOvu5862P84uY4rqVLhO5maX0LDvQ==
X-Received: by 2002:a17:902:db01:b0:220:e5be:29c8 with SMTP id d9443c01a7336-22c536060d4mr99503695ad.32.1745079250657;
        Sat, 19 Apr 2025 09:14:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda4f5sm35597905ad.8.2025.04.19.09.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:14:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yo-Jung Lin <leo.lin@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] hwmon: (spd5118) Detect and support 16-bit register addressing
Date: Sat, 19 Apr 2025 09:13:54 -0700
Message-ID: <20250419161356.2528986-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250419161356.2528986-1-linux@roeck-us.net>
References: <20250419161356.2528986-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SPD5118 compatible chips with 16-bit addressing enabled
which are connected to I2C controllers.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 75 +++++++++++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 92a3cb0bb515..5da44571b6a0 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -461,7 +461,7 @@ static const struct regmap_range_cfg spd5118_i2c_regmap_range_cfg[] = {
 	},
 };
 
-static const struct regmap_config spd5118_i2c_regmap_config = {
+static const struct regmap_config spd5118_regmap8_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x7ff,
@@ -473,6 +473,15 @@ static const struct regmap_config spd5118_i2c_regmap_config = {
 	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
+static const struct regmap_config spd5118_regmap16_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0x7ff,
+	.writeable_reg = spd5118_writeable_reg,
+	.volatile_reg = spd5118_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int spd5118_suspend(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
@@ -510,7 +519,8 @@ static int spd5118_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
 
-static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
+static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
+				bool is_16bit)
 {
 	unsigned int capability, revision, vendor, bank;
 	struct spd5118_data *data;
@@ -527,12 +537,7 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
 	if (!(capability & SPD5118_CAP_TS_SUPPORT))
 		return -ENODEV;
 
-	/*
-	 * 16-bit register addresses are not (yet) supported with I2C.
-	 * Therefore, if this is an I2C device, register addresses must be
-	 * 8 bit wide.
-	 */
-	data->is_16bit = !!i2c_verify_adapter(dev);
+	data->is_16bit = is_16bit;
 
 	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
 	if (err)
@@ -675,21 +680,69 @@ static int spd5118_i2c_init(struct i2c_client *client)
 	return 0;
 }
 
+/*
+ * 16-bit addressing note:
+ *
+ * If I2C_FUNC_I2C is not supported by an I2C adapter driver, regmap uses
+ * SMBus operations as alternative. To simulate a read operation with a 16-bit
+ * address, it writes the address using i2c_smbus_write_byte_data(), followed
+ * by one or more calls to i2c_smbus_read_byte() to read the data.
+ * Per spd5118 standard, a read operation after writing the address must start
+ * with <Sr> (Repeat Start). However, a SMBus read byte operation starts with
+ * <S> (Start). This resets the register address in the spd5118 chip. As result,
+ * i2c_smbus_read_byte() always returns data from register address 0x00.
+ *
+ * A working alternative to access chips with 16-bit register addresses in the
+ * absence of I2C_FUNC_I2C support is not known.
+ *
+ * For this reason, 16-bit addressing can only be supported with I2C if the
+ * adapter supports I2C_FUNC_I2C.
+ *
+ * For I2C, the addressing mode selected by the BIOS must not be changed.
+ * Experiments show that at least some PC BIOS versions will not change the
+ * addressing mode on a soft reboot and end up in setup, claiming that some
+ * configuration change happened. This will happen again after a power cycle,
+ * which does reset the addressing mode. To prevent this from happening,
+ * detect if 16-bit addressing is enabled and always use the currently
+ * configured addressing mode.
+ */
+
 static int spd5118_i2c_probe(struct i2c_client *client)
 {
+	const struct regmap_config *config;
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
-	int err;
+	int err, mode;
+	bool is_16bit;
 
 	err = spd5118_i2c_init(client);
 	if (err)
 		return err;
 
-	regmap = devm_regmap_init_i2c(client, &spd5118_i2c_regmap_config);
+	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+	if (mode < 0)
+		return mode;
+
+	is_16bit = mode & SPD5118_LEGACY_MODE_ADDR;
+	if (is_16bit) {
+		/*
+		 * See 16-bit addressing note above explaining why it is
+		 * necessary to check for I2C_FUNC_I2C support here.
+		 */
+		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+			dev_err(dev, "Adapter does not support 16-bit register addresses\n");
+			return -ENODEV;
+		}
+		config = &spd5118_regmap16_config;
+	} else {
+		config = &spd5118_regmap8_config;
+	}
+
+	regmap = devm_regmap_init_i2c(client, config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
 
-	return spd5118_common_probe(dev, regmap);
+	return spd5118_common_probe(dev, regmap, is_16bit);
 }
 
 static const struct i2c_device_id spd5118_i2c_id[] = {
-- 
2.45.2

