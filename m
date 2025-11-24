Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C75313277
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003562; cv=none; b=pPcq/q9f9RLFR5YPXyCXgJa9Gb3ftMjpVNMsprX9XttfQDrLvbwJGDkK3k5ep//6mtoXT4ibuS9wTsnla8qDfCBlfWbZ+Kb8dWTO+aHAPj6sQLwnMEQpXqfGat60tbFG4UbvD8CA0SaIvyxErfqConMpnj1y7DGCR1ri4XILQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003562; c=relaxed/simple;
	bh=Bk3vqHmWdWkagFl0OVdo/ww+OVIz0PyDQHSxBfQvGlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3S83zx6B/exY3La7/7InCTWD2tfXvEXL4DRnXo0p9ErT2MammHJCUunuRSFieF47roi5luoClQRjVlknWoXB851JaO76MNEetX4C6CA0wXmzMMSucvG11iazSvi729zSWbHmwuNSzwG3W+cf1HdrE/H6R0dBOW5FJ+IVDdoiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtKjwNfX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtKjwNfX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29806bd47b5so27553335ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764003560; x=1764608360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+woEIj8vkU1m30QcrdiJOloh7+MvziDDhh8/XjkPb4=;
        b=EtKjwNfXhd3TRdrELn6jyzzJQmkpXbAW6uMDmxBdEu3Y28mzpMsF4qFBv2vQW3b2Yn
         AfnQKWyoQqbq7iOQdjHbXxlSolqSZ4hXxTBac784CebvRof6G9p8wyhI1o2zgGK4iNUf
         9RSJ508n/0Que3hJe8kCiFGtEtr5UBN8f/EDm4iYPsK9jWHHQzlbF02nnJfiPwC4xYRz
         LYvx6579Z95b9SzL/5Ez3VdBpk47siXkORFhBG8CNpHXAg4m+1sUb7sjzl0DrLsvmIVO
         CdRwQhtRYzPSG8X0UnGNH5VS72Wa3F7wcW88qKqIODVTa2gZDgCNf0Uw1UV17reefJ5U
         L+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003560; x=1764608360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+woEIj8vkU1m30QcrdiJOloh7+MvziDDhh8/XjkPb4=;
        b=R5NhLDaMk86wDPsOos7sQWIHODfw/9PftoBTiLi9DsNUEL1udfHrKMveUmj/lz8rVt
         xC2xBOIReyFWmHPvL+v68Ewgp4RddJa43eC9k1H08Vzqvvb9XSO6fkIIxRnNPKPJqx61
         AVZl+mKiJGQPsIGBoQws04aQ9QiGsz+pCWFWoJtRTR0GwmchTJzbF4weqU9Raf0ACUbp
         R3oc2eJnxFmThFUGN+6Qb/K1V3wBj+T+6g/Y8owyY1j2rBJmaTD2bStjX6R8eLgkDHAe
         s+gsHN4GhFFzq8EYOpKIrpVN74WSxZ50gjuAovzASuBw3xa1FIvKHDXx4wM5Ex9lJku6
         JrQA==
X-Gm-Message-State: AOJu0YzS//dEhsupOAX+86il3EQKHj15iaj0WZn3Up6+hJU2UgP8WN8O
	Sy+21sYb0DUAq13auEdjTLsWWUTvkGl6zq0SusJDRVNfyflsmIz+6mXJWHUQGtF4ghc=
X-Gm-Gg: ASbGncseq03/q0Ts9pna7zHj909ZyZKziBSimKCOakqzVby8miN5l5+0OKBge3mUaOh
	4QGyIMjbp6fG6UlRxKiIYByWDpkR/4GS377eAUauywwjYxlc9Ni2tXzx2rBpv+oB9t8QnkvlK+Q
	d2MAAa+8WUR/0+7vF/oHSNqloI0V47dO30W4lkPqHgXw/5FOqzm34NRea4sVuWSKQJfbWbbcDoK
	YD/y+84W8z/0j+9gsQ8dYIL20ZbDgkilUVk63PgitNIX1EVaqnKoPh1uoCUYLljd3b40Ipv/CXe
	hppahKS+4Vdcle07VpfP1Bf+MAUrW1iMIo0woy0G+RsR7wN63uEE3IP9RRy46bD55gjHJEk6fjy
	PXvn4jTSm/fLd2cPG05ZnY91zjLykyM5M1xxNqYs+A/fSVlKWg1qryvOb9d0toSgaWSafkrz5LA
	28O2sQkC0ZiaIDwQPlNya2A1dgzC53MeAUCssHWDHDAnjsPEdsSkyjpExrOyE4fk8jiqvNeNHJl
	w==
X-Google-Smtp-Source: AGHT+IE7XTNKN2xNsyxsyFaphLUAv/u1x81sEA6Y8Wx1rsqQSfsgsMr0eA0bt5j2VPOIs/w95ZV3Lw==
X-Received: by 2002:a17:903:2451:b0:295:96bc:868c with SMTP id d9443c01a7336-29b6c3c23f6mr122664435ad.5.1764003559968;
        Mon, 24 Nov 2025 08:59:19 -0800 (PST)
Received: from 2045D.localdomain (234.sub-72-110-77.myvzw.com. [72.110.77.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm137316875ad.42.2025.11.24.08.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:59:19 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: vt8231@hiddenengine.co.uk,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: (vt8231) Convert macros to functions to avoid TOCTOU
Date: Tue, 25 Nov 2025 00:59:00 +0800
Message-ID: <20251124165900.4713-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro FAN_FROM_REG evaluates its arguments multiple times. When used
with shared driver data, this leads to Time-of-Check to Time-of-Use
(TOCTOU) race conditions, potentially causing divide-by-zero errors.

Convert the macro to a static function to ensure arguments are evaluated
only once.

Additionally, in fan_div_store, move the reading of the old register
value and the calculation of the minimum limit inside the update lock.
This ensures that the read-modify-write sequence operates on consistent
data, preventing race conditions during fan divider updates.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/vt8231.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 3bf27c21845b..617bbea60690 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -138,7 +138,12 @@ static inline u8 FAN_TO_REG(long rpm, int div)
 	return clamp_val(1310720 / (rpm * div), 1, 255);
 }
 
-#define FAN_FROM_REG(val, div) ((val) == 0 ? 0 : 1310720 / ((val) * (div)))
+static int fan_from_reg(int val, int div)
+{
+	if (val == 0)
+		return 0;
+	return 1310720 / (val * div);
+}
 
 struct vt8231_data {
 	unsigned short addr;
@@ -561,7 +566,7 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct vt8231_data *data = vt8231_update_device(dev);
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan[nr],
 				DIV_FROM_REG(data->fan_div[nr])));
 }
 
@@ -571,7 +576,7 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct vt8231_data *data = vt8231_update_device(dev);
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan_min[nr],
 			DIV_FROM_REG(data->fan_div[nr])));
 }
 
@@ -613,9 +618,8 @@ static ssize_t fan_div_store(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	unsigned long val;
 	int nr = sensor_attr->index;
-	int old = vt8231_read_value(data, VT8231_REG_FANDIV);
-	long min = FAN_FROM_REG(data->fan_min[nr],
-				 DIV_FROM_REG(data->fan_div[nr]));
+	int old;
+	long min;
 	int err;
 
 	err = kstrtoul(buf, 10, &val);
@@ -623,6 +627,9 @@ static ssize_t fan_div_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
+	old = vt8231_read_value(data, VT8231_REG_FANDIV);
+	min = fan_from_reg(data->fan_min[nr],
+			DIV_FROM_REG(data->fan_div[nr]));
 	switch (val) {
 	case 1:
 		data->fan_div[nr] = 0;
-- 
2.34.1

