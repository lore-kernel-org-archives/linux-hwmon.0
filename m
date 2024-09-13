Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D801373
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2024 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187513; cv=none; b=HysYH3IQqrkOBQaSoMM//YDFSx1XSqtcrbilVbHwyNrHDS6NRyPc7mBT5Le1UgRzIlDhQHRe6seLpXDUFKwbravfXRjvx8Th9GCO/fkaSJbYjJD6no73WqskGzoITrk2fEXIX5xfs3CSX5Q9mjtE3YNZtP2ZEf10p+NRS+O61Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187513; c=relaxed/simple;
	bh=lQ4WyVCIu68cV3yrHHbERgq6chd+7wt7JTF0YDBpX8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjkWF2iwhM+dHmB8RFt4JtxDYlhzaYTanki4RXrQE1mme1tcorE2vCM52mVCAoEKIPrF7RTtzhws6DDsI20zfFrSX/58imzXsm5BI9HryOMWPBtECFtFu0x8kp7Md4Lrn8t4o3PYWVoPKn2R9DEg/hzO3aOfn1g4TGUN/gbKsZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXLz0NKz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXLz0NKz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206f9b872b2so16562955ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726187510; x=1726792310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KoiI26Rjhzc4PaMqAcuqAix/udLu8WaNbe74p4QUA4A=;
        b=mXLz0NKzJ63tRQIl9A1Kg87YKa8as8R06+DjlYAcbc18qsoHrtk5LTCwYlJM8zt6V5
         hinQQqyvhcWnSECipV3BHfuuWdngeyJK2L0yJ/5cU73eEFGmwb2aXEwbOM+v4TYtipbI
         RflFrblKdxRkbBXyBWE/UWvE8ocbB5itn9jcoJK7ZviP8qwEbJH1nisVIxrSQqg4pSEB
         wdV0L3Zok9pANUu8pgGytzc84LBs3tPpOrzpoOzUzzW+toCbiMB2IrUbypUix/uJBMg2
         puCKG//7Jkv77RIy5Xs7sAs6W8JoU8DbBCg+qMhONG9fD9K5XLVAIsW6n5pYnkMS2iJW
         zIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726187510; x=1726792310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoiI26Rjhzc4PaMqAcuqAix/udLu8WaNbe74p4QUA4A=;
        b=WxmOQrYmH4WtGVjttblJ1KVMO6HM//Fn6oZsnQFsVNx4aMGRTcFnWCMUrGDPFwftUS
         wcTkTlOON00sQ/8nQNQ5NxCRxuU2kiCfayWvlzZOt7uRuhEQWWQMz7Ja8CY0vrEByVt9
         ds6qXBRhVoK6t6L2Wahr2J+muBQzwXJFN228Mx8SBhCBPKVyLri90y/skmikObKcyEhX
         PClNZ7OIs1yr83YCz34FyemBwLHQfRYjhJFq5Pbk2DnL8NbTnGJA7uJwLjU5BzlQG2GQ
         mgtii1n0gdSmcy84LGsHJVRVm+uqGnSThfJ+zv+Ss5eLW+xkQwpExRPhNZqjzbEbbFUb
         WGkg==
X-Gm-Message-State: AOJu0YxoJwHmTG+3mZCUYnczn3F/cFSFzLvo8LCiMOgc5R2MZnZ2MfCk
	OMInSarpZeLZE7l8I08U/ug9W/iKRhfYE/Eq5DNx6/1xbgHi5bZiUizgKA==
X-Google-Smtp-Source: AGHT+IEzgsRh7UJCuA5DZskHSVzIC0F7tUAaqB/ZjIxLsd47EOvqoRPNa2Py3mccakWzMQaXuIbGSA==
X-Received: by 2002:a17:902:d2cf:b0:202:4a35:a803 with SMTP id d9443c01a7336-2076e3f1f14mr65823655ad.31.1726187509998;
        Thu, 12 Sep 2024 17:31:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af25683sm19361505ad.17.2024.09.12.17.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 17:31:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (ina2xx) Add support for has_alerts configuration flag
Date: Thu, 12 Sep 2024 17:31:44 -0700
Message-ID: <20240913003145.1931634-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add configuration flag indicating if the chip supports alerts and limits
to prepare for adding INA260 support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index f0fa6d073627..03a011c9b73d 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -129,6 +129,7 @@ enum ina2xx_ids { ina219, ina226 };
 
 struct ina2xx_config {
 	u16 config_default;
+	bool has_alerts;	/* chip supports alerts and limits */
 	int calibration_value;
 	int shunt_div;
 	int bus_voltage_shift;
@@ -155,6 +156,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.bus_voltage_shift = 3,
 		.bus_voltage_lsb = 4000,
 		.power_lsb_factor = 20,
+		.has_alerts = false,
 	},
 	[ina226] = {
 		.config_default = INA226_CONFIG_DEFAULT,
@@ -163,6 +165,7 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.bus_voltage_shift = 0,
 		.bus_voltage_lsb = 1250,
 		.power_lsb_factor = 25,
+		.has_alerts = true,
 	},
 };
 
@@ -624,6 +627,7 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 				 u32 attr, int channel)
 {
 	const struct ina2xx_data *data = _data;
+	bool has_alerts = data->config->has_alerts;
 	enum ina2xx_ids chip = data->chip;
 
 	switch (type) {
@@ -633,12 +637,12 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 			return 0444;
 		case hwmon_in_lcrit:
 		case hwmon_in_crit:
-			if (chip == ina226)
+			if (has_alerts)
 				return 0644;
 			break;
 		case hwmon_in_lcrit_alarm:
 		case hwmon_in_crit_alarm:
-			if (chip == ina226)
+			if (has_alerts)
 				return 0444;
 			break;
 		default:
@@ -651,12 +655,12 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 			return 0444;
 		case hwmon_curr_lcrit:
 		case hwmon_curr_crit:
-			if (chip == ina226)
+			if (has_alerts)
 				return 0644;
 			break;
 		case hwmon_curr_lcrit_alarm:
 		case hwmon_curr_crit_alarm:
-			if (chip == ina226)
+			if (has_alerts)
 				return 0444;
 			break;
 		default:
@@ -668,11 +672,11 @@ static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type
 		case hwmon_power_input:
 			return 0444;
 		case hwmon_power_crit:
-			if (chip == ina226)
+			if (has_alerts)
 				return 0644;
 			break;
 		case hwmon_power_crit_alarm:
-			if (chip == ina226)
+			if (has_alerts)
 				return 0444;
 			break;
 		default:
@@ -802,7 +806,7 @@ static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
 	if (ret < 0)
 		return ret;
 
-	if (data->chip == ina226) {
+	if (data->config->has_alerts) {
 		bool active_high = device_property_read_bool(dev, "ti,alert-polarity-active-high");
 
 		regmap_update_bits(regmap, INA226_MASK_ENABLE,
-- 
2.45.2

