Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE12877CB
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 22:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923571; cv=none; b=B0EcviewrKRZwjh3SLfC1uvoXg0GXwyyPCbG+e9xZqQL3KlsQGVsXqR+ehSoz3AVMPrP2ct5QP0Ps6Olpz7yYOTN1MOuUzTeM71Vi18kxXA8U6knBbsRopTjoW+6vQVXNZbCpPXOLq0a6hAOmBJYUBcVT20/S/NssZ/5nIRBFLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923571; c=relaxed/simple;
	bh=oAOlPws8EP8PUhAHfq9ajzPvFqDm8bjO312/SkoWd1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUjOBB3YYpZS92W/KqPfgjnQUDzFKt1tzpCR9KUzKL9ENZRvY12P7SFtx9Q5q1DdRguPFiN2y1p5UlYp7D2/nHtXow7p+h2ML5MHrb7HvxVgHyYyHOOcvwL/27x1vO9sZVR+7hUv14D32hs5Rqhwqss1ao59rNt7FjRyEcKuk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMNT5WtF; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMNT5WtF"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be06c02f66so3153050eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 14:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772923568; x=1773528368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3pZ4NzWiqslROXZ3lXgUVAHQhP2+7utDLaCs4aywEA=;
        b=IMNT5WtFrVIO6npwL83041rR0kZn3mJngbWnBoy+dN8/3qLZFExG1+5vVNKyKqpv2T
         6eQxT2LpkcbBPbhOMc/65rNg4AxijUk6caTEnR9aKBCmwieVZP3vIU1QaPWZxjS+Ba/d
         hg37JqnTO41uvfrsoaD/zX2/gYeLyk2U+uSi9LfCYGXzDils38T4l5uYSS3Es9YtXUA2
         iyYiN51TF+WdTY34eWrmnfOhdgKFhc1rDxzc8STQqNzuogJ6daBtH654dUCi7/AEE8Ar
         xBz9h72fqoitjXzzT2o1NOrWthn8XS+FIEjXLq+Oako+I2q5MO4DSm8OV79eoyFYtG+O
         7tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923568; x=1773528368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3pZ4NzWiqslROXZ3lXgUVAHQhP2+7utDLaCs4aywEA=;
        b=ut1JEV0eZMn0CrQ9w0VYZsukQMORMuG4Kq+Tk/FB/+8xza5k2i5zbodLUWW4iVDyuE
         mq8N+8HnIpKfhYFQabRF/ZV4n4cQKB5SdLdX02022n0Sjp9dc3+0NVm8pIeAX4kJODKG
         joxpn6Mr/Xh3thCRNZqjHmUBC3nsrjWh/b3qF/xMWmngzVhD7VhjbBfu9Isdonh5o3St
         sw9ptCZOG9w1QhgRCSKPZ7tu4MoTOIxdkSCi26GyLm6KGkbVt0mgN6/ASVsRzCC8cHcj
         pFu3iNFMlVjYFOfZjDTpQIC7iSNGar+Mu2/rEbqLNrMP5JrYLTLvNu/NBu4qnGGTRYGs
         KqLw==
X-Gm-Message-State: AOJu0Yw4PxjFdjsSDyEqmQuQT0zmaHjbBmH7/IPJMlR5/Yn643LhDqhR
	53BxOln4GO7Rz1rNDzjTaJIpNdEM055S6htbbEl2IHlsvfTdKwBoWjHW
X-Gm-Gg: ATEYQzxnDkdmsNExRhRcQ/ZkV2IHEOnb5Hvd7TXn0vHqbHLl7zMDql6OxQ6BYOO4PRN
	TwJFIOOemduuWY+eXF+Hcqsm4m8yc3sSQ9A+/YuBnjmFA44WPHgSokqqTTjD/E94zuZH8zCNOUE
	s0pAzBimvlRdCmkJg1F56q3T+pOutn/+S4gt1TJfHr+p2BJS9e7GWTYJf5CElOsHenk76rrT6eG
	+exBli6W/jipg/NYKIVPTEUWa8YsV1KlPXjTImvHI0W4vUhAJ65Au/Q2A89+24AoaWdXti6e8fq
	ZODBKQjy1zliPw/ugXFCe+U/rucnQw4/uqzg1IuqiiXwy2lywbs6JggAueh+L/Z3QejHvP5z1Xd
	mbnvmL48YKKC90zEvtl3E6qoifs1YeaWKgi9DAAloF/tIkCElV0vDSflKt7CL61J/M1hcKAyZEL
	jz+UTk83T83Ye3H8IroN6EWQaM7IhEg+VreMHB//jHVjS9GXRjSGf55bruhEl1JadARKOB59Cy3
	8SiT4NsZRNaUq0IWg==
X-Received: by 2002:a05:693c:3104:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2be4e065b0fmr2783091eec.19.1772923568412;
        Sat, 07 Mar 2026 14:46:08 -0800 (PST)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aec4sm4857344eec.25.2026.03.07.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:46:07 -0800 (PST)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 2/2] hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses
Date: Sat,  7 Mar 2026 14:45:20 -0800
Message-Id: <20260307224517.38316-3-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260307224517.38316-1-sanman.p211993@gmail.com>
References: <20260307224517.38316-1-sanman.p211993@gmail.com>
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

Use pmbus_driver_info.access_delay for normal PMBus-mediated accesses
instead, and remove the driver-local PMBus read/write wrappers.

Keep local delay handling for raw SMBus accesses used before
pmbus_do_probe(). Also add explicit delays around the raw i2c_transfer()
long-read path, since it bypasses PMBus core timing and still needs to
be spaced from surrounding transactions.

Update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12 accesses are
only remapped for virtual pages, allowing physical-page accesses to fall
back to the PMBus core. With that change, use pmbus_update_fan() for fan
configuration updates.

Also use the delayed raw read helper for MFR_REVISION during probe, drop
the unused to_max31785_data() macro, and rename the local variable
"virtual" to "vpage".

Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---
 drivers/hwmon/pmbus/max31785.c | 186 +++++++++++----------------------
 1 file changed, 59 insertions(+), 127 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 50073fe0c5e8..e9c3c36c8663 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -31,7 +31,6 @@ struct max31785_data {
 	struct pmbus_driver_info info;
 };
 
-#define to_max31785_data(x)  container_of(x, struct max31785_data, info)
 
 /*
  * MAX31785 Driver Workaround
@@ -40,9 +39,8 @@ struct max31785_data {
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
@@ -54,89 +52,42 @@ static inline void max31785_wait(const struct max31785_data *data)
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
@@ -178,9 +129,22 @@ static int max31785_read_long_data(struct i2c_client *client, int page,
 	if (rc < 0)
 		return rc;
 
+	/*
+	 * The following raw i2c_transfer() bypasses PMBus core access timing.
+	 * Add an explicit delay before the transfer so it is properly spaced
+	 * from the preceding PMBus transaction.
+	 */
+	usleep_range(MAX31785_WAIT_DELAY_US, MAX31785_WAIT_DELAY_US + 50);
+
 	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
 	if (rc < 0)
 		return rc;
+	/*
+	 * The preceding raw i2c_transfer() bypasses PMBus core access timing.
+	 * Add an explicit delay after the transfer so the next PMBus access
+	 * preserves the required inter-transaction spacing.
+	 */
+	usleep_range(MAX31785_WAIT_DELAY_US, MAX31785_WAIT_DELAY_US + 50);
 
 	*data = (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
 		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));
@@ -203,19 +167,18 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
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
 
@@ -233,8 +196,6 @@ static int max31785_get_pwm_mode(struct i2c_client *client,
 static int max31785_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct max31785_data *driver_data = to_max31785_data(info);
 	u32 val;
 	int rv;
 
@@ -263,7 +224,7 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 		rv = max31785_get_pwm(client, page);
 		break;
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		rv = max31785_get_pwm_mode(client, driver_data, page);
+		rv = max31785_get_pwm_mode(client, page);
 		break;
 	default:
 		rv = -ENODATA;
@@ -294,35 +255,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
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
@@ -351,23 +284,21 @@ static int max31785_pwm_enable(struct i2c_client *client,
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
@@ -391,6 +322,7 @@ static const struct pmbus_driver_info max31785_info = {
 	.read_byte_data = max31785_read_byte_data,
 	.read_word_data = max31785_read_word_data,
 	.write_byte = max31785_write_byte,
+	.access_delay = MAX31785_WAIT_DELAY_US,
 
 	/* RPM */
 	.format[PSC_FAN] = direct,
@@ -438,29 +370,29 @@ static const struct pmbus_driver_info max31785_info = {
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
 
@@ -471,7 +403,7 @@ static int max31785_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
-	struct max31785_data *driver_data;
+	struct max31785_data *data;
 	bool dual_tach = false;
 	int ret;
 
@@ -480,20 +412,20 @@ static int max31785_probe(struct i2c_client *client)
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
 
@@ -509,7 +441,7 @@ static int max31785_probe(struct i2c_client *client)
 	}
 
 	if (dual_tach) {
-		ret = max31785_configure_dual_tach(client, info);
+		ret = max31785_configure_dual_tach(client, data);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.34.1

