Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449592A1AA
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170860; cv=none; b=q16/X/uabs2//rGu8nQFC62n5M6NdnWclwSDvJnoSj5jj/vnX/bmTru8eGpdcDdbH4mw6LNY0wCAJKNg7TGWtbnZrsf1YzstoC8mkq34bpoB9sSEPaYpbR3kQkxfkcJIQALF7n1+/5mTQEaA/RxGWhMYAPIpNxPo5BGexNJH+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170860; c=relaxed/simple;
	bh=GgbN/xfi1+1UQUAQkw9MrQPh2Mrsg06rKp2yEd7dmzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P7M6DBOvO4ixo2J0uaQpPwS6XdW4DmuppYtVFicQFL/3gDfZ9wv7eUiswPaYypuxX/FArCFTFO1eRx5OS6VSoOwH6neQZ9/u/RuNOJ28YQ4KGlnHB80T+oTENlsDdN4uGMorciTKcCJnMh8UmSXqieOAUzzBdbjqUCss9paS10E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lk5BgpMS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk5BgpMS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc49c0aaffso1715935ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170857; x=1721775657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgF4IJKfLbvm9+vR9izv5Fs0Pq+QR9XA65JgqRSU/6Y=;
        b=Lk5BgpMSAgBB/qTyOM6rsXlobWPYosrS4dkRSh6ebxhmw1XH+xFsuNDffmtEFxayN4
         9BKuHzW5iMF7RZy7FL3W5YuQE7AidT/Z3SdvpzP4DKjNShfSYaTsfUPAm7BA08By+Emi
         zgap13t+RWlZYItTsC1pwMeP6sgzaLtSUNLvJ6j2pv0tSpMvV7wciiAD5q/uJuzvbsSD
         55NFKhAwgCfbhcCyGzn5zX1sOmua7vuHiQ/h1s78ivF4pz7agGIbPgU4epfCNDAW7m8Y
         G18iBLdk8Kb0AE9DOTBuVF7HR/SrL118cFR7aTo++YoEYsdiWmxXfkZ/sA0BSClhlj+d
         ldqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170857; x=1721775657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgF4IJKfLbvm9+vR9izv5Fs0Pq+QR9XA65JgqRSU/6Y=;
        b=bf+kwXheFiePdw3Q+Ww+6UNxhzyZQ38e4DSlhu4Z05zkojtYePXQE3k5JnYGQPzWWv
         MI42BXUSbJlpjB0XJzQcr1ba4fMEpnfkQ0dtldZrdISu2gV4V9oBYfZwD1YCi5tUMkOR
         RKIO/tWLE8IMybuuqSDDTP13AnUCnSpaBHBH4SPmMQUc4rNymEkGCc+br18lyQ2i9WWg
         lOr1ZOfvpL7bj5AGSYUDnnhpXkb+6WqCZwS3/dF69NjxUF9qS2BSvY9twyyOjqwfMYJq
         8ucx+dIJOuAmcyon7WZbKhVlkqNOsGkZJSSHvM/QhgolDql+RFQBLBd6A5/Jd+ZsAe+l
         orxA==
X-Gm-Message-State: AOJu0YzRd3JHqid3rGxDAI18epAljweKAvRWvvWysG1c63JxKfmr9TA8
	WuiAo2eFEgsYap62eWF0En66aBeLvRT34BbV2w1EQB1WyY5UDPQPWIfweg==
X-Google-Smtp-Source: AGHT+IHdCY+oHR26DA42V4gPePoh3v05rw8/lkdDNA7BZ+VNXQTutVqHiscFF1MsQecabO5nnn34RA==
X-Received: by 2002:a17:902:d487:b0:1fb:cffb:cf9b with SMTP id d9443c01a7336-1fc3d92c920mr33200275ad.7.1721170856643;
        Tue, 16 Jul 2024 16:00:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc27503sm63639185ad.175.2024.07.16.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:00:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (lm95245) Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:45 -0700
Message-Id: <20240716230050.2049534-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716230050.2049534-1-linux@roeck-us.net>
References: <20240716230050.2049534-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use multi-byte regmap operations where possible to reduce code size
and the need for mutex protection.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95245.c | 110 ++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index d293b4f15dc1..3bdc30530847 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -161,18 +161,18 @@ static int lm95245_read_temp(struct device *dev, u32 attr, int channel,
 {
 	struct lm95245_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
-	int ret, regl, regh, regvall, regvalh;
+	unsigned int regs[2];
+	unsigned int regval;
+	u8 regvals[2];
+	int ret;
 
 	switch (attr) {
 	case hwmon_temp_input:
-		regl = channel ? LM95245_REG_R_REMOTE_TEMPL_S :
-				 LM95245_REG_R_LOCAL_TEMPL_S;
-		regh = channel ? LM95245_REG_R_REMOTE_TEMPH_S :
-				 LM95245_REG_R_LOCAL_TEMPH_S;
-		ret = regmap_read(regmap, regl, &regvall);
-		if (ret < 0)
-			return ret;
-		ret = regmap_read(regmap, regh, &regvalh);
+		regs[0] = channel ? LM95245_REG_R_REMOTE_TEMPL_S :
+				    LM95245_REG_R_LOCAL_TEMPL_S;
+		regs[1] = channel ? LM95245_REG_R_REMOTE_TEMPH_S :
+				    LM95245_REG_R_LOCAL_TEMPH_S;
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (ret < 0)
 			return ret;
 		/*
@@ -181,92 +181,77 @@ static int lm95245_read_temp(struct device *dev, u32 attr, int channel,
 		 * Use signed calculation for remote if signed bit is set
 		 * or if reported temperature is below signed limit.
 		 */
-		if (!channel || (regvalh & 0x80) || regvalh < 0x7f) {
-			*val = temp_from_reg_signed(regvalh, regvall);
+		if (!channel || (regvals[1] & 0x80) || regvals[1] < 0x7f) {
+			*val = temp_from_reg_signed(regvals[1], regvals[0]);
 			return 0;
 		}
-		ret = regmap_read(regmap, LM95245_REG_R_REMOTE_TEMPL_U,
-				  &regvall);
-		if (ret < 0)
+		ret = regmap_bulk_read(regmap, LM95245_REG_R_REMOTE_TEMPH_U, regvals, 2);
+		if (ret)
 			return ret;
-		ret = regmap_read(regmap, LM95245_REG_R_REMOTE_TEMPH_U,
-				  &regvalh);
-		if (ret < 0)
-			return ret;
-		*val = temp_from_reg_unsigned(regvalh, regvall);
+		*val = temp_from_reg_unsigned(regvals[0], regvals[1]);
 		return 0;
 	case hwmon_temp_max:
 		ret = regmap_read(regmap, LM95245_REG_RW_REMOTE_OS_LIMIT,
-				  &regvalh);
+				  &regval);
 		if (ret < 0)
 			return ret;
-		*val = regvalh * 1000;
+		*val = regval * 1000;
 		return 0;
 	case hwmon_temp_crit:
-		regh = channel ? LM95245_REG_RW_REMOTE_TCRIT_LIMIT :
-				 LM95245_REG_RW_LOCAL_OS_TCRIT_LIMIT;
-		ret = regmap_read(regmap, regh, &regvalh);
+		regs[0] = channel ? LM95245_REG_RW_REMOTE_TCRIT_LIMIT :
+				    LM95245_REG_RW_LOCAL_OS_TCRIT_LIMIT;
+		ret = regmap_read(regmap, regs[0], &regval);
 		if (ret < 0)
 			return ret;
-		*val = regvalh * 1000;
+		*val = regval * 1000;
 		return 0;
 	case hwmon_temp_max_hyst:
-		ret = regmap_read(regmap, LM95245_REG_RW_REMOTE_OS_LIMIT,
-				  &regvalh);
+		regs[0] = LM95245_REG_RW_REMOTE_OS_LIMIT;
+		regs[1] = LM95245_REG_RW_COMMON_HYSTERESIS;
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (ret < 0)
 			return ret;
-		ret = regmap_read(regmap, LM95245_REG_RW_COMMON_HYSTERESIS,
-				  &regvall);
-		if (ret < 0)
-			return ret;
-		*val = (regvalh - regvall) * 1000;
+		*val = (regvals[0] - regvals[1]) * 1000;
 		return 0;
 	case hwmon_temp_crit_hyst:
-		regh = channel ? LM95245_REG_RW_REMOTE_TCRIT_LIMIT :
-				 LM95245_REG_RW_LOCAL_OS_TCRIT_LIMIT;
-		ret = regmap_read(regmap, regh, &regvalh);
+		regs[0] = channel ? LM95245_REG_RW_REMOTE_TCRIT_LIMIT :
+				    LM95245_REG_RW_LOCAL_OS_TCRIT_LIMIT;
+		regs[1] = LM95245_REG_RW_COMMON_HYSTERESIS;
+
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (ret < 0)
 			return ret;
-		ret = regmap_read(regmap, LM95245_REG_RW_COMMON_HYSTERESIS,
-				  &regvall);
-		if (ret < 0)
-			return ret;
-		*val = (regvalh - regvall) * 1000;
+		*val = (regvals[0] - regvals[1]) * 1000;
 		return 0;
 	case hwmon_temp_type:
-		ret = regmap_read(regmap, LM95245_REG_RW_CONFIG2, &regvalh);
+		ret = regmap_read(regmap, LM95245_REG_RW_CONFIG2, &regval);
 		if (ret < 0)
 			return ret;
-		*val = (regvalh & CFG2_REMOTE_TT) ? 1 : 2;
+		*val = (regval & CFG2_REMOTE_TT) ? 1 : 2;
 		return 0;
 	case hwmon_temp_offset:
-		ret = regmap_read(regmap, LM95245_REG_RW_REMOTE_OFFL,
-				  &regvall);
+		ret = regmap_bulk_read(regmap, LM95245_REG_RW_REMOTE_OFFH, regvals, 2);
 		if (ret < 0)
 			return ret;
-		ret = regmap_read(regmap, LM95245_REG_RW_REMOTE_OFFH,
-				  &regvalh);
-		if (ret < 0)
-			return ret;
-		*val = temp_from_reg_signed(regvalh, regvall);
+		*val = temp_from_reg_signed(regvals[0], regvals[1]);
 		return 0;
 	case hwmon_temp_max_alarm:
-		ret = regmap_read(regmap, LM95245_REG_R_STATUS1, &regvalh);
+		ret = regmap_read(regmap, LM95245_REG_R_STATUS1, &regval);
 		if (ret < 0)
 			return ret;
-		*val = !!(regvalh & STATUS1_ROS);
+		*val = !!(regval & STATUS1_ROS);
 		return 0;
 	case hwmon_temp_crit_alarm:
-		ret = regmap_read(regmap, LM95245_REG_R_STATUS1, &regvalh);
+		ret = regmap_read(regmap, LM95245_REG_R_STATUS1, &regval);
 		if (ret < 0)
 			return ret;
-		*val = !!(regvalh & (channel ? STATUS1_RTCRIT : STATUS1_LOC));
+		*val = !!(regval & (channel ? STATUS1_RTCRIT : STATUS1_LOC));
 		return 0;
 	case hwmon_temp_fault:
-		ret = regmap_read(regmap, LM95245_REG_R_STATUS1, &regvalh);
+		ret = regmap_read(regmap, LM95245_REG_R_STATUS1, &regval);
 		if (ret < 0)
 			return ret;
-		*val = !!(regvalh & STATUS1_DIODE_FAULT);
+		*val = !!(regval & STATUS1_DIODE_FAULT);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -279,6 +264,7 @@ static int lm95245_write_temp(struct device *dev, u32 attr, int channel,
 	struct lm95245_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
 	unsigned int regval;
+	u8 regvals[2];
 	int ret, reg;
 
 	switch (attr) {
@@ -311,16 +297,10 @@ static int lm95245_write_temp(struct device *dev, u32 attr, int channel,
 	case hwmon_temp_offset:
 		val = clamp_val(val, -128000, 127875);
 		val = val * 256 / 1000;
-		mutex_lock(&data->update_lock);
-		ret = regmap_write(regmap, LM95245_REG_RW_REMOTE_OFFL,
-				   val & 0xe0);
-		if (ret < 0) {
-			mutex_unlock(&data->update_lock);
-			return ret;
-		}
-		ret = regmap_write(regmap, LM95245_REG_RW_REMOTE_OFFH,
-				   (val >> 8) & 0xff);
-		mutex_unlock(&data->update_lock);
+		regvals[0] = val >> 8;
+		regvals[1] = val & 0xe0;
+
+		ret = regmap_bulk_write(regmap, LM95245_REG_RW_REMOTE_OFFH, regvals, 2);
 		return ret;
 	case hwmon_temp_type:
 		if (val != 1 && val != 2)
-- 
2.39.2

