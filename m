Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81706EACD
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979983; cv=none; b=DUexciBG1Klq79J8wgvH1Wk/Qq30nhb5uDroF0SUO8ytVm4e9W/8MJGiMnkWM4RwRO6w+lR/11pBorv7Db8oTjfNKFkkDU+fjGslGeB//VEbKqU+LU1lekBL6tLbS8HN/qFuSjbfn/ckNYKOsE1IytEcKex2MCJekP0l5LEOJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979983; c=relaxed/simple;
	bh=w1mBxgLZjv71fMmuvVfYgYsP5XEVzFK7SJhtxxNI5Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNvsF+RmsEZ1TaUCdKRoiRFpftukQzA/aAYxO6vPwilIgnPW0HpfsnuCU+BoXwe+aN510oA3qCH4a7n+7fIeRjnACMMyhF2mlDaCFMHkEf/M7z1KlxBr1uxAK+y21t/AuepoD31vHSCGK47AwOYNjSQWUI2gFbKmzMcCTTUpTrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LL+Q0CSN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LL+Q0CSN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd8c8b07fbso488189a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979980; x=1725584780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDZrSIS5dIMDxH+sUlYYCuzZ24vzT+MyOZAn/ypjScU=;
        b=LL+Q0CSN7EdnRsKwl0vkvk8PLybjm7m5qWxZP/WxPNzqmabULqFzb6EkLHav6aq9jj
         es94wi245qNy7v07sY3fiTgEEzabyPJiOaTCHir0p8mM9WeLreLrzwytVoCnNHhurmPd
         xqYLiVhpTZM/FWGpSlELY73SP5OEsKN9haOPi9FaB+eqUj1RjWT854HP0Lj8Xft/UgUd
         jCeYYQQt1NaVC9yFM60ZMTk0czanDrCzoseovMzHkF3Quvv7pcOAjyOMGDoKt1LE6Ezh
         fUCe6fDGqU13eNQllZDINgBM6syIPsF7vsdSCkt1xHPQb0Ok+6MTjV7gF5J5Guu7KX1w
         ox+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979980; x=1725584780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDZrSIS5dIMDxH+sUlYYCuzZ24vzT+MyOZAn/ypjScU=;
        b=lCet5B6MVshFOCvaHEvP6/aKipMhTAm10lJrUnezYerKo6PSNDWPDWyr26XU6sdog3
         TCrk9pmqweblewIFynjKGZBOQ01uTE9W1YmpnLWsJuMcwfc3lIrTqo5w746N+z7139Nl
         4i9T46+kSjVaFQ2pGms7JY8XSHtnjDDYKcp6ry/zhVDzIfs/4B0hDLIXG2jzf5G0lYID
         rMOH7yWZR7zE3+w+x590dLGLZelQCvPr3cs6V2CxUPTPrt1RvrYk8PrjcwYzVqg5x5Cw
         vEnIyL0fQ/J8GJKIISbe39aPN54nxhHF1ZGEqgcwkQhAfABGIYHINN+LzeB6o7jnCbll
         Ne5g==
X-Gm-Message-State: AOJu0YxA2rY0LTaUtaPcJJm/Sb6pn1ydoqnB7MIvYOB3WaWEOnfT4xzr
	Rdju3V9B+GomDoi/vaJDyM1A2Vsz3nZk3qr0CNNxnAJskqlKyqxnqf5U9A==
X-Google-Smtp-Source: AGHT+IFkHOu4cw+h0pfPqEcIZV/Hq9VdlcijWnMwxKl48OUWEGbILvXZY58ZP/Tq7DVQLJt+iD8A+g==
X-Received: by 2002:a05:6a20:ce43:b0:1cc:df9e:bc3a with SMTP id adf61e73a8af0-1cce104a95fmr4080054637.31.1724979980379;
        Thu, 29 Aug 2024 18:06:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155521dbsm17021635ad.258.2024.08.29.18.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 13/14] hwmon: (ina2xx) Add support for current limits
Date: Thu, 29 Aug 2024 18:05:53 -0700
Message-ID: <20240830010554.1462861-14-linux@roeck-us.net>
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

While the chips supported by this driver do not directly support current
limits, they do support setting shunt voltage limits. The shunt voltage
divided by the shunt resistor value is the current. On top of that,
calibration values are set such that in the shunt voltage register and
the current register report the same values. That means we can report and
configure current limits based on shunt voltage limits, and we can do so
with much better accuracy than by setting shunt voltage limits.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: New patch

 Documentation/hwmon/ina2xx.rst |  4 +++
 drivers/hwmon/ina2xx.c         | 61 ++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index 27d2e39bc8ac..7f1939b40f74 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -99,6 +99,10 @@ Sysfs entries for ina226, ina230 and ina231 only
 ------------------------------------------------
 
 ======================= ====================================================
+curr1_lcrit		Critical low current
+curr1_crit		Critical high current
+curr1_lcrit_alarm	Current critical low alarm
+curr1_crit_alarm	Current critical high alarm
 in0_lcrit		Critical low shunt voltage
 in0_crit		Critical high shunt voltage
 in0_lcrit_alarm		Shunt voltage critical low alarm
diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 1cd6fffb1495..10c8c475c634 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -306,7 +306,7 @@ static int ina2xx_read_init(struct device *dev, int reg, long *val)
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, unsigned long val)
+static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 {
 	switch (reg) {
 	case INA2XX_SHUNT_VOLTAGE:
@@ -322,6 +322,11 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, unsigned long
 		val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
 		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
 		return clamp_val(val, 0, USHRT_MAX);
+	case INA2XX_CURRENT:
+		val = clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
+		/* signed register, result in mA */
+		val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
+		return clamp_val(val, SHRT_MIN, SHRT_MAX);
 	default:
 		/* programmer goofed */
 		WARN_ON_ONCE(1);
@@ -473,9 +478,31 @@ static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
 
 static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
 {
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+
+	/*
+	 * While the chips supported by this driver do not directly support
+	 * current limits, they do support setting shunt voltage limits.
+	 * The shunt voltage divided by the shunt resistor value is the current.
+	 * On top of that, calibration values are set such that in the shunt
+	 * voltage register and the current register report the same values.
+	 * That means we can report and configure current limits based on shunt
+	 * voltage limits.
+	 */
 	switch (attr) {
 	case hwmon_curr_input:
 		return ina2xx_read_init(dev, INA2XX_CURRENT, val);
+	case hwmon_curr_lcrit:
+		return ina226_alert_limit_read(data, INA226_SHUNT_UNDER_VOLTAGE_MASK,
+					       INA2XX_CURRENT, val);
+	case hwmon_curr_crit:
+		return ina226_alert_limit_read(data, INA226_SHUNT_OVER_VOLTAGE_MASK,
+					       INA2XX_CURRENT, val);
+	case hwmon_curr_lcrit_alarm:
+		return ina226_alert_read(regmap, INA226_SHUNT_UNDER_VOLTAGE_MASK, val);
+	case hwmon_curr_crit_alarm:
+		return ina226_alert_read(regmap, INA226_SHUNT_OVER_VOLTAGE_MASK, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -547,6 +574,23 @@ static int ina2xx_power_write(struct device *dev, u32 attr, long val)
 	return 0;
 }
 
+static int ina2xx_curr_write(struct device *dev, u32 attr, long val)
+{
+	struct ina2xx_data *data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_curr_lcrit:
+		return ina226_alert_limit_write(data, INA226_SHUNT_UNDER_VOLTAGE_MASK,
+						INA2XX_CURRENT, val);
+	case hwmon_curr_crit:
+		return ina226_alert_limit_write(data, INA226_SHUNT_OVER_VOLTAGE_MASK,
+						INA2XX_CURRENT, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
 static int ina2xx_write(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long val)
 {
@@ -557,6 +601,8 @@ static int ina2xx_write(struct device *dev, enum hwmon_sensor_types type,
 		return ina2xx_in_write(dev, attr, channel, val);
 	case hwmon_power:
 		return ina2xx_power_write(dev, attr, val);
+	case hwmon_curr:
+		return ina2xx_curr_write(dev, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -591,6 +637,16 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 		switch (attr) {
 		case hwmon_curr_input:
 			return 0444;
+		case hwmon_curr_lcrit:
+		case hwmon_curr_crit:
+			if (chip == ina226)
+				return 0644;
+			break;
+		case hwmon_curr_lcrit_alarm:
+		case hwmon_curr_crit_alarm:
+			if (chip == ina226)
+				return 0444;
+			break;
 		default:
 			break;
 		}
@@ -636,7 +692,8 @@ static const struct hwmon_channel_info * const ina2xx_info[] = {
 			   HWMON_I_INPUT | HWMON_I_CRIT | HWMON_I_CRIT_ALARM |
 			   HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM
 			   ),
-	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM |
+			   HWMON_C_LCRIT | HWMON_C_LCRIT_ALARM),
 	HWMON_CHANNEL_INFO(power,
 			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
 	NULL
-- 
2.45.2

