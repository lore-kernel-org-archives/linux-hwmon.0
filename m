Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E098543C7C8
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231410; cv=none; b=c7wqBsFQHZJ9feFj6uAXqTu++odzbJlwcbOenj8GUXCLGOUs1LB0csl+2sxeqUj9hqeRVm6umEVhwL+yBzcJlkySCCkRbQgOJ03pgEhltMT7/nUEP8ImjXxZp2iF49kkYok0o3t+PolMEamhzmde1/LibLxkAiUOUB+3yPbUIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231410; c=relaxed/simple;
	bh=Qw0OCF/A3/1KKsA18JpyAkWi2gHh2HovZ6Y84Ie5Uy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9gHSdC/kwGg05lJfUchulqOQ5l1QKSJJE7E8sKIT5Au6nmDcKP6Jg+Ug7tXkPrgB7rntm6KecMKClQA8YeJsRLxZY2PGKZiOL2CEx5QirCm5So7y+ilgU8QzVNwymPmSe7yAhqyEhGqsAGnKscbCgo75TZqNBLyS1k84oIgMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d7FuusW4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FsMxMt+c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d7FuusW4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FsMxMt+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787231405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCvjgT2AUAkiOr3ryVhwGHHtYFMb13hihrneybz56Ow=;
	b=d7FuusW4v+dBnRMK6fyUME7WK35HZnx7E5ghr/A1GUcfxMA9YFHWtViqG/VJK4eVtqua/t
	tmyiepvKrwgDiVSYEh+2dTqjwCJQiV/fbLxSvnQJ0YDmiIWHKY9MDXmskihOHK/jKzmn5P
	FCnPyPksjIsRxEMOniNL2nFc5LwBvbE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-ssurXfCAMhy66g7LbO9fRA-1; Thu, 20 Aug 2026 09:10:04 -0400
X-MC-Unique: ssurXfCAMhy66g7LbO9fRA-1
X-Mimecast-MFC-AGG-ID: ssurXfCAMhy66g7LbO9fRA_1787231403
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930edb4362dso231806485a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787231403; x=1787836203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCvjgT2AUAkiOr3ryVhwGHHtYFMb13hihrneybz56Ow=;
        b=FsMxMt+c7Nd5EWHC1Af0CGmoQ/5YWq/sINx8A08luZuK4Ql1RM8+B/q8N1lXLmalbX
         ebLnUGMVgva/qt48FLCLb2oARrHsoD9YiHAkIQkb9AYtGWZ7jKQ7+/LpPNR2HSsT8JlS
         E4Sb3cMJyDt9EOyYuXiapI5Bvwu5dygkH7qYb1o64XWklLohLxQdfL8PL1IduwriChjG
         ZJlTIuhMfT3F6IT3T3yI+EUA1zpmo9qU8qItmey9AuWLu2BY+cD8wIIi+e5IqQQIVW+C
         Yin63FIMSelozRAtz/12dLUZYnGcYIjpLDaTJtvRgu1qH+NqblJIpDGOJW4TeKmL24ur
         RsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231403; x=1787836203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCvjgT2AUAkiOr3ryVhwGHHtYFMb13hihrneybz56Ow=;
        b=eLRNdklENnDdSHMeQTp1W21swYlLdSZKeZG4WhD7SacKiPefjdwLD5P0l42uW9ab2B
         A+SrS1N0di1d9zPqL/GDfyqNbFO6TDsscWAWFMAhF8a3C8MV497Wgt+7Xu4LdIbW2WfP
         vKttoPv3pvWBCr4c6hw4APgi8nLocdYoKCBmoZir6OxbYuXjBSp2MqYN/Edo6s4giv5y
         hSM16qPs6r277XJUqlQ4PIFPC6+wVB9Bu9bdGkPnZTJuwHAAcMoQW9q+k51SR3nogrow
         Iwh4DFYRANxsDA7nYfJNmEeyLHVewBzcOdEiNBO7FxfxqhsB6wHMBFZf9fFXNqUq7Y2Q
         NQjw==
X-Gm-Message-State: AOJu0Yw3JTKNVYXpiNG7O4YaTqB8ehHMdOJgjup9FeuowMt5biRq6iqw
	WQhx8RNNrmjLfMMS5LHX3rZR60MssLXXQiyyjDIOIxMqi1Yxjc9HOVzj+0kR9CH/3maS/jAWr/x
	oNsyzvGDfn2DtjA9p/OrZffxj/nl9ETpPO3eXRsUwjzQUSFimpFEukFW7n+ZnqDY2
X-Gm-Gg: AR+sD10R2GT491XObSHMqlLFTbh4TyMHa9rHDbDh5X38HygPmr5g8uEdWQOGrGmNqPV
	XlNqEPdFKxMLo+EuEMaME5wKMrvKlnrmkUzI+zqxBBGH1lZyJzqWUAB8CAND38Uhp10rSf5IZJk
	yupR5DAYPeYyRAsV6UsVB8GTU1LHq1WyjpFJbgdYcaxBcyg9YOjDi0sw3Rd3Uegr9Idi2H7dv3N
	11DeunZ9qhxZ7koP1THshccS0iUM4w36pZAkC/IL2CXOsRUgjzMAYxov33wS2iFyU95Sr4qQIO0
	UN4MYRJfFdCJTeP6z9wA896q6t8ThD/567o9H9Bnmk5zCFoQloMk171zT2SxiCQo4ZWgn/Y8li+
	MeAoFywCE6cJuzh7XregsTgxS98QT9E7z
X-Received: by 2002:a05:620a:4107:b0:936:a5c3:512f with SMTP id af79cd13be357-9371e3147b6mr948841985a.34.1787231403542;
        Thu, 20 Aug 2026 06:10:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:936:a5c3:512f with SMTP id af79cd13be357-9371e3147b6mr948832985a.34.1787231402868;
        Thu, 20 Aug 2026 06:10:02 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204ba087sm364217985a.21.2026.08.20.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:10:02 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Thu, 20 Aug 2026 06:09:23 -0700
Subject: [PATCH v2 3/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-3-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lothar Felten <lothar.felten@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787231395; l=8705;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=Qw0OCF/A3/1KKsA18JpyAkWi2gHh2HovZ6Y84Ie5Uy4=;
 b=gY9Jlx/sztiPgE0PYZQzwyGhp5SkDswfQRZJmf6g5gg6DN0HM5hjIXuH22vj2858rdqdRqqb/
 QjXytk8quLcCsCQtoYiI4ykIaFCX0wls072bBzJcqw8mTqtg9ClRwPf
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

Instead of passing an explicit mask to alert/limit functions like
ina226_alert_read(), introduce an enum ina2xx_alert_type that can be
converted to a mask internally. This semantically separates current from
shunt voltage in helpers that use function masks, which previously saw
the same mask for the two functions.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 90 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c56e42432673f..74c4e3795ac4d 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -127,6 +127,17 @@ enum ina2xx_ids {
 	sy24655
 };
 
+enum ina2xx_alert_type {
+	INA2XX_ALERT_NONE,
+	INA2XX_ALERT_CURRENT_LOW,
+	INA2XX_ALERT_CURRENT_HIGH,
+	INA2XX_ALERT_POWER_HIGH,
+	INA2XX_ALERT_BUS_VOLTAGE_LOW,
+	INA2XX_ALERT_BUS_VOLTAGE_HIGH,
+	INA2XX_ALERT_SHUNT_VOLTAGE_LOW,
+	INA2XX_ALERT_SHUNT_VOLTAGE_HIGH,
+};
+
 struct ina2xx_config {
 	u16 config_default;
 	bool has_alerts;	/* chip supports alerts and limits */
@@ -406,16 +417,43 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
 	}
 }
 
-static int ina226_alert_limit_read(struct ina2xx_data *data, u32 mask, int reg, long *val)
+static u32 ina2xx_alert_type_to_mask(enum ina2xx_alert_type alert)
+{
+	switch (alert) {
+	case INA2XX_ALERT_CURRENT_LOW:
+	case INA2XX_ALERT_SHUNT_VOLTAGE_LOW:
+		return INA226_SHUNT_UNDER_VOLTAGE_MASK;
+	case INA2XX_ALERT_CURRENT_HIGH:
+	case INA2XX_ALERT_SHUNT_VOLTAGE_HIGH:
+		return INA226_SHUNT_OVER_VOLTAGE_MASK;
+	case INA2XX_ALERT_BUS_VOLTAGE_LOW:
+		return INA226_BUS_UNDER_VOLTAGE_MASK;
+	case INA2XX_ALERT_BUS_VOLTAGE_HIGH:
+		return INA226_BUS_OVER_VOLTAGE_MASK;
+	case INA2XX_ALERT_POWER_HIGH:
+		return INA226_POWER_OVER_LIMIT_MASK;
+	case INA2XX_ALERT_NONE:
+		return 0;
+	default:
+		/* programmer error */
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+static int ina226_alert_limit_read(struct ina2xx_data *data, enum ina2xx_alert_type alert,
+				   int reg, long *val)
 {
 	struct regmap *regmap = data->regmap;
 	int regval;
+	u32 mask;
 	int ret;
 
 	ret = regmap_read(regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
 
+	mask = ina2xx_alert_type_to_mask(alert);
 	if (regval & mask) {
 		ret = regmap_read(regmap, INA226_ALERT_LIMIT, &regval);
 		if (ret)
@@ -427,9 +465,11 @@ static int ina226_alert_limit_read(struct ina2xx_data *data, u32 mask, int reg,
 	return 0;
 }
 
-static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, int reg, long val)
+static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2xx_alert_type alert,
+				    int reg, long val)
 {
 	struct regmap *regmap = data->regmap;
+	u32 mask;
 	int ret;
 
 	if (val < 0)
@@ -450,9 +490,11 @@ static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, int reg,
 	if (ret < 0)
 		return ret;
 
-	if (val)
+	if (val) {
+		mask = ina2xx_alert_type_to_mask(alert);
 		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
 					  INA226_ALERT_CONFIG_MASK, mask);
+	}
 	return 0;
 }
 
@@ -476,15 +518,17 @@ static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
 	return 0;
 }
 
-static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *val)
+static int ina226_alert_read(struct ina2xx_data *data, enum ina2xx_alert_type alert, long *val)
 {
 	unsigned int regval;
+	u32 mask;
 	int ret;
 
 	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
 
+	mask = ina2xx_alert_type_to_mask(alert);
 	*val = (regval & mask) && (regval & INA226_ALERT_FUNCTION_FLAG);
 
 	return 0;
@@ -493,10 +537,10 @@ static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *val)
 static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	int voltage_reg = channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE;
-	u32 under_voltage_mask = channel ? INA226_BUS_UNDER_VOLTAGE_MASK
-					 : INA226_SHUNT_UNDER_VOLTAGE_MASK;
-	u32 over_voltage_mask = channel ? INA226_BUS_OVER_VOLTAGE_MASK
-					: INA226_SHUNT_OVER_VOLTAGE_MASK;
+	enum ina2xx_alert_type under_voltage_alert = channel ? INA2XX_ALERT_BUS_VOLTAGE_LOW
+							     : INA2XX_ALERT_SHUNT_VOLTAGE_LOW;
+	enum ina2xx_alert_type over_voltage_alert = channel ? INA2XX_ALERT_BUS_VOLTAGE_HIGH
+							    : INA2XX_ALERT_SHUNT_VOLTAGE_HIGH;
 	struct ina2xx_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = data->regmap;
 	unsigned int regval;
@@ -510,15 +554,15 @@ static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
 		*val = ina2xx_get_value(data, voltage_reg, regval);
 		break;
 	case hwmon_in_lcrit:
-		return ina226_alert_limit_read(data, under_voltage_mask,
+		return ina226_alert_limit_read(data, under_voltage_alert,
 					       voltage_reg, val);
 	case hwmon_in_crit:
-		return ina226_alert_limit_read(data, over_voltage_mask,
+		return ina226_alert_limit_read(data, over_voltage_alert,
 					       voltage_reg, val);
 	case hwmon_in_lcrit_alarm:
-		return ina226_alert_read(data, under_voltage_mask, val);
+		return ina226_alert_read(data, under_voltage_alert, val);
 	case hwmon_in_crit_alarm:
-		return ina226_alert_read(data, over_voltage_mask, val);
+		return ina226_alert_read(data, over_voltage_alert, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -570,10 +614,10 @@ static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
 	case hwmon_power_average:
 		return sy24655_average_power_read(data, SY24655_EIN, val);
 	case hwmon_power_crit:
-		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
+		return ina226_alert_limit_read(data, INA2XX_ALERT_POWER_HIGH,
 					       INA2XX_POWER, val);
 	case hwmon_power_crit_alarm:
-		return ina226_alert_read(data, INA226_POWER_OVER_LIMIT_MASK, val);
+		return ina226_alert_read(data, INA2XX_ALERT_POWER_HIGH, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -609,15 +653,15 @@ static int ina2xx_curr_read(struct device *dev, u32 attr, long *val)
 		*val = ina2xx_get_value(data, INA2XX_CURRENT, regval);
 		return 0;
 	case hwmon_curr_lcrit:
-		return ina226_alert_limit_read(data, INA226_SHUNT_UNDER_VOLTAGE_MASK,
+		return ina226_alert_limit_read(data, INA2XX_ALERT_CURRENT_LOW,
 					       INA2XX_CURRENT, val);
 	case hwmon_curr_crit:
-		return ina226_alert_limit_read(data, INA226_SHUNT_OVER_VOLTAGE_MASK,
+		return ina226_alert_limit_read(data, INA2XX_ALERT_CURRENT_HIGH,
 					       INA2XX_CURRENT, val);
 	case hwmon_curr_lcrit_alarm:
-		return ina226_alert_read(data, INA226_SHUNT_UNDER_VOLTAGE_MASK, val);
+		return ina226_alert_read(data, INA2XX_ALERT_CURRENT_LOW, val);
 	case hwmon_curr_crit_alarm:
-		return ina226_alert_read(data, INA226_SHUNT_OVER_VOLTAGE_MASK, val);
+		return ina226_alert_read(data, INA2XX_ALERT_CURRENT_HIGH, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -661,12 +705,12 @@ static int ina2xx_in_write(struct device *dev, u32 attr, int channel, long val)
 	switch (attr) {
 	case hwmon_in_lcrit:
 		return ina226_alert_limit_write(data,
-			channel ? INA226_BUS_UNDER_VOLTAGE_MASK : INA226_SHUNT_UNDER_VOLTAGE_MASK,
+			channel ? INA2XX_ALERT_BUS_VOLTAGE_LOW : INA2XX_ALERT_SHUNT_VOLTAGE_LOW,
 			channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE,
 			val);
 	case hwmon_in_crit:
 		return ina226_alert_limit_write(data,
-			channel ? INA226_BUS_OVER_VOLTAGE_MASK : INA226_SHUNT_OVER_VOLTAGE_MASK,
+			channel ? INA2XX_ALERT_BUS_VOLTAGE_HIGH : INA2XX_ALERT_SHUNT_VOLTAGE_HIGH,
 			channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE,
 			val);
 	default:
@@ -681,7 +725,7 @@ static int ina2xx_power_write(struct device *dev, u32 attr, long val)
 
 	switch (attr) {
 	case hwmon_power_crit:
-		return ina226_alert_limit_write(data, INA226_POWER_OVER_LIMIT_MASK,
+		return ina226_alert_limit_write(data, INA2XX_ALERT_POWER_HIGH,
 						INA2XX_POWER, val);
 	default:
 		return -EOPNOTSUPP;
@@ -695,10 +739,10 @@ static int ina2xx_curr_write(struct device *dev, u32 attr, long val)
 
 	switch (attr) {
 	case hwmon_curr_lcrit:
-		return ina226_alert_limit_write(data, INA226_SHUNT_UNDER_VOLTAGE_MASK,
+		return ina226_alert_limit_write(data, INA2XX_ALERT_CURRENT_LOW,
 						INA2XX_CURRENT, val);
 	case hwmon_curr_crit:
-		return ina226_alert_limit_write(data, INA226_SHUNT_OVER_VOLTAGE_MASK,
+		return ina226_alert_limit_write(data, INA2XX_ALERT_CURRENT_HIGH,
 						INA2XX_CURRENT, val);
 	default:
 		return -EOPNOTSUPP;

-- 
2.55.0

