Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA83CAA3F
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172076; cv=none; b=nMjpAW2hwT7W/T++DCv5LBB3p4sywZItkhBDBjsc4jlMVy4UXJGpsR7pU2e0qnNVW/NYjkSMB9pykQv6ZmScqO+BwNzCSMdVlzrmh8BfVit43Q90IP+ES1/D2pLAxE/asp8+lGZnFTnV232COox8CH1c0FC5X8ahGjCkrmo85w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172076; c=relaxed/simple;
	bh=Xj7t3gOgpcUTF9H2JW8LvlJCBDXFA1ijVl3OU+H77no=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bfig2VKWQopBQRswJuSBvvUWYQl3FNhWgKk/xkuqroksHMThkM7Jo710Tzd0P59ki7s4snUJACekF3hRJgi4bRM3lxfvDGDE3IOYmXZGowj+KrdJbjfnQyk6zlFAJn1sZvdChz9DuMyPwRMCKI7Q7F3J0r7Q8kSvHvPGmBXL0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldZZ3MLp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldZZ3MLp"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423efd76c8so5049761b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781172074; x=1781776874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjBLRWrBJ1wV+e8lZDCHR4CL5EzgVjy+L9xauVIf4pg=;
        b=ldZZ3MLpcXN55SEP0GB5+xtHWaNTGrv2We+HcOIj2vwLqcLY9qmPrwvk5M5esomWEw
         dQD0rHwh6ZIWfYV814dJlt7dcav/Uh2PIfJxrupxqZWK4y77SfCggW3mOypu780jwLqE
         YuaTifksFke3Tx4u3QEnd8GxdPFfBMRm92tmqeSQZ0eiRHDzKf6bOYSRPVX1jhUOJpjP
         f08Eywj+3bGDBQk8SDShLLlEnXP6Hvd1QnCGQ+MhHXb0gM4p8k4cYK/VvHs2VHTWQG2a
         4Gv2ElMoL0GgFIxlFcZ8/kDLNe3ZXomZaJ6ZOLVjq549zoKB+m7MNvEE5+mbE8dtXmsi
         RwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172074; x=1781776874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KjBLRWrBJ1wV+e8lZDCHR4CL5EzgVjy+L9xauVIf4pg=;
        b=DVNdkaUL3QWKmF9QSMe6Py1Bdi50N+68xaroaw/WQ1IPUmbJGTcyOf1N/DU+hkxxs6
         SO1+e1mEfHyL1meJEbC5Cv8WZ3rUavAlZ+/MlA98DU50/RonwFfKjkOFtJo06haKIvcM
         ifNBnS4U++krsvTzPKj1CwB3lGFdYtoU6QVRvDmm+lY0tWOkEwO8M2vdweMi3skBrMqy
         NYz2fe+J3gsLQLaR+usEI4hlwrPd92jwamtpC/AAgboyi5KpBoUIvpZTZhF/VIIYX9bu
         TTLlV43U2BAxHrU8FxB/892eU0KX/WVugVpwPwILKAQo9IFXUu6CPTKEhGp9T5xdNfv5
         7nbw==
X-Gm-Message-State: AOJu0YyDhqTl9M3w5WNgbYfXsuQuvcnc1XGP39MqNmOCaw2M51YpJWAF
	apvPxWty7sucG7SPKWmWOaGGY+6uUi1Kfg7v8cpVjDgrWWJCzLBCHXY1
X-Gm-Gg: Acq92OEpp3n5mUQfcU0g/5aelsa7eh4ph7Jp2dTtvGvg4Ck+VCyqfXw/KhSBZSRziDX
	SqQn+QNclsRvL+BfP1FG6YfCxLiZLYkqECQaaE5hCME7q3WcQ0bBtT22r0zKvMjunfZs49/BxMf
	U1hzlAFyK9oBMAQUAXBKyZMkaZeELEq+VAlwvyfIdxVxtREE8MrClxeefIYiKWNV3/Gf9gy5dGJ
	hiHyREH6X8p2oaeKxE8KbLLfp5i4Sg0E0ds3rYm/Dr9Vt2bPaMMcmnB+kxRlqn6zrR4iCz8f+xF
	zhj+WSM/ojBdt9cgNtlloRZDjJtJ3CYjPp96GDBoud1Ma1B8R3PUC5dMZ8deFYsFH/pAP0L/Euk
	MsVdL04DkXLsE9YcrAPMtkOqiTK4BMsNkGfp66MF1l4jxBPmEcTpq09mDle2LhSsMtatL5Th5Jr
	iybFjDK0n4YV3zpaVdMdI5ToyVh9XaZcmIR/x+xcEW0hXg4M2OUlZ0OUpJWcx/zZwoiClRgo2NK
	kvHaBuPX44DaVo=
X-Received: by 2002:a05:6a00:3ccc:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-84336a8c7a3mr2263009b3a.28.1781172073628;
        Thu, 11 Jun 2026 03:01:13 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c92edsm1458228b3a.32.2026.06.11.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:01:13 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 11 Jun 2026 17:58:45 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/lm25066) add SMBus current limit
 configuration support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lm25066-cl-config-v1-2-02e567bf3d91@gmail.com>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
In-Reply-To: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781172064; l=2361;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=Xj7t3gOgpcUTF9H2JW8LvlJCBDXFA1ijVl3OU+H77no=;
 b=7fG5KmTbc55UHzJuv8XriODDk9ISYDQTmyH1ACtk62myjbNLGpEwoFJltdFygBLRUgJcyPb2I
 eyetfvZSQFpBzxRr5uHMQB01yyhRe1OITMd3LUJPB0yO/GaG7bYAKbP
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add support for the mutually exclusive 'ti,cl-smbus-high' and
'ti,cl-smbus-low' devicetree properties. When present, these properties
override the hardware configuration pins via the DEVICE_SETUP (0xD9)
register to set the Current Limit Configuration bit (bit 2) and
Current Limit Setting bit (bit 4) to SMBus settings.

The Bit 4 mapping to High/Low current limit is handled dynamically on
probe because it is swapped for lm25056 and lm25066 compared to other
supported chips (lm5064, lm5066, and lm5066i).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/hwmon/pmbus/lm25066.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..20e114bdc882 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -34,6 +34,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_AVG_PIN		0xdf
 
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
+#define LM25066_DEV_SETUP_CL_CFG	BIT(2)	/* Current limit configuration */
 
 #define LM25066_SAMPLES_FOR_AVG_MAX	4096
 
@@ -464,6 +465,8 @@ MODULE_DEVICE_TABLE(of, lm25066_of_match);
 static int lm25066_probe(struct i2c_client *client)
 {
 	int config;
+	int config_new;
+	int ret;
 	u32 shunt;
 	struct lm25066_data *data;
 	struct pmbus_driver_info *info;
@@ -484,6 +487,28 @@ static int lm25066_probe(struct i2c_client *client)
 
 	data->id = (enum chips)(unsigned long)i2c_get_match_data(client);
 
+	config_new = config;
+	if (of_property_read_bool(client->dev.of_node, "ti,cl-smbus-high")) {
+		config_new |= LM25066_DEV_SETUP_CL_CFG;
+		if (data->id == lm25056 || data->id == lm25066)
+			config_new |= LM25066_DEV_SETUP_CL;
+		else
+			config_new &= ~LM25066_DEV_SETUP_CL;
+	} else if (of_property_read_bool(client->dev.of_node, "ti,cl-smbus-low")) {
+		config_new |= LM25066_DEV_SETUP_CL_CFG;
+		if (data->id == lm25056 || data->id == lm25066)
+			config_new &= ~LM25066_DEV_SETUP_CL;
+		else
+			config_new |= LM25066_DEV_SETUP_CL;
+	}
+
+	if (config_new != config) {
+		ret = i2c_smbus_write_byte_data(client, LM25066_DEVICE_SETUP, config_new);
+		if (ret < 0)
+			return ret;
+		config = config_new;
+	}
+
 	info = &data->info;
 
 	info->pages = 1;

-- 
2.52.0

