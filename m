Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A8331A6B
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706183; cv=none; b=QjmOCGyItDgkEz1SiSzZW2Q+yzBdYFqoPyEELszJOF6eun2o3JsUKFGYT6IVbF0viZLXhCT5QAAGYMUAC/zQYUM5twr2WVKY41HLsTE8anvJSRe3UdPTuUgUYodVRrNspA2InKOJY5ib9IPIysNx3JRTyEkDte3NGzDtYqB6Vnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706183; c=relaxed/simple;
	bh=PvEZqmmp3nd4PzjJ3/Eia4Q5OFLDoph56yl5110WhL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJXqKyCo1cqy+Rt/laCpDNS6q8WxB/12aX6wUZDnIl8jvWkeiEUEcW3AZp3y3XgyxYK4ulnXq5uf+U5CXS7ofMNTwNZLxadT8Dl80Xv0DMwUPEBuFMmCFPuHKX6uWUrtSuEm6LzALOwfY8O7rZuBUgqgwTDSBUbYGy7K2PeRNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUtyPWgm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUtyPWgm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33bb090aa78so1624724a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706181; x=1761310981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGKDfE0A1cACCMPV8YCD5oZ7MKC1yN7hImN3+ghbSLo=;
        b=fUtyPWgm9tkHM4Q9zZtDns/inUuNOpfa0BB62WxOhkHzojNvucMdzy5FGYRn2c28GQ
         i6aUsHYiu70imc72Qw8G6A9WQGFIXHMmGX0tHZKzVwx1g3BueaSVThpXxHWxnwKKdnEV
         LHrUrds3sRqSwV02d2acaAxNUhrxHKLIthPq5uH0rY0FdxstUo1gcOkNkDCE6w+JFbLx
         xXA4rDHPg4/1xoECKhb67DR5yk+LFoWWGvaoRQEkDcEUZcRUHVFBroO7N3L0DQYnFFGu
         sruCW0sllKFUGLvY4ODU3XzVL3vOdWEo++x7NNtnMsk+TkFXidastqKw632nW57Ac7K4
         3VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706181; x=1761310981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGKDfE0A1cACCMPV8YCD5oZ7MKC1yN7hImN3+ghbSLo=;
        b=T1Blg2SS0y+/jnMG1dh+MnLgQ7mbNMgR3OsEma9+d/fvIAdpQgkrk3sBShISbEXq94
         L6VOCkHAeRiqv3tMYsoAHWNhyyAQSiQ3bkDf7EZ6Pu+DNpcYE0TsYl+JzKJAFIbmDmSz
         ukdUND57l5RkhoX7DsZhsVZdrblmeA+ZQ3ngTLT4ahtBOHKvSI0ELStHrt+WRuPPIb++
         igHRyAuDf/Hjr8JHDveCutWgxlOkggP8qPIrkMR81enNS/SmCLtxwtdKeey4jpTMdBZK
         zLdG4G5sTCwK7WPSKgegmNoOIG1YdxkavP/zlmAWaE1qV3XtpnxKxKtw7rcgxRma2iqY
         29bA==
X-Gm-Message-State: AOJu0YyufHo/OGBNeNQU1CJdjKmGW77CIbAizPFg2HSSsPocKc/dJ9Kb
	MF1pexdf5Be2R9W5mdaN/AnyDrLikXA51xyymSSuJ/fPxbF4al5Zn/P/F9Xwow==
X-Gm-Gg: ASbGnctWGSfq9S1W0ddRC4IgSwLbUpVGt9p0tElWRemuCnemS79idaBT6paoFBFApL/
	hopNOMVsUlh3VXmDNHIPvOMMTHmorQFhdHsPtPAdO1rxv0Gjun4YiVnHyQVCV8uuHGq1OIVZ5UJ
	oqcSuVkZEOVt6v00UNIAE0qCmL14McS3HaTO2mmJ5tuH6Bab6zjq70HHH4yAvH8FJNf9kHyTJt9
	4b7d3sc0PgePyalL7109LPg3itFPc75c3TolVc5C4ktaWCjvoojkEL41ab2H69p2m0YRUKuo9Oj
	jDG+xAqrN6QSKscJ5iuajPcqxbLaA3NqW4mFX/H+fShmZAmXP0gn/bGO8zyx506Mg3zNk0GtFYq
	26zmlzpDhnYiN0zBscDk2fZyCPsQiCN/B9WGRE9tZ7elmDLoOVQ5JVPeGwUyF8EFqMEbacJeLqA
	/eriraMo69Cgbst51mKTo/mXbhXi4thWaH+Q==
X-Google-Smtp-Source: AGHT+IH0+SSUhCOjv3bcrrkYRPa59yOIsxv7BP6qzZHakbVEu/BrsIiYM8QJqc80uEFW2zIFj4iqvA==
X-Received: by 2002:a17:90b:3fc6:b0:33b:aea7:98ba with SMTP id 98e67ed59e1d1-33bcf92838amr3905038a91.30.1760706181118;
        Fri, 17 Oct 2025 06:03:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6626309sm5517732a91.7.2025.10.17.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/29] hwmon: (ltc2947-core) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:09 -0700
Message-ID: <20251017130221.1823453-18-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
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
 drivers/hwmon/ltc2947-core.c | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index 90f70f732b41..ad7120d1e469 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -120,12 +120,6 @@
 struct ltc2947_data {
 	struct regmap *map;
 	struct device *dev;
-	/*
-	 * The mutex is needed because the device has 2 memory pages. When
-	 * reading/writing the correct page needs to be set so that, the
-	 * complete sequence select_page->read/write needs to be protected.
-	 */
-	struct mutex lock;
 	u32 lsb_energy;
 	bool gpio_out;
 };
@@ -181,13 +175,9 @@ static int ltc2947_val_read(struct ltc2947_data *st, const u8 reg,
 	int ret;
 	u64 __val = 0;
 
-	mutex_lock(&st->lock);
-
 	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, page);
-	if (ret) {
-		mutex_unlock(&st->lock);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(st->dev, "Read val, reg:%02X, p:%d sz:%zu\n", reg, page,
 		size);
@@ -207,8 +197,6 @@ static int ltc2947_val_read(struct ltc2947_data *st, const u8 reg,
 		break;
 	}
 
-	mutex_unlock(&st->lock);
-
 	if (ret)
 		return ret;
 
@@ -242,13 +230,10 @@ static int ltc2947_val_write(struct ltc2947_data *st, const u8 reg,
 {
 	int ret;
 
-	mutex_lock(&st->lock);
 	/* set device on correct page */
 	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, page);
-	if (ret) {
-		mutex_unlock(&st->lock);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(st->dev, "Write val, r:%02X, p:%d, sz:%zu, val:%016llX\n",
 		reg, page, size, val);
@@ -265,8 +250,6 @@ static int ltc2947_val_write(struct ltc2947_data *st, const u8 reg,
 		break;
 	}
 
-	mutex_unlock(&st->lock);
-
 	return ret;
 }
 
@@ -295,11 +278,9 @@ static int ltc2947_alarm_read(struct ltc2947_data *st, const u8 reg,
 
 	memset(alarms, 0, sizeof(alarms));
 
-	mutex_lock(&st->lock);
-
 	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, LTC2947_PAGE0);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	dev_dbg(st->dev, "Read alarm, reg:%02X, mask:%02X\n", reg, mask);
 	/*
@@ -310,13 +291,11 @@ static int ltc2947_alarm_read(struct ltc2947_data *st, const u8 reg,
 	ret = regmap_bulk_read(st->map, LTC2947_REG_STATUS, alarms,
 			       sizeof(alarms));
 	if (ret)
-		goto unlock;
+		return ret;
 
 	/* get the alarm */
 	*val = !!(alarms[offset] & mask);
-unlock:
-	mutex_unlock(&st->lock);
-	return ret;
+	return 0;
 }
 
 static int ltc2947_read_temp(struct device *dev, const u32 attr, long *val,
@@ -1100,7 +1079,6 @@ int ltc2947_core_probe(struct regmap *map, const char *name)
 	st->map = map;
 	st->dev = dev;
 	dev_set_drvdata(dev, st);
-	mutex_init(&st->lock);
 
 	ret = ltc2947_setup(st);
 	if (ret)
-- 
2.45.2

