Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D803EF677
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860832; cv=none; b=cuB7bytrrLVQ7FdPii3vnAXaHkIu1fjddFm3MKIWAGfiLbEfS3Zm2MTPj3gOoiARF5/kkHLyilqCRPW1+Xv9ent3A4T2QstQX97N4zCu3C4ibvbS3T4wkfQujoa7u4w3K/GZUnYyj2kcr+aVGm+zaNYueB5MOlJwxjfxyPM9HNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860832; c=relaxed/simple;
	bh=3+NzCXM7GAwCb2QumJA5MQOFjv6K6E35VQlDbrPe9do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DtOZNteANgsAwjoHGlaxooogZcqNs0MxAI+XGOMxOE5TeEiPdCKifKi3Xr3IscuPk3PeSRE8vbmND+bjQEdcMKN9OT0mqWSTLAd+U5I+jjzzsDxNzp/sme4DGP19xSfvB3Hu91gj945OdprjxVyQvr66pLdwsmL4N94+7A9JV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzqvnoUR; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzqvnoUR"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2beab594d8eso595222eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 12:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860829; x=1774465629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUuVSITVac1PeD8ht0OmJx+BPb33jgkvU+nSink4gks=;
        b=KzqvnoURkK5Sf5Mqy4E3pBjM/m8y01WYgrTxuK1gxKQBfPfCL1A7Zdy7TaSK2G30VG
         k/Q8Lkg0l+7Tu2kmjCjn6qlj7Tf7XUjMEokPj4jPOdYgvzglrV7++P8np/pxzrTEtcAs
         +ipc9bap6JYr/KpuoFy96ajVkqr82VV4iIyvTTk7wUwkjD3ArqNvgj75HUK3whN4M6du
         AIkC1/NqTeADK49+cE7GxJu2gS9xUPCb6ryNdG4UToA+zhy7Msh7SDTLgpxTtWlW9kUe
         hidmMZV186XldzU0AhwSVKeSK4wHvyKKxHWtQr6inVEUFSkPEHCCrefoSjIPEAXraZzU
         yIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860829; x=1774465629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUuVSITVac1PeD8ht0OmJx+BPb33jgkvU+nSink4gks=;
        b=ATy1i8RYEIu2VKWXl89Yojw8pn2Irg5v664O4/vShQnXDsjZ3zuAtbY/aWk2+OQud6
         SbU21MAl6Wn3nG5pCi/CmFpqc6MXYy+mEGttyIZoktieMwwfExCDBxMBqg0cspJ+s3qH
         ApLeHI2+HquxWyVzsFxQGE0t+cD0oNvAmszox0bNVgkKth3XbymuCTokaTmZqxvs0fh0
         e5Yn+Hagf55mc68jtsjVJ87tZXFYD9R6MjimPq2kADSSecGH9G7QLhPOFHPk5gFgcvn2
         vCAYvUQoWTJ0nEDaUxVuKCQbVwlPdCY0pVImz3oNmTg6tG3qX5aPfPgN8UlFYYAPzU4C
         w5Hw==
X-Gm-Message-State: AOJu0YwQ7c8LuN0OYaCXKg2Ql7vbaL92QD67/uYNoQ2GB7DKDBq2HJjD
	TlMtkPFTRIiP+DaGNgYHhuuPghhsNcF1PyeArjfBEmO7tpBTKQTUykUb
X-Gm-Gg: ATEYQzzlKXoQDTgWsQUWEhr35eM6ROWpPQwirX0IdLdD0qF2ylZoAzHRkLxVYwEFrU0
	oXqJKxDmtu+y/unwcu7qos7KFb0CZeupKCEXEAQ0vAXrCrq6oogjXDc6TmNuoJPzZTsFVb/6XmT
	yvaVzdXEKK+nrljSz9NdBRGc2hyQIhYnwXQhIDxhxPUcT7HPb77sP7FpTZBr77mxOr79TUE8qys
	Fi6kH1wH93yd1Is4PUc+UZgMGJHK12Jd9pqy6SHB6tBIv/yFqxPrL5vxeVNW659IyKO8EUrfDeW
	hPgoOZS//MMEqrQ6Jp12oFhrsB3oowK8R6cEcq1GHBcPgzQ+9fHcVKDFpocJIcg8eoL7b9DVS5P
	A5jJ6FEbaIcsK1HhtXAlu7mY3LxpCYxSJtapvS0xZfRqQrUHN+pOjupo3ySPQe2LrvZBAa9qfW5
	ag6ytu4QDCbey5so5b/JE7Teq9oWNL8UAEdgB2b/d4TlP2PwnlxyjoqRKpI5e3wC3Xo29g9jLv
X-Received: by 2002:a05:7301:1e90:b0:2ae:5bde:a5c5 with SMTP id 5a478bee46e88-2c0e505d7damr2121248eec.30.1773860828853;
        Wed, 18 Mar 2026 12:07:08 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582dd5sm4894424eec.15.2026.03.18.12.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:07:08 -0700 (PDT)
From: Sanman Pradhan <sanman.p211993@gmail.com>
X-Google-Original-From: Sanman Pradhan <psanman@juniper.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v3 2/2] hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses
Date: Wed, 18 Mar 2026 12:06:43 -0700
Message-Id: <20260318190643.54372-3-psanman@juniper.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318190643.54372-1-psanman@juniper.net>
References: <20260318190643.54372-1-psanman@juniper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX31785 fan controller occasionally NACKs master transactions if
accesses are too tightly spaced. To avoid this, the driver currently
enforces a 250us inter-access delay with a private timestamp and wrapper
functions around both raw SMBus accesses and PMBus helper paths.

Simplify the driver by using pmbus_driver_info.access_delay for normal
PMBus-mediated accesses instead, and remove the driver-local PMBus
read/write wrappers.

Keep local delay handling for raw SMBus accesses used before
pmbus_do_probe(). For the raw i2c_transfer() long-read path, which
bypasses PMBus core timing, use pmbus_wait() and pmbus_update_ts() so
the PMBus core also tracks the raw transfer timing. Update the PMBus
core timestamp before checking the transfer result so failed transfers
do not skip the required delay before the next PMBus access.

Also update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12 accesses
are only remapped for virtual pages, allowing physical-page accesses to
fall back to the PMBus core. With that change, use pmbus_update_fan()
for fan configuration updates.

Finally, use the delayed raw read helper for MFR_REVISION during probe,
rename the local variable "virtual" to "vpage", drop the unused
to_max31785_data() macro, and add an explicit delay before
pmbus_do_probe() so the first PMBus core access is properly spaced from
the last pre-probe raw access.

Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---
v3:
- Added an explicit max31785_wait() before pmbus_do_probe() to ensure
  proper timing spacing during the handover to the PMBus core.

v2:
- Replaced local usleep_range() with core pmbus_wait() and pmbus_update_ts()
  in the raw long-read path.
- Updated read_byte_data() to allow core fallback for physical pages.
---
 drivers/hwmon/pmbus/max31785.c | 182 ++++++++++-----------------------
 1 file changed, 55 insertions(+), 127 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 50073fe0c5e8..2a160eaed5ed 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -31,8 +31,6 @@ struct max31785_data {
 	struct pmbus_driver_info info;
 };
 
-#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
-
 /*
  * MAX31785 Driver Workaround
  *
@@ -40,9 +38,8 @@ struct max31785_data {
  * These issues are not indicated by the device itself, except for occasional
  * NACK responses during master transactions. No error bits are set in STATUS_BYTE.
  *
- * To address this, we introduce a delay of 250us between consecutive accesses
- * to the fan controller. This delay helps mitigate communication problems by
- * allowing sufficient time between accesses.
+ * Keep minimal local delay handling for raw pre-probe SMBus accesses.
+ * Normal PMBus-mediated accesses use pmbus_driver_info.access_delay instead.
  */
 static inline void max31785_wait(const struct max31785_data *data)
 {
@@ -54,87 +51,38 @@ static inline void max31785_wait(const struct max31785_data *data)
 }
 
 static int max31785_i2c_write_byte_data(struct i2c_client *client,
-					struct max31785_data *driver_data,
-					int command, u8 data)
+					struct max31785_data *data,
+					int command, u8 value)
 {
 	int rc;
 
-	max31785_wait(driver_data);
-	rc = i2c_smbus_write_byte_data(client, command, data);
-	driver_data->access = ktime_get();
+	max31785_wait(data);
+	rc = i2c_smbus_write_byte_data(client, command, value);
+	data->access = ktime_get();
 	return rc;
 }
 
 static int max31785_i2c_read_word_data(struct i2c_client *client,
-				       struct max31785_data *driver_data,
+				       struct max31785_data *data,
 				       int command)
 {
 	int rc;
 
-	max31785_wait(driver_data);
+	max31785_wait(data);
 	rc = i2c_smbus_read_word_data(client, command);
-	driver_data->access = ktime_get();
-	return rc;
-}
-
-static int _max31785_read_byte_data(struct i2c_client *client,
-				    struct max31785_data *driver_data,
-				    int page, int command)
-{
-	int rc;
-
-	max31785_wait(driver_data);
-	rc = pmbus_read_byte_data(client, page, command);
-	driver_data->access = ktime_get();
-	return rc;
-}
-
-static int _max31785_write_byte_data(struct i2c_client *client,
-				     struct max31785_data *driver_data,
-				     int page, int command, u16 data)
-{
-	int rc;
-
-	max31785_wait(driver_data);
-	rc = pmbus_write_byte_data(client, page, command, data);
-	driver_data->access = ktime_get();
-	return rc;
-}
-
-static int _max31785_read_word_data(struct i2c_client *client,
-				    struct max31785_data *driver_data,
-				    int page, int phase, int command)
-{
-	int rc;
-
-	max31785_wait(driver_data);
-	rc = pmbus_read_word_data(client, page, phase, command);
-	driver_data->access = ktime_get();
-	return rc;
-}
-
-static int _max31785_write_word_data(struct i2c_client *client,
-				     struct max31785_data *driver_data,
-				     int page, int command, u16 data)
-{
-	int rc;
-
-	max31785_wait(driver_data);
-	rc = pmbus_write_word_data(client, page, command, data);
-	driver_data->access = ktime_get();
+	data->access = ktime_get();
 	return rc;
 }
 
 static int max31785_read_byte_data(struct i2c_client *client, int page, int reg)
 {
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max31785_data *driver_data = to_max31785_data(info);
-
 	switch (reg) {
 	case PMBUS_VOUT_MODE:
 		return -ENOTSUPP;
 	case PMBUS_FAN_CONFIG_12:
-		return _max31785_read_byte_data(client, driver_data,
+		if (page < MAX31785_NR_PAGES)
+			return -ENODATA;
+		return pmbus_read_byte_data(client,
 						page - MAX31785_NR_PAGES,
 						reg);
 	}
@@ -178,7 +126,21 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
 	if (rc < 0)
 		return rc;
 
+	/*
+	 * Ensure the raw transfer is properly spaced from the
+	 * preceding PMBus transaction.
+	 */
+	pmbus_wait(client);
+
 	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+
+	/*
+	 * Update PMBus core timing state for the raw transfer, even on error.
+	 * Pass 0 as the operation mask since this is a raw read, intentionally
+	 * neither PMBUS_OP_WRITE nor PMBUS_OP_PAGE_CHANGE.
+	 */
+	pmbus_update_ts(client, 0);
+
 	if (rc < 0)
 		return rc;
 
@@ -203,19 +165,16 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
 	return rv;
 }
 
-static int max31785_get_pwm_mode(struct i2c_client *client,
-				 struct max31785_data *driver_data, int page)
+static int max31785_get_pwm_mode(struct i2c_client *client, int page)
 {
 	int config;
 	int command;
 
-	config = _max31785_read_byte_data(client, driver_data, page,
-					  PMBUS_FAN_CONFIG_12);
+	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
 	if (config < 0)
 		return config;
 
-	command = _max31785_read_word_data(client, driver_data, page, 0xff,
-					   PMBUS_FAN_COMMAND_1);
+	command = pmbus_read_word_data(client, page, 0xff, PMBUS_FAN_COMMAND_1);
 	if (command < 0)
 		return command;
 
@@ -233,8 +192,6 @@ static int max31785_get_pwm_mode(struct i2c_client *client,
 static int max31785_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max31785_data *driver_data = to_max31785_data(info);
 	u32 val;
 	int rv;
 
@@ -263,7 +220,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 		rv = max31785_get_pwm(client, page);
 		break;
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		rv = max31785_get_pwm_mode(client, driver_data, page);
+		rv = max31785_get_pwm_mode(client, page);
 		break;
 	default:
 		rv = -ENODATA;
@@ -294,36 +251,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
 	return (sensor_val * 100) / 255;
 }
 
-static int max31785_update_fan(struct i2c_client *client,
-			       struct max31785_data *driver_data, int page,
-			       u8 config, u8 mask, u16 command)
-{
-	int from, rv;
-	u8 to;
-
-	from = _max31785_read_byte_data(client, driver_data, page,
-					PMBUS_FAN_CONFIG_12);
-	if (from < 0)
-		return from;
-
-	to = (from & ~mask) | (config & mask);
-
-	if (to != from) {
-		rv = _max31785_write_byte_data(client, driver_data, page,
-					       PMBUS_FAN_CONFIG_12, to);
-		if (rv < 0)
-			return rv;
-	}
-
-	rv = _max31785_write_word_data(client, driver_data, page,
-				       PMBUS_FAN_COMMAND_1, command);
-
-	return rv;
-}
-
-static int max31785_pwm_enable(struct i2c_client *client,
-			       struct max31785_data *driver_data, int page,
-			       u16 word)
+static int max31785_pwm_enable(struct i2c_client *client, int page, u16 word)
 {
 	int config = 0;
 	int rate;
@@ -351,23 +279,20 @@ static int max31785_pwm_enable(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	return max31785_update_fan(client, driver_data, page, config,
+	return pmbus_update_fan(client, page, 0, config,
 				   PB_FAN_1_RPM, rate);
 }
 
 static int max31785_write_word_data(struct i2c_client *client, int page,
 				    int reg, u16 word)
 {
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max31785_data *driver_data = to_max31785_data(info);
-
 	switch (reg) {
 	case PMBUS_VIRT_PWM_1:
-		return max31785_update_fan(client, driver_data, page, 0,
+		return pmbus_update_fan(client, page, 0, 0,
 					   PB_FAN_1_RPM,
 					   max31785_scale_pwm(word));
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		return max31785_pwm_enable(client, driver_data, page, word);
+		return max31785_pwm_enable(client, page, word);
 	default:
 		break;
 	}
@@ -391,6 +316,7 @@ static const struct pmbus_driver_info max31785_info = {
 	.read_byte_data = max31785_read_byte_data,
 	.read_word_data = max31785_read_word_data,
 	.write_byte = max31785_write_byte,
+	.access_delay = MAX31785_WAIT_DELAY_US,
 
 	/* RPM */
 	.format[PSC_FAN] = direct,
@@ -438,29 +364,29 @@ static const struct pmbus_driver_info max31785_info = {
 };
 
 static int max31785_configure_dual_tach(struct i2c_client *client,
-					struct pmbus_driver_info *info)
+					struct max31785_data *data)
 {
+	struct pmbus_driver_info *info = &data->info;
 	int ret;
 	int i;
-	struct max31785_data *driver_data = to_max31785_data(info);
 
 	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
-		ret = max31785_i2c_write_byte_data(client, driver_data,
+		ret = max31785_i2c_write_byte_data(client, data,
 						   PMBUS_PAGE, i);
 		if (ret < 0)
 			return ret;
 
-		ret = max31785_i2c_read_word_data(client, driver_data,
+		ret = max31785_i2c_read_word_data(client, data,
 						  MFR_FAN_CONFIG);
 		if (ret < 0)
 			return ret;
 
 		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {
-			int virtual = MAX31785_NR_PAGES + i;
+			int vpage = MAX31785_NR_PAGES + i;
 
-			info->pages = virtual + 1;
-			info->func[virtual] |= PMBUS_HAVE_FAN12;
-			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
+			info->pages = vpage + 1;
+			info->func[vpage] |= PMBUS_HAVE_FAN12;
+			info->func[vpage] |= PMBUS_PAGE_VIRTUAL;
 		}
 	}
 
@@ -471,7 +397,7 @@ static int max31785_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
-	struct max31785_data *driver_data;
+	struct max31785_data *data;
 	bool dual_tach = false;
 	int ret;
 
@@ -480,20 +406,20 @@ static int max31785_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
-	driver_data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
-	if (!driver_data)
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
-	info = &driver_data->info;
-	driver_data->access = ktime_get();
+	data->access = ktime_get();
+	info = &data->info;
 	*info = max31785_info;
 
-	ret = max31785_i2c_write_byte_data(client, driver_data,
-					   PMBUS_PAGE, 255);
+	ret = max31785_i2c_write_byte_data(client, data,
+					   PMBUS_PAGE, 0xff);
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_read_word_data(client, MFR_REVISION);
+	ret = max31785_i2c_read_word_data(client, data, MFR_REVISION);
 	if (ret < 0)
 		return ret;
 
@@ -509,11 +435,13 @@ static int max31785_probe(struct i2c_client *client)
 	}
 
 	if (dual_tach) {
-		ret = max31785_configure_dual_tach(client, info);
+		ret = max31785_configure_dual_tach(client, data);
 		if (ret < 0)
 			return ret;
 	}
 
+	max31785_wait(data);
+
 	return pmbus_do_probe(client, info);
 }
 
-- 
2.34.1

