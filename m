Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149391A5BA2
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760303792; cv=none; b=bufWe7H7PBcc6FEtlrwm3F1+sivrUYclrSzDhGO0BJkHqyXF31NDbg2axgjNrkfI07B2MP3I7D5kthb+OeY4ixnYGEXt4nS9N9fcy4PuCQA1r9aLmMH8b/BET7Nipq18cFATySUNUHsJyvD+VDNUDcHgLHLbvh0QySRTMIQ9Dbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760303792; c=relaxed/simple;
	bh=Pu+vP0+hdbywp/wLHhJRmSYzQGGNkPc2jQbAM2AHNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RtNJXhGsFKJiKh2YkRJXtbDeWA1WvLuhB8ahjJeeR0pVE0mdXRB8wissNaHAFyn9hsjy3b18ssywGQLeeaB8XSDVQ19FJPstgOAH4Ot2SG7ayLZTJc1wIX8NmnXo+JPDPYNyS/Cb9Egr9SAcbUrA+TtRuaRuyU+EixHBnpxm9jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtWrL4mM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtWrL4mM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3332888b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760303790; x=1760908590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8i93oshASGYoq0GdYNvPw1gAZ8dgF08VSo3DwMozm4k=;
        b=ZtWrL4mMGuvsebeKncj1bqrsbuvXXVIOdP/vJCRpvyCB7Lot3iWlu6xlZrzsSvFsla
         4U8oc06FCqtxI/TJvJVHdffVAInmoiGNbUSkd3U0IxTtDrgcKIeBioRQtBwqX1KRY/Uj
         3O2LN+t5/p2vLWvSEJfLdHYSt5c7K84kjJH7kq6SVeRJ7vV/3nryrSsDJkBcTkw0mcQ4
         biBSETE8b0eyAAF5bGoi7h1iOu0LQEPqetyq9qkJVHCSmcxpcJUdfRnkfUktectNhuDW
         KbCKg7fxojU+CtDGm2EqJKv3VA00duKDBxYFvMWBD8el6qEhloNW20Wt2hIJR5D62AWy
         7Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760303790; x=1760908590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8i93oshASGYoq0GdYNvPw1gAZ8dgF08VSo3DwMozm4k=;
        b=QTsVhw+PdhIz+W4pSjAE42V3/B1QOgwDMmgd8O32lF/x3JfR58jaHjkPy3D7sUA0xr
         +NlaxSuGbadDDxEUHB7xFYDtP0It2qdLM/8qjX5C/7BAJWRJ9kRCyPl2Dtd6gCVr7DXI
         C82QySoX6So8R6pWQBjW1hRB0mtXzzcTlQfFOlY/aMOGpJkMcL9alwl2af2Dr4DmX6PD
         pAE+i4oAgPH/QxHQzlgCdLZyGkarq+lbLj3FvuPyeeXJR3nZJY/wmHveRutfDX+hUZOk
         O+cFqrKuPGv5fuY2JQFiGScTMWe/TQ7fmcK6z7JHsGESMFoDBWURNpx4g8owVWOnmOuA
         IQ1g==
X-Gm-Message-State: AOJu0Yyu/u+6qAafW6Mcd+F0HhD5snlj0i7m1+Jtfe5p9zBWFe7MKvRo
	3eW+qdNc/PaeBAnQpYrCi+aHEZaSH5EoHQrQyhHDJLb6nhpRGValU+U3GDAuyw==
X-Gm-Gg: ASbGnctLic8jwLOZq7gCGJ+qyKEpBrNRhH/buz5C/nC5QPhG5GcC+q0yHp3067muhHa
	0gpxRhyiYcRjT4F1CUaZplkIn4oi7b2ZCQpzd7QMIPbJZ0BYM0MFobq5ShuCJT4HCSZpLHhPWTi
	1eKbsbEzqqeE8imiiObskjSj+W85jKm4lkT1OC8WqFzDFPeGY7eFRiB3gt65VZFcsNP0PWIWkDT
	HSlgbFXtNnlTEBeXB6Ljr3XnL0rsGGPCWot4+eMZmNS3HTEqMqE5f7VQ1tiMtQva+ktwQ/jrQbl
	MtgHtUUyWUw9O6SoAQtOK6kBsAQBa3uAQRbd11gsLRUyt6vf/GmV2/+tob1qnAFxsIBuCuq0MUA
	6RNVq3PbPsU1lVa9p21w94gxCQrbL0HTRM6ntI+TyLoQs3x2PG6JcQlna0r+OyB61zRqT0HPwNy
	Y=
X-Google-Smtp-Source: AGHT+IFOifiyk6q5FNUiePkXLMFn86dMTEREiW6sU5m5NtzGfy50hS/RH08uuC9vWnFq+NrgFkcnGg==
X-Received: by 2002:a05:6a21:8985:b0:32d:b925:5766 with SMTP id adf61e73a8af0-32db9258094mr15256139637.23.1760303789947;
        Sun, 12 Oct 2025 14:16:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992dd854a2sm9256882b3a.76.2025.10.12.14.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 14:16:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (ltc2947) Use the energy64 attribute type to report the energy
Date: Sun, 12 Oct 2025 14:16:24 -0700
Message-ID: <20251012211625.533791-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the energy64 attribute type instead of a locally defined sysfs
attribute to report the accumulated energy.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc2947-core.c | 60 ++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index 244839167e51..90f70f732b41 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -9,8 +9,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/module.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -319,24 +319,6 @@ static int ltc2947_alarm_read(struct ltc2947_data *st, const u8 reg,
 	return ret;
 }
 
-static ssize_t ltc2947_show_value(struct device *dev,
-				  struct device_attribute *da, char *buf)
-{
-	struct ltc2947_data *st = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	int ret;
-	s64 val = 0;
-
-	ret = ltc2947_val_read(st, attr->index, LTC2947_PAGE0, 6, &val);
-	if (ret)
-		return ret;
-
-	/* value in microJoule. st->lsb_energy was multiplied by 10E9 */
-	val = div_s64(val * st->lsb_energy, 1000);
-
-	return sprintf(buf, "%lld\n", val);
-}
-
 static int ltc2947_read_temp(struct device *dev, const u32 attr, long *val,
 			     const int channel)
 {
@@ -588,6 +570,23 @@ static int ltc2947_read_in(struct device *dev, const u32 attr, long *val,
 	return 0;
 }
 
+static int ltc2947_read_energy(struct device *dev, s64 *val, const int channel)
+{
+	int reg = channel ? LTC2947_REG_ENERGY2 : LTC2947_REG_ENERGY1;
+	struct ltc2947_data *st = dev_get_drvdata(dev);
+	s64 __val = 0;
+	int ret;
+
+	ret = ltc2947_val_read(st, reg, LTC2947_PAGE0, 6, &__val);
+	if (ret)
+		return ret;
+
+	/* value in microJoule. st->lsb_energy was multiplied by 10E9 */
+	*val = DIV_S64_ROUND_CLOSEST(__val * st->lsb_energy, 1000);
+
+	return 0;
+}
+
 static int ltc2947_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
@@ -600,6 +599,8 @@ static int ltc2947_read(struct device *dev, enum hwmon_sensor_types type,
 		return ltc2947_read_power(dev, attr, val);
 	case hwmon_temp:
 		return ltc2947_read_temp(dev, attr, val, channel);
+	case hwmon_energy64:
+		return ltc2947_read_energy(dev, (s64 *)val, channel);
 	default:
 		return -ENOTSUPP;
 	}
@@ -897,6 +898,8 @@ static umode_t ltc2947_is_visible(const void *data,
 		return ltc2947_power_is_visible(attr);
 	case hwmon_temp:
 		return ltc2947_temp_is_visible(attr);
+	case hwmon_energy64:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -929,6 +932,9 @@ static const struct hwmon_channel_info * const ltc2947_info[] = {
 			   HWMON_T_LABEL,
 			   HWMON_T_MAX_ALARM | HWMON_T_MIN_ALARM | HWMON_T_MAX |
 			   HWMON_T_MIN | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(energy64,
+			   HWMON_E_INPUT,
+			   HWMON_E_INPUT),
 	NULL
 };
 
@@ -944,19 +950,6 @@ static const struct hwmon_chip_info ltc2947_chip_info = {
 	.info = ltc2947_info,
 };
 
-/* energy attributes are 6bytes wide so we need u64 */
-static SENSOR_DEVICE_ATTR(energy1_input, 0444, ltc2947_show_value, NULL,
-			  LTC2947_REG_ENERGY1);
-static SENSOR_DEVICE_ATTR(energy2_input, 0444, ltc2947_show_value, NULL,
-			  LTC2947_REG_ENERGY2);
-
-static struct attribute *ltc2947_attrs[] = {
-	&sensor_dev_attr_energy1_input.dev_attr.attr,
-	&sensor_dev_attr_energy2_input.dev_attr.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(ltc2947);
-
 static int ltc2947_setup(struct ltc2947_data *st)
 {
 	int ret;
@@ -1114,8 +1107,7 @@ int ltc2947_core_probe(struct regmap *map, const char *name)
 		return ret;
 
 	hwmon = devm_hwmon_device_register_with_info(dev, name, st,
-						     &ltc2947_chip_info,
-						     ltc2947_groups);
+						     &ltc2947_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 EXPORT_SYMBOL_GPL(ltc2947_core_probe);
-- 
2.45.2

