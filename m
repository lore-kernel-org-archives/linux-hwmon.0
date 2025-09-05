Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3553F29BD9C;
	Fri,  5 Sep 2025 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104937; cv=none; b=MsE6syXXo6kZQQEbuOW2sDJEF7o5z0C/4oPlr/3DANuoPtTPLCaMqAZLIihGGlE+OOFOPAsKm1q3fLf00AQ1KeoMHlqg7lP5SHR174zaTuLOt7pRdn/t6Kp/Fx4vvHzy/Bb7eLhW10aZkyp4j9NRZxePsA5Bgn407SqGkTWLgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104937; c=relaxed/simple;
	bh=FOu5lHNiGO+T8GhFwaX+AcangG8qLjiaghp9t24Pjfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XX1mCGCfoobJbueMNNKb8bcc/5mFyvMvsMkGGGctrnAMNNfFo4kREJla4wVYmMyhg8xAfibIdNQrf6lUFeeNrvh+zRCcigCAPy/cleAL7cDC5GvvRbm7xxXAbntFxynBgWb7cfOjNlg/jt3irleLXYGr/5qOcWSjyjHidMD9cgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM0vzSOZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM0vzSOZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7724df82cabso3036651b3a.2;
        Fri, 05 Sep 2025 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104935; x=1757709735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fs/nJY+482ul5UR6iCuGThy7ODGHd8+ppxTVt8tyFM=;
        b=AM0vzSOZIg0/polfOQ14V2Vkb2N/tNjahdA+ks/hqyByzaSHiMgem9H4GNfrwTDEWR
         d/+nfFKLK8l49drQP6G/HmKJCkVEt0ufV/jx66r4J1VqtiiQBgvYu2q7tgryZ3oY7me0
         EW5L9uOFAsG5YUTBzjLRb/CrIfiPDMgo9Ywvd6bSGx2Kz8iOLyH1RrxazBQVibDgnQaG
         +Cr50dd9LdPP+Qtmg5SLVhtZaqhmAyglq0JUe51G4OcRUQpFE60+i0kvJ9F0RIlcG51i
         gynJwIz8Au7WdvgWZmkn+ZFuygCRAHVM0n2ojlABExIOd1TMpljgsTS99ixpy6SlCmvT
         43aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104935; x=1757709735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fs/nJY+482ul5UR6iCuGThy7ODGHd8+ppxTVt8tyFM=;
        b=OXBARexCBDTHNVHtg5O+HzS7i3ISgpHs702n9LtrPV3QRr8W7Chd6agCgsS/d9jCTI
         wRtqGg5569x+pwDbxyoxVUDGcG0Uit3jTVBGSDCcWEIynLCBuQ3hgAbby24LhQd2/iKk
         /CIv9H3sk80wSxikBDR7aLzOyjscTM0K/WEaP9Nits2KBnxoKOZZeEZLvdIEkMtoh9Vf
         3Sy/kXJhrIJphebiwyPTEo56adY+pjpVxKlAF/VB9zA30Hmo1P55jduxQEytgkzbumGF
         XwlEEcKVJb5WzYlq9bXjvkr42z68dlkC5uyZWPEk6ysYNd6aGvfIIY8bH056czdqBYJT
         dTbA==
X-Forwarded-Encrypted: i=1; AJvYcCWmxVShDadsX733srDmNFunJQ2+Q4QOu1aiR40mipEXV29is6H5bBh49z2w3dPLToHsL5iuggwizjM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49lburSJyCliE/hHx46LfR8Jsp43oLGP28htVc3amiiT2BRad
	moe8yVcYyDXhrlUumWlCiu6GFhmaGmbcrxJb0R+zF7pc0OZHUroQ/G3OI+UKAv7d
X-Gm-Gg: ASbGncti4vD4YASfpqlf2AYPUi2ptLAd+358xRyVQFU2gjyr15PWHzBWBArwmKb7GcB
	/9glhydh0nfcjeavKPA2dSyGzHpifUrpquY62DJm/qjtO8BsqgjS2msRygomFxh8qGnGfeeYqTG
	hL+PZGvgnmuhS8LcrHlPX8PFNEM0EH8UAxVX95QRxI4/IuWsSAHMkz5ekGiU7j37jetmIEsLNGc
	X7upSkNCZKiifKndVnbSKnkJZApoziHRfNPV0ez5TUuwP/Rc6TXuDoEkBN9MECuE2maeuM3YKGb
	YxwePwrtl64wx2taH2sXhU1xLAYURO5/LJtZND+42nhhy3MKlqPBYgTLbNb2UQ+/BrMPx7lwAFA
	hOZR/mwHzSw5Yr8DwLBiwtrtW5Ly92SbaIodFHUCiOJCmGQ==
X-Google-Smtp-Source: AGHT+IHO/HwxgTDFu06mNfe0V32/v9UMceDW/9eO7cvw4rODsuY68oVtfDzZSCkHQkybMzU5ROGzQA==
X-Received: by 2002:a05:6a21:6d9d:b0:244:facc:65f5 with SMTP id adf61e73a8af0-2533fab7298mr273716637.18.1757104935395;
        Fri, 05 Sep 2025 13:42:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772608b1b5asm14157274b3a.46.2025.09.05.13.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/17] hwmon: (ina238) Add support for current limits
Date: Fri,  5 Sep 2025 13:41:51 -0700
Message-ID: <20250905204159.2618403-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the shunt voltage register and the current register now report the
same values, use the shunt voltage limit registers to report and adjust
current limits, using the same LSB as the LSB used for the actual current
register.

Handle current register accuracy differences in separate function to
improve code readability.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/ina238.rst |   4 ++
 drivers/hwmon/ina238.c         | 105 ++++++++++++++++++++++++++-------
 2 files changed, 87 insertions(+), 22 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index 1ac4e2c419ac..3c7db4a47056 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -82,6 +82,10 @@ power1_input_highest	Peak Power (uW)
 				(SQ52206 only)
 
 curr1_input		Current measurement (mA)
+curr1_min		Minimum current threshold (mA)
+curr1_min_alarm		Minimum current alarm
+curr1_max		Maximum current threshold (mA)
+curr1_max_alarm		Maximum current alarm
 
 energy1_input		Energy measurement (uJ)
 				(SQ52206 and INA237 only)
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 9dc94eccb750..97f12efcaef4 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -335,40 +335,92 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel, long val)
 	}
 }
 
-static int ina238_read_current(struct device *dev, u32 attr, long *val)
+static int __ina238_read_curr(struct ina238_data *data, long *val)
+{
+	u32 lsb = data->current_lsb;
+	int err, regval;
+
+	if (data->config->has_20bit_voltage_current) {
+		err = ina238_read_field_s20(data->client, INA238_CURRENT, &regval);
+		if (err)
+			return err;
+		lsb /= 16;	/* Adjust accuracy */
+	} else {
+		err = regmap_read(data->regmap, INA238_CURRENT, &regval);
+		if (err)
+			return err;
+		regval = (s16)regval;
+	}
+
+	*val = DIV_S64_ROUND_CLOSEST((s64)regval * lsb, 1000);
+	return 0;
+}
+
+static int ina238_read_curr(struct device *dev, u32 attr, long *val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
+	int reg, mask = 0;
 	int regval;
 	int err;
 
+	if (attr == hwmon_curr_input)
+		return __ina238_read_curr(data, val);
+
 	switch (attr) {
-	case hwmon_curr_input:
-		if (data->config->has_20bit_voltage_current) {
-			err = ina238_read_field_s20(data->client, INA238_CURRENT, &regval);
-			if (err)
-				return err;
-		} else {
-			err = regmap_read(data->regmap, INA238_CURRENT, &regval);
-			if (err < 0)
-				return err;
-			/* sign-extend */
-			regval = (s16)regval;
-		}
-
-		/* Signed register. Result in mA */
-		*val = DIV_S64_ROUND_CLOSEST((s64)regval * data->current_lsb, 1000);
-
-		/* Account for 4 bit offset */
-		if (data->config->has_20bit_voltage_current)
-			*val /= 16;
+	case hwmon_curr_min:
+		reg = INA238_SHUNT_UNDER_VOLTAGE;
+		break;
+	case hwmon_curr_min_alarm:
+		reg = INA238_DIAG_ALERT;
+		mask = INA238_DIAG_ALERT_SHNTUL;
+		break;
+	case hwmon_curr_max:
+		reg = INA238_SHUNT_OVER_VOLTAGE;
+		break;
+	case hwmon_curr_max_alarm:
+		reg = INA238_DIAG_ALERT;
+		mask = INA238_DIAG_ALERT_SHNTOL;
 		break;
 	default:
 		return -EOPNOTSUPP;
 	}
 
+	err = regmap_read(data->regmap, reg, &regval);
+	if (err < 0)
+		return err;
+
+	if (mask)
+		*val = !!(regval & mask);
+	else
+		*val = DIV_S64_ROUND_CLOSEST((s64)(s16)regval * data->current_lsb, 1000);
+
 	return 0;
 }
 
+static int ina238_write_curr(struct device *dev, u32 attr, long val)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int regval;
+
+	/* Set baseline range to avoid over/underflows */
+	val = clamp_val(val, -1000000, 1000000);
+	/* Scale */
+	val = DIV_ROUND_CLOSEST(val * 1000, data->current_lsb);
+	/* Clamp to register size */
+	regval = clamp_val(val, S16_MIN, S16_MAX) & 0xffff;
+
+	switch (attr) {
+	case hwmon_curr_min:
+		return regmap_write(data->regmap, INA238_SHUNT_UNDER_VOLTAGE,
+				    regval);
+	case hwmon_curr_max:
+		return regmap_write(data->regmap, INA238_SHUNT_OVER_VOLTAGE,
+				    regval);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int ina238_read_power(struct device *dev, u32 attr, long *val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
@@ -521,7 +573,7 @@ static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_in:
 		return ina238_read_in(dev, attr, channel, val);
 	case hwmon_curr:
-		return ina238_read_current(dev, attr, val);
+		return ina238_read_curr(dev, attr, val);
 	case hwmon_power:
 		return ina238_read_power(dev, attr, val);
 	case hwmon_temp:
@@ -544,6 +596,9 @@ static int ina238_write(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_in:
 		err = ina238_write_in(dev, attr, channel, val);
 		break;
+	case hwmon_curr:
+		err = ina238_write_curr(dev, attr, val);
+		break;
 	case hwmon_power:
 		err = ina238_write_power_max(dev, val);
 		break;
@@ -582,7 +637,12 @@ static umode_t ina238_is_visible(const void *drvdata,
 	case hwmon_curr:
 		switch (attr) {
 		case hwmon_curr_input:
+		case hwmon_curr_max_alarm:
+		case hwmon_curr_min_alarm:
 			return 0444;
+		case hwmon_curr_max:
+		case hwmon_curr_min:
+			return 0644;
 		default:
 			return 0;
 		}
@@ -627,7 +687,8 @@ static const struct hwmon_channel_info * const ina238_info[] = {
 			   INA238_HWMON_IN_CONFIG),
 	HWMON_CHANNEL_INFO(curr,
 			   /* 0: current through shunt */
-			   HWMON_C_INPUT),
+			   HWMON_C_INPUT | HWMON_C_MIN | HWMON_C_MIN_ALARM |
+			   HWMON_C_MAX | HWMON_C_MAX_ALARM),
 	HWMON_CHANNEL_INFO(power,
 			   /* 0: power */
 			   HWMON_P_INPUT | HWMON_P_MAX |
-- 
2.45.2

