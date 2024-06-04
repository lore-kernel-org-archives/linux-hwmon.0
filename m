Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7FA1494CC
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Jun 2024 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505280; cv=none; b=XAh0vu+KXQ3ZFQswuloTwsGcgY7Im1KpLxmDZZ0pKlQTgHwhYCS3wXVjbZyRF7hOTM7lDY3cgzXNdnMFQdTWw50RzmKK7+6qEObIxA5wa7pQewOunTHA9FYqwzU01nafnlKOm82edin69UFJAu9t3gYJ+UZSCM4ZAAD79U6pasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505280; c=relaxed/simple;
	bh=AwleX+l7FGCN8qN3Naa55INypqXkCDZ4LAZhdosW5I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPhsuNaqmHWPP+U36q9I+WKfLbXkNmknNr+I5FSB/jIj8Jo5CTdsfWxOhPH5f3MnC+d8rH0JVt75zM+P6JN2T0/SqdwVm0k/6k+Q6hmvf16tuo/mrG/cq3rDAJYA3PP/8PNuEDkjdm6pdNj04yY943IYDF3SQpzwyRg9mK/aPLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=YW1+ZDHj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="YW1+ZDHj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso5637578f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Jun 2024 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1717505277; x=1718110077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVHqLqfptNVgFJaTEnWQguhDBARiHZG7CbdjloEfi34=;
        b=YW1+ZDHj8twbmNh8eRW6WlAQCvX8sX2tcU5Q4K0LMyIX1zn6RG6IhupeywfNytl2gm
         mEl6/gYkHrdDeHesVlxqYYoQK7XWtQrnxQOdQTmvZsNW3lMvLTQ78UB1MvowHE3Iv+4h
         FW2X8HHnk7MK0s6V6eyspGQQfzo1uG8iHL3Vop8S/eQsLwNdYcvLFZs2oGQhdz3pLyH5
         V4Yh+82Cz3Qi7CV/prVDDsmnSkWLHcwg9C2MdjJUQnKgseiKyT04P5i0BS+X+OVnzTmh
         c6wK3h29L2nR4G0abYBXxQFh6lOSZaGSTI5smeLIV3ElziMfUi8q1SFJrQbnY6pN9RKC
         YLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505277; x=1718110077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVHqLqfptNVgFJaTEnWQguhDBARiHZG7CbdjloEfi34=;
        b=RHBi0CEIJWtNLEkbnWmrIFsrTudSZoBfDNAU88W/0W1lAo4WzPCYhgLLWjeIOoimEJ
         UVx3vNCYWvZmIAO9OaT8Tt5idkXu3rrjae7L7qK+daXzf2nTXDNi6pizAEP/U+5hmAAz
         W4VcSzlBQvn1p9BPA8t/tEla6QrVpIAdnPzXBPkd1GrMSc98VtsQrTQi9fM53z9TK2nt
         qcNxIpnhY88UyTyDvZlTRNr8ELnUD3Or89urXgYFcMPCLy8hK7+0eBxN5D0FmmaQx3D3
         yJD0wNs0Y7t6hwNrRQ0iTiL7aaf2UWCYahpDk2JZvO1npQFN0theEVKhi8mUlEkOaEFp
         mixw==
X-Forwarded-Encrypted: i=1; AJvYcCX3SfQXfEfEtGqhiOqUhFC++4uP5X46Bq0RJx091AlUstQSUQoQq2VUVGvchz7Jd99M9DKczQfilHCSCeiEzHUKH8/J2M3KFSKelUM=
X-Gm-Message-State: AOJu0YwHNsF1TUxZY5Mev812SitYyVJuNEp9I37Azaq2UmqspcFTOfwc
	UMEtLZRn7De2Nx/HVI7s2XU4cLOLPOKU8hB+Xg+cbJfMMwRKUJNDIuvHFTn182A=
X-Google-Smtp-Source: AGHT+IHXwCNHqGIk7Qlj56bU8D4UGYFB++audwNykNGqZxyOvevugcC+IXxOXeHeYnkvJ8Jgon3c5w==
X-Received: by 2002:a5d:5350:0:b0:351:b56e:8bc3 with SMTP id ffacd0b85a97d-35e0f325baemr9953964f8f.53.1717505277157;
        Tue, 04 Jun 2024 05:47:57 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0e8fsm11488832f8f.2.2024.06.04.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:56 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] hwmon: (max6639) : Add hwmon attributes for fan and pwm
Date: Tue,  4 Jun 2024 18:17:40 +0530
Message-ID: <20240604124742.4093334-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604124742.4093334-1-naresh.solanki@9elements.com>
References: <20240604124742.4093334-1-naresh.solanki@9elements.com>
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
index e2a5210f9f95..6c7eaeeb2a80 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -235,6 +235,9 @@ static int max6639_read_fan(struct device *dev, u32 attr, int channel,
 			return res;
 		*fan_val = !!(val & BIT(1 - channel));
 		return 0;
+	case hwmon_fan_pulses:
+		*fan_val = data->ppr[channel];
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -246,6 +249,32 @@ static int max6639_set_ppr(struct max6639_data *data, int channel, u8 ppr)
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
@@ -270,6 +299,7 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
 	struct max6639_data *data = dev_get_drvdata(dev);
 	unsigned int val;
 	int res;
+	u8 i;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
@@ -281,6 +311,21 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
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
@@ -291,6 +336,7 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
 {
 	struct max6639_data *data = dev_get_drvdata(dev);
 	int err;
+	u8 i;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
@@ -301,6 +347,23 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
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
@@ -310,6 +373,7 @@ static umode_t max6639_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_freq:
 		return 0644;
 	default:
 		return 0;
@@ -415,6 +479,8 @@ static int max6639_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
 	switch (type) {
+	case hwmon_fan:
+		return max6639_write_fan(dev, attr, channel, val);
 	case hwmon_pwm:
 		return max6639_write_pwm(dev, attr, channel, val);
 	case hwmon_temp:
@@ -442,11 +508,11 @@ static umode_t max6639_is_visible(const void *data,
 
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

