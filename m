Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19B154C07
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Sep 2024 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263727; cv=none; b=VfDZgByCXezudeS2hJXsZwxL9dCPPn9tqDMgwHK3EEHIqQQgKbyoyaO0Yaifh4MfM+nKmRok+vXjr/3kvzyrioIRQQYWEnpMg6D75/kFxkODTWHTqMpwZ6DS2tYeZ+P+yVmjFWtrR7GlSJ6IsfnAg1s9K6h+or7gC8I71oTVqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263727; c=relaxed/simple;
	bh=CHTREiAcEZMsJXs1E2EV/u8Fu6chAqB+ClVn1Vb70uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnQygi4CMaqbVEjfPARwbbigjKtTEolVkn008RaSy8A0UWGhIA2sBlkoWu4lSUrXwGwHrCXGGYXB4jPYKoTLIJ9kDhSOKIn8BwJP9KdErP064PnBEcxtEj8rQBgvpSdDL2wp2mCqtD1PWobJQFokkMa4HMn29SlOKvd4UN6yD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=KfEq8Pvu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="KfEq8Pvu"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a80eab3945eso341830766b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Sep 2024 00:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1725263724; x=1725868524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wJu6eSYrIH+jWqR93bP7w6T/N0xlGC/9JkjmC8TAO0=;
        b=KfEq8PvuWfudjCQkPag4TGwYWcvDqpWqQCVULjWDsHsQ2HEoYHF+1gYal0//NdI1HM
         Jizs+lCv7F6eX+tZF76cCVfJyUjnYph2OV+Dq6+Qd9V8G6Hm7bVWmCQg+I00+TsSo08W
         7+lRPxE0/jfk+FvnEWg5ONUglQZW8pv9FWTYn8N2C8XsKE7b0Gj7/TvdTIWRE2b1QgZ0
         1khzzzRGDpqtfQWsa2TDwKQqKOmL9kxy3SaQ0byn3CeKS558v7fDzk0X+6LvRdof8e0V
         XREucuZKNqOntfgLUTCh+cN4xls7Lf6krqhw2J6X+gE/dEmHNOyIj3oC4WcSr71HXdeT
         vZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263724; x=1725868524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wJu6eSYrIH+jWqR93bP7w6T/N0xlGC/9JkjmC8TAO0=;
        b=lUdpde7SWfoQQ7GoE2YBeCb+Iy3R+79ipWnvHf0tvPPksfCcfRM3F5eEZNYDJNOLy7
         AtjiHvi2TJdcv3B0amma8si1GUvfin4pNBglhksYkOV1HJ7ZUOZE+m00vqqrd0elKZUS
         v9DnhgMGDvW9mIS3oFncSdMu8d6IdclaMcYUm1BtymvLje9vmtqhPwH0l8TfNneo8lLH
         NxMd7L9ogHLtlcS5w7/JdnSUWR/uZ3tGmYNvxjHeD9R181/2tTJ8GUcdImazz6li4Cqz
         qrN5otWdegqov5rvCcOJxafcp4OKohDC2eyJUASQd2bUWe41EyIhEaksDAkBt5tnrPsq
         bmjw==
X-Forwarded-Encrypted: i=1; AJvYcCVDZDolrlGt1Yj7zsiYCFdiZUSQ91ZNiq0ozBhUZthDfx/xEfF9Z8uoqOnwwp6fP6Zt4Js3QxUeHvefZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypzRj1LnIhIHIWEgEMnire/SmZE9uc4RGNZ7rskRx4J88HuOCz
	LB58d3Q6Mneeqoin2v32rB4bdjpqP9pLAWBM3ub9vkAkkg+4T+Df8GcGDI1Q0ok=
X-Google-Smtp-Source: AGHT+IHuc6RANhB2GFUELent8s8Fr0cwtTYQacm2gMM6HYRleWFgZr0ofL5/w80YH5dqa6wZI+h+Ag==
X-Received: by 2002:a17:907:948b:b0:a86:c252:aaa2 with SMTP id a640c23a62f3a-a89a379d069mr706616766b.51.1725263724106;
        Mon, 02 Sep 2024 00:55:24 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989022481sm521076066b.86.2024.09.02.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:55:23 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Daniel Nilsson <daniel.nilsson@flex.com>
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] hwmon: pmbus: max15301: Use generic code
Date: Mon,  2 Sep 2024 09:53:13 +0200
Message-ID: <20240902075319.585656-2-patrick.rudolph@9elements.com>
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

Use the generic pmbus bus access delay.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
Changelog v2:
- No change

Changelog v3:
- Added changelog

 drivers/hwmon/pmbus/max15301.c | 92 +---------------------------------
 1 file changed, 1 insertion(+), 91 deletions(-)

diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 986404fe6a31..f5367a7bc0f5 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -31,8 +31,6 @@ MODULE_DEVICE_TABLE(i2c, max15301_id);
 
 struct max15301_data {
 	int id;
-	ktime_t access;		/* Chip access time */
-	int delay;		/* Delay between chip accesses in us */
 	struct pmbus_driver_info info;
 };
 
@@ -55,89 +53,6 @@ static struct max15301_data max15301_data = {
 	}
 };
 
-/* This chip needs a delay between accesses */
-static inline void max15301_wait(const struct max15301_data *data)
-{
-	if (data->delay) {
-		s64 delta = ktime_us_delta(ktime_get(), data->access);
-
-		if (delta < data->delay)
-			udelay(data->delay - delta);
-	}
-}
-
-static int max15301_read_word_data(struct i2c_client *client, int page,
-				   int phase, int reg)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max15301_data *data = to_max15301_data(info);
-	int ret;
-
-	if (page > 0)
-		return -ENXIO;
-
-	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
-
-	max15301_wait(data);
-	ret = pmbus_read_word_data(client, page, phase, reg);
-	data->access = ktime_get();
-
-	return ret;
-}
-
-static int max15301_read_byte_data(struct i2c_client *client, int page, int reg)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max15301_data *data = to_max15301_data(info);
-	int ret;
-
-	if (page > 0)
-		return -ENXIO;
-
-	max15301_wait(data);
-	ret = pmbus_read_byte_data(client, page, reg);
-	data->access = ktime_get();
-
-	return ret;
-}
-
-static int max15301_write_word_data(struct i2c_client *client, int page, int reg,
-				    u16 word)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max15301_data *data = to_max15301_data(info);
-	int ret;
-
-	if (page > 0)
-		return -ENXIO;
-
-	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
-
-	max15301_wait(data);
-	ret = pmbus_write_word_data(client, page, reg, word);
-	data->access = ktime_get();
-
-	return ret;
-}
-
-static int max15301_write_byte(struct i2c_client *client, int page, u8 value)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max15301_data *data = to_max15301_data(info);
-	int ret;
-
-	if (page > 0)
-		return -ENXIO;
-
-	max15301_wait(data);
-	ret = pmbus_write_byte(client, page, value);
-	data->access = ktime_get();
-
-	return ret;
-}
-
 static int max15301_probe(struct i2c_client *client)
 {
 	int status;
@@ -164,12 +79,7 @@ static int max15301_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	max15301_data.delay = delay;
-
-	info->read_byte_data = max15301_read_byte_data;
-	info->read_word_data = max15301_read_word_data;
-	info->write_byte = max15301_write_byte;
-	info->write_word_data = max15301_write_word_data;
+	info->access_delay = delay;
 
 	return pmbus_do_probe(client, info);
 }
-- 
2.45.2

