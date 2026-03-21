Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A1261586
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774104323; cv=none; b=ueXr9Zisa5UB4c3iUFX6EQn/TWY4Gag/ZsLFFmjRvq+lGfYcQ44/JHf2NG/3djSRHWQblavspcguUZMmr5P7cyoVSUlf4fHXWJ83HI1SbOwAxEm1EZGqhRnh/p8hIh4lMrgKM860W2WJcEsx3eVJKgo2N8bZqmDVJV2X9oR7KdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774104323; c=relaxed/simple;
	bh=Vx3F+OBAmxvMl2a5HsFmIBjG7+E3NS5WmGsL4w9DKDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcnfwMolC9mZrmNGXkOYx0A0jigy8Qsg+SmwX358buJJmnHzMe+wNAU/hIfaHdNfk2SQ/X4uMjUnWnxfqN4OUAwCnBrqxj8OMjBxPC/oQtF1AuLtlvR/zzrzbAUZH2phtI/DKyQ9ofGsh9FY6Z0b73yHlJyPPHmWIK+sY9NUcoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cePaZhPk; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cePaZhPk"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1271195d2a7so3085278c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774104317; x=1774709117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S7N3xQEAh21hf2Pzeq7BgFhA7ZYMCiZkAdx4EjBjGE=;
        b=cePaZhPkng7IA0dLSNKZC/BBMS9fQiemon6YE2pHh/CDmbvBJgQWf/Kh7aJ/rZwjLp
         aDgO5IY/sNDswTe0ambCbt88RXI0PlUqUzbYfqjC4ElZBmPzwr3PR25mxPo+Ve2c5HK6
         UTS/mksPBlZ6XpW1mjcdfAPNdd1cJwVwYQZ2/u3feM/Zaicf7NAEW1nvZpfh/gZPBFoX
         pxqKO8KmMFE6KpyY9xNFPAzyDtX7QEa3YDqMicxSlHmN3VYENVxuM8XX4vrkoNIYBORH
         Yr8Xg+DuVLAiT7VapHlGHmncoXmL3zS9oZczI5EgR9nZp30smPM0yGMZpYvvhzv2LRI2
         qPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774104317; x=1774709117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7S7N3xQEAh21hf2Pzeq7BgFhA7ZYMCiZkAdx4EjBjGE=;
        b=NAFCJBdtoK5r277Pm/oNRyFzWHWz9rEga4wRiRNLItqd4r3Qp3FXTVinRcI9GNSN3A
         P+jsbavromOJZ+O5KEEq8qcMipp8iINQY2ikgtkyomp/ZmVDOSo+CSmEV2bekQ0Nsoej
         JK8g30IU7NGnsV+KMf4hG72YB0l5m8pPDLgAuT0TkqJmaWf7CoLeAGQsjV/QHcG3/b8c
         vgDD2E/YB4zkM5U1CxWg5wOZgZr1tFRfWL9AZkUFsF7CLK4cnWoNYTAl7Q4CrFmtvmXR
         rOWklpndVXD94v4RPEwuuKXY+uTBtzxZ83aVbRJ8n6mt+xedJQdWJFq06ssLVVaF64eG
         L8yw==
X-Gm-Message-State: AOJu0YxG0+GQQTZMmiGWvIQ63RVyz0/uJKr6eSWuOOiv57iQZ6Zaa5J6
	IW79LagEWyv9pW3dM6fuyCkDis24MJD1aFAV86CmkvB1JrkkBDeyoT1nJjkXrA==
X-Gm-Gg: ATEYQzyyNacbnTfQVCU9PyyoomHv9vtRqb8xxMNsKjq3pFKO8W2sYSkXloHfqhyKvLC
	yLgwJAFW8S0yQ94asqy/72CRJsAy8Mx+Xf/++WAsEP1PS8jSbrubDf7gv0YHV0/6TTqLXneb14d
	VPb0l+h4IxcnPEJ1YiItBj0HImvrg56FTwLCrb4s7QQ6zIxOiWmZwL/tdRS78Cc6R5MW0i/83NH
	1k7fVVyONX9978Cbho+MpBqu2k2WQnGliyBJN9cZuxYeaUswK5Ju3saxkCZfSMRSoufa4ptZHHC
	/0Vn6qdvRYQKCS177l5ks2ZRhoXBoeyqw11yfBN2Ax6xmBkVNg+kyKkHI8VtXSRdpIX+Hv6kx50
	ekSKLWWtOIySEX3TZsPe8HltMVZgSys0fJCoKR+fy/h/6Lf2y2D37O6eCWj4a7IHnIsSla6M7xq
	kEE7JAGbuBd5eND8+EAP7E3WfoxIX6X6gnOIix
X-Received: by 2002:a05:7022:60c:b0:12a:6c7e:befa with SMTP id a92af1059eb24-12a726479d6mr2979963c88.2.1774104317261;
        Sat, 21 Mar 2026 07:45:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733dd8c0sm5321870c88.5.2026.03.21.07.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:45:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (pmbus_core) Use guard() for mutex protection
Date: Sat, 21 Mar 2026 07:45:09 -0700
Message-ID: <20260321144509.1450594-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260321144509.1450594-1-linux@roeck-us.net>
References: <20260321144509.1450594-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code by using guard() and scoped_guard() instead of
mutex_lock()/mutex_unlock() sequences.

This changes semantics for debugfs accesses. Previously, those used
mutex_lock_interruptible() and not mutex_lock(). This change is
intentional and should have little if any impact since locks should not
be held for a significant amount of time and debugfs accesses are less
critical than sysfs accesses (which never used interruptable locks).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Document the change from mutex_lock_interruptible() to mutex_lock()
    Use scoped_guard() where it makes sense

 drivers/hwmon/pmbus/pmbus_core.c | 207 ++++++++++++-------------------
 1 file changed, 80 insertions(+), 127 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7ffa011cb279..30c40ebfea12 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1150,12 +1150,11 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 	int ret, status;
 	u16 regval;
 
-	mutex_lock(&data->update_lock);
+	guard(pmbus_lock)(client);
+
 	status = pmbus_get_status(client, page, reg);
-	if (status < 0) {
-		ret = status;
-		goto unlock;
-	}
+	if (status < 0)
+		return status;
 
 	if (s1)
 		pmbus_update_sensor_data(client, s1);
@@ -1167,7 +1166,7 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 		if (data->revision >= PMBUS_REV_12) {
 			ret = _pmbus_write_byte_data(client, page, reg, regval);
 			if (ret)
-				goto unlock;
+				return ret;
 		} else {
 			pmbus_clear_fault_page(client, page);
 		}
@@ -1175,14 +1174,10 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 	if (s1 && s2) {
 		s64 v1, v2;
 
-		if (s1->data < 0) {
-			ret = s1->data;
-			goto unlock;
-		}
-		if (s2->data < 0) {
-			ret = s2->data;
-			goto unlock;
-		}
+		if (s1->data < 0)
+			return s1->data;
+		if (s2->data < 0)
+			return s2->data;
 
 		v1 = pmbus_reg2data(data, s1);
 		v2 = pmbus_reg2data(data, s2);
@@ -1190,8 +1185,6 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 	} else {
 		ret = !!regval;
 	}
-unlock:
-	mutex_unlock(&data->update_lock);
 	return ret;
 }
 
@@ -1215,16 +1208,14 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	ssize_t ret;
 
-	mutex_lock(&data->update_lock);
-	pmbus_update_sensor_data(client, sensor);
-	if (sensor->data < 0)
-		ret = sensor->data;
-	else
-		ret = sysfs_emit(buf, "%lld\n", pmbus_reg2data(data, sensor));
-	mutex_unlock(&data->update_lock);
-	return ret;
+	scoped_guard(pmbus_lock, client) {
+		pmbus_update_sensor_data(client, sensor);
+		if (sensor->data < 0)
+			return sensor->data;
+	}
+
+	return sysfs_emit(buf, "%lld\n", pmbus_reg2data(data, sensor));
 }
 
 static ssize_t pmbus_set_sensor(struct device *dev,
@@ -1234,7 +1225,6 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
-	ssize_t rv = count;
 	s64 val;
 	int ret;
 	u16 regval;
@@ -1242,15 +1232,15 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 	if (kstrtos64(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	guard(pmbus_lock)(client);
+
 	regval = pmbus_data2reg(data, sensor, val);
 	ret = _pmbus_write_word_data(client, sensor->page, sensor->reg, regval);
 	if (ret < 0)
-		rv = ret;
-	else
-		sensor->data = -ENODATA;
-	mutex_unlock(&data->update_lock);
-	return rv;
+		return ret;
+
+	sensor->data = -ENODATA;
+	return count;
 }
 
 static ssize_t pmbus_show_label(struct device *dev,
@@ -1352,7 +1342,6 @@ static int pmbus_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct pmbus_data *pmbus_data = tdata->pmbus_data;
 	struct i2c_client *client = to_i2c_client(pmbus_data->dev);
 	struct device *dev = pmbus_data->hwmon_dev;
-	int ret = 0;
 
 	if (!dev) {
 		/* May not even get to hwmon yet */
@@ -1360,15 +1349,14 @@ static int pmbus_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 		return 0;
 	}
 
-	mutex_lock(&pmbus_data->update_lock);
+	guard(pmbus_lock)(client);
+
 	pmbus_update_sensor_data(client, sensor);
 	if (sensor->data < 0)
-		ret = sensor->data;
-	else
-		*temp = (int)pmbus_reg2data(pmbus_data, sensor);
-	mutex_unlock(&pmbus_data->update_lock);
+		return sensor->data;
 
-	return ret;
+	*temp = (int)pmbus_reg2data(pmbus_data, sensor);
+	return 0;
 }
 
 static const struct thermal_zone_device_ops pmbus_thermal_ops = {
@@ -2354,13 +2342,12 @@ static ssize_t pmbus_show_samples(struct device *dev,
 	int val;
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
-	struct pmbus_data *data = i2c_get_clientdata(client);
 
-	mutex_lock(&data->update_lock);
-	val = _pmbus_read_word_data(client, reg->page, 0xff, reg->attr->reg);
-	mutex_unlock(&data->update_lock);
-	if (val < 0)
-		return val;
+	scoped_guard(pmbus_lock, client) {
+		val = _pmbus_read_word_data(client, reg->page, 0xff, reg->attr->reg);
+		if (val < 0)
+			return val;
+	}
 
 	return sysfs_emit(buf, "%d\n", val);
 }
@@ -2373,14 +2360,13 @@ static ssize_t pmbus_set_samples(struct device *dev,
 	long val;
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
-	struct pmbus_data *data = i2c_get_clientdata(client);
 
 	if (kstrtol(buf, 0, &val) < 0)
 		return -EINVAL;
 
-	mutex_lock(&data->update_lock);
+	guard(pmbus_lock)(client);
+
 	ret = _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
-	mutex_unlock(&data->update_lock);
 
 	return ret ? : count;
 }
@@ -2892,14 +2878,9 @@ static int _pmbus_is_enabled(struct i2c_client *client, u8 page)
 
 static int __maybe_unused pmbus_is_enabled(struct i2c_client *client, u8 page)
 {
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	int ret;
+	guard(pmbus_lock)(client);
 
-	mutex_lock(&data->update_lock);
-	ret = _pmbus_is_enabled(client, page);
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return _pmbus_is_enabled(client, page);
 }
 
 #define to_dev_attr(_dev_attr) \
@@ -2929,14 +2910,13 @@ static void pmbus_notify(struct pmbus_data *data, int page, int reg, int flags)
 	}
 }
 
-static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flags,
+static int _pmbus_get_flags(struct i2c_client *client, u8 page, unsigned int *flags,
 			    unsigned int *event, bool notify)
 {
+	struct pmbus_data *data = i2c_get_clientdata(client);
 	int i, status;
 	const struct pmbus_status_category *cat;
 	const struct pmbus_status_assoc *bit;
-	struct device *dev = data->dev;
-	struct i2c_client *client = to_i2c_client(dev);
 	int func = data->info->func[page];
 
 	*flags = 0;
@@ -3012,16 +2992,12 @@ static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flag
 	return 0;
 }
 
-static int __maybe_unused pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flags,
+static int __maybe_unused pmbus_get_flags(struct i2c_client *client, u8 page, unsigned int *flags,
 					  unsigned int *event, bool notify)
 {
-	int ret;
+	guard(pmbus_lock)(client);
 
-	mutex_lock(&data->update_lock);
-	ret = _pmbus_get_flags(data, page, flags, event, notify);
-	mutex_unlock(&data->update_lock);
-
-	return ret;
+	return _pmbus_get_flags(client, page, flags, event, notify);
 }
 
 #if IS_ENABLED(CONFIG_REGULATOR)
@@ -3037,17 +3013,13 @@ static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
 {
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
 	u8 page = rdev_get_id(rdev);
-	int ret;
 
-	mutex_lock(&data->update_lock);
-	ret = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
-				     PB_OPERATION_CONTROL_ON,
-				     enable ? PB_OPERATION_CONTROL_ON : 0);
-	mutex_unlock(&data->update_lock);
+	guard(pmbus_lock)(client);
 
-	return ret;
+	return pmbus_update_byte_data(client, page, PMBUS_OPERATION,
+				      PB_OPERATION_CONTROL_ON,
+				      enable ? PB_OPERATION_CONTROL_ON : 0);
 }
 
 static int pmbus_regulator_enable(struct regulator_dev *rdev)
@@ -3064,54 +3036,41 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 {
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
 	int event;
 
-	return pmbus_get_flags(data, rdev_get_id(rdev), flags, &event, false);
+	return pmbus_get_flags(client, rdev_get_id(rdev), flags, &event, false);
 }
 
 static int pmbus_regulator_get_status(struct regulator_dev *rdev)
 {
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_data *data = i2c_get_clientdata(client);
 	u8 page = rdev_get_id(rdev);
 	int status, ret;
 	int event;
 
-	mutex_lock(&data->update_lock);
-	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
-	if (status < 0) {
-		ret = status;
-		goto unlock;
-	}
+	guard(pmbus_lock)(client);
 
-	if (status & PB_STATUS_OFF) {
-		ret = REGULATOR_STATUS_OFF;
-		goto unlock;
-	}
+	status = pmbus_get_status(client, page, PMBUS_STATUS_WORD);
+	if (status < 0)
+		return status;
+
+	if (status & PB_STATUS_OFF)
+		return REGULATOR_STATUS_OFF;
 
 	/* If regulator is ON & reports power good then return ON */
-	if (!(status & PB_STATUS_POWER_GOOD_N)) {
-		ret = REGULATOR_STATUS_ON;
-		goto unlock;
-	}
+	if (!(status & PB_STATUS_POWER_GOOD_N))
+		return REGULATOR_STATUS_ON;
 
-	ret = _pmbus_get_flags(data, rdev_get_id(rdev), &status, &event, false);
+	ret = _pmbus_get_flags(client, rdev_get_id(rdev), &status, &event, false);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (status & (REGULATOR_ERROR_UNDER_VOLTAGE | REGULATOR_ERROR_OVER_CURRENT |
-	   REGULATOR_ERROR_REGULATION_OUT | REGULATOR_ERROR_FAIL | REGULATOR_ERROR_OVER_TEMP)) {
-		ret = REGULATOR_STATUS_ERROR;
-		goto unlock;
-	}
+	   REGULATOR_ERROR_REGULATION_OUT | REGULATOR_ERROR_FAIL | REGULATOR_ERROR_OVER_TEMP))
+		return REGULATOR_STATUS_ERROR;
 
-	ret = REGULATOR_STATUS_UNDEFINED;
-
-unlock:
-	mutex_unlock(&data->update_lock);
-	return ret;
+	return REGULATOR_STATUS_UNDEFINED;
 }
 
 static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
@@ -3356,16 +3315,16 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 	struct i2c_client *client = to_i2c_client(data->dev);
 	int i, status, event;
 
-	mutex_lock(&data->update_lock);
+	guard(pmbus_lock)(client);
+
 	for (i = 0; i < data->info->pages; i++) {
-		_pmbus_get_flags(data, i, &status, &event, true);
+		_pmbus_get_flags(client, i, &status, &event, true);
 
 		if (event)
 			pmbus_regulator_notify(data, i, event);
 	}
 
 	pmbus_clear_faults(client);
-	mutex_unlock(&data->update_lock);
 
 	return IRQ_HANDLED;
 }
@@ -3421,15 +3380,13 @@ static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
 
 static int pmbus_debugfs_get(void *data, u64 *val)
 {
-	int rc;
 	struct pmbus_debugfs_entry *entry = data;
-	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
+	struct i2c_client *client = entry->client;
+	int rc;
 
-	rc = mutex_lock_interruptible(&pdata->update_lock);
-	if (rc)
-		return rc;
-	rc = _pmbus_read_byte_data(entry->client, entry->page, entry->reg);
-	mutex_unlock(&pdata->update_lock);
+	guard(pmbus_lock)(client);
+
+	rc = _pmbus_read_byte_data(client, entry->page, entry->reg);
 	if (rc < 0)
 		return rc;
 
@@ -3442,15 +3399,14 @@ DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
 
 static int pmbus_debugfs_get_status(void *data, u64 *val)
 {
-	int rc;
 	struct pmbus_debugfs_entry *entry = data;
-	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
+	struct i2c_client *client = entry->client;
+	struct pmbus_data *pdata = i2c_get_clientdata(client);
+	int rc;
 
-	rc = mutex_lock_interruptible(&pdata->update_lock);
-	if (rc)
-		return rc;
-	rc = pdata->read_status(entry->client, entry->page);
-	mutex_unlock(&pdata->update_lock);
+	guard(pmbus_lock)(client);
+
+	rc = pdata->read_status(client, entry->page);
 	if (rc < 0)
 		return rc;
 
@@ -3466,17 +3422,14 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
 {
 	int rc;
 	struct pmbus_debugfs_entry *entry = file->private_data;
-	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
+	struct i2c_client *client = entry->client;
 	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 
-	rc = mutex_lock_interruptible(&pdata->update_lock);
-	if (rc)
-		return rc;
-	rc = pmbus_read_block_data(entry->client, entry->page, entry->reg,
-				   data);
-	mutex_unlock(&pdata->update_lock);
-	if (rc < 0)
-		return rc;
+	scoped_guard(pmbus_lock, client) {
+		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
+		if (rc < 0)
+			return rc;
+	}
 
 	/* Add newline at the end of a read data */
 	data[rc] = '\n';
-- 
2.45.2

