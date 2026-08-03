Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE08432E79
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785748; cv=none; b=G/iJAE95vCGOd/izQZYDDxCpvwMhV47t9LkzkuZnsU9hFF5iHN7fz6q287z5EfHjwZrkA4XJHAUeKTOrU6u5FhR6/9n0h4jOy3uHMch4iUFzdHNfjzJ83bEb2hebKNRffPjQlNfdGXUO8WEdValrUlH3ETruUO4e8JnKFLOszUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785748; c=relaxed/simple;
	bh=HKN+VoH7o+KVbEpDNBReC9ZnnNikVXPeeRtwpDOMKH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5yJqb4bLZG6caNM3XnxdTssZ+gq9x1etAbW9qd4468ZyFXP6OimFhMPERzqfyCPGwrzXz/pEApjqjov5uvGsQEyjek4gBMPk9UxcQPGT66zoR+cISk6ARW4ngNUesKRWmKWLR4dZoe/v+FtKu87MibtPhQK/MiYTlONYyNEOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFYESn8G; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFYESn8G"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3439897a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785747; x=1786390547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZB02RcxLueZQDLNQYX5/1EIAayCHSXGVYLi1+2wKZm4=;
        b=tFYESn8Git3emhKv0If3WvtxRbKYTioPFdh0Ysz8VMxGI7pg7Rz5s55bVTstJTe7SP
         mRjtWwB6TM0tsB7E//rySmOreooZCc6EiBjTFHBiSQ47jv4teYakL0tvhUSZfK+d4ULr
         kFLZuC9OO6XPUPaIvb9AKI0aUJxC8IxCz7BKUWuB9U4tpGCJMU8Z0g86Ht9w7y//J9vu
         2O/8K2hub9coD91/dKOvJEucUWCDKM4+TTKTeV8hIDz2XZIKYuF6MBGPoNBksyzIq/7M
         phYVHAfb34jAUiDHBEdUqPbkJ5K1NCZFLZA3UJlop109guxjdL+rg5ZTUTTP0IlB9vX1
         nprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785747; x=1786390547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZB02RcxLueZQDLNQYX5/1EIAayCHSXGVYLi1+2wKZm4=;
        b=my8SqRNO6u5TzZw855bDQeer3DjYI9GOfx7eQTcByuCQy2AhmTQHkP7bsfGCn3UZ26
         T/Yf+zm555skQtvcxxm+2dDJZGvXkSwiTHR42GjNa0aXqe/w10VQvE7OBGjR9lvmopBy
         CP7fODEPh6/M9VryJ+6OVUqEwcbYCIGnS40uiwuyMI3XkABLHGg3lS4aQ9zWJ3SI5TeY
         CyDP1Rn/XtdrH6NX8YB8gj9nb+OQvU21CcPIFRlCENHcNHfi1bxmmXJ9lcWrbcvEhLoq
         /SIGvMe7RNqFUhRsplZDp7GNogNkXim8Woj8nWEAJ2NLHhwERluFbRijCqfK3jk+7u9k
         y3zA==
X-Gm-Message-State: AOJu0YwBALBtjxa4DipRaRGClNidAZa7jeGLN6gDwL2t5XDymqLcor3E
	tMDGU1LHvIMYO22y6dgzzFzo0eBzlH4kISG0+kSZ5YsqRRluwr0Q2tpa26wGUw==
X-Gm-Gg: AR+sD13+DSz7ksL3ZIxbBc6ZoAM68VVvMjjL8qs7spjOQXFVi2r9PGurKR775ve71rq
	M71TnmytpICaN7UJUc8CaBeuinWUexBWd6244rW76O2P0inotQwRJe/8n5+Nkhjad1qmr5W5Yf3
	5ZYM5o+tF6b3gtBdj6vGS/J9idTvjc4wMq2lqAL1Jk6JVA+0vHEQkc6IB88vuvkBvYnxZFEELSK
	pN6U4yZ7yLcPz/MmskGz65OzxPNS7Xow7mIzc/MBXfs/gBUlhYRS99WOWhBGdBvY8E1tz9jKZC3
	vWi4HXXcyMr1jl5wkUG7GgQLfy7f6KvDuUXnBScHUBuhUvjznGliPvT8jnwOICMzbHZSBog9NAa
	7QOao8fOlWVpWxs+tDVpgB6HdoMzHkPEzBLPtYE2sPC39yo6vdyrK07pTkIkYBEk83McsD4WnED
	FCmEb6XyGJtWO6Lu41pirFcEYSZZQ9P6FG2QZlaBj7I/solXuV6dX5dJbFMjGyVG/oIQgKAqxDl
	Q==
X-Received: by 2002:a05:6a20:4394:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c92a8a6b1bmr11845979637.44.1785785746849;
        Mon, 03 Aug 2026 12:35:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb342sm4058021a12.30.2026.08.03.12.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/5] hwmon: (pmbus/ir36021) Use pmbus_read_smbus_i2c_block_data for block commands
Date: Mon,  3 Aug 2026 12:35:35 -0700
Message-ID: <20260803193535.2286578-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803193535.2286578-1-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses i2c_smbus_read_i2c_block_data() for PMBus block commands.
Use pmbus_read_smbus_i2c_block_data() instead to enable the driver to work
with I2C controllers which do not support i2c_smbus_read_i2c_block_data().

Drop the functionality check to get an explicit error message if the
required SMBus commands are not supported.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ir36021.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.c
index 0dce4c3f666f..58d8c4aac0d1 100644
--- a/drivers/hwmon/pmbus/ir36021.c
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -31,21 +31,13 @@ static int ir36021_probe(struct i2c_client *client)
 	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_READ_BYTE_DATA
-				     | I2C_FUNC_SMBUS_READ_WORD_DATA
-				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
-		return -ENODEV;
-
-	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_MFR_MODEL, 2, buf);
-	if (ret < 0) {
-		dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
-		return ret;
-	}
-	if (ret != 2 || buf[0] != 0x01 || buf[1] != 0x2d) {
-		dev_err(&client->dev, "MFR_MODEL unrecognised\n");
-		return -ENODEV;
-	}
+	ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read PMBUS_MFR_MODEL\n");
+	if (ret != 1 || buf[0] != 0x2d)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "MFR_MODEL unrecognised\n");
 
 	return pmbus_do_probe(client, &ir36021_info);
 }
-- 
2.45.2

