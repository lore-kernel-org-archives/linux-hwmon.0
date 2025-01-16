Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A924A7C9;
	Thu, 16 Jan 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038384; cv=none; b=IwBBacOvOn6zAwHxv+uHZWLOX/+BqpxsVgWB8oaoXNQx4Uia7SnM4BzxSgdu7m6XN3JSBgPSZaorots+IOWuAWwFM52dpPcRD29MWWtOW01p7k6WZQQS7XYUeiw5KyAgloHQ7HH9cRD58p6wbQLh6mMwtr1YExRE+6mHzaWPN1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038384; c=relaxed/simple;
	bh=A7PN/W/9XIAKQaAYgBJLaQkF/qLNPDB+iP5j7M2bcqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mU/6M8mZeW7mEQOzzY65RMjvVvT455M3mnvM0J7fTrxFxI628MwZEPdekTtJoyGxpxnD1iMu+kygkpWXarOoDDpYcYPHgv1mgdJB4uKP5vY5VYPyMwuUdAGhKYvDe7E6/grJsT25Em9vPyDNYZJ4ZBFZC7oO81LaVCG1l5WMLos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJipq0m4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJipq0m4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb95317so19125525ad.1;
        Thu, 16 Jan 2025 06:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737038382; x=1737643182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHzUmAwmIyvzmP+BqHnUhuRQQDuum4pzxibi4JWAww=;
        b=QJipq0m4GJFTInY9K39HNBN2KdgJ+tK1mmAaBkkD9oWbHavdl23FY3T0mMt1zw3nGI
         J+603IJHjH0ZwD5eF+rgF7LImwr8Ngla+lSxfHW2wR6CWZqGZ+mqUpkglmV+cHNykZ+r
         dCRklBVm55t46NNDM84sVINzwhCmloGUixqn2iDxAWD2u6sJhiTMvx1OSxjIdRTNESJN
         arm9hwpiNpEWfR7wr+zO8V+VMJITNIubtIbO5Ahppk1HEYQwz2JXx5HTjZo8ieR5xsLM
         MmXD0p4jpeu8AHk4aj0wBnnzF3XrTSiaQb4nl78glaEQHvKjVZKf0FQ/i5sHq0DkmUJ8
         H+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038382; x=1737643182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNHzUmAwmIyvzmP+BqHnUhuRQQDuum4pzxibi4JWAww=;
        b=liDt2YNa6FHxZC1n0tuoEh1MN/0a4+3BJJJrx52r9EgeB4OVBmvKIu+Po+mB3jqks9
         vZRmQoHpzMe8NjQC6XDqgfxmmGl37+zZU7kg7NRgG9CBlcnCUjxrlaIHdXZE2ThBA2e7
         8iATQLN38bNtk7U+dsXhhR6cIERXkrd+rSpxgbQBy8ocWWwS/x6PTw0bK/CdzVskKKQP
         XTkRtsL3ux2oXuBrOuOd8/kX49wCDr4VuUgBdi92NijbCBz4QwEEweXLqZGZQlWoZzlh
         utlxd4g+1tPz9C9RtjJaUkqj6BFF3OYpxna/SoKCDf32NXU9ubxm1tnnprRC4D8arGP1
         2uHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6xtpYnsg9sbSED0tjtP0xjYfzQfeA6lgUTyOqTsqXKwblOBRGvQ5YUECEBW7p5jO4v3UAzW5m+n+wMijb@vger.kernel.org, AJvYcCXU1HrllDNWHGj6SZQIIXTnDlkBUTeyJ+ZabkxkTyCZH6Gf+ADSfazgecRa7avN6PskYk3aSJXMfXfB/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeMGzE/VJK0O3x9kxXkntM2oufcYsdpGriKcshF40SKL/HjSw
	P+U+2uXRnaRXOhVdE9eUOkNyyPBIOuAgtgrvUwyoMaUMR2hQqn6r
X-Gm-Gg: ASbGnctBeU1skehkMq6hPdfqtfn1kDtFYUyzT30i3DoHeNPSeg0koT8GLcz99QCzyhY
	RxoxkncXTyGhAUVzPh/8G2CE6X3zsm4pJrktBHbaB2bV+YReKEfXE55FRI7r86r50h4+/kNU0X7
	9yop5qw/NxcQRY4F5udYQihsFjia5muepswjpTLCmGx00cdVbMkZrgcRLHTHZv1QsMczSaXiihW
	DY5JceMe/bYkBXpHv0SXdvCk9BvTleixubBjRZRHX4fYq8vXsbd6z3h8xIiErdt7ACx8ethEcU=
X-Google-Smtp-Source: AGHT+IFlPOlopm2aNcjlCQVALc8W5r606mzcihHbgj7Vt1pJiZ25qpoKVreb8xapdHf01+bifZh9bw==
X-Received: by 2002:a05:6a00:1c92:b0:725:e73c:c415 with SMTP id d2e1a72fcca58-72d21fd8afcmr48857027b3a.18.1737038381563;
        Thu, 16 Jan 2025 06:39:41 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8898:ddd1:da20:3254:f45:fbfc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f041csm94995b3a.6.2025.01.16.06.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:39:41 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4] hwmon: Add T2 Mac fan control support in applesmc driver
Date: Thu, 16 Jan 2025 20:09:19 +0530
Message-Id: <20250116143924.3276-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

THIS PATCH IS A RESEND OF THIS PATCH:
https://lore.kernel.org/all/20250114045256.3211-1-evepolonium@gmail.com/

This patch adds support for fan control on T2 Macs in the applesmc driver.
It introduces functions to handle floating-point fan speed values 
(which are required by t2 chips).
The fan speed reading and writing are updated
to support both integer and floating-point values.
The fan manual control is also updated to handle T2 Mac-specific keys.

Guenter Roeck asked "Does this limit still apply?"
so yes the limit still applies.

Changes since v3:
--- fixed error by kernel test robot about FIELD_GET and FIELD_PREP by
	by adding linux/bitfield.h

Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>
Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/hwmon/applesmc.c | 123 ++++++++++++++++++++++++++++++++-------
 1 file changed, 101 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..f899b17dcc1e 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -33,6 +33,7 @@
 #include <linux/workqueue.h>
 #include <linux/err.h>
 #include <linux/bits.h>
+#include <linux/bitfield.h>
 
 /* data port used by Apple SMC */
 #define APPLESMC_DATA_PORT	0x300
@@ -74,6 +75,7 @@
 #define FAN_ID_FMT		"F%dID" /* r-o char[16] */
 
 #define TEMP_SENSOR_TYPE	"sp78"
+#define FAN_MANUAL_FMT		"F%dMd"
 
 /* List of keys used to read/write fan speeds */
 static const char *const fan_speed_fmt[] = {
@@ -511,6 +513,32 @@ static int applesmc_read_s16(const char *key, s16 *value)
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
@@ -841,16 +869,33 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
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
 
@@ -861,7 +906,9 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	int ret;
 	unsigned long speed;
 	char newkey[5];
-	u8 buffer[2];
+	u8 buffer[4];
+	const struct applesmc_entry *entry;
+	bool is_float = false;
 
 	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
 		return -EINVAL;		/* Bigger than a 14-bit value */
@@ -869,9 +916,20 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
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
@@ -885,12 +943,23 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
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
 
@@ -900,28 +969,38 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
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

