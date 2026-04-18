Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7D72623
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 03:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776484113; cv=none; b=AYvmgGMTMtWt02Tt2l//wayosfp7em9CZ/IyExV2xdhXOakus9eLBTYQVO8jaAusCuT3YtbOzw5nozW7iiiFHN9FRDPjGlCliB/US+vzDtJgKXFoIunKRFKXyq3B2DlLQxA2b5LZ3IEn3lRGLxFXFLjZOZ5szqbts+kf0suzWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776484113; c=relaxed/simple;
	bh=jACSQHstZVFKbNTavRunskpjWXylElHwETO6kJX5INo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLBpj356Fhk7CPOyO6qIIW417h6fFHobPEXngkaA7RhQgKfGCyJ/+BEqzPHZ/CwFw4DoNFShkMLguFCqGaYpq//Em/c9OQvHZF/mo71BtSOIQWsjELhvGsJgtfANh98Q4G7QtuGZ1xW7CrYRLZN3Ez7AxmcE1F8qP4l/Z87yzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZx/umZ6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZx/umZ6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f8893bff3so627422b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 20:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776484110; x=1777088910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMyfv1bKqxfNWpqWMHaFl3fAcAdpQRPSSvO41ZTDbwY=;
        b=XZx/umZ6PatfCXfDlT5h5VzB2DBXxtYhe0hHKUFVYPDCowADlsgRaZWN6PPMiMsrzj
         BhNoxyGlDby2VpNby/4KRqPTa1QOMcWkIljX5knasTn53wZ3SwTlupCrKFfYiVRG/wJX
         do6pXO8U0RfvHP5DcfNRhjaWzQpu6yAXB2GnkvMNFiFfk1QSt9Ky56jPRePH9AgQb+8v
         xDlN4yAmvTwy86nYhnK6gxByKEObpOO5wQBjVfHFeTKzw84jBSRAueNFbVkPMRhU2RfN
         JWU6NweCLBtZtzeD09JllVL/zOsH57/GNQ4LnVJtffxCsWTixD559i644zrUnzxalhbS
         zBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776484110; x=1777088910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GMyfv1bKqxfNWpqWMHaFl3fAcAdpQRPSSvO41ZTDbwY=;
        b=LXmeu/cBD443NMLd37LxWZwqPH8JztLiu5QqSEJKipmuw2ryzksn0D0OWF37PzXpus
         lhC0gSJpwSajHOdV55szXBLmhjsdBnQ5TXdHYG2ELQeBuSZm0TJLSHLfHJpqcFk3Sh5A
         mi8fw4/SnCUl7eR6FBaLPRsOIw5r2PMpdKJRcPXZQS7FmeHaJhXWAi0vCX9QhOYIjCEW
         ozmsTc+J69gvLip1v0KFDGtY/PMkG/Rn+gLgIp2aCQoEYQ1hG5dMxnh+RBK+UO5uHudX
         GJut2YQNutSFcTFk40J5EbIkRMgrBk5PMgTYZ1w0ZxI/rUIIeuIVgmVUuxxKghqVToO9
         WPPQ==
X-Gm-Message-State: AOJu0YzeGEs1mZB4LBJzWslog31N6k2Khjd6i+JChxFHwxJC9s1xUkTr
	FsqapMYUCx6lUPI6Q8ES4Lm3RgkKLy3CeQSPvrA+DszAmgphjxRJEt5qzm8viA==
X-Gm-Gg: AeBDietc4XGU84CklDstIYI0BY5b1f0eTKL+xQ6aPq5Tv+qxpne/kUjmv8ErhAg0hA8
	21Y9hWaz4HnHkUPxaXhpkuoRFaDuFK4UGYuVnhhHY9FCh9uM+1RqqGWhu/5+lT4GCngsNahpB1y
	i8EGwQU7Lml+o9JXUJDrO2wesdtSGc0EH6ETZwwllgAUIMUkZ/08It4AbyHEgiRrAl0PJ1ucejg
	XrIC3+CXqdbyF323/hu/pYMc6EEy5mH4mFSRTEQhvNRbVjdP0vk7AtBD672W6VDhnkg5FllGpRZ
	owEYWOvXILlkGqbRmR93auza7YNMhYYI+QDFNo83ZlNuLz9WjkpcLn8PzL5yQn7HxnbaKBfFsIh
	7NWcunTgqIE03CxQDPTB9NKPmspcwXe5my62E+UvYHb5iDkDf6eUab9wYkkEDckWQcO5ezAmaZM
	iee3VUaYTgD1h38qskLFVs7qSSWfL6QguerqkAb4pW6VOixvc4OR7NQMOB6gnUpoUCcv5d1Ka+G
	g==
X-Received: by 2002:a05:6a00:17a1:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82f8c8888b4mr5551098b3a.16.1776484110480;
        Fri, 17 Apr 2026 20:48:30 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([27.4.62.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm3549074b3a.56.2026.04.17.20.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 20:48:30 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v3 2/3] hwmon: (ads7871) Convert to hwmon_device_register_with_info
Date: Sat, 18 Apr 2026 09:16:00 +0530
Message-ID: <20260418034601.90226-3-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418034601.90226-1-tabreztalks@gmail.com>
References: <20260418034601.90226-1-tabreztalks@gmail.com>
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
index 9b52aa496d522..851b70e9f6ba2 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -56,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <asm/unaligned.h>
@@ -67,6 +66,16 @@ struct ads7871_data {
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
@@ -91,19 +100,20 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
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
@@ -133,39 +143,34 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
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
@@ -200,10 +205,10 @@ static int ads7871_probe(struct spi_device *spi)
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

