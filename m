Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645632FF65A
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455526; cv=none; b=i0murSBf2SvuNJXX8ucCOBMnA8FB8iFYdC0LExJw0mmWKQMZN38ng+QKzPLDUB46NqieoMPAhEoIRfaSQJm/o+nRkwVXTM8fXk4zIZ53CGLX+e2RwRGpMmAw/xr6QL2X1n5emOqJMWmBEn+M6KlpKV+8C0B47ZE3fLSdM7xrr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455526; c=relaxed/simple;
	bh=vIidkIOlvuarUF+a4niCWFiVgc21o7dFTQeX8rsLa3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chQ2/EgKnLZz99NZudofdpilLXmLUU6Or8umKvQul+7glbFXVjNFy3hbaNqxoc2hkkmwrQ5f4K0p4gmlo54nk6HmB8BStJGOnpwsbxO5z++oiCqwvDLp1vOogQmLTyNkO89x04r1CGkb4UjYp2iv0LzVsERmFo1BBbQ8GGP4jjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA9HSO2P; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA9HSO2P"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso756060b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455524; x=1761060324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcWaXZqyCW6UHqSW4VdefCA+toA2nmI31DKKESFZWSc=;
        b=CA9HSO2PZfwNnPaoqqyNZmL+S9x+GvYpCKe5zgSz5+J3d4kwhAWGjOfoLA2IIoxx22
         AccPyMr5zylB9dD/ujSEXVMpKlPkIflk+ArPOeeA8cTVubMUAKqrFOXXZjv6fKFmO4TS
         V3Rf896RhwErPzNqCG9TfcELZ2rvcvBTPT+DuQKeZM9LbM8kEzDpwNsbzQcANryCau8u
         sAX+zOJbdV7R0ElSOP6/KcTICFnKTdHnq1c7ptQbTjUqGTKUCpHxC/HyReo8BlqndFTo
         8JhGaFG9oKSy3B2usi2v7P795FcnV2bUxNhrzqupn9S+YifAiLHnIBe866k0gdiFdvUn
         EgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455524; x=1761060324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcWaXZqyCW6UHqSW4VdefCA+toA2nmI31DKKESFZWSc=;
        b=StIUTTTrQGL05ne0xGReNLbWJrPSJunJDltQKIigNs6A/dCk30MQ0YIJHjDq4ANZiM
         2/dtaUwuJAchtVWfFkxuH7j2GXh2eygA4Zb7YBen+fnNtnwtM8MKMXk9FRrZgXMLm0Y3
         spxslhRjhfJdLorkukFgMnf9edGsAxb8ZrZEoQR9KukRtHmaBTpWmnJwDjGjBpibAR8W
         zIf9SNfyB1oDFcHrqR4wvWrFoAzw2rCghxN3jNOaSQMhvWKcCaF6uHbTURG2Vl58sfze
         rPRWoSGKVo0VtY+JXXsSPIffbr3w1jMBmZpbMWiSz+4xoO/o0R+DBg7Bw5MFWqTcAff/
         iriw==
X-Gm-Message-State: AOJu0YzZX9rlBJkN+o+wWp+X4jmhLaZEtrEwXWxAl523cuy/Vvp1TkZ6
	/F82HmmMQaWTPr3l9YrDAodbgXA/1bTzcfZsc0D9U8RVSPmJZ8DwE+q4Gk9cMg==
X-Gm-Gg: ASbGncsNkTHffd+WzTdsBHpH69FRZnLQknKV9oCT1q1hpNxpU67xI+PXP9wzTGvjAPM
	eTAA8rIYvglCUEx75qhe04NlF3Yv6dvSmMCTUc/iiBtupzXWyjBiEIIzspAPeMeBYttFiu7z2EO
	4C1R4kna6wZY8t5mJGDIcevQ1ZWnLwvh+Vj2Vz4vsQ7TtsXIeQ+BHI32GX1QaPMeHplh0+CQWWF
	+OafKIZiQqGKsGvfZO5PiPaweJ0DLWe0jfRdVE1bnII9m0x8GEMCSCf9rOAoxMmy48NsG8Js4CD
	1rtIndhb28nA/O2YRwpyKPPJjH/RnwzMpZ6VZqgqUgHTh/tlotXEQR3RylePPUxjmEgVUFwknsh
	qkMBNTreBJYoIjb/7VOhcLOvqqgnyT3AlRYQA7Ss5iL6zPv58UzfcY9LrWF55RFW0
X-Google-Smtp-Source: AGHT+IHyPu1Eq3rx+c7u5tfzhb653O8lhHT89v/sb7GUy/Flk1HT43vIPc8B3wM7UjjdTZDQ5TCxMg==
X-Received: by 2002:a17:902:d50f:b0:278:9051:8ea9 with SMTP id d9443c01a7336-290272dc4a7mr348455375ad.40.1760455524405;
        Tue, 14 Oct 2025 08:25:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm13036045a12.31.2025.10.14.08.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/20] hwmon: (adm9240) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:24:58 -0700
Message-ID: <20251014152515.785203-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm9240.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 6dfbeb6acf00..86f6044b5bd0 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -37,7 +37,6 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 
 /* Addresses to scan */
@@ -125,7 +124,6 @@ static inline unsigned int AOUT_FROM_REG(u8 reg)
 struct adm9240_data {
 	struct device *dev;
 	struct regmap *regmap;
-	struct mutex update_lock;
 
 	u8 fan_div[2];		/* rw	fan1_div, read-only accessor */
 	u8 vrm;			/* --	vrm set on startup, no accessor */
@@ -170,8 +168,6 @@ static int adm9240_fan_min_write(struct adm9240_data *data, int channel, long va
 	u8 fan_min;
 	int err;
 
-	mutex_lock(&data->update_lock);
-
 	if (!val) {
 		fan_min = 255;
 		new_div = data->fan_div[channel];
@@ -206,8 +202,6 @@ static int adm9240_fan_min_write(struct adm9240_data *data, int channel, long va
 	}
 	err = regmap_write(data->regmap, ADM9240_REG_FAN_MIN(channel), fan_min);
 
-	mutex_unlock(&data->update_lock);
-
 	return err;
 }
 
@@ -501,23 +495,17 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
 
 	switch (attr) {
 	case hwmon_fan_input:
-		mutex_lock(&data->update_lock);
 		err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
-		if (err < 0) {
-			mutex_unlock(&data->update_lock);
+		if (err < 0)
 			return err;
-		}
 		if (regval == 255 && data->fan_div[channel] < 3) {
 			/* adjust fan clock divider on overflow */
 			err = adm9240_write_fan_div(data, channel,
 						    ++data->fan_div[channel]);
-			if (err) {
-				mutex_unlock(&data->update_lock);
+			if (err)
 				return err;
-			}
 		}
 		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
-		mutex_unlock(&data->update_lock);
 		break;
 	case hwmon_fan_div:
 		*val = BIT(data->fan_div[channel]);
@@ -791,7 +779,6 @@ static int adm9240_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->dev = dev;
-	mutex_init(&data->update_lock);
 	data->regmap = devm_regmap_init_i2c(client, &adm9240_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
-- 
2.45.2

