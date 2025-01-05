Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13CB1D0F46;
	Sun,  5 Jan 2025 19:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106956; cv=none; b=nircV1txA22UxN2cfo4hPNTc85YEH3OsvabHFgx+K/zaq71qby55S8BDfAcKKStaG5D1LZTZJ8VC/xKawBhBeX1Qw9dEYq/1ez3XxVDfmMplxV0yPeQDWekSSoDEtFho0M3bTHfo51Nvbfd0WxJiCAXcXPdUzK1+VKY5ur0C3Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106956; c=relaxed/simple;
	bh=3Tgyuz/tOUj9/IZeVGBsvTmXFkZGwRb9e2alBxD8pUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imFKE3aWS2T13/Ui4CcImHYMQFfmu9M7YKsAcIqlxdf731Bzf8r4508434dm8/+SOn2yfYCX+vvBGFqItg/HLxXDFfvdb9AaOGRzZntyz57zWKijsCTfuoxbJnAsOQ7OEZOu/frMZ95qxE5VjA7j0H6hOYzUW4AtH+RrsY//Y18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTI2mZCQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTI2mZCQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436345cc17bso99281025e9.0;
        Sun, 05 Jan 2025 11:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736106953; x=1736711753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT95wdO2rleIugbG3ndjNwQL1C6rhyysv7VaEGhI/y8=;
        b=HTI2mZCQ0DL0nDJYKi3LGzX5ywlv1vJpo9ElYAxJlkP/stqcEr2kXsZ0+wizCha0CC
         6HF46AdWONp34csT6zRclKSAYZL0FCVKPL5P3XKmrYGs3oM3Nnz+roTipW7J18AL9W6f
         o+nYLx7a4qx4xw/zhFzSSuTr5wjrM7Oxtc8nBP/E4zOVvq4R5G3DPriqLUQiqwFlF5DS
         lRtlLTuTkkLtv2fRWB9AoRkCvoAy0QhKVKQcBY86j+kHKAV4LWv8o3NBsZu9D4kwN6qC
         gyhnNykDvh3NJ/OqbVB5Oda1Hzrv4Dua1H6h/Qw9U0xzlO3mqhlFFyc31My/I5vve2ZU
         QC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736106953; x=1736711753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LT95wdO2rleIugbG3ndjNwQL1C6rhyysv7VaEGhI/y8=;
        b=DOvm+1imux4CEmvxldKF3/lWTtHqbe3qxoygYdZAZInE6P5vhP/jY2SHANeKtdl9Xf
         aoMyINjiXDlg+USQMpx+AezvbVG+LQRKl2XBTjmEiYMnLtF08WD9fGGm3RAUEs4TakVA
         fAO0YkHtwHpM7aV1sZJDB/i7b2fZrk1HNU4gW6/1bx3wiARG/tVasOxrrZq5D8+V409p
         W/IKLXqlnSdwSn20D78lXg2w7Ww0n64RafluX9mUbj1y2P+SU3TQTgpl2bnlKF4WXWuw
         EWi6vS2Me7dRsHWYtSPsAAsnOY7vVjPQI2mOFtW23VOz2UgVyPKmluzSZEQFD2Mzl3xA
         hUVg==
X-Forwarded-Encrypted: i=1; AJvYcCV6kR5gZKDs/kg8P1rqhI9iSpKqMfLXNfnPoJToFIXjd8EUhNgWr7T4ZuvP+cYo/XUXpZwWZgf3jwg5Xi1T@vger.kernel.org, AJvYcCWaQ31+EY44L0DsNW08soWJSLSpf5qXnkIIMHuPjTCdSvDnARjazM2/eOda6pQpErwDtIu3WQnbNmWKtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiuaa/AIAKbcWt3yY2RXVEHDQIwtTG+wfGkODJeo2QvFLUdfkX
	/qffuxHklxh8E/wq7lQ2l1rPTmt23xo/6g2HyVjxpFygUfP3AJLG
X-Gm-Gg: ASbGncuQAzMawsrvi5tfGfPtPB+4rhQgf4fNM9FKgcVd6t29r3AqclEtM+C2T+FKrrl
	nwH8bxAa6bOTNDRfdjYZ47Her/fdkxMEgSxtYhxdqMtzUNbf3glkrWuzsZ49k4dlvybqzHJSWXf
	epVlqgMcDXeIr0BZRIwZiUCD490LsmJ+T9cbnsF4gls7sjueWnHY/KnI/uFfa5w8qlGKVbotlOZ
	9MS9P2tGwUKcoCfu/bqaLamIk3uOArk9meEQ3ExBNP4P8veR5Cf7cHTYgCQ
X-Google-Smtp-Source: AGHT+IGmc/RV42VpNyvv4pbyvtFHsCm4bdNWghp3GdceRsoHQG/an6vZR+1GwJas3Aazl1VBmV6mRg==
X-Received: by 2002:a5d:5e09:0:b0:385:faf5:eb9f with SMTP id ffacd0b85a97d-38a2240484emr54353001f8f.48.1736106953356;
        Sun, 05 Jan 2025 11:55:53 -0800 (PST)
Received: from dell-f2yjyx3.. ([185.32.209.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1143dsm577778975e9.18.2025.01.05.11.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:55:52 -0800 (PST)
From: Adrian DC <radian.dc@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian DC <radian.dc@gmail.com>
Subject: [PATCH 3/3] hwmon/adt7470: create 'temp_fan_norm_alarm' attribute for 'NORM' alarm
Date: Sun,  5 Jan 2025 20:55:16 +0100
Message-ID: <20250105195521.3263193-4-radian.dc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105195521.3263193-1-radian.dc@gmail.com>
References: <20250105195521.3263193-1-radian.dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Default: 0 in all normal use cases
Test: Raises to 1 if all FANs are in automatic mode and below threshold
---

Signed-off-by: Adrian DC <radian.dc@gmail.com>
---
 drivers/hwmon/adt7470.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index afb881385dbb..1ec4c0807053 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -54,6 +54,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define		ADT7470_R8T_ALARM		0x01
 #define		ADT7470_R9T_ALARM		0x02
 #define		ADT7470_R10T_ALARM		0x04
+#define		ADT7470_NORM_ALARM		0x08
 #define		ADT7470_FAN1_ALARM		0x10
 #define		ADT7470_FAN2_ALARM		0x20
 #define		ADT7470_FAN3_ALARM		0x40
@@ -533,6 +534,18 @@ static ssize_t num_temp_sensors_store(struct device *dev,
 	return count;
 }
 
+static ssize_t temp_fan_norm_alarm_show(struct device *dev,
+				     struct device_attribute *devattr,
+				     char *buf)
+{
+	struct adt7470_data *data = adt7470_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return sprintf(buf, "%d\n", !!(data->alarm & (ADT7470_NORM_ALARM << 8)));
+}
+
 static int adt7470_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct adt7470_data *data = adt7470_update_device(dev);
@@ -1080,6 +1093,7 @@ static ssize_t pwm_auto_temp_store(struct device *dev,
 static DEVICE_ATTR_RW(alarm_mask);
 static DEVICE_ATTR_RW(num_temp_sensors);
 static DEVICE_ATTR_RW(auto_update_interval);
+static DEVICE_ATTR_RO(temp_fan_norm_alarm);
 
 static SENSOR_DEVICE_ATTR_RW(force_pwm_max, force_pwm_max, 0);
 
@@ -1112,6 +1126,7 @@ static struct attribute *adt7470_attrs[] = {
 	&dev_attr_alarm_mask.attr,
 	&dev_attr_num_temp_sensors.attr,
 	&dev_attr_auto_update_interval.attr,
+	&dev_attr_temp_fan_norm_alarm.attr,
 	&sensor_dev_attr_force_pwm_max.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
-- 
2.43.0

