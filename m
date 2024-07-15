Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEC6FC6
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028676; cv=none; b=n6I9plMtTb3H9u6aor6YSUSulnzFrHbRmzw/e+SyNJLgKjQB+/27fKiGt7WK6Kcqr0QJhp57Fp0kqLzUq9tDJe+cXmQu7xiJc8mNErNCGS4R/Gt6AanvBq2PJF1V4s5Egx4R6JIiOBvt3869PUdYm3JcHwv1jsBWdG6vFGhgUWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028676; c=relaxed/simple;
	bh=Ou50GOAWw2kdAQfyu9TdIvfhc9Mn+WHegspwL46p4os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gkpii2B6Tt97Rx9tLTny5gK0qy6Ze2Jp1scBZV8kSrTx+3Xyx2VZU0cLXHkzTuI5qb9ETLo7fS0FA825FfYjQrJMChm9qhjE/IwUnVZDBMwE+AJHZN70FDNKzQr2CxGEEMP6i2XlxY3aXzAeRITtvYBpHkC51SnIfiv46I4lHOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=XHqCVNGo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="XHqCVNGo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso6188290a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1721028671; x=1721633471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hIgbkIgpuhUUTyEP4yU6UO9nNgxyTbzBP+NM20P/uqs=;
        b=XHqCVNGoudZ+dIkKSuRmt8SPnmCQa5BD3Hko6ab21iD8oeyPk/JdoTwxu1R1r7ASb9
         QrghwC3EoIwxojxDAs1NUJliwpPFD7JfAkmOAdTPQ2RlQFiSKWwbZd0m2UsKxk5veyzy
         SxuKPl9iHNfFzYzgVXwycBMwBqWtOM5oVWfyhB36JY6Gs9ylA3H0e3aPUBvWU2HKDof7
         5zy5cLspb3PbUv9doQa/7xWTBblAwZn3prR3l4bPCIexaBlcVxWoYp/pNX5DrlXu+LPJ
         hAkNXcjMKUd+9aos9H6D87SIMFDlrQUx6oCgfJVZOOBnFhic76TdRdC/r/8yYCuE/XBQ
         K8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721028671; x=1721633471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIgbkIgpuhUUTyEP4yU6UO9nNgxyTbzBP+NM20P/uqs=;
        b=jbcYyz1lF79LXGNJVlYO5CwHIhN8T0Rgr+Ne9u5kzoTDUWxRG6jMsInJuG5neJdalY
         YN76yGxy+NCOiDXrQnlHLWZGtofLRvnn2/DyhXjwSV3+I8Fr6eKHg7iSdX8qQS0DqVNG
         uolJaYV10Q2hxN+/gSxWIJSHhYR96E3Y32HR00XziDC8hQyBYEhcvpDm+em2um0t7sCR
         O4adR1xXUDpyXQUoxwMxE0mkmuqs5/y0Jq4HmPgrQFEUeQkDEujmgyujFcTen4IAJ/Ti
         1rpwOeDszEYM8s6vtTjNtylNqw94DafqBZRMNXThe63+sfiSvuh5aXP8WA78LL7Mraks
         6N2g==
X-Forwarded-Encrypted: i=1; AJvYcCV8Hil60wDOkIxYsdK07HD8+YmUN43yDlgxeaoGoz7TJtAqpHypS97KPvGbZsX9FLr4VApUfZut1NIqudQoNoe8qN1bZZxdnu/+tLg=
X-Gm-Message-State: AOJu0YxrKoqvl1kx93PI4bFYPm64rOz/egF4MkRPWMQeCmSJyCYYnVtf
	/bC39jilna3lFkPbVybHGm99bO+zR9LZwcNH62SW171nUwUGpwNTIkEXFX3FvvX7trvcQFuOe5U
	u
X-Google-Smtp-Source: AGHT+IGxC2zo0wtaKuXtCJ6xzHcnTfen2wLQKORuc10rLBVJ/vL0HT7CauszKyAP6RYeVaxOw/kDVg==
X-Received: by 2002:aa7:d98f:0:b0:57d:105c:c40c with SMTP id 4fb4d7f45d1cf-594bb67e9e9mr10785917a12.24.1721028671165;
        Mon, 15 Jul 2024 00:31:11 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59cf7763236sm1274023a12.12.2024.07.15.00.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 00:31:10 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/5] hwmon: pmbus: Implement generic bus access delay
Date: Mon, 15 Jul 2024 09:30:58 +0200
Message-ID: <20240715073105.594221-1-patrick.rudolph@9elements.com>
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
index cb4c65a7f288..5cb093c898a1 100644
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
+static inline void pmbus_optional_wait(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	s64 delta;
+
+	if (info->access_delay) {
+		delta = ktime_us_delta(ktime_get(), data->access_time);
+
+		if (delta < info->access_delay)
+			udelay(info->access_delay - delta);
+	} else if (info->write_delay) {
+		delta = ktime_us_delta(ktime_get(), data->write_time);
+
+		if (delta < info->write_delay)
+			udelay(info->write_delay - delta);
+	}
+}
+
+/* Sets the last accessed timestamp for pmbus_optional_wait */
+static inline void pmbus_update_ts(struct i2c_client *client, bool write_op)
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
+		pmbus_optional_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		pmbus_update_ts(client, true);
 		if (rv < 0)
 			return rv;
 
+		pmbus_optional_wait(client);
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		pmbus_update_ts(client, false);
 		if (rv < 0)
 			return rv;
 
@@ -183,8 +223,10 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (data->info->phases[page] && data->currphase != phase &&
 	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
+		pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
+	rv = i2c_smbus_read_block_data(client, reg, data_buf);
+	pmbus_update_ts(client, false);
+
+	return rv;
 }
 
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
@@ -2450,9 +2516,11 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	data.block[1] = attr->reg;
 	data.block[2] = 0x01;
 
+	pmbus_optional_wait(client);
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
+	pmbus_update_ts(client, false);
 
 	if (rv < 0)
 		return rv;
@@ -2604,7 +2672,10 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 
 	/* Enable PEC if the controller and bus supports it */
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
+		pmbus_optional_wait(client);
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
+	pmbus_optional_wait(client);
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	pmbus_update_ts(client, false);
+
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
+		pmbus_optional_wait(client);
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
+		pmbus_optional_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
+		pmbus_update_ts(client, false);
+
 		if (ret > 0 && (ret & PB_WP_ANY))
 			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
 	}
-- 
2.45.2

