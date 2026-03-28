Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61412FA0C6
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774722075; cv=none; b=PF3h96/NBfFld5wTWj28N95RPwN7B7xvopgKJE+5M3uUZmNARRWU7i9iNjr7d64ENw6Pi2Wt63Bp9OuQuLIuJr9W8b0dWiQSNICMaiHu5TcnKcn0iRMNijW1EFlLMfrZ4cUR56bpxPnoBbriHo6N9mBjACxqk9oR92wZ2+YbErI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774722075; c=relaxed/simple;
	bh=0pbOL/dGHERe1EfSvbVNssanpwxAN38tdpdbr/Jaxj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTy/LeYnh23EPsRciZx6QqK+LENvsfBHcKbc4fYS4FInE1k4RtGzoNvwT8kbOv9XCeG56ps0Dls2vwYJbmbZFoyBhDboiZI5FDROuY2Wu0/+Igc5RRwAIVXTvLiS5tAXahe/4a2/yY04vAYsvSscOd1t2a7heLXwMV2fhwX8oF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q140Y/7K; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q140Y/7K"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b0abdde280so31464635ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774722074; x=1775326874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9KE3Yo35HcOp4QopaJDXVc4B2FMTqxqxd65+MOhm+I=;
        b=q140Y/7Kkp9tmO94vZ71RCDyQPT7Qkwbu8LCTXyrYy/TnsxY4YWN5w+5YObT0DCdQ9
         0jIq2X4Ihf9atMVRlOLWpai4tQ/9K+EGxVvpxZOWjQvVkM55nryri7q89sfwwyN9RcKg
         dpkfwPhMe7hq2yj4OnT96age08ErfMSrpZo9+iOKK/ogoaLmjHVrYImGZI07lQbLJRo3
         E4gnofcsww79ws9SH0dJH24TOI7ijD7VSs1aTAlpP2CNqwaHEpHveDERr8l75xs3HSIc
         u3+v3MlLXn6QtLGUsvHssAGGzn/hOv4c/OXk7VWFOcfWQun8/jkv8bbqKmpNCGIKlSUN
         PUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774722074; x=1775326874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9KE3Yo35HcOp4QopaJDXVc4B2FMTqxqxd65+MOhm+I=;
        b=r+XQuDa5lTESd6Ei62X5CPFxPq5ScEDhBDi5/ph5ADXqirkH2V4tIIuzQ8dy0SMF55
         IB+nKSDHGC4mCyPbxlO7bIqIsmEumuQ6Pt+rVXt+p11ZrWmzLs3m1Hbf7GdyvTKaQKRm
         TZgtl7Xxi9m2uxwUvkvyfpKmhyrZX2WIBRtRiWuN1WUpbTPOmXk4G8yLhdhCzLsadGDy
         tDzjdDL5elGxNBDLZTGvXBSJIlidZce2ceVxbbqKkg8zy74bhNIVpTaaOHv5XJZwr038
         CYkpsGbVgCeL6ZQW8gcuJfbjDJc9JCNZ5Fa2Hr36LlUy89GzAqeaJ0RjKYDyVLUjnaAD
         FpgQ==
X-Gm-Message-State: AOJu0YxP4IIXJFv9AFoTKw9D4bPuRPAe6DbNOGGxxcAJTfz20bmG+AcQ
	iKghKNyUdA1gmlqki/BR0PUW0HgUwTxeaQSUpAJV5pfWlnMflk7ViyeR
X-Gm-Gg: ATEYQzzXaNXScGT3YKKfdRlX6HNB8vx5Y9FQH9zEadM+0Ry0hcuEGcGYuqLBu4gmrhf
	Iois44BgB/sjUuauOuqfmUJ3NbULNbo/J8o13twGODlLq3I10FlUmD5xSAWmFxUUciolDrqZbNf
	o9/kK6/8exWu31uzFPVtL3p4NRzWj9OgacIKFqyKyI0EZ9MySMNg/M1ZyACE/it+RZyYpy7gXNB
	9RWqDAawRAEllvZ35b0g9I4iJ32Ojd+odE4J330N0m7skzgL0DCwD17XGWtMLag8bI7xs2FH9gT
	SNCk/MYAvlY4QUHrdALHtC2Rt1KV6aei+xj30URPeDyqxc5QlK+4bjenuVXNzZIhALwq9s1pQSY
	QNxoQQxHIzm+l67N2lEL9704L57ckLgY0fKbz8FcB30+XRQTRUACgP9xcBMMNSh5QVwT5BSN/2L
	0NOulAdb6URYksqzGK9UxbxPCJqa+gCKbyU11NmdvgRuSRvQ6dCFzqThuBm4924XP+yg==
X-Received: by 2002:a17:903:22d1:b0:2b0:659e:97c6 with SMTP id d9443c01a7336-2b0cdd06f24mr75180345ad.47.1774722073947;
        Sat, 28 Mar 2026 11:21:13 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427660c7sm28451665ad.44.2026.03.28.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:21:13 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH 1/2] hwmon: (ads7871) Add mutex to serialize SPI transactions
Date: Sat, 28 Mar 2026 23:50:14 +0530
Message-ID: <20260328182015.220298-2-tabreztalks@gmail.com>
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

If userspace reads multiple channels concurrently, the driver can
overwrite ongoing REG_GAIN_MUX writes before the conversion completes.

Add a mutex to the driver's private data structure to serialize
hardware access and prevent concurrent userspace reads from corrupting
the ADC multiplexer state. Update error paths to ensure the mutex
is properly unlocked.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 9bfdf9e6bcd77..02e69bef2ca12 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -59,11 +59,13 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/mutex.h>
 
 #define DEVICE_NAME	"ads7871"
 
 struct ads7871_data {
 	struct spi_device *spi;
+	struct mutex lock;
 };
 
 static int ads7871_read_reg8(struct spi_device *spi, int reg)
@@ -98,6 +100,8 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	uint8_t channel, mux_cnv;
 
 	channel = attr->index;
+
+	mutex_lock(&pdata->lock);
 	/*
 	 * TODO: add support for conversions
 	 * other than single ended with a gain of 1
@@ -107,11 +111,11 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 	ret = ads7871_write_reg8(spi, REG_GAIN_MUX,
 				 (MUX_CNV_BM | MUX_M3_BM | channel));
 	if (ret < 0)
-		return ret;
+		goto out_unlock;
 
 	ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 	if (ret < 0)
-		return ret;
+		goto out_unlock;
 	mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 	/*
 	 * on 400MHz arm9 platform the conversion
@@ -121,21 +125,27 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 		i++;
 		ret = ads7871_read_reg8(spi, REG_GAIN_MUX);
 		if (ret < 0)
-			return ret;
+			goto out_unlock;
 		mux_cnv = ((ret & MUX_CNV_BM) >> MUX_CNV_BV);
 		msleep_interruptible(1);
 	}
 
 	if (mux_cnv == 0) {
 		val = ads7871_read_reg16(spi, REG_LS_BYTE);
-		if (val < 0)
-			return val;
+		if (val < 0) {
+			ret = val;
+			goto out_unlock;
+		}
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
 		val = ((val >> 2) * 25000) / 8192;
-		return sysfs_emit(buf, "%d\n", val);
+		ret = sysfs_emit(buf, "%d\n", val);
+		goto out_unlock;
 	}
 
-	return -ETIMEDOUT;
+	ret = -ETIMEDOUT;
+out_unlock:
+	mutex_unlock(&pdata->lock);
+	return ret;
 }
 
 static SENSOR_DEVICE_ATTR_RO(in0_input, voltage, 0);
@@ -194,7 +204,7 @@ static int ads7871_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	pdata->spi = spi;
-
+	mutex_init(&pdata->lock);
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, spi->modalias,
 							   pdata,
 							   ads7871_groups);
-- 
2.43.0

