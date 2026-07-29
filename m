Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3034B3AAF6E
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339786; cv=none; b=cSCoeJiln35cXBsi0hf5COmFiKSE8iXW1v/0uA01rY3Wh0yJtyHLPImM0vmVBfmHF/Ya7g5m59RipcpaO+gy7TGDpQVvjBQ0TfU91Hunm/7clrYYMGrNQCGwXCJKN+faJNi+K8qqBIzUWZBTdNDjJD6ti3cyuN0jhWce99pkM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339786; c=relaxed/simple;
	bh=7cvQsYeqEFMM+UAsbwFJcMnfJCxjYWpqtJqI15UtuZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aehX7wLzWR7JTFsq1CeVj6Lh13pVEeLlll6jcW6T34zwbUUA4Obd4GAdGggCt3cTYRrI9AdXglPFPExTGqEjPts8qEDFlDbjc0fxIjFIBiaBxhxjEbtHn5wvsP60OoeJ81AosGXxU9dYjWyckq0YiumNVZyKJMBPXd1u5E35G5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MfCsevOO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWgm2V3P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MfCsevOO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWgm2V3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785339784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8ofwM6IaFQOJhqaS7eZyUDE7/BxFqWYu1uXaVVdpTU=;
	b=MfCsevOO1WS1xRb6sxIy91E0iXpudzUIm2jip6idDrJbtqdEznXTNJ7w5BVwlbJe2nCCfP
	yS8rfjnWfE7Ad9YvPCq1EV00zgfGg39Fq4w0jlVnCq1Xx2GWmsvxDSGy5lHawzCKR0WpFn
	jo6UZO4+3Q03UNzoHPc6f7RypXKgbGA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-SkSdZAbYPWWW8agHkcSiaA-1; Wed, 29 Jul 2026 11:43:02 -0400
X-MC-Unique: SkSdZAbYPWWW8agHkcSiaA-1
X-Mimecast-MFC-AGG-ID: SkSdZAbYPWWW8agHkcSiaA_1785339782
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso94591cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785339782; x=1785944582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8ofwM6IaFQOJhqaS7eZyUDE7/BxFqWYu1uXaVVdpTU=;
        b=iWgm2V3POYn/bxay1sl8WqkUw0lp8w5IzmqDYpbgLCjCD3n+dZAxDqJhXpHzh+9tdj
         vr1PC3Dh6AsQT89Tn+NT9ubkXTAA0+cuLpoZC3HmUmupXwLSgc8G0xPXIH/w7BrsKWii
         kNfythaR2xnVKUthzsVN7oWccqYBsJUDNvyrstEDJvVQBsiIFvD6X2biZyEj5VHlad44
         /UTWTyLe1HQoq89hQ9qs/IS0XvR6zZuJTS/XSvkkcllfdkydah9sXVg2CcpP1e0KuvwL
         i3Xg7XYVCsgQE5xjokei3UrAArYOi54qris6oTKa5zw1bun++rByu79BchVEIHBSNnAB
         JBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339782; x=1785944582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8ofwM6IaFQOJhqaS7eZyUDE7/BxFqWYu1uXaVVdpTU=;
        b=Fs+ynRMTXbRBBKL858Uk7HfF1MAoKI9ABSeDTKyGmUBG93ayy4bwPo+CV9ZaFrh+Fw
         opFioU5mVxVQ4R0IvNNOoYpzmZRgHIvEaIYNr0pMhAiqJUHyWJhzgGRGAiA68Fs1kCML
         eYGEUqBYT/+hQ5jIRUdOYw4wlnepgfJfswGe6Pfvreap9lqmMV7U1T6qhkX1eNl9KtRa
         y170LXPCJD6zZrVFbN6MKF9AWRga02n8R4bnB0RcGhtSIOFLpUjVM4X6IaB7EiqvEl9l
         dmZ7zsUlz9LKPrbysX83dEphg0+cGI72+la70aelQ5PNnDusf8zKdxZV0wbZWF0l4hSE
         VHJA==
X-Gm-Message-State: AOJu0Yzqw9vUf5kDjtGGNxKNnHeBr6xlnDMGJ67Zsy2ooZN6yUOAN8cr
	0eoIJzALCMnJvOub1EzTJxxzo33sBaE7lYaEd3yUsY90IA9NPUKnq3bNO1UTWss5uHaXw4bk6Ds
	0uoD5e3r98h1ydfs69it2RMGABjPSXr16hUkTzmkYFlzK/OIMIi+BV+4ZgA/OOFsaOackuS0O0C
	r+zywaeYUvXgZL7toIaLqtzabRpB0T2zg01iA7hgs3GNMA7RQ=
X-Gm-Gg: AR+sD11o2h0Ibw36pgCdlWQaVV99X84745GP25VqgsYHTwmJzZ7aq/zYdsJ5z9u8RWe
	Nn8ZPoK4XDWEz1jpnlzvlJVeujH7TkDECr/W/l8gTGA11bPZKTFsNSXvaM8u8v0irolccX0Oe3B
	1Jv8htBG5r78stAD3XpSBVAqDo/wz5Dq8BjvN617eaP6p4UAqW2/KgXVuHUX1lT+MckQ1fdIpL+
	lC5QiQzIAKWo4MOgzIOhDyrPgDaduERCmA6F6nURr2o3gmDpKyueDWKvo/A1M+yFvx9Z4eSP4X1
	NlJcWOSgmfVybZ6s/q+BVR6fBvz4bDnmzqSZBTDj5O1mQNEoFL9K4FOCRPaBkS/Jk+fCTBJnLRv
	yHDbvcJ4wwTIaf3gPfz9bn9HNZXmFaI2Y
X-Received: by 2002:a05:622a:1b0a:b0:50b:29da:ec58 with SMTP id d75a77b69052e-52b2ace9defmr22523021cf.8.1785339782071;
        Wed, 29 Jul 2026 08:43:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1b0a:b0:50b:29da:ec58 with SMTP id d75a77b69052e-52b2ace9defmr22522591cf.8.1785339781398;
        Wed, 29 Jul 2026 08:43:01 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2efcb4esm20749871cf.26.2026.07.29.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:43:00 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Wed, 29 Jul 2026 08:42:36 -0700
Subject: [PATCH 2/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-2-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785339776; l=8670;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=7cvQsYeqEFMM+UAsbwFJcMnfJCxjYWpqtJqI15UtuZI=;
 b=66ZpK92XZwGdWJWqPdNZf13epsZVnPwAQswYMYzFclXOndOytp9/V03ZCWZCD8qHvZSGgphiD
 PS455rS74TcAKIvuEL+Vx4ke2A0b1gc4dn6GLgm/ZiJICqBqR3+n/+e
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

Instead of passing an explicit mask to alert/limit functions like
ina226_alert_read(), introduce an enum ina2xx_alert_type that can be
converted to a mask internally. This allows distinguishing current from
shunt voltage, which are both based on the same function in the
hardware.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 90 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 911bf32e8f215..beb851d87f787 100644
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

