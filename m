Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AB7847B
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979973; cv=none; b=GLeIR0nVZZCo9pSgSl5Tdn07jj++y7nHZAvgBltzKXKWbt+RXh0XHcLfWUJIP24aE2yk8VKg6whRvsCXQuVszql5YpP3qHLja3F6ufpzFzHrir5YLnZgGMllTZaG3vW9U52XmuQCvWp+A//1Mv+Yw1n689ISen4HdW0I7w7hHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979973; c=relaxed/simple;
	bh=xh9gzvyxbF0epAFa0UB0dAApxXrZh74g+5iv3oVXUCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/7vZ/CU98Kz7I7akEq5eoE62pBSwzldDt7EKGUyB8VsNidFJyZZA1P66mq5oR96x12vxZU7+z+I4hbq0tN7bi52cwndzHO6Jsy0VaAXD6p03XPt3gZznlD4h+i7RYMn9J021kts3lBlYv7WzIjBzAdC5XZN7VD0BHyvqMSdYnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSVCfZLx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSVCfZLx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d3e46ba5bcso959207a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979970; x=1725584770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qi4qqwjrz0PIrO0kj9LgR51dcx4mhGmY7tZz4k/1tc=;
        b=jSVCfZLxkf3o+EaPSxfXrOwmedq6eThxRK3HmZjH6Kdbbbi0OLMkW46ufjpjrQgPDZ
         ahNWso8yHsyArX0qv3yC+MVGDuj67ERl7PNJ3zuoPDjIcmTT5e/rRbb5dDlbMkM9ypu0
         lm7r8cipkOOrbT0mWHJoZP4hPXEPpbds+1DADKSWKXFBkJcqzFweoQEF7G0qhz7xgvjV
         4adrThnwXk8ZkzWmqIwynSsw7VaBbn4dugX3zZvLSGtBZaIX2rSZISmvlmDCwsR61fFQ
         Cr9F9G4OxSQFqXFUdRYKufZpZvnZ7vDAjaT5QSAbRe2M5vF31QJ6aS70/dJTrPura79S
         KuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979970; x=1725584770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Qi4qqwjrz0PIrO0kj9LgR51dcx4mhGmY7tZz4k/1tc=;
        b=ZxHvXOJ44LrfqJSryLk30Sr3eyeYkBptJlva1HuVvO202qe982xiWXpA/Yx3WKaEqQ
         lVlMVwYFXBnuPHlRWCbqM0D3d5cy9pYsGs9ErjcdQFuQ3CWKw7Crw3iyIbwIjsgheCVj
         I8rl/Kpk7/3qU72ZXd9XNvNgBcLR1hBrmN/usOg8e8UR9x2WwUQtv11dtI7DnHJLmZs/
         iIhLUn/lz8qErelSBaOEbu2qgbgy2rl/u0LSap+3HIYDaEILLK84kkrhDc510MzC04G3
         JiuiOGU/+xqVfOZpfBCwHfs8Fuvxx3JUGPITBxWJZnNTr4cguMome5xGRXKRg7Ng/C9L
         Vjlw==
X-Gm-Message-State: AOJu0YzggPyh/P12wVkCU/haZsUed9xNpwwzkk/NwEyybahzjQTWd73A
	fIVkS4QbxPEgMPHn/iZwQ61vO6FwoGii938mckP4A+nMBkx2mt5QmdUaGw==
X-Google-Smtp-Source: AGHT+IEaCUVISEkXr2NrF+Va6S+sbfgpKqr65ShfMDiuCwke/36JRKIBM3LlqRlQPYQ2ry+BWDGDUg==
X-Received: by 2002:a17:90a:3983:b0:2c9:3370:56e3 with SMTP id 98e67ed59e1d1-2d856391ebbmr5088313a91.34.1724979970363;
        Thu, 29 Aug 2024 18:06:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445d5e91sm4979369a91.7.2024.08.29.18.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 07/14] hwmon: (ina2xx) Fix various overflow issues
Date: Thu, 29 Aug 2024 18:05:47 -0700
Message-ID: <20240830010554.1462861-8-linux@roeck-us.net>
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

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Dropped unrelated cosmetic change
    Added Reviewed-by: tag

 drivers/hwmon/ina2xx.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index db6432523e59..2aea461b8c6d 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -193,10 +193,16 @@ static int ina226_reg_to_interval(u16 config)
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
@@ -371,19 +377,22 @@ static int ina226_reg_to_alert(struct ina2xx_data *data, u32 mask, u16 regval)
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
@@ -490,19 +499,17 @@ static ssize_t ina226_alarm_show(struct device *dev,
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
@@ -527,7 +534,9 @@ static ssize_t ina2xx_shunt_store(struct device *dev,
 	if (status < 0)
 		return status;
 
+	mutex_lock(&data->config_lock);
 	status = ina2xx_set_shunt(data, val);
+	mutex_unlock(&data->config_lock);
 	if (status < 0)
 		return status;
 	return count;
@@ -545,9 +554,6 @@ static ssize_t ina226_interval_store(struct device *dev,
 	if (status < 0)
 		return status;
 
-	if (val > INT_MAX || val == 0)
-		return -EINVAL;
-
 	status = regmap_update_bits(data->regmap, INA2XX_CONFIG,
 				    INA226_AVG_RD_MASK,
 				    ina226_interval_to_reg(val));
@@ -667,7 +673,9 @@ static int ina2xx_probe(struct i2c_client *client)
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

