Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92717F4FA
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091117; cv=none; b=MgQsfDhC+oAcJtLOdy7pBqrGPf2P63W+2HPz3iN1Z3QS0eBR4xocG3mRr0iXGqpa6uwYMuBewpw/aHKg9IEFttgIlQlzxZPyDnpfbK+kaN+mk4uVI6uEfhbMKo5McSSs9FUY6Zy2BIXNvg0F5t+qQ67oLhqeo97/fck+22TPMJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091117; c=relaxed/simple;
	bh=RSvztWsFC8r+hApjT51Ztdy0YP6vZiSrufocsnKTE8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RE468sYfSkFaNUrH8SImPnFh8axcH7z/fjm8WBqC50FA2I0e4rpGG74ZS24bockfS988TrgmEdfgYOOJ4Gw1NXzOzhh3SCCazek12a/3drL3zTa8kEdxWE50tUYUXHcOXjaf+zNr6/NFYGryBxYHWnXl1c8wqMDPPwUSxz6wG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRy0B71/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRy0B71/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70b703eda27so1220336b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722091115; x=1722695915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftpkBdMptxPsjLxu2uLiHpkSFlQTD+VnwsJlH+CgPTg=;
        b=DRy0B71/IRxI26WHSXNJfc8TEPKYddoIkymTdQLfgeWBmSCqAjAHA8uYxziZJ3Ztl8
         Zf/Kk+4Onf21Ilf2nPb0wl0D0y9hhVkTBmlba1OZgYAcVScMVJPNqZVM3vOoKjY4T35W
         ILRWBJkja/FPlU9balntC9l34Xr0jXI0f19LpShkr9Fn96hKi0gKxj1GI1I5pNWppG2A
         4SuGXVMdlMeMC8Ic70Zdrfhy2bDtQ0CK7Gc08g6Ye26wykeSNSGpiqExOhbXqeRwitXV
         hI3P5q/7vxTwXVAo4rjrbcc7LfHTeWYJcJbpTYuGFoyc+SAzExe4tvz9itMhC9dIe9rG
         l0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722091115; x=1722695915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftpkBdMptxPsjLxu2uLiHpkSFlQTD+VnwsJlH+CgPTg=;
        b=GpA6AjnxtBwtZIkD/3UTP7j8+XvWI7uQmMBDyf3R39FYcW1e8nVrdU+VStP3f5fV7p
         hSAeqFLyhPB0seFUUH56l3Nst5NAdESceV2ERoW7nBlcDO/cmi8HPO/NiLq0ZkcyzjIt
         Y3fuZXmBa8g9b/zC2PI0PiIPhnPuPe6vtJk4ELI0lWaFulvnRH+fd6j/PE3Xb2eCOm2c
         Ud3KsplrIuGX0vJQMdn+3ltIosyyYY8ZH97zXkjyXonmk//YzFTtIh0Rip7lv4hlEaF2
         /PtlzHgBeBVRFlbPrTOofXXKtPLH+dV9eGFXQgk6JgHYsJUu7ptWVGt7J/Q1zGoFzApW
         iNnw==
X-Gm-Message-State: AOJu0YwPsKkCYB7TAD7/Hn3cOAdao6FnyvUwsMVKbItIrdCm9goRXx3+
	h0J95Tu6wDHqN4Ingdrm/kvnRuKaaUIN8ltRmckTkIBeO9/18Z9U0tGFkg==
X-Google-Smtp-Source: AGHT+IHu7g3McASfrvoZSL2Pjv4HpXHtBi2s5lJup9tEVFNLORduHtIxwdIKVDZN05tdvijHSD+jsA==
X-Received: by 2002:a05:6a00:4651:b0:706:34f3:7b60 with SMTP id d2e1a72fcca58-70eceda1d57mr2381409b3a.23.1722091115081;
        Sat, 27 Jul 2024 07:38:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a3a86sm4221091b3a.205.2024.07.27.07.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 07:38:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (max1619) Improve chip detection code
Date: Sat, 27 Jul 2024 07:38:20 -0700
Message-Id: <20240727143820.1358225-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240727143820.1358225-1-linux@roeck-us.net>
References: <20240727143820.1358225-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bail out immediately if reading any of the registers used for chip
detection fails, or if it returns an unexpected value. Drop all log
messages from detection code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max1619.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 40f0726e9f22..9cbca17f27a5 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -260,31 +260,27 @@ static int max1619_detect(struct i2c_client *client,
 			  struct i2c_board_info *info)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u8 reg_config, reg_convrate, reg_status, man_id, chip_id;
+	int regval;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -ENODEV;
 
-	/* detection */
-	reg_config = i2c_smbus_read_byte_data(client, MAX1619_REG_CONFIG);
-	reg_convrate = i2c_smbus_read_byte_data(client, MAX1619_REG_CONVRATE);
-	reg_status = i2c_smbus_read_byte_data(client, MAX1619_REG_STATUS);
-	if ((reg_config & 0x03) != 0x00
-	 || reg_convrate > 0x07 || (reg_status & 0x61) != 0x00) {
-		dev_dbg(&adapter->dev, "MAX1619 detection failed at 0x%02x\n",
-			client->addr);
+	regval = i2c_smbus_read_byte_data(client, MAX1619_REG_CONFIG);
+	if (regval < 0 || (regval & 0x03))
+		return -ENODEV;
+	regval = i2c_smbus_read_byte_data(client, MAX1619_REG_CONVRATE);
+	if (regval < 0 || regval > 0x07)
+		return -ENODEV;
+	regval = i2c_smbus_read_byte_data(client, MAX1619_REG_STATUS);
+	if (regval < 0 || (regval & 0x61))
 		return -ENODEV;
-	}
 
-	/* identification */
-	man_id = i2c_smbus_read_byte_data(client, MAX1619_REG_MAN_ID);
-	chip_id = i2c_smbus_read_byte_data(client, MAX1619_REG_CHIP_ID);
-	if (man_id != 0x4D || chip_id != 0x04) {
-		dev_info(&adapter->dev,
-			 "Unsupported chip (man_id=0x%02X, chip_id=0x%02X).\n",
-			 man_id, chip_id);
+	regval = i2c_smbus_read_byte_data(client, MAX1619_REG_MAN_ID);
+	if (regval != 0x4d)
+		return -ENODEV;
+	regval = i2c_smbus_read_byte_data(client, MAX1619_REG_CHIP_ID);
+	if (regval != 0x04)
 		return -ENODEV;
-	}
 
 	strscpy(info->type, "max1619", I2C_NAME_SIZE);
 
-- 
2.39.2

