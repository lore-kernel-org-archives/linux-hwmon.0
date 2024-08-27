Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2E54648
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772905; cv=none; b=aekBQUT/KqJErAQC41jErElHYc2XHpGsshk0dUvbzV0HR/6LgH/sJPjNz5uefv8UG/nVwPi1oSpmeA2D1ua/8aGjUAOYgJm9ysGL8t0/yHyfKy9kq/hEmQl+KA40v1azhTSkw+ODMKrCaTWGW7isjKyt2DB1gB5UNNJfOMRoDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772905; c=relaxed/simple;
	bh=zU544sauCmhAAftfMdopd1iefSmzWevMkMaQdkj2kCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYKLSrMW+nZwLdqacdPtzqUp5KRStFMz83W+miByNucXjL0w3JZXvOOCv0oh36h5kLgMLJ9lQeFSWbsrdTxgsHGCedGiaXr7L24XtAj5sszQwsE+tJ6wz/1t1uaH3DSeJWqAUxZnBPZtqXqBfMxDv/ah3JR1TY/qU7SpfsiExrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yinp1quH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yinp1quH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20231aa8908so44790885ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772903; x=1725377703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1usEK6oiQZgHdGaVmRFQBRMs/Z0qT5x3Rckeu5qgs0=;
        b=Yinp1quHCZ7zg50UyrG33mAKuhFEGcbFhpp7eXHbUc7pCCDcfm0mSDfqo+8K5+GTPI
         B9PjpzEH9EFAwHy7e5BMkIMvfSEoIz8mVDy/hTppN1W1MqUFSXzv1PTEgK2X7qCZZ4Uq
         ku8cMEH6z+Y6zvPQBQ+nCqmRoWD9UbuiBO/dqb0wqae+3+KMli/Mj5sb+O8MmkMdfdKe
         QYMTGf+nLPSw75DjwBQKM2S4zLbaXQJSRAb3PCtPcgQfPoutIrFRpDloA5d5eUs6/Dg0
         I5KlYvEs2cQij1l/A8hSaeOJqUZDOoRWtEHW6FCswJS0EsoVMZ0FeYghLftIliP2PAYp
         zVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772903; x=1725377703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1usEK6oiQZgHdGaVmRFQBRMs/Z0qT5x3Rckeu5qgs0=;
        b=Tr9/kR8SurmDKTPHIXBZmfNe3ljM3Jw1fEaChm0XfB6Grf63fI8oxw5+CgUGDvQWKV
         He3bS3wkLjjxeDT5JRziP731LHIcDKdRAUp1/fg/2yTymy59yjg3hnYy6GCFYKxAy/KI
         8pGPKWbuNG7m5PGuuc/Bey2bDATB98uquLQhID9j+m13qmVdPXrhSw8E3/NEMqzx4xzG
         oJLbwJ8U228Z87niGeHstn73Vr2YXPUHWK7Vna7wqNxM3dAFZ1AocNX4ZzE5YphBirlS
         M2bjd6VFF97WVLWdEaCO5LzpMoH0ekuD/VhmVK77d53uJyfh5gijvrCMi4ezRk3GJ0GX
         9j7Q==
X-Gm-Message-State: AOJu0YxAHZ9eHzWJaxdGrn3aymDPVR3apASm14JjAZUWfANNMvG4QMA4
	SNWW+npiCfb1qv5R/Ad33qzn044gyLOlX/R26zm1n96Fn4KETdKW2vKVWw==
X-Google-Smtp-Source: AGHT+IF90ViNmye3eoYJjbpYtc78H0GxMqXHepXmXf6W3J8ScXmlcUmToejbivDzSvIQ0Dafcx38AA==
X-Received: by 2002:a17:903:120d:b0:201:f853:3e73 with SMTP id d9443c01a7336-204df029dfcmr41766765ad.11.1724772902527;
        Tue, 27 Aug 2024 08:35:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859f02e0sm84444035ad.250.2024.08.27.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/11] hwmon: (ina2xx) Replace platform data with device properties
Date: Tue, 27 Aug 2024 08:34:46 -0700
Message-ID: <20240827153455.1344529-3-linux@roeck-us.net>
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

There are no in-tree users of ina2xx platform data. Drop it and support
device properties instead as alternative if it should ever be needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index a6a619a85eb6..897657f8d685 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -30,13 +30,11 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/util_macros.h>
 
-#include <linux/platform_data/ina2xx.h>
-
 /* common register definitions */
 #define INA2XX_CONFIG			0x00
 #define INA2XX_SHUNT_VOLTAGE		0x01 /* readonly */
@@ -643,14 +641,8 @@ static int ina2xx_probe(struct i2c_client *client)
 	data->config = &ina2xx_config[chip];
 	mutex_init(&data->config_lock);
 
-	if (of_property_read_u32(dev->of_node, "shunt-resistor", &val) < 0) {
-		struct ina2xx_platform_data *pdata = dev_get_platdata(dev);
-
-		if (pdata)
-			val = pdata->shunt_uohms;
-		else
-			val = INA2XX_RSHUNT_DEFAULT;
-	}
+	if (device_property_read_u32(dev, "shunt-resistor", &val) < 0)
+		val = INA2XX_RSHUNT_DEFAULT;
 
 	ina2xx_set_shunt(data, val);
 
@@ -667,7 +659,7 @@ static int ina2xx_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
 
 	if (chip == ina226) {
-		if (of_property_read_bool(dev->of_node, "ti,alert-polarity-active-high")) {
+		if (device_property_read_bool(dev, "ti,alert-polarity-active-high")) {
 			ret = ina2xx_set_alert_polarity(data,
 							INA226_ALERT_POL_HIGH);
 			if (ret < 0) {
-- 
2.45.2

