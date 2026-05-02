Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553F186A
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 02:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777687742; cv=none; b=Dzc0bhgdIZLp5MDcnozixjGKPosK+FHVtNspPEIJFt6SHL0Ggi3iDsWjeClPYERXT6PWmJtqCXWF4/Q6FWAYMCALtX27/EKUGuh3uSMpSv2IxQ+UNdhssUvMZBqmQrplSd9bl4PaRNl5KrPfeEvaHS0Kzc0c9yQcX7gkfPJ1+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777687742; c=relaxed/simple;
	bh=WW2rz5gdzVaBv4rLa9CAp5aUVBIaeArCTZgLhtHri3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLgfM/Bj1IP+Fq6uo24fXAXhtRdzGOLUCNpTSo0PfI8iY8StYCUN5MNNbi/K1r1SuOuBEUl8ssp35kNyCE0j49EqbBkZXAFFC7rTIEsotD5TOs259y+s7T1mUC68sMzJ9yQy1UkDwgtEdc2+OHtE4Npb9OeumWcRx4wzTsntBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjJFx3kK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjJFx3kK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1639828a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 19:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777687740; x=1778292540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7tIFYG7ybBVuM5lvo7m4EE1oTdl7/Nx/akc7N8Rrsc=;
        b=EjJFx3kKSkMbpcpPAZzesGTvI/2Ksbti0k5u+tiM2F0oXs4gwPTUu8nnqn2SfG5h1C
         DlEcPVl40ZvmtjIHAV1APzpRpl+7rg4Z7gB3QlJ5r0mpwtAQssdTYYUcJ85cTVyiDi5A
         GAwhgTVly3q0ERQbwPYRObhE7YC5RU4gJhhILVtcDW6LzHgE8ys17PQrDzss+VTbeTuJ
         5y4ps4lpYIejHc6hTWhNgWA7faY2GkKUXA13JeNJYTv6RBs1rdc7NTOxn1iVU9X5fTtN
         8+hG1Y1Y+LydCDpUEu7AKW0yVNsyb5/DGKrVoIiv1/t+fx9nQZHk1AoMU7FoLq8cpbDx
         z+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777687740; x=1778292540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7tIFYG7ybBVuM5lvo7m4EE1oTdl7/Nx/akc7N8Rrsc=;
        b=Rs4oa9pz/ogvaPmGecK0bSVX/N6kVaj45ofnymTyRjuTfpkP3oA5WBU4yeVq33LteB
         5dB+pPa0r6ljPnLmb8rIVuD+nrrLD68+gbqTWITzO81nDpKjZQ1zTnYHidUZuPW1NHaP
         ytCxGnlmvRPffKam5ti6HYYB9ufNbkj0OD7/42Gzf++ct2j1lCXr3MVAsi/SUHAnFuBw
         q+w3eIKrXk55b3Jo5BG/4wgtF5R5a3terUOE0FSvxwp4+3kAUNqg2OtbA+f9UXADsANO
         m5gVJ2AhdXcbguAKOFVQIzkG3XmUmNFM5B5MXH5aR3VZfX1GkTtE+M6GHD1lGXIZ3z4f
         QHtw==
X-Gm-Message-State: AOJu0Yz+XsVdbGXpx+U8BsvotMSceHQfsaLOMULyEjienzVDlBt+uTAm
	ls+o8KXphWTx3/S0QoSSn33FKnlhdR+XjI5uMQ9QFMuYtqQFeP4K5XExiEQa8A==
X-Gm-Gg: AeBDievHbjyN9CObeYran8F41XnHALvoJFH6LKTPZnZogHINaKNR91cPE5F8oPWPpwv
	AOUFROrLSyZmfdwxeWEKwX9FYpqXrJF7wtAQIXCYnfXWXiAsM8Omi21063PxvNep5YGT3CEiuq8
	hkv4RYJCpjgY3QqT+Iyjt48Rw5e9CcQkdeIRbm9ZyDoAFEFmpYynXJIB2oWi8F+tje+0zL3Y35I
	9WzMLjeDsE/cOct8GLlnV9mjPxyie5A4nJHOxnV7wqoIw7cufbRK5NCUEw1eRL90/4CPI8eojzX
	k7wyhQFCuieMzKpVSPm4+EiFiCTsS33xMpYNF0zVB3TabgOvtaUckYtnok5CyAzyzwkp8+G8hDG
	GoHeBUW2m+uG3kYnz8B2yiiLt3pcJ9oi21UhHuKNew793gV0LsUlZ/IWDfxNs7hP8elaZSdea8F
	ii0I7bDj4rL17QAtQA2JI+a9raFuO17QB58ZL8IYe2HWQeY9+XS/8rlVqz94u8Au1uml6YlnmLR
	KTbKA==
X-Received: by 2002:a17:90b:2b45:b0:35b:a418:698c with SMTP id 98e67ed59e1d1-3650cd988e4mr1558730a91.12.1777687739788;
        Fri, 01 May 2026 19:08:59 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae39e91sm34519135ad.56.2026.05.01.19.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 19:08:59 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	david.laight.linux@gmail.com,
	me@brighamcampbell.com,
	shuah@kernel.org,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v6 2/3] hwmon: (ads7871) Convert to hwmon_device_register_with_info
Date: Sat,  2 May 2026 07:38:43 +0530
Message-ID: <20260502020844.110038-3-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502020844.110038-1-tabreztalks@gmail.com>
References: <20260502020844.110038-1-tabreztalks@gmail.com>
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
index 52584bb77ffb7..8ffcc4c823a60 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -56,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
 
@@ -65,6 +64,16 @@ struct ads7871_data {
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
@@ -88,19 +97,20 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
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
@@ -130,39 +140,34 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
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
@@ -197,10 +202,10 @@ static int ads7871_probe(struct spi_device *spi)
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

