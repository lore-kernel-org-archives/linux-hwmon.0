Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440EC1C689C
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772911; cv=none; b=r58Bg791MWb3RKtEvbSB6iWtWPePbDwpQ/NPmos2VZFlPJdaybbc+dJFVL4PvBV2/yNmy8fqY3R4A2FQTR10ib9NmkgNDBYJyb3Gv+b7lu52AuyJxm0q4R8MIaOL7O3YxHSssi32cmjz3/CJ0kcHuOTaT+omK9aVLkLLcZ7yZC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772911; c=relaxed/simple;
	bh=DJlFRy411dZPu0MppiGQtfo/VVk7nUL9r/MODlPdWVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBe0DxcnS/WMKmbmTY8OT6timNOeUUh2bXRWtAc+vyw4hGNRxND4skP6PRJhr9+LZjS481kzCVH3F6LlfLXnYDcu9nH3vrF5tTkHxmh978DSNe69h6/+fSi+/fsdPYF1s7U0ABekrkyfPX1rcYXQZr47KcbpWuHHoRTIrgHYX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq2sWUPV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq2sWUPV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71456acebe8so2572688b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772909; x=1725377709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWlitGwRDhrBz7IK8sJ6XvrCc8HjGSB5nyxzSojWn2w=;
        b=Sq2sWUPV9DWdMMfZ316+LBCxHy8jSg/IOkq+TTmXQYT9+sfBRqu90bVUnm9kuyEcHQ
         jhEYvd/S+Qrdr4ar4ngbXO2J0g7j/6TZOy57Bz7I0FxUt356ZmxViY4A6AJLqaRua2Jg
         mLaFzcR2Cj9qwahv/zRremceBjn4Bb7+DcnAcFg6pv6NQwphtUTHfY6ZULTL3sGxOuuX
         l/z5JaG5kiruDeww5vuArs6rSdFaKeo2Q+r9yHx3KV8/j/mdx3cvyLKT7u76zfJ56FkG
         btIvwXVB30PnPak8pVQ5r9mCKkpkmPN2tx+b1X0zrz4RrutkfOSnjOgBXgiSe0suDYT0
         FmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772909; x=1725377709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sWlitGwRDhrBz7IK8sJ6XvrCc8HjGSB5nyxzSojWn2w=;
        b=qLv3ItRoM32GN0FsUGiaIUJpIbyQ3A6YVEuuOdEqAD0eKtIdd/CB9DWII91CSDvEAP
         LHG5Q9rluhJtqACjEej6zc577z+x1I/i3pJq7tSNHbelWJoShWhNAYmCeLZci8FMcl3S
         aQG8GurJihIRqg/5oYn37ah8V1QixrVxG8mgXyjd2+Zm9VxYgktD7P/HNRd/Q5W3RkmT
         SUdVABUTcnMkWM4kOiS+tJgZw4q1yAxc0Ow2PdpX4V4yE9tow5cviiamHKPqM7xwMWPT
         ty/0slE398Hge5+QuBAYXUrevr1FI6GVfa2rgGQw9f5jZyDlO+ECbdk0cLpDBAoEiI8F
         p1sw==
X-Gm-Message-State: AOJu0Yy1nBWlrkMk2fv3Rf+89cmB9uAZm1uhMEyYFsI92hfKAawshT8L
	Nll/4heDyo2hQeMyfiPB4mVNgVF7DOPR/9bRyJL4pEr+I/kg129+wPscDg==
X-Google-Smtp-Source: AGHT+IGYRx5k75MlmIv0xVokQgItCpVeBrU+17od+LewRLdf6jB6G8z5voE0aGibejaJhPVJMqlaEg==
X-Received: by 2002:a05:6a00:1301:b0:710:4d55:4d39 with SMTP id d2e1a72fcca58-7144575e329mr16549162b3a.4.1724772909031;
        Tue, 27 Aug 2024 08:35:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434336fb3sm8649061b3a.201.2024.08.27.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/11] hwmon: (ina2xx) Re-initialize chip using regmap functions
Date: Tue, 27 Aug 2024 08:34:50 -0700
Message-ID: <20240827153455.1344529-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If it is necessary to re-initialize the chip, for example because
it has been power cycled, use regmap functions to update register
contents. This ensures that all registers, including the configuration
register and alert registers, are updated to previously configured
values without having to locally cache everything.

For this to work, volatile registers have to be marked as volatile.
Also, the cache needs to be bypassed when reading the calibration
and mask_enable registers. While the calibration register is not
volatile, it will be reset to 0 if the chip has been power cycled.
Most of the bits in the mask_enable register are configuration bits,
except for bit 4 which reports if an alert has ben observed.
Both registers need to be marked as non-volatile to be updated
after a power cycle, but it is necessary to bypass the cache when
reading them to detect if the chip has been power cycled and to
read the alert status.

Another necessary change is to declare ina226_alert_to_reg() as u16.
So far it returned an s16 which is sign extended to a large negative
value which is then sent to regmap as unsigned int, causing an -EINVAL
error return.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 48 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index ed8764a29d3f..f7d78588e579 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -91,10 +91,39 @@
  */
 #define INA226_TOTAL_CONV_TIME_DEFAULT	2200
 
+static bool ina2xx_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case INA2XX_CONFIG:
+	case INA2XX_CALIBRATION:
+	case INA226_MASK_ENABLE:
+	case INA226_ALERT_LIMIT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool ina2xx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case INA2XX_SHUNT_VOLTAGE:
+	case INA2XX_BUS_VOLTAGE:
+	case INA2XX_POWER:
+	case INA2XX_CURRENT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config ina2xx_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
 	.max_register = INA2XX_MAX_REGISTERS,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = ina2xx_volatile_reg,
+	.writeable_reg = ina2xx_writeable_reg,
 };
 
 enum ina2xx_ids { ina219, ina226 };
@@ -229,16 +258,16 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 		if (*regval == 0) {
 			unsigned int cal;
 
-			ret = regmap_read(regmap, INA2XX_CALIBRATION, &cal);
+			ret = regmap_read_bypassed(regmap, INA2XX_CALIBRATION, &cal);
 			if (ret < 0)
 				return ret;
 
 			if (cal == 0) {
 				dev_warn(dev, "chip not calibrated, reinitializing\n");
 
-				ret = ina2xx_init(data);
-				if (ret < 0)
-					return ret;
+				regcache_mark_dirty(regmap);
+				regcache_sync(regmap);
+
 				/*
 				 * Let's make sure the power and current
 				 * registers have been updated before trying
@@ -340,7 +369,7 @@ static int ina226_reg_to_alert(struct ina2xx_data *data, u32 mask, u16 regval)
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static s16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, int val)
+static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, int val)
 {
 	switch (mask) {
 	case INA226_SHUNT_OVER_VOLTAGE_MASK:
@@ -439,16 +468,17 @@ static ssize_t ina226_alarm_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ina2xx_data *data = dev_get_drvdata(dev);
-	int regval;
+	unsigned int mask;
 	int alarm = 0;
 	int ret;
 
-	ret = regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
+	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &mask);
 	if (ret)
 		return ret;
 
-	alarm = (regval & attr->index) &&
-		(regval & INA226_ALERT_FUNCTION_FLAG);
+	alarm = (mask & attr->index) &&
+		(mask & INA226_ALERT_FUNCTION_FLAG);
+
 	return sysfs_emit(buf, "%d\n", alarm);
 }
 
-- 
2.45.2

