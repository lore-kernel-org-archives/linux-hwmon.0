Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE2432E79
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785747; cv=none; b=f9aZqn6GmZhwySNg2kfw1ltMb2YXQAFWSkR1xKVjaBxP7hshWW8FC5h7/R6ZsesaiObjyFTOo5EBD9PpbI5rSdfrVOUb2xbHTZ1c7k1axLNf5Xqa8LLEeV2vx0NKtU/fiJ2my7+VsiZaGi1K5L5dRgQAx3qPLfrzYI2JEUqEZII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785747; c=relaxed/simple;
	bh=EDJi3G2iuY3agtVvxGBhFJAeIAggw22kvxgsMO3/yh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXnyeNLberJWEXii9/+JR/hV2ud8bmZ2lfhF9w6xA/ai+a6IuPLr23IlRmftRbUohcUeATBVVAH+ub142Nzhffxo8zGXfWLEwo8NB3DLMWgFZhyC8Odj0nmGhhhkstH9bbDjRrnsUM0JTT3LepRh+3rF42HqITRstv+NtkmvnF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5EjMekN; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5EjMekN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848d21bbaffso4140496b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 12:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785745; x=1786390545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lwPDISFjBtCIFn+Df0Pv5ce4f50Hi5gIYmt++nANgic=;
        b=U5EjMekN0XhMyJJcvo2D7XOfURlBBcGjlP/A7T/z5VKbQbH8pn+du7fv+gS2rVmW19
         IjZM5nTpyyw4CM5SruMmG4tONU1vVcuLFD/TEbD2tF6kUp48lqlx7w4OoH8EHffYhxYE
         TgYMNGoA7jemXljVbzQBpjZRL16K7iUdBFzzPfITe49lnfnjk3TuPh4zri5Oyem7f1JT
         XfTNqD0F4e1XX3kYihSi6eiky/QUEG5lYhxOH/GHPudQLSANhE2dPo8bdKw4aabmqgSl
         hcvkLeAI4zlJl79NEi50Hk38R5pj3jiy1RFIHRn8EvZH/5KhlYDiXRFZZrMKdbSkIEwP
         mSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785745; x=1786390545;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwPDISFjBtCIFn+Df0Pv5ce4f50Hi5gIYmt++nANgic=;
        b=J+Xk2zC2TOuTo5qS8vjOcHIty2wEGFE/BPkkfXlVjeu7jzMbIRL+ZicOHZDwZsPido
         sAQpLW7kjyHaJ9ek0GsST/G4B4MLRjHq0BNFGoudFE3718AQ2qu4KQwYR9GBQIJJZiF1
         RRauSIBJscsAGlqbMr0XderyoR036mdaGVx7Qq2cBIoq3ThmHBQ9v6Wwll+lY1nwhT0n
         rgXI7Edp73KxT8DUdtibnEvAwh/XdvgUvBMnUokfnAQmpuSeVIg9KFhvN3rm+FbOk3kh
         0LBdYvyx+5DGhNRifL+4JyYn8Pl+q8GSf+0/T07jGkqDyg9tSrNbc4Et4Jvt+9dfY+HB
         tjvA==
X-Gm-Message-State: AOJu0YxTEQwBvp+/Nru01ZekDNXnT0W43loEGXD54jloJzfmZRZtdnxH
	DB4ndq8l/noUm4V+oezVLVr/xmiCzrXp6PpEGBmtDJG3HA6fUeeFcsdep9q48A==
X-Gm-Gg: AR+sD129+9GAve0vrjBB8AT2SVsENT+0izSzmMhfizR0Savmi35DAsXHLyhsTH4mrWt
	WAX09xRha4CQ8XEKZFm12ZE+wj4Uzwz1YxupqorVFmJmEP9LL6AUTEXrkpKHBy4dSRkoRNrBw9m
	sEMaXAQ+KsZlZ5jnQxiMrlr4inLYV+R6Usl7PirToJjSuQ9Xr0BZJNrXFPRT3Ay5nEpUMy7goTO
	Ajqm0hsBCiOFLs2UaRIP34gs/TDcJpsc4wq0pR3uiO1cMFAkI/MMHD+O1MwJTFtU0J58Hz3rw0h
	O+wHDrEc2gx3oDODDdopaIM9Co9w5gkFzDDybDN57yH1EF/Tida0ETIWDMQYtKndt899I3Mdyws
	64s4gn1C3JwAgppvCNKE2DaUt3yGA2/rS8YXopPYa0hJUr1pqQYdgNUUh+ADUAZNHRIJRb4D9LX
	+/eCjW6LNIjg7IuR0C0ihw0J2OdyMOhWDzHP0VU1zqVcy+UwVNpps0O/Mw5S4iPDtLoo6UaqlG0
	g==
X-Received: by 2002:a05:6a00:94c3:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84ee48d5576mr10467536b3a.36.1785785745228;
        Mon, 03 Aug 2026 12:35:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc51cac8sm4143035b3a.56.2026.08.03.12.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] hwmon: (pmbus/max20830) Use pmbus_read_smbus_i2c_block_data for block commands
Date: Mon,  3 Aug 2026 12:35:34 -0700
Message-ID: <20260803193535.2286578-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803193535.2286578-1-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver tries to use both pmbus_read_smbus_i2c_block_data() and
i2c_smbus_read_i2c_block_data() for PMBus block commands.

Use pmbus_read_smbus_i2c_block_data() instead to simplify the code.

Drop the functionality check to simplify the code and to trigger a return
with -EOPNOTSUPP if SMBus block commands are not supported.

Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/max20830.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index 689fc6f0fe01..4d25a084af09 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -101,36 +101,10 @@ static int max20830_probe(struct i2c_client *client)
 	device_property_read_u32(&client->dev, "adi,vout-rfb1-ohms", &data->vout_rfb1);
 	device_property_read_u32(&client->dev, "adi,vout-rfb2-ohms", &data->vout_rfb2);
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA) &&
-	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
-		return -ENODEV;
-
-	/*
-	 * Use i2c_smbus_read_block_data() if supported, otherwise fall back
-	 * to i2c_smbus_read_i2c_block_data() to support I2C controllers
-	 * which do not support SMBus block reads.
-	 */
-	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
-		ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
-		if (ret < 0)
-			return dev_err_probe(&client->dev, ret,
-					     "Failed to read IC_DEVICE_ID\n");
-	} else {
-		/* Reads 1 length byte + data bytes */
-		ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
-						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
-						    buf);
-		if (ret < 0)
-			return dev_err_probe(&client->dev, ret,
-					     "Failed to read IC_DEVICE_ID\n");
-		/*
-		 * Moves data forward, removing the length byte, this is to
-		 * match the format of i2c_smbus_read_block_data().
-		 * Also adjust return value to reflect length byte removal.
-		 */
-		memmove(buf, buf + 1, MAX20830_IC_DEVICE_ID_LENGTH);
-		ret = ret - 1;
-	}
+	ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read IC_DEVICE_ID\n");
 
 	/* Verify we read the expected number of bytes */
 	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
-- 
2.45.2

