Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CB124C69D
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289170; cv=none; b=qZc/4N9n5ZbeodT6QxcVYhnEPQUF6D2TT0UGsPt3oeCepNE39Km/4yt4mVv5nSVhJZN46kv7saTIMl8kxPY03J/S8HN19rCLMIT/wFihpQvVb8P66Pjbo9E6LB3nViMJyIq/9eMmZq8N9QpPOoPt7+6eHxMnCEH46w+qUHkRqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289170; c=relaxed/simple;
	bh=R/C7nInydMBonMoq1wniay/G0jiv3raGmg7k23ySHCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLkEHHiFAYbdJUT2+Ngzob/tN7/ZdGu1MJKbzyty/WnVKx745JUMttzQUOu4Dt7YOKSt7bhlyZyvHAvg7mYmristkwDQyDayLKQcALxUkZITbjtYNZZnmbzCoQ0u0Cc9VrLyM2fVwXkWtSq2qgAy8182nzhEDML4tC23D09JJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2DczUTi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2DczUTi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f464b9a27so96735805ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 07:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739289167; x=1739893967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s288qdDCDWo/ulFPMlSq4mZIQlh0lNbhU12uHjB9YbE=;
        b=G2DczUTi16U12W3ypsqKdKixFy1B3rFdDQ1TOPqklhERr51uPB5Ele3sVK+9fP6uls
         JYJRomsLd1oJwrH2lxs5C4ppEim5EhGRmESRXI21Zq3s1f9XV+1zKwwazK8GX972rVGr
         GtXBXfgrOTx+krBOINu2rn6mHNYFa2oNzGag3tPTAZWWg8R8nq/FgLb67neRAwVveuXJ
         6/e/io58P5Zh8lDOcjP2wKL6f46JwXVv0Zoqd1LDextDkyyLJ61SvSauYwVLnFzf/Np/
         E6X5PfBikZS3WO7/BiU28OAF371dnHpn8UYHU8lcHcGQl3NA0HF05/oqjmXZ2iguzL1B
         ywyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289167; x=1739893967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s288qdDCDWo/ulFPMlSq4mZIQlh0lNbhU12uHjB9YbE=;
        b=jZJYbUJ9JREZTEdrhTALnbrH+SxPzUWWhNc5J9SNBp0wp+7FxDW/2HnDFpH9khArE0
         5v0nJ4FAr4E5VMk/FlW+eNBGi5aYafDom9I5FNuDkf54Jf6gWf5JPyiCz2lw7HLtHF3o
         veOmEVupB3WDQjgPQSP8rf/z+aQF9Wit131NC90jUATWhmCeyN3mZXKhUtsTDnrJVmya
         E37kUXw7AE8NXkOBaJ2RwG8mrt1+IohMkSL1kprep6x7JdgTOpCMJr08lVT0OjbdFSt1
         p3NMM3y7cVtgBKiOEzrOnG2SfoiuklckeZOx4oKSi1k78MQ+Ve3TtgyEKk7mswXhYDzl
         8GHw==
X-Gm-Message-State: AOJu0Yzpxry8zv/F0ND2STJFN+LHGoYBuyFu9Yut4mUVpKq+lq7ZkoI9
	TgUa9Xsg1J4Yq+DRhoIha0jilZpyi2bCIuheZS2MxNMeLzV5BOzxcBSlYw==
X-Gm-Gg: ASbGnctAAO+YLfL10N18xzf71sJOVmHkToGJFv6mqqICS+oODApNKecbGwuuIGfcj4y
	WAM+Tf3v5VO7YUT3fWhwSn2Z+IWmZIBeOT4h/otO90KqPNA9injyIPpyX2DxflsTk7uvDyxpvMw
	04xjowBKzWzOfAj7N6S9sxm4tp3q0rqZsqZr7sVdpSqJ6zyG7/ONJPL1c+Eo+OGoa9rvdvTnpoF
	GfOe1GW7p+zEQOjvYEZ6TEOPe3lTE+ImgKIcsJeEMlnSfkSJdPAntsvN8pT2V6nfE/Z+btnFFTC
	bnlRYqr4Pvybxyfk8D9LmgYaUi3j
X-Google-Smtp-Source: AGHT+IFJoajWV7HvBq8MUmCkbJUYyf4HJSYB8F+d7eaJV2ouEQGpZWaQjKiDrqm9UxoaJ++MTiOj0A==
X-Received: by 2002:a05:6a00:3c8a:b0:730:949d:2d2e with SMTP id d2e1a72fcca58-7322a52288emr392474b3a.1.1739289166971;
        Tue, 11 Feb 2025 07:52:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7309569d6e0sm3393736b3a.142.2025.02.11.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:52:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 1/8] hwmon: (pmbus/core) Fix various coding style issues
Date: Tue, 11 Feb 2025 07:52:33 -0800
Message-ID: <20250211155240.2077464-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211155240.2077464-1-linux@roeck-us.net>
References: <20250211155240.2077464-1-linux@roeck-us.net>
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

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added Reviewed-by: tag

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

