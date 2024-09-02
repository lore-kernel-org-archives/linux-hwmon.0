Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EFB1547CA
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Sep 2024 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263727; cv=none; b=s6NUXfCG5ZlIZtsEllpjUcdwbjuYb56JtJOhCn4j4swibqTGzqmti4sRTVyNMAIm2i1RwcEnEUfsNfVWUezQtWjIcrHYK78Djm6eLOVp/zD7zcLrpMAGdf47C2kiOFTpoFUYwT7Y1IUKo+v+5zEfeeIAmIbeuvC46irLl7uQFlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263727; c=relaxed/simple;
	bh=06uiLkKD7zpUn6GdcOmDA03uOQJzZV0sd0l320q5UYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afOjdhw0+lHLbCls5xDsjDMAp+uhwE8uWhuWWc3qFSE03V8y+Sh+arvsae2yumK5xfCTcEC7D3ylDhMAtexPsgIvF3BnGaM7UbbQoDhsNwJCcAdU0U7Qyrtb8F5Rxtf7yM6lS2wUlp3rpU7Bt+KnHSJ/N3hl9sK2QZFujCmhJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=HSx8Ga3J; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="HSx8Ga3J"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86acbaddb4so454179166b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Sep 2024 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1725263723; x=1725868523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JIYHNVS9jheuQnwK+apksnNMgGOwCb6OieNOcohN6g=;
        b=HSx8Ga3J2afzZ8MHXez4a9uBknR7bStYzQKKeYijDU8VflkvakBRXcV0sNkgM4nk/2
         NYuCwTQ9kVWm5SHuz7ZSZQfX7NSKpanIfXVcctzCfYZ+V4mYkq4UZg5qZUVU1SHYmYV1
         syf53AkO1rl68+tmOBm0QLVqiVuP2SfhbjYUGBbzgXitOyXH8zX8ffldTxqIG0N2G59G
         V6a8i9nmlM5Sdt6Ul6MIwqbKko91L/uttnhYkuZBsgeSBxdS2Ev4jHfg/+eT12IjqxIT
         vLw7pDxZ3vxVJ/zYqTGToevMPsxO/sP+zXHadm1BKiTsuKMQbkMdFn43xcrsVkzeSNNz
         CuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263723; x=1725868523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JIYHNVS9jheuQnwK+apksnNMgGOwCb6OieNOcohN6g=;
        b=ZJQJhDO4MhgtEXLZh6LXrRBt5PrV9BpVwP1na3Mt2vFoj/cFPNGqIhZNq7nNzPrvWt
         abPXebwip0SFKpbl2ZgXuhNd286kBPec26lW0UAEnGcIH0nDfZm24GzmomBrXbxuExt7
         gGkDiGA8u8H251da2o8pUPlNcZIgk7EnlYDGaxCughY0oG6EAiIFrvjOcS69icsUIEO3
         v1VDb3nZSz/7B+IgYnlo/ruUn/dLStmdZd8/zzVQuZXvPGmuDGzq0jTXIdZE25T2jfzE
         D9/XvsOLk+GxoDJS/LvJsrpeRXPFLsHtZtsbjGZG98kas8oLLlXPsteLL9VjyVqMkRut
         fvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl1MQQQhzYiHPc0QW90n5rFFd1AJ97+3vuhiBRiD5AuMXJZJ9syDDTlluYkdTriBiYWCU9X78DiSlfbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlDMoXi6uQQ/t8Iy7PgWZno857G0lv72swRz0sdRlt1KDqyoR
	cALO8nyIAMczXZNo9iqv9yF1tsthAwQBbG+3o3TC+yJf52lsep/T4iCAXGNyEv4RvSU5/D+XuxB
	g
X-Google-Smtp-Source: AGHT+IHBL15hnriVFJ1TgbcdMvsToBtmxxPz1BGIINIqhrU22QhT1uhYESrGqMpOfhrzyXwh+9s0bw==
X-Received: by 2002:a17:907:7e94:b0:a7a:a3f7:389e with SMTP id a640c23a62f3a-a897f78daccmr1087271466b.6.1725263722810;
        Mon, 02 Sep 2024 00:55:22 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989022481sm521076066b.86.2024.09.02.00.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:55:22 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/5] hwmon: pmbus: Implement generic bus access delay
Date: Mon,  2 Sep 2024 09:53:12 +0200
Message-ID: <20240902075319.585656-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some drivers, like the max15301 or zl6100, are intentionally delaying
SMBus communications, to prevent transmission errors. As this is necessary
on additional PMBus compatible devices, implement a generic delay mechanism
in the pmbus core.

Introduces two delay settings in the pmbus_driver_info struct, one applies
to every SMBus transaction and the other is for write transaction only.
Once set by the driver the SMBus traffic, using the generic pmbus access
helpers, is automatically delayed when necessary.

The two settings are:
access_delay:
  - Unit in microseconds
  - Stores the accessed timestamp after every SMBus access
  - Delays when necessary before the next SMBus access

write_delay:
  - Unit in microseconds
  - Stores the written timestamp after a write SMBus access
  - Delays when necessary before the next SMBus access

This allows to drop the custom delay code from the drivers and easily
introduce this feature in additional pmbus drivers.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
Changelog v2:
- Rename pmbus_optional_wait()
- Drop inline keyword
- Use fsleep over usleep

Changelog v3:
- Added changelog

 drivers/hwmon/pmbus/pmbus.h      | 10 ++++
 drivers/hwmon/pmbus/pmbus_core.c | 92 +++++++++++++++++++++++++++++---
 2 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index fb442fae7b3e..5d5dc774187b 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -466,6 +466,16 @@ struct pmbus_driver_info {
 
 	/* custom attributes */
 	const struct attribute_group **groups;
+
+	/*
+	 * Some chips need a little delay between SMBus communication. When
+	 * set, the generic PMBus helper functions will wait if necessary
+	 * to meet this requirement. The access delay is honored after
+	 * every SMBus operation. The write delay is only honored after
+	 * SMBus write operations.
+	 */
+	int access_delay;		/* in microseconds */
+	int write_delay;		/* in microseconds */
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index cb4c65a7f288..0ea6fe7eb17c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -108,6 +109,8 @@ struct pmbus_data {
 
 	int vout_low[PMBUS_PAGES];	/* voltage low margin */
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
+	ktime_t write_time;		/* Last SMBUS write timestamp */
+	ktime_t access_time;		/* Last SMBUS access timestamp */
 };
 
 struct pmbus_debugfs_entry {
@@ -158,6 +161,39 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_set_update, PMBUS);
 
+/* Some chips need a delay between accesses. */
+static void pmbus_wait(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	s64 delta;
+
+	if (info->access_delay) {
+		delta = ktime_us_delta(ktime_get(), data->access_time);
+
+		if (delta < info->access_delay)
+			fsleep(info->access_delay - delta);
+	} else if (info->write_delay) {
+		delta = ktime_us_delta(ktime_get(), data->write_time);
+
+		if (delta < info->write_delay)
+			fsleep(info->write_delay - delta);
+	}
+}
+
+/* Sets the last accessed timestamp for pmbus_wait */
+static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+
+	if (info->access_delay) {
+		data->access_time = ktime_get();
+	} else if (info->write_delay && write_op) {
+		data->write_time = ktime_get();
+	}
+}
+
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -168,11 +204,15 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
 	    data->info->pages > 1 && page != data->currpage) {
+		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		pmbus_update_ts(client, true);
 		if (rv < 0)
 			return rv;
 
+		pmbus_wait(client);
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		pmbus_update_ts(client, false);
 		if (rv < 0)
 			return rv;
 
@@ -183,8 +223,10 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (data->info->phases[page] && data->currphase != phase &&
 	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
+		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
+		pmbus_update_ts(client, true);
 		if (rv)
 			return rv;
 	}
@@ -202,7 +244,11 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_write_byte(client, value);
+	pmbus_wait(client);
+	rv = i2c_smbus_write_byte(client, value);
+	pmbus_update_ts(client, true);
+
+	return rv;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_write_byte, PMBUS);
 
@@ -233,7 +279,11 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_write_word_data(client, reg, word);
+	pmbus_wait(client);
+	rv = i2c_smbus_write_word_data(client, reg, word);
+	pmbus_update_ts(client, true);
+
+	return rv;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_write_word_data, PMBUS);
 
@@ -351,7 +401,11 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_read_word_data(client, reg);
+	pmbus_wait(client);
+	rv = i2c_smbus_read_word_data(client, reg);
+	pmbus_update_ts(client, false);
+
+	return rv;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_read_word_data, PMBUS);
 
@@ -410,7 +464,11 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_read_byte_data(client, reg);
+	pmbus_wait(client);
+	rv = i2c_smbus_read_byte_data(client, reg);
+	pmbus_update_ts(client, false);
+
+	return rv;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_read_byte_data, PMBUS);
 
@@ -422,7 +480,11 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_write_byte_data(client, reg, value);
+	pmbus_wait(client);
+	rv = i2c_smbus_write_byte_data(client, reg, value);
+	pmbus_update_ts(client, true);
+
+	return rv;
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
 
@@ -454,7 +516,11 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 	if (rv < 0)
 		return rv;
 
-	return i2c_smbus_read_block_data(client, reg, data_buf);
+	pmbus_wait(client);
+	rv = i2c_smbus_read_block_data(client, reg, data_buf);
+	pmbus_update_ts(client, false);
+
+	return rv;
 }
 
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
@@ -2450,9 +2516,11 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	data.block[1] = attr->reg;
 	data.block[2] = 0x01;
 
+	pmbus_wait(client);
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
+	pmbus_update_ts(client, true);
 
 	if (rv < 0)
 		return rv;
@@ -2604,7 +2672,10 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 
 	/* Enable PEC if the controller and bus supports it */
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
+		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
+		pmbus_update_ts(client, false);
+
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
 				client->flags |= I2C_CLIENT_PEC;
@@ -2617,10 +2688,16 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * Bail out if both registers are not supported.
 	 */
 	data->read_status = pmbus_read_status_word;
+	pmbus_wait(client);
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	pmbus_update_ts(client, false);
+
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
+		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
+		pmbus_update_ts(client, false);
+
 		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
 			return -ENODEV;
@@ -2635,7 +2712,10 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * limit registers need to be disabled.
 	 */
 	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
+		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
+		pmbus_update_ts(client, false);
+
 		if (ret > 0 && (ret & PB_WP_ANY))
 			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
 	}
-- 
2.45.2

