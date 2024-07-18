Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59722376EC
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273991; cv=none; b=bWBCXEP0gKGHRFsrkROXGi5XTgEbgQMTpZKXNtteydmQs5dN3zUSV15+9R42Ov4IGK30ukxcgvRRABbSGMQSnsTUfH3JM4jiVRIFDslCOGG0KmknLLYJ+5pEuRUFyd1KwToYlB/evF0OeD1n0xISo23xxNFbC+rXUrgHLwfMAHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273991; c=relaxed/simple;
	bh=ZSUKnyPagFPXGvQh5AWOfjDC/CyVQKLPsGjkfl+fpbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h8uXi7gCL4WmkNhEZGsU8Drf0B8AchY5orx/pX6AtYiL22DkruXbNqewfkFylqa7lohQbMdEMZ4wmhqnjkyNLqpYhXPa4Skrj21JeGmqaUgC8s0ODpUxwqtEGkUTBkw1/w33/AKxMPLBJB+J696KPiuuCOdAJu6OgmjKlSoAr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESw6Pvwb; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESw6Pvwb"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so165475a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273989; x=1721878789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FwDj35630PyXblV66255RUUtmvKovzhDSAYap7udCQ=;
        b=ESw6PvwbtAeC81nVaGDNOOCS86Q2Rz2JFcKMkYDv9gUIHJtccbRfjrewh4s3Pkb4yo
         3PvMU89gGCseZ9nBPnf4Krzq7flPxJXbaAq2//8T/r/DR4olFgFbd73rrOFvijdErqpU
         ImCk6QRfjx8di6a0sxuSU+2NQmMJvGyMwniDxRp+F3OMA4O//axw/OBYcc6ixadXQS5J
         Otu7i5wUbpQgatwjEGkCHtd3Jxd4/04VQiAl/pa5YRmHQCLWsplRKLevPM18QpKAZQ2x
         thjqaMv/ljvhRIlIjWphle4CaumNVLTimdMbP+krtRo4c3IKgzx2gzuJnSjJuaeP7rpL
         /+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273989; x=1721878789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FwDj35630PyXblV66255RUUtmvKovzhDSAYap7udCQ=;
        b=BAjT3qQoaM3nTLwWqWAyxsg8mp9XC6kk+uAfOsO/6tlqQ5sWOJc65jvoSpFvh/uW9B
         9IhPOVL0aU4VaRu/v8ODZTj4YHySjjR6NcKbi9lEIq8d+yG3uYRWoPglK1JKRupQqnp1
         n/Lqo2FcifV8PD+IFx0jFQPD08KBoyRAjY6+6e/3YY+3bAq08runOavI3SgjZwWSfjIm
         pY1uUkhlRpy2G4/CAaez6MazzyN/e0/idPiCcpXfXRdKxo+Jy867MGji2CqquUrFhIwX
         5zS3Qgi0Zfv3Fc3/0LKc7kXjnhzaxPWrWptIWTWomP2vcm+Xz7MfliK/mfwQqaPJyu51
         ip3Q==
X-Gm-Message-State: AOJu0YwCswwbiwh5WElBMIaMSKupU6WujsOpNAV+Qk4p3VpUYOU6JCSy
	LC1ZFjQo9tsVi5fa7AUDXlYIXLalsND/W2BC4KudmSYZCUGyHgzH4nSciA==
X-Google-Smtp-Source: AGHT+IHqsb8El+N0+M0yJhkr82Q3pReNuwDkrJfRxWEjQO/ozVDX34UyaMGrDKHKn50wySGZeLozpQ==
X-Received: by 2002:a05:6a20:748a:b0:1c0:ef1c:b80 with SMTP id adf61e73a8af0-1c3fdd781d6mr4393360637.52.1721273988976;
        Wed, 17 Jul 2024 20:39:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb6017b923sm733216a91.43.2024.07.17.20.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (lm95234) Use multi-byte regmap operations
Date: Wed, 17 Jul 2024 20:39:35 -0700
Message-Id: <20240718033935.205185-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718033935.205185-1-linux@roeck-us.net>
References: <20240718033935.205185-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use  multi-byte regmap operations to simplify the code
and to reduce dependency on locking.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 45 +++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index f0df1134f811..c3c68c196479 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -60,54 +60,45 @@ struct lm95234_data {
 
 static int lm95234_read_temp(struct regmap *regmap, int index, long *t)
 {
+	unsigned int regs[2];
 	int temp = 0, ret;
-	u32 val;
+	u8 regvals[2];
 
 	if (index) {
-		ret = regmap_read(regmap, LM95234_REG_UTEMPH(index - 1), &val);
+		regs[0] = LM95234_REG_UTEMPH(index - 1);
+		regs[1] = LM95234_REG_UTEMPL(index - 1);
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (ret)
 			return ret;
-		temp = val << 8;
-		ret = regmap_read(regmap, LM95234_REG_UTEMPL(index - 1), &val);
-		if (ret)
-			return ret;
-		temp |= val;
+		temp = (regvals[0] << 8) | regvals[1];
 	}
 	/*
 	 * Read signed temperature if unsigned temperature is 0,
 	 * or if this is the local sensor.
 	 */
 	if (!temp) {
-		ret = regmap_read(regmap, LM95234_REG_TEMPH(index), &val);
+		regs[0] = LM95234_REG_TEMPH(index);
+		regs[1] = LM95234_REG_TEMPL(index);
+		ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
 		if (ret)
 			return ret;
-		temp = val << 8;
-		ret = regmap_read(regmap, LM95234_REG_TEMPL(index), &val);
-		if (ret)
-			return ret;
-		temp = sign_extend32(temp | val, 15);
+		temp = (regvals[0] << 8) | regvals[1];
+		temp = sign_extend32(temp, 15);
 	}
 	*t = DIV_ROUND_CLOSEST(temp * 125, 32);
 	return 0;
 }
 
-static int lm95234_hyst_get(struct lm95234_data *data, int reg, long *val)
+static int lm95234_hyst_get(struct regmap *regmap, int reg, long *val)
 {
-	u32 thyst, tcrit;
+	unsigned int regs[2] = {reg, LM95234_REG_TCRIT_HYST};
+	u8 regvals[2];
 	int ret;
 
-	mutex_lock(&data->update_lock);
-	ret = regmap_read(data->regmap, reg, &tcrit);
-	if (ret)
-		goto unlock;
-	ret = regmap_read(data->regmap, LM95234_REG_TCRIT_HYST, &thyst);
-unlock:
-	mutex_unlock(&data->update_lock);
+	ret = regmap_multi_reg_read(regmap, regs, regvals, 2);
 	if (ret)
 		return ret;
-
-	/* Result can be negative, so be careful with unsigned operands */
-	*val = ((int)tcrit - (int)thyst) * 1000;
+	*val = (regvals[0] - regvals[1]) * 1000;
 	return 0;
 }
 
@@ -209,7 +200,7 @@ static int lm95234_temp_read(struct device *dev, u32 attr, int channel, long *va
 		*val = !!(regval & BIT(channel));
 		break;
 	case hwmon_temp_crit_hyst:
-		return lm95234_hyst_get(data, LM95234_REG_TCRIT1(channel), val);
+		return lm95234_hyst_get(regmap, LM95234_REG_TCRIT1(channel), val);
 	case hwmon_temp_type:
 		ret = regmap_read(regmap, LM95234_REG_REM_MODEL, &regval);
 		if (ret)
@@ -236,7 +227,7 @@ static int lm95234_temp_read(struct device *dev, u32 attr, int channel, long *va
 		*val = regval * 1000;
 		break;
 	case hwmon_temp_max_hyst:
-		return lm95234_hyst_get(data, lm95234_crit_reg(channel), val);
+		return lm95234_hyst_get(regmap, lm95234_crit_reg(channel), val);
 	case hwmon_temp_crit:
 		ret = regmap_read(regmap, LM95234_REG_TCRIT1(channel), &regval);
 		if (ret)
-- 
2.39.2

