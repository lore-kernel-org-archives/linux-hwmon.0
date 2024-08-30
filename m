Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259077F6
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979971; cv=none; b=DcFgF0FiDCGeCXHniACNbOOfaJJspnO8zV1gPWZEng7r2OxHzMb/buDnvFnuEpS9zG8d9ypP1Pqr4hA9kmuxqiVHdx2H3t3v16R+Zhc276PhQ2OyENrTq/5xc2QVhTDInpyjWl67sMSCbEU5kDW7NlSDFCWCTRG/EWni4ae3TwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979971; c=relaxed/simple;
	bh=4XaTQA/O6mfp/UP+Uoxw4busu4xxc6rm7Ug8JTHI6G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSa4tkVW0nWsqExuS5NNSwrECbvFmSv3oetXscbQALooHku4h97pnuM1QYGZFaJllF1GP5SxyxE1fA80yl/yjaRYeP91wrbpV+e0yZ8cGw8IYkm0OkpJnwBdpnA6K8xj+AaBtyC6QsW7gJ44r1BTJNETf1nUGMb7BI6KzkTEyrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITz1qgaN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITz1qgaN"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-714187df604so1485604b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979969; x=1725584769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMYl2nAhcpI5cuGPIxQzdS0xmAr8bbjDKppj99oecd8=;
        b=ITz1qgaNOe7RCs1ZJkDPA/rlvdLfyIm+PLnKVInXIlEMfE70+J4qbD9MAKDnKosqWv
         Fjhm+mTkR/zC/wjEH4+/MHikJr6VnUsbVIPWvyIV57H0+1m7sXDvF8ipk/ucQuMRNJhW
         /qkEa4cGI/XX1XCWy9bIQn5khY3wfJj2+yKYYTk+wnv0naNRYvGOm1dZJ+thFHGbbbr0
         HfannJLSPtNjiOQu4DWAH4QV5T20nmCCDwnNMBrjHzSJB/TkmhrPqavMYPNy07jeGsIw
         MHIhS2avugSiqtcsd7+/8CzK6wYqG5BINnZJjaYOtt6Wv4RuX5dbw3tMTht0AOlca3Iu
         PD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979969; x=1725584769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMYl2nAhcpI5cuGPIxQzdS0xmAr8bbjDKppj99oecd8=;
        b=NjPCjr1yXWhLuNPoHLsWZ1G/tWd70DdG75twUtVkhYqmPUqLWJeKmWPE/6/ta43Ye8
         XVi4/CzL6HLMSh/xau7VRMTegLeYJAl2xL8TUaLBOtWGPVKNQMOnNvKav6bVupq09ZO2
         uBEFnNe4tKgw8zi06GSL0pq4VpBI7Ii/yeyXjzYHiZRF0fNu6gYNSSIGVSJjNn+ZKOVP
         eg+ySeFSc86G+yngkeKNUFRXWL/kDJFup9X7CoHdp3BrYSe2wBDwPfRzBQet98ZmpYqA
         G8WxHA8XcX55rzqtmp/+mPVFmfLGOeabNHxNTnb7ViZqZRQw5avsaaWFyOSGIk/5ykrj
         jorw==
X-Gm-Message-State: AOJu0YyAD8JBY5Ub1naxtbvzFHUx+E7hX0jklGCfLVUuJoKsC+0QZWqS
	rbsNBdJx84WWGjGWQJxtMGCCCWQl39sOgRYwr5HrUZdq+XGPQJU3Yth7EQ==
X-Google-Smtp-Source: AGHT+IGVKDSQda4GeMZjZjhfjpx6QMJu/QNYKJliCequjYjrzSFLxrDpOT72W3t61J7gBxfinj5cSQ==
X-Received: by 2002:a05:6a21:1706:b0:1be:c41d:b6b7 with SMTP id adf61e73a8af0-1ccee863f1amr1100921637.19.1724979968657;
        Thu, 29 Aug 2024 18:06:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a45a7sm1728301b3a.53.2024.08.29.18.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 06/14] hwmon: (ina2xx) Re-initialize chip using regmap functions
Date: Thu, 29 Aug 2024 18:05:46 -0700
Message-ID: <20240830010554.1462861-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
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
except for bit 4 which reports if an alert has been observed.
Both registers need to be marked as non-volatile to be updated
after a power cycle, but it is necessary to bypass the cache when
reading them to detect if the chip has been power cycled and to
read the alert status.

The chip does not support register auto-increments. It is therefore
necessary to configure regmap to use single register read/write
operations. Otherwise regmap tries to write all registers in a single
operation when synchronizing register contents with the hardware,
and the synchronization fails.

Another necessary change is to declare ina226_alert_to_reg() as u16.
So far it returned an s16 which is sign extended to a large negative
value which is then sent to regmap as unsigned int, causing an -EINVAL
error return.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fixed typo in patch description (ben -> been)
    Added .use_single_write = true and .use_single_read = true to
    regmap configuration

 drivers/hwmon/ina2xx.c | 50 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index ed8764a29d3f..db6432523e59 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -91,10 +91,41 @@
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
+	.use_single_write = true,
+	.use_single_read = true,
 	.max_register = INA2XX_MAX_REGISTERS,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = ina2xx_volatile_reg,
+	.writeable_reg = ina2xx_writeable_reg,
 };
 
 enum ina2xx_ids { ina219, ina226 };
@@ -229,16 +260,16 @@ static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
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
@@ -340,7 +371,7 @@ static int ina226_reg_to_alert(struct ina2xx_data *data, u32 mask, u16 regval)
  * Turns alert limit values into register values.
  * Opposite of the formula in ina2xx_get_value().
  */
-static s16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, int val)
+static u16 ina226_alert_to_reg(struct ina2xx_data *data, u32 mask, int val)
 {
 	switch (mask) {
 	case INA226_SHUNT_OVER_VOLTAGE_MASK:
@@ -439,16 +470,17 @@ static ssize_t ina226_alarm_show(struct device *dev,
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

