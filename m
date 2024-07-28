Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653DA46450
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177453; cv=none; b=H43x2Mhmz+DGzOLr8/zo7dO+x4AxrmwnHQjlYXnAbsC6R+7FI5RRm/hOXOyGLm/EZQjWZtRv+NjmLfTF1xfgnzqS5OsWxEdmrKMnWi+cr3jVOoJL1wiIB3KdXsfqBmDaovqi44K0v6b2LvG5joMFriCOPCeslaFpQaLOy15xLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177453; c=relaxed/simple;
	bh=n7dxDWZkvVGcDslpXlD9Aw6nvSeYRJCovMYgIAtELvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVWlZHIyi8Uzl06OXcBAGNNqOcS/RMGjNbWAqy0xg+hrJEkQVEii2x4rHaqY6sBoQjWQkG4EWKim4mlPD2BWtum3wFDzCx7qsMtVXKxibN0f5aVHEwXMQKPPrR5IVObaTOZW3Jyaei3lIc9TnLYRzLxolfhvpqb52K9zU+wzIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwH2fznM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwH2fznM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70eb0ae23e4so1631321b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177451; x=1722782251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya1VRGoZXIlKGrH/+4sFGocnj0StupJrhjkbuPt1dC4=;
        b=fwH2fznMSvvli/FdlOCBlFETiCt4bqoUQi3JodlD8osjVRlZm1ZQmXCkQYskikGZyE
         3dK+xiJizB4YaBkx3bm4b/1D+b+myYF/aBqI9jMuE+jDajwa/PlL2u8fEMe5IKi0I4+U
         Nw0DsBfCwNA3bHbY3tX7f6Hg0gh5t4mMrQjRGVMm2DOJuPDk+IM96NRA3EsYp7Ov9ncr
         1mY00fVRk+Ys9nFyv/6nw4/5TNE72HGgsBKmmtqgAojM2ZIRmNEfKDwEaXjcCZkIfSd1
         JIFXo7hkcO5rNNFF/u4/qEfV7nwY5BvJWKvBH+GOhkBlFPFArdOgdPACTAdesW+QVFfT
         tiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177451; x=1722782251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ya1VRGoZXIlKGrH/+4sFGocnj0StupJrhjkbuPt1dC4=;
        b=FSgXstQ1sIs2awBwDEYcVjY8X/1enKsZUpOr/9CrCZCIXbibHkJ94sNAkYAj9n4hSF
         /ndsOTG+BAhEhnTlcPGKyBPoZ32CVMRzv1hnjTOFO6yD9gx7j/3zb+peF1mgRekZT+hh
         zr5KxaRrQCcXH4K0K3Z3QUSsN7lfT9voVZ6wfg0mRwBYoTQ2sQHKdiRHil32lxiamKEB
         ii/jTi/RcT1LzJBf5aCVpptPdqAt6PZWbZ80kmK8yXb/w3kE1s0VpHk7pLbUu8rrkeJe
         flukgNzznqWYRAbiQXzMn/M173M/RKSd/OrEsBmBRptxeJyJVYk83s+AaWl1Uw5XVRIL
         8cQw==
X-Gm-Message-State: AOJu0YyQTJSQmYMWllUEyBUbJ2yM2M54VekZD2gxvYMAMe7TvHbE89mV
	J1a9Qi+5F72ojxRJL4kqdOKb5sabg3o+YqiwrJi6RFM/oBZaGXPiJvcZLg==
X-Google-Smtp-Source: AGHT+IGGSGsdX3P40OJXeMwys6NxFnM0NQc2N+1Ykze/oJHkQf77lRQMeZkNqIm/7/Wok45BUCJcOQ==
X-Received: by 2002:a05:6a00:17a3:b0:706:3329:5533 with SMTP id d2e1a72fcca58-70eced9bbb1mr3785956b3a.24.1722177451114;
        Sun, 28 Jul 2024 07:37:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9fa5a0bcesm4869969a12.89.2024.07.28.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 7/7] hwmon: (max1619) Improve chip detection code
Date: Sun, 28 Jul 2024 07:37:15 -0700
Message-Id: <20240728143715.1585816-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728143715.1585816-1-linux@roeck-us.net>
References: <20240728143715.1585816-1-linux@roeck-us.net>
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

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

 drivers/hwmon/max1619.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 69d3156fa2ba..26ffb21daa3d 100644
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

