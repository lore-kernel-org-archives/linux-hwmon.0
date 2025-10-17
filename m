Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061AB2D9EFE
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706168; cv=none; b=ECYEo/afugrPJWtPTHDUlrp8DlErc4qRbkBbCtoFPvssx6pn/hbvOqW1aYTK3VKs0AdyCQ5NMJwJ9Hld0NoQyVmIgjFJYNeAAbbSx5UJPCM2xv0m/OcLTVRNAMjFecO8a96QbzLb6z34/+n9TNdWdNgHKYaOV2Y7GWlEUVdkmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706168; c=relaxed/simple;
	bh=gqWktWIQYQFBvC9Qn4CftIdwVyWrPxG+dpyFSkLr6tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUD6ftE9FhX2Kis+FRfyRLRHCjneNnr4YtTpENnGUZaBc/RiZjhk4/uuKcbveQUQ1Q/wM3unXDHJAhwXBOyWQo44SckdBhabDXaT1LaY6MdzbgimKRSOFp3J3cl+ArzE0Nr62dcN/m5QO+CkUAftFuC9o0OpGTDmyyfZTzdJzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPMU3Y54; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPMU3Y54"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b556284db11so1599250a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706166; x=1761310966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYj3ZN/9jEj85cRHSIlThXmyNR5kIiv1kUV8AP+CgTs=;
        b=YPMU3Y54gaHuInROF8s4TzGNBWpEYwwJpWxojKutASYzOU3SphxUS+XKuyXI98yTeb
         Ba0xq2tBDFor6OC+NCS8c0Rf/6UR/3phfaJbObTSrqTMIVAmgv8MO3VAWpSea31WMwv6
         +UYsWbeTL1b6wDSbNNSpXOsq8dwPVaqPZE1MFaaOVqrTsictjDvG/lfJ3kT2iLh63yuT
         uYg7TNRdEAFiENrNK5WNtgjspckU5XQ5CpB/BSCh7zj2xA3GhB375htb3AGq7YRHKZ0f
         L4lY5rZg7xEgLuJ0HJqNv+r9sG2jCVcrOMEjQKIzYZj3FORSpOk/VdilN78UkU+5mDQP
         mMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706166; x=1761310966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYj3ZN/9jEj85cRHSIlThXmyNR5kIiv1kUV8AP+CgTs=;
        b=t798NtAjjEuo4YAYmIVaw31YUQjt5Vk2+NgkMv6rCXJ0H/vGnATTRe/EiPtCyGGBoS
         xfkpI3jZNRh91xcYLWwBtD/j8V4jBhZPufbjoqc5W8n1Hg6qOwjx6groSdPQ5gmnydKN
         SXjzf2TSMIsGOz1/SJ+sK03fwwTzxWVFw6SfMjv2tU5HV5GxEckM8yq14xo0FNoKbJrP
         /zaEYAcNX/YP4eq51BMsk7leDXp23raV7oz/J/ERtbd/YAMKU6FWA0Jk1ftytI7AUVGJ
         hrUZdOr2Jf/84dOlYjjQ63Q1Jn9MGnvRZLgliRyQp+7kd8KrDXTmSH/g623qFXKfHxHf
         in6A==
X-Gm-Message-State: AOJu0Yy5HIQjWDZm/SX36jcSGslCtbmShgMlfU/oItWeocGNDryPL8Nc
	B1VfPVrQ970jVUbiJ2aqU/0XUapHQ1MNbdI1tcOjmbB6FmqXdIxeQIuDpFMPrg==
X-Gm-Gg: ASbGncs/NmaGW/yoTRWZAOqfeoTAOGGM1QtN3Jaj+xMfkOW19r3XCosXSzhYhs5c6tD
	39P4C5zeKio+WE9AxlX2TWXxkX4tx4Kn9z61D1RnbIuEQidY8M5VHBLZExS/yjXpw+y8lXmuLIY
	jVtrGsUQm2qSWXu9Vo3uqP48aEODiuhwT1qVBUqrOq4ciH4RIoBA5fFYQfg+46+jm3HX0dR3K0e
	f1MqcsDXLkEfHZd3OzkVrtaG3GxJesHmmX7PeG0iYmNJAFiUkMxZW6Q3a3swXDGs9owxSU2G5KX
	IEn9Civ2XLXix++yYtWWWxesq+n5sbedrK6CRUewDC41bavsTReF3dVdou6YlTmBfRf/d0V/BPc
	CJ+4KKHtzkGjN5noueqd0l3BZ8KR6ragD52/A3rkhZh1X2p86oWXFLGRH9Sy4AeNSJDaTpSBhIM
	dbxG/Ycu3F930pUoTAccsAQQw=
X-Google-Smtp-Source: AGHT+IEH3C803vuppRt8mtsPtWtZiqpBmRZjzHJaR3HskKY+ETif2ok1mht9yQhsrOaccY3Mhig/Nw==
X-Received: by 2002:a17:903:1746:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290caf85146mr41757195ad.30.1760706165691;
        Fri, 17 Oct 2025 06:02:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7d1bbsm63844705ad.65.2025.10.17.06.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/29] hwmon: (ina3221) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:00 -0700
Message-ID: <20251017130221.1823453-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
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
 drivers/hwmon/ina3221.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index ce0e3f214f5b..5ecc68dcf169 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -11,7 +11,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -115,7 +114,6 @@ struct ina3221_input {
  * @regmap: Register map of the device
  * @fields: Register fields of the device
  * @inputs: Array of channel input source specific structures
- * @lock: mutex lock to serialize sysfs attribute accesses
  * @reg_config: Register value of INA3221_CONFIG
  * @summation_shunt_resistor: equivalent shunt resistor value for summation
  * @summation_channel_control: Value written to SCC field in INA3221_MASK_ENABLE
@@ -126,7 +124,6 @@ struct ina3221_data {
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
 	struct ina3221_input inputs[INA3221_NUM_CHANNELS];
-	struct mutex lock;
 	u32 reg_config;
 	int summation_shunt_resistor;
 	u32 summation_channel_control;
@@ -530,11 +527,8 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
-	struct ina3221_data *ina = dev_get_drvdata(dev);
 	int ret;
 
-	mutex_lock(&ina->lock);
-
 	switch (type) {
 	case hwmon_chip:
 		ret = ina3221_read_chip(dev, attr, val);
@@ -550,20 +544,14 @@ static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = -EOPNOTSUPP;
 		break;
 	}
-
-	mutex_unlock(&ina->lock);
-
 	return ret;
 }
 
 static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
-	struct ina3221_data *ina = dev_get_drvdata(dev);
 	int ret;
 
-	mutex_lock(&ina->lock);
-
 	switch (type) {
 	case hwmon_chip:
 		ret = ina3221_write_chip(dev, attr, val);
@@ -579,9 +567,6 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
 		ret = -EOPNOTSUPP;
 		break;
 	}
-
-	mutex_unlock(&ina->lock);
-
 	return ret;
 }
 
@@ -886,7 +871,6 @@ static int ina3221_probe(struct i2c_client *client)
 	}
 
 	ina->pm_dev = dev;
-	mutex_init(&ina->lock);
 	dev_set_drvdata(dev, ina);
 
 	/* Enable PM runtime -- status is suspended by default */
@@ -925,7 +909,6 @@ static int ina3221_probe(struct i2c_client *client)
 	/* pm_runtime_put_noidle() will decrease the PM refcount until 0 */
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
 		pm_runtime_put_noidle(ina->pm_dev);
-	mutex_destroy(&ina->lock);
 
 	return ret;
 }
@@ -941,8 +924,6 @@ static void ina3221_remove(struct i2c_client *client)
 	/* pm_runtime_put_noidle() will decrease the PM refcount until 0 */
 	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
 		pm_runtime_put_noidle(ina->pm_dev);
-
-	mutex_destroy(&ina->lock);
 }
 
 static int ina3221_suspend(struct device *dev)
-- 
2.45.2

