Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F717E8E2
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Sep 2024 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263730; cv=none; b=JRs93pdElh02c9M3p6MFdq3fAYg3zquZcq7tsChA0oJnLNymMxSbDekJII1VRXJb5KZsHrJurotwYtbbxRkuCG5MUgabSIw5ssekZouHX6WlyxPQWa9kVu5hxbeyPc2PVSYhzxyVFZopxPwB193H4GuHxgnHwHKvUtQBxVoMX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263730; c=relaxed/simple;
	bh=vkdQQTtJMCaK7D9Qmffo/4tl8CP+rqpbSTlT3cc6OkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ogo7wNmKW8aWfkYfQs1fDERCcjtKsE/RxfhezAbAeKBjetwgXvF90N4xGxLCCz39sUTvB3ZJa1Og/kaU5Lq1YC16YfczVgWSScs90AUg6tlZrWfrS1XQA+SZ4nTVhCIvptnZWDnkq1h2AC6IlihWUiBofcnVbOEfK1M78x4nTmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Q/T3tJwd; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Q/T3tJwd"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86910caf9cso849414166b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Sep 2024 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1725263727; x=1725868527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYk1yMobC2+FZ4/7R3fu6ntVjIVPnY0mmcZFCjv/XxU=;
        b=Q/T3tJwd6Lt/wr7hzTOtuJ4CQjQ1RD9v/iwQENRkEPvcxVsewGbOUmF+de44DVX48t
         F7j0NmKskuvR1+geFD/cMLDbU+34d62FdDDun/duMNrcOTZ77JwxjcymLe4AZoSglRZW
         fNoKRy5fcAHQXKPN8r98/sfCBNk+b0hh4KeZNgH18LkKCW3C4XK5qwyqv9tGR+2kj6C7
         lSFl/1VAXu81YW4nVxJGJKXlHYVroxmI3yXWpNFVEi59Qkl1GeJnG3FHDUNmNWiNbP9o
         K+AitZKQJMw8kqxHx9xitdFmytyZ/QdROHftepz15EingBrQvj8MEmpuyAy0lJJLp9Lf
         RiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263727; x=1725868527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYk1yMobC2+FZ4/7R3fu6ntVjIVPnY0mmcZFCjv/XxU=;
        b=dMh/OlcBuoR1NCrDP0J5giB/B//05uUH8lyZmFGcNpN7CYkuootXpQdWAJjw0/6S9g
         ktBDAF6HwoLi4npLilZVkp/r5cfddyszjiASP9npZMFQPEzS2gy7Eq0q84OOFV5DszAP
         tJ17ydiV//5Avk9+GDvB4uabg84/3L/6newhybgBRIcgCDYOsrlv9YAHLUSNzZRvmOUf
         TrfNtia2bxdIOxRewrhee3u4QZfLQ8Jyse3ZLlykQEbb7pdA6K4OJIFv0Psy6Zi2HcAd
         zOdAu14DOxP1EfYWe0IYFpy4KSRnvft2tcrO5Aw2poyPucsdcaSoH5mX3xy1wmPJlT1a
         MUbw==
X-Forwarded-Encrypted: i=1; AJvYcCXO1jwsQ4hgltCmXUrrIUTmkPXwN8JJaCjkgDzH8yOmFvvQzBAXYMH7KB6GI2RfpPj8YlUcbeDOJTNsfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBxBIKA6KtsmNBbPlRAaKfcIr8SwviNiREWyj9Shk8iV91aPtw
	cekZOKvam+1JNc3r2pHVff9XgvOZ0zPnMauKX7RXMBVm526E+Z/TdrZIIWfKhu62tzcusLc+KjH
	k
X-Google-Smtp-Source: AGHT+IEMUGg64TB8U7G23ZOTGc8VE++MmnHcv0X5yhxZN5UsApokCoy7pUVSLQvYbqk9PTQT8I97dA==
X-Received: by 2002:a17:907:da5:b0:a7a:130e:fb6e with SMTP id a640c23a62f3a-a898259d4f2mr1425756866b.15.1725263726724;
        Mon, 02 Sep 2024 00:55:26 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989022481sm521076066b.86.2024.09.02.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:55:26 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 4/5] hwmon: pmbus: zl6100: Use generic code
Date: Mon,  2 Sep 2024 09:53:15 +0200
Message-ID: <20240902075319.585656-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902075319.585656-1-patrick.rudolph@9elements.com>
References: <20240902075319.585656-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use generic pmbus bus access delay.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
Changelog v2:
- Drop now unused variables to make it compile

Changelog v3:
- Added changelog

 drivers/hwmon/pmbus/zl6100.c | 66 +++++-------------------------------
 1 file changed, 8 insertions(+), 58 deletions(-)

diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 83458df0d0cf..7920a16203e1 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -22,8 +22,6 @@ enum chips { zl2004, zl2005, zl2006, zl2008, zl2105, zl2106, zl6100, zl6105,
 
 struct zl6100_data {
 	int id;
-	ktime_t access;		/* chip access time */
-	int delay;		/* Delay between chip accesses in uS */
 	struct pmbus_driver_info info;
 };
 
@@ -122,16 +120,6 @@ static u16 zl6100_d2l(long val)
 	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
 }
 
-/* Some chips need a delay between accesses */
-static inline void zl6100_wait(const struct zl6100_data *data)
-{
-	if (data->delay) {
-		s64 delta = ktime_us_delta(ktime_get(), data->access);
-		if (delta < data->delay)
-			udelay(data->delay - delta);
-	}
-}
-
 static int zl6100_read_word_data(struct i2c_client *client, int page,
 				 int phase, int reg)
 {
@@ -174,9 +162,7 @@ static int zl6100_read_word_data(struct i2c_client *client, int page,
 		break;
 	}
 
-	zl6100_wait(data);
 	ret = pmbus_read_word_data(client, page, phase, vreg);
-	data->access = ktime_get();
 	if (ret < 0)
 		return ret;
 
@@ -195,14 +181,11 @@ static int zl6100_read_word_data(struct i2c_client *client, int page,
 static int zl6100_read_byte_data(struct i2c_client *client, int page, int reg)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct zl6100_data *data = to_zl6100_data(info);
 	int ret, status;
 
 	if (page >= info->pages)
 		return -ENXIO;
 
-	zl6100_wait(data);
-
 	switch (reg) {
 	case PMBUS_VIRT_STATUS_VMON:
 		ret = pmbus_read_byte_data(client, 0,
@@ -225,7 +208,6 @@ static int zl6100_read_byte_data(struct i2c_client *client, int page, int reg)
 		ret = pmbus_read_byte_data(client, page, reg);
 		break;
 	}
-	data->access = ktime_get();
 
 	return ret;
 }
@@ -234,8 +216,7 @@ static int zl6100_write_word_data(struct i2c_client *client, int page, int reg,
 				  u16 word)
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct zl6100_data *data = to_zl6100_data(info);
-	int ret, vreg;
+	int vreg;
 
 	if (page >= info->pages)
 		return -ENXIO;
@@ -265,27 +246,7 @@ static int zl6100_write_word_data(struct i2c_client *client, int page, int reg,
 		vreg = reg;
 	}
 
-	zl6100_wait(data);
-	ret = pmbus_write_word_data(client, page, vreg, word);
-	data->access = ktime_get();
-
-	return ret;
-}
-
-static int zl6100_write_byte(struct i2c_client *client, int page, u8 value)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct zl6100_data *data = to_zl6100_data(info);
-	int ret;
-
-	if (page >= info->pages)
-		return -ENXIO;
-
-	zl6100_wait(data);
-	ret = pmbus_write_byte(client, page, value);
-	data->access = ktime_get();
-
-	return ret;
+	return pmbus_write_word_data(client, page, vreg, word);
 }
 
 static const struct i2c_device_id zl6100_id[] = {
@@ -363,14 +324,7 @@ static int zl6100_probe(struct i2c_client *client)
 	 * supported chips are known to require a wait time between I2C
 	 * accesses.
 	 */
-	data->delay = delay;
-
-	/*
-	 * Since there was a direct I2C device access above, wait before
-	 * accessing the chip again.
-	 */
-	data->access = ktime_get();
-	zl6100_wait(data);
+	udelay(delay);
 
 	info = &data->info;
 
@@ -404,8 +358,7 @@ static int zl6100_probe(struct i2c_client *client)
 		if (ret < 0)
 			return ret;
 
-		data->access = ktime_get();
-		zl6100_wait(data);
+		udelay(delay);
 
 		if (ret & ZL8802_MFR_PHASES_MASK)
 			info->func[1] |= PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT;
@@ -418,8 +371,7 @@ static int zl6100_probe(struct i2c_client *client)
 			if (ret < 0)
 				return ret;
 
-			data->access = ktime_get();
-			zl6100_wait(data);
+			udelay(delay);
 
 			ret = i2c_smbus_read_word_data(client, ZL8802_MFR_USER_CONFIG);
 			if (ret < 0)
@@ -428,8 +380,7 @@ static int zl6100_probe(struct i2c_client *client)
 			if (ret & ZL8802_MFR_XTEMP_ENABLE_2)
 				info->func[i] |= PMBUS_HAVE_TEMP2;
 
-			data->access = ktime_get();
-			zl6100_wait(data);
+			udelay(delay);
 		}
 		ret = i2c_smbus_read_word_data(client, ZL8802_MFR_USER_GLOBAL_CONFIG);
 		if (ret < 0)
@@ -446,13 +397,12 @@ static int zl6100_probe(struct i2c_client *client)
 			info->func[0] |= PMBUS_HAVE_TEMP2;
 	}
 
-	data->access = ktime_get();
-	zl6100_wait(data);
+	udelay(delay);
 
+	info->access_delay = delay;
 	info->read_word_data = zl6100_read_word_data;
 	info->read_byte_data = zl6100_read_byte_data;
 	info->write_word_data = zl6100_write_word_data;
-	info->write_byte = zl6100_write_byte;
 
 	return pmbus_do_probe(client, info);
 }
-- 
2.45.2

