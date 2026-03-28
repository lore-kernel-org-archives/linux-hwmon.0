Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906872FA0C6
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774722078; cv=none; b=ugDDBlsJLADkTsnbL7BLOQ5/COmKKssXv63Iw4mle0ww+Sd+UTB36IHg0sQ9Nls7tVKBGw5Wt8sCAUiRlFJRQwAJZRpTMvZCgh/jeho6P8O5QNTLDNvEemR1LHL0ZsZVoOVcaJfBWZ6yau8xgfcl+DqmzIVi14kj80u5I/hkeQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774722078; c=relaxed/simple;
	bh=8kmUTSXCnQpDk2iRzyppv3Dhj89vKfY2CvUcHfNXYoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDc1zBGAcZhylhkKTQVFC6hgJ1AzlmYzmhQEsXg1LjcYIWAqaj0TMtmcLRrfgQHzpXWqZ7KRAAEVHVt0BtNgyp01tswwLpETbiEWWulaSFRto+pFAWmOiXejqgo54qt8oyVU8AuGrQshXc+b1AQsN+zF8Z5shNvLy89a7BH/iM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgBxynyw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgBxynyw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0abdde280so31464855ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774722077; x=1775326877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/44zWbQ4JkV8yMKsOlxZMaFhTbPmOsSLVbdVyq/40m4=;
        b=XgBxynywGzqsVGfwaKuAoRfFD+gbllaJoTwiZTDKrAuQF2fTF/oNu2jyPNpHX8dr+U
         Jek6mgPrf58YnRPzJD9e4EIcA43AeDE9TrFXE88WIefWC+InTVJXskPrBC5nOiIlUsXQ
         /7bQ1QaPVii6WJXLL4O0L0+63XChrpP5hUVHWOT2nz/W6232Hz1aGZp3RHNF5cZ1gilb
         H6HnMEV/nqVC0xECqTS8wlloqsV2uXAF4ssRF2i/9QBPVFitX893Lc/IwzvZe7X3uLG2
         65TXO70Zhn7dJycf5GmN6YdBEO78TNtK2cOh5++vr2jHnTZ0LAr4lEfWNFMOkE7iAE7S
         ReVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774722077; x=1775326877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/44zWbQ4JkV8yMKsOlxZMaFhTbPmOsSLVbdVyq/40m4=;
        b=NWSyECng0updDsz4mr7ryC0tGDVnlJouLl2Qt7TBspPKWl6UrxGy34r4n02rEV9Xg1
         zAsxL2J0vycmOLALRXzpPh7V4ZigRJYtyip2GYhcCMlvZ5hzqjBE1RxRs3lGGTz83NQv
         rZ9J8+7D+Agguap6E/Wk7dQzre+m71dXwIXBFNMar7Bf1lPWUdvTuUiu7Uyl1w2W5PIP
         cu3MGRtVfy33Yn87vOxp5ZnZL7e/NGeFIGMWPaWKxkEzMv/IDFsU8KR8c0pEWaUawrBV
         XkrIpVply9tiGKiEEpNiIjvzNSYgUXL2nxipcnTYvFOWkHrsk7It6n+p1fCj/+HZ+3ic
         5kJw==
X-Gm-Message-State: AOJu0YwgRYJ5PlsSO0sEhKih77jEE6Yh2iw0mkXYSbbRFNZ8tnsZUkLr
	dOwN/seRJnmX5cjsD5UuqCdO+tQWSA8rGyvlTN1jewZRIRNkIaeJo3pY
X-Gm-Gg: ATEYQzzq7gmgC/YzRMR5dbQULOGfk9cvJY8DnwFdVMbTtA0Q6zv9DdXachAljE7ypT3
	0s/LYqzqvy8QzuyaQAEEgJ56Km0bXoZ45H9VtKViIOp3noFAJqX3pHkISNKXg1dGdO+LK4CcK7P
	a8CAqhNK+h31K1xe+6osgqa/JB3MnOjg1PherBHYxOdzVndzEDoCjT4Gf6DDx9aDJBkg4sidila
	C+ylKtGXAy3x4wEnJAXRhzu867qKeOyN+RSLT8Jw3GCiXYxUBrfh12OJ6nIQkN7ymyvH7kbFf3c
	UalDVozNxs40qMuHsQ3OLaNOJVLGEQtD9w5V5tqUUz8NUZ1w+GaR6I43WuSA8fp9HTXqUAd8AFJ
	FehZCVQQhxT6W7Vmx7MTtQEm/HKhv+wKiJ0tts7KEiJyW3GudWZ6RRYmQqXOScyN7gBV9fJcyKv
	gTpLH+b6lksMEvUSODIxAhsqiUUnSuW5nVAcTDqC3hKQv1Y87UkKcyYVFdnuLmO50RVw==
X-Received: by 2002:a17:902:fc85:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b0cdcbb4e2mr69187665ad.27.1774722076841;
        Sat, 28 Mar 2026 11:21:16 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427660c7sm28451665ad.44.2026.03.28.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:21:16 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH 2/2] hwmon: (ads7871) Convert to hwmon_device_register_with_info
Date: Sat, 28 Mar 2026 23:50:15 +0530
Message-ID: <20260328182015.220298-3-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328182015.220298-1-tabreztalks@gmail.com>
References: <20260328182015.220298-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the driver to use the modern hwmon_device_register_with_info()
API. This removes the need for manual sysfs attribute creation and
simplifies the driver by utilizing the hwmon core's standard callbacks.

Remove the SENSOR_DEVICE_ATTR_RO macros and the attribute group arrays.
Replace the voltage_show() function with an ads7871_read() callback
and define the supported channels via hwmon_channel_info.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 71 +++++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 02e69bef2ca12..8e93e58e9298c 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -56,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
@@ -67,6 +66,15 @@ struct ads7871_data {
 	struct spi_device *spi;
 	struct mutex lock;
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
@@ -90,16 +98,16 @@ static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)
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
 
 	mutex_lock(&pdata->lock);
 	/*
@@ -131,14 +139,14 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	}
 
 	if (mux_cnv == 0) {
-		val = ads7871_read_reg16(spi, REG_LS_BYTE);
-		if (val < 0) {
-			ret = val;
+		raw_val = ads7871_read_reg16(spi, REG_LS_BYTE);
+		if (raw_val < 0) {
+			ret = raw_val;
 			goto out_unlock;
 		}
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
-		val = ((val >> 2) * 25000) / 8192;
-		ret = sysfs_emit(buf, "%d\n", val);
+		*val = ((raw_val >> 2) * 25000) / 8192;
+		ret = 0;
 		goto out_unlock;
 	}
 
@@ -148,28 +156,22 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	return ret;
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
@@ -205,9 +207,10 @@ static int ads7871_probe(struct spi_device *spi)
 
 	pdata->spi = spi;
 	mutex_init(&pdata->lock);
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

