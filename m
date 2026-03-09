Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E08233149
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017189; cv=none; b=VQfhjNJ2070vAMLAS5UNUQTf0RafuQ4YEjRMOu/Vw5c6+TatkC66Clo2Ch7Ob8jVKCET8+/KoWzt1PdfEXQPYLjGmVn2CC4oEvV46oy9Z/VMCTfWLiMRUdhxRUtydCD133g8ufM+ZRo5w4GCkHk4/PTMZRc4i0V6vrhFBET/6IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017189; c=relaxed/simple;
	bh=X2q0K7KXeQr+i/EiogY7plkuwkb2uPhRevC2mCm6jRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3T27GX0sVsqxX4mYzX5QhGdLMIOE2kNPmHvw7qsyROTTTLfXKB/aUAdtnU7XQOtU0TCvZrXu4BrjIiG68NDoDm+gjQ2cQ0Kqgi8ZZ2Rw6gS0oalXu2ML6g46j24KKbKtkLS75J2QsRqeJXuKIfUctO56BQ3XzJcMG2kACNIMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHhscEuc; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHhscEuc"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba895adfeaso9286015eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 17:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017187; x=1773621987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY5sNjIhX7Zl6yY6urvp7Znt7FvylVOGJgh7rxozuas=;
        b=KHhscEucFjjyJINHbcDwbCLSs+nIt3WTaxe7jWOyz7Z4BkVcqA15Xb1xswHvrxXWSS
         BJAwXid0cdUGiJpz8pLcLFv0emQzWDFFkbUXtaMqQDUaJrnmRfeFFldgrplofRuGcxNt
         UE7zI8fEnhic+POHHd7STXjQlF8FzcXTo5kbI/mnYLUCxFLk6FTXP6uCASRoXPf8Rqik
         nFLV2X46PKajjBEkX5yJb1YhpnCbP6TguLlheHW3M98IONouzS5aUwcUiz8YBZyazkQf
         iyiNJbnrpAWb16tbbPiy31bA7wnOxPZrCX1EpialFcRYzu94x0ZZ31mSe2WGaIDgZM3/
         E8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017187; x=1773621987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uY5sNjIhX7Zl6yY6urvp7Znt7FvylVOGJgh7rxozuas=;
        b=vlVw510UHy7vSivgVi8D4c4MGQxmgmZZfjSmKCctVFjIzwiWSl+SOV87NH3nOScYan
         kRqRKHcQYmUu5XVPkdYzG+VukrO6/hss6XSLnJz5J00+mAWKuryDigpKQzwz/yW//uMu
         NJYa28UjjZ9EC/sHfCTUuWv/zjPIkU18j8NMmQszn1Flv0Rub34tAJKpjp3B7Gebcc8M
         yHmEWG/I43hDnyATHGJ6o3yIQF2fn05Lu+jHttCULTBtPU1VvtJ09svzLDEZL9XSzn+Q
         Yo/f9tPrWo+9gPK+F/oF3R3T8hRlU3jr/wK7FRDDGvdDIUYAeZL9DPKVXt2N9WkKreAE
         Iong==
X-Forwarded-Encrypted: i=1; AJvYcCXnvnZ8hc0lAPcxg752DKUwBw3svyQXfo+Ehh3Yc8D4OXRTLl7TKkUiTdoDZ3tcPtbFj7y5ewwM44P4Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMU76IyWQmqJIyMYi9w9CvSfTNE4yqONY107RX8tUfq1iQabm
	zOKJpQyzrgTUyUKufB0ko4ajeLkSNkPT0++g5yDxuFpt3Qk0zvNVKHy0
X-Gm-Gg: ATEYQzw2o1N1X/nZHBtMZ3SKMqux3gbg8LnlcSLtl3kaQS1iiaWuGkl/53/dC5GyM2d
	5s7eZ49e8aZwWzHiI/TrfScWB8ElP2ZIQsf30wYPAa+FJRg8HFZP3fyynApEAfATQxi/ZMUB9Qh
	nmvPY1obNopvfkx5g+AyC7tTXGfJgm+MOHwY7vC6B/bLQtxXtE9cyVnMZ29LrcxslJvPfQAOqE5
	akJlkd7lM2HT0tSdg0hWXxLKDV9NkfURaZrEuAbaeMcGgV+n0b3E1JvCBcbGAhOCfbeSqrSp4p8
	lmUf1EgFpo7r9bnzLwYsdEZs9r8yAEL7OXPsmrGLpwfAcHqOqQieL/MWcloiQIwZBKm/fFHb+hp
	OHETFwPAINLDD1nqLCBzs2Jn0Nm2yqYn2WBKivqROn/ttfxHEhDDCpiHAx9Etmvj8tCNsr0Eu6F
	QB1+jzJ4PswcLMqV56bfbdCs2/JDlAZj0JclsDkUaP4Gk3riEokL6ZzLgmMH2jtCvXrsEhRqPgv
	tXHpDI=
X-Received: by 2002:a05:7300:a10b:b0:2be:1779:3289 with SMTP id 5a478bee46e88-2be4e062b68mr3535871eec.35.1773017187276;
        Sun, 08 Mar 2026 17:46:27 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948631sm7240105eec.19.2026.03.08.17.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:46:26 -0700 (PDT)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Sanman Pradhan <sanman.p211993@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Sanman Pradhan <psanman@juniper.net>,
	linux-hwmon <linux-hwmon@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses
Date: Sun,  8 Mar 2026 17:45:08 -0700
Message-Id: <20260309004508.78609-3-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309004508.78609-1-sanman.p211993@gmail.com>
References: <20260309004508.78609-1-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanman Pradhan <psanman@juniper.net>

The MAX31785 fan controller occasionally NACKs master transactions if
accesses are too tightly spaced. To avoid this, the driver currently
enforces a 250us inter-access delay with a private timestamp and wrapper
functions around both raw SMBus accesses and PMBus helper paths.

Simplify the driver by using pmbus_driver_info.access_delay for normal
PMBus-mediated accesses instead, and remove the driver-local PMBus
read/write wrappers.

Keep local delay handling for raw SMBus accesses used before
pmbus_do_probe(). For the raw i2c_transfer() long-read path, which
bypasses PMBus core timing, leverage the newly exported pmbus_wait() and
pmbus_update_ts() core functions. This replaces hardcoded usleep_range()
calls and ensures the PMBus core tracks the raw transaction. Placing
pmbus_update_ts() before the error check fixes a bug where a failed
i2c_transfer() would skip the delay and impact subsequent PMBus commands.

Additionally, update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12
accesses are only remapped for virtual pages, allowing physical-page
accesses to fall back to the PMBus core. With that change, we can safely
drop the custom max31785_update_fan() wrapper in favor of the core
pmbus_update_fan() helper.

Also use the delayed raw read helper for MFR_REVISION during probe, drop
the unused to_max31785_data() macro, and rename the local variable
"virtual" to "vpage".

Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---
 drivers/hwmon/pmbus/max31785.c | 187 +++++++++++----------------------
 1 file changed, 59 insertions(+), 128 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 50073fe0c5e8..098f43486c45 100644
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
@@ -54,89 +51,42 @@ static inline void max31785_wait(const struct max31785_data *data)
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
 
 	switch (reg) {
 	case PMBUS_VOUT_MODE:
 		return -ENOTSUPP;
 	case PMBUS_FAN_CONFIG_12:
-		return _max31785_read_byte_data(client, driver_data,
-						page - MAX31785_NR_PAGES,
-						reg);
+		if (page < MAX31785_NR_PAGES)
+			return -ENODATA;
+
+		return pmbus_read_byte_data(client,
+					    page - MAX31785_NR_PAGES,
+					    reg);
 	}
 
 	return -ENODATA;
@@ -178,7 +128,20 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
 	if (rc < 0)
 		return rc;
 
+	/* Ensure the raw transfer is properly spaced from the
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
 
@@ -203,19 +166,18 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
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
+	config = pmbus_read_byte_data(client, page,
+				      PMBUS_FAN_CONFIG_12);
 	if (config < 0)
 		return config;
 
-	command = _max31785_read_word_data(client, driver_data, page, 0xff,
-					   PMBUS_FAN_COMMAND_1);
+	command = pmbus_read_word_data(client, page, 0xff,
+				       PMBUS_FAN_COMMAND_1);
 	if (command < 0)
 		return command;
 
@@ -233,8 +195,6 @@ static int max31785_get_pwm_mode(struct i2c_client *client,
 static int max31785_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max31785_data *driver_data = to_max31785_data(info);
 	u32 val;
 	int rv;
 
@@ -263,7 +223,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 		rv = max31785_get_pwm(client, page);
 		break;
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		rv = max31785_get_pwm_mode(client, driver_data, page);
+		rv = max31785_get_pwm_mode(client, page);
 		break;
 	default:
 		rv = -ENODATA;
@@ -294,35 +254,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
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
+static int max31785_pwm_enable(struct i2c_client *client, int page,
 			       u16 word)
 {
 	int config = 0;
@@ -351,23 +283,21 @@ static int max31785_pwm_enable(struct i2c_client *client,
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
 
 	switch (reg) {
 	case PMBUS_VIRT_PWM_1:
-		return max31785_update_fan(client, driver_data, page, 0,
-					   PB_FAN_1_RPM,
-					   max31785_scale_pwm(word));
+		return pmbus_update_fan(client, page, 0, 0,
+					PB_FAN_1_RPM,
+					max31785_scale_pwm(word));
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		return max31785_pwm_enable(client, driver_data, page, word);
+		return max31785_pwm_enable(client, page, word);
 	default:
 		break;
 	}
@@ -391,6 +321,7 @@ static const struct pmbus_driver_info max31785_info = {
 	.read_byte_data = max31785_read_byte_data,
 	.read_word_data = max31785_read_word_data,
 	.write_byte = max31785_write_byte,
+	.access_delay = MAX31785_WAIT_DELAY_US,
 
 	/* RPM */
 	.format[PSC_FAN] = direct,
@@ -438,29 +369,29 @@ static const struct pmbus_driver_info max31785_info = {
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
 
@@ -471,7 +402,7 @@ static int max31785_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
-	struct max31785_data *driver_data;
+	struct max31785_data *data;
 	bool dual_tach = false;
 	int ret;
 
@@ -480,20 +411,20 @@ static int max31785_probe(struct i2c_client *client)
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
 
@@ -509,7 +440,7 @@ static int max31785_probe(struct i2c_client *client)
 	}
 
 	if (dual_tach) {
-		ret = max31785_configure_dual_tach(client, info);
+		ret = max31785_configure_dual_tach(client, data);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.34.1

