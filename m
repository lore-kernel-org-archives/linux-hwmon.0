Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02893191D0
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462601; cv=none; b=LUgJvRrKFgY2tVkTzUpmTYXUZjD1c5ep2/sXQuJqeJIlevC9ZALxxuUKyzMg0Easss3vUraqxyZfHw6OOsDuDQAYPzdxWXIo/j8A4Urjf1g9jfJc1RIdD0cGoCF+yqBUJYVh7zzPPwD33xPNVf+O2pTufmAjXsoImGE3coProus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462601; c=relaxed/simple;
	bh=+tuccIRjP7AhWKuY4nYhu7NDZnp8KlKmdkyeAo+b/+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9GJQq2nHPxMQJdwLvAOyuke6zgF6awYSHXMJuSIbSJDgwhliKTmng1FkGYK3HeC11tSsTSNWoA8vNOisFOrcIT51GoNu6WUcGjk+h1iZcIuEg5rF/g5ifxXxssSMXxm1nvEQNXUY+jzFaWmGIh4db3H+AX7335JV96boVr6kTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HapT44oP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HapT44oP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so87432b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462599; x=1775067399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt9PoXQ3D+fSMuRygwhM2BAvd2rSSDR308pe7UbtRJw=;
        b=HapT44oPQJ8EfTy9wJy2PJufmw/IAlMu1/6gI/vekFSbtI07ASX/kLsIRlA7qCKrh4
         rBsODrB87uvu0yb1YGAPUOXybS2IPjYCxvXoywNlXZcipM7hPRsHqH0n3wAsxLZWAnub
         Q736Lxi5m9O00+qrwsQ0YLo/OAV6GC5pNK/W7DLceIUPIo/ks5b/FvA4jU6Wn1ZyIAMr
         pFWmaEZMKbgNPY9zkRsjb287s2ygJ4Erwppwnp+Vznkd1lPGGXH0z4ptjcmqI7nGdHVS
         1CNTgFv8YfIzchR7ro0Tr9nJvsDvhNfKXmyjQk/OUJtV5+qYUicAnHBX/aO0kf5brJTk
         I35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462599; x=1775067399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt9PoXQ3D+fSMuRygwhM2BAvd2rSSDR308pe7UbtRJw=;
        b=r9XSSJoHgsmff7z+ZFyxmx1Z+VPKFcGIbk2A4HVVUGO6jGHI/YHaAeZba0zt2ylS/b
         83mn1AIUwtbkV850ywsHIVL9aENrxzoBhKbe6kAKQwzHdzOcGMy5xD+3of59sSWQ6exF
         XX8h7w30wBN7zc912IzqSQDyu9DpZZKO4ENCf8pF0DVT/zcBR0oHamQDek3kmS2EnWhk
         OVYd5rZe3KY9hrs5HFxLbU+CW2h43jgGIxntoIDwUqy6np97a/MVmjDo7OPGO6TaW8dd
         80sbc2K2W6mUbtYWSgEGG6RN99JD3jtYie3aebNQLAVmjc6eq28vXnzvH9Mq5yMxwGlV
         qT5w==
X-Gm-Message-State: AOJu0YzPJnfnaEDzZ9FV8BbPPPmE8tVR/ZQE3d2Gz1B9LgSL1K6icCET
	1vgw52T1VOUjN0kP4jOCsUoZbwSaD+dZiyOwaGiKFsCkfS1wX2ljrqF9Ybik1w==
X-Gm-Gg: ATEYQzyMymdwCB64As9ZQ9ljYk5EVFN+bnYaADah5DkSIVBJ7KnekBMi6R1yTKmxcU2
	s0llXeIwOzeFffvFSYkGY1vbFq7e3y2IJSRkJw3sC4nnu2E+ATn7IUONCj3Qgy5CyMRZQNUJ1GT
	S+gMmpZ76ZamXyDUcw2IrXz4cFrV5eseFU2Vznw56R/rLDuc0ryWWdLfCX9swkbUSEMtEU54d9X
	z/szhmWF1mgRCwDbX/e2dGv87iP7u7SlusjfAFZn6imrYP4FiOd9Ym+a5pQNA+8IdgK5afjg/Fg
	hqIzq7TIpF9a0S4eqUtmXSvCfkdilisv7OC/i3phrDZkCfGmTtljatE8c9lXgKWCCHuOTjewRiU
	eAhoMwjlOjYRfEiTiCCJmnfBmjk0WUqMwbSsXSE5hg591jcuFlggtwp8AsedGFBC4Sv8AhWuCgg
	WUYnkMQ3195uHM9hGz5W6RyBiED/Bwoye5ARJp
X-Received: by 2002:a05:6a00:ac07:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-82c6e122d11mr4057379b3a.41.1774462598927;
        Wed, 25 Mar 2026 11:16:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3837cfsm341908b3a.34.2026.03.25.11.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:16:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] hwmon: (pmbus) Introduce the concept of "write-only" attributes
Date: Wed, 25 Mar 2026 11:16:28 -0700
Message-ID: <20260325181631.17259-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325181631.17259-1-linux@roeck-us.net>
References: <20260325181631.17259-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attributes intended to clear sensor history are intended to be writeable
only. Reading those attributes today results in reporting more or less
random values. To avoid ABI surprises, have those attributes explicitly
return 0 when reading.

Fixes: 787c095edaa9d ("hwmon: (pmbus/core) Add support for rated attributes")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ecd1dddcbe0f..cbc36f0ba4bf 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1209,6 +1209,12 @@ static ssize_t pmbus_show_boolean(struct device *dev,
 	return sysfs_emit(buf, "%d\n", val);
 }
 
+static ssize_t pmbus_show_zero(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
+{
+	return sysfs_emit(buf, "0\n");
+}
+
 static ssize_t pmbus_show_sensor(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
@@ -1407,7 +1413,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 					     int reg,
 					     enum pmbus_sensor_classes class,
 					     bool update, bool readonly,
-					     bool convert)
+					     bool writeonly, bool convert)
 {
 	struct pmbus_sensor *sensor;
 	struct device_attribute *a;
@@ -1436,7 +1442,8 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 	sensor->data = -ENODATA;
 	pmbus_dev_attr_init(a, sensor->name,
 			    readonly ? 0444 : 0644,
-			    pmbus_show_sensor, pmbus_set_sensor);
+			    writeonly ? pmbus_show_zero : pmbus_show_sensor,
+			    pmbus_set_sensor);
 
 	if (pmbus_add_attribute(data, &a->attr))
 		return NULL;
@@ -1496,6 +1503,7 @@ struct pmbus_limit_attr {
 	u16 reg;		/* Limit register */
 	u16 sbit;		/* Alarm attribute status bit */
 	bool readonly:1;	/* True if the attribute is read-only */
+	bool writeonly:1;	/* True if the attribute is write-only */
 	bool update:1;		/* True if register needs updates */
 	bool low:1;		/* True if low limit; for limits with compare functions only */
 	const char *attr;	/* Attribute name */
@@ -1545,7 +1553,7 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
 			curr = pmbus_add_sensor(data, name, l->attr, index,
 						page, 0xff, l->reg, attr->class,
 						attr->update || l->update,
-						l->readonly, true);
+						l->readonly, l->writeonly, true);
 			if (!curr)
 				return -ENOMEM;
 			if (l->sbit && (info->func[page] & attr->sfunc)) {
@@ -1585,7 +1593,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 			return ret;
 	}
 	base = pmbus_add_sensor(data, name, "input", index, page, phase,
-				attr->reg, attr->class, true, true, true);
+				attr->reg, attr->class, true, true, false, true);
 	if (!base)
 		return -ENOMEM;
 	/* No limit and alarm attributes for phase specific sensors */
@@ -1722,6 +1730,7 @@ static const struct pmbus_limit_attr vin_limit_attrs[] = {
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_VIN_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_VIN_MIN,
@@ -1796,6 +1805,7 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_VOUT_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_VOUT_MIN,
@@ -1877,6 +1887,7 @@ static const struct pmbus_limit_attr iin_limit_attrs[] = {
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_IIN_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_IIN_MAX,
@@ -1918,6 +1929,7 @@ static const struct pmbus_limit_attr iout_limit_attrs[] = {
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_IOUT_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_IOUT_MAX,
@@ -1976,6 +1988,7 @@ static const struct pmbus_limit_attr pin_limit_attrs[] = {
 		.attr = "input_highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_PIN_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_PIN_MAX,
@@ -2017,6 +2030,7 @@ static const struct pmbus_limit_attr pout_limit_attrs[] = {
 		.attr = "input_highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_POUT_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_POUT_MAX,
@@ -2088,6 +2102,7 @@ static const struct pmbus_limit_attr temp_limit_attrs[] = {
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_TEMP_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_MAX_TEMP_1,
@@ -2133,6 +2148,7 @@ static const struct pmbus_limit_attr temp_limit_attrs2[] = {
 		.attr = "highest",
 	}, {
 		.reg = PMBUS_VIRT_RESET_TEMP2_HISTORY,
+		.writeonly = true,
 		.attr = "reset_history",
 	}, {
 		.reg = PMBUS_MFR_MAX_TEMP_2,
@@ -2250,7 +2266,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 
 	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
 				  0xff, PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
-				  false, false, true);
+				  false, false, false, true);
 
 	if (!sensor)
 		return -ENOMEM;
@@ -2261,14 +2277,14 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 
 	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
 				  0xff, PMBUS_VIRT_PWM_1 + id, PSC_PWM,
-				  false, false, true);
+				  false, false, false, true);
 
 	if (!sensor)
 		return -ENOMEM;
 
 	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
 				  0xff, PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
-				  true, false, false);
+				  true, false, false, false);
 
 	if (!sensor)
 		return -ENOMEM;
@@ -2310,7 +2326,7 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 
 			if (pmbus_add_sensor(data, "fan", "input", index,
 					     page, 0xff, pmbus_fan_registers[f],
-					     PSC_FAN, true, true, true) == NULL)
+					     PSC_FAN, true, true, false, true) == NULL)
 				return -ENOMEM;
 
 			/* Fan control */
-- 
2.45.2

