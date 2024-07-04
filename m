Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DEB143892
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129053; cv=none; b=HszFG9aUrBaF/h2vJqxQ+kMj94x2kn7YYZykL28YAvjywyc6dTe6hww0ul1fiPD81O+FsS4Xc93YCLaOgl1k8odafwgVMIecEbPddjVHQSjOhnEj61NIgdfHkxxwULDZdsOuYWPi+pySJ7gqTSMVniRbo8YUtZHjyCNLZJlX7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129053; c=relaxed/simple;
	bh=bL6En/O/0JQVpkxdQxIohzKYBdIwJTRNIUeG7yFtKRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQ+U7Apjd8ACQyvdfDulsSgcURNtiQDSQYPUAnAoJQR/AHAg2JyRh7UE6bip0+ArSfT7E8C/2j8ZK5sfS01rPR2pER+6dDf54st3KahVTgz75BbwIQf066mwmVxhQiHT9mD0CYTogi+tpmwt8AkHibVc3EmU5oRu+/sqj75owIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQ6C3nYY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQ6C3nYY"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70b07bdbfbcso341866b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129049; x=1720733849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7DuJTXSlON7TohY9mwLqeoreQHAYCXkdnK3Jl9kcBM=;
        b=CQ6C3nYYbrEESmJxajwLynOY5zFcpNlKELlBSUQzBp8PtKwrP3N3WRVD4UurpoNMdR
         tB4VZaOFoIBzm4gHpKzjOfHvAG62iAxdqAd3lcR8P4FUEYI6BbUFJki0ms5LASoF7nsw
         Br6ByNtWVz28zZKs8FoXhbIQV9CtndHPoyNZW3UzdfU8oXPyXjd00Z4Jpv9W1gQzr6mp
         rUaj/cOwjfg5V16w4AfREDWi1Q6yWVfWNaF7XJoukRTw9XU60wREI6huJeQBcVx3Pqp5
         Pd1Z9kHwqdE1a+ASDBjALPrSUMkkHoNZcopnWFuwmiJYbi65k1dDEJR/X0zBvys5JkSP
         /VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129049; x=1720733849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7DuJTXSlON7TohY9mwLqeoreQHAYCXkdnK3Jl9kcBM=;
        b=qDeaRZKp9iaD1HFOU2BdG7yOukSDrnK6AptY8T9I3wdwVskkIWHrtxp1IHB5mjU+l3
         NIFpXqGXEFEXWmEZZf4FtyZmVNHfqK+1aB9UVSh6bnDFpmYliOuLQiMo1W1IS3wGFirv
         0YswkQAExXGc99F6fv7cMhocLtyDlHGa0KddWUnhtEZDVVnWKbwVeQx7fy500/xQPssy
         4EA58HO3pAxDaNPyvkAoInL1BJlVZK5luj/CYiLPCV0g4Y2NFma4evZdrT1qaJwaLWXu
         DWe+dliqnbsVZANtpzvGMNQkl3Jrq+VJWJg3l5YTgDSBPXZDz0taiwUAjxb/nJAe8KZE
         lOcg==
X-Gm-Message-State: AOJu0Yyv1ndpCW9OgdAyIW6x75fLOivfWwZQHH/PUzXogsmF0JVm4v/G
	WjpnZVCwKfvxTq7SMD4r9JJEr/gBWyhLRmFfZBkOhy96N+/5/kniMk2OSg==
X-Google-Smtp-Source: AGHT+IHDfSOwsXepk/+u5w9dGLhstEP76VZii2mbXBhNPc0XTGv12MeiDZMYPnd/mM7KTBhglkD1eg==
X-Received: by 2002:a05:6a21:995:b0:1b5:cc1f:38d4 with SMTP id adf61e73a8af0-1c0cd1a5e58mr2715740637.17.1720129049082;
        Thu, 04 Jul 2024 14:37:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080256afaasm12715970b3a.81.2024.07.04.14.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/7] hwmon: (g762) Convert to use regmap
Date: Thu,  4 Jul 2024 14:37:11 -0700
Message-Id: <20240704213712.2699553-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704213712.2699553-1-linux@roeck-us.net>
References: <20240704213712.2699553-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use regmap for caching and regmap operations for register bit manipulations
to simplify the code.

No functional change intended.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/g762.rst |   2 -
 drivers/hwmon/g762.c         | 523 +++++++++++++----------------------
 2 files changed, 195 insertions(+), 330 deletions(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 3dc5294b2181..0c170596a1ac 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -68,5 +68,3 @@ is performed to match that target value. The fan speed value is computed
 based on the parameters associated with the physical characteristics of the
 system: a reference clock source frequency, a number of pulses per fan
 revolution, etc.
-
-Note that the driver will update its values at most once per second.
diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 0ddaa0bd1075..5f8fd723a694 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -36,11 +36,11 @@
 #include <linux/init.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 
 #define DRVNAME "g762"
 
@@ -68,19 +68,6 @@ enum g762_regs {
 #define G762_REG_FAN_STA_FAIL		BIT(1)	/* fan fail */
 #define G762_REG_FAN_STA_OOC		BIT(0)	/* fan out of control */
 
-/* Config register values */
-#define G762_OUT_MODE_PWM		1
-#define G762_OUT_MODE_DC		0
-
-#define G762_FAN_MODE_CLOSED_LOOP	2
-#define G762_FAN_MODE_OPEN_LOOP		1
-
-#define G762_PWM_POLARITY_NEGATIVE	1
-#define G762_PWM_POLARITY_POSITIVE	0
-
-/* Register data is read (and cached) at most once per second. */
-#define G762_UPDATE_INTERVAL		HZ
-
 /*
  * Extract pulse count per fan revolution value (2 or 4) from given
  * FAN_CMD1 register value.
@@ -103,48 +90,13 @@ enum g762_regs {
 	BIT(FIELD_GET(G762_REG_FAN_CMD2_GEAR_MASK, reg))
 
 struct g762_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 
 	/* update mutex */
 	struct mutex update_lock;
 
 	/* board specific parameters. */
 	u32 clk_freq;
-
-	/* g762 register cache */
-	bool valid;
-	unsigned long last_updated; /* in jiffies */
-
-	u8 set_cnt;  /* controls fan rotation speed in closed-loop mode */
-	u8 act_cnt;  /* provides access to current fan RPM value */
-	u8 fan_sta;  /* bit 0: set when actual fan speed is more than
-		      *        25% outside requested fan speed
-		      * bit 1: set when no transition occurs on fan
-		      *        pin for 0.7s
-		      */
-	u8 set_out;  /* controls fan rotation speed in open-loop mode */
-	u8 fan_cmd1; /*   0: FG_PLS_ID0 FG pulses count per revolution
-		      *      0: 2 counts per revolution
-		      *      1: 4 counts per revolution
-		      *   1: PWM_POLARITY 1: negative_duty
-		      *                   0: positive_duty
-		      * 2,3: [FG_CLOCK_ID0, FG_CLK_ID1]
-		      *         00: Divide fan clock by 1
-		      *         01: Divide fan clock by 2
-		      *         10: Divide fan clock by 4
-		      *         11: Divide fan clock by 8
-		      *   4: FAN_MODE 1:closed-loop, 0:open-loop
-		      *   5: OUT_MODE 1:PWM, 0:DC
-		      *   6: DET_FAN_OOC enable "fan ooc" status
-		      *   7: DET_FAN_FAIL enable "fan fail" status
-		      */
-	u8 fan_cmd2; /* 0,1: FAN_STARTV 0,1,2,3 -> 0,32,64,96 dac_code
-		      * 2,3: FG_GEAR_MODE
-		      *         00: multiplier = 1
-		      *         01: multiplier = 2
-		      *         10: multiplier = 4
-		      *   4: Mask ALERT# (g763 only)
-		      */
 };
 
 /*
@@ -179,59 +131,6 @@ static inline unsigned char cnt_from_rpm(unsigned long rpm, u32 clk_freq, u16 p,
 	return DIV_ROUND_CLOSEST(f1, rpm * f2);
 }
 
-/* helper to grab and cache data, at most one time per second */
-static struct g762_data *g762_update_client(struct device *dev)
-{
-	struct g762_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int ret = 0;
-
-	mutex_lock(&data->update_lock);
-	if (time_before(jiffies, data->last_updated + G762_UPDATE_INTERVAL) &&
-	    likely(data->valid))
-		goto out;
-
-	ret = i2c_smbus_read_byte_data(client, G762_REG_SET_CNT);
-	if (ret < 0)
-		goto out;
-	data->set_cnt = ret;
-
-	ret = i2c_smbus_read_byte_data(client, G762_REG_ACT_CNT);
-	if (ret < 0)
-		goto out;
-	data->act_cnt = ret;
-
-	ret = i2c_smbus_read_byte_data(client, G762_REG_FAN_STA);
-	if (ret < 0)
-		goto out;
-	data->fan_sta = ret;
-
-	ret = i2c_smbus_read_byte_data(client, G762_REG_SET_OUT);
-	if (ret < 0)
-		goto out;
-	data->set_out = ret;
-
-	ret = i2c_smbus_read_byte_data(client, G762_REG_FAN_CMD1);
-	if (ret < 0)
-		goto out;
-	data->fan_cmd1 = ret;
-
-	ret = i2c_smbus_read_byte_data(client, G762_REG_FAN_CMD2);
-	if (ret < 0)
-		goto out;
-	data->fan_cmd2 = ret;
-
-	data->last_updated = jiffies;
-	data->valid = true;
- out:
-	mutex_unlock(&data->update_lock);
-
-	if (ret < 0) /* upon error, encode it in return value */
-		data = ERR_PTR(ret);
-
-	return data;
-}
-
 /* helpers for writing hardware parameters */
 
 /*
@@ -257,125 +156,72 @@ static int do_set_clk_freq(struct device *dev, unsigned long val)
 /* Set pwm mode. Accepts either 0 (PWM mode) or 1 (DC mode) */
 static int do_set_pwm_mode(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
-	int ret;
+	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	if (val && val != 1)
+		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	switch (val) {
-	case G762_OUT_MODE_PWM:
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_OUT_MODE;
-		break;
-	case G762_OUT_MODE_DC:
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_OUT_MODE;
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
-	}
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
-					data->fan_cmd1);
-	data->valid = false;
- out:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD1,
+				  G762_REG_FAN_CMD1_OUT_MODE,
+				  val ? G762_REG_FAN_CMD1_OUT_MODE : 0);
 }
 
 /* Set fan clock divisor. Accepts either 1, 2, 4 or 8. */
 static int do_set_fan_div(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
-	int ret;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	struct g762_data *data = dev_get_drvdata(dev);
 
 	if (hweight_long(val) != 1 || val > 8)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	data->fan_cmd1 &= ~G762_REG_FAN_CMD1_CLK_DIV_MASK;
-	data->fan_cmd1 |= FIELD_PREP(G762_REG_FAN_CMD1_CLK_DIV_MASK, __ffs(val));
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
-					data->fan_cmd1);
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD1,
+				  G762_REG_FAN_CMD1_CLK_DIV_MASK,
+				  FIELD_PREP(G762_REG_FAN_CMD1_CLK_DIV_MASK, __ffs(val)));
 }
 
 /* Set fan gear mode. Accepts either 0, 1 or 2. */
 static int do_set_fan_gear_mode(struct device *dev, u32 val)
 {
-	struct g762_data *data = g762_update_client(dev);
-	int ret;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	struct g762_data *data = dev_get_drvdata(dev);
 
 	if (val > 2)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	data->fan_cmd2 &= ~G762_REG_FAN_CMD2_GEAR_MASK;
-	data->fan_cmd2 |= FIELD_PREP(G762_REG_FAN_CMD2_GEAR_MASK, val);
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD2,
-					data->fan_cmd2);
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD2,
+				  G762_REG_FAN_CMD2_GEAR_MASK,
+				  FIELD_PREP(G762_REG_FAN_CMD2_GEAR_MASK, val));
 }
 
 /* Set number of fan pulses per revolution. Accepts either 2 or 4. */
 static int do_set_fan_pulses(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
-	int ret;
+	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	if (val != 2 && val != 4)
+		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	switch (val) {
-	case 2:
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_PULSE_PER_REV;
-		break;
-	case 4:
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_PULSE_PER_REV;
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
-	}
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
-					data->fan_cmd1);
-	data->valid = false;
- out:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD1,
+				  G762_REG_FAN_CMD1_PULSE_PER_REV,
+				  val == 4 ? G762_REG_FAN_CMD1_PULSE_PER_REV : 0);
 }
 
 /* Set fan mode. Accepts either 1 (open-loop) or 2 (closed-loop). */
 static int do_set_pwm_enable(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	if (val != 1 && val != 2)
+		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-	switch (val) {
-	case G762_FAN_MODE_CLOSED_LOOP:
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_FAN_MODE;
-		break;
-	case G762_FAN_MODE_OPEN_LOOP:
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_FAN_MODE;
+	if (val == 1) {
+		u32 regval;
+
+		ret = regmap_read(regmap, G762_REG_SET_CNT, &regval);
+		if (ret)
+			goto unlock;
 		/*
 		 * BUG FIX: if SET_CNT register value is 255 then, for some
 		 * unknown reason, fan will not rotate as expected, no matter
@@ -383,52 +229,26 @@ static int do_set_pwm_enable(struct device *dev, unsigned long val)
 		 * only in PWM mode). To workaround this bug, we give SET_CNT
 		 * value of 254 if it is 255 when switching to open-loop.
 		 */
-		if (data->set_cnt == 0xff)
-			i2c_smbus_write_byte_data(data->client,
-						  G762_REG_SET_CNT, 254);
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
+		if (regval == 0xff)
+			regmap_write(regmap, G762_REG_SET_CNT, 254);
 	}
-
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
-					data->fan_cmd1);
-	data->valid = false;
- out:
+	ret = regmap_update_bits(regmap, G762_REG_FAN_CMD1, G762_REG_FAN_CMD1_FAN_MODE,
+				 val == 2 ? G762_REG_FAN_CMD1_FAN_MODE : 0);
+unlock:
 	mutex_unlock(&data->update_lock);
-
 	return ret;
 }
 
 /* Set PWM polarity. Accepts either 0 (positive duty) or 1 (negative duty) */
 static int do_set_pwm_polarity(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
-	int ret;
+	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	if (val && val != 1)
+		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	switch (val) {
-	case G762_PWM_POLARITY_POSITIVE:
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_PWM_POLARITY;
-		break;
-	case G762_PWM_POLARITY_NEGATIVE:
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_PWM_POLARITY;
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
-	}
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
-					data->fan_cmd1);
-	data->valid = false;
- out:
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD1, G762_REG_FAN_CMD1_PWM_POLARITY,
+				  val ? G762_REG_FAN_CMD1_PWM_POLARITY : 0);
 }
 
 /*
@@ -438,18 +258,11 @@ static int do_set_pwm_polarity(struct device *dev, unsigned long val)
 static int do_set_pwm(struct device *dev, unsigned long val)
 {
 	struct g762_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int ret;
 
 	if (val > 255)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	ret = i2c_smbus_write_byte_data(client, G762_REG_SET_OUT, val);
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_write(data->regmap, G762_REG_SET_OUT, val);
 }
 
 /*
@@ -458,52 +271,81 @@ static int do_set_pwm(struct device *dev, unsigned long val)
  */
 static int do_set_fan_target(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 cmd1, cmd2;
+	u8 set_cnt;
 	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
 	mutex_lock(&data->update_lock);
-	data->set_cnt = cnt_from_rpm(val, data->clk_freq,
-				     G762_PULSE_FROM_REG(data->fan_cmd1),
-				     G762_CLKDIV_FROM_REG(data->fan_cmd1),
-				     G762_GEARMULT_FROM_REG(data->fan_cmd2));
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_SET_CNT,
-					data->set_cnt);
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
 
+	ret = regmap_read(regmap, G762_REG_FAN_CMD1, &cmd1);
+	if (ret)
+		goto unlock;
+	ret = regmap_read(regmap, G762_REG_FAN_CMD2, &cmd2);
+	if (ret)
+		goto unlock;
+
+	set_cnt = cnt_from_rpm(val, data->clk_freq,
+			       G762_PULSE_FROM_REG(cmd1),
+			       G762_CLKDIV_FROM_REG(cmd1),
+			       G762_GEARMULT_FROM_REG(cmd2));
+	ret = regmap_write(regmap, G762_REG_SET_CNT, set_cnt);
+unlock:
+	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
 /* Set fan startup voltage. Accepted values are either 0, 1, 2 or 3. */
 static int do_set_fan_startv(struct device *dev, unsigned long val)
 {
-	struct g762_data *data = g762_update_client(dev);
-	int ret;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	struct g762_data *data = dev_get_drvdata(dev);
 
 	if (val > 3)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
-	data->fan_cmd2 &= ~G762_REG_FAN_CMD2_FAN_STARTV_MASK;
-	data->fan_cmd2 |= FIELD_PREP(G762_REG_FAN_CMD2_FAN_STARTV_MASK, val);
-	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD2,
-					data->fan_cmd2);
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return regmap_update_bits(data->regmap, G762_REG_FAN_CMD2,
+				  G762_REG_FAN_CMD2_FAN_STARTV_MASK,
+				  FIELD_PREP(G762_REG_FAN_CMD2_FAN_STARTV_MASK, val));
 }
 
 /*
  * sysfs attributes
  */
 
+static int get_fan_rpm_locked(struct g762_data *data, int reg)
+{
+	struct regmap *regmap = data->regmap;
+	u32 cmd1, cmd2, count;
+	int ret;
+
+	ret = regmap_read(regmap, reg, &count);
+	if (ret)
+		return ret;
+	ret = regmap_read(regmap, G762_REG_FAN_CMD1, &cmd1);
+	if (ret)
+		return ret;
+	ret = regmap_read(regmap, G762_REG_FAN_CMD2, &cmd2);
+	if (ret)
+		return ret;
+
+	return rpm_from_cnt(count, data->clk_freq,
+			    G762_PULSE_FROM_REG(cmd1),
+			    G762_CLKDIV_FROM_REG(cmd1),
+			    G762_GEARMULT_FROM_REG(cmd2));
+}
+
+static int get_fan_rpm(struct g762_data *data, int reg)
+{
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = get_fan_rpm_locked(data, reg);
+	mutex_unlock(&data->update_lock);
+
+	return ret;
+}
+
 /*
  * Read function for fan1_input sysfs file. Return current fan RPM value, or
  * 0 if fan is out of control.
@@ -511,23 +353,24 @@ static int do_set_fan_startv(struct device *dev, unsigned long val)
 static ssize_t fan1_input_show(struct device *dev,
 			       struct device_attribute *da, char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
-	unsigned int rpm = 0;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 status;
+	int ret;
 
 	mutex_lock(&data->update_lock);
+	ret = regmap_read(data->regmap, G762_REG_FAN_STA, &status);
 	/* reverse logic: fan out of control reporting is enabled low */
-	if (data->fan_sta & G762_REG_FAN_STA_OOC) {
-		rpm = rpm_from_cnt(data->act_cnt, data->clk_freq,
-				   G762_PULSE_FROM_REG(data->fan_cmd1),
-				   G762_CLKDIV_FROM_REG(data->fan_cmd1),
-				   G762_GEARMULT_FROM_REG(data->fan_cmd2));
-	}
-	mutex_unlock(&data->update_lock);
+	if (ret || !(status & G762_REG_FAN_STA_OOC))
+		goto unlock;
 
-	return sprintf(buf, "%u\n", rpm);
+	ret = get_fan_rpm_locked(data, G762_REG_ACT_CNT);
+	if (ret < 0)
+		goto unlock;
+
+	ret = sprintf(buf, "%u\n", ret);
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 /*
@@ -537,13 +380,15 @@ static ssize_t fan1_input_show(struct device *dev,
 static ssize_t pwm1_mode_show(struct device *dev, struct device_attribute *da,
 			      char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 cmd1;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%d\n",
-		       !!(data->fan_cmd1 & G762_REG_FAN_CMD1_OUT_MODE));
+	return sprintf(buf, "%d\n", !!(cmd1 & G762_REG_FAN_CMD1_OUT_MODE));
 }
 
 static ssize_t pwm1_mode_store(struct device *dev,
@@ -570,12 +415,15 @@ static ssize_t pwm1_mode_store(struct device *dev,
 static ssize_t fan1_div_show(struct device *dev, struct device_attribute *da,
 			     char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 cmd1;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%ld\n", G762_CLKDIV_FROM_REG(data->fan_cmd1));
+	return sprintf(buf, "%ld\n", G762_CLKDIV_FROM_REG(cmd1));
 }
 
 static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
@@ -601,12 +449,15 @@ static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
 static ssize_t fan1_pulses_show(struct device *dev,
 				struct device_attribute *da, char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 cmd1;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%ld\n", G762_PULSE_FROM_REG(data->fan_cmd1));
+	return sprintf(buf, "%ld\n", G762_PULSE_FROM_REG(cmd1));
 }
 
 static ssize_t fan1_pulses_store(struct device *dev,
@@ -643,13 +494,16 @@ static ssize_t fan1_pulses_store(struct device *dev,
 static ssize_t pwm1_enable_show(struct device *dev,
 				struct device_attribute *da, char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 cmd1;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_FAN_CMD1, &cmd1);
+	if (ret < 0)
+		return ret;
 
 	return sprintf(buf, "%d\n",
-		       (!!(data->fan_cmd1 & G762_REG_FAN_CMD1_FAN_MODE)) + 1);
+		       !!(cmd1 & G762_REG_FAN_CMD1_FAN_MODE) + 1);
 }
 
 static ssize_t pwm1_enable_store(struct device *dev,
@@ -677,12 +531,15 @@ static ssize_t pwm1_enable_store(struct device *dev,
 static ssize_t pwm1_show(struct device *dev, struct device_attribute *da,
 			 char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	int ret;
+	u32 pwm;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_SET_OUT, &pwm);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%d\n", data->set_out);
+	return sprintf(buf, "%u\n", pwm);
 }
 
 static ssize_t pwm1_store(struct device *dev, struct device_attribute *da,
@@ -715,20 +572,14 @@ static ssize_t pwm1_store(struct device *dev, struct device_attribute *da,
 static ssize_t fan1_target_show(struct device *dev,
 				struct device_attribute *da, char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
-	unsigned int rpm;
+	struct g762_data *data = dev_get_drvdata(dev);
+	int rpm;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	rpm = get_fan_rpm(data, G762_REG_SET_CNT);
+	if (rpm < 0)
+		return rpm;
 
-	mutex_lock(&data->update_lock);
-	rpm = rpm_from_cnt(data->set_cnt, data->clk_freq,
-			   G762_PULSE_FROM_REG(data->fan_cmd1),
-			   G762_CLKDIV_FROM_REG(data->fan_cmd1),
-			   G762_GEARMULT_FROM_REG(data->fan_cmd2));
-	mutex_unlock(&data->update_lock);
-
-	return sprintf(buf, "%u\n", rpm);
+	return sprintf(buf, "%d\n", rpm);
 }
 
 static ssize_t fan1_target_store(struct device *dev,
@@ -752,12 +603,15 @@ static ssize_t fan1_target_store(struct device *dev,
 static ssize_t fan1_fault_show(struct device *dev, struct device_attribute *da,
 			       char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 status;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_FAN_STA, &status);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%u\n", !!(data->fan_sta & G762_REG_FAN_STA_FAIL));
+	return sprintf(buf, "%u\n", !!(status & G762_REG_FAN_STA_FAIL));
 }
 
 /*
@@ -767,12 +621,15 @@ static ssize_t fan1_fault_show(struct device *dev, struct device_attribute *da,
 static ssize_t fan1_alarm_show(struct device *dev,
 			       struct device_attribute *da, char *buf)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
+	u32 status;
+	int ret;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	ret = regmap_read(data->regmap, G762_REG_FAN_STA, &status);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%u\n", !(data->fan_sta & G762_REG_FAN_STA_OOC));
+	return sprintf(buf, "%u\n", !(status & G762_REG_FAN_STA_OOC));
 }
 
 static DEVICE_ATTR_RW(pwm1);
@@ -802,23 +659,14 @@ static struct attribute *g762_attrs[] = {
 ATTRIBUTE_GROUPS(g762);
 
 /*
- * Enable both fan failure detection and fan out of control protection. The
- * function does not protect change/access to data structure; it must thus
- * only be called during initialization.
+ * Enable both fan failure detection and fan out of control protection.
  */
 static inline int g762_fan_init(struct device *dev)
 {
-	struct g762_data *data = g762_update_client(dev);
+	struct g762_data *data = dev_get_drvdata(dev);
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	data->fan_cmd1 |= G762_REG_FAN_CMD1_DET_FAN_FAIL;
-	data->fan_cmd1 |= G762_REG_FAN_CMD1_DET_FAN_OOC;
-	data->valid = false;
-
-	return i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
-					 data->fan_cmd1);
+	return regmap_set_bits(data->regmap, G762_REG_FAN_CMD1,
+			       G762_REG_FAN_CMD1_DET_FAN_FAIL | G762_REG_FAN_CMD1_DET_FAN_OOC);
 }
 
 /*
@@ -880,6 +728,26 @@ static int g762_configure(struct device *dev)
 	return 0;
 }
 
+static bool g762_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg == G762_REG_SET_CNT || reg == G762_REG_SET_OUT ||
+	  reg == G762_REG_FAN_CMD1 || reg == G762_REG_FAN_CMD2;
+}
+
+static bool g762_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == G762_REG_ACT_CNT || reg == G762_REG_FAN_STA;
+}
+
+static const struct regmap_config g762_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = G762_REG_FAN_CMD2,
+	.writeable_reg = g762_writeable_reg,
+	.volatile_reg = g762_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int g762_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -887,16 +755,15 @@ static int g762_probe(struct i2c_client *client)
 	struct g762_data *data;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA))
-		return -ENODEV;
-
 	data = devm_kzalloc(dev, sizeof(struct g762_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->regmap = devm_regmap_init_i2c(client, &g762_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
 	dev_set_drvdata(dev, data);
-	data->client = client;
 	mutex_init(&data->update_lock);
 
 	ret = g762_configure(dev);
-- 
2.39.2

