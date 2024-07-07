Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986D2263A
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jul 2024 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363661; cv=none; b=t69p7KD1nLRRO11Yb49lSXwl9ZpWAJzZ2XaRsFAM8f1g6FQAnOfNu2H3/1LGHzD/fL+Kixt70u3mP4gEgRqbKx5pAXl5+mDqXUwyGr6TVZY1EDzs6j+vTkd26MFFZxP5KBDvPZUjnf7WYaRf9XqMlmTaUF6vWH0UoLxBbdCJOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363661; c=relaxed/simple;
	bh=U/oN48LnusEKS0cwQHrYQmZfyy+w2xjXS9PZSQxnZ3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDjiG2IlqgdGK6nSfh5w5KwB9q0pIklTe7q/84qrBZUmhqvlBBht4kVeRDagpbjDkt7Zi1x15fPL8YIi5c56Otre37BsTRvPAiduMk1ebOcWWoj3us3TsfM65JEU/TNVKX7NaD6oEivp7Yaf8gsQ8Stl4FogT1klo+H4pG1t3FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ4draT8; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ4draT8"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c8517aab46so2268897a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jul 2024 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720363658; x=1720968458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tE900apGoG5K8RVzmYNJWODr1eZ3+rfBsCAtQZIY98=;
        b=SZ4draT8SZQUGlJdTqsg50Bk7IYS0pFQe+rmHy8D7TU79DPyazskTyJjzjLa5EUn/g
         /y6HnFpJScIsnhudWfMuVdDdmCUpzCu1ALnYbXr4AfMByTsLbbALLOwUtM9AR+xdzxO2
         zEYeSQuJGHkyemwutFvIy2Eu6A11nD4TW03VCoFhEGUlujyEG6pFhyahxMwSEhgNksEq
         Ker1jaxjAbaG/m/poATdVrPFXCyk1f658T93COonr1eTFc4sozOtWdZq0joHmJgOpkxt
         i6Farf498Fe6mwMDJJuv/OHh4rmobdQD+G9iNDTVakCsb2UXuRaRWOP/OPJlFGeYL/pt
         eBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720363658; x=1720968458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tE900apGoG5K8RVzmYNJWODr1eZ3+rfBsCAtQZIY98=;
        b=dcnDUXPCWzHi4ZEkJ0N/eqollzrTWKSR+Aq4C5tiJAGIuL1Y3t9MZOtfP92NizqKRF
         +q3nTsRxuHVsz1rZgBRrSyNj60awHbqg5kuPzQebqmHL+nTLS/RNalE/y6QQ/G273YkR
         2q2BoeJw8xAaIjwuzEF2D51tp0T5UhpzGJUIq5ido+zP2+XLnIpjLNgjSDtyCDGbCHfT
         jmzDq6TzIl3eBWY6nHKCBQ2N49qO/bPOQlrFva/X8ZthVv8thXteVMVkjJa6oFcVAaI+
         50auU61eb2kkuwP2nVrceHLV5chjjPxTVoEwP3KSrgFbkFz9vBhRQrk/fPFjRgV8ExQP
         rpVA==
X-Gm-Message-State: AOJu0Yzzb6F6w/OqaWz0lGBeSWclu8r2JKPgrZHuw/lHM5Zsx7jWFecQ
	Jy2W77/+JNX1Fb15XQa0rDCHIOkOFmd3QnL3B2zwLyjg6u6BvJN01wwY/Q==
X-Google-Smtp-Source: AGHT+IGgURUunbjqy5kFRY0tgNvEV1b0sw4LmFMPBVsLR0z4ef2pOAKLdp9TssgkarMeYJZv7xiPYA==
X-Received: by 2002:a17:90a:69a5:b0:2c8:5cb3:42b6 with SMTP id 98e67ed59e1d1-2c99c5057e5mr7343132a91.8.1720363658013;
        Sun, 07 Jul 2024 07:47:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a97a7d8sm6540656a91.22.2024.07.07.07.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 07:47:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (adc128d818) Fix underflows seen when writing limit attributes
Date: Sun,  7 Jul 2024 07:47:27 -0700
Message-Id: <20240707144730.1490208-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240707144730.1490208-1-linux@roeck-us.net>
References: <20240707144730.1490208-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIV_ROUND_CLOSEST() after kstrtol() results in an underflow if a large
negative number such as -9223372036854775808 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adc128d818.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 8ac6e735ec5c..5e805d4ee76a 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -175,7 +175,7 @@ static ssize_t adc128_in_store(struct device *dev,
 
 	mutex_lock(&data->update_lock);
 	/* 10 mV LSB on limit registers */
-	regval = clamp_val(DIV_ROUND_CLOSEST(val, 10), 0, 255);
+	regval = DIV_ROUND_CLOSEST(clamp_val(val, 0, 2550), 10);
 	data->in[index][nr] = regval << 4;
 	reg = index == 1 ? ADC128_REG_IN_MIN(nr) : ADC128_REG_IN_MAX(nr);
 	i2c_smbus_write_byte_data(data->client, reg, regval);
@@ -213,7 +213,7 @@ static ssize_t adc128_temp_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	regval = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
+	regval = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
 	data->temp[index] = regval << 1;
 	i2c_smbus_write_byte_data(data->client,
 				  index == 1 ? ADC128_REG_TEMP_MAX
-- 
2.39.2

