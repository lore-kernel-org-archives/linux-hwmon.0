Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62410347C6
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123331; cv=none; b=IhRtR6k/92Lbn1J4aPdP6IxhiLrpNvHHbvcVCDzp6ofpqGY2+Be+H67w2GxdsazEpzdThI05uiZXUGZt+VSJfsO2nNopU4gq3eb8EJSsFevMllQbgA5mI4N8THM9r8XhEGFNvCBW3m/VCegMhl/VngGqnrcYiFswi6PGA2/HGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123331; c=relaxed/simple;
	bh=Egeu1GYJsEpW9wAp1TGQpnmJb0oqZTdcYkIHmKha2co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qn1NNwTu8mX3U3sjLrTcPdb61dmn/ywo5c77GJHT3amCgA+n/GggmKK22FiJMsF1e71laFKZVBl38bbWuSF/lcK2oGMk6aSeGN6I0+nEHUeHNVKfpsfDJ+HV729ApmWxwjo6KNgr5Fzy17OGVsowpI2SO2fpWP8XvlTmwcCD2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q29dFg2c; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q29dFg2c"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66899fe9077so3363085d50.1
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123329; x=1785728129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrgHIHjlwNBQh1Q5iYrITgE9vxJwhbCpTSZy1rOLeNA=;
        b=q29dFg2cUwQemUrJLQAcdLKrm1hS+eUAUvcKbColiWKrKpyDBZ2kANmzwd3N2VeS+C
         OwrPOQMdyl28/RL8dr37p1To+luG5QZsQL7oe0K1duDtegM7fM7pmbnWmeB737SSgZRg
         VyBvyQL82oW9nU9oNfo8drk35rB1tf4f8PJKDIyJOpOrKckc8DDK6g5qVCy3mTjSQNkZ
         uusbMcH2g9FoozH/9Kj1igLXSW9Sy+1fBmLBqbNR1YZUyco52Tfua+ZK+vqMsXakWyNF
         NooUz91TMM/9Atg4HK6lTBLbo6znn2ha57CRMdU6tmyrl2Mr/t7mLKjYtwBWWrPnDQq9
         3ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123329; x=1785728129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrgHIHjlwNBQh1Q5iYrITgE9vxJwhbCpTSZy1rOLeNA=;
        b=DpHxMRV/1der27XSIrzBBX6qPN/hH61QyY75vdwysuJOfniA583RUvsgNGAAunL1I/
         f4JMnyiwy3EjBDjL5p/rNsTUOTCIKqUwrWei+Agdl00ynMRCHYQpNLjKt4Iu30KiZ4BV
         5mp9oW0kdS7xSLV6BQmy9ESOt/Boj3LcW2ZvV/Eq7epG0iGDqr8LSqpgAvgSaJC+A8uH
         22lCbHRQSEwgMzwhDuXQOofWz16x+WGCuakdgMJ29sTIPWkBYQUcEXI3vx87FnTiuJ0C
         imi/CzAVLeQEjMWxuyCqz5JGSM1M3X/szmc6wmTZzbpRzKCKC7xMbjDRBomsUri7ovmj
         6pCQ==
X-Gm-Message-State: AOJu0YwZb9fUfQIm4kX5bfdLSWrkb10pWiphBwz0Eovn2Tu+AippgezB
	o4svSjur0LmBtNKmzeYXBW5rkvsjxDbyauOqy21sIrJDZLPsdalyV8r7
X-Gm-Gg: AR+sD135glN4aQgl/nock3fZ5zc9P7XjpC1RKXNvNs4fHSMAtMhn17aCXFo6d0+bKv6
	7BkulzFEf+yq10guOmxv8bhYyA1NiF0B9Q3s8iJ2EIgmeMe8TGrZfx5mhjBCBAm9TfVLEinogd1
	bEGQa7RzRbIAgs39BzPoO8uBl/9WmTDd2Vgb1wXsB2XhhutqDR/CneXOfxU33+VuuFQnjLJZWzP
	9wb5eN1r6ADWz2GItSIs+0DGpInu9NpL71VRzIuV+hEXg9mwOq9jQxo/uxXXOOe37wnyuswNmQB
	WspRJZYVhsHr7osZ8/hdubYlv4T5wFHDGAqB/6xS6n86zj0abjBzu7qy/5B76ntGxEeldA8imD/
	6U6S/ris0GTlAVLGlKlLId3zVaTbRlR+uu6h+w2thtIl3ESyVIFhHo9dRj6Mg9oMqex2X8H6M0m
	y9V5A7dorl9yjser3qiqVo+L5c5SmzilHKqPG0VDw=
X-Received: by 2002:a05:690e:d85:b0:667:f217:bf8b with SMTP id 956f58d0204a3-668c77ebee9mr2235414d50.0.1785123329472;
        Sun, 26 Jul 2026 20:35:29 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:35:28 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:34:43 -0300
Subject: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency
 value
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
X-Mailer: b4 0.15.2

adt7470_pwm_read() currently ignores failures returned by
pwm1_freq_get(). If the register read fails, the negative error code is
returned through *val while the function itself reports success,
potentially exposing a negative PWM frequency through sysfs.

Fix this by using the cached PWM frequency maintained by the driver,
eliminating the register access from the read path.

Apart from the corrected error propagation and using the cached value,
no functional change is intended.

Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index f1150f0fe217..405eda900650 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -167,6 +167,7 @@ struct adt7470_data {
 	u8			pwm_min[ADT7470_PWM_COUNT];
 	s8			pwm_tmin[ADT7470_PWM_COUNT];
 	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
+	u32			pwm_freq;
 
 	struct task_struct	*auto_update;
 	unsigned int		auto_update_interval;
@@ -741,7 +742,7 @@ static ssize_t force_pwm_max_store(struct device *dev,
 }
 
 /* These are the valid PWM frequencies to the nearest Hz */
-static const int adt7470_freq_map[] = {
+static const u32 adt7470_freq_map[] = {
 	11, 15, 22, 29, 35, 44, 59, 88, 1400, 22500
 };
 
@@ -781,7 +782,7 @@ static int adt7470_pwm_read(struct device *dev, u32 attr, int channel, long *val
 		*val = 1 + data->pwm_automatic[channel];
 		break;
 	case hwmon_pwm_freq:
-		*val = pwm1_freq_get(dev);
+		*val = data->pwm_freq;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -817,6 +818,10 @@ static int pwm1_freq_set(struct device *dev, long freq)
 	err = regmap_update_bits(data->regmap, ADT7470_REG_CFG_2,
 				 ADT7470_FREQ_MASK,
 				 index << ADT7470_FREQ_SHIFT);
+	if (err < 0)
+		goto out;
+
+	data->pwm_freq = adt7470_freq_map[index];
 out:
 	mutex_unlock(&data->lock);
 
@@ -1270,6 +1275,7 @@ static int adt7470_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct adt7470_data *data;
 	struct device *hwmon_dev;
+	int freq_val;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(struct adt7470_data), GFP_KERNEL);
@@ -1294,6 +1300,14 @@ static int adt7470_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
+	freq_val = pwm1_freq_get(dev);
+	if (freq_val <= 0) {
+		err = freq_val < 0 ? freq_val : -EINVAL;
+		return err;
+	}
+
+	data->pwm_freq = (u32)freq_val;
+
 	/* Register sysfs hooks */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &adt7470_chip_info,

-- 
2.55.0

