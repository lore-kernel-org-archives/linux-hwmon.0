Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643D1F9403;
	Fri,  3 Jan 2025 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735908824; cv=none; b=ttO+jOyg+U30oMUukPw7JHZI5NaBNXIVV0ua5LlygluHH2a4/BeRhZKQGIYnY775QkoeuWP6wJnqTTIy/aAmtLXZ4r55+yCX2xMWq4EgSXAKmjjHLt1af82/ZwEHMC5EMHjj2Yh/nUM05+mgJIVh593Dig6Gh8SNTHHc9hDLb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735908824; c=relaxed/simple;
	bh=DUutS7v6mTF5ikEW4xU2kixWfUKqYECHl08NEigAAZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YQa8H5BiweDB6zJzIOLXof/4oy4DwAZQxlDUgs+TOccxub+VnHI2//HWEH5zhDzsWsnzIchaR7UQjzwUuSSsh4gKB0ubLWPjV0YDBUFxrtnkWvcD+Kdq8sw2t/upAP3FARQvHijS7jQSEScHkElylCCNL9ROnH/S+bDKsiC9tKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chBEGimH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chBEGimH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21628b3fe7dso165476015ad.3;
        Fri, 03 Jan 2025 04:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735908822; x=1736513622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVDhdWNP2U6NX5E5K1OTlv36E1Z5ufzCK+trmgWCu58=;
        b=chBEGimHHF15SWOV2vpy8WGQetHy7VQ+jkhJ4J9ZblKYsTf/ylCosn/wvPwkgKUhZ1
         8PsYsX9YfsjYpiyNlAj8R6pu8/MnIdVDMQS49w24Y/nDI52SQcnuv1z5trAAIVbBjq5W
         LQT59uuBHNT7y/LEh6EApsBQIXih6i2fogrwyf2wlu74wl55CwCVc/pYxSFqz4xH4bHI
         mHGop4LHS03huwuwlSThrYgwKpvDqDZPNux0u6c5+g04DP5oPvdMAo/7GivOis2ImlfC
         2qGwL8taxX7yZlsaTo//vVEatIoJxFy6ZJBK6HhyQS69jd8UmfzuuArom2ccVwbQKkJx
         Klig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735908822; x=1736513622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVDhdWNP2U6NX5E5K1OTlv36E1Z5ufzCK+trmgWCu58=;
        b=N7NWY4pm2leiyy+Y8V/xbnhiwA7ks426iSXyzA6bKzj63gW6VIEuVn8Uhon6GguXiI
         Hg06m3YlaakXyTYsFP8vsGH2IbOpFg+bvRPCepLjDOLlmFKG8JVyHv9iAKkEMb5uS+Pu
         5X/NMZe8mqLgMOQHDoNy3PdcDz1/Q3ZAI6SzP3YYwAA/wGgKnqlyS2QPy5jgUbanMS7M
         a3gnVNYAVdbF6/sgYcTU/o7XqKojOvBy0NL88xJ0DsKHW7ews4chjt2KT5cFzCGLS0ST
         t7K91L1Yiq7eKl+F7Hz4I2J95swJnlQg78gNt40ZpilASPkJeFIy8+/uqnJ8EMrsbT0/
         LFSg==
X-Forwarded-Encrypted: i=1; AJvYcCU+97tHfWN76dvLMnJvC/NzoT+vDXnlutpfLiA5CC77O8Sqh7s+pzk22JXaeum9LTU+KcWJAIvhgXoFZA==@vger.kernel.org, AJvYcCVFsCg4nwkkRRgAk6tA29v5QFHlnoWMZHKZ+4kFKB7UY/zqLdBz2UG07uVltvte6IwU9gWBkHDYJMPqYCKO@vger.kernel.org
X-Gm-Message-State: AOJu0YxF67oZen6klV2hhaD5FXQ5SHB60n6rQ5hk0qL0V1F30WnfVa11
	4qNZkFqhOGP1+tipLz5llrk+HlwYKFBv/H2LNqiFn/Q/dK3KnrlAGocKkw==
X-Gm-Gg: ASbGncsjKcdSRH1hR+Dzfsm6NWGW6K6ZjQNtqIRWvSJau11CDaQt4sL17LsIt/8uWXZ
	Ni6kKz87L7aA0KargZMxEp0kevb+477ope381Z90MDxIsmCnKPI7mR7FsF+TTrTSu7rTbvZVpTN
	gMP6m7Gycg+ShbhZoFZ27mNQjkOcpUPlEplVDCppc7FgAhPMngEGgqOljNR7T92yP/1iW5dyIh+
	ZP8EnNbz/nIQVPuJABSX09/QoCzRl3LpUtnkLtBGAFDKO5DZ+ojB/5s/Kq9iYEN1m/2A7MFo48=
X-Google-Smtp-Source: AGHT+IHubFB0xXrhX+pIMrIdx0VledVC+itRzBBVnsybHjl4+fVjBfiFkmloU1YBviohmdxv8vGHIA==
X-Received: by 2002:a05:6a00:6087:b0:728:8c17:127d with SMTP id d2e1a72fcca58-72abdd8c2c7mr82758685b3a.8.1735908822364;
        Fri, 03 Jan 2025 04:53:42 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c80:72c5:3bab:4abc:8bf1:8fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81622dsm26120681b3a.30.2025.01.03.04.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:53:41 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: Add T2 Mac fan control support in applesmc driver
Date: Fri,  3 Jan 2025 18:22:57 +0530
Message-Id: <20250103125258.1604-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for fan control on T2 Macs in the applesmc driver.
It introduces functions to handle floating-point fan speed values.
The fan speed reading and writing are updated to

support both integer and floating-point values.
The fan manual control is also updated to handle T2 Mac-specific keys.

Changes:
 - Added support for floating-point fan speeds.

 - Updated fan speed functions to 
   handle both integer and floating-point values.

 - Modified fan control to support T2 Mac-specific keys.

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>
Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
---
 drivers/hwmon/applesmc.c | 105 ++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..9ce7c426a2f6 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -510,7 +510,28 @@ static int applesmc_read_s16(const char *key, s16 *value)
 	*value = ((s16)buffer[0] << 8) | buffer[1];
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
 
+	return (1u << exp) + (fr >> (23 - exp));
+}
+static inline u32 applesmc_u32_to_float(u32 d)
+{
+	u32 dc = d, bc = 0, exp;
+	if (!d)
+		return 0;
+	while (dc >>= 1)
+		++bc;
+	exp = 0x7F + bc;
+	return (exp << 23) |
+		 ((d << (23 - (exp - 0x7F))) & ((1u << 23) - 1));
+}
 /*
  * applesmc_device_init - initialize the accelerometer.  Can sleep.
  */
@@ -842,15 +863,23 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
 	unsigned int speed = 0;
 	char newkey[5];
 	u8 buffer[2];
-
+	const struct applesmc_entry *entry;
 	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
 		  to_index(attr));
 
-	ret = applesmc_read_key(newkey, buffer, 2);
+	entry = applesmc_get_entry_by_key(newkey);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	if (!strcmp(entry->type, "flt")) {
+		ret = applesmc_read_entry(entry, (u8 *)buffer, 4);
+		speed = applesmc_float_to_u32(*(u32 *)buffer);
+	} else {
+		ret = applesmc_read_entry(entry, (u8 *)buffer, 2);
+		speed = ((buffer[0] << 8 | buffer[1]) >> 2);
+	}
 	if (ret)
 		return ret;
-
-	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
 	return sysfs_emit(sysfsbuf, "%u\n", speed);
 }
 
@@ -861,7 +890,8 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
 	int ret;
 	unsigned long speed;
 	char newkey[5];
-	u8 buffer[2];
+	u8 buffer[4];
+	const struct applesmc_entry *entry;
 
 	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
 		return -EINVAL;		/* Bigger than a 14-bit value */
@@ -869,9 +899,18 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
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
+		ret = applesmc_write_entry(entry, (u8 *)buffer, 4);
+	} else {
+		buffer[0] = (speed >> 6) & 0xff;
+		buffer[1] = (speed << 2) & 0xff;
+		ret = applesmc_write_key(newkey, (u8 *)buffer, 2);
+	}
 
 	if (ret)
 		return ret;
@@ -885,12 +924,23 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
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
+		ret = applesmc_read_key(newkey, (u8 *)buffer, 1);
+		manual = buffer[0];
+	} else {
+		ret = applesmc_read_key(FANS_MANUAL, (u8 *)buffer, 2);
+		manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
+	}
 
-	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
 	if (ret)
 		return ret;
 
-	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
 	return sysfs_emit(sysfsbuf, "%d\n", manual);
 }
 
@@ -900,28 +950,37 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
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
+		ret = applesmc_write_key(newkey, (u8 *)buffer, 1);
+	} else {
+		ret = applesmc_read_key(FANS_MANUAL, (u8 *)buffer, 2);
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

