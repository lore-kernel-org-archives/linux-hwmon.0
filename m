Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E6D51B
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706367780; cv=none; b=B/B4cnvWSyJFVJCkPpGSfNj4qorwrmaGL1qpt3DHpeo4kU9KQJkFd4I1pmMRiJzKsut/rIrkcK1fJ/0t8x5LMHkoP8RcCaC5lnmrJbTloVGhNa1aoGMQufmv/+zJGuek5HEHUZ7uDvwLAdQHdiZt2MQRwZF4TdQ6NGvDizWaOCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706367780; c=relaxed/simple;
	bh=DvH5tCtAeus9lsebfhXLIjWReo6RA+vGMJvaab94w1c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fng+XNq6q/AlfHwWQGnpNvra3aaZU35uiUCms0pRzKyACg10a33aIPKMB7lr71kfmYIp43GBy05vxwblIsnH6NGmAXYy5j9dcQuSSMVVEEpIeAa7A8nWsN9rPjFKwC7RmnQfOauO2KVy12e2jISXAIjFysw5IrKD4felWzHzpQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxY0B9nD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxY0B9nD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3394bec856fso1463282f8f.0
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 07:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706367776; x=1706972576; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deb9Xbgop3LkP5OUrl5ybSgjC8hCUkjGC16mbrUWwpY=;
        b=NxY0B9nDF8mB6M5KklCNcSN4Rp143FPZpJS9+iMRZqx+UUkdo4/gKoJDDG3wO5EoJU
         4JQ8fNBMvX0XuqF1/TPUvtnzToZbfvIaU4a6lFUH3zL6hsicCszgy35EDQ/6AieSq0Th
         S+yAo4LxqTzTTu0g7tnyLgrCD1udYymy5YuV79AlibDk5JoBc0X5hSX/pgX74waQ/lnr
         +IX5e4Z2KIaAd9S9YfSHcVp/IzB7j7TCnUuM3taLCo/hKcbfVdRtZoYPdgGDVKSwsn1Q
         ghZry1ZkLCBrvonNvymt/OpnSzCpNJFazJms/R7MOLIHqA4PHFcJBXLUG4DHZsCDuj0y
         /k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706367776; x=1706972576;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deb9Xbgop3LkP5OUrl5ybSgjC8hCUkjGC16mbrUWwpY=;
        b=OmzH+OR0/MfcAFT4cj3Po2tmguL4y9p41se7mp7qfNOk8tiXfAH5Hr3eMxGRZX5ca+
         22qVD1jiK2gNQT0xIsFBT1xvPVQTyoP1CJXQZXh+6ztn4tgfOfFOCEnOSdgCaSRKS1UN
         paTi0pG0BG3/jalUa6HJJkzyf6oDKy3eh6WzPPQ/7NL4mllR90+f7nga/ilkPHaq+rdt
         /h5aKoopKqGxlidtLjjcyyIFlMO/KrUU3sS9DoVnuRhS78BBgyF34DY3mpG258ZOvUk4
         gsaCN+NauCQNoDcA4Tmzk96Q/idYn8pnegOimMorNS0iTETlza6MOH5BqS3xlmqf2QUM
         qisQ==
X-Gm-Message-State: AOJu0YzgiS8H2LM66mCFc2RXZ7pXMB3ce0htVeFSvYlek12DA7H/Rhau
	G851B5BOun0Ff0k1dS6DpF506eq1sLEtlsOzQDbuiJ0W293sNyzB69UETpAJ
X-Google-Smtp-Source: AGHT+IFPvORD+pRnwhM8UZACdi+LYPU0E22NrWuP+cROK6LFd4vdNjeTBuNL6Oir7Lecn70gFSiP2g==
X-Received: by 2002:a5d:51cf:0:b0:339:5689:368f with SMTP id n15-20020a5d51cf000000b003395689368fmr1152304wrv.35.1706367776228;
        Sat, 27 Jan 2024 07:02:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm3674173wrb.115.2024.01.27.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 07:02:55 -0800 (PST)
Message-ID: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
Date: Sat, 27 Jan 2024 16:02:54 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Daniel Matyas <daniel.matyas@analog.com>
Cc: linux-hwmon@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect() and
 address_list
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Class-based I2C probing requires detect() and address_list to be
set in the I2C client driver, see checks in i2c_detect().
It's misleading to declare I2C_CLASS_HWMON support if this
precondition isn't met.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/adm1177.c       | 1 -
 drivers/hwmon/ds1621.c        | 1 -
 drivers/hwmon/ds620.c         | 1 -
 drivers/hwmon/ina209.c        | 1 -
 drivers/hwmon/ina238.c        | 1 -
 drivers/hwmon/max127.c        | 1 -
 drivers/hwmon/max31760.c      | 1 -
 drivers/hwmon/max31790.c      | 1 -
 drivers/hwmon/max31827.c      | 1 -
 drivers/hwmon/max6621.c       | 1 -
 drivers/hwmon/max6697.c       | 1 -
 drivers/hwmon/occ/p8_i2c.c    | 1 -
 drivers/hwmon/pmbus/ir36021.c | 1 -
 drivers/hwmon/powr1220.c      | 1 -
 drivers/hwmon/sbrmi.c         | 1 -
 drivers/hwmon/sbtsi_temp.c    | 1 -
 drivers/hwmon/w83773g.c       | 1 -
 17 files changed, 17 deletions(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index 60a893f27..3390102d2 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -250,7 +250,6 @@ static const struct of_device_id adm1177_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, adm1177_dt_ids);
 
 static struct i2c_driver adm1177_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "adm1177",
 		.of_match_table = adm1177_dt_ids,
diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index 21b635046..bffbc8040 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -380,7 +380,6 @@ MODULE_DEVICE_TABLE(i2c, ds1621_id);
 
 /* This is the driver that will be inserted */
 static struct i2c_driver ds1621_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "ds1621",
 	},
diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index 2b0953663..4fc4df012 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -241,7 +241,6 @@ MODULE_DEVICE_TABLE(i2c, ds620_id);
 
 /* This is the driver that will be inserted */
 static struct i2c_driver ds620_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		   .name = "ds620",
 	},
diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index c558143e5..d9b57a4b3 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -589,7 +589,6 @@ MODULE_DEVICE_TABLE(of, ina209_of_match);
 
 /* This is the driver that will be inserted */
 static struct i2c_driver ina209_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "ina209",
 		.of_match_table = of_match_ptr(ina209_of_match),
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index ca9f5d2c8..69289293b 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -629,7 +629,6 @@ static const struct of_device_id __maybe_unused ina238_of_match[] = {
 MODULE_DEVICE_TABLE(of, ina238_of_match);
 
 static struct i2c_driver ina238_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "ina238",
 		.of_match_table = of_match_ptr(ina238_of_match),
diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
index ee5ead06d..da2289e35 100644
--- a/drivers/hwmon/max127.c
+++ b/drivers/hwmon/max127.c
@@ -335,7 +335,6 @@ static const struct i2c_device_id max127_id[] = {
 MODULE_DEVICE_TABLE(i2c, max127_id);
 
 static struct i2c_driver max127_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "max127",
 	},
diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 79945eb46..1b6f71bc6 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -578,7 +578,6 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max31760_pm_ops, max31760_suspend,
 				max31760_resume);
 
 static struct i2c_driver max31760_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "max31760",
 		.of_match_table = max31760_of_match,
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 0cd44c1e9..3dc95196b 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -543,7 +543,6 @@ static const struct i2c_device_id max31790_id[] = {
 MODULE_DEVICE_TABLE(i2c, max31790_id);
 
 static struct i2c_driver max31790_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.probe		= max31790_probe,
 	.driver = {
 		.name	= "max31790",
diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index 4a8c3e37c..f8a13b30f 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -652,7 +652,6 @@ static const struct of_device_id max31827_of_match[] = {
 MODULE_DEVICE_TABLE(of, max31827_of_match);
 
 static struct i2c_driver max31827_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "max31827",
 		.of_match_table = max31827_of_match,
diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index af7e62685..05426cde0 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -549,7 +549,6 @@ static const struct of_device_id __maybe_unused max6621_of_match[] = {
 MODULE_DEVICE_TABLE(of, max6621_of_match);
 
 static struct i2c_driver max6621_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name = MAX6621_DRV_NAME,
 		.of_match_table = of_match_ptr(max6621_of_match),
diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 7d10dd434..d161ba0e7 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -780,7 +780,6 @@ static const struct of_device_id __maybe_unused max6697_of_match[] = {
 MODULE_DEVICE_TABLE(of, max6697_of_match);
 
 static struct i2c_driver max6697_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "max6697",
 		.of_match_table = of_match_ptr(max6697_of_match),
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 06095975f..31159606c 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -241,7 +241,6 @@ static const struct of_device_id p8_i2c_occ_of_match[] = {
 MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
 
 static struct i2c_driver p8_i2c_occ_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "occ-hwmon",
 		.of_match_table = p8_i2c_occ_of_match,
diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.c
index 382ba6b60..a263afeb8 100644
--- a/drivers/hwmon/pmbus/ir36021.c
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -63,7 +63,6 @@ static const struct of_device_id __maybe_unused ir36021_of_id[] = {
 MODULE_DEVICE_TABLE(of, ir36021_of_id);
 
 static struct i2c_driver ir36021_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "ir36021",
 		.of_match_table = of_match_ptr(ir36021_of_id),
diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index 4120cadb0..2388d0565 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -323,7 +323,6 @@ static const struct i2c_device_id powr1220_ids[] = {
 MODULE_DEVICE_TABLE(i2c, powr1220_ids);
 
 static struct i2c_driver powr1220_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "powr1220",
 	},
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index 484703f0e..4318f5121 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -342,7 +342,6 @@ static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
 MODULE_DEVICE_TABLE(of, sbrmi_of_match);
 
 static struct i2c_driver sbrmi_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "sbrmi",
 		.of_match_table = of_match_ptr(sbrmi_of_match),
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index dd85cf89f..a4181acb1 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -232,7 +232,6 @@ static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, sbtsi_of_match);
 
 static struct i2c_driver sbtsi_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "sbtsi",
 		.of_match_table = of_match_ptr(sbtsi_of_match),
diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 045eea837..401a28f55 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -290,7 +290,6 @@ static int w83773_probe(struct i2c_client *client)
 }
 
 static struct i2c_driver w83773_driver = {
-	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "w83773g",
 		.of_match_table = of_match_ptr(w83773_of_match),
-- 
2.43.0

