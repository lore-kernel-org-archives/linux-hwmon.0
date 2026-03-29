Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE542C11F9
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769661; cv=none; b=KCp49lBft6gIM5aj0Ac2QQ66Ni/w5iWc7nI7ey9ZNh1F5qdAbkDZMencQiw0xUUqI5bGXDRuzHt5dWHOggJneC+rgFiZwMp3ODSkFQZDrQozl4SDuPqQV7hYlqzhFcWqnw+yn87OH9SSLkA7q6asxcevJLHOa5JuiJ4O+X2kNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769661; c=relaxed/simple;
	bh=hiDqV0twuT/G74MJLKzXSACKySBpHOK+Apd7HC/l+io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0vrWrNkj9ucNszrths7cgQjV+Vv2TK4P/XH0QTxP6CYlcnKX8+RYIvtQgFSDbhYHwqIrOf1GV7sAWlrs+/xsd9bLzA+KJX7UGSLUGZCUgLjwd+O5tkPuUCPW81VAOCBV0hebnSYA/9vljc43HK+o3thMFBzwkGmmt7ZkNwOwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOJkwnlr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOJkwnlr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2adff872068so14000295ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774769660; x=1775374460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEjCTvT/LzQBGGvXt9piDo0dTsdh2Y7tP7wZ7Pb4xyA=;
        b=rOJkwnlrPuD1ulfyquC7W0yPPD7TrBp4SrNsZQikyb9gbrnHspXeSZODRZBS0PLrVk
         bGAVt908GAIkac9rRX/8LpEQYqlXwkWW9aOoOHOkromD6RGBteqYeOHhfNwDKYLSte05
         iG4WDraFhjm2n0GLJjnctNSzMqXJemE1h+12yVT8FqUzlRk1FQRrwu9HzhVgPiFMehkK
         0iOiVBE2jr+Tf4WQyBhx1tq8YpzzCNPF+6YdlZvSmTUXTVr1gU0IWgaqVs4SS6QoTrvy
         Ha7XvhB9SSXq0WqjzS6wTycL5XrUh70vPvAHlGk1R4iC4MAj1371Pm+kpE+djJgu2BCq
         41OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774769660; x=1775374460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEjCTvT/LzQBGGvXt9piDo0dTsdh2Y7tP7wZ7Pb4xyA=;
        b=fgfaxOJjmysnhZuOVKaT8FEx36kAloz3JS8n2PEYQzOyLWVNMasqGilGIcXWlBfVY+
         uzeumD4ugMABRnJWlpfhCnbGrCBzOoRs7oNvh7vWeMU/5A/9Jl9Tpl3l2hD8+B7YwEl+
         pQkqZw/uC4kh5gwn12GK7ETwq/1aBzYGW8umDcIw7aUhzf3k+Hv9Ofs9h+ey5xnrQuJw
         XXd54P6PMfkpZhF8lY8AawFyaJVFrxJR+S1E/3IzPdU8z9TP+cEfcchMmN+PwjX7CujO
         CCVMByZ+yDes+IC2NjeObK0gTa7etKi1Fv5Oas5EnXmV3kmdQ61tQtGj/hwt2Q58zyX2
         83Vg==
X-Gm-Message-State: AOJu0Yw/sko9Sh4bRRIEF8jXvGusGEiPkoMEo1U4O3cFqXWtQbkG9WOe
	AKg+x4zeP06XpTVTmHJh1vPwlkv0Mhs5jviSejdNA69h59S/fk9+EB5H
X-Gm-Gg: ATEYQzwL5UcKlemDdwk+Hr1wBU8NqYWXGdqFK75zyhPAHNIn09JqsjZb9S4pTjlh3EP
	SN0Y3MnKby+8NFR648kpMhPqAoTg6bAIiMzqxxalqeFof1hcfSzm9gfeOMIbP22H86yLVkl+8LF
	kz3236tqRBRZjU1eW7YIOCnVUTfJTokV0VjtVydnGW78KpmcUOmN2g6eWrxGxEg+Zjnaej8JvYi
	7GHpxbCxdmvgPK9kKL0juvgkSesn94mjGlr8+q8LpGJkRzXJhO0J+DDIYYWXo8tVW3bQAYfWRvR
	66odJj/yhmZEMii1ciOha0xPxDNxNX4yTr6HxFdxc+gxeX2TnwgBBBGZoCeMYaxf3iS7UTVkrEK
	EsdRMNgJypReaCXh1TzBwHoLj7zwYdkJmmth3Iag1QR6iMByheYaZQnPtEdjj30iff8DuA/M7yd
	bnpJRcBrg5R0zbOvfBf2KZgh/QPRR1rqzBAGcLs4Qs/11Bdj8j98qBGioD3qtr3qSV7g==
X-Received: by 2002:a17:902:e809:b0:2b0:5cb4:d89d with SMTP id d9443c01a7336-2b0cdcb05c7mr84930995ad.29.1774769659622;
        Sun, 29 Mar 2026 00:34:19 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm42266995ad.35.2026.03.29.00.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:34:19 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v2 1/2] hwmon: (ads7871) Convert to hwmon_device_register_with_info
Date: Sun, 29 Mar 2026 13:03:51 +0530
Message-ID: <20260329073352.270451-2-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329073352.270451-1-tabreztalks@gmail.com>
References: <20260329073352.270451-1-tabreztalks@gmail.com>
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

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 76 ++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 9bfdf9e6bcd77..41a1e9bbd4050 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -56,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
 
@@ -65,10 +64,20 @@
 struct ads7871_data {
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
 
 static int ads7871_read_reg8(struct spi_device *spi, int reg)
 {
 	int ret;
+
 	reg = reg | INST_READ_BM;
 	ret = spi_w8r8(spi, reg);
 	return ret;
@@ -77,6 +86,7 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
 static int ads7871_read_reg16(struct spi_device *spi, int reg)
 {
 	int ret;
+
 	reg = reg | INST_READ_BM | INST_16BIT_BM;
 	ret = spi_w8r16(spi, reg);
 	return ret;
@@ -85,19 +95,20 @@ static int ads7871_read_reg16(struct spi_device *spi, int reg)
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
+	uint8_t mux_cnv;
 
-	channel = attr->index;
+	if (type != hwmon_in || attr != hwmon_in_input)
+		return -EOPNOTSUPP;
 	/*
 	 * TODO: add support for conversions
 	 * other than single ended with a gain of 1
@@ -127,39 +138,34 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
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
+		HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT,
+		HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT, HWMON_I_INPUT),
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
@@ -194,10 +200,10 @@ static int ads7871_probe(struct spi_device *spi)
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

