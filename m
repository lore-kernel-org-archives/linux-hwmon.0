Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CFAD517
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772910; cv=none; b=H4u0mozUh8C6tN5YfVfJXH7bTBVnSxvFO3ZacRzyMqHYmBAABvxLkTRDVYKTc33GucUB5aN65k825SeeC5bcPPRGPdhscwwRb6M2pUGhJEuP/EQIXrHo/pkUZFJOwNDeWQzVyIUTFgymT+o52mIRVV6MlC+ksIeZbYMxSGNvSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772910; c=relaxed/simple;
	bh=y0tTXUJ6fv3LfYehZWmN38T/L3SxXV5WI4L4dHBIfYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmUZ8RlciU3Xrtwg0mwb7T7pi/TJYNgD9d4Ds1C/9rOGWN4+f8g6JkzThCh6WL+X1GqegogyRiOGmhqlnmT/Yg4QRw+zz9cVNWtqjFz59tq2/mKkmRDh1iGxgtYfnivJ5F++jgg/NJ553rbgWPAiGJQ1fWH/CmhGKl27Vcftb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+L4e1XU; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+L4e1XU"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd895682fcso2085299a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772907; x=1725377707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGUq6JFJAztt1l0avpHLj1jlRL9d8APQ56On9hKVaj4=;
        b=C+L4e1XUVJODZT0KZOlRKVk/fg1l1RuHs7eKyd8ZEkn6l2cERVW8/ubPmoE05ocud2
         0929eBKdUQ6CzRLrD9uG4owsdshpE68EAxOVoNSvgiaZ/tWKdbW1P14hgY8ONZWZiU1e
         a6UcEja5r+awOAOhpzt4m1P+muW3h1DF0e/nhrusf/tkw3HQj9+P3XchALl9ctJmVa3G
         BKGcHisPxcquqeTsu2ohz72di3wKay3E6FyPxTagjBGD8sDMoV3ZrRYPxuGdJc48z8bv
         w1dPgfOx4PFLUo1tFvyIX+c6Ki6IE94FYnDhXn40m+X9IkNJg4RSwj6H/boRmObWgszX
         3YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772907; x=1725377707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGUq6JFJAztt1l0avpHLj1jlRL9d8APQ56On9hKVaj4=;
        b=Wiwlx+T6sQEW4p7EMlHZQbjPdrKoKAP2M+sdQy9fM9jUn1VrJqq5KU0AMXFcwzLKCM
         ha36YH0UQ24z80Zs99fwbiUvvvDf830G7Qsw8LWVLZOzbbJeKHWULIb8SYkcX3vEt8ko
         WimLIhwP+ec266t3l0GZTOqk6HUU2ddNT/w0tRpgjthgY4xYKVYssI2wLLD2QoWYmiuv
         rzb9yElmCq41eBzYy9CUsdKoQpJDu7VERnsBmy/EdBbANNmWvrMwI3l96+2cy/j9eHDS
         pp4JPdOfkBRfr8sL+Yf6vnmFr66PC1pWPhj3wgjxZVFl8kU/o8SeizXZqZCzavirq0f2
         ulcg==
X-Gm-Message-State: AOJu0Yz0gwiE0VjzW+c2S0H747c6FtG+snDuPBEacbc72FBHnAVy8zwz
	i/i1fKoo+FiSKEyRex88rDmMIqBiI04+epTtkxLNtCR6XuS3RRWWwzeMsg==
X-Google-Smtp-Source: AGHT+IG9Pkfj4RJLKIwMEt2GvYnuU1QbLZLeiInCoFC6/Yr8pvNxZ+KpaEobnISeqHcONoF2KiT95w==
X-Received: by 2002:a17:90b:88d:b0:2c3:2557:3de8 with SMTP id 98e67ed59e1d1-2d646d24df4mr13101694a91.33.1724772907470;
        Tue, 27 Aug 2024 08:35:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb1726sm14497253a91.37.2024.08.27.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/11] hwmon: (ina2xx) Use local regmap pointer if used more than once
Date: Tue, 27 Aug 2024 08:34:49 -0700
Message-ID: <20240827153455.1344529-6-linux@roeck-us.net>
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

If regmap is accessed more than once in a function, declare and used
local regmap variable.

While at it, drop low value debug messages.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 9d93190874d7..ed8764a29d3f 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -210,18 +210,14 @@ static int ina2xx_init(struct ina2xx_data *data)
 static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	int ret, retry;
 
-	dev_dbg(dev, "Starting register %d read\n", reg);
-
 	for (retry = 5; retry; retry--) {
-
-		ret = regmap_read(data->regmap, reg, regval);
+		ret = regmap_read(regmap, reg, regval);
 		if (ret < 0)
 			return ret;
 
-		dev_dbg(dev, "read %d, val = 0x%04x\n", reg, *regval);
-
 		/*
 		 * If the current value in the calibration register is 0, the
 		 * power and current registers will also remain at 0. In case
@@ -233,8 +229,7 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 		if (*regval == 0) {
 			unsigned int cal;
 
-			ret = regmap_read(data->regmap, INA2XX_CALIBRATION,
-					  &cal);
+			ret = regmap_read(regmap, INA2XX_CALIBRATION, &cal);
 			if (ret < 0)
 				return ret;
 
@@ -372,17 +367,18 @@ static ssize_t ina226_alert_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina2xx_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	int regval;
 	int val = 0;
 	int ret;
 
 	mutex_lock(&data->config_lock);
-	ret = regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
+	ret = regmap_read(regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		goto abort;
 
 	if (regval & attr->index) {
-		ret = regmap_read(data->regmap, INA226_ALERT_LIMIT, &regval);
+		ret = regmap_read(regmap, INA226_ALERT_LIMIT, &regval);
 		if (ret)
 			goto abort;
 		val = ina226_reg_to_alert(data, attr->index, regval);
@@ -400,6 +396,7 @@ static ssize_t ina226_alert_store(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina2xx_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	unsigned long val;
 	int ret;
 
@@ -413,18 +410,18 @@ static ssize_t ina226_alert_store(struct device *dev,
 	 * if the value is non-zero.
 	 */
 	mutex_lock(&data->config_lock);
-	ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
+	ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
 				 INA226_ALERT_CONFIG_MASK, 0);
 	if (ret < 0)
 		goto abort;
 
-	ret = regmap_write(data->regmap, INA226_ALERT_LIMIT,
+	ret = regmap_write(regmap, INA226_ALERT_LIMIT,
 			   ina226_alert_to_reg(data, attr->index, val));
 	if (ret < 0)
 		goto abort;
 
 	if (val != 0) {
-		ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
+		ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
 					 INA226_ALERT_CONFIG_MASK,
 					 attr->index);
 		if (ret < 0)
-- 
2.45.2

