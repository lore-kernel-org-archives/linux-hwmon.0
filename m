Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD57166307;
	Mon, 20 Jan 2025 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737398037; cv=none; b=NiUlL2hhc5ueUQuC+I8S2t7vDdBUXzunIFLCN9juD2VDMmRbtfMuD6/m5ZdTuKozxlzNu1r+newjK2etxKBWkBN36d0K3VFl0HcbMQnEtV4IBkzJkbiDuAQ02Guo6xOSk0eYydNGDp76Q+nhEeOsBDlImzxgebTMkYzkmxDUKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737398037; c=relaxed/simple;
	bh=Bl6FyCL6blBqJtug5oDomT6kVPUCLCevvz6Udo+kIgM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qZR8IHgHJKuk30arH38sIof1FjsApQGDGvh0SwWmavX1RAvk3Z+sHWcjiZ+OMoztnd8DmlyV490JKVrciiuTLSlAkXrLjN9FNWyIPRawNrlpdUIGaLuHgWZ7AB75qcpycNtE8Lmj/xPFuZYqvfCpCheSuxh4S4gBNX5Lx3HP2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVDT+/v9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVDT+/v9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so82522985ad.1;
        Mon, 20 Jan 2025 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737398034; x=1738002834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cGBoIaX7MiT/8F0FbJyvQ/d6j6a+R8dq2XGOYAV2p8=;
        b=QVDT+/v96JtxDbuw/wsPsKcd3kAASbse16h9uEh9bl86u5E7igq7GR/sZIFnpGhSmf
         PQwbPzGLh1JWb9lTu4gmOYy/19jRhtjmu3SIpF0GjeUts08QHv9bH2S0sWt6NQcM6oQa
         XFs+NSvxpX4R0V0i+BwOgzp1H33w118qzAxSDboEirs7t5CXED2cnXOyjBkDLjoJc1ip
         DcXoiag+49T9IVqH3Y6tU7ktYIFi7l/otqa0sNyiFUZoSxdUsRD6v4L/yvDvofJfBYO5
         R+Ap11KXxYw9pxcInw18YuOVTFTudnsTNXIXSa9peaULpjjBNupsLN3qIXwM2EpAKmlX
         UK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737398034; x=1738002834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cGBoIaX7MiT/8F0FbJyvQ/d6j6a+R8dq2XGOYAV2p8=;
        b=KI7WwN9Jub81mPykcGm8zDLx25inGw6u3zPuQHRQFMpi0GtZDlVI6muHMGklV/aA/2
         4vO308BW6YrlzNf61MmdShAUR/GTuglveEp7gCNtBPucuGhw+q6fvb+PjRA0APfY0yc3
         YGT5Xslbd2uKwulRELTo6X2Zj1Bfm9i04+HbwL21wtYjU+n49biaxv+jTfYVi1Df9rkP
         5hZyChqHVDgZoVLDqROmNmy7yA1DCRfB6BoGqakeRsN5w6S18xstjSHQe8OCUhc4Q1zJ
         glF0k34exnW3cl4nfJKmap+V3MocoP1tdhvUik6DA2YwsHGW9rUVQdPckf6W8ZhocylG
         oUBg==
X-Forwarded-Encrypted: i=1; AJvYcCV1FOGEOP9DnaP8qnTue+BsVLv+wjoWPOAxP77Sll2/al/ul8cJOpZ6y1AvPKXNI4Tt24AG4//qUtmQ1w==@vger.kernel.org, AJvYcCVZVwnLv/3W7yWUaMGuuOValmPnDErFyD43IXz1fW2Cao9JI3+uSHNlDufa+ou2P/MXGgMfIphhFPdWnVfK@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiOmOqJlZyaIuxsqDvpnqMrB558sGwmwtlRGrk6BuGzbAB35r
	Px6bh+awrtUzZqMUG6/ITUZMHQtBA6j674iDMPXef47YJeq+Ablh9eAk9w==
X-Gm-Gg: ASbGnctu/pjd3wNPaOWZhSIDZbhLefvXtMlAHbtZQMGbhFQf2ALjfYn27nf9uhK4Vqm
	JajK02Qku/fa0i/9zQBzIV1YoEuEzRt/WB5sjdsqnaRqBFhtEZ7mem5ZE2fg6Dhg7DxswPFgdJN
	404vE9TtgGeSTShqbIGzZA3SkX0zAz4f6B2cv3FtbHw7APRUgtvPn9tQuhhRu/+hM5zjBfR+0mm
	hMuXlkwM9gaa8nh3QBcDX3ECRW7ssT5dSvOrTAgHieYBf3jyfrNiv1NFVIWuMWh79ZMuN/z5QnO
	FhLZi2t5yo1XVg==
X-Google-Smtp-Source: AGHT+IHXuzMxEuA485NfLrsJeyjNLB6A2pFeN6p0vT73Gazzn4B2HE/jetpD8h3Hj2XzAjdjnS1lbg==
X-Received: by 2002:a17:902:d4ca:b0:216:6ef9:60d with SMTP id d9443c01a7336-21bf0d07c06mr356368455ad.23.1737398034433;
        Mon, 20 Jan 2025 10:33:54 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:7ee7:3586:3cca:c372:5371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb790esm64490215ad.85.2025.01.20.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 10:33:53 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v5] hwmon: Add T2 Mac fan control support in applesmc driver
Date: Tue, 21 Jan 2025 00:03:37 +0530
Message-Id: <20250120183343.3494-1-evepolonium@gmail.com>
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
The fan speed reading and writing are updated to
support both integer and floating-point values.
The fan manual control is also updated to handle T2 Mac-specific keys.

Guenter Roeck asked "Does this limit still apply?"
so yes the limit still applies.

Changes since v4:
--- remove the out goto in applesmc_store_fan_manual as
	Guenter Roeck asked me
Changes since v3:
--- fixed error by kernel test robot about FIELD_GET and FIELD_PREP by
	by adding linux/bitfield.h

Changes since v2:
--- fixed checkpatch issues
--- used function such as BIT(), FIELD_GET(), BIT_MASK()
	in function "applesmc_float_to_u32"
	and "applesmc_u32_to_float" for readability

--- added error handling in function applesmc_show_fan_speed
--- used applesmc_write_entry instead of applesmc_write_key
	in function applesmc_store_fan_speed

--- defined "F%dMd" as FAN_MANUAL_FMT

Changes since v1:
--- added spaces as Guenter Roeck asked me
--- also removed the type casting for buffer

Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>
Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/hwmon/applesmc.c | 130 ++++++++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..7964b0e0c5e8 100644
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
 
@@ -900,33 +969,38 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
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
-
-	buffer[0] = (val >> 8) & 0xFF;
-	buffer[1] = val & 0xFF;
-
-	ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
-
-out:
+	ret = applesmc_has_key(newkey, &has_newkey);
 	if (ret)
 		return ret;
-	else
-		return count;
+	if (has_newkey) {
+		buffer[0] = (input != 0x00);
+		ret = applesmc_write_key(newkey, buffer, 1);
+	} else {
+		ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
+		val = (buffer[0] << 8 | buffer[1]);
+		if (ret)
+			return ret;
+
+		if (input)
+			val = val | (0x01 << to_index(attr));
+		else
+			val = val & ~(0x01 << to_index(attr));
+
+		buffer[0] = (val >> 8) & 0xFF;
+		buffer[1] = val & 0xFF;
+
+		ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
+	}
 }
 
 static ssize_t applesmc_show_fan_position(struct device *dev,
-- 
2.39.5

