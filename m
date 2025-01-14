Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5199942A83;
	Tue, 14 Jan 2025 04:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736830384; cv=none; b=CSEz2tGi6uCzTorqCWXLI2IqTEuXB7cAtm+xNB1E1fPPTei230f+CFoT0Yiny1xiOqTkRAWe6AmlSHrxZv6UbwXlbtCpTzFAs1MM+s3FtM25W5aEsUUMSwzLZUhz/UpMk4VcTcA7FV/wVqyisE0qXvObr+0GZOSOZ2y9P16Be7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736830384; c=relaxed/simple;
	bh=OwseRo9JVITQTDYD1C/ITU7kxhDtG1Poha9WM7MItpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c+G0E2UxZu5ok6EzNBba9BBBtcwui3KpVFadYZPjGx35HIgx5Fvzk7zNAq7yjQPkvWzCwuhXjDbqCjoUwn2bLWeDyJ110RksTYz5sM6qDShjdo5jEKETLOcsO0PI/9hP0j2OQlG8beobfoG6hOTPWVgdASksjn1gko5WhCUx/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yljn6Z9J; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yljn6Z9J"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so6969481a91.3;
        Mon, 13 Jan 2025 20:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736830382; x=1737435182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2tHE6ex9/A4/+ye7K/SxypgP05rCiEhD2Ur6d2ZKlI=;
        b=Yljn6Z9Jt8oWDptNriE+Jf1hK0dpN7QSk5fomwmK1s0iR5vRlnKTpN0hyk9dKIJ2Va
         0fEFQkqIKo6VIffxw2i6xijVCC662LeLi0VaRI2grInAx/ZMaRE8XT8i30bVDM+EujuX
         xSw+uT1SzgLIKlKO+m23cKAHtQODk04LDIIi4GXg+Z9Uv7BWouYJHooti6G9Nr+jHqLy
         odq8AEVXMn1T/+3eWyWOBbxkUYdbwJ+eHJm35uRMyONc2IbIoePLAsiWXjNTDDpFIlNp
         D2hxiZmjOrMxqpVl7gR+mzXqg0NQA9x3Nvf3d0LKKzfEIyzgDt2S7laQiGykGyh1IM2T
         VicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736830382; x=1737435182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2tHE6ex9/A4/+ye7K/SxypgP05rCiEhD2Ur6d2ZKlI=;
        b=W0yOmTi1AL5CtRx61lxAOabzoC+w0c/vj38/7TmHCND7nvlf7JrhvAB/IXwLmqLHwn
         qIY/Q6mCSZljOGLLz2mvHYTIsYJdiUu2mH2cyx2IB+hRnxEhAdKMY1YryJzTNv3XDm3v
         PYuUDMRTJjRx6BEvi1RCvgAMCYnzG4FoMKA/c6K6b/lrQXm2tdOZnHutyaX5Hn9CmIHT
         nOnEmZHzInAOwImc4jVvPynQsJ25zApNFZ7uCMRRjSp+ULW0AlnMjXTf7iEuGc32HEQi
         vkgm1gGvZ8un05Txelot0Z9NNK/oHaHR1wwfDTfg6DTuqxup6pnAKnlUCyFiIy8ESsVq
         kTWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSDzLh4qsuGad0yzm2GK38SxXRMAvao4RClI9KUbFv5VfQnu4/IEbhOBxu+SeWmMSmXad2frDye8Oycw==@vger.kernel.org, AJvYcCUuoKKGPiJU5PAFz2d1q8U2CbLa9ElFtWtSMV63VO6UvXAPsFO/oD/EmXZ3GGVCgltnBB4U1YIJcYShbmQv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk2ulV/DGLaF5SSTt/GE72H1opnCbof8alXJglcP7v7MtDeEPk
	KA+DyeFcuAL5Ibza3/ZGcK9k+n8hJIiCwz0rHgwnOF/Fwqjgzx1d+FNnLA==
X-Gm-Gg: ASbGncuXKiy6rmKZxcqt2+WVKB9U5DDHCHSDjd2FlRbW+gGJrRTYUY+1K7jui9jAy3T
	sPqDNbrsKI/nmoG2UY6d2IuTzof4aC2gOg0RDIcO001W0Fm9e7ph4WNTtcNkTofn0Ftt6L5xUuF
	C/lytqlix6sKea8zbx9xDXu//dGU6vxk/qDsZ219Emt6/77/F/J5aep7NHscQ/yltLpHoC+T3H4
	Szti8N3gStg31h9ZohiAZIC7p5shO57A3oz53HjDNpKeUSqvyxSpb5PDvCx9N2MXJJMtm+tz49B
X-Google-Smtp-Source: AGHT+IEsCE9CxxUx+kN7h172AKpGCxSom73KMORrtIPqrklB54x0Ch6AcTGd220zqp17hcgq+FLN4Q==
X-Received: by 2002:a17:90b:1f8b:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2f548f1d44cmr32691060a91.30.1736830382519;
        Mon, 13 Jan 2025 20:53:02 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:3753:2c05:4b4f:5fdb:b518])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f256e39sm61137345ad.226.2025.01.13.20.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 20:53:01 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon: Add T2 Mac fan control support in applesmc driver
Date: Tue, 14 Jan 2025 10:22:53 +0530
Message-Id: <20250114045256.3211-1-evepolonium@gmail.com>
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

