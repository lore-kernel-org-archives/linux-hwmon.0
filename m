Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A712D9EFE
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706164; cv=none; b=nqQqBVS3Ku9kHntCtXA74N9VJyQ8OMTjza9rVxrmeAwMtnlJiaUwYn+VRtumTzD7+2lohW5tKMBw3ZDVa3M1uUmo+hifPKTnwn6/NtzDLaAxs0LktivrPW6llFI35D2ry4LNTvddAcsjomJ3rlcgRCRbA3Q8bCqriJPbb/STHEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706164; c=relaxed/simple;
	bh=RFsq3DJo/vYVezwIkO59yN53JmilRwNDhRTpdO+pTSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZK3r79cX3KTCSU9OFoHHgc8MJVRifb002SGFXsjCJO7kMwagjutHYpnAd4C73ApUDhM318EqEvXKhJduH7zxVWUxoQ3BOk47fq8shtePnDnjb0fN7iZl0dSdempk647stiL+GdZgs0KttvP4scxSp/mLmUQoZ0q4kiGt6LqEPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU0taOV6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU0taOV6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a226a0798cso450019b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706162; x=1761310962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AIBaCDwQN1IZRKCD+zvIdtL4uDTVwptE1Td07xzbZg=;
        b=SU0taOV6lE7hQ4ymLgXpG2sZWrrcehlQGImuepCNi7dZlotqjuMMbk5j61hojO8+43
         DNaLZx7O+HX7KUwKcBH5DFvKSzddMCQ9thgQJ/9RAI/3djPOMlCo4vxUHTutXKjk/T6j
         Z+sjSz9SmDDIR2diiAL7v7wmZAR4Vxcuzt8gn0fts9L2AD9lgaeyy3ouf6QfGvy6+r+8
         UaQis2PfnQ3xQOrX29+sgV91lnQ3fkwEGSQg0uoqW20kbzI5an+HzERHLtGDa533Z0sU
         yueyaWtgONSDxnRpt4VQS0ac5KMLBzJQ0Dsn9jWDc8tQcq1DLzdzLH8HacxoZ3KOciE0
         wFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706162; x=1761310962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2AIBaCDwQN1IZRKCD+zvIdtL4uDTVwptE1Td07xzbZg=;
        b=KBsIEY3sazREd0cJTUM+lsRjccuhFYaa8CLzePh+Fwyw5DIGM/Ef5lN/4Rj48inoMK
         g3H8I6oUSC4OOpR+v1V41EGzQcBDDYEM/GkWQNgIkjUiVvR21rkz/OSiEHcbeDzP7nry
         EjRxIMjUdNHSdF0AYtejNgA4K3tkvLroWw0N49jhZDIq3DLc5+buSuMUr452hapG0Vzt
         w/K0s2Mh9M2DjEKVD7D/BAXj4Xgm3d7nqTLcXKDyAZtpPyVI2ejD4lrVU+JA3adaZGBr
         Y/HNco5E2q83CtwtmsRABUYu6GyLR9fUZL6YhnPLKy22prPFXGtr4+qOmVRyk36xnjrp
         aD3Q==
X-Gm-Message-State: AOJu0Yz8bsQA7rP+GDx0SQlomRKOc40CPs0A5skoeWkVz9/u8QI5KjHy
	3yflCRV3ImXV8wCLYX8IwSKuHWHO2w4xOsNzK4NAR4jjUfN2HOcGJaenn2idAg==
X-Gm-Gg: ASbGncu4t++dLbnVS91HdxV6FbA/KaBpNBhqAKc5IlL5VWL1hlDlu71f9ZeaGg6YsKI
	pqIrx0dWMkp3xFiorYiO2DyCbeP9xksKaVOLiWub1hNSjRzuviuWSpvsylabf4bs/n8uGuIta+d
	aSZbOyqNO3rIeJ/3t06jsiW/GQKHewcPdl5nF9ClAsutihItNDYgwS9f0VONugU8n3GbbHUpgC0
	tk8xQNNr8zcHHFcvhKE4edFDHDCy3Vgv8yU5TFzFTw6T+AsS6xHo33/PQxkzrMrhsNEQidR9QKQ
	wsdehkA4WYZsdnyydzd6fYDuKi4l5KmXZAuv18E5TXgSKxhNiv/1Ih8xl/4GEpG5s49T7ZwipRj
	KhLj7NaL4HGZ02pkDGA3ljlUSxxyR2L/XR6UU9Dltkp7fkfGnVu7LAnClA+CcCw0FTdi5vrpmLI
	r/3tmlMV5yNMgp
X-Google-Smtp-Source: AGHT+IFFiVxb3FQDVJirYJk8cjuxpwJB/QZLz5l80+FdA8GJ5omGdk5ncsiGpcCjK/j3ztj4hJdBHQ==
X-Received: by 2002:a05:6a20:7286:b0:262:c083:bb47 with SMTP id adf61e73a8af0-334a85473b3mr4866619637.14.1760706161611;
        Fri, 17 Oct 2025 06:02:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b53b68sm2860036a91.21.2025.10.17.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/29] hwmon: (ina2xx) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:58 -0700
Message-ID: <20251017130221.1823453-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index bc3c1f7314b3..69ac0468dee4 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -156,7 +156,6 @@ struct ina2xx_data {
 	long rshunt;
 	long current_lsb_uA;
 	long power_lsb_uW;
-	struct mutex config_lock;
 	struct regmap *regmap;
 	struct i2c_client *client;
 };
@@ -390,22 +389,19 @@ static int ina226_alert_limit_read(struct ina2xx_data *data, u32 mask, int reg,
 	int regval;
 	int ret;
 
-	mutex_lock(&data->config_lock);
 	ret = regmap_read(regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
-		goto abort;
+		return ret;
 
 	if (regval & mask) {
 		ret = regmap_read(regmap, INA226_ALERT_LIMIT, &regval);
 		if (ret)
-			goto abort;
+			return ret;
 		*val = ina2xx_get_value(data, reg, regval);
 	} else {
 		*val = 0;
 	}
-abort:
-	mutex_unlock(&data->config_lock);
-	return ret;
+	return 0;
 }
 
 static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, int reg, long val)
@@ -421,23 +417,20 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, int reg,
 	 * due to register write sequence. Then, only enable the alert
 	 * if the value is non-zero.
 	 */
-	mutex_lock(&data->config_lock);
 	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
 				 INA226_ALERT_CONFIG_MASK, 0);
 	if (ret < 0)
-		goto abort;
+		return ret;
 
 	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
 			   ina226_alert_to_reg(data, reg, val));
 	if (ret < 0)
-		goto abort;
+		return ret;
 
 	if (val)
-		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
-					 INA226_ALERT_CONFIG_MASK, mask);
-abort:
-	mutex_unlock(&data->config_lock);
-	return ret;
+		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
+					  INA226_ALERT_CONFIG_MASK, mask);
+	return 0;
 }
 
 static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
@@ -859,9 +852,9 @@ static ssize_t shunt_resistor_store(struct device *dev,
 	if (status < 0)
 		return status;
 
-	mutex_lock(&data->config_lock);
+	hwmon_lock(dev);
 	status = ina2xx_set_shunt(data, val);
-	mutex_unlock(&data->config_lock);
+	hwmon_unlock(dev);
 	if (status < 0)
 		return status;
 	return count;
@@ -951,7 +944,6 @@ static int ina2xx_probe(struct i2c_client *client)
 	data->client = client;
 	data->config = &ina2xx_config[chip];
 	data->chip = chip;
-	mutex_init(&data->config_lock);
 
 	data->regmap = devm_regmap_init_i2c(client, &ina2xx_regmap_config);
 	if (IS_ERR(data->regmap)) {
-- 
2.45.2

