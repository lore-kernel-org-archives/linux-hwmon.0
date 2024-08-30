Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD597F6
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979969; cv=none; b=RGTjMXyksn41tc42mx8aGm6euzBCUnzUiJJCKRoPlaF4cLdUvd3z2WQNRtxG2QbcWWIda0pQPdurIOE54bgJjC1yEcei1YEnZoPuYyYwjgYX00xCKjCzBiE03wiBQ44LwjmLMJPIma+qac1mZFd4U8rMvsmspk2q8RTvV8U0T+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979969; c=relaxed/simple;
	bh=6+d80kQMhFo48+pc/FeHhX32S350IWDqrBHTCKn/bqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCydXqhJQKIy2Cn68tFrtjxblBys7awO/gFOMqj5RNrhSunl/G+gYcLfZKFP/0Ri9M1fsacGXQmS2IqCJK4HYWW8WrdweiH+6Rk+5ovXOcwWJBDCDIA+SrGvPXqyy69o5FCBl2cxrLY7BEtptY5nBY1t3vzpHVOl4IVrzkblH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFCsG8tE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFCsG8tE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201fae21398so9310445ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979967; x=1725584767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptaLCT4s9PbJHxC8W/T1HLFBejva6FZdtZH2Of7RSAE=;
        b=LFCsG8tEWkzi+uT01Sw8saT9o02vuri1gJifNt/bKpyh5c1Toaij3oE/1RsdpmM8vR
         Gjiu+cnLOHrUJEiTsgrqoksgxcRRPatmJ3GldRc0xQOIR/WbH57AKEXUXV8WQUXUS9PD
         6uaHfTpeg30aiiCWiI1zyHZNXFFkcuanznwxeWHINLmDL28iiTX1gtsC9PIveJlmKfO2
         en8wlGqFxkbsBh7Kwek9ei3zLn4K6JHay6HuICIFfBqaj/d15WEfUc9nIZPQj/HRLV3h
         34zKejDWk88+T00n0ehY7Whyi04Lbo3uFYsQX5w7fUQkSax4RS91K05JlOg+LO0xG4Pg
         1/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979967; x=1725584767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptaLCT4s9PbJHxC8W/T1HLFBejva6FZdtZH2Of7RSAE=;
        b=oVYXLp6a5yNbgfjYTmmUoTQGYdl2Anob3qvypMCNC7W52/180jrs+oZM/kl8c+vG+1
         LZRYx0S8Ph7/Hl9wW+SBOPq9QgL0PxSw1bZkOWgiu+JCAfUl7aTirYwX2aXXpqFVHo4Y
         LxNvRFqD2mCnUKyoHoP3FFOA/4ZPrpyk2tanJY9dt6bsJZXHdwfaheKz77FuwpwxhVBO
         6QonKJgDGpGuIV4msbzGxI6l8JTBnbpRq0tsaL9VkXOURu75SRcvEljeZ1q/H214fzqX
         9aurCDy/qwgf+U1/msoNJAxG9sHpZHzo7YlDAYphU0V/Xkv26HmAxRf/ilZTwQnWX7e+
         /T5A==
X-Gm-Message-State: AOJu0YyoYkyBtXQEf8N8Va9NTh3kxb6dK0i9RA36RHrp1QaPu8ooeb2V
	WyNnE5+3piN7pS0KDicrS7/jDnPloApPM7IjC1Kr7tknBFA1L/AJhhOffg==
X-Google-Smtp-Source: AGHT+IETiajwBeNWBSEYg9zRiQ98c4MTcDl9NqwNW4so3nUqnMePaO44LRBq3Bbi4s0E7T/tLQ2C6g==
X-Received: by 2002:a17:90a:5ac3:b0:2bd:7e38:798e with SMTP id 98e67ed59e1d1-2d856395c6amr4583423a91.28.1724979966893;
        Thu, 29 Aug 2024 18:06:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e801bsm4869024a91.15.2024.08.29.18.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 05/14] hwmon: (ina2xx) Use local regmap pointer if used more than once
Date: Thu, 29 Aug 2024 18:05:45 -0700
Message-ID: <20240830010554.1462861-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
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

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

