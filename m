Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E13C5837
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236927; cv=none; b=P+iljGzfbLReMkjZxMzyBkdLRJ+0BsnRQ2uwU7ni2OZ9Dq+HdK3B2NGUD4E+ubCfT/bx7Ag4X1h2aK7/J/crkRhcu42/xSBzTXuSDT8QPmaexu5Mv74UXdggjfcrY5tVPqYcTztgihyRLFkUsvjD7g5TeRqXtUaleX6JUxQIVwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236927; c=relaxed/simple;
	bh=di/VH3YQcCw/7iLYEOx612efanY41Z9PtB5xD5Hj7tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5nm0eB4VF+lXVQz8s1T428ACEUEk5la3zSeqkomuF9AtnUVsLrVzJU4u9PpG8LV3+a9vcQ6d0NnkB2TOkw5AThSXaD5MSNgS2EoaRD/532iqXYFBepMiaYfFAhuUs27htVUqSgb8dxk54oM6ZLXZGpI7l0vNUOFyMbljXaCNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQcZ58ci; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQcZ58ci"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80cebd41372so68650577b3.3
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236925; x=1784841725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6NgVKU/MGFjVMwgvxbOq/84pStl4moKfaollvGnRng=;
        b=gQcZ58ciw22JN2mZ7wrjM0SEswiFuhYf2maRI2PNEtqSf7Mc/adrT0q1M+TzRhx5rk
         6vsb+pNFK1LQ4SPpUtYEeksJRZ0yZQ0zWvEyCO/T/rz1P6DjA/NV/hs1TYvmewWYVSM9
         iW5Dz/ZFXHjZL05xuzYadYT1b9xRNg1DsEdZr/dEBPFBiHlxUmsWM2afy/c3q1SfnghE
         Hce8GVyjDuia1l0vynQ8yESoeBaRQy7u3JHa1OwrjYR0gTOvPn4K7SpKhUjpz0njcRZy
         iRQoq5AOOtPwuXbBzTIl2glWnbMRps/zYj0bNyyGql0FcjQOBeo1twtZDuQSFo/a5PtU
         V0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236925; x=1784841725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6NgVKU/MGFjVMwgvxbOq/84pStl4moKfaollvGnRng=;
        b=TsRl6QXpSSnojX5QyvAAHhoCLnpuWMoZN9djQ51VDpH4hOb/CLXCvPPE7TX6AleYsf
         0XfpxmTCLipBoElJ5+xAhWwq8OIZtWrPzLildX8fLaBScrUj4xcqE4w4DnjhrFY+JAPn
         c8VUPNpCUl+6ugNIYRDQH5VDuRKnMCAcGJR2VUhQc7YMdq0IiMzH9zyUkgeQ5yumUe9J
         XpldBBeO4HybRFMX0bAO0MijPJdVOG7A/t1Zo3txCuyY9PeumOcyfduThlT/duP6cebF
         MElcztX52O14t6MXaXMUglo9ucjvGw1XaeIPWXmRt7Vz47XGoaqi5+l+obNmAfaEfVy6
         1w7g==
X-Gm-Message-State: AOJu0YwwUwwwMfjIj89Jy7WeW1dWpYJLPd8ddtiS/rM3kO2V8rjj+Xt5
	bkJzp8nTBQtxhW269wZFZpNo9Ubx944eILJQ3yX8kO7RJyVxXfOzjYr/
X-Gm-Gg: AfdE7cnF3d0ZcgDBuHIu2Cx8psuyyzIWVOXROtWliujjc/QJVjqFQwizX4hCU47d5vm
	il3Ha+9MSto6Ni3g2BXIXe3AnpvQM7b2ncHkoXJy/ZCz3WVVrUTAewHSlQTPgv3wL0lqjrh9bbs
	Q0HiUo13kMbUQzWp1AfuqpRarsA11ARzxNLEgDZmcCSXWPG+YRi62uZ8ZyaK/tk1NlgJ+Nu8ia4
	K2JOKIBT0hKsuEWHYB9pHrGFqbdBC0zQw21fYSGtPj6sW6mnsgw959iSyjQWCWdcTssEQGGRSvn
	I0ZU9r3zavEYpUSGOT9/Ec8dOFOaW+bIyrX1v6ew4eSEfWcC9pOtd8hmI497pnAsqtVyk77VpRE
	fj/VwGwPEke0k2Uz/szS+DJei6Ka3wGW2WaXwKpgLk3+IAz7jR3fNpiypUGIKesVMvgpd+tm/8a
	vKIIzoJbNulIJDs6rh2Q1kfiXklzQ=
X-Received: by 2002:a05:690c:610e:b0:80c:16ad:2f10 with SMTP id 00721157ae682-81ecfa39be6mr64792887b3.33.1784236925198;
        Thu, 16 Jul 2026 14:22:05 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:22:04 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 18:21:41 -0300
Subject: [PATCH 4/4] hwmon: (adt7470) Add thermal zone sensor support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Expose the ADT7470 external temperature sensors to the thermal framework
via Device Tree. The thermal callbacks use the driver's cached sensor data,
avoiding any I2C bus traffic during frequent polling by the thermal core.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index b865f4bd50f8..44fe310f0650 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -150,6 +150,11 @@ struct adt7470_cooling_device {
 	int pwm_index;
 };
 
+struct adt7470_thermal_sensor {
+	struct adt7470_data *data;
+	int id;
+};
+
 struct adt7470_data {
 	struct regmap		*regmap;
 	struct mutex		lock;
@@ -181,6 +186,7 @@ struct adt7470_data {
 	unsigned int		auto_update_interval;
 
 	struct adt7470_cooling_device cooling_devices[ADT7470_PWM_COUNT];
+	struct adt7470_thermal_sensor thermal_sensors[ADT7470_TEMP_COUNT];
 };
 
 /*
@@ -957,6 +963,47 @@ static int adt7470_register_cooling_devices(struct device *dev,
 	return 0;
 }
 
+static int adt7470_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct adt7470_thermal_sensor *sensor = thermal_zone_device_priv(tz);
+	struct adt7470_data *data = sensor->data;
+
+	mutex_lock(&data->lock);
+	*temp = 1000 * data->temp[sensor->id];
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops adt7470_thermal_ops = {
+	.get_temp = adt7470_get_temp,
+};
+
+static int adt7470_register_thermal_sensors(struct device *dev,
+					    struct adt7470_data *data)
+{
+	int i;
+
+	for (i = 0; i < ADT7470_TEMP_COUNT; i++) {
+		struct thermal_zone_device *tz;
+
+		data->thermal_sensors[i].data = data;
+		data->thermal_sensors[i].id = i;
+
+		tz = devm_thermal_of_zone_register(dev, i, &data->thermal_sensors[i],
+						   &adt7470_thermal_ops);
+		if (IS_ERR(tz)) {
+			if (PTR_ERR(tz) == -ENODEV)
+				continue;
+			return dev_warn_probe(dev, PTR_ERR(tz),
+					      "failed to register thermal zone %d\n",
+					      i);
+		}
+	}
+
+	return 0;
+}
+
 static ssize_t pwm_max_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
@@ -1401,6 +1448,10 @@ static int adt7470_probe(struct i2c_client *client)
 		err = adt7470_register_cooling_devices(dev, data);
 		if (err)
 			return err;
+
+		err = adt7470_register_thermal_sensors(dev, data);
+		if (err)
+			return err;
 	}
 
 	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",

-- 
2.55.0

