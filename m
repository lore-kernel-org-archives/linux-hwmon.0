Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505F477E4A
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 16:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062032; cv=none; b=soiFYyBbIeooRZyNQbzHHB7uWCNRyND+/qIt6ebk8J295kNxpEhTH7feMPn2GLBc90xzvefIpCENSyeTVdTbNDSWDFRltx5xN1GDnHsJyjBiF16ZVjrE/nyLZjf8oGc6j7N1Z7k8ll+3uwzXzpXucVEdR6TuYchqVYVvN+AIBuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062032; c=relaxed/simple;
	bh=DNiXUH9w7fQ/OhWEKswln0zNwKNXeuNVpsV/JW5zeDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugoHb31lO8Z3cSXZgAQBIj/dE8RChK0Zbink5OeQF6WHvftVbcOHeTZaEagVsjRw16V0ukZP2CiaxDX64heyoKbz/yw7wKOz5pMyobJjKfFIZYqo+DSqcnOHxO+dRnCP1t+4U3Kb3SW9UJj6+JMyT453GfPGE4IfzYJ7vsDSk0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbaaQtcu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbaaQtcu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b96760easo78811515e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062027; x=1775666827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77KRbufOZu2J+UY4V60ZX6P4QYigJ3YcJOsAEWEo15s=;
        b=sbaaQtcumZ63u3UhWOZzT6ryJXJJOGBa15f8MntbSHp6jwOjG1CGDiRkX+Mn89JT9h
         yO5Y+pES8T/frVGfC4XXmZT9mYqARtsCRLEvZkOtwUg67plTPQCmoN0gOSKDJUqsm6EF
         xdJyPg7K4jrAOVTL7QUwCRS8dmzVhG6/US0T3fVtf1PcOlPAQZm/t5WsEGTj+UFsPCeY
         FjKfFCbPfcZdWS/Ql3tuLrm1ovwbqIAizit7cpyGSaT8Je3iEd9ofoZTrpqPQka3yhcm
         pqdGGiz0C1y1aijJIoymdSmgIVZF9QreSC5pxQXxEKrk5hIIuLstlgYKLLCNO/EDAFQb
         U/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062027; x=1775666827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77KRbufOZu2J+UY4V60ZX6P4QYigJ3YcJOsAEWEo15s=;
        b=mzQ8NHbdoF1uCgZgxHUkKDYueFb45Gj86wAoyoS37D2jVdJvstF6XSiWUWu3xo3LLa
         92/gU/25xet4Y7CyKMuiqGqiUwpfdPUrAkCyqrOfgcfVTfKqCf9NcteXQPdDUVwzXgUv
         B/QDRvgd6gXjEotPkus7l0U02g/z7Lv8u9CDQwdGRSgJqTcibXjkxlXXn3ynzj2vsPlj
         nMgxZ5J3wxMZDVzIUeXrBa8HwR0cp5lxc+KR+CHlGHcJWSa4buQqJp6ilX4vcC5D1LwI
         rZzULBq1iuQ5PvagR8o0VMiFBtJKNg7kxcq89Va04gV7UHSiQjPXWUEuTWqkavNdTsl6
         18Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX/eBYCV/Kq8Vf1axLsWzbVRVzaa9av7A/IquHwABDVRuDvcamSu0PGelqinzqBagIB8KRXVOQOW0YaCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUoyDBXXOGjDuL9x9G3VgGJTwG4QxyIngxWnva7hUcqxqBzkrW
	xxx54JWaxvMmRffrjfy+T6yKrISorm0jSFkmvf98wZwLluwXQ6BRVCBiAUOlcVTx
X-Gm-Gg: ATEYQzxm5aEhgWgbvBKVCIShIf4m7jYFoQW0P6H88TnnO1apFp8OTB+zZtDkgsOYaUp
	cr0GbzPcGsx5b8hzxJ9twOkxdsPFz3bpCko2lSWIr3pjRqzlPSxa7i60L0+Bsc25eih5ZgPtOmg
	XjA8vdFMye39n0a6R+S9UDLXU+EYFDp/JM9afnYFmkDmhRYCwIkVzX0NdCZjwgaueiF1txBRcGr
	QCB+0sSSjG1Tq2xwNGXMDwUYVxYUE2zk8/707sBGlkIIDKpFcj0+8eECjsq42+cPjTRuDMMUron
	wExtt8s2WfigST19mbpPk1rKi6eR0nwv51hVG1fhMbozA9rTDj01+g3wECtyWhPxzih90zM4x5C
	bSg9CzgTbssFKPd+n3NAJKUtwrI/oKuPGuoAhRHLRvemBiATfduc2z9Fo510yVpr7isxh/W82ss
	LYrbuhFW7X26faKItR7y3lexanjSbhFPyE6CZGSNOJYI/AyJt1x0yNFEz7o7TjEWndgN3nCH9d3
	Q==
X-Received: by 2002:a05:600c:1d0f:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488835a59a3mr72119215e9.31.1775062026674;
        Wed, 01 Apr 2026 09:47:06 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm160281005e9.0.2026.04.01.09.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:47:06 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (tmp102) add support for update interval
Date: Wed,  1 Apr 2026 19:47:01 +0300
Message-ID: <20260401164701.18456-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the sensor supports different sampling intervals via
bits CR0 and CR1 from the CONFIG register, add support in
order for the conversion rate to be changed from user space.
Default is 4 conv/sec.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Implement all changes suggested inline by Guenter Roeck.
- Fixed identified issues from link provided by Guenter Roeck:
https://sashiko.dev/#/patchset/20260331175418.16145-1-flaviu.nistor%40gmail.com	
- Link to v1: https://lore.kernel.org/all/20260331175418.16145-1-flaviu.nistor@gmail.com/

 Documentation/hwmon/tmp102.rst |  19 ++++-
 drivers/hwmon/tmp102.c         | 137 ++++++++++++++++++++++++++-------
 2 files changed, 125 insertions(+), 31 deletions(-)

diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
index 3c2cb5bab1e9..425a09a3c9b3 100644
--- a/Documentation/hwmon/tmp102.rst
+++ b/Documentation/hwmon/tmp102.rst
@@ -41,12 +41,25 @@ degree from -40 to +125 C. Resolution of the sensor is 0.0625 degree.  The
 operating temperature has a minimum of -55 C and a maximum of +150 C.
 
 The TMP102 has a programmable update rate that can select between 8, 4, 1, and
-0.5 Hz. (Currently the driver only supports the default of 4 Hz).
+0.25 Hz.
 
 The TMP110 and TMP113 are software compatible with TMP102, but have different
 accuracy (maximum error) specifications. The TMP110 has an accuracy (maximum error)
 of 1.0 degree, TMP113 has an accuracy (maximum error) of 0.3 degree, while TMP102
 has an accuracy (maximum error) of 2.0 degree.
 
-The driver provides the common sysfs-interface for temperatures (see
-Documentation/hwmon/sysfs-interface.rst under Temperatures).
+sysfs-Interface
+---------------
+
+The following list includes the sysfs attributes that the driver provides, their
+permissions and a short description:
+
+=============================== ======= ===========================================
+Name                            Perm    Description
+=============================== ======= ===========================================
+temp1_input:                    RO      Temperature input
+temp1_label:                    RO      Descriptive name for the sensor
+temp1_max:                      RW      Maximum temperature
+temp1_max_hyst:                 RW      Maximum hysteresis temperature
+update_interval                 RW      Update conversions interval in milliseconds
+=============================== ======= ===========================================
diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 5b10c395a84d..7d3ef64bd28c 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -50,11 +50,16 @@
 
 #define CONVERSION_TIME_MS		35	/* in milli-seconds */
 
+#define NUM_SAMPLE_TIMES 4
+#define DEFAULT_SAMPLE_TIME_MS 250
+const unsigned int *sample_times = (const unsigned int []){ 125, 250, 1000, 4000 };
+
 struct tmp102 {
 	const char *label;
 	struct regmap *regmap;
 	u16 config_orig;
 	unsigned long ready_time;
+	u16 sample_time;
 };
 
 /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
@@ -79,8 +84,20 @@ static int tmp102_read_string(struct device *dev, enum hwmon_sensor_types type,
 	return 0;
 }
 
-static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
-		       u32 attr, int channel, long *temp)
+static int tmp102_read_chip(struct device *dev, u32 attr, long *val)
+{
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		*val = tmp102->sample_time;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tmp102_read_temp(struct device *dev, u32 attr, long *val)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
 	unsigned int regval;
@@ -108,30 +125,80 @@ static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
 	err = regmap_read(tmp102->regmap, reg, &regval);
 	if (err < 0)
 		return err;
-	*temp = tmp102_reg_to_mC(regval);
+
+	*val = tmp102_reg_to_mC(regval);
 
 	return 0;
 }
 
-static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
-			u32 attr, int channel, long temp)
+static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		return tmp102_read_chip(dev, attr, val);
+	case hwmon_temp:
+		return tmp102_read_temp(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tmp102_update_interval(struct device *dev, long val)
 {
 	struct tmp102 *tmp102 = dev_get_drvdata(dev);
-	int reg;
+	u8 index;
+	s32 err;
+
+	index = find_closest(val, sample_times, NUM_SAMPLE_TIMES);
+
+	err = regmap_update_bits(tmp102->regmap, TMP102_CONF_REG,
+				 0xc000, (3 - index) << 14);
+	if (err < 0)
+		return err;
+	tmp102->sample_time = sample_times[index];
+
+	return 0;
+}
 
+static int tmp102_write_chip(struct device *dev, u32 attr, long val)
+{
 	switch (attr) {
-	case hwmon_temp_max_hyst:
-		reg = TMP102_TLOW_REG;
-		break;
-	case hwmon_temp_max:
-		reg = TMP102_THIGH_REG;
-		break;
+	case hwmon_chip_update_interval:
+		return tmp102_update_interval(dev, val);
 	default:
 		return -EOPNOTSUPP;
 	}
+	return 0;
+}
+
+static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct tmp102 *tmp102 = dev_get_drvdata(dev);
+	int reg;
+
+	switch (type) {
+	case hwmon_chip:
+		return tmp102_write_chip(dev, attr, val);
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max_hyst:
+			reg = TMP102_TLOW_REG;
+			break;
+		case hwmon_temp_max:
+			reg = TMP102_THIGH_REG;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
 
-	temp = clamp_val(temp, -256000, 255000);
-	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(temp));
+		val = clamp_val(val, -256000, 255000);
+		return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
 }
 
 static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
@@ -139,27 +206,39 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
 {
 	const struct tmp102 *tmp102 = data;
 
-	if (type != hwmon_temp)
-		return 0;
-
-	switch (attr) {
-	case hwmon_temp_input:
-		return 0444;
-	case hwmon_temp_label:
-		if (tmp102->label)
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
 			return 0444;
-		return 0;
-	case hwmon_temp_max_hyst:
-	case hwmon_temp_max:
-		return 0644;
+		case hwmon_temp_label:
+			if (tmp102->label)
+				return 0444;
+			return 0;
+		case hwmon_temp_max_hyst:
+		case hwmon_temp_max:
+			return 0644;
+		default:
+			break;
+		}
+		break;
 	default:
-		return 0;
+		break;
 	}
+	return 0;
 }
 
 static const struct hwmon_channel_info * const tmp102_info[] = {
 	HWMON_CHANNEL_INFO(chip,
-			   HWMON_C_REGISTER_TZ),
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST),
 	NULL
@@ -237,6 +316,8 @@ static int tmp102_probe(struct i2c_client *client)
 	if (IS_ERR(tmp102->regmap))
 		return PTR_ERR(tmp102->regmap);
 
+	tmp102->sample_time = DEFAULT_SAMPLE_TIME_MS;
+
 	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &regval);
 	if (err < 0) {
 		dev_err(dev, "error reading config register\n");
-- 
2.34.1

