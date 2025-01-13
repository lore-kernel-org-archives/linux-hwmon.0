Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45ED2343D8;
	Mon, 13 Jan 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757916; cv=none; b=OeUW4otH7vzKEAW5Ssz4WsgqV5VGcME9SkS/4B+s24dXhqiddb1lK45w02loEwJtiPH4MXGWxG9H1vKA4WE7g7in6HfckhcSnkb2l30wcCTWRb3uZfQK4L9HvcVz8j66adyJWvuCTpFLcN9HfpQV8JPHtaNDnffQEq3prdbi8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757916; c=relaxed/simple;
	bh=NYrdCwIRx59E5qpdOhPT3SEF2kAO83+nvi8ebEFCQSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HmpEj2mWQ5phc3Q7alGt2YMbErsmA6CntTroyb56Q+qIHW4G1tMsiQYj/twxYpxn/BYO2XLvc8d3rkFwDe1yevxbQzupGXrKp9xE0GmS0FL9rfDN8NSWtg77/IDFFioTOczXDQr89HDOVCvmdSmIV/2mnglZ1dCYulSPEcOn1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYIhJA88; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYIhJA88"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2165cb60719so69322825ad.0;
        Mon, 13 Jan 2025 00:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736757913; x=1737362713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/G9Rl677QrBr25d6/VhADY5RVF28PzIax7Yic9ObSY=;
        b=cYIhJA88QK/4t5n4JyGUanD2SvkCxNi1gNBZ09kRd539lUw+JXZqcCvVDpIEzPfijs
         iSD5l8so/Q/84A6vpfnhnXWdnC2dIHmty9hGorK43veS/i+ZdLua3itqIkuZuoeh8ZXW
         A6Nib+ZppYi9+LOYSSc8J67nw8HM8b0aSgMg2xs8Gt7p1V/Ix4CcEZK/204Ds7E2smgL
         wPOTbd+rMZHpoqd/8zl26GCobZayapr0p3ejLtFVMTqK6kqMTjzPuj0kFBCoww1MjYMs
         xWnKmGVSsZochmb+vFnHrV4avzJ6mQfVaF473kNIy9UA1pS4Nx/VsbrbyKd1ctDySXAd
         1oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757913; x=1737362713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/G9Rl677QrBr25d6/VhADY5RVF28PzIax7Yic9ObSY=;
        b=esundokm4w/el5BG1bmU3maRDZXx6bKaL8Ntj32VoHgLTMFev2qb0wNOOOnJqkJwOE
         F69um7dewCP/dE1YaqO/E5wMmropXFjlIffN9zqij/EerqqflPzKauxL7dk6CowCoRxK
         zhZWwxooJ5r4y0u6b7QbTpjeW8mH1vTcGUXHQtxYduLxpqjkfHr+zISPFayM93LWMc4S
         6IYTZloPf+kc1x5K2C6VFd1gJJmWjhivPg0sYDHzQdLXanrSMVb40Z//UxGzHJ7oQI/7
         A33A0LardAEW9djAyo3Lvq8HNpkHrVfYTqy0YNpEgLWKyjy7sM5KbCiUD+WE2nqS/7/1
         cF3g==
X-Forwarded-Encrypted: i=1; AJvYcCXQmDgqPp+Vw4z5FdD02b/okz52owP6w2G8oTi1lvtjpMJO08chDw78j88pJE8ZDJhiq8RiqSFAQGjtwTXT@vger.kernel.org, AJvYcCXaA8xqhHrxFpT26y4QssRr+NINYznpfQ3eZD+/QUPCGqE4RBsvCDHwTYtrboRXFW54tMVwdd6GAdyNyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZ+gb1KxZeFbb1lYISuYCy3PiXqS45z9cjyCkVTnmBYL5MA0m
	MZe/hIdo/f2dcFM48reiRCuDTdfpYECgFuDoRZljJjam9RQvWwD5
X-Gm-Gg: ASbGncsFEy5imcImGHeBWnkPi+WkSPLerOrIeN3oYTtwuu4S4zlQEJ7VmHXdrfpERvR
	h5BoE8Q4+KOlequj6uHC05FS2/d8jQ/O7TJV8uEk6oVkMAHwakTJF34VbdS/65d0Ybes5cIqP1w
	EVyj3FYR0A/1UmEHjn8okeFxoZtHAbd1YW5QMgkY/reefp1I5x+BdJSlN74DrbiBeXm2hFN6KpH
	ryRSkoNOzMDUu0v09gaCrjZF52J3pXD/xBb5B8kXL7RDqEp5CA+nb1GGpxlnZ3Os8m06eG9p54A
X-Google-Smtp-Source: AGHT+IEBQguygIUoZwzS6oqiRBlTVdMwMPscGZ76WZ0zTTg5ZtGbSNxENq/3tVEuQUxyNpwSvc2yNg==
X-Received: by 2002:a17:90b:5145:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-2f548eac5e3mr29942548a91.11.1736757912980;
        Mon, 13 Jan 2025 00:45:12 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:3753:b463:2e95:4e67:8c7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942a425sm7417216a91.21.2025.01.13.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:45:12 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3] hwmon: Add T2 Mac fan control support in applesmc driver
Date: Mon, 13 Jan 2025 14:14:57 +0530
Message-Id: <20250113084503.228037-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for fan control on T2 Macs in the applesmc driver.
It introduces functions to handle floating-point fan speed values 
(which are required by t2 chips).
The fan speed reading and writing are updated to support 
both integer and floating-point values.
The fan manual control is also updated to handle T2 Mac-specific keys.

Guenter Roeck asked "Does this limit still apply?" 
so yes the limit still applies.

Changes since v2:
--- fixed checkpatch issues
--- used function such as BIT(), FIELD_GET(), BIT_MASK() 
	in function "applesmc_float_to_u32" and "applesmc_u32_to_float" 
	for readability.
--- added error handling in function applesmc_show_fan_speed
--- used applesmc_write_entry instead of applesmc_write_key 
	in function applesmc_store_fan_speed
--- defined "F%dMd" as FAN_MANUAL_FMT

Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>
Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/hwmon/applesmc.c | 122 ++++++++++++++++++++++++++++++++-------
 1 file changed, 100 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..e792d4283861 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -74,6 +74,7 @@
 #define FAN_ID_FMT		"F%dID" /* r-o char[16] */
 
 #define TEMP_SENSOR_TYPE	"sp78"
+#define FAN_MANUAL_FMT		"F%dMd"
 
 /* List of keys used to read/write fan speeds */
 static const char *const fan_speed_fmt[] = {
@@ -511,6 +512,32 @@ static int applesmc_read_s16(const char *key, s16 *value)
 	return 0;
 }
 
+static inline u32 applesmc_float_to_u32(u32 d)
+{
+	u8 sign = FIELD_GET(BIT(31), d);
+	s32 exp = FIELD_GET(BIT_MASK(8) << 23, d) - 0x7F;
+	u32 fr = d & ((1u << 23) - 1);
+
+	if (sign || exp < 0)
+		return 0;
+
+	return BIT(exp) + (fr >> (23 - exp));
+}
+
+static inline u32 applesmc_u32_to_float(u32 d)
+{
+	u32 dc = d, bc = 0, exp;
+
+	if (!d)
+		return 0;
+	while (dc >>= 1)
+		++bc;
+	exp = 0x7F + bc;
+	return FIELD_PREP(BIT_MASK(8) << 23, exp) |
+			(d << (23 - (exp - 0x7F)) & BIT_MASK(23));
+
+}
+
 /*
  * applesmc_device_init - initialize the accelerometer.  Can sleep.
  */
@@ -841,16 +868,33 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 	int ret;
 	unsigned int speed = 0;
 	char newkey[5];
-	u8 buffer[2];
+	u8 buffer[4] = {0};
+	const struct applesmc_entry *entry;
+	bool is_float = false;
 
 	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
 		  to_index(attr));
 
-	ret = applesmc_read_key(newkey, buffer, 2);
+	entry = applesmc_get_entry_by_key(newkey);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	if (!strcmp(entry->type, "flt"))
+		is_float = true;
+
+	if (is_float) {
+		ret = applesmc_read_entry(entry, buffer, 4);
+		if (ret)
+			return ret;
+		speed = applesmc_float_to_u32(*(u32 *)buffer);
+	} else {
+		ret = applesmc_read_entry(entry, buffer, 2);
+		if (ret)
+			return ret;
+		speed = ((buffer[0] << 8 | buffer[1]) >> 2);
+	}
 	if (ret)
 		return ret;
-
-	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
 	return sysfs_emit(sysfsbuf, "%u\n", speed);
 }
 
@@ -861,7 +905,9 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	int ret;
 	unsigned long speed;
 	char newkey[5];
-	u8 buffer[2];
+	u8 buffer[4];
+	const struct applesmc_entry *entry;
+	bool is_float = false;
 
 	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
 		return -EINVAL;		/* Bigger than a 14-bit value */
@@ -869,9 +915,20 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
 		  to_index(attr));
 
-	buffer[0] = (speed >> 6) & 0xff;
-	buffer[1] = (speed << 2) & 0xff;
-	ret = applesmc_write_key(newkey, buffer, 2);
+	entry = applesmc_get_entry_by_key(newkey);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+	if (!strcmp(entry->type, "flt"))
+		is_float = true;
+
+	if (is_float) {
+		*(u32 *)buffer = applesmc_u32_to_float(speed);
+		ret = applesmc_write_entry(entry, buffer, 4);
+	} else {
+		buffer[0] = (speed >> 6) & 0xff;
+		buffer[1] = (speed << 2) & 0xff;
+		ret = applesmc_write_entry((const struct applesmc_entry *)newkey, buffer, 2);
+	}
 
 	if (ret)
 		return ret;
@@ -885,12 +942,23 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
 	int ret;
 	u16 manual = 0;
 	u8 buffer[2];
+	char newkey[5];
+	bool has_newkey = false;
+
+	scnprintf(newkey, sizeof(newkey), FAN_MANUAL_FMT, to_index(attr));
+
+	ret = applesmc_has_key(newkey, &has_newkey);
+	if (has_newkey) {
+		ret = applesmc_read_key(newkey, buffer, 1);
+		manual = buffer[0] & 0x01;
+	} else {
+		ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
+		manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
+	}
 
-	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
 	if (ret)
 		return ret;
 
-	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
 	return sysfs_emit(sysfsbuf, "%d\n", manual);
 }
 
@@ -900,28 +968,38 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
 {
 	int ret;
 	u8 buffer[2];
+	char newkey[5];
+	bool has_newkey = false;
 	unsigned long input;
 	u16 val;
 
 	if (kstrtoul(sysfsbuf, 10, &input) < 0)
 		return -EINVAL;
 
-	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
-	if (ret)
-		goto out;
-
-	val = (buffer[0] << 8 | buffer[1]);
+	scnprintf(newkey, sizeof(newkey), FAN_MANUAL_FMT, to_index(attr));
 
-	if (input)
-		val = val | (0x01 << to_index(attr));
-	else
-		val = val & ~(0x01 << to_index(attr));
+	ret = applesmc_has_key(newkey, &has_newkey);
+	if (ret)
+		return ret;
+	if (has_newkey) {
+		buffer[0] = (input != 0x00);
+		ret = applesmc_write_key(newkey, buffer, 1);
+	} else {
+		ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
+		val = (buffer[0] << 8 | buffer[1]);
+		if (ret)
+			goto out;
 
-	buffer[0] = (val >> 8) & 0xFF;
-	buffer[1] = val & 0xFF;
+		if (input)
+			val = val | (0x01 << to_index(attr));
+		else
+			val = val & ~(0x01 << to_index(attr));
 
-	ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
+		buffer[0] = (val >> 8) & 0xFF;
+		buffer[1] = val & 0xFF;
 
+		ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
+	}
 out:
 	if (ret)
 		return ret;
-- 
2.39.5

