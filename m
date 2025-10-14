Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85A3009E8
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455550; cv=none; b=rmETqV4sbX/5HVtLNLA50XG7u3fErZMK+CYNy/j03rns/pQd7XfDYbAHIATM32TOgCBzXpPsRXKvt+pZYoD5+umYb1hG5ZpBi+ZPiZgc/brIUTKDoCOBw579hcivX0HzzTPh/kcX9OGmcW0/jX7sE+B5NpYWWAgZxv3OU8+0dsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455550; c=relaxed/simple;
	bh=ZGh51uxvw68R2LKYG+UUHn/+FZvzmxpWN5XlKQ+9jMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILO6nrArnnM8ETzeQDLtL4chk+87S9XrJTU2nIMLD1n1Z+UcW5fAhQOAAZ7GszSIZJhksASg+UotJqFpa3hMNoPfcZdurxFiF+F74NGfLqv3Q89ZJNNJXibab7tjwxM2aIU7q9ByjQpPS2DJaU0gHUY64PGdoID+3iSqmDNfJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsCLs8T8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsCLs8T8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-781db5068b8so4374941b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455547; x=1761060347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXDfqN5k4r5CWNdrxyCpo2EvLECjo9h5RURzw/QBGQE=;
        b=FsCLs8T8u0rf9wX39/oz02qth6zd/7rClkTwx6DIqJgsHQ4CehJ2guk8+Xi+kWQlcn
         bFoA80JQEp7wp0xbuhWWgFl9YVrtjFraWKI8B3clySbPb0grwI/+pIcOntwhkaXrKsKD
         YUSLFPxx52g24+6zKRdEDRXk3wzaDFwaSzAf8cvBawsfVCOl5rgp+naW/cmeJKBlB+eE
         khVQ7DgeZ128cSFVrAymWMkw1xEWWjZI+BM1s6IQGPdbXwsySJ7qVrWvyBg2x6/cGEwa
         aoednCxQBtX3QCsQBqfumTY8XgpCqMaAGfOj+K4W2BPnQS1V2vY62Tea079VdgaoaXrX
         kHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455547; x=1761060347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXDfqN5k4r5CWNdrxyCpo2EvLECjo9h5RURzw/QBGQE=;
        b=lRCkObf2KvG58ldKYm1oV4hVDX6LjFLV1V0ONSs07VaysiLwC3oGIpvai0UNOAWvXF
         uP7sTW85YPe0KUg88irG48gEHLOJVj+GDHlKnc6wk/PVbif7+wS2+DP4Q7cQTO3D+3z0
         tDft9LuG0ebx54yixnuWkRuJwJCqJ6g9M9me4TmgLiUUNaKaL34GjT5XgZ4uUbJobrQZ
         rpCpXaREta3mWq0l+9HTUwIqPIVq+v5GNNBookrDpRREVpNt17ZqsJEllUl7STcChmZf
         LEtkiZg5GhNYswF/ZmKVE8Xt6N3jMJf74g89z7YbGwLAhlmI7so2MMYbmztQFM1aI5Gk
         WiPw==
X-Gm-Message-State: AOJu0Yy+nn40LfNmwpAQFXLmqegMaGQYR6MOPwLkrOgKyx0P7b47Z7de
	mUyrYDDUozz3aB9NEqJiWd7fpYppDsoCsSvg42V4rhuBpRENxbPY0TMwXCOaXg==
X-Gm-Gg: ASbGncvYBCkTtisWG1LOLh0tTPJBE1pdoh1ruckcjvvnqL6mKRZfQKK7lMEAe0ITJov
	YIptGVfRx7+XcJPRDnBql2wWe8jneQsoUQy/VWN1dq13V9/MVpgx4u3GQN1DY1L3jeoK8U0GKpA
	YdYR3Q2uZ5kqKcfqBbm3bXULkYTIEcCNUsNzE6MFlYIJ3GGqMxbl00XFH7dsJKKAicblGwYptOD
	WdR+gPQnzU60Syvr5OnhuS2eDVwtnPStENZAHIQpUGSmJ9fz5E1XSWJgeSXe5rCOVio3uwW76vj
	PK6NVn6nztCTNM400gjXMqJuL5kFbcshBcCj3S6Syvm6PRN7I/E9QJ6Q/+FyxKSnkOxamr0gTYO
	4t12c3C7IVotWIP1fmPD+kWOeufSxBOgRE8ad/6cotr8JFwwqPlCSEg==
X-Google-Smtp-Source: AGHT+IEsuC/KbjA+2U0ZJBtClNwyXNtV1w88I+Nc0/i2URw5Rk5y7V6e1ZX/RMigH+BdAt2fOnRXaw==
X-Received: by 2002:a05:6a20:12ce:b0:309:48d8:cf0a with SMTP id adf61e73a8af0-32da8462fb2mr33592143637.54.1760455547273;
        Tue, 14 Oct 2025 08:25:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67d0d8391dsm4634175a12.41.2025.10.14.08.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 20/20] hwmon: (max31790) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:15 -0700
Message-ID: <20251014152515.785203-21-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
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
 drivers/hwmon/max31790.c | 48 +++++++++-------------------------------
 1 file changed, 11 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index f56913327004..4f6171a17d9f 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -57,7 +57,6 @@
  */
 struct max31790_data {
 	struct i2c_client *client;
-	struct mutex update_lock;
 	bool valid; /* zero until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 
@@ -74,30 +73,27 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 {
 	struct max31790_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	struct max31790_data *ret = data;
-	int i;
-	int rv;
-
-	mutex_lock(&data->update_lock);
+	int i, rv;
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+		data->valid = false;
 		rv = i2c_smbus_read_byte_data(client,
 				MAX31790_REG_FAN_FAULT_STATUS1);
 		if (rv < 0)
-			goto abort;
+			return ERR_PTR(rv);
 		data->fault_status |= rv & 0x3F;
 
 		rv = i2c_smbus_read_byte_data(client,
 				MAX31790_REG_FAN_FAULT_STATUS2);
 		if (rv < 0)
-			goto abort;
+			return ERR_PTR(rv);
 		data->fault_status |= (rv & 0x3F) << 6;
 
 		for (i = 0; i < NR_CHANNEL; i++) {
 			rv = i2c_smbus_read_word_swapped(client,
 					MAX31790_REG_TACH_COUNT(i));
 			if (rv < 0)
-				goto abort;
+				return ERR_PTR(rv);
 			data->tach[i] = rv;
 
 			if (data->fan_config[i]
@@ -106,19 +102,19 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 					MAX31790_REG_TACH_COUNT(NR_CHANNEL
 								+ i));
 				if (rv < 0)
-					goto abort;
+					return ERR_PTR(rv);
 				data->tach[NR_CHANNEL + i] = rv;
 			} else {
 				rv = i2c_smbus_read_word_swapped(client,
 						MAX31790_REG_PWM_DUTY_CYCLE(i));
 				if (rv < 0)
-					goto abort;
+					return ERR_PTR(rv);
 				data->pwm[i] = rv;
 
 				rv = i2c_smbus_read_word_swapped(client,
 						MAX31790_REG_TARGET_COUNT(i));
 				if (rv < 0)
-					goto abort;
+					return ERR_PTR(rv);
 				data->target_count[i] = rv;
 			}
 		}
@@ -126,16 +122,7 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
-	goto done;
-
-abort:
-	data->valid = false;
-	ret = ERR_PTR(rv);
-
-done:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return data;
 }
 
 static const u8 tach_period[8] = { 1, 2, 4, 8, 16, 32, 32, 32 };
@@ -189,7 +176,6 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		*val = rpm;
 		return 0;
 	case hwmon_fan_fault:
-		mutex_lock(&data->update_lock);
 		*val = !!(data->fault_status & (1 << channel));
 		data->fault_status &= ~(1 << channel);
 		/*
@@ -200,10 +186,9 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		if (*val) {
 			int reg = MAX31790_REG_TARGET_COUNT(channel % NR_CHANNEL);
 
-			i2c_smbus_write_byte_data(data->client, reg,
-						  data->target_count[channel % NR_CHANNEL] >> 8);
+			return i2c_smbus_write_byte_data(data->client, reg,
+						data->target_count[channel % NR_CHANNEL] >> 8);
 		}
-		mutex_unlock(&data->update_lock);
 		return 0;
 	case hwmon_fan_enable:
 		*val = !!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT_EN);
@@ -223,8 +208,6 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 	u8 bits, fan_config;
 	int sr;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_fan_target:
 		val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
@@ -270,9 +253,6 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 		err = -EOPNOTSUPP;
 		break;
 	}
-
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -338,8 +318,6 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 	u8 fan_config;
 	int err = 0;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_pwm_input:
 		if (val < 0 || val > 255) {
@@ -389,9 +367,6 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 		err = -EOPNOTSUPP;
 		break;
 	}
-
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -525,7 +500,6 @@ static int max31790_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->update_lock);
 
 	/*
 	 * Initialize the max31790 chip
-- 
2.45.2

