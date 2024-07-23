Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8212E1DB
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695934; cv=none; b=B+jfGUCWqkf3I0CUnXovdgWJzT7pt6+cuzMxLya2/1aDJqT3lKqyjUgNe+aw3lD0zd6Nit9qR5+s8N44C/Qp+mw7XR549qDUffieKnwpNpQdB8Q7CCJyjuINb+eFKexWWW72wDIB1RLkBjUNfX58NjpYM2gVuqub1BxxH9TkFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695934; c=relaxed/simple;
	bh=OtHozKEMCclI4OMD7Aj0ng8H5SH48LA4zDdUM1zmvmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XN4/MDvatLfoP+Baaeb8q75dXht/Qfbe4L6E6Gbc7OOvBGlPvbjqN44Zd6BlFmR7R5K7CQV5/QLIM7CxswfOjcmT0mJgIs4wp7HT0tv7N8uoZxGOnWk8dV9pqo3z3iOEnt6eEq0uYUEvCXD68IG+rvQCsWFx0Sn38NIqGAXT99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILo5yZA6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILo5yZA6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d150e8153so1457443b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 17:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721695932; x=1722300732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6FbNFg7iRyxt1CLYcV0xNCTSJVjupxhzhwwshD/KRA=;
        b=ILo5yZA60BJICAAZeBGDDF4b0mljEJTST/r+P8iIjF8Xss2IXiSUDgdJ3uIBqpwIsQ
         pZCL3a1C8qHhFVM6bpaNQKR7ieaMZs1XG25V4r78BEBFDAwUFTYtUORTt/K9L54e8aEW
         gd06P3JYSrlFc6RxLzIIcalvLjq1PrnbMasXjZdrH4IEE/fcF3Dx7vOYqe041J1ICvOz
         U7/SgNlHtdDQcEMMn6CPmuWWaR9imCPGBGx3+fZLClrH9o8qVnfjvFunLuFCo/p17mW4
         cx/CMmCdZtBeMMLCgnvUgi5lY+AHBsPeIf13LWjfhSnrILeugWJSaBF0Byfe3AlWtAEA
         4bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695932; x=1722300732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6FbNFg7iRyxt1CLYcV0xNCTSJVjupxhzhwwshD/KRA=;
        b=PHl/kfWWNCekg9t6U4Yfhw0EebcjQ9C/UGq10TdcTf7s26ign9drcwDA8cDfgIKQZ5
         k3MZaMwQC0ZYarHW2AjdADzYxdW9uVDdqzRnMnoM7M4+zXpxm+IvfsDRPYSk9U/Tqt2I
         Ec9nr5ZKT8SBxuMTTC/OLTw7vk5wAtcXFBUMp7F5TL6Eo8zHDdXrTM14UA4GGWog3Xeg
         FsFWQ6rqrAEAMi4R1TQPhZHr0slOkkHo3vKWfDfbgKCybR6VEN1Ak3ZiTnA/TysmuuHr
         y+1mxr//IX/f9WH8ke9gSv8FBFFOdT5jtXfsfFI1byAq9jQCcBNW5H8bnZqYDd/U3AYe
         E9dA==
X-Gm-Message-State: AOJu0YwEa4Mu/wEt/uVaFZoK30hGuZXlvBL1gVUhUaQj3jWlMVTlSIkW
	psEObbxH+wAVa3PfIUikVqPwBA2l5afzYltDq1FalIXnX9yXXy/ppoB+MA==
X-Google-Smtp-Source: AGHT+IHWomAke+Bsj0aWisyrrjh3ou9KISIfeaHMfPwtItEe/C+7Rc170qFynAmQbwYyvN9yzcd6Uw==
X-Received: by 2002:a05:6a00:3e1c:b0:70d:2208:c98e with SMTP id d2e1a72fcca58-70e80602780mr989443b3a.0.1721695931856;
        Mon, 22 Jul 2024 17:52:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1e4ac7a4sm3007836b3a.136.2024.07.22.17.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:52:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (max6697) Drop platform data support
Date: Mon, 22 Jul 2024 17:52:00 -0700
Message-Id: <20240723005204.1356501-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240723005204.1356501-1-linux@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Platform data is not used anywhere in the upstram kernel. Drop support
for it to simplify code maintenance.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c               | 169 ++++++++++++--------------
 include/linux/platform_data/max6697.h |  33 -----
 2 files changed, 76 insertions(+), 126 deletions(-)
 delete mode 100644 include/linux/platform_data/max6697.h

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 6745d311dcf2..1ad4bf31cd24 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -17,8 +17,6 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-#include <linux/platform_data/max6697.h>
-
 enum chips { max6581, max6602, max6622, max6636, max6689, max6693, max6694,
 	     max6697, max6698, max6699 };
 
@@ -558,54 +556,92 @@ static const struct attribute_group max6697_group = {
 };
 __ATTRIBUTE_GROUPS(max6697);
 
-static void max6697_get_config_of(struct device_node *node,
-				  struct max6697_platform_data *pdata)
+static int max6697_config_of(struct max6697_data *data, struct i2c_client *client)
 {
-	int len;
-	const __be32 *prop;
+	const struct max6697_chip_data *chip = data->chip;
+	struct device_node *node = client->dev.of_node;
+	int ret, confreg;
+	int factor = 0;
+	u32 vals[2];
 
-	pdata->smbus_timeout_disable =
-		of_property_read_bool(node, "smbus-timeout-disable");
-	pdata->extended_range_enable =
-		of_property_read_bool(node, "extended-range-enable");
-	pdata->beta_compensation =
-		of_property_read_bool(node, "beta-compensation-enable");
+	confreg = 0;
+	if (of_property_read_bool(node, "smbus-timeout-disable") &&
+	    (data->chip->valid_conf & MAX6697_CONF_TIMEOUT)) {
+		confreg |= MAX6697_CONF_TIMEOUT;
+	}
+	if (of_property_read_bool(node, "extended-range-enable") &&
+	    (chip->valid_conf & MAX6581_CONF_EXTENDED)) {
+		confreg |= MAX6581_CONF_EXTENDED;
+		data->temp_offset = 64;
+	}
+	if (of_property_read_bool(node, "beta-compensation-enable") &&
+	    (chip->valid_conf & MAX6693_CONF_BETA)) {
+		confreg |= MAX6693_CONF_BETA;
+	}
 
-	prop = of_get_property(node, "alert-mask", &len);
-	if (prop && len == sizeof(u32))
-		pdata->alert_mask = be32_to_cpu(prop[0]);
-	prop = of_get_property(node, "over-temperature-mask", &len);
-	if (prop && len == sizeof(u32))
-		pdata->over_temperature_mask = be32_to_cpu(prop[0]);
-	prop = of_get_property(node, "resistance-cancellation", &len);
-	if (prop) {
-		if (len == sizeof(u32))
-			pdata->resistance_cancellation = be32_to_cpu(prop[0]);
-		else
-			pdata->resistance_cancellation = 0xfe;
-	}
-	prop = of_get_property(node, "transistor-ideality", &len);
-	if (prop && len == 2 * sizeof(u32)) {
-			pdata->ideality_mask = be32_to_cpu(prop[0]);
-			pdata->ideality_value = be32_to_cpu(prop[1]);
+	if (of_property_read_u32(node, "alert-mask", vals))
+		vals[0] = 0;
+	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_ALERT_MASK,
+					MAX6697_ALERT_MAP_BITS(vals[0]));
+	if (ret)
+		return ret;
+
+	if (of_property_read_u32(node, "over-temperature-mask", vals))
+		vals[0] = 0;
+	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_OVERT_MASK,
+					MAX6697_OVERT_MAP_BITS(vals[0]));
+	if (ret)
+		return ret;
+
+	if (data->type == max6581) {
+		if (of_property_read_bool(node, "resistance-cancellation") &&
+		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
+			confreg |= MAX6697_CONF_RESISTANCE;
+			factor = 1;
+		}
+	} else {
+		if (of_property_read_u32(node, "resistance-cancellation", &vals[0]))
+			vals[0] = 0xfe;
+
+		factor = hweight8(vals[0] & 0xfe);
+		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
+						vals[0] >> 1);
+		if (ret < 0)
+			return ret;
+
+		if (of_property_read_u32_array(node, "transistor-ideality", vals, 2)) {
+			vals[0] = 0;
+			vals[1] = 0;
+		}
+
+		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_IDEALITY,
+						vals[1]);
+		if (ret < 0)
+			return ret;
+		ret = i2c_smbus_write_byte_data(client,
+						MAX6581_REG_IDEALITY_SELECT,
+						vals[0] >> 1);
+		if (ret < 0)
+			return ret;
 	}
+	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_CONFIG, confreg);
+	if (ret < 0)
+		return ret;
+	return factor;
 }
 
 static int max6697_init_chip(struct max6697_data *data,
 			     struct i2c_client *client)
 {
-	struct max6697_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct max6697_platform_data p;
 	const struct max6697_chip_data *chip = data->chip;
 	int factor = chip->channels;
 	int ret, reg;
 
 	/*
-	 * Don't touch configuration if neither platform data nor OF
-	 * configuration was specified. If that is the case, use the
-	 * current chip configuration.
+	 * Don't touch configuration if there is no devicetree configuration.
+	 * If that is the case, use the current chip configuration.
 	 */
-	if (!pdata && !client->dev.of_node) {
+	if (!client->dev.of_node) {
 		reg = i2c_smbus_read_byte_data(client, MAX6697_REG_CONFIG);
 		if (reg < 0)
 			return reg;
@@ -621,67 +657,14 @@ static int max6697_init_chip(struct max6697_data *data,
 			if (reg & MAX6697_CONF_RESISTANCE)
 				factor++;
 		}
-		goto done;
-	}
-
-	if (client->dev.of_node) {
-		memset(&p, 0, sizeof(p));
-		max6697_get_config_of(client->dev.of_node, &p);
-		pdata = &p;
-	}
-
-	reg = 0;
-	if (pdata->smbus_timeout_disable &&
-	    (chip->valid_conf & MAX6697_CONF_TIMEOUT)) {
-		reg |= MAX6697_CONF_TIMEOUT;
-	}
-	if (pdata->extended_range_enable &&
-	    (chip->valid_conf & MAX6581_CONF_EXTENDED)) {
-		reg |= MAX6581_CONF_EXTENDED;
-		data->temp_offset = 64;
-	}
-	if (pdata->resistance_cancellation &&
-	    (chip->valid_conf & MAX6697_CONF_RESISTANCE)) {
-		reg |= MAX6697_CONF_RESISTANCE;
-		factor++;
-	}
-	if (pdata->beta_compensation &&
-	    (chip->valid_conf & MAX6693_CONF_BETA)) {
-		reg |= MAX6693_CONF_BETA;
-	}
-
-	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_CONFIG, reg);
-	if (ret < 0)
-		return ret;
-
-	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_ALERT_MASK,
-				MAX6697_ALERT_MAP_BITS(pdata->alert_mask));
-	if (ret < 0)
-		return ret;
-
-	ret = i2c_smbus_write_byte_data(client, MAX6697_REG_OVERT_MASK,
-			MAX6697_OVERT_MAP_BITS(pdata->over_temperature_mask));
-	if (ret < 0)
-		return ret;
-
-	if (data->type == max6581) {
-		factor += hweight8(pdata->resistance_cancellation >> 1);
-		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
-					pdata->resistance_cancellation >> 1);
-		if (ret < 0)
-			return ret;
-		ret = i2c_smbus_write_byte_data(client, MAX6581_REG_IDEALITY,
-						pdata->ideality_value);
-		if (ret < 0)
-			return ret;
-		ret = i2c_smbus_write_byte_data(client,
-						MAX6581_REG_IDEALITY_SELECT,
-						pdata->ideality_mask >> 1);
+		data->update_interval = factor * MAX6697_CONV_TIME;
+	} else {
+		ret = max6697_config_of(data, client);
 		if (ret < 0)
 			return ret;
+		data->update_interval = (factor + ret) * MAX6697_CONV_TIME;
 	}
-done:
-	data->update_interval = factor * MAX6697_CONV_TIME;
+
 	return 0;
 }
 
diff --git a/include/linux/platform_data/max6697.h b/include/linux/platform_data/max6697.h
deleted file mode 100644
index 6fbb70005541..000000000000
--- a/include/linux/platform_data/max6697.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * max6697.h
- *     Copyright (c) 2012 Guenter Roeck <linux@roeck-us.net>
- */
-
-#ifndef MAX6697_H
-#define MAX6697_H
-
-#include <linux/types.h>
-
-/*
- * For all bit masks:
- * bit 0:    local temperature
- * bit 1..7: remote temperatures
- */
-struct max6697_platform_data {
-	bool smbus_timeout_disable;	/* set to disable SMBus timeouts */
-	bool extended_range_enable;	/* set to enable extended temp range */
-	bool beta_compensation;		/* set to enable beta compensation */
-	u8 alert_mask;			/* set bit to 1 to disable alert */
-	u8 over_temperature_mask;	/* set bit to 1 to disable */
-	u8 resistance_cancellation;	/* set bit to 0 to disable
-					 * bit mask for MAX6581,
-					 * boolean for other chips
-					 */
-	u8 ideality_mask;		/* set bit to 0 to disable */
-	u8 ideality_value;		/* transistor ideality as per
-					 * MAX6581 datasheet
-					 */
-};
-
-#endif /* MAX6697_H */
-- 
2.39.2

