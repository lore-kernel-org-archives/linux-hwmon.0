Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8113D5248
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226706; cv=none; b=bMlzd2oQCdcuZRVmioqwPlXM3TCs9yGEqmIbFzq1sLG+OyJQYmVNQ70YMoz7Ht2sezK8NNKmk5C4QTRz+icfC3XGUIPV3po0lzdOWfNBagfBZDqUgBASp8+YreFGV/HYD0JnJAbSBsqr0uP4d0XRZdMu/bhVr0EnItNkkrifukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226706; c=relaxed/simple;
	bh=5+YpbmPk+2Hz0y7cbOQvMAf7V24uiqRccSFMB9vS5ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iI2hd7UFb8oQPO5QL6bFavYK62TsBFe4qNLWudQP5wlWjE5CrFHCDdkc5Ngqxll7bq8kZsvtSIVrgl30woch62hmElQ6JQZONIpb60UHHZiPIzehjcIi98XNx3AHaYI7wH7aEFq2NeBNsFEWQeYw32aC6e1WOt/amJB1VluRNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu0KEVVp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu0KEVVp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso25772155e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773226703; x=1773831503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W83A5PfaPs7aR4943/4m98NPOSE8ZZIsXZPPJaIjP6o=;
        b=Pu0KEVVpJhn/O1QkSHqKiwGoF8PwEqJCLMwYXIOZ0jRwf262M08477Y6GLx+vbUJi+
         8DkJamf91af9yg/VCtCUOM1r/rdiay5MaEXwJgY72j12PXA2ZyEh60ci6803MWSxwWYq
         EcfwecZb9KYdBhsfT/AtFjzRZo3VZYXZ0WCzlGivV9AHVBAHE6QqRcT2AGhmeOLC+zmw
         4Omy8b2TtNCUWTSXk3Dz5sqaPz45wAWZY1M6Go1IDlDo2zrWnUzTob0psIt1pOeeLjRb
         Jlhjwqrk8wzxJLO1IdKOC/NK4hcO165cMCdB6gggkV8sRCMdAsMZXTHytL+L5OGqMSBU
         6p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226703; x=1773831503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W83A5PfaPs7aR4943/4m98NPOSE8ZZIsXZPPJaIjP6o=;
        b=vWKOhvLJB6inG8me+9uVKyKvVqvYH5aCZaVnaVNG4A3+G4odj8BSfs3I7wwb+1hN+y
         mnkz+3lGg9vrt9gPJlsWUX9JEnUydNXuYLMD6DhKtMJ5CnFcQR2AIu+TFr5Y5VGMCyCT
         8kFIpp8MhrUWBftmket/N7VEKxNh9KDz4VInjz2aSoBG1yWK23G4Vjuo8b4yYm0W2GQg
         elWPP6Enog8j8qpmedeqd/0b+GqeqzSqi1SIJqswvMWaQN81eVaVFhttIfpTR7mU5PhZ
         hvR/kEEs11aYl9XH9MbX4oOTugXfg6fE7QRBfRJjrWGwvhFJ5bhXNWxwSjuHtyPhdqrH
         E1VQ==
X-Gm-Message-State: AOJu0YzCCq2OnYq42X+WBp4P6VLRrQOZtEE8SH+2Efjh2yaU+wAZY5ZL
	N+vDKLU3SaJPZjAzqEL8DM/P7VKOTSmTRzHVhrxZPcpfeHo9aTFYAi3p
X-Gm-Gg: ATEYQzxVOMH+ngeo7V8bPfJElMLVhneAl9U0+AyAXiiqEJLTZrCNxOklLjhsTCAIqig
	DwtdFuPjWYBIfHmQ0OiI2EIa2u+PJj+0EKc6poeXsc+wrlHzA6g3URCvIHTNWF4Rx8oRV5vdHgY
	u2WIUcF85f5aeU0DFwNDQ/6/bfjpoPKYuLv3CFiWFmD1CndwJqB4loyXtrjMW9IWNLrEfkyhbYg
	2FdAo/TYhP5iWx5Rc1IL2LMrLVn+bvta6+C84+FsWJQi9jeHjIBIe5zU2oScVIeIzqQ/sQ7wZbc
	PmgK/sHNBEO/4zkxrOlLjzes8NAiAbGrFnpJY9HimC8Ere9i/ROHYZLrdA6kQclFVQk+Ou9/cRS
	6dXjfoiNftKOlFR+d9JvusNjLt9idbG+az81jdm1lKHMmOEyItyBCy60KRQw7DhXpyXTSClI91L
	Gi0R+UzAKZnonMCCnlYNyG56ES8IQEAYRMc7WtCnVGj3jb8RznS5mlGfFf5KvSkEq5jj8HZ8h+
X-Received: by 2002:a05:600c:c0c9:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-4854b100b5bmr25908855e9.17.1773226702944;
        Wed, 11 Mar 2026 03:58:22 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fc0ba972sm592347f8f.24.2026.03.11.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:58:22 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: [PATCH 2/2] hwmon: lm75: Add support for label
Date: Wed, 11 Mar 2026 12:58:08 +0200
Message-ID: <20260311105809.107357-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311105809.107357-1-flaviu.nistor@gmail.com>
References: <20260311105809.107357-1-flaviu.nistor@gmail.com>
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
 drivers/hwmon/lm75.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index eda93a8c23c9..66178ac63e4f 100644
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
+			return (config_data->label) ? 0444 : 0;
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
+	of_property_read_string(dev->of_node, "label", &data->label);
+
 	data->kind = kind;
 	data->regmap = regmap;
 
-- 
2.43.0

