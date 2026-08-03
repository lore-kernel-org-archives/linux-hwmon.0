Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD540F74F
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785746; cv=none; b=ayGuhSb44JejjP3WX6ir6ALrCqKFEcNd+IcUAVDezmGQXX32KIIv/5Ga0p3f2uGBVTAbJRyJEpt/Uz2MTplekmWhu03m/Qz549NnaKJbrKO+5a8Lp7sc+CfHUXQEDlbSxycBooDs31J45aMR3F7EtygO/qK1GUeAINOx2J3PUMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785746; c=relaxed/simple;
	bh=wND+tPSSpB4AkGWI5xLoeWDWDg2SIPsB9NV+4gN6baA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyobHOyytfotfx4+80X4ANp+nWtc3QpQYHKjdNXAbYexFidoAwE1Qa8VMmxq7qlA0zt62kHyyIIj0iOUnyt6/Atk948OxwtgiUjazRrQFPPIBBtGqtGJgqfQis7FYTVfTNQ57yG8KKwJj0Y4lb6wRJlRYp/X1MGCFnOYNBm30vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoQlNUWR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoQlNUWR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso3262455ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785744; x=1786390544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YW6/uBwbzg9Rbsgd3wCFhrNhPi8+391o4dezPYn8NPo=;
        b=ZoQlNUWRexeAuiKMllMvcopnlhfgelPeS4fzrTs3Ndch6Ih1o8OGAN47momLVb9ALB
         ykLkiIdhD2LGYjDjfyzKJDCKeDPTduZS712SbvR2wgZFOLgQ+9ZrTWTCk67FVrsCzwU6
         qngCK7m2oJ083KuZ1ABUwgtLc8Rha5FIQkSgQOqhk+0L8/5jtTQGXdYH7eA9Uy1H6Css
         lJ8UjoG4iolUsMbg6N041u9aNjzh5vCwQpyFBgVHjKvm4iXusjpsYtIJUMX4rexE7HdF
         jdFhCiKH/M4eR5HEh/7Zzzqc+aVMznfhim+IXVfGa9v90A8alOBAefHv9N0a8gGO4p+w
         bGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785744; x=1786390544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YW6/uBwbzg9Rbsgd3wCFhrNhPi8+391o4dezPYn8NPo=;
        b=VIgw6JFJwkmR5vCSEHAyTTUm8G44hVY1CtX2n1ymDMJumx5eWVMHHoXnWohCvnS5Z2
         KtvSM9R9mUdWJFtiifovr0oMmLbyjS2X90Hx9tOIkEo742/GpEPZXxakKVci+gC3ZC6B
         H1VY/8rf4BdsMiPQrka9x5M6s4Ed52iGvVo9PFAVeKJFLo64A9xn9bH7fL64BToRSNH/
         l3Hp25867ZApwaSfFu6PP1nBmXXT5gwcTGQ12ZeYfHv2hBsnhqYZtjvZZ83jlCGJAJDw
         XV+hUHBDgEXyB9QlZOZAN8S8d+cSHYQBETAL9ztLtYvFHxjaHqvso9zeWy2sl9FVEAlo
         49sw==
X-Gm-Message-State: AOJu0Yyllwn8T9kTvmWpe++Yd/A/E181PqzqNafIVhJqdCGd3nlp2iiR
	TwBlH0vXOZnkUov6a7O2fdxqQaeL6qDZJUSsih3de1unckzsDV2wpfpJZNEjrA==
X-Gm-Gg: AR+sD10qpXtiidmSjsveQaoT0dQ7N4BouLjtjAZ27qr+Y++gZR9Jv8Pa4fQy47oGdKJ
	a6RbCHZv6L9W1BQF9XBr5Gbc2rWDbT1Z8WbdFPoyjzL9NDEWPkbdQ6pOOaob4/VObiQxnfTHSbY
	Z7nBuF7twcAU9sW0rcu3OfNgP277B0/A5DTLWZvz2LaeE6Ah+x7zUMtRfrIkqZF6IarH0HNFpEU
	iCxzRpyy0jyuJf0/DCZaBszlRABi6iwpYmMcTfU3BcCFrZfxdvIBk7VerqnW2AOKOP6xI6y3m9P
	qU/R3UpWqYDqW2iwGaedOAc0RcPt4IKbE/+emyQwa+dUDFobQugJPZL/npRBNIwSLIboIaFb/jZ
	P/sGE7HFTchLscy4V6gq00Kp7uyRjbwIrEB49BdI6CQ7VeO6nLeeMvcDbqL7sCxcFfnZLdUE845
	hV7otsrmA9xfgLL9Nw+jdNN0nfDT4QVdFEP6yQXaItbFABNCMA5rC/LVAM9MJPTyqalO9+OhJbK
	g==
X-Received: by 2002:a17:903:2c08:b0:2cc:bdb9:3c04 with SMTP id d9443c01a7336-2d08ab5dc5cmr6522305ad.17.1785785743840;
        Mon, 03 Aug 2026 12:35:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11e9aasm42701115ad.55.2026.08.03.12.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] hwmon: (pmbus/ltc2978) Use pmbus_read_smbus_i2c_block_data for block commands
Date: Mon,  3 Aug 2026 12:35:33 -0700
Message-ID: <20260803193535.2286578-4-linux@roeck-us.net>
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

The driver uses a mix of pmbus_read_smbus_i2c_block_data() and
i2c_smbus_read_i2c_block_data() for PMBus block commands.

Use pmbus_read_smbus_i2c_block_data() instead to enable the driver to work
I2C controllers which do not support both block commands.

Drop the functionality check to simplify the code and to trigger a return
with -EOPNOTSUPP if SMBus block commands are not supported.

As part of this patch, rework detection of LT7170 and LT7171. The return
length of pmbus_read_smbus_i2c_block_data() may be less than the requested
number of bytes, meaning the return length needs to be checked. Also,
checking for "LT7170-1" after checking for "LT7170" and checking for
"LT7171-1" after checking for "LT7171" is pointless since the first check
will already produce a match, so drop the second part of the check.

Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ltc2978.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 10877b0867fd..aea7b6c93e74 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -611,17 +611,13 @@ static int ltc2978_get_id(struct i2c_client *client)
 		u8 buf[I2C_SMBUS_BLOCK_MAX];
 		int ret;
 
-		if (!i2c_check_functionality(client->adapter,
-					     I2C_FUNC_SMBUS_READ_BLOCK_DATA))
-			return -ENODEV;
-
-		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+		ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_MFR_ID, buf);
 		if (ret < 0)
 			return ret;
 		if (ret < 3 || (strncmp(buf, "LTC", 3) && strncmp(buf, "ADI", 3)))
 			return -ENODEV;
 
-		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+		ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_MFR_MODEL, buf);
 		if (ret < 0)
 			return ret;
 		for (id = &ltc2978_id[0]; strlen(id->name); id++) {
@@ -637,16 +633,17 @@ static int ltc2978_get_id(struct i2c_client *client)
 		u8 buf[I2C_SMBUS_BLOCK_MAX];
 		int ret;
 
-		ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
-						    sizeof(buf), buf);
+		ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
+						      buf);
 		if (ret < 0)
 			return ret;
 
-		if (!strncmp(buf + 1, "LT7170", 6) ||
-		    !strncmp(buf + 1, "LT7170-1", 8))
+		if (ret < 6)
+			return -ENODEV;
+
+		if (!strncmp(buf, "LT7170", 6))
 			return lt7170;
-		if (!strncmp(buf + 1, "LT7171", 6) ||
-		    !strncmp(buf + 1, "LT7171-1", 8))
+		if (!strncmp(buf, "LT7171", 6))
 			return lt7171;
 
 		return -ENODEV;
-- 
2.45.2

