Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64842198A10
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523770; cv=none; b=GA3FMGTLhgVnvc3lquuDBD+tpxXDYBqJRb97RQvrI4yzShHga9Rw4VM1+yQuH0bxihzmY7jLesVdi9egPdE+g5HO4MaemY/PkOpioPqZt+tgf3e3RPW+r+cwDunhlXsL27WQSuR01D0X9L58cGKaW9jdokM4YXnNzQrpwJAh3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523770; c=relaxed/simple;
	bh=czQRo5n2OpOOBzHXJUNeOtPfQZNe78muTTFNCcOHRzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UKcmFmncTaL8JejJqIsMN1dpdPSf5AlmT41nqcnGAKnWWQd1pMhIMdQxOn/cty1zFo1vsmYwgS/9yptLr9dJuudIeFIkvtBcoub3qQ2tC2v2eot1dB6xiVL0qmZoz/P4EfvUlZdmGSQzhKacqrAXetXBJCXj7AQByd3eoORd7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaHJ7iQe; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaHJ7iQe"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso6109432b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Aug 2024 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722523768; x=1723128568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWKzig5pf01PlSBu3e8F4D6XxwfVIYNrVD3oMGmQhEE=;
        b=FaHJ7iQedlfTvzmlmIulfdEZSWP0hyX+W0BQuwJA2pWzA1y1OoWJamdlWFSkcORHCp
         mZIfB6obPHouz/h/ciYI0rRRoYK8Y64bNFEhJOJT+z+UkS1R1V08QwRWCvzQs6wyIRsg
         286YGrLye2XjU/ekMrJIKuOsLeZhpn+3Mj8TjZHACigprbLUxgeVtTHsWwxxxB0gsRfj
         2gttRszTZRq46yZQXgCkZ/OsQsc9IJ9Kzh3z4efPUM7XZqsoDM8z3Rq3MNBQaG7F3I8B
         ycOqwBEsG+Mu6zpnMI/eCLCrnrA/cbkj3MDk3vJm1vidO4OrNg+0033Gbuv8DWyaaESp
         qb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523768; x=1723128568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWKzig5pf01PlSBu3e8F4D6XxwfVIYNrVD3oMGmQhEE=;
        b=g7V1YiYSHRzOouT0tFjJ2Aetoadf9pHi1uL1hkJOQo7Oo/kq0YdFWpRq2lffqsVFbf
         Sk5PjoQQ18AtS9jiiQbXeSGjeGMe35/S78u+lQR0xOKukPIeLzrw4cd+WO2Fggci8Bs5
         nHQGFyyU1C0YeotXznsRZ3jOtcnNDayp3OvIyFpCN0Xh6p8xjCUXp3PGukonv6yUHlK8
         R5sHlJRp7oH+D2MtRLdfBcGWmy2LshqC5F1chGIlhp/LANPApN3JV+VaDv3Ycj2hkIq7
         3/1uL3sBeyWLyivxwxmWGUVV/5bS5F3ehu/wANh6djzf3jwQTfpgkSCddqG56fomPjo/
         DCyg==
X-Gm-Message-State: AOJu0Yx1vTY+oocjgZ81atIcl37UnWkB8kzuwgdZbpvx12JndMVZvtkH
	QAaHrNSiIhBSfuxcmSBJEZowBE/KGBU9g4awNmYP2XdfqSWxOzJsnpG6zw==
X-Google-Smtp-Source: AGHT+IGNEtN/Uvy7KS07RKJ9TMqfgT6QHlOi7d5EA7zpWjlOhgFTsDyw0EUt0IDXKbPiaWjSncLu5Q==
X-Received: by 2002:a05:6a20:a11f:b0:1c4:944c:41e2 with SMTP id adf61e73a8af0-1c699683bdbmr679907637.51.1722523768177;
        Thu, 01 Aug 2024 07:49:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4064e4sm3477681a91.9.2024.08.01.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:49:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/6] hwmon: (lm92) Replace chip IDs with limit register resolution
Date: Thu,  1 Aug 2024 07:49:15 -0700
Message-Id: <20240801144918.6156-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801144918.6156-1-linux@roeck-us.net>
References: <20240801144918.6156-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip IDs are not used by the driver. Drop them. Use driver data to
store the limit register resolution instead, and use this information
when writing temperature limits to improve chip specific rounding and
to avoid writing into unused register bits.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm92.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
index b0179d72b779..5ff45a0033f1 100644
--- a/drivers/hwmon/lm92.c
+++ b/drivers/hwmon/lm92.c
@@ -43,8 +43,6 @@
  */
 static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
 						I2C_CLIENT_END };
-enum chips { lm92, max6635 };
-
 /* The LM92 registers */
 #define LM92_REG_CONFIG			0x01 /* 8-bit, RW */
 #define LM92_REG_TEMP			0x00 /* 16-bit, RO */
@@ -66,10 +64,10 @@ static inline int TEMP_FROM_REG(s16 reg)
 	return reg / 8 * 625 / 10;
 }
 
-static inline s16 TEMP_TO_REG(long val)
+static inline s16 TEMP_TO_REG(long val, int resolution)
 {
 	val = clamp_val(val, -60000, 160000);
-	return val * 10 / 625 * 8;
+	return DIV_ROUND_CLOSEST(val << (resolution - 9), 1000) << (16 - resolution);
 }
 
 /* Alarm flags are stored in the 3 LSB of the temperature register */
@@ -99,6 +97,7 @@ static const u8 regs[t_num_regs] = {
 struct lm92_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
+	int resolution;
 	bool valid; /* false until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 
@@ -159,7 +158,7 @@ static ssize_t temp_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->temp[nr] = TEMP_TO_REG(val);
+	data->temp[nr] = TEMP_TO_REG(val, data->resolution);
 	i2c_smbus_write_word_swapped(client, regs[nr], data->temp[nr]);
 	mutex_unlock(&data->update_lock);
 	return count;
@@ -201,7 +200,8 @@ static ssize_t temp_hyst_store(struct device *dev,
 	val = clamp_val(val, -120000, 220000);
 	mutex_lock(&data->update_lock);
 	data->temp[t_hyst] =
-		TEMP_TO_REG(TEMP_FROM_REG(data->temp[attr->index]) - val);
+		TEMP_TO_REG(TEMP_FROM_REG(data->temp[attr->index]) - val,
+			    data->resolution);
 	i2c_smbus_write_word_swapped(client, LM92_REG_TEMP_HYST,
 				     data->temp[t_hyst]);
 	mutex_unlock(&data->update_lock);
@@ -311,6 +311,7 @@ static int lm92_probe(struct i2c_client *new_client)
 		return -ENOMEM;
 
 	data->client = new_client;
+	data->resolution = (unsigned long)i2c_get_match_data(new_client);
 	mutex_init(&data->update_lock);
 
 	/* Initialize the chipset */
@@ -326,9 +327,10 @@ static int lm92_probe(struct i2c_client *new_client)
  * Module and driver stuff
  */
 
+/* .driver_data is limit register resolution */ 
 static const struct i2c_device_id lm92_id[] = {
-	{ "lm92", lm92 },
-	{ "max6635", max6635 },
+	{ "lm92", 13 },
+	{ "max6635", 9 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm92_id);
-- 
2.39.2

