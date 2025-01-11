Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55BB187FE4;
	Sat, 11 Jan 2025 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736602374; cv=none; b=aQAqXFYD6x7OWQ1IsBhau0usaze7yXqz8it4NOT5I37lXcK4z3dWRxQJF2JEz7EWMdg8SdXedcddXe/MBntp2023bLXXk7i0mbOKRNaKHSU+b0ZBBO3lKvDJmGK8u6AW5Awz17JgDKfyQrZInLpFR55EKc2cJw/wkfsK09dq7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736602374; c=relaxed/simple;
	bh=DUutS7v6mTF5ikEW4xU2kixWfUKqYECHl08NEigAAZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=boPoqSPLM4UjFjRVp9ZhSH0mnKpg6eLzwNNiPVzXxoZnON5TQhLESRG5IcScvvNNZrBgOqU+DXuP5Flrynh+H6EKr69MoWrPci5a1+D/UVe5rMuFSXdVtaJ4NxEBNDSKL9S4YEbCguxRglCwNZP/jIHDoWnMjxfNeEbCqdsHc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO9YVr4K; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO9YVr4K"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216728b1836so49401625ad.0;
        Sat, 11 Jan 2025 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736602372; x=1737207172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVDhdWNP2U6NX5E5K1OTlv36E1Z5ufzCK+trmgWCu58=;
        b=fO9YVr4KJ6VWnrqFsSGwZthjawWKFUuRIsNFLymMB1H1rZkag1Qw0vW24vV56lLftJ
         3EjuWxUCbOFE+IKYDwcIJcR4O/SRV66vQTad9yT3iaC0IIWKfToIY0l6jgA1IC+/TMrl
         SFoV/XhOZjBZsu44ZzVRgKqsuR6AiCP8MrpLqIOGMwz3u4vxF6oew1Z7MH3kyB08GxxL
         x/2nQuPDYZMXLzjVrGQeSopGCscBg9pjYK16W5UHUcI7F8E5wsbxD/jb6lLm2AKkHZ0j
         g/uurz2BWLLY1bkrbO9AwQgat5RO093508CwaNBffvt4XXmfqZjVPlJYbplobcB/CPdl
         mVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736602372; x=1737207172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVDhdWNP2U6NX5E5K1OTlv36E1Z5ufzCK+trmgWCu58=;
        b=o2Jqo/k2HoEKn4QsbtmqhyiCCVQMF5Abkj1yhAtwOD8JYF3zqWHchtfZC3TvXGhiL2
         kQzz1MQgRZ4Ha5JCAhORHysM68c48o+JGSx45X9oAXASoqPADVO8bxvTFY/2YfvOhcn2
         vt0nDCxEvkeQIOmn6V9inNn6DGEEUnTgPkxhmIEJfzDynlLr6ls6Z4TVY1OQjSLQwlor
         LfkOz0zvnALXUCFzFovwm1Fi9+UkfWImkWl+y/Gx7v+/hQ3LS1Moyo2vpvTmlQwOZ7dE
         XWHAoixvXSSbH5e/yEoKjMes6MZZlSCSmXjsY3RPgHyiad0Px/DBAMrEeFSDvpydK3Yh
         EKUA==
X-Forwarded-Encrypted: i=1; AJvYcCVd3WkFZqSjgBeK/tfVop/VKqhTjUG7+yxmP03PPKjKoIwewNoBkJq8F/NOVbeu5rIH9vV0+7bYZ7/AeQ9/@vger.kernel.org, AJvYcCXazYLxu84ijVZi+JK6ecA7azRXNfCmrTV4xolvXPw3T95Ww1ci1o1EITjgbP5GDR0Ro5U8/d3WoeIHug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2yelRwRIbDcVFOAaOu8MD0p63CxGr2XWmSI6HPTcLOkfmGt9
	tIuipLj7A4+ByM5VB6DzezRJXu9jR0dNrhS0Rlvuk0yfBnqcPDaT
X-Gm-Gg: ASbGncu8j4/WdBLbGidbgLmxn1vS/ndYqNvFMxsR8dRXR+rhZuaoqk/3Rc4+X+YhERc
	NW0piOc2UcgcmtiUMN9CcelA+v6JXchGuo7lbYkjKd/8JfeyzZQ+uU/x57X52ME1auQ4uHlVYoI
	2e0ZMktqiclkn05DcxUIL5BZIcvheC4SSIwTAIS+xJ34/i9smLaiRA73WelRo59XUURFPeTdX/K
	41YRLw+3rqObOEnuFc7mdio9ByRb5U7xihGklQltqYtDWE1rj/4qhRGMFcipeneCj3FsWopCWvW
X-Google-Smtp-Source: AGHT+IHbzMs1lon7w0brzi0XrzBD8u9r1FkF5x0t4y6x+43c2X9Ovg7g1bc5kp1r9LmqjdD8NTxyhw==
X-Received: by 2002:a17:902:ec83:b0:215:7ce4:57bc with SMTP id d9443c01a7336-21a83f54a5cmr208383735ad.16.1736602371863;
        Sat, 11 Jan 2025 05:32:51 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:3753:eca1:c079:9952:e1b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2516b0sm27043555ad.219.2025.01.11.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 05:32:51 -0800 (PST)
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
Date: Sat, 11 Jan 2025 19:02:38 +0530
Message-Id: <20250111133239.3454-1-evepolonium@gmail.com>
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

