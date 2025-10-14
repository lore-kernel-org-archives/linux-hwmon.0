Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2A2FFF8B
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455543; cv=none; b=MWuLIiCMMfE7aeWF7kbMQTQQtdsuPsD4yjCQbPeHeTauw+IMtbi36rIsBndoT5t4kD3Og7BYwbp5YWvAZ4gAaPkvP8lbVjnuiJZZT6HOIMMnd934YFvM1zet+MCPNop4m/D+zN/kDsXI1RfdVbHtd3G/WsIUBwIoeaA/8yE0Fbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455543; c=relaxed/simple;
	bh=VSumxBHK+ieSyKHM6zdSYk+dK+kjBWszE6gpUBpyvh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdqlbLX39CaokEnQnJ4IlEYRaJMQ3EZwdWYGmmvxJLk1OMFA/PeYmnrYS2nVRK24pQdSUdZ3dVNdxZzZ6XFPypWgNbBZjv/Qy4Rq/oCsn6K02vLbbz9l1Sk88GxL9SQqRR/pgEi9v3nHuYJpHSHANmTLE0/NSdM8eMubZX5dins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL7kXDDE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL7kXDDE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso4838160a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455541; x=1761060341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoJmOUcB/Eic6HWEBr7lLzh6KpqhvilJH9hEruSvd8s=;
        b=HL7kXDDEso/z5dP2XuuDdtdbGfjEZMaI7Ar9NRVzuD66Qauaoa5fn4I6I7SjVkpKoH
         2r1eKUtsXBgyFiR/4KhFioN+nJBOImxS8f7vfejp+AhgWqpWdn0f6HutYIswSlbMled4
         /nhwo4zYfCcCksFqdsfraKZ41nqlSCpJAu9LOUC3+Edmd4K6WEs459iR2snjkVj/PXuV
         NnCF8osZPxgmE+x1VY4HKDGbpEc/ImPld3KzQvan8p/q9fUyncDHddIdAXHwB2gOihVm
         rzAcf7uklUyzQXySx4InSX8H9ptNc/1dR2Ic0xPpsR/AANRlMFsMp8gQjmsxpodWZlK8
         Bw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455541; x=1761060341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XoJmOUcB/Eic6HWEBr7lLzh6KpqhvilJH9hEruSvd8s=;
        b=sJM66ahHV9BVSkVAhKGRt2JV3A/TYD6HHpPGLVvY6+uw9myA4K5ZBZQF7507WrptKR
         qz93WUJ8QttGTmI/knKG9ayBuM+nYBOzW7aeahSMFi+yURGyIcAnZDgbQSzKOtCb83ta
         FgT5W6xa9RsyAqSCyJd8JdF4MoQ/gN2yMBo9t+clIUownyAATda5XhoY2XPgYRKxQDJr
         mOOiJhNL8HDRxoc8igV71ApNfz18r+mhdkPNHo9ZWu7j0RoHM9hcYFsYT8XCD6aKbRGY
         f+sVq3X4b+DS5omy/T60gr25ZZGixHLlqd+eodjS/eDcF9mQaEusqXRXr1lRXWjH/PRE
         iwYQ==
X-Gm-Message-State: AOJu0YwEYy/lYnHoPH3ghyvo5GSiu9E+loMf8z/MSFp8qhsiok8XnwG8
	GxCeNxolB1G5txOsA3EP9Ic0IJ5Xz8gkB4gpG8m3hjQ7vgWLszQwbi+VkwuY7g==
X-Gm-Gg: ASbGncspWv4BJAg9GCLOyKaI9iN0oZd7+Molm0uG3BwzIscc31kJ8M3AkxkF5ZII0/Z
	dEgtgfm8PcHt9NWz+QR76Pp3ERzf2cTzfGvq9mQY2IzgowHuxGUmTFHkgpqowkoce7FDqZTPaIA
	3/+YNCWLhwGC35ljqN7vu4tCo/bTon2NYfvHXZTYyQqzF94VeazILf4y+0cSMTT+/OPxQJ1ECOU
	YSg6Rg19wVIlOTmgB+hM26FB+za7HG7BeaQXV/IeT6DK6bwGSJMClIc2pUljjWistBNSKsjjC1D
	V2kWZeTb596rgBGfsrYWEhxWsMOzrlhb50+EaHHZ35HpSdow63UFzyM0pn9od+/Qrb89gxFPKXo
	EHgSxHGxyfKKQzKCHzkBmp8MY8c+JHucZgaIgP8gkJD92PaFFjfqIx5KXC9LjNaQk
X-Google-Smtp-Source: AGHT+IErz+/o8uJThifY8leRgGcBynQrqDrIfQzKW31AMuB8j0LkNcYFkjWZi/4lsYaR61g/BxDRow==
X-Received: by 2002:a17:903:1250:b0:272:2bf1:6a21 with SMTP id d9443c01a7336-290273749c5mr294823915ad.14.1760455541034;
        Tue, 14 Oct 2025 08:25:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3ab2fsm167461015ad.105.2025.10.14.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/20] hwmon: (max31827) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:11 -0700
Message-ID: <20251014152515.785203-17-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max31827.c | 60 ++++++++++------------------------------
 1 file changed, 14 insertions(+), 46 deletions(-)

diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
index a31c7b655da1..9b2e56c040df 100644
--- a/drivers/hwmon/max31827.c
+++ b/drivers/hwmon/max31827.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
-#include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -99,7 +98,6 @@ struct max31827_state {
 	/*
 	 * Prevent simultaneous access to the i2c client.
 	 */
-	struct mutex lock;
 	struct regmap *regmap;
 	bool enable;
 	unsigned int resolution;
@@ -123,30 +121,23 @@ static int shutdown_write(struct max31827_state *st, unsigned int reg,
 	 * Before the Temperature Threshold Alarm, Alarm Hysteresis Threshold
 	 * and Resolution bits from Configuration register are changed over I2C,
 	 * the part must be in shutdown mode.
-	 *
-	 * Mutex is used to ensure, that some other process doesn't change the
-	 * configuration register.
 	 */
-	mutex_lock(&st->lock);
-
 	if (!st->enable) {
 		if (!mask)
-			ret = regmap_write(st->regmap, reg, val);
-		else
-			ret = regmap_update_bits(st->regmap, reg, mask, val);
-		goto unlock;
+			return regmap_write(st->regmap, reg, val);
+		return regmap_update_bits(st->regmap, reg, mask, val);
 	}
 
 	ret = regmap_read(st->regmap, MAX31827_CONFIGURATION_REG, &cfg);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	cnv_rate = MAX31827_CONFIGURATION_CNV_RATE_MASK & cfg;
 	cfg = cfg & ~(MAX31827_CONFIGURATION_1SHOT_MASK |
 		      MAX31827_CONFIGURATION_CNV_RATE_MASK);
 	ret = regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, cfg);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (!mask)
 		ret = regmap_write(st->regmap, reg, val);
@@ -154,15 +145,11 @@ static int shutdown_write(struct max31827_state *st, unsigned int reg,
 		ret = regmap_update_bits(st->regmap, reg, mask, val);
 
 	if (ret)
-		goto unlock;
+		return ret;
 
-	ret = regmap_update_bits(st->regmap, MAX31827_CONFIGURATION_REG,
-				 MAX31827_CONFIGURATION_CNV_RATE_MASK,
-				 cnv_rate);
-
-unlock:
-	mutex_unlock(&st->lock);
-	return ret;
+	return regmap_update_bits(st->regmap, MAX31827_CONFIGURATION_REG,
+				  MAX31827_CONFIGURATION_CNV_RATE_MASK,
+				  cnv_rate);
 }
 
 static int write_alarm_val(struct max31827_state *st, unsigned int reg,
@@ -223,23 +210,13 @@ static int max31827_read(struct device *dev, enum hwmon_sensor_types type,
 
 			break;
 		case hwmon_temp_input:
-			mutex_lock(&st->lock);
-
 			if (!st->enable) {
-				/*
-				 * This operation requires mutex protection,
-				 * because the chip configuration should not
-				 * be changed during the conversion process.
-				 */
-
 				ret = regmap_update_bits(st->regmap,
 							 MAX31827_CONFIGURATION_REG,
 							 MAX31827_CONFIGURATION_1SHOT_MASK,
 							 1);
-				if (ret) {
-					mutex_unlock(&st->lock);
+				if (ret)
 					return ret;
-				}
 				msleep(max31827_conv_times[st->resolution]);
 			}
 
@@ -254,8 +231,6 @@ static int max31827_read(struct device *dev, enum hwmon_sensor_types type,
 
 			ret = regmap_read(st->regmap, MAX31827_T_REG, &uval);
 
-			mutex_unlock(&st->lock);
-
 			if (ret)
 				break;
 
@@ -352,7 +327,6 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
 			if (val >> 1)
 				return -EINVAL;
 
-			mutex_lock(&st->lock);
 			/**
 			 * The chip should not be enabled while a conversion is
 			 * performed. Neither should the chip be enabled when
@@ -361,15 +335,11 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
 
 			st->enable = val;
 
-			ret = regmap_update_bits(st->regmap,
-						 MAX31827_CONFIGURATION_REG,
-						 MAX31827_CONFIGURATION_1SHOT_MASK |
-						 MAX31827_CONFIGURATION_CNV_RATE_MASK,
-						 MAX31827_DEVICE_ENABLE(val));
-
-			mutex_unlock(&st->lock);
-
-			return ret;
+			return regmap_update_bits(st->regmap,
+						  MAX31827_CONFIGURATION_REG,
+						  MAX31827_CONFIGURATION_1SHOT_MASK |
+						  MAX31827_CONFIGURATION_CNV_RATE_MASK,
+						  MAX31827_DEVICE_ENABLE(val));
 
 		case hwmon_temp_max:
 			return write_alarm_val(st, MAX31827_TH_REG, val);
@@ -623,8 +593,6 @@ static int max31827_probe(struct i2c_client *client)
 	if (!st)
 		return -ENOMEM;
 
-	mutex_init(&st->lock);
-
 	st->regmap = devm_regmap_init_i2c(client, &max31827_regmap);
 	if (IS_ERR(st->regmap))
 		return dev_err_probe(dev, PTR_ERR(st->regmap),
-- 
2.45.2

