Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6513D502
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721170861; cv=none; b=uw4WzKZusUOJWmPSnmpMWf1DiVYmPTK1vbwUxzHCJXgr9SPpPNirnQX+9ZNPOGQnNQD9mTkzhk18GQdUG3+PKYWwGngZkP2ROXLKBKERCetIn13I/Rmn2+Woge1mtQ662cLukgDamf5BIIIZGddy33VaJJaMgFgmzTrxSW32Brg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721170861; c=relaxed/simple;
	bh=luq9bOH6eETrJWj0Xm8t3HuCpW+2B19gKdWieuZXsiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q3uwkJ+1UYV3/Opmif/en8Drk4OzrkeVHh90io6MFlawdFYo00M1noJTEkTy1V3e8GFZDE5GexI+K+cpgVhm0Nmd2ua1qwuQK6TMVHfPriyADVh2Uvgm8Thj7867oNTu7Vdk27ZfXu1x7sVvJyqcWMEtVPRbmuvsnM9rvulro/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtksCpQR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtksCpQR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70af8128081so4153625b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721170858; x=1721775658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+mhWIh9rO13TbrQbGprfCh45gda11b9VrQFxkUKZFo=;
        b=jtksCpQRjYBlO78YV2DClxpLjPygqfaN9PZ6vlmjo9oBfBIMK9ng0GNOP9h4f1QJ3g
         wH+SoxTqlczeuJ8vNyYv2wXQUQR3p5Ec5rVZX5d+LfXNKGFwKEnNr0id0IQKmu2InM2h
         QrbMMlrUYFQOQQl8YWYKepTSrKAnH1HN/QsHkj2WrGaIKiDhgwyQpJ44/WmGT8J7OQw6
         +2I4CwZYqBIFb8JQuHjOUbrmQSvBz0SvIZfj//ePlGwLHCXP7PJUafsCsj7TE1GRIKhJ
         zpwwD4/xqbc0fvUZ7c/bEkynIsp4V9ZqGBlyLWDTJVdi61zNM9z7svP5VSeXrHsjl17k
         Hhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721170858; x=1721775658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+mhWIh9rO13TbrQbGprfCh45gda11b9VrQFxkUKZFo=;
        b=A9EGpTfwA9RIbYysVdGbsti9hw9HzCdiNb99AXy6eLD/Fo45HIqmbVLLkTw1o7UCW4
         M8iXoa/7UQM1NeF//OVQq7xlZ97ed9WSRjyVuMCTxgo33knAgVVNXfZDzlfDRm5qf2d3
         evq5d1pLEtsB9M01m7bOQBPgrrEatVS2XYVNSW8X+2+HRWxW9H3hYGsLOKcW/ef+80LQ
         yoO/16L/Eq2gHnIY5sh90ifgejBBWDkdJCghRGfyTsPRWh8TwGOfU6q/0C+DSnKG8B9e
         KhyKRlhvRT2Y/Ppx3DEnoCTwfFkOqVSaEuq/7F1NnOz2TLvdFYt39GqeZ7Jqrmurhi/X
         +PQA==
X-Gm-Message-State: AOJu0YxEEhUpvnipxgE7TZFjNGdA+GK0r7k5zwS7tfxyi4hYm2aDf1q8
	VahOyW0OeUFtRxWNWTZPG8qwiBIerKitzY5pJUrUqhHEHyz9UXugEDVziA==
X-Google-Smtp-Source: AGHT+IGwzrNH+TXe8OzRoxF9hBnwgKV24W7Pu5nLZ72u18WBeVsQVOnUHAkV+aD4Y7MO61u52LCAgg==
X-Received: by 2002:a05:6a21:7702:b0:1c0:ed64:e4a9 with SMTP id adf61e73a8af0-1c3fdd1838bmr39984637.34.1721170858423;
        Tue, 16 Jul 2024 16:00:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7d2dasm6905823b3a.111.2024.07.16.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 16:00:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (nct7802) Use multi-byte regmap operations
Date: Tue, 16 Jul 2024 16:00:46 -0700
Message-Id: <20240716230050.2049534-3-linux@roeck-us.net>
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

No functional changes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7802.c | 61 ++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 97e8c6424403..3d6819aebe16 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -229,41 +229,34 @@ static int nct7802_read_temp(struct nct7802_data *data,
 
 static int nct7802_read_fan(struct nct7802_data *data, u8 reg_fan)
 {
-	unsigned int f1, f2;
+	unsigned int regs[2] = {reg_fan, REG_FANCOUNT_LOW};
+	u8 f[2];
 	int ret;
 
-	mutex_lock(&data->access_lock);
-	ret = regmap_read(data->regmap, reg_fan, &f1);
-	if (ret < 0)
-		goto abort;
-	ret = regmap_read(data->regmap, REG_FANCOUNT_LOW, &f2);
-	if (ret < 0)
-		goto abort;
-	ret = (f1 << 5) | (f2 >> 3);
+	ret = regmap_multi_reg_read(data->regmap, regs, f, 2);
+	if (ret)
+		return ret;
+	ret = (f[0] << 5) | (f[1] >> 3);
 	/* convert fan count to rpm */
 	if (ret == 0x1fff)	/* maximum value, assume fan is stopped */
 		ret = 0;
 	else if (ret)
 		ret = DIV_ROUND_CLOSEST(1350000U, ret);
-abort:
-	mutex_unlock(&data->access_lock);
 	return ret;
 }
 
 static int nct7802_read_fan_min(struct nct7802_data *data, u8 reg_fan_low,
 				u8 reg_fan_high)
 {
-	unsigned int f1, f2;
+	unsigned int regs[2] = {reg_fan_low, reg_fan_high};
+	u8 f[2];
 	int ret;
 
-	mutex_lock(&data->access_lock);
-	ret = regmap_read(data->regmap, reg_fan_low, &f1);
+	ret = regmap_multi_reg_read(data->regmap, regs, f, 2);
 	if (ret < 0)
-		goto abort;
-	ret = regmap_read(data->regmap, reg_fan_high, &f2);
-	if (ret < 0)
-		goto abort;
-	ret = f1 | ((f2 & 0xf8) << 5);
+		return ret;
+
+	ret = f[0] | ((f[1] & 0xf8) << 5);
 	/* convert fan count to rpm */
 	if (ret == 0x1fff)	/* maximum value, assume no limit */
 		ret = 0;
@@ -271,8 +264,6 @@ static int nct7802_read_fan_min(struct nct7802_data *data, u8 reg_fan_low,
 		ret = DIV_ROUND_CLOSEST(1350000U, ret);
 	else
 		ret = 1350000U;
-abort:
-	mutex_unlock(&data->access_lock);
 	return ret;
 }
 
@@ -302,33 +293,27 @@ static u8 nct7802_vmul[] = { 4, 2, 2, 2, 2 };
 
 static int nct7802_read_voltage(struct nct7802_data *data, int nr, int index)
 {
-	unsigned int v1, v2;
+	u8 v[2];
 	int ret;
 
 	mutex_lock(&data->access_lock);
 	if (index == 0) {	/* voltage */
-		ret = regmap_read(data->regmap, REG_VOLTAGE[nr], &v1);
+		unsigned int regs[2] = {REG_VOLTAGE[nr], REG_VOLTAGE_LOW};
+
+		ret = regmap_multi_reg_read(data->regmap, regs, v, 2);
 		if (ret < 0)
-			goto abort;
-		ret = regmap_read(data->regmap, REG_VOLTAGE_LOW, &v2);
-		if (ret < 0)
-			goto abort;
-		ret = ((v1 << 2) | (v2 >> 6)) * nct7802_vmul[nr];
+			return ret;
+		ret = ((v[0] << 2) | (v[1] >> 6)) * nct7802_vmul[nr];
 	}  else {	/* limit */
 		int shift = 8 - REG_VOLTAGE_LIMIT_MSB_SHIFT[index - 1][nr];
+		unsigned int regs[2] = {REG_VOLTAGE_LIMIT_LSB[index - 1][nr],
+					REG_VOLTAGE_LIMIT_MSB[nr]};
 
-		ret = regmap_read(data->regmap,
-				  REG_VOLTAGE_LIMIT_LSB[index - 1][nr], &v1);
+		ret = regmap_multi_reg_read(data->regmap, regs, v, 2);
 		if (ret < 0)
-			goto abort;
-		ret = regmap_read(data->regmap, REG_VOLTAGE_LIMIT_MSB[nr],
-				  &v2);
-		if (ret < 0)
-			goto abort;
-		ret = (v1 | ((v2 << shift) & 0x300)) * nct7802_vmul[nr];
+			return ret;
+		ret = (v[0] | ((v[1] << shift) & 0x300)) * nct7802_vmul[nr];
 	}
-abort:
-	mutex_unlock(&data->access_lock);
 	return ret;
 }
 
-- 
2.39.2

