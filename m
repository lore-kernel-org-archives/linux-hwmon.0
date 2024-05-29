Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D01A38DF
	for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 18:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717005699; cv=none; b=mrIZcXpuICqsjb+9+en22+0Ko0zlOHgQzTwrenC9nmCB2ThgkJp6zmS9sK1eVUS5rEpaKlFrpuU2i74VD5q0nc9aTTYtEW6ktjNkl6bGtHob1TpeVBpUXjUpOhsc6Q85TOf+oD1y20SDgCWwFX5gadwGSkEm0FgFz91HuAJLaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717005699; c=relaxed/simple;
	bh=1hhsmM8FU8Ochp3pLeWftvKiHevtDKsKBJ1OaVLVH/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IhU7lki34nMqyNJQy1jSodsB8qTS3eEgWWfgdLCrb+xqFT00o4e5M5E5bezYaOau590wQXj+LN1KxO6PjSpXrGb0SFEZLH9BNdapXincJfoaLk41hq2zXIeULf1y4aCY4tu7BoFa08t6s2ZES/AP3ABURv8JmvHt3OT0FO/6yKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX/3ytWs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX/3ytWs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f44b441b08so327535ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717005697; x=1717610497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJRstIUhdwUzOENEgQVFkefTrzyDiBsZvyQxhAqLGUs=;
        b=fX/3ytWsgFMrm0+KwEaQ/z+Bi64bxELUn3ElGiAqS3LPlSVdW+qCYrhU7mMBpGauBL
         ghkhAAR2m6yHj6osGp28oYlIJ35lfr/N3P3YIgdpr57ckQf1vAbMQSgL6UDtqXZXQOUl
         x/+LtahP6Ndv+tP7Py0cyOerSb/YpciWj4SLuPYwjdNYne1VpzpcUEhlvPYA/fqeZJGY
         02n7MX6QccGLX/1T3nNnVK9+A+7urIwW+8JXo3JlKZXosGX+3uVe9bha2ldnRkj4PDGU
         1nww0x+G5zzBKALjwfKaNotdX0bj76w4t6cJU6xXtM6IjYJ99mxqgoszJwqpH3fhsvjR
         YwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005697; x=1717610497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJRstIUhdwUzOENEgQVFkefTrzyDiBsZvyQxhAqLGUs=;
        b=uRiT/LaExwuOSBaBLSJL4nCo5DrD1QUsB7ecfdGAwoFAaKLXpybF6BcyhAux/sjHtR
         dHZZXBw9uLCq1NnGQTZexhTlXVVvD5JadaZhMLOBfB3QCcFX/NXJnCN1yg/8d+8MthXN
         HdUZr6aoDR0DEAd+JvM+nLLidTi10RO9ScE8kEJwDArd341iuLXa4bXJpi2Yr1a+nasL
         tRn50Cc8Jpc12Czj2fBwOh1I8xSkti11e70dHS+xvaXE0kGJfYiDsuw+4aC8Xw7Q/S0r
         TaGF3OYEWU8eJGeF5Fo6nEmeXfHqq22+cp6I2k8kUVdWiIAAHwtGj1dzR76jofc/Enkm
         J6Xg==
X-Gm-Message-State: AOJu0Yy+9/LKJPwqxrf2QidPBcPtpvcGQWLw1N9UXmFM9qwHK9XwQ2F1
	nYx9nPKvNVCQL9bdUqWTBXydnm0uwouDXq3KDR1MLSM2Q2/3WKX9+hsMCw==
X-Google-Smtp-Source: AGHT+IFR6dGwebtsfls173/lnLm/ox8lOjQx5l3xcwjP0eJ4+Go6cKo9iRYaxGN6kZn9ryENRjgRXg==
X-Received: by 2002:a17:902:e74c:b0:1f4:6c83:23d3 with SMTP id d9443c01a7336-1f46c8347e4mr154796925ad.52.1717005696800;
        Wed, 29 May 2024 11:01:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48a66efecsm68264345ad.183.2024.05.29.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:01:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: Add PEC attribute support to hardware monitoring core
Date: Wed, 29 May 2024 11:01:31 -0700
Message-Id: <20240529180132.72350-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529180132.72350-1-linux@roeck-us.net>
References: <20240529180132.72350-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several hardware monitoring chips optionally support Packet Error Checking
(PEC). For some chips, PEC support can be enabled simply by setting
I2C_CLIENT_PEC in the i2c client data structure. Others require chip
specific code to enable or disable PEC support.

Introduce hwmon_chip_pec and HWMON_C_PEC to simplify adding configurable
PEC support for hardware monitoring drivers. A driver can set HWMON_C_PEC
in its chip information data to indicate PEC support. If a chip requires
chip specific code to enable or disable PEC support, the driver only needs
to implement support for the hwmon_chip_pec attribute to its write
function.

The hardware monitoring core does not depend on the I2C subsystem after
this change. However, the I2C subsystem needs to be reachable. This
requires a new HWMON dependency to ensure that HWMON can only be built
as module if I2C is built as module. This should not make a practical
difference.

Cc: Radu Sabau <radu.sabau@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig |   1 +
 drivers/hwmon/hwmon.c | 136 +++++++++++++++++++++++++++++++++++++-----
 include/linux/hwmon.h |   2 +
 3 files changed, 123 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e14ae18a973b..7f384a2494c9 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -6,6 +6,7 @@
 menuconfig HWMON
 	tristate "Hardware Monitoring support"
 	depends on HAS_IOMEM
+	depends on I2C || I2C=n
 	default y
 	help
 	  Hardware monitoring devices let you monitor the hardware health
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3b259c425ab7..1fdea8b1ec91 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/gfp.h>
 #include <linux/hwmon.h>
+#include <linux/i2c.h>
 #include <linux/idr.h>
 #include <linux/kstrtox.h>
 #include <linux/list.h>
@@ -309,6 +310,103 @@ static int hwmon_attr_base(enum hwmon_sensor_types type)
 	return 1;
 }
 
+/*
+ * PEC support
+ *
+ * The 'pec' attribute is attached to I2C client devices. It is only provided
+ * if the i2c controller supports PEC.
+ *
+ * The mutex ensures that PEC configuration between i2c device and the hardware
+ * is consistent. Use a single mutex because attribute writes are supposed to be
+ * rare, and maintaining a separate mutex for each hardware monitoring device
+ * would add substantial complexity to the driver for little if any gain.
+ *
+ * The hardware monitoring device is identified as child of the i2c client
+ * device. This assumes that only a single hardware monitoring device is
+ * attached to an i2c client device.
+ */
+
+static DEFINE_MUTEX(hwmon_pec_mutex);
+
+static int hwmon_match_device(struct device *dev, void *data)
+{
+	return dev->class == &hwmon_class;
+}
+
+static ssize_t pec_show(struct device *dev, struct device_attribute *dummy,
+			char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
+}
+
+static ssize_t pec_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hwmon_device *hwdev;
+	struct device *hdev;
+	bool val;
+	int err;
+
+	err = kstrtobool(buf, &val);
+	if (err < 0)
+		return err;
+
+	hdev = device_find_child(dev, NULL, hwmon_match_device);
+	if (!hdev)
+		return -ENODEV;
+
+	mutex_lock(&hwmon_pec_mutex);
+
+	/*
+	 * If there is no write function, we assume that chip specific
+	 * handling is not required.
+	 */
+	hwdev = to_hwmon_device(hdev);
+	if (hwdev->chip->ops->write) {
+		err = hwdev->chip->ops->write(hdev, hwmon_chip, hwmon_chip_pec, 0, val);
+		if (err && err != -EOPNOTSUPP)
+			goto unlock;
+	}
+
+	if (!val)
+		client->flags &= ~I2C_CLIENT_PEC;
+	else
+		client->flags |= I2C_CLIENT_PEC;
+
+	err = count;
+unlock:
+	mutex_unlock(&hwmon_pec_mutex);
+	put_device(hdev);
+
+	return err;
+}
+
+static DEVICE_ATTR_RW(pec);
+
+static void hwmon_remove_pec(void *dev)
+{
+	device_remove_file(dev, &dev_attr_pec);
+}
+
+static int hwmon_pec_register(struct device *hdev)
+{
+	struct i2c_client *client = i2c_verify_client(hdev->parent);
+	int err;
+
+	if (!client ||
+	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
+		return 0;
+
+	err = device_create_file(&client->dev, &dev_attr_pec);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(hdev, hwmon_remove_pec, &client->dev);
+}
+
 /* sysfs attribute management */
 
 static ssize_t hwmon_attr_show(struct device *dev,
@@ -397,10 +495,6 @@ static struct attribute *hwmon_genattr(const void *drvdata,
 	const char *name;
 	bool is_string = is_string_attr(type, attr);
 
-	/* The attribute is invisible if there is no template string */
-	if (!template)
-		return ERR_PTR(-ENOENT);
-
 	mode = ops->is_visible(drvdata, type, attr, index);
 	if (!mode)
 		return ERR_PTR(-ENOENT);
@@ -712,8 +806,8 @@ static int hwmon_genattrs(const void *drvdata,
 
 			attr = __ffs(attr_mask);
 			attr_mask &= ~BIT(attr);
-			if (attr >= template_size)
-				return -EINVAL;
+			if (attr >= template_size || !templates[attr])
+				continue;	/* attribute is invisible */
 			a = hwmon_genattr(drvdata, info->type, attr, i,
 					  templates[attr], ops);
 			if (IS_ERR(a)) {
@@ -849,16 +943,26 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	INIT_LIST_HEAD(&hwdev->tzdata);
 
 	if (hdev->of_node && chip && chip->ops->read &&
-	    chip->info[0]->type == hwmon_chip &&
-	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
-		err = hwmon_thermal_register_sensors(hdev);
-		if (err) {
-			device_unregister(hdev);
-			/*
-			 * Don't worry about hwdev; hwmon_dev_release(), called
-			 * from device_unregister(), will free it.
-			 */
-			goto ida_remove;
+	    chip->info[0]->type == hwmon_chip) {
+		u32 config = chip->info[0]->config[0];
+
+		if (config & HWMON_C_REGISTER_TZ) {
+			err = hwmon_thermal_register_sensors(hdev);
+			if (err) {
+				device_unregister(hdev);
+				/*
+				 * Don't worry about hwdev; hwmon_dev_release(),
+				 * called from device_unregister(), will free it.
+				 */
+				goto ida_remove;
+			}
+		}
+		if (config & HWMON_C_PEC) {
+			err = hwmon_pec_register(hdev);
+			if (err) {
+				device_unregister(hdev);
+				goto ida_remove;
+			}
 		}
 	}
 
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index edf96f249eb5..e94314760aab 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -45,6 +45,7 @@ enum hwmon_chip_attributes {
 	hwmon_chip_power_samples,
 	hwmon_chip_temp_samples,
 	hwmon_chip_beep_enable,
+	hwmon_chip_pec,
 };
 
 #define HWMON_C_TEMP_RESET_HISTORY	BIT(hwmon_chip_temp_reset_history)
@@ -60,6 +61,7 @@ enum hwmon_chip_attributes {
 #define HWMON_C_POWER_SAMPLES		BIT(hwmon_chip_power_samples)
 #define HWMON_C_TEMP_SAMPLES		BIT(hwmon_chip_temp_samples)
 #define HWMON_C_BEEP_ENABLE		BIT(hwmon_chip_beep_enable)
+#define HWMON_C_PEC			BIT(hwmon_chip_pec)
 
 enum hwmon_temp_attributes {
 	hwmon_temp_enable,
-- 
2.39.2

