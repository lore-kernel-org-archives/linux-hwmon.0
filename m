Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256501B6D14;
	Sat, 11 Jan 2025 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736624230; cv=none; b=OH33c5bd9ABXm2mo/H2Jh5u2kCaERqE+kV5SwizPBo1Pc9YMOTdRqUzXlxnT3yFM1wkgFmeNYaBt8jXz3/+0NiMR63h5xmEXyqPoYdu1tLBFARvyHpX+JvXXteUDW2nRVeqErYD9dSDLUYf0AAp7+7ZntbvQlJbTExBYFP2rWkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736624230; c=relaxed/simple;
	bh=FexTpY07IzMpe4GLeape7VIJvndNmcOzPjAne1ipO3A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GJc3sf3WlvzoEuUmwcjv6hGrYJ+KWbKHJCEtv4LL9ekgKaZ5Q/7qLUFkT+z4QRXp+ogZJZvLfia4SOrhe1ILcoja1U47jnJlCwX21CwpdfmvZ6KK/ThIJ5wIldP3pHozeVwF8mVkQRBnXkp8NaT9I9mrt6dQa8FmwqmC9+HbX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpfK9pUC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpfK9pUC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163dc5155fso56089705ad.0;
        Sat, 11 Jan 2025 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736624228; x=1737229028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3xTag2GlTtTWVk+L2ZwwSufimDnfbCGpk9pQaCm1AE=;
        b=JpfK9pUCC9F39btF/wuiDqZnnGFMDvhdFnEWejmAfaXRJwfwSHmzgTUyp5O5CwWj4k
         sxeJHQehxAby7RBWxWoA2Ly9Ed1ui6wQBpS/7/wgnD6v10/2jtbSrsM0bs/rTcsYu2xk
         YV2oRr96VBfhenNLE7HoheG+tNQ4GsthsRXw2wyr4RZm/TH5f9w4Zf/qAwzKmGIIvzJb
         y+hjhelIq94B0ud+LNNDo3RO2149DltBxFEED7pPhl6s7g7BrZZ/78QcBMKLFVNbzBaT
         Cx/njxgcIiQ2lXQJABEFAusdmkAIApAS2CYP6zaIRG+1d+u+Gvf58EtuddSvrTn0Xhq/
         QdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736624228; x=1737229028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3xTag2GlTtTWVk+L2ZwwSufimDnfbCGpk9pQaCm1AE=;
        b=TedLvd4ZHZUv9vSrHFRo1KlYQdtAFNJSdq5UZidZSId94Lz+uivlYNTqHP/jZaO8cw
         nKwUNEcemWUKOSUtr77uLZH6SymulwsI4jKie3RWYMiUhoEkHDyP5fA9zQhF4K0ZheBC
         oTt4CmmN5lbKj+WO4gdfNDYEftgvaUQjVuUo/ydXyQqZzVUTINGVbnwRg4kRsnXqcFSt
         q0ZcrgX8K1i0oYliTbQO9GwaX9NtGLcrzha2hZB943d41Jocxv5q/y95CKkuh0mV2Agb
         p3qcLb9FUUYiJ4KRi4aU4ooDrFXvhw3joijzMKObmk4scT1U+wKu3cRxwGTQVMtV/00m
         pxVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV78zjnzqmLRB4DFWSanxJupxiGvCgcYzj5XaapnrfuQuDqJOBJsk28gY4f9ciDhgVmj8PAz+2Lqt/giQ==@vger.kernel.org, AJvYcCVKX7OnYYScBGLiIoyhT0OjyP+l0tWL8wqkAtA6Host6uf0livariP3JUh18OWXpz5oVpJ+zUFnf0NMRBRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YybqhKoWPBjTZOd1XVbzyFjvlsrJVlSWoObxFCq6gCNiy//qPbN
	Sjv64fHwOfIZeQMffyRelEvQTThwlkMoLtcYxqWQHBbZ+fY9KckY
X-Gm-Gg: ASbGncvhoggKOciV1KB3yaNes4sN1mHmf5f9O5tEk57mKV8XnSvqVOgF05zc+afVmjG
	MDFsoGlbU5rPAizuXUk/dymPMj4KX+Xlg2rTLYlm4g8/+a7i0Iix9KuVVSvjdKCxhVX0GUvGWvV
	OWyjGTWWjAmtJg4ETMRf1RnZLza4BQ1agbB8VFBE9kk9Ig6qwuuJPAImgWfRzEDpY1LjGdjvmWV
	DVfNjxhZnnASfB92kreiS6s8scS85Ymb5jKE4maNL68MCPVpgldQNnIQhnAQqxA9JbnQbAvB22g
X-Google-Smtp-Source: AGHT+IFiDfFbBAAaEUpA41ElUcCe3Md1+Kg9RUfGHfi375URNTwtZuBuo5BW3irUVslXkZN2vmnbiQ==
X-Received: by 2002:a17:902:ccc8:b0:215:a05d:fb05 with SMTP id d9443c01a7336-21a83f72d92mr248713115ad.32.1736624228342;
        Sat, 11 Jan 2025 11:37:08 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:3753:2276:ebfd:1ff1:f7e0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55f76e5a0sm4493137a91.26.2025.01.11.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 11:37:07 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: Add T2 Mac fan control support in applesmc driver
Date: Sun, 12 Jan 2025 01:06:59 +0530
Message-Id: <20250111193700.37201-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for fan control on T2 Macs in the applesmc driver.
It introduces functions to handle floating-point fan speed values (which are required by t2 chips).
The fan speed reading and writing are updated to support both integer and floating-point values.
The fan manual control is also updated to handle T2 Mac-specific keys.

and also Guenter Roeck asked me "Why use applesmc_write_key here?" (line: 917)
The use of applesmc_write_key is to directly update specific SMC keys
for controlling hardware parameters like fan speeds or sensor calibration
Changes since v1:
-- added spaces as Guenter Roeck asked me
-- also removed the type casting for buffer

Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/hwmon/applesmc.c | 108 +++++++++++++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..1f60776fe56a 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -511,6 +511,31 @@ static int applesmc_read_s16(const char *key, s16 *value)
 	return 0;
 }
 
+static inline u32 applesmc_float_to_u32(u32 d)
+{
+	u8 sign = (d >> 31) & 1;
+	s32 exp = ((d >> 23) & 0xff) - 0x7F;
+	u32 fr = d & ((1u << 23) - 1);
+
+	if (sign || exp < 0)
+		return 0;
+
+	return (1u << exp) + (fr >> (23 - exp));
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
+	return (exp << 23) |
+		 ((d << (23 - (exp - 0x7F))) & ((1u << 23) - 1));
+}
+
 /*
  * applesmc_device_init - initialize the accelerometer.  Can sleep.
  */
@@ -842,15 +867,24 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 	unsigned int speed = 0;
 	char newkey[5];
 	u8 buffer[2];
+	const struct applesmc_entry *entry;
 
 	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
 		  to_index(attr));
 
-	ret = applesmc_read_key(newkey, buffer, 2);
+	entry = applesmc_get_entry_by_key(newkey);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	if (!strcmp(entry->type, "flt")) {
+		ret = applesmc_read_entry(entry, buffer, 4);
+		speed = applesmc_float_to_u32(*(u32 *)buffer);
+	} else {
+		ret = applesmc_read_entry(entry, buffer, 2);
+		speed = ((buffer[0] << 8 | buffer[1]) >> 2);
+	}
 	if (ret)
 		return ret;
-
-	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
 	return sysfs_emit(sysfsbuf, "%u\n", speed);
 }
 
@@ -861,7 +895,8 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	int ret;
 	unsigned long speed;
 	char newkey[5];
-	u8 buffer[2];
+	u8 buffer[4];
+	const struct applesmc_entry *entry;
 
 	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
 		return -EINVAL;		/* Bigger than a 14-bit value */
@@ -869,9 +904,18 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
 		  to_index(attr));
 
-	buffer[0] = (speed >> 6) & 0xff;
-	buffer[1] = (speed << 2) & 0xff;
-	ret = applesmc_write_key(newkey, buffer, 2);
+	entry = applesmc_get_entry_by_key(newkey);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	if (!strcmp(entry->type, "flt")) {
+		*(u32 *)buffer = applesmc_u32_to_float(speed);
+		ret = applesmc_write_entry(entry, buffer, 4);
+	} else {
+		buffer[0] = (speed >> 6) & 0xff;
+		buffer[1] = (speed << 2) & 0xff;
+		ret = applesmc_write_key(newkey, buffer, 2);
+	}
 
 	if (ret)
 		return ret;
@@ -885,12 +929,23 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
 	int ret;
 	u16 manual = 0;
 	u8 buffer[2];
+	char newkey[5];
+	bool has_newkey = false;
+
+	scnprintf(newkey, sizeof(newkey), "F%dMd", to_index(attr));
+
+	ret = applesmc_has_key(newkey, &has_newkey);
+	if (has_newkey) {
+		ret = applesmc_read_key(newkey, buffer, 1);
+		manual = buffer[0];
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
 
@@ -900,28 +955,37 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
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
+	scnprintf(newkey, sizeof(newkey), "F%dMd", to_index(attr));
 
-	if (input)
-		val = val | (0x01 << to_index(attr));
-	else
-		val = val & ~(0x01 << to_index(attr));
-
-	buffer[0] = (val >> 8) & 0xFF;
-	buffer[1] = val & 0xFF;
+	ret = applesmc_has_key(newkey, &has_newkey);
+	if (ret)
+		return ret;
+	if (has_newkey) {
+		buffer[0] = input & 1;
+		ret = applesmc_write_key(newkey, buffer, 1);
+	} else {
+		ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
+		val = (buffer[0] << 8 | buffer[1]);
+		if (ret)
+			goto out;
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

