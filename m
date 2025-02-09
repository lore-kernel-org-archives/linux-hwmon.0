Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597824338C
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Feb 2025 01:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064979; cv=none; b=aYyhXLm9A4Kh845r/YtzJLGsN0gRlEKalngZp25mQt1RQrpe9PGV1q3L6TWjzRajJIkXS9zFnUeLBltP48OIPRLbYd2y/C1Le19QsTOrXyiu3ZA0/R6c0iC5CXTlXsWdmfn6BQE5QzYH1uHgbynuQZqkVCXfFvwXAkMhaJdkgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064979; c=relaxed/simple;
	bh=SX5uCrafWaBsuabZRx2S5/jJXvmDVAPwbmy2KTJkbSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lT2y/jv7DlOplpOkALw2C7S1M4aXQ0TjSDBkHhjOqY87j7zxBtSvdkajotovzZLxmzle3L+I4RA73wTNoyMW9Yg+Nazg5/himfaleTC7YTooaEVgXsOYB9dAYtd0HZtOE5ZHcEktVro0QRCWVfLIiEPaywY1jqJMOZLmVTSnGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ony7kWQp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ony7kWQp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa51743d80so741308a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Feb 2025 17:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064976; x=1739669776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvWS+O+VD32dJVGmxwjPRz5m+lyiG8WkSczuxgGqpfk=;
        b=Ony7kWQp29vySOeORweEaRAftUHXYPJ3DOkdtuzwaaMGmQOKss/HMSbfQmtMvwXXxT
         WXHFZlrZj9kE0v68RcuUGQr0BkWkDekh9hTT2uj1v3hXN3Zp6p5S/nbFGIvHucRF6UEX
         23gBNmXZbDrhHD9l3iNSpGMfn4bX57MvybqCSJVODBUiOSRS4xASyvmaGKS/DlmB0Z6G
         2zhXgypBu0rgLH/gZPsEeyVNpZLGsBqRkKKqB3Nb0tPblYTGI/qlqqHAvDIifmjAmccI
         pngOCuue7jn/NMwu3LWMRHyLW+8azBVtfmd44954PctemOn9sRN38+O16d+RHGul8XFu
         quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064976; x=1739669776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nvWS+O+VD32dJVGmxwjPRz5m+lyiG8WkSczuxgGqpfk=;
        b=Yo9fPNU2ChRUuHg4Yt7S7fdHQJaUIdcZ4HWvehLeeOwgZeY4Ud0Y90hwLR83qBgS2j
         3ATICKIa4HvT+T5CTwO6zRUZkJTdaA82EESnc4RYlSgAOgBA5gcz5YJ8AmfU02N/DB7d
         BP1JYaBw2lRKtws/MpwaZXWCY6A/HKyIWN1mOBHQMVkBTnKU7M5ZwGGNDKZf6QH+mR7F
         RZXVVsh5deu4TPU7uLdjUrYnJTYcBfrxVQVoREDf0+ZbqmS9R9MOu5G7tEqFzThHplou
         +IsbKBKzf/u6kAyVlyLwsKepfV0ZKtUzdGGyvioZ87C1Yu3gXN/fPVg5C8R1mNbJdeGN
         NbGA==
X-Gm-Message-State: AOJu0YwpBmO1ZZO8lQBiPaOV4CthLG5+E4FbFUEfcmV36J2/b+rfm5pA
	7uBhcTX8/sp2UOura6kiSpzVxcGVLP9VamecWZbzM8uXIbRzKQHbuPsTvg==
X-Gm-Gg: ASbGnctqJ95Yl2xTS0qVS8W3fDySdHhfh8G9WKdg39qcPJSrcegfxEIKJDgEQ2u8Dm2
	Wsyw4hxEJ5QoCXB5e6OqPY4XgovRZb088zczlemMJX1WvNdEq0HWcMN/x/u8e3rqim8Mzn0Bcdc
	pvDvtsyQ0gG7A9qqUaEwvu0uhkdlBskd0RkbI4CrmYQoSGM5oZeAY8OlLCVFCVymk3zK9eetsvD
	rSkWeJKt3n5khj0vpHPq4jku3+aGaKUiWnkeZD1Eg6qSJ9EhApu3iDYd9S5e76RJ110zKTn/RJf
	rn1umzTQK7e76wxrjNumaAhAMuF1
X-Google-Smtp-Source: AGHT+IF4qkWGd6d+wp1DP3+A4OsdcO6GrotezP5pdA6B1bqyc+3eLlyQKT+UYtxyWu6CftA8JVoMTA==
X-Received: by 2002:a17:90b:38c3:b0:2f7:e201:a8cc with SMTP id 98e67ed59e1d1-2fa2416703fmr15514518a91.18.1739064976217;
        Sat, 08 Feb 2025 17:36:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa099f4fdfsm5852235a91.1.2025.02.08.17.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:36:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/8] hwmon: (pmbus/core) Fix various coding style issues
Date: Sat,  8 Feb 2025 17:26:10 -0800
Message-ID: <20250209012617.944499-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250209012617.944499-1-linux@roeck-us.net>
References: <20250209012617.944499-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports bad multi-line comments, bad multi-line alignments,
missing blank lines after variable declarations, unnecessary empty lines,
unnecessary spaces, and unnecessary braces. Fix most of the reported
problems except for some multi-line alignment problems.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 41 +++++++++++++-------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 787683e83db6..e38d69d723c0 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -44,8 +44,7 @@ struct pmbus_sensor {
 	enum pmbus_sensor_classes class;	/* sensor class */
 	bool update;		/* runtime sensor update needed */
 	bool convert;		/* Whether or not to apply linear/vid/direct */
-	int data;		/* Sensor data.
-				   Negative if there was a read error */
+	int data;		/* Sensor data; negative if there was a read error */
 };
 #define to_pmbus_sensor(_attr) \
 	container_of(_attr, struct pmbus_sensor, attribute)
@@ -192,11 +191,10 @@ static void pmbus_update_ts(struct i2c_client *client, bool write_op)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
 
-	if (info->access_delay) {
+	if (info->access_delay)
 		data->access_time = ktime_get();
-	} else if (info->write_delay && write_op) {
+	else if (info->write_delay && write_op)
 		data->write_time = ktime_get();
-	}
 }
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
@@ -292,7 +290,6 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_write_word_data, "PMBUS");
 
-
 static int pmbus_write_virt_reg(struct i2c_client *client, int page, int reg,
 				u16 word)
 {
@@ -381,14 +378,14 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 	u8 to;
 
 	from = _pmbus_read_byte_data(client, page,
-				    pmbus_fan_config_registers[id]);
+				     pmbus_fan_config_registers[id]);
 	if (from < 0)
 		return from;
 
 	to = (from & ~mask) | (config & mask);
 	if (to != from) {
 		rv = _pmbus_write_byte_data(client, page,
-					   pmbus_fan_config_registers[id], to);
+					    pmbus_fan_config_registers[id], to);
 		if (rv < 0)
 			return rv;
 	}
@@ -563,7 +560,7 @@ static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
 	}
 
 	config = _pmbus_read_byte_data(client, page,
-				      pmbus_fan_config_registers[id]);
+				       pmbus_fan_config_registers[id]);
 	if (config < 0)
 		return config;
 
@@ -788,7 +785,7 @@ static s64 pmbus_reg2data_linear(struct pmbus_data *data,
 
 	if (sensor->class == PSC_VOLTAGE_OUT) {	/* LINEAR16 */
 		exponent = data->exponent[sensor->page];
-		mantissa = (u16) sensor->data;
+		mantissa = (u16)sensor->data;
 	} else {				/* LINEAR11 */
 		exponent = ((s16)sensor->data) >> 11;
 		mantissa = ((s16)((sensor->data & 0x7ff) << 5)) >> 5;
@@ -1173,7 +1170,6 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 		} else {
 			pmbus_clear_fault_page(client, page);
 		}
-
 	}
 	if (s1 && s2) {
 		s64 v1, v2;
@@ -1500,8 +1496,7 @@ struct pmbus_limit_attr {
 	u16 reg;		/* Limit register */
 	u16 sbit;		/* Alarm attribute status bit */
 	bool update;		/* True if register needs updates */
-	bool low;		/* True if low limit; for limits with compare
-				   functions only */
+	bool low;		/* True if low limit; for limits with compare functions only */
 	const char *attr;	/* Attribute name */
 	const char *alarm;	/* Alarm attribute name */
 };
@@ -2212,8 +2207,8 @@ static const u32 pmbus_fan_status_flags[] = {
 
 /* Precondition: FAN_CONFIG_x_y and FAN_COMMAND_x must exist for the fan ID */
 static int pmbus_add_fan_ctrl(struct i2c_client *client,
-		struct pmbus_data *data, int index, int page, int id,
-		u8 config)
+			      struct pmbus_data *data, int index, int page,
+			      int id, u8 config)
 {
 	struct pmbus_sensor *sensor;
 
@@ -2225,7 +2220,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 		return -ENOMEM;
 
 	if (!((data->info->func[page] & PMBUS_HAVE_PWM12) ||
-			(data->info->func[page] & PMBUS_HAVE_PWM34)))
+	      (data->info->func[page] & PMBUS_HAVE_PWM34)))
 		return 0;
 
 	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
@@ -2935,7 +2930,7 @@ static void pmbus_notify(struct pmbus_data *data, int page, int reg, int flags)
 }
 
 static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flags,
-			   unsigned int *event, bool notify)
+			    unsigned int *event, bool notify)
 {
 	int i, status;
 	const struct pmbus_status_category *cat;
@@ -2964,7 +2959,6 @@ static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flag
 
 		if (notify && status)
 			pmbus_notify(data, page, cat->reg, status);
-
 	}
 
 	/*
@@ -3015,7 +3009,6 @@ static int _pmbus_get_flags(struct pmbus_data *data, u8 page, unsigned int *flag
 		*event |= REGULATOR_EVENT_OVER_TEMP_WARN;
 	}
 
-
 	return 0;
 }
 
@@ -3228,7 +3221,7 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
-					 unsigned int selector)
+					unsigned int selector)
 {
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
@@ -3363,8 +3356,8 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 {
 	struct pmbus_data *data = pdata;
 	struct i2c_client *client = to_i2c_client(data->dev);
-
 	int i, status, event;
+
 	mutex_lock(&data->update_lock);
 	for (i = 0; i < data->info->pages; i++) {
 		_pmbus_get_flags(data, i, &status, &event, true);
@@ -3472,7 +3465,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
 			 NULL, "0x%04llx\n");
 
 static ssize_t pmbus_debugfs_mfr_read(struct file *file, char __user *buf,
-				       size_t count, loff_t *ppos)
+				      size_t count, loff_t *ppos)
 {
 	int rc;
 	struct pmbus_debugfs_entry *entry = file->private_data;
@@ -3800,8 +3793,8 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 
 	data->groups[0] = &data->group;
 	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
-	data->hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-					name, data, data->groups);
+	data->hwmon_dev = devm_hwmon_device_register_with_groups(dev, name,
+								 data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
 		dev_err(dev, "Failed to register hwmon device\n");
 		return PTR_ERR(data->hwmon_dev);
-- 
2.45.2

