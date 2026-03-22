Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6294223DE9
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774196788; cv=none; b=VBP2GnF10ZxsKAuegvYlh6LvCUuWQHmkiJKB0vE7+jiA/HAhPYYJgQqR8198C1AO5XsT9T+76p6RIKe6uhRmlNXa1+vHdsJSHpMHfRVCWBURBefjHQWL7VW1DGgzb1+XyqG8jVfB+E3YUwjgujmmcupEqs/pRjgH8QiEqaP9Gf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774196788; c=relaxed/simple;
	bh=MDw4Q4le01sBWOPiEMDkhHEAdY6ta5EZBJgpWx3GlPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OjH3ZXbYziYrx3ifpU/CSMfZviovUc0YIDVI/4ri1KAf/pB+IAqhAR4Syr9DHyt2DzVPKaSug9IdPggPUnvTpqfMh/rhemS17WHbPm7SdaTofXORR9d9U1rfwB5AAxojZx+oIuq/jPNUs0UmM8/cHc/lNNONMxHFTkxCjtpS3uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jr2C+FAC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jr2C+FAC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so14146815e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774196785; x=1774801585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bF+t+AJlmrsoFM2ABTlMfmbX6sn3UthH749b4cE0NCk=;
        b=jr2C+FACfHjzaOOBfkzzTVM1roCYDnQTsiZNpO1D4oy79LMCdXsrjtHZhxr8gW+dHx
         BqWvQAXYXWjv5iUhRO4GgiRnTV5FzQWVT8eiZtJJwNcAKJ9IrAtADfVAg8p3qY2nr+TV
         G3BuAODhg8zGUN0Kvlpx3l7QvYfXmUh2XeRDNxET52VAQGOVUxk77gPmADdRSUbXbyd/
         1W449ffPza4aZbfzad1SiUqRO6st7/mG1HA00o26jVPUZx+c/lM4EgBnMUsMt1jxYslX
         Hcz0LaJGdAq3s9lGIWMwIqPW7alb72dkaEg8O4TN2djKxlmPQWg4Vr+MONHgP4TAjfGa
         OPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774196785; x=1774801585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF+t+AJlmrsoFM2ABTlMfmbX6sn3UthH749b4cE0NCk=;
        b=KvMkRc/Y0qbFuc61AmexURvU5tcu97nd6KnnL7mqdDb6P9oVdm95PrAWX2Qi4vRVLN
         IAZgqlVf3lDK47W1xHN80JZ7ti0mjFJBXgkmOlMfP1AFtEK/tCBiSNvsVb0FBvJ9cPX9
         4jUOUt6Rpd2fW4vmkPTNBAB2S8r13J9Gmc2RuJ/PGlZkjlfbZb9q2MKAxoQ/R5kLecAo
         XaX6RwLLNudlxuIS2qhiVIh4Auj4xTTvXhfS6bOOox0tUH4yduwUEY4tFTOjhbG+GI6a
         j4VNBiTJcTu51G5okgbiFd35ZRpGVes4ZvvZDWtXDv8ClziOpl3qpuyNE7zV5mY/HASE
         m2yg==
X-Forwarded-Encrypted: i=1; AJvYcCWoEDg0zdVvnM4sR8GjgVOuOAwl+EFIF9FEB7pf8F3+ixajXJRouBzRlUOH37keX2Kx8EU8jcq3VwKI/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YykpONGtGUxPr+T+a/q/A3JLBvvc3hyHvj8S77su3Y+wfT7wT1+
	r6tvxdk2ItdZX+F5BYndAhgnuk4aBJgHFVqvvuI3mMJw5Ixs+irTfA67
X-Gm-Gg: ATEYQzzys3gzMSgl3sk/7INzf3L/IljR1LnQEvBMKvfaOtkVinjSRFAZMf/SIWVjOi2
	SqaLzbGYW82zsfHOBNk7xE9C2iDeJENE2/5ZT7ldhqFPjNYMcB4qpg5JIcsiQr1yH6WHtu2O+14
	PZavx9bqeAT1VmKS6WiBrUvP/y14yfatEBueSlCXHrtR5hnKUJxprQKl3W04pAp5wlZar7VbHMw
	ZqLFEQDH12hxqyHByjk/glXQjywakITFEaEdIxHhcMXOJ344d/SaRGjgHGcx97kuXco9RSbtAiO
	noEopMwqrkI4/m8VYxSFLwjMtrpes3ikmSMtySiPWLvd2HQDSo49YC19eT1aJk2xAWW+nLRLGiE
	ywrtpz73Gz3ce4wj7+NsihPITA7RD4nqPHyf5dFZctUyQv/gNLTjcRHbQYB3PxqYGKBqL0J0hfz
	3B+WH293utUBhH3eDACyi09hZ02qop1kKo8MSVfQ7Xr7HGH41oCo2RpHpddwII+c+DzpbKNkeP
X-Received: by 2002:a05:600c:c167:b0:486:fc94:d8f2 with SMTP id 5b1f17b1804b1-486fedbc066mr129097055e9.14.1774196784559;
        Sun, 22 Mar 2026 09:26:24 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe88ef4esm64071655e9.10.2026.03.22.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:26:23 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: lm75: Add support for label
Date: Sun, 22 Mar 2026 18:26:16 +0200
Message-ID: <20260322162616.102229-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other hwmon devices.
This is particularly useful for systems with multiple sensors on the
same board, where identifying individual sensors is much easier since
labels can be defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
- Drop the binding change since they are not necessary.
- Implement changes suggested by Guenter Roeck.
- Link to v1: https://lore.kernel.org/all/20260311105809.107357-2-flaviu.nistor@gmail.com/

 drivers/hwmon/lm75.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index eda93a8c23c9..f1a1e5b888f6 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -108,6 +108,7 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 #define PCT2075_REG_IDLE	0x04
 
 struct lm75_data {
+	const char *label;
 	struct regmap			*regmap;
 	u16				orig_conf;
 	u8				resolution;	/* In bits, 9 to 16 */
@@ -363,6 +364,16 @@ static irqreturn_t lm75_alarm_handler(int irq, void *private)
 	return IRQ_HANDLED;
 }
 
+static int lm75_read_string(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, const char **str)
+{
+	struct lm75_data *data = dev_get_drvdata(dev);
+
+	*str = data->label;
+
+	return 0;
+}
+
 static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 		     u32 attr, int channel, long *val)
 {
@@ -534,6 +545,9 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_temp_input:
 			return 0444;
+		case hwmon_temp_label:
+		/* Hide label node if label is not provided */
+			return config_data->label ? 0444 : 0;
 		case hwmon_temp_max:
 		case hwmon_temp_max_hyst:
 			return 0644;
@@ -553,13 +567,14 @@ static const struct hwmon_channel_info * const lm75_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_ALARM),
 	NULL
 };
 
 static const struct hwmon_ops lm75_hwmon_ops = {
 	.is_visible = lm75_is_visible,
+	.read_string = lm75_read_string,
 	.read = lm75_read,
 	.write = lm75_write,
 };
@@ -721,6 +736,9 @@ static int lm75_generic_probe(struct device *dev, const char *name,
 	/* needed by custom regmap callbacks */
 	dev_set_drvdata(dev, data);
 
+	/* Save the connected input label if available */
+	device_property_read_string(dev, "label", &data->label);
+
 	data->kind = kind;
 	data->regmap = regmap;
 
-- 
2.43.0

