Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684C288CBF
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Sep 2025 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757267527; cv=none; b=rCSApptN8m5UErSl8hv6Sgvf/KAPhChv5j5cl6jTV2f2+tJFV8Mm/aD9efF9aQQTCF8NchcZpFDV5OYz11J7pwHlYPPX06bV6hw5+PTnpXo9U8m6GE7kQb6101E0Hw7zx1E4HPhDosNETSiSLps5XH8G4upoxCQWn73M8vw5/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757267527; c=relaxed/simple;
	bh=b3umicBARsfHHWKnDulYGFSb8612bCy/jQxcdeSbWCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADH3M2CSht8p8YIBZSeLM0ZxpghlbuybjcY1O/za4TuZTxZ8J4LIwoaGTyBq03BOYE1my4aqWJ+oaYl54VGfNIeEyxqvy+GGAerAve2kTjOOu8Ba8xXcTa7Nx3wBfTMRutFdPMVGWFykyITlLP/VynQBl8LxsYRgUcWjcPZys4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmKk6lDR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmKk6lDR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-772843b6057so2894333b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Sep 2025 10:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757267524; x=1757872324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OmNYshIeesd7gCuaUGxyg9lNgxN4kuH0KdZWg+0kbsg=;
        b=AmKk6lDRk1h6j1t3PMMGaT2YKmoBvXtdsb2h3XsJHFUED1bg6vPrRxgnYGOYoe+25q
         rLHPTZzs61I7jPSobeWKijbw6bonSrE52jOCVRCUTrVS9tvHmTVfY6eoEdPizPzha2n7
         6MMPwqTtLQXgxxavEfDzIo8n7+L4EPNoek7Yoy8wb3bjcF9oUQmswA+QQofGOlDqm6SL
         xqmaGzeLczndyPS9BUxzY4xHIQzAilFSzNJ7RoB+2LsPKiJBPGFuofhz2CiNolyHeL2E
         9Cz+g3PfqVFH8GJnoSp+c9Ek1JD1yjYdDQM3YZX0bL28NzdtlzPyGSl+WB763cE++rqe
         blBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757267524; x=1757872324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmNYshIeesd7gCuaUGxyg9lNgxN4kuH0KdZWg+0kbsg=;
        b=Wnl6oq8R4W6VVjmHajdVDX5GBNscugk6IIVAtkixDJHS8YPULldUl75QTXYLGPZwSH
         llWCjyuWEMcjPqNWeGTge0l6lblUAvAzHdD1qfD/j+iciA7adtFKdtDQTx2PkrhdT2FX
         qHdmcCBbsDDFkjRLZs1+lH9A2i6T56aw5MFc8Hqs1ZPzH96Pg2KJhQuueTIIONWjToQo
         T8GG8UrpeOyLgTqtqSO9h9NY7Tyg+RqWlUY0pDC7lmudzmE24eOWabJhiawXJM7u4F4V
         cgBbiD1Uf5yxSoPEgDKoNZtO5DHE1oRrCJTnV0nFJNvE4t4opFMyccMqX362IozIi8r6
         eJbw==
X-Gm-Message-State: AOJu0YzQXorOraBQ5vQ/AGuY9d6oADMClcETybQ3dIQVpOvtECCQQJw9
	vOAC++qVJvVwH73lATzScCmSiE5xrMghhRqvKQoeQb2OC6W9/dHIIqB5MO3iJ8VZ
X-Gm-Gg: ASbGncvzkL1fbZUKgkahAIVGj2Wx9aqC9JIJ8DUeB+BastUvOO9FgquuX9f/5PgchYB
	1HpLjB/ap43pOs482DFadytzKMjTPMZIdK+rP5XTk4dtfHZvlRN+rukFV+6GYm/PnA9c9WRlfsK
	2uHtn/2JIYx1eLkX6BPyBKHQQN558bxY9fXHj1Jm55BvXoVMmnVI1SQFqc5bwtNQMBhy3BqRxFh
	x+zD76zK1+GAnSATetIybR/LP/n8t4ZaewqTjf1vuME01qPpBDZWnr9rffgUd7RRvoaTDQD1fpO
	Mz3bCDCYW7naYoTsL5QxiX48mX4A48uMicHrhvKx0nIR/8crjfBG3tIMO3XxeaKwN2XnSBN8mmY
	eDTmYsjY4UaF9TAgzrhFHUQj1q4gm2rGmCl8sKiSLm7Bmvg==
X-Google-Smtp-Source: AGHT+IG49dKDF5qRbZdlPO7SFT96gnzkJ2T9hDEjXwd1KqHyUuTa3uAGKdbrPqxyvswZurhyIWMyjw==
X-Received: by 2002:a05:6a20:3d05:b0:244:d3d0:962a with SMTP id adf61e73a8af0-2533d2260b9mr7210171637.22.1757267524078;
        Sun, 07 Sep 2025 10:52:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm34235146a91.16.2025.09.07.10.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 10:52:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Serialize accesses in hwmon core
Date: Sun,  7 Sep 2025 10:52:01 -0700
Message-ID: <20250907175201.442742-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement locking in the hardware monitoring core for drivers using
the _with_info() API functions.

Most hardware monitoring drivers need to support locking to protect
against parallel accesses from userspace. With older API functions, such
locking had to be implemented in the driver code since sysfs attributes
were created by the driver. However, the _with_info() API creates sysfs
attributes in the hardware monitoring core. This makes it easy to move
the locking primitives into that code. This has the benefit of simplifying
driver code while at the same time reducing the risk of incomplete of bad
locking implementations in hardware monitoring drivers.

While this means that all accesses are forced to be synchronized, this
has little if any practical impact since accesses are expected to be low
frequency and are typically synchronized from userspace anyway since
only a single process is accessing the data. On top of that, many drivers
use regmap, which also has its own locking scheme and already serializes
accesses.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst | 10 ++++++
 drivers/hwmon/hwmon.c                    | 42 ++++++++++++++++++++----
 include/linux/hwmon.h                    |  3 ++
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index e47fc757e63e..de74bdb4f5fc 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -42,6 +42,9 @@ register/unregister functions::
 
   char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 
+  void hwmon_lock(struct device *dev);
+  void hwmon_unlock(struct device *dev);
+
 hwmon_device_register_with_info registers a hardware monitoring device.
 It creates the standard sysfs attributes in the hardware monitoring core,
 letting the driver focus on reading from and writing to the chip instead
@@ -79,6 +82,13 @@ devm_hwmon_sanitize_name is the resource managed version of
 hwmon_sanitize_name; the memory will be freed automatically on device
 removal.
 
+When using [devm_]hwmon_device_register_with_info() to register the
+ardware monitoring device, accesses using the associated access functions
+are serialised by the hardware monitoring core. If a driver needs locking
+for other functions such as interrupt handlers or for attributes which are
+fully implemented in the driver, hwmon_lock() and hwmon_unlock() can be used
+to ensure that those functions are serialized.
+
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
 
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1688c210888a..6d7c657aaa51 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -19,6 +19,7 @@
 #include <linux/kstrtox.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -36,6 +37,7 @@ struct hwmon_device {
 	const char *label;
 	struct device dev;
 	const struct hwmon_chip_info *chip;
+	struct mutex lock;
 	struct list_head tzdata;
 	struct attribute_group group;
 	const struct attribute_group **groups;
@@ -165,6 +167,8 @@ static int hwmon_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	int ret;
 	long t;
 
+	guard(mutex)(&hwdev->lock);
+
 	ret = hwdev->chip->ops->read(tdata->dev, hwmon_temp, hwmon_temp_input,
 				     tdata->index, &t);
 	if (ret < 0)
@@ -193,6 +197,8 @@ static int hwmon_thermal_set_trips(struct thermal_zone_device *tz, int low, int
 	if (!info[i])
 		return 0;
 
+	guard(mutex)(&hwdev->lock);
+
 	if (info[i]->config[tdata->index] & HWMON_T_MIN) {
 		err = chip->ops->write(tdata->dev, hwmon_temp,
 				       hwmon_temp_min, tdata->index, low);
@@ -330,8 +336,6 @@ static int hwmon_attr_base(enum hwmon_sensor_types type)
  * attached to an i2c client device.
  */
 
-static DEFINE_MUTEX(hwmon_pec_mutex);
-
 static int hwmon_match_device(struct device *dev, const void *data)
 {
 	return dev->class == &hwmon_class;
@@ -362,17 +366,16 @@ static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
 	if (!hdev)
 		return -ENODEV;
 
-	mutex_lock(&hwmon_pec_mutex);
-
 	/*
 	 * If there is no write function, we assume that chip specific
 	 * handling is not required.
 	 */
 	hwdev = to_hwmon_device(hdev);
+	guard(mutex)(&hwdev->lock);
 	if (hwdev->chip->ops->write) {
 		err = hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chip_pec, 0, val);
 		if (err && err != -EOPNOTSUPP)
-			goto unlock;
+			goto put;
 	}
 
 	if (!val)
@@ -381,8 +384,7 @@ static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
 		client->flags |= I2C_CLIENT_PEC;
 
 	err = count;
-unlock:
-	mutex_unlock(&hwmon_pec_mutex);
+put:
 	put_device(hdev);
 
 	return err;
@@ -426,9 +428,12 @@ static ssize_t hwmon_attr_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
 	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	long val;
 	int ret;
 
+	guard(mutex)(&hwdev->lock);
+
 	ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
 			       &val);
 	if (ret < 0)
@@ -445,10 +450,13 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
 				      char *buf)
 {
 	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	enum hwmon_sensor_types type = hattr->type;
 	const char *s;
 	int ret;
 
+	guard(mutex)(&hwdev->lock);
+
 	ret = hattr->ops->read_string(dev, hattr->type, hattr->attr,
 				      hattr->index, &s);
 	if (ret < 0)
@@ -465,6 +473,7 @@ static ssize_t hwmon_attr_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	long val;
 	int ret;
 
@@ -472,6 +481,8 @@ static ssize_t hwmon_attr_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
+	guard(mutex)(&hwdev->lock);
+
 	ret = hattr->ops->write(dev, hattr->type, hattr->attr, hattr->index,
 				val);
 	if (ret < 0)
@@ -785,6 +796,22 @@ int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 }
 EXPORT_SYMBOL_GPL(hwmon_notify_event);
 
+void hwmon_lock(struct device *dev)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+
+	mutex_lock(&hwdev->lock);
+}
+EXPORT_SYMBOL_GPL(hwmon_lock);
+
+void hwmon_unlock(struct device *dev)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+
+	mutex_unlock(&hwdev->lock);
+}
+EXPORT_SYMBOL_GPL(hwmon_unlock);
+
 static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
 {
 	int i, n;
@@ -945,6 +972,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 		tdev = tdev->parent;
 	hdev->of_node = tdev ? tdev->of_node : NULL;
 	hwdev->chip = chip;
+	mutex_init(&hwdev->lock);
 	dev_set_drvdata(hdev, drvdata);
 	dev_set_name(hdev, HWMON_ID_FORMAT, id);
 	err = device_register(hdev);
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 3a63dff62d03..8d7a85868d93 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -491,6 +491,9 @@ int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 char *hwmon_sanitize_name(const char *name);
 char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 
+void hwmon_lock(struct device *dev);
+void hwmon_unlock(struct device *dev);
+
 /**
  * hwmon_is_bad_char - Is the char invalid in a hwmon name
  * @ch: the char to be considered
-- 
2.45.2

