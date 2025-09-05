Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD22C3248;
	Fri,  5 Sep 2025 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104941; cv=none; b=XrS+hsEc+4qmH2OWWHYbefprlCBm0ippRDJrWmtNZBXbgBWekCisTGmrg77GgH/s2Gkxh6nOwEi5WO4rOM21VqzlzEL5bsxCKbO7cNJnCb0O/I5ea66q+8AC/f81N5cudjAM/80K9WjgOU1TQDWQ8IoiIAOzfME2vtE42inMTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104941; c=relaxed/simple;
	bh=ImvE+7ww6K8CyG3nCx14Uyk86FCn3ICDRz5+oNOBjaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGiqGQtcMFEKE66fMoepn5mBLD32RQ1Vm0hfHhcPMfb1AugftcRXgHvTBIdlg2tVO9z1bBYpo8Nu8VmKiIObAzeWEZV3jPXW7CPFI4PPXr6FSkNXxi5AdtzqZuGP4b/KIIuOCfipIPvY1IK6UlAHC9s20Q0HvuLiRYffewHx9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgeZz8dn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgeZz8dn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso2755973b3a.0;
        Fri, 05 Sep 2025 13:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104939; x=1757709739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtxEZEELgd/rLOmq/CcLWsBeeHh/Nyokh8nPMtN3pQY=;
        b=lgeZz8dnhW/SdUKSPWe5h9pCRsS72eRYX6F4ro2PW6OlaRIUTFy99Q2M3X7WKM/R4P
         k/dlHQ/R6Kj3qfZLPtenGahw0VzaYMvDUzoAvRmVMSSUPJUa/cdXMC/lpS6UyfzrJ4Dz
         vQ5JldfdkwH3HSxH5jYknhIRNDDiibv7y9S3O4K7bPK0rhOXbqvfZs3lZ5YGcXjz0jfd
         CJFlTgba5IhVwiVT02HuOG1MvPR+x9UHkZKA4v0SKTBaz+7xW7k8F5k1pZsWdv9BVNO+
         qQc9MlNyzDM9L9JZSKVEYe1MjSX8K1nllcmdz3wlOk7XifcG4LOTYTCnKxlPuM3tPYQz
         f8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104939; x=1757709739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtxEZEELgd/rLOmq/CcLWsBeeHh/Nyokh8nPMtN3pQY=;
        b=gQPtEaSvRf6/qvlyrTn0xG2vhAxFgngldD+gORWUKp/TNX44My3f0mKHzSZJO+Ifxb
         LXd/lLtOO/KiFg2DbzLdk/iATE3fkOjcsfK09xfUpmOXtUUfAAMyVZnWnxhwYxRjn1Me
         ARAuMaMuH6Aq5sTHsZve2u75Ld+yMVizPWfgw0AO+7MbwvCY4ExdxFOoVBwT+fkUpMsF
         siwKVP/FiZAn77HvXb0+ajB59d2Jv6hol5LasOb5X4ooaDRE9Biwv0BWn14u3UbNDINJ
         vIMwES97pXpqmMt8opp6QL2WWEgP0t1rjmMVwMuAJ4NKwhXSMZGBjMAvu1zM+JH9z/JQ
         3U1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLpj/eCU4Tu4qKsW/JPjZeqqo3l7RH+le0e4LlBSUFJnc8RQSTNwlEfogeD6eHfG4JhX3ZedfHbYoZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGaZ+sr7Uy44Wh3Zl0tUCCVazL0GAF6aTqczWQq7X7fjht/HR
	vr6r6fDnEWKwixJQfCpO8FzIsFLUIz7OXGBIY6/AhU2vf/sHNK1LePV1VzoLoBI9
X-Gm-Gg: ASbGncuV31Pu/YsmsDXdDU6/Ei2MvbsvnyRhLUy7Xr3VGLCSTp3sr4p+7W3meK76+If
	jVsVx4eW8YrXWKrZibtI6L+jZL/oYiPi3sWBjuykCqBs25B9c+gDsUijqWcdhcXtCDIw3NCn0Sk
	aZyKaeVHpluzspu3+1e/5sDqyl8+gO/gap373HSyVpEucKTTLaRVgfiKvlt+8wDdebHmM80aHGj
	VpdHC7dsj2/mnNUTnRJqftjw+UiTgOo6miAhtF4OajJ93VaApUlwD1xLxQ/fQ9q7ivjt3qhS766
	3k0SVx48c+y7Go8CnP7g3mwRj9GU/nuGttw6UAbzISlgrJw4VQpKNxdRN9SO1g/4QM8X5KKaGK9
	dIGMxImZ2AyP55K/PhExnQVQgdGSYe83LKwJDVDqY8fhxsw==
X-Google-Smtp-Source: AGHT+IFwKReZDVfD/9m11N9IqgfBhSs+Cy3JhAfWoX2pjMbjuvPItvK8RDTBM61Q6y5sPu+9N+08cg==
X-Received: by 2002:a05:6a21:99a8:b0:24f:f79d:6696 with SMTP id adf61e73a8af0-2533e57354fmr302282637.2.1757104939411;
        Fri, 05 Sep 2025 13:42:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm12242219a12.37.2025.09.05.13.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/17] hwmon: (ina238) Use the energy64 attribute type to report the energy
Date: Fri,  5 Sep 2025 13:41:54 -0700
Message-ID: <20250905204159.2618403-13-linux@roeck-us.net>
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

Use the energy64 attribute type instead of locally defined sysfs attributes
to report the accumulated energy.

No functional change intended.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 4681325f58f0..4d5b383b2521 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -548,22 +548,19 @@ static int ina238_write_temp_max(struct device *dev, long val)
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
 
-static ssize_t energy1_input_show(struct device *dev,
-				  struct device_attribute *da, char *buf)
+static int ina238_read_energy(struct device *dev, s64 *energy)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
-	int ret;
 	u64 regval;
-	u64 energy;
+	int ret;
 
 	ret = ina238_read_reg40(data->client, SQ52206_ENERGY, &regval);
 	if (ret)
 		return ret;
 
 	/* result in uJ */
-	energy = regval * data->energy_lsb;
-
-	return sysfs_emit(buf, "%llu\n", energy);
+	*energy = regval * data->energy_lsb;
+	return 0;
 }
 
 static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
@@ -576,6 +573,8 @@ static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 		return ina238_read_curr(dev, attr, val);
 	case hwmon_power:
 		return ina238_read_power(dev, attr, val);
+	case hwmon_energy64:
+		return ina238_read_energy(dev, (s64 *)val);
 	case hwmon_temp:
 		return ina238_read_temp(dev, attr, val);
 	default:
@@ -620,6 +619,7 @@ static umode_t ina238_is_visible(const void *drvdata,
 {
 	const struct ina238_data *data = drvdata;
 	bool has_power_highest = data->config->has_power_highest;
+	bool has_energy = data->config->has_energy;
 
 	switch (type) {
 	case hwmon_in:
@@ -660,6 +660,11 @@ static umode_t ina238_is_visible(const void *drvdata,
 		default:
 			return 0;
 		}
+	case hwmon_energy64:
+		/* hwmon_energy_input */
+		if (has_energy)
+			return 0444;
+		return 0;
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp_input:
@@ -693,6 +698,8 @@ static const struct hwmon_channel_info * const ina238_info[] = {
 			   /* 0: power */
 			   HWMON_P_INPUT | HWMON_P_MAX |
 			   HWMON_P_MAX_ALARM | HWMON_P_INPUT_HIGHEST),
+	HWMON_CHANNEL_INFO(energy64,
+			   HWMON_E_INPUT),
 	HWMON_CHANNEL_INFO(temp,
 			   /* 0: die temperature */
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_ALARM),
@@ -710,15 +717,6 @@ static const struct hwmon_chip_info ina238_chip_info = {
 	.info = ina238_info,
 };
 
-/* energy attributes are 5 bytes wide so we need u64 */
-static DEVICE_ATTR_RO(energy1_input);
-
-static struct attribute *ina238_attrs[] = {
-	&dev_attr_energy1_input.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(ina238);
-
 static int ina238_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -818,9 +816,7 @@ static int ina238_probe(struct i2c_client *client)
 	data->energy_lsb = data->power_lsb * 16;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
-							 &ina238_chip_info,
-							 data->config->has_energy ?
-								ina238_groups : NULL);
+							 &ina238_chip_info, NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-- 
2.45.2

