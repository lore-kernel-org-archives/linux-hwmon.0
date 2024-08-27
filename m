Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D8D517
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772915; cv=none; b=A2HxNjSekJOhL7FZ1Kt7y+pWD7bewrrrDmiq56RWpJGtZ/uIP+IMFySSlMQltQC3eS33gcOeS7CF0MrH6h79YNB/lvc3Sbra4yvDEO+2UwZnUpvWjL8/UOlrnuSve5pFRnFrUWC5uIneu36PJVLg68qFbCBbw0OBhBsTs/fPsa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772915; c=relaxed/simple;
	bh=ayy0m91L/UXKP4Xa9X0AO7SamC9ZIlIozwXecgQlUUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWnWoL+kIgnoPPHxtLcmTH1qrsDjFiKTuoB+u4UNX/aQYETdA+jvZq1EHu3x4ug2eDCHtVTkX8eW2QIZtQW43HS1qEYApXJqvtUQWFIWQW7DhMglaXu1c3ZqMWt9SVsXEpipPzX53CXtkRKzaPDXubNe1ZoGxYlXnb088w0jWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXLw/TNK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXLw/TNK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7142448aaf9so3850682b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772912; x=1725377712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ue2oKiCaaPUDUMqc8W2WoO5gneM1Ci3wUm2JeGYt0o=;
        b=KXLw/TNK6xHufZXPhxD7mUBjYlHifjpz414PJcAzKBZMzDpPwm55BaXXABhMyctSA3
         1b4CVTloz+0aHVTGtiacdCIk11F8dEKWpE3Jld73csX5FAWPQVDSmXDq0ynYieEZ14op
         KM5AmeccBeMatXBkF1JgulDJ+r7PKbVgEUhCWyyQ4E4qZh7gn6wn4u/WQR6/yLs4QSLA
         FF9+qmPw+DA2zd7sUcCkCdqCwpKLIQHI7jdPUW8vEpMiWZZbIi+6DB9WuwKWEnlxvCbD
         TnGx03cFsyERbhFFe2xsNvGq1viqU+JoD877skYVosFl2XldhT+1vrRzkO0DWrMyADv2
         lRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772912; x=1725377712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ue2oKiCaaPUDUMqc8W2WoO5gneM1Ci3wUm2JeGYt0o=;
        b=vXT46xkVk7q6qKzMPDdOPGrIQmqIrKOWrBM8vIuZUT5M/Oz7DomXcdziisQiGKO1jA
         JixLeRqqvwJn1T9dNlVoiBaSRxmB9iMz/M4UoEtT/PU1XfcLnPNnHlmyBHmwkPKV/PR4
         eL4CSIyVsbvxHQrtHRc9Ax82JWFCYxEWNlzDtb3OKpFXiOIiVy04f6i8lOV1a+wxACPH
         ebMkogNa1hUA6ZsmasxjInXF0OlTsmJ2SWI0pZTCoajFlXU7GPoDv5rpgBK2Q/EYfboA
         eRnZzVtRckN4c6EXIZsXSWKTaPVlBQud7XP2wgkrTBhOZQvih2eXGwwfpXSelqJ7WmEj
         3Vjw==
X-Gm-Message-State: AOJu0YzHFeTXoRbZRltoTN7IxU9H02Ot+hGXxy0ry3jcFEYhJezVriqI
	4AliACtbTzxAHbeH48pIhA4ZAvxOQsTkuiyIe77TG9aI3D3WIJFMUWugbA==
X-Google-Smtp-Source: AGHT+IHr/r0sptXjRe5d3TcwUADwuXDW7XiSA9uVhQPpmwfNNjBfEnv9jap5/WGdR8rTDQqrwURKtA==
X-Received: by 2002:aa7:8fa7:0:b0:714:2371:7a02 with SMTP id d2e1a72fcca58-715bff087b8mr4436596b3a.5.1724772912419;
        Tue, 27 Aug 2024 08:35:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acab541sm8133535a12.22.2024.08.27.08.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/11] hwmon: (ina2xx) Fix various overflow issues
Date: Tue, 27 Aug 2024 08:34:52 -0700
Message-ID: <20240827153455.1344529-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module tests show various overflow problems when writing limits
and other attributes.

in0_crit: Suspected overflow: [max=82, read 0, written 2147483648]
in0_lcrit: Suspected overflow: [max=82, read 0, written 2147483648]
in1_crit: Suspected overflow: [max=40959, read 0, written 2147483647]
in1_lcrit: Suspected overflow: [max=40959, read 0, written 2147483647]
power1_crit: Suspected overflow: [max=134218750, read 0, written 2147483648]
update_interval: Suspected overflow: [max=2253, read 2, written 2147483647]

Implement missing clamping on attribute write operations to avoid those
problems.

While at it, check in the probe function if the shunt resistor value
passed from devicetree is valid, and bail out if it isn't. Also limit
mutex use to the code calling ina2xx_set_shunt() since it isn't needed
when called from the probe function.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 9016c90f23c9..b40fc808bf3d 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -192,10 +192,16 @@ static int ina226_reg_to_interval(u16 config)
  * Return the new, shifted AVG field value of CONFIG register,
  * to use with regmap_update_bits
  */
-static u16 ina226_interval_to_reg(int interval)
+static u16 ina226_interval_to_reg(unsigned long interval)
 {
 	int avg, avg_bits;
 
+	/*
+	 * The maximum supported interval is 1,024 * (2 * 8.244ms) ~= 16.8s.
+	 * Clamp to 32 seconds before calculations to avoid overflows.
+	 */
+	interval = clamp_val(interval, 0, 32000);
+
 	avg = DIV_ROUND_CLOSEST(interval * 1000,
 				INA226_TOTAL_CONV_TIME_DEFAULT);
 	avg_bits = find_closest(avg, ina226_avg_tab,
@@ -301,8 +307,8 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
 		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
 		break;
 	case INA2XX_BUS_VOLTAGE:
-		val = (regval >> data->config->bus_voltage_shift)
-		  * data->config->bus_voltage_lsb;
+		val = (regval >> data->config->bus_voltage_shift) *
+		  data->config->bus_voltage_lsb;
 		val = DIV_ROUND_CLOSEST(val, 1000);
 		break;
 	case INA2XX_POWER:
@@ -370,19 +376,22 @@ static int ina226_reg_to_alert(struct ina2xx_data *data, u32 mask, u16 regval)
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, int val)
+static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, unsigned long val)
 {
 	switch (mask) {
 	case INA226_SHUNT_OVER_VOLTAGE_MASK:
 	case INA226_SHUNT_UNDER_VOLTAGE_MASK:
+		val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
 		val *= data->config->shunt_div;
-		return clamp_val(val, SHRT_MIN, SHRT_MAX);
+		return clamp_val(val, 0, SHRT_MAX);
 	case INA226_BUS_OVER_VOLTAGE_MASK:
 	case INA226_BUS_UNDER_VOLTAGE_MASK:
+		val = clamp_val(val, 0, 200000);
 		val = (val * 1000) << data->config->bus_voltage_shift;
 		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
-		return clamp_val(val, 0, SHRT_MAX);
+		return clamp_val(val, 0, USHRT_MAX);
 	case INA226_POWER_OVER_LIMIT_MASK:
+		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
 		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
 		return clamp_val(val, 0, USHRT_MAX);
 	default:
@@ -489,19 +498,17 @@ static ssize_t ina226_alarm_show(struct device *dev,
  * to shunt_voltage_lsb = 1 / shunt_div multiplied by 10^9 in order
  * to keep the scale.
  */
-static int ina2xx_set_shunt(struct ina2xx_data *data, long val)
+static int ina2xx_set_shunt(struct ina2xx_data *data, unsigned long val)
 {
 	unsigned int dividend = DIV_ROUND_CLOSEST(1000000000,
 						  data->config->shunt_div);
-	if (val <= 0 || val > dividend)
+	if (!val || val > dividend)
 		return -EINVAL;
 
-	mutex_lock(&data->config_lock);
 	data->rshunt = val;
 	data->current_lsb_uA = DIV_ROUND_CLOSEST(dividend, val);
 	data->power_lsb_uW = data->config->power_lsb_factor *
 			     data->current_lsb_uA;
-	mutex_unlock(&data->config_lock);
 
 	return 0;
 }
@@ -526,7 +533,9 @@ static ssize_t ina2xx_shunt_store(struct device *dev,
 	if (status < 0)
 		return status;
 
+	mutex_lock(&data->config_lock);
 	status = ina2xx_set_shunt(data, val);
+	mutex_unlock(&data->config_lock);
 	if (status < 0)
 		return status;
 	return count;
@@ -544,9 +553,6 @@ static ssize_t ina226_interval_store(struct device *dev,
 	if (status < 0)
 		return status;
 
-	if (val > INT_MAX || val == 0)
-		return -EINVAL;
-
 	status = regmap_update_bits(data->regmap, INA2XX_CONFIG,
 				    INA226_AVG_RD_MASK,
 				    ina226_interval_to_reg(val));
@@ -666,7 +672,9 @@ static int ina2xx_probe(struct i2c_client *client)
 	if (device_property_read_u32(dev, "shunt-resistor", &val) < 0)
 		val = INA2XX_RSHUNT_DEFAULT;
 
-	ina2xx_set_shunt(data, val);
+	ret = ina2xx_set_shunt(data, val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Invalid shunt resistor value\n");
 
 	data->regmap = devm_regmap_init_i2c(client, &ina2xx_regmap_config);
 	if (IS_ERR(data->regmap)) {
-- 
2.45.2

