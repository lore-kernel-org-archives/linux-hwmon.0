Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888945A4FD
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Jun 2024 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410688; cv=none; b=AAv0ig5DHf4u9cnUzyHFZsb9x2WA0C/+jVSE6GfslBfFAxj3e7NHGl2ULK3AOeoV9gYm+pb2cOCyfhXgX71I6lirgQz4LCprXQVjhzR+Qa/XTsDieAF3fhHa2L74lPbZr6IDHzo8tUmagp8ipOwL6HUIw8iZOeuWW4buGkJRnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410688; c=relaxed/simple;
	bh=jschtwg1oUPywVWq3uuJVgwTsrIfn7Hnd/x/JMZnxxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4urSGhCEn5kDrEBWGc6VfCqpZjR/Rw/oK219CZoZuEz9DRgz/ROjxEel7CzMm+fnhpGAMikYeyzduL351jDQFX1p4bKOGK0EQiwAfbLwW3KOzvifZL//1EFyV6Lqi5nX9rTB+viKrEbiSScrQAKGOuSXaoIxwtiLbnahKX59Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Cr9Nt6Pe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Cr9Nt6Pe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42108856c33so24140845e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Jun 2024 03:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1717410684; x=1718015484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdKJy8/Q1hhiwzSia9kCnDlHx7ANWWXeJd2ZmaVjc7Q=;
        b=Cr9Nt6PeOIvwJN2KYHl/fKdQ/+xisRjr/enl6A71+9yf3192KWs6UpN0AU6QjAxxUv
         fPYHv+QQjs82TEg3/+ni2PoezXbBdQEGFhgRElNbNyMfYvY1QpfSPw2OnDHpjMuq7oYp
         27IZovI0Ok2n2ZOzGfHljwmdhjvATjjyLF4g7fWOY/vOvvl7Mp1j+Or5dhmmk+PyvrW8
         oZsVi2ogDojDBreFstGdfpt6e2UjtGaeLNN/tIBetRAVmgv2z/GEcK3q149pZu8l+bOW
         61c+OI2JVOiMkpZZ2ko1rCDC0i3Z32K6xZAjQe1Q8YFTIg1NwfyO+ZiW4NQ37l2LDweB
         AXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717410684; x=1718015484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdKJy8/Q1hhiwzSia9kCnDlHx7ANWWXeJd2ZmaVjc7Q=;
        b=NomHYJxD4PzeVYCg2nslFgPJVilCmqfXRcKs8hba+Jru9JEdo2lzy5XdfuceZHvuhH
         ZdM6AMWAvMSAx8yMwi1+j03JDFhlhZ6GOQhRx0rFBEp/Bwq7u82vWpSMPEyZn4KiCuXI
         /CFw+CIahwG+LgKaMa+XKrENXVqwmFLSPdpOBH4Hi+fLIbPmv4/73mmqMrwwvnBQ1lAk
         eLIe1sRwxrBNU1ta1u7min+B8uLDtozRM1s8xJAYS/0aR/uYjqkswziCKvydwOMSOLqk
         IZZ/7+waap6uer0cHlNay1B9BinzuMI03BuEsA0gO7oI6WdrdXOBP5ZnsDLrNKhlg5H1
         UA5w==
X-Forwarded-Encrypted: i=1; AJvYcCWJVsQGgozDDUdnwLgpENWhjmiWbMsaSLQBEyf9q/YpxbdEgpFDdMnjN/TE1EIUsLUk/cVcaoUguyFy8NLPq5a490THF59zpcZgu38=
X-Gm-Message-State: AOJu0YzPkU9YrfCVMr3FqnDuKQlwBis9gdRajG/qc0HVPSAOf2oM2FtY
	xCrAs2X3nFFb08mScIhbyuz3XETWf+LOPrXoWkT/2LP39tL8byI+5pewCNUwKNA=
X-Google-Smtp-Source: AGHT+IGj3jtcWp3TZCEN6P22PHIyTYpsnId9SpPI58C6BWA+HuWeruCqNwtCYr7o9BTbk3VSktdaIg==
X-Received: by 2002:a05:600c:1907:b0:421:20df:c6d7 with SMTP id 5b1f17b1804b1-4212dd3247fmr82903575e9.4.1717410684075;
        Mon, 03 Jun 2024 03:31:24 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213bfce44fsm40051505e9.16.2024.06.03.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:31:23 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (max6639) : Add hwmon attributes for fan and pwm
Date: Mon,  3 Jun 2024 16:01:10 +0530
Message-ID: <20240603103114.3263060-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240603103114.3263060-1-naresh.solanki@9elements.com>
References: <20240603103114.3263060-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add attribute for fan & pwm i.e.,
fanY_pulse
pwmY_freq

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/max6639.c | 74 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 7fa41442165e..ea412dd44f8b 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -234,6 +234,9 @@ static int max6639_read_fan(struct device *dev, u32 attr, int channel,
 			return res;
 		*fan_val = !!(val & BIT(1 - channel));
 		return 0;
+	case hwmon_fan_pulses:
+		*fan_val = data->ppr[channel];
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -245,6 +248,32 @@ static int max6639_set_ppr(struct max6639_data *data, int channel, u8 ppr)
 	return regmap_write(data->regmap, MAX6639_REG_FAN_PPR(channel), ppr-- << 6);
 }
 
+static int max6639_write_fan(struct device *dev, u32 attr, int channel,
+			     long val)
+{
+	struct max6639_data *data = dev_get_drvdata(dev);
+	int err;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (attr) {
+	case hwmon_fan_pulses:
+		if (val <= 0 || val > 5)
+			return -EINVAL;
+
+		/* Set Fan pulse per revolution */
+		err = max6639_set_ppr(data, channel, val);
+		if (err < 0)
+			return err;
+
+		data->ppr[channel] = val;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t max6639_fan_is_visible(const void *_data, u32 attr, int channel)
 {
 	struct max6639_data *data = (struct max6639_data *)_data;
@@ -268,6 +297,7 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
 {
 	struct max6639_data *data = dev_get_drvdata(dev);
 	unsigned int val, res;
+	u8 i;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
@@ -279,6 +309,21 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
 			return res;
 		*pwm_val = val * 255 / 120;
 		return 0;
+	case hwmon_pwm_freq:
+		res = regmap_read(data->regmap, MAX6639_REG_FAN_CONFIG3(channel), &val);
+		if (res < 0)
+			return res;
+		i = val & MAX6639_FAN_CONFIG3_FREQ_MASK;
+
+		res = regmap_read(data->regmap, MAX6639_REG_GCONFIG, &val);
+		if (res < 0)
+			return res;
+
+		if (val & MAX6639_GCONFIG_PWM_FREQ_HI)
+			i |= 0x4;
+		i &= 0x7;
+		*pwm_val = freq_table[i];
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -289,6 +334,7 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
 {
 	struct max6639_data *data = dev_get_drvdata(dev);
 	int err;
+	u8 i;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
@@ -299,6 +345,23 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
 		err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(channel),
 				   val * 120 / 255);
 		return err;
+	case hwmon_pwm_freq:
+		val = clamp_val(val, 0, 25000);
+
+		i = find_closest(val, freq_table, ARRAY_SIZE(freq_table));
+
+		err = regmap_update_bits(data->regmap, MAX6639_REG_FAN_CONFIG3(channel),
+					 MAX6639_FAN_CONFIG3_FREQ_MASK, i);
+		if (err < 0)
+			return err;
+
+		if (i >> 2)
+			err = regmap_set_bits(data->regmap, MAX6639_REG_GCONFIG,
+					      MAX6639_GCONFIG_PWM_FREQ_HI);
+		else
+			err = regmap_clear_bits(data->regmap, MAX6639_REG_GCONFIG,
+						MAX6639_GCONFIG_PWM_FREQ_HI);
+		return err;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -308,6 +371,7 @@ static umode_t max6639_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_freq:
 		return 0644;
 	default:
 		return 0;
@@ -413,6 +477,8 @@ static int max6639_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
 	switch (type) {
+	case hwmon_fan:
+		return max6639_write_fan(dev, attr, channel, val);
 	case hwmon_pwm:
 		return max6639_write_pwm(dev, attr, channel, val);
 	case hwmon_temp:
@@ -440,11 +506,11 @@ static umode_t max6639_is_visible(const void *data,
 
 static const struct hwmon_channel_info * const max6639_info[] = {
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT),
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_PULSES,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_PULSES),
 	HWMON_CHANNEL_INFO(pwm,
-			   HWMON_PWM_INPUT,
-			   HWMON_PWM_INPUT),
+			   HWMON_PWM_INPUT | HWMON_PWM_FREQ,
+			   HWMON_PWM_INPUT | HWMON_PWM_FREQ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_MAX | HWMON_T_MAX_ALARM |
 			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_EMERGENCY |
-- 
2.42.0

