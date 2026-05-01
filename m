Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406643064A9
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 02:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777602947; cv=none; b=SZjBKAWC7ZSdI1Ymmr/xAUjuvcuTO7tinOllG8sEvn77A32/phdA78b/VzAye5qCk+9lTvQp/OuGA0yzp7iFXtXs5KOan1hSO7h3QfBMCK4Qm+vg1AZFt+9pRAuNQS7ZlzhjcTNgyvLYnYNecScSja+i0kln2ElA1fAUcFJ6Fmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777602947; c=relaxed/simple;
	bh=9AD+sWVcHYNPoIFmmk3/5rOSx+pg8pD2UCVgRe/R8aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yar8q40SuL6Wm57i6x7+Y/G4HyYVJQ2V0w9Gxbmc5njH9xFAVerVDyj15FvBGd6bZnhEg0tDJP7oJTQb/zgomnUPgXD7YWR2G5RyV1gepJHX+9ttzu4OeTwMZKUtzxtA6o1XbfRiBR+seQ2Oo5NMYAsm5uoi3L83AdaWNWxZ9eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds91pBir; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds91pBir"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b4583f0a1aso9975265ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 19:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777602946; x=1778207746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ysAHD8xZwiZRKow0zKqhNf3kHU5xNvNRM3EOuIQkgs=;
        b=Ds91pBir/odF9e1+IoTbtgLnFQrdEyjo4C6doexHQgg3emmWsZnv9RHjErtJzQTmtO
         sV4b1WwtUq6BpHDFXr2PmelP8/cF0Eqlh2L5BYTfExxPKgSBfaI5gIYLB61QGMBTo30b
         hQWTEqUp+SHX5Fs9llG5Q2oau7SKGBrKQN2Syi27wGO8R/t08Qwye2sWUjAjk5mhaVdz
         UQdFeYnXzBVQnSx7UwowVikZ7muAQWNFqrwoZWtYHEXipVHipxdVt1YB27oPqgEJlCG3
         eQWm1biPAUvNWoNlWx8FRYv9H6NIvzatHAm+O0cDn+Rjg7JUxSAIIAabPa1c5QX16reZ
         PwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777602946; x=1778207746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ysAHD8xZwiZRKow0zKqhNf3kHU5xNvNRM3EOuIQkgs=;
        b=DO7epx+g4PaI9xZlz8XR7qaJI8YwVWuo8S05aw4mivDxpkp299oK6y0dWuTR4/91Dn
         1iU8RnLJQYrynx6v8YIGZduTQvgeRj9ZFPtmZAbR4bW3TqMLmRreLVB10tgHeYkP2bIv
         5rq07lU+CUW2Car6Bn5QupVuvlSQClu6xWtvP0wF6ztHbrjthh+iX++BhTCaLOS9rtGY
         8E5iVNAx7LRA+SXuvvWvUQ1CwfGqyjm0KBUWpPfBndyvw+tQdfn1Pmw4rTy3F4/lPXEj
         n5cms+0ulAfwUfD50/aeIAMhg+fD5HCLut9VAeJ2LV6K/EztBlOklu2nFvv/DeznPPXd
         mwcA==
X-Gm-Message-State: AOJu0Yz6VXhfOZs4+NbosGPaA5MZtva/L0EaG6UFqhcQObENCREPqWyx
	mbgSUvSX8qruIUXuWOI7S+nctKiUMEgadBbkpwAnuMPm2WVDdwiL8HzY
X-Gm-Gg: AeBDiet/NmaTJw12P2KWPhYGOgYr0YPqyL1GyfU2hptydwvUFiAWSevCeWHppKWW0Iw
	e+Jtnqek9tYAKk/18FHhkc2tEPJyBD2K/Cpn5X+vivenDus3EHM1ugh2szPOu3mQuOYahP0kGCy
	PncVEbrMsI/bKal1d436ZWST//K1be1Z8Jx9Ywy+u7P7PnBuhJvYiQPGPghOvGFC3Tu01TxyK2Z
	kqow9QMPmWyZx1uz6K5l4Re0xFpXBokH49Z7xoCrrWeJxTwXjn+OqgjoN/9Da53s6iqpzcGcYnK
	/HaTO5dY5RgZ/wlw7oi8wso0WmoW9zYsbJYY5g8hpKlOpbS9adrHC33A9IS1Cb/bvWBmf1dqFsc
	FXxDIpduXu35iwBkfQDtRpcVxs38LaET1HsauMUCVXcpB+CWtlo14370K4Z34lMX76Fh1iT1vEe
	CWBgXVMT2AGVVoXlOM/Elwgr/TKo8t3I7y8SEShdXF29lRkcYYmW22EJzvRe0rN2GTT+Eho6zMl
	yysRA==
X-Received: by 2002:a17:903:8cc:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b9d3bab7bamr9899725ad.8.1777602945589;
        Thu, 30 Apr 2026 19:35:45 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e791sm9341385ad.7.2026.04.30.19.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 19:35:45 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v5 2/3] hwmon: (ads7871) Convert to hwmon_device_register_with_info
Date: Fri,  1 May 2026 08:05:29 +0530
Message-ID: <20260501023530.31160-3-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501023530.31160-1-tabreztalks@gmail.com>
References: <20260501023530.31160-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ads7871 driver from the legacy hwmon_device_register() to the
modern hwmon_device_register_with_info() API. This migration simplifies
the driver by using the structured hwmon_channel_info approach and
prepares the codebase for the transition to a shared DMA-safe buffer.
While at it, fix checkpatch violations.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 75 ++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index d77eff430935b..75485a2c16b0b 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -56,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/unaligned.h>
@@ -66,6 +65,16 @@ struct ads7871_data {
 	struct spi_device *spi;
 };
 
+static umode_t ads7871_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	if (type == hwmon_in && attr == hwmon_in_input)
+		return 0444;
+
+	return 0;
+}
+
 static int ads7871_read_reg8(struct spi_device *spi, int reg)
 {
 	int ret;
@@ -93,19 +102,20 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
 static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
 {
 	u8 tmp[2] = {reg, val};
+
 	return spi_write(spi, tmp, sizeof(tmp));
 }
 
-static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
-			    char *buf)
+static int ads7871_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
 {
 	struct ads7871_data *pdata = dev_get_drvdata(dev);
 	struct spi_device *spi = pdata->spi;
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	int ret, val, i = 0;
-	uint8_t channel, mux_cnv;
+	int ret, raw_val, i = 0;
+	u8 mux_cnv;
 
-	channel = attr->index;
+	if (type != hwmon_in || attr != hwmon_in_input)
+		return -EOPNOTSUPP;
 	/*
 	 * TODO: add support for conversions
 	 * other than single ended with a gain of 1
@@ -135,39 +145,34 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	}
 
 	if (mux_cnv == 0) {
-		val = ads7871_read_reg16(spi, REG_LS_BYTE);
-		if (val < 0)
-			return val;
+		raw_val = ads7871_read_reg16(spi, REG_LS_BYTE);
+		if (raw_val < 0)
+			return raw_val;
+
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
-		val = ((val >> 2) * 25000) / 8192;
-		return sysfs_emit(buf, "%d\n", val);
+		*val = ((raw_val >> 2) * 25000) / 8192;
+		return 0;
 	}
 
 	return -ETIMEDOUT;
 }
 
-static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
-static SENSOR_DEVICE_ATTR_RO(in1_input, voltage, 1);
-static SENSOR_DEVICE_ATTR_RO(in2_input, voltage, 2);
-static SENSOR_DEVICE_ATTR_RO(in3_input, voltage, 3);
-static SENSOR_DEVICE_ATTR_RO(in4_input, voltage, 4);
-static SENSOR_DEVICE_ATTR_RO(in5_input, voltage, 5);
-static SENSOR_DEVICE_ATTR_RO(in6_input, voltage, 6);
-static SENSOR_DEVICE_ATTR_RO(in7_input, voltage, 7);
-
-static struct attribute *ads7871_attrs[] = {
-	&sensor_dev_attr_in0_input.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in7_input.dev_attr.attr,
+static const struct hwmon_channel_info * const ads7871_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT,
+			   HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT),
 	NULL
 };
 
-ATTRIBUTE_GROUPS(ads7871);
+static const struct hwmon_ops ads7871_hwmon_ops = {
+	.is_visible = ads7871_is_visible,
+	.read = ads7871_read,
+};
+
+static const struct hwmon_chip_info ads7871_chip_info = {
+	.ops = &ads7871_hwmon_ops,
+	.info = ads7871_info,
+};
 
 static int ads7871_probe(struct spi_device *spi)
 {
@@ -202,10 +207,10 @@ static int ads7871_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	pdata->spi = spi;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, spi->modalias,
-							   pdata,
-							   ads7871_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, spi->modalias,
+							 pdata,
+							 &ads7871_chip_info,
+							 NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-- 
2.43.0

