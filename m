Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFE12FCC04
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455528; cv=none; b=KjvvTlCkodlXVJnD6PPsaDwNCPiHPdT7TGYDNE/UQsOE33+Uidip3HQR5XCxBjbP894eQqeq4tuC44tNw20UL9U6a8bm2cwChbZIbXaonCpQG5p1gumcyVhECy4JHPsCUxe2N286dNeX9/j9yMo344EwkjuIAznqZD0TLFB2Xd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455528; c=relaxed/simple;
	bh=3xbM1543Ax7eAzJF0MhEcnrP7VsZs9nyA3sDp1TfDuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzOU03u6850AgsK/6T4u/EiouYvCAC2sZues/4U/IFngTTMZb9rbnGVfNehU+dcO7tRZpEHW2edMwSh1OlbBrqGqvYIRbaZqlRPRncl0VDHhGAAufiuBSgQEXFhUnJzCWW6jtB40S9FGIiRE13VvTL74UTrnHYpGduJJei4HS7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqsM76Z3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqsM76Z3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so5345682b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455526; x=1761060326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmcZJDcrK5JztV6JOMJaijsZNxT0wH8z9pmHbS0tyB0=;
        b=mqsM76Z3UzJK6wrxFv4FXRz1TjCJ5CysTxsXeKGzb6+pyksjkhLlW6UVO0kadVDsRn
         lGtudAsiTOP4mhtFAeZbtMFnKds5OvKwvH+QbSdkASEBceeBqNocOiokkSqq47fnGHsf
         sbOy3VjGeYy4PDm81VaRQdY4mTmYpmlv9hZoWmIRYKC/zCwaqJmIOaGP+xQg4ImOIm8k
         2FqxwijiYBtJgW7rP9pYdF6/nwY3OaBPGKBmts72Pyh2uxGjmlB1+rTjuB/OhROsaIC3
         J6S2pOOY/AYCe6f8IgDN6kGVBxcRBi/6PcHXSVQ4iDsbYti/nwHSKf3NSYwRfSD6zgpp
         eHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455526; x=1761060326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmcZJDcrK5JztV6JOMJaijsZNxT0wH8z9pmHbS0tyB0=;
        b=YMgG6Y6hVbyApRmB8uiAzsOSXpDZ+OyqkDce1aIiZSp9nYGzzF/zFXm28jGHS7V2O+
         n3yj+TzzDzniGtWLNSluGpdmlgw+1UGvdQgfdivNBt5pnfGOj+iNcjtKwOfbHes7pb0z
         gdX8Wj+HcPW9Sp0dbksPEMeSoKOcA+eX0P/97+13TmGJRWCBNB3pYEcp+hM6UhBtNlmO
         HQl5T4qPeRRCvFjhkR+vEJ1uLO/+qYO8yCVzfuM4SlSCgtKoAeu+ySgTrvlsjzYZLQNZ
         9iJAlv7uXmqnvIYzR2klo33n/sY4yUy5PJR8yMI1fNqL6fqN8tG49ra+gri2WCEyidOL
         zt2g==
X-Gm-Message-State: AOJu0YzR+PxxO//gwsobOxXQN1dMkZUVpKuixjgDvqQ/6DtcExGEXANy
	7pmtcDUI0qDgIgiAaCSXMRV2GhfzpSwJYBJ7nc6K7V08Bmf1YHx5Nq68RVoZjQ==
X-Gm-Gg: ASbGncsFFVqLyJ0kMNkfJ2pI7fxq0IEx++9TEdi/DdxRN4qacvfbedglFMDJm2fvVam
	LpHruJoqAfHdSluafS48Y4g5dVySbruOfNP4xQgZV4/qw/0Dc1gQMLWH4e8tXdSC77CjK+rQZd4
	s1kjurOUARHo3c/vio9X3T0XDca0OLUggP6XmEoNx95f2hugEPlQ6D0t1RkbQyX6QGpraLv7Uob
	q+4n4GMj/z0k00qh1c2sMWaBja+jKiEe+jr9h/Zh1xmOyjaaxPvdNTDSeKs0r/3tgrz+3+XcPqd
	6QGD1UOY83drGN4zF1LHi7EqV/uxtGSbmwKVFTDXDoutrxJ/A+fz6rXGt+4h0g6pDUvdi5WvRBo
	6BVqohX1uBgVRQvcOg8kWD5e90W9hYUP683m6sVQuG8w1xA4TS0KM4wsGy0p9WHqp
X-Google-Smtp-Source: AGHT+IEsH0p/MoeHF0a9L0JP+fclnDuhNm6gY9qmY3cL2Iu6P4vg7Al2EClVdLSPuiDZndw60m29tw==
X-Received: by 2002:a05:6a21:328d:b0:261:ed47:c9b5 with SMTP id adf61e73a8af0-32d96dde150mr44265982637.13.1760455525643;
        Tue, 14 Oct 2025 08:25:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddfe5e4sm12356915a12.20.2025.10.14.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/20] hwmon: (emc1403) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:24:59 -0700
Message-ID: <20251014152515.785203-5-linux@roeck-us.net>
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
 drivers/hwmon/emc1403.c | 46 +++++++++--------------------------------
 1 file changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index eca33220d34a..ccce948a4306 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -17,7 +17,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/sysfs.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 
@@ -30,7 +29,6 @@ enum emc1403_chip { emc1402, emc1403, emc1404, emc1428 };
 struct thermal_data {
 	enum emc1403_chip chip;
 	struct regmap *regmap;
-	struct mutex mutex;
 };
 
 static ssize_t power_state_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -268,8 +266,8 @@ static s8 emc1403_temp_regs_low[][4] = {
 	},
 };
 
-static int __emc1403_get_temp(struct thermal_data *data, int channel,
-			      enum emc1403_reg_map map, long *val)
+static int emc1403_get_temp(struct thermal_data *data, int channel,
+			    enum emc1403_reg_map map, long *val)
 {
 	unsigned int regvalh;
 	unsigned int regvall = 0;
@@ -295,38 +293,23 @@ static int __emc1403_get_temp(struct thermal_data *data, int channel,
 	return 0;
 }
 
-static int emc1403_get_temp(struct thermal_data *data, int channel,
-			    enum emc1403_reg_map map, long *val)
-{
-	int ret;
-
-	mutex_lock(&data->mutex);
-	ret = __emc1403_get_temp(data, channel, map, val);
-	mutex_unlock(&data->mutex);
-
-	return ret;
-}
-
 static int emc1403_get_hyst(struct thermal_data *data, int channel,
 			    enum emc1403_reg_map map, long *val)
 {
 	int hyst, ret;
 	long limit;
 
-	mutex_lock(&data->mutex);
-	ret = __emc1403_get_temp(data, channel, map, &limit);
+	ret = emc1403_get_temp(data, channel, map, &limit);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 	ret = regmap_read(data->regmap, 0x21, &hyst);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 	if (map == temp_min)
 		*val = limit + hyst * 1000;
 	else
 		*val = limit - hyst * 1000;
-unlock:
-	mutex_unlock(&data->mutex);
-	return ret;
+	return 0;
 }
 
 static int emc1403_temp_read(struct thermal_data *data, u32 attr, int channel, long *val)
@@ -451,20 +434,16 @@ static int emc1403_set_hyst(struct thermal_data *data, long val)
 	else
 		val = clamp_val(val, 0, 255000);
 
-	mutex_lock(&data->mutex);
-	ret = __emc1403_get_temp(data, 0, temp_crit, &limit);
+	ret = emc1403_get_temp(data, 0, temp_crit, &limit);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 
 	hyst = limit - val;
 	if (data->chip == emc1428)
 		hyst = clamp_val(DIV_ROUND_CLOSEST(hyst, 1000), 0, 127);
 	else
 		hyst = clamp_val(DIV_ROUND_CLOSEST(hyst, 1000), 0, 255);
-	ret = regmap_write(data->regmap, 0x21, hyst);
-unlock:
-	mutex_unlock(&data->mutex);
-	return ret;
+	return regmap_write(data->regmap, 0x21, hyst);
 }
 
 static int emc1403_set_temp(struct thermal_data *data, int channel,
@@ -478,7 +457,6 @@ static int emc1403_set_temp(struct thermal_data *data, int channel,
 	regh = emc1403_temp_regs[channel][map];
 	regl = emc1403_temp_regs_low[channel][map];
 
-	mutex_lock(&data->mutex);
 	if (regl >= 0) {
 		if (data->chip == emc1428)
 			val = clamp_val(val, -128000, 127875);
@@ -487,7 +465,7 @@ static int emc1403_set_temp(struct thermal_data *data, int channel,
 		regval = DIV_ROUND_CLOSEST(val, 125);
 		ret = regmap_write(data->regmap, regh, (regval >> 3) & 0xff);
 		if (ret < 0)
-			goto unlock;
+			return ret;
 		ret = regmap_write(data->regmap, regl, (regval & 0x07) << 5);
 	} else {
 		if (data->chip == emc1428)
@@ -497,8 +475,6 @@ static int emc1403_set_temp(struct thermal_data *data, int channel,
 		regval = DIV_ROUND_CLOSEST(val, 1000);
 		ret = regmap_write(data->regmap, regh, regval);
 	}
-unlock:
-	mutex_unlock(&data->mutex);
 	return ret;
 }
 
@@ -695,8 +671,6 @@ static int emc1403_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	mutex_init(&data->mutex);
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
 							 client->name, data,
 							 &emc1403_chip_info,
-- 
2.45.2

