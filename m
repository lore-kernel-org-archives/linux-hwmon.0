Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D9F331A4D
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706194; cv=none; b=gDW3PpIfyL1S0XchkjI2DTbK/LUhoD8g/oyiRxM5ql1PUBWkg1KmW6Mh9qrKXym5tmZLLeuTY6YuA289i112exCkMrbWuUWDpBd1P2JYfd/TQS4B6HjMoYvIrZUoCDwY/p3OTWowWN7U6WPgQ5I3GVE4ojl+/2qdju3nGHyi7PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706194; c=relaxed/simple;
	bh=bFSHDI1CQ/SPO/A4BKptuND+NVGYTDN5r3DOWBMKrYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W52Phu0Vbxy8QiHHEtE67dVnFHW5EbnC3Xv82OwReAxuxgYLYZhG7Zt0GYQpY4gHZQmdscVRbJMSZPAfvBj8uuEVsA8I/fpEdACLSIsmv7zIXwMNtIUVB5LrKj17pqHJF0E+9AM73e3TQH/1RMjqKLUWWrNAI5uypxDXKg1AZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoQpUE7U; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoQpUE7U"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33067909400so1486857a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706191; x=1761310991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfUSHdKkXVL8sQqCLX2LBAnsOyQkR0UEZT73XZwsoYY=;
        b=KoQpUE7UC2dL7TG75juQXQ/PO7q2V/hHkZzckBZ2zL/kuWPj/5pweDj6pR5Tf73d7f
         +s0i9q1ut5wg8QrBGNMeqJF+aRxxH/YqX4/BqDM7rM/Sd+ZKczQz3YMzY2XJKALroEG2
         qWK0sgV1tMbpVFncdY1JF6as2nGYWzBdvGUxSHf1bf5TsxUs1rqyoUunxCu4HXWwUNRl
         8mZ4en9FR0hrdCbjVYPbM25CIJU4Far6JH8/qEVlPc3zTxbqr37Xgw9vywmnPj0yBvqh
         xUZ94m37Vf17ZIW/8F4G4/dgYE+ABbH+qN3OP8Qs6Uq0t3ufW1/KF7opI/iHSIKJMDyx
         eShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706191; x=1761310991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfUSHdKkXVL8sQqCLX2LBAnsOyQkR0UEZT73XZwsoYY=;
        b=OW4F3G2b/12o7p0MuO8wBVd9Wz2o+vffcKn8Gn56azIG8K70y0D+wD9qPzaQgAB3of
         LVxD9kky+56QKJe52KQUJIMbudmpGVW3rfBjjngo9ncGn4NVnJqqrHfkPi/5L9jClWwn
         H0u8yB6bVk4vAhjnLSKzCNrIk0dynZnK2rgiiXOfXeS4I/wiaGgJ2Fu1QVIRrebnbXgH
         sm+OvMSGPrGx4EZiqJPVQE+LeD9DXgHJfpPIdiTyjKCcHdjzBDliDCNuODQbv/FQSk6v
         DE1vz8DEee/+UrukniY858sRljffKpPUqx8kgUc+jkDf2wv7TNcnTKuB7JlELJ7mKqS5
         1nTQ==
X-Gm-Message-State: AOJu0YzxrkRmJ2/OrxmW52/3uE4bqeYVlB4ss6lH2+jkzuiGFj5R8p5w
	JiXLLHvD8jI23DPQuP8hL7C8QOPUOGxSZOVh3942iFdmYLnVT/laUnN3Dpz9zg==
X-Gm-Gg: ASbGnctNcsQKBeQsqmaa1eCsNPCHRzr1/Rj1h7rDbksKhrYM4Zx691skdgYAQrj2/Um
	h0cwRs3c4swECguK4RmQ2wjC9/AjcQwqDYsOS4P0n7aI6lwlFBqYU1l49mv2PUneoZh7D2hErUc
	nlqRZ/yMisLQHdxI9MfJFoQD+eZj9s3z9QvgkB5whLArrbfviJC1E9XrnqtTVkvo1DFkYgrlfF8
	Qkg2N414Dew3cebQ1EaUpx0O9LelysEPjfXaEYB7ifTx41IZWJpAvbT61NIf6zk5FUzt0926jnd
	/6xKdw0ZGJp9B9AXECegK+lj4eKAUlK2qYx8rOnsgZuIYXbUtaDY6OL1YNg22hlYGGqeoRAL81s
	XVBt90gI27fR1rP7eNx4jCGoOZPVqJmf8WdSut40UIyvgeghhvUn8QeLpTGpNOYfceHNn6C0+a5
	Slg036aEvMbK+D2THYA37G+gw=
X-Google-Smtp-Source: AGHT+IFD15bz9gkCNiDR1x3k+7TQN4c5XEHhMwFiEdjoMk/8Id7fU7bUcbBGZZNSsQvjFqtNcP3PHA==
X-Received: by 2002:a17:90b:4b0f:b0:33b:6ef4:c904 with SMTP id 98e67ed59e1d1-33bcf8faaf5mr4442428a91.20.1760706191074;
        Fri, 17 Oct 2025 06:03:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb66bf2a4sm5571044a91.20.2025.10.17.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 22/29] hwmon: (ltc4282) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:14 -0700
Message-ID: <20251017130221.1823453-23-linux@roeck-us.net>
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
 drivers/hwmon/ltc4282.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 44102879694a..b9cad89f2cd9 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -17,7 +17,6 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/property.h>
 #include <linux/string.h>
@@ -131,8 +130,6 @@ struct ltc4282_cache {
 
 struct ltc4282_state {
 	struct regmap *map;
-	/* Protect against multiple accesses to the device registers */
-	struct mutex lock;
 	struct clk_hw clk_hw;
 	/*
 	 * Used to cache values for VDD/VSOURCE depending which will be used
@@ -281,14 +278,12 @@ static int __ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u32 mask,
 static int ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u32 mask,
 			      long *val)
 {
-	guard(mutex)(&st->lock);
 	return __ltc4282_read_alarm(st, reg, mask, val);
 }
 
 static int ltc4282_vdd_source_read_in(struct ltc4282_state *st, u32 channel,
 				      long *val)
 {
-	guard(mutex)(&st->lock);
 	if (!st->in0_1_cache[channel].en)
 		return -ENODATA;
 
@@ -300,7 +295,6 @@ static int ltc4282_vdd_source_read_hist(struct ltc4282_state *st, u32 reg,
 {
 	int ret;
 
-	guard(mutex)(&st->lock);
 	if (!st->in0_1_cache[channel].en) {
 		*val = *cached;
 		return 0;
@@ -317,7 +311,6 @@ static int ltc4282_vdd_source_read_hist(struct ltc4282_state *st, u32 reg,
 static int ltc4282_vdd_source_read_lim(struct ltc4282_state *st, u32 reg,
 				       u32 channel, u32 *cached, long *val)
 {
-	guard(mutex)(&st->lock);
 	if (!st->in0_1_cache[channel].en)
 		return ltc4282_read_voltage_byte_cached(st, reg, st->vfs_out,
 							val, cached);
@@ -328,7 +321,6 @@ static int ltc4282_vdd_source_read_lim(struct ltc4282_state *st, u32 reg,
 static int ltc4282_vdd_source_read_alm(struct ltc4282_state *st, u32 mask,
 				       u32 channel, long *val)
 {
-	guard(mutex)(&st->lock);
 	if (!st->in0_1_cache[channel].en) {
 		/*
 		 * Do this otherwise alarms can get confused because we clear
@@ -412,9 +404,7 @@ static int ltc4282_read_in(struct ltc4282_state *st, u32 attr, long *val,
 						   channel,
 						   &st->in0_1_cache[channel].in_min_raw, val);
 	case hwmon_in_enable:
-		scoped_guard(mutex, &st->lock) {
-			*val = st->in0_1_cache[channel].en;
-		}
+		*val = st->in0_1_cache[channel].en;
 		return 0;
 	case hwmon_in_fault:
 		/*
@@ -612,15 +602,11 @@ static int ltc4282_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_power:
 		return ltc4282_read_power(st, attr, val);
 	case hwmon_energy:
-		scoped_guard(mutex, &st->lock) {
-			*val = st->energy_en;
-		}
+		*val = st->energy_en;
 		return 0;
 	case hwmon_energy64:
-		scoped_guard(mutex, &st->lock) {
-			if (st->energy_en)
-				return ltc4282_read_energy(st, (s64 *)val);
-		}
+		if (st->energy_en)
+			return ltc4282_read_energy(st, (s64 *)val);
 		return -ENODATA;
 	default:
 		return -EOPNOTSUPP;
@@ -688,7 +674,6 @@ static int __ltc4282_in_write_history(const struct ltc4282_state *st, u32 reg,
 static int ltc4282_in_write_history(struct ltc4282_state *st, u32 reg,
 				    long lowest, long highest, u32 fs)
 {
-	guard(mutex)(&st->lock);
 	return __ltc4282_in_write_history(st, reg, lowest, highest, fs);
 }
 
@@ -696,8 +681,6 @@ static int ltc4282_power_reset_hist(struct ltc4282_state *st)
 {
 	int ret;
 
-	guard(mutex)(&st->lock);
-
 	ret = ltc4282_write_power_word(st, LTC4282_POWER_LOWEST,
 				       st->power_max);
 	if (ret)
@@ -803,7 +786,6 @@ static int ltc4282_vdd_source_write_lim(struct ltc4282_state *st, u32 reg,
 {
 	int ret;
 
-	guard(mutex)(&st->lock);
 	if (st->in0_1_cache[channel].en)
 		ret = ltc4282_write_voltage_byte(st, reg, st->vfs_out, val);
 	else
@@ -821,7 +803,6 @@ static int ltc4282_vdd_source_reset_hist(struct ltc4282_state *st, int channel)
 	if (channel == LTC4282_CHAN_VDD)
 		lowest = st->vdd;
 
-	guard(mutex)(&st->lock);
 	if (st->in0_1_cache[channel].en) {
 		ret = __ltc4282_in_write_history(st, LTC4282_VSOURCE_LOWEST,
 						 lowest, 0, st->vfs_out);
@@ -861,7 +842,6 @@ static int ltc4282_vdd_source_enable(struct ltc4282_state *st, int channel,
 	int ret, other_chan = ~channel & 0x1;
 	u8 __val = val;
 
-	guard(mutex)(&st->lock);
 	if (st->in0_1_cache[channel].en == !!val)
 		return 0;
 
@@ -938,8 +918,6 @@ static int ltc4282_curr_reset_hist(struct ltc4282_state *st)
 {
 	int ret;
 
-	guard(mutex)(&st->lock);
-
 	ret = __ltc4282_in_write_history(st, LTC4282_VSENSE_LOWEST,
 					 st->vsense_max, 0, 40 * MILLI);
 	if (ret)
@@ -974,7 +952,6 @@ static int ltc4282_energy_enable_set(struct ltc4282_state *st, long val)
 {
 	int ret;
 
-	guard(mutex)(&st->lock);
 	/* setting the bit halts the meter */
 	ret = regmap_update_bits(st->map, LTC4282_ADC_CTRL,
 				 LTC4282_METER_HALT_MASK,
@@ -1699,7 +1676,6 @@ static int ltc4282_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
-	mutex_init(&st->lock);
 	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4282", st,
 						     &ltc4282_chip_info, NULL);
 	if (IS_ERR(hwmon))
-- 
2.45.2

