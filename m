Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286AF1465A1
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Apr 2024 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714140651; cv=none; b=sNWTTUFFV44EhYNf5XEO9UZoph8zB2jhRPmwxMv5s/SCtGjY9piI6UkVzvbbPOFeMh9OH46m4BD1BmWjCN89ARP3rWPwlRRbFjqGcP2vtBWQiOAa/unM+TEBUFX/YDwIZaPwVWIvkybsZwUSsV/LYFG61ntbb+GsYjdkbYMrAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714140651; c=relaxed/simple;
	bh=YxuKwxiE7lZiF/MuwilWA8YCk2OfgLn6audV9ULrmCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jN/DU8T22az9/N+S7kHzjI4zs0bAhYf/ruEXR+omAd2zirliHWwGwQQj20OEcOFMo6qA1RkI66/g5P/wsD5SJSdxA7QqhXLekD+/+Fw7vcOlM7BnWXXWpPnHtbCuxVUJKVRhdZSIfzTm3S2SrBiQvGVzjHrNk58TXh/fDm0fwiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ghlu2ZHt; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ghlu2ZHt"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51acb95b892so2815734e87.2
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Apr 2024 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714140647; x=1714745447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+bUiqBQIZo93GBOOsSTDfI5lP6Tu4H/kOWjCdVw804=;
        b=Ghlu2ZHt0hgtsNg7luFjS6+Hz4BfU6rjDJC8Xk9oLccAkDM67O8RbJiKigzEOImjNu
         lKsGkg0FdN04nx0KFhG0uokYc9JzSWh42UmkWLCehfyO7WNu8Kp8xrcQA/e/6G5Pv9ae
         b74MPhBGx4kGi1Y758PHD6bM4v6YYDulfyQWOX6OuoIvZlt+C8XUOs1dYHC1GF9jHX45
         KT9VFBDdpIbTEtuv54yytWGtUQ6dpvPa1w/g66Z03QeT1Fxl/sECwpfZmRxrupAmrK60
         wYjqW+F6U7np4QNXyobRqJbjJ40tlimwdAQUvceXBb56Lz97UkMqRrnUxpIEvcPGjpsd
         YjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714140647; x=1714745447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+bUiqBQIZo93GBOOsSTDfI5lP6Tu4H/kOWjCdVw804=;
        b=SZYpWMyQHkBn7sldt72tBO6RtEHlprtFq7jeNoH8ak6vbd/bEu3hPeXoMsAyvko2cs
         30xxQ9b/u+MzpUA7WRKKWu7AYyQNCy2zTHCqbK34uDNIpwglRCv84UlKChu4Yo0y+9Qj
         3PWg0+z8Lkm1PTEjLLFDVmwCSWoelQHJ1TwN3Z2pRmEJLLSgQ9ddrhrPRXrIr7YmmGOs
         /Fosda3/H6icduEZFi54y7wyss22HFGfjB2tkvfBU6r1Hwb6JcGVGSkL02IO3gFwGYG1
         6LHGPPKDBJxketWsCuWP3v/Dv43bS+QvOdRBwPNDi6kaVuobGXU7Xrwd3xp/MrBCUotD
         qG2A==
X-Forwarded-Encrypted: i=1; AJvYcCVl6Obv2jsz8yOB95wTNonfo9q01WTYgXo7ieYCuVobQYAg7c0loqwpmR+dQyAJ5VKymUk/I7pWhrGvXMz4RFrY7CCCrHWVh20sD/g=
X-Gm-Message-State: AOJu0YwlsgkqwSil3dy0sPe7NcEL+x3DQMFhKich5xla3z43d/I2G3zQ
	jm2QFHOPC7qD14KdB4sd2PgEPKfHmt6Ayp9AuhUQnVqItd1LVJnH
X-Google-Smtp-Source: AGHT+IEFgQ6rVpxUkaLHHWJCP/PRj16D0pNFwEJm7pnsulERTUOjkKpY3EqM9hQX0kaQh6VNYkNNLg==
X-Received: by 2002:a05:6512:ac1:b0:51c:cc1b:a8f6 with SMTP id n1-20020a0565120ac100b0051ccc1ba8f6mr1509986lfu.20.1714140646675;
        Fri, 26 Apr 2024 07:10:46 -0700 (PDT)
Received: from lpm-pc.appeartv.lan (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id o22-20020ac24e96000000b00516c40b05b0sm3173711lfr.215.2024.04.26.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 07:10:46 -0700 (PDT)
From: Lars Petter Mostad <larspm@gmail.com>
X-Google-Original-From: Lars Petter Mostad <lars.petter.mostad@appear.net>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: [PATCH] hwmon: (emc1403) Add support for EMC1438.
Date: Fri, 26 Apr 2024 16:09:37 +0200
Message-ID: <20240426140937.609172-1-lars.petter.mostad@appear.net>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EMC1438 is similar to EMC14x4, but supports four
more external temperature sensors.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
---
 drivers/hwmon/emc1403.c | 119 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index d370efd6f986..1ce01baf7a1e 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -24,12 +24,12 @@
 #define THERMAL_SMSC_ID_REG	0xfe
 #define THERMAL_REVISION_REG	0xff
 
-enum emc1403_chip { emc1402, emc1403, emc1404 };
+enum emc1403_chip { emc1402, emc1403, emc1404, emc1408 };
 
 struct thermal_data {
 	struct regmap *regmap;
 	struct mutex mutex;
-	const struct attribute_group *groups[4];
+	const struct attribute_group *groups[5];
 };
 
 static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
@@ -209,6 +209,54 @@ static SENSOR_DEVICE_ATTR_RO(temp4_min_hyst, min_hyst, 0x2D);
 static SENSOR_DEVICE_ATTR_RO(temp4_max_hyst, hyst, 0x2C);
 static SENSOR_DEVICE_ATTR_RO(temp4_crit_hyst, hyst, 0x30);
 
+static SENSOR_DEVICE_ATTR_RW(temp5_min, temp, 0x51);
+static SENSOR_DEVICE_ATTR_RW(temp5_max, temp, 0x50);
+static SENSOR_DEVICE_ATTR_RW(temp5_crit, temp, 0x64);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 0x41);
+static SENSOR_DEVICE_ATTR_2_RO(temp5_fault, bit, 0x1b, 0x10);
+static SENSOR_DEVICE_ATTR_2_RO(temp5_min_alarm, bit, 0x36, 0x10);
+static SENSOR_DEVICE_ATTR_2_RO(temp5_max_alarm, bit, 0x35, 0x10);
+static SENSOR_DEVICE_ATTR_2_RO(temp5_crit_alarm, bit, 0x37, 0x10);
+static SENSOR_DEVICE_ATTR_RO(temp5_min_hyst, min_hyst, 0x51);
+static SENSOR_DEVICE_ATTR_RO(temp5_max_hyst, hyst, 0x50);
+static SENSOR_DEVICE_ATTR_RO(temp5_crit_hyst, hyst, 0x64);
+
+static SENSOR_DEVICE_ATTR_RW(temp6_min, temp, 0x55);
+static SENSOR_DEVICE_ATTR_RW(temp6_max, temp, 0x54);
+static SENSOR_DEVICE_ATTR_RW(temp6_crit, temp, 0x65);
+static SENSOR_DEVICE_ATTR_RO(temp6_input, temp, 0x43);
+static SENSOR_DEVICE_ATTR_2_RO(temp6_fault, bit, 0x1b, 0x20);
+static SENSOR_DEVICE_ATTR_2_RO(temp6_min_alarm, bit, 0x36, 0x20);
+static SENSOR_DEVICE_ATTR_2_RO(temp6_max_alarm, bit, 0x35, 0x20);
+static SENSOR_DEVICE_ATTR_2_RO(temp6_crit_alarm, bit, 0x37, 0x20);
+static SENSOR_DEVICE_ATTR_RO(temp6_min_hyst, min_hyst, 0x55);
+static SENSOR_DEVICE_ATTR_RO(temp6_max_hyst, hyst, 0x54);
+static SENSOR_DEVICE_ATTR_RO(temp6_crit_hyst, hyst, 0x65);
+
+static SENSOR_DEVICE_ATTR_RW(temp7_min, temp, 0x59);
+static SENSOR_DEVICE_ATTR_RW(temp7_max, temp, 0x58);
+static SENSOR_DEVICE_ATTR_RW(temp7_crit, temp, 0x66);
+static SENSOR_DEVICE_ATTR_RO(temp7_input, temp, 0x45);
+static SENSOR_DEVICE_ATTR_2_RO(temp7_fault, bit, 0x1b, 0x40);
+static SENSOR_DEVICE_ATTR_2_RO(temp7_min_alarm, bit, 0x36, 0x40);
+static SENSOR_DEVICE_ATTR_2_RO(temp7_max_alarm, bit, 0x35, 0x40);
+static SENSOR_DEVICE_ATTR_2_RO(temp7_crit_alarm, bit, 0x37, 0x40);
+static SENSOR_DEVICE_ATTR_RO(temp7_min_hyst, min_hyst, 0x59);
+static SENSOR_DEVICE_ATTR_RO(temp7_max_hyst, hyst, 0x58);
+static SENSOR_DEVICE_ATTR_RO(temp7_crit_hyst, hyst, 0x66);
+
+static SENSOR_DEVICE_ATTR_RW(temp8_min, temp, 0x5D);
+static SENSOR_DEVICE_ATTR_RW(temp8_max, temp, 0x5C);
+static SENSOR_DEVICE_ATTR_RW(temp8_crit, temp, 0x67);
+static SENSOR_DEVICE_ATTR_RO(temp8_input, temp, 0x47);
+static SENSOR_DEVICE_ATTR_2_RO(temp8_fault, bit, 0x1b, 0x80);
+static SENSOR_DEVICE_ATTR_2_RO(temp8_min_alarm, bit, 0x36, 0x80);
+static SENSOR_DEVICE_ATTR_2_RO(temp8_max_alarm, bit, 0x35, 0x80);
+static SENSOR_DEVICE_ATTR_2_RO(temp8_crit_alarm, bit, 0x37, 0x80);
+static SENSOR_DEVICE_ATTR_RO(temp8_min_hyst, min_hyst, 0x5D);
+static SENSOR_DEVICE_ATTR_RO(temp8_max_hyst, hyst, 0x5C);
+static SENSOR_DEVICE_ATTR_RO(temp8_crit_hyst, hyst, 0x67);
+
 static SENSOR_DEVICE_ATTR_2_RW(power_state, bit, 0x03, 0x40);
 
 static struct attribute *emc1402_attrs[] = {
@@ -283,6 +331,58 @@ static const struct attribute_group emc1404_group = {
 	.attrs = emc1404_attrs,
 };
 
+static struct attribute *emc1408_attrs[] = {
+	&sensor_dev_attr_temp5_min.dev_attr.attr,
+	&sensor_dev_attr_temp5_max.dev_attr.attr,
+	&sensor_dev_attr_temp5_crit.dev_attr.attr,
+	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_fault.dev_attr.attr,
+	&sensor_dev_attr_temp5_min_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_max_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_min_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp5_max_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp5_crit_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp6_min.dev_attr.attr,
+	&sensor_dev_attr_temp6_max.dev_attr.attr,
+	&sensor_dev_attr_temp6_crit.dev_attr.attr,
+	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_fault.dev_attr.attr,
+	&sensor_dev_attr_temp6_min_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_max_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_min_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp6_max_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp6_crit_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp7_min.dev_attr.attr,
+	&sensor_dev_attr_temp7_max.dev_attr.attr,
+	&sensor_dev_attr_temp7_crit.dev_attr.attr,
+	&sensor_dev_attr_temp7_input.dev_attr.attr,
+	&sensor_dev_attr_temp7_fault.dev_attr.attr,
+	&sensor_dev_attr_temp7_min_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp7_max_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp7_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp7_min_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp7_max_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp7_crit_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp8_min.dev_attr.attr,
+	&sensor_dev_attr_temp8_max.dev_attr.attr,
+	&sensor_dev_attr_temp8_crit.dev_attr.attr,
+	&sensor_dev_attr_temp8_input.dev_attr.attr,
+	&sensor_dev_attr_temp8_fault.dev_attr.attr,
+	&sensor_dev_attr_temp8_min_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp8_max_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp8_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp8_min_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp8_max_hyst.dev_attr.attr,
+	&sensor_dev_attr_temp8_crit_hyst.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group emc1408_group = {
+	.attrs = emc1408_attrs,
+};
+
 /*
  * EMC14x2 uses a different register and different bits to report alarm and
  * fault status. For simplicity, provide a separate attribute group for this
@@ -346,6 +446,9 @@ static int emc1403_detect(struct i2c_client *client,
 	case 0x27:
 		strscpy(info->type, "emc1424", I2C_NAME_SIZE);
 		break;
+	case 0x59:
+		strscpy(info->type, "emc1438", I2C_NAME_SIZE);
+		break;
 	case 0x60:
 		strscpy(info->type, "emc1442", I2C_NAME_SIZE);
 		break;
@@ -376,6 +479,14 @@ static bool emc1403_regmap_is_volatile(struct device *dev, unsigned int reg)
 	case 0x35:	/* high limit status */
 	case 0x36:	/* low limit status */
 	case 0x37:	/* therm limit status */
+	case 0x41:	/* external diode 4 high byte */
+	case 0x42:	/* external diode 4 low byte */
+	case 0x43:	/* external diode 5 high byte */
+	case 0x44:	/* external diode 5 low byte */
+	case 0x45:	/* external diode 6 high byte */
+	case 0x46:	/* external diode 6 low byte */
+	case 0x47:	/* external diode 7 high byte */
+	case 0x48:	/* external diode 7 low byte */
 		return true;
 	default:
 		return false;
@@ -409,6 +520,9 @@ static int emc1403_probe(struct i2c_client *client)
 	mutex_init(&data->mutex);
 
 	switch (id->driver_data) {
+	case emc1408:
+		data->groups[3] = &emc1408_group;
+		fallthrough;
 	case emc1404:
 		data->groups[2] = &emc1404_group;
 		fallthrough;
@@ -447,6 +561,7 @@ static const struct i2c_device_id emc1403_idtable[] = {
 	{ "emc1422", emc1402 },
 	{ "emc1423", emc1403 },
 	{ "emc1424", emc1404 },
+	{ "emc1438", emc1408 },
 	{ "emc1442", emc1402 },
 	{ }
 };

base-commit: e723f6ca39fb54ae31f79b5af74fe8496308d4de
-- 
2.44.0

