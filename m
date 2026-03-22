Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38411F4C8C
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774198312; cv=none; b=Exz5WdiB/MA+TZzQzFfai+hcHfXI7Xgy2wvPC0G+TU5EFNZ22n86YD5V60rxWHBW3A180liQsAXe8h1Gmiq+FKslBcot7g39PBgPEviQLIjJh8tqBRCBjeMbQDu3FbtFhxOKnuVtJh7phV6I+LoYatDwtNZm8voLRiHUSGxUGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774198312; c=relaxed/simple;
	bh=GFsJaEZRJsXHJew0m2L8SGuHxoRTuL1UoBeIMY35GcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieizmIOM7ClGajQB+UBKpjDclafg6ZdlhsTSZHYmlDbQ5ChIxGGH+Ep9YkWwG2bNR1uYZ4tAxqTmxIctbLRYuAZP75gHs29msFlzwRTB+Z1Ix57tyrNIYggyOAcxovPHutmOSBdB/+djtis7+yUDdp32XQMey3HX5J7RRVTl02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goYTqzSa; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goYTqzSa"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c74280e3468so787114a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774198310; x=1774803110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JhG6AhRZObxC+dghkR1duoQLuJPWu90J8NmBJgQIEYE=;
        b=goYTqzSakAGS4JrMX1HfZ49lOaGHoFo9D6/uxP7xMhgqDQVnas4fnTGZtC+fsaEVGo
         Uaew08Vm23KdsNw29imctFqOSgdf9IPyUx8KO5rdR6f3o/LdEsFzGT+rgS5l/SwatdpZ
         Km0sZrtQ9xNbqZJXjaYFgGCqI7B+bfa6XXDvTgpCgrGZyc9Lgu+97+6ftMa/noPkx39B
         ++zjpbbxssCXtE80DQEeDvuOClTmWPi3Qo4qu7ONQtgewyXU3jm0ZWl7hUMOjQTK212a
         hiqFKA1d0Q0WiDuVFi8oybESxmFPx2/y8xlAEjRgL0WN6uxK89NlOUSn5LVqu9aovh5p
         vVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774198310; x=1774803110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhG6AhRZObxC+dghkR1duoQLuJPWu90J8NmBJgQIEYE=;
        b=oJc8LSBLonPyiTOUT86nUwW5zwSisH186XLc5Ruva/OdStXy8WO+xP61mQPeJyO7DG
         XFhz3zgAdaPEqPV7X8aYzva5LmTX/Z6lmwQHhK8wPFYFxgJ/snLNTdIEAy/YUnowghsq
         XDss4oSVo6+kGA8bvQultFhPzYqa04wV3qX3Qt7HP6uqVYZ1Qn6a1ekk2/GUsSKkcKzT
         NJLdP8JjJm5ymumcxtFcmkD8AmmLJ/k+rTsrg/xSBHT06Xsmne8Jjui5ztfcPeQMkMpU
         6yRjcZKSZ1GQ5/K7qcXNYYIfb/n1rAn1v2fbGZ3qEiGzuBiE/HoQFclyRVfxuDYc6RuN
         hcJg==
X-Gm-Message-State: AOJu0YxG3ji2Mc9HP49FBeA/6NjhJLJsVY9+QSsxQIZWW51HE8P1NQr7
	V7nN1ovGNG2zxgI1qeUihvlQN15uMY80luWGcp/mmPooPemA2NJQz5ECB+aiOQ==
X-Gm-Gg: ATEYQzx/L11KXPqPa6OP+CS5YZz+D67kuRi5SNg3iTC+UDY38a+FKVpreVhq/SIPDvV
	rvIck5IVHgfR4QYahUjbgJjl2trgrXd/C6gOj/2VjaNoK6Z0VB6wXAZfAGGFHk6wv3CgimKRH7N
	lieHmIFuXolkJUagEX8fO69HM08s9SBuGgEKZdn8xfdkxG3LGR6LSMtgBy800otF+zrmqnhhfLe
	/KJh1l9e7yzXs5EZFDrFVhV0ctAnWyvYSMr6E8H9YQmzO4dlBGDv0mR+t0/QBhMEAY0SbNyYnbI
	0oQtP/m+cEU9mU3cwr5HaVx+6hd0Nj7hmpjkjKnbjjI2pyKMwjGJsCzZTZGaHDnA2hgfZoY1CFk
	IPxVpZwGRy55IAPxcQheebW+dcDoTHsnPmpqLtrRxV2l+ZEzo7uRFggZZSQwm4XyhR053pcGg7B
	8vXsQUl9qsRZ5utniu0cVy7IWG5h2u99VbmVah
X-Received: by 2002:a05:6a21:e081:b0:398:a060:a97b with SMTP id adf61e73a8af0-39bce9b4c26mr8353811637.1.1774198310000;
        Sun, 22 Mar 2026 09:51:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c744aa0bbdcsm5362238a12.32.2026.03.22.09.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:51:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sanman Pradhan <psanman@juniper.net>
Subject: [RFT v2 PATCH] hwmon: (pmbus/core) Protect regulator operations with mutex
Date: Sun, 22 Mar 2026 09:51:47 -0700
Message-ID: <20260322165147.1534364-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator operations pmbus_regulator_get_voltage(),
pmbus_regulator_set_voltage(), and pmbus_regulator_list_voltage()
access PMBus registers and shared data but were not protected by
the update_lock mutex. This could lead to race conditions.

However, adding mutex protection directly to these functions causes
a deadlock because pmbus_regulator_notify() (which calls
regulator_notifier_call_chain()) is often called with the mutex
already held (e.g., from pmbus_fault_handler()). If a regulator
callback then calls one of the now-protected voltage functions,
it will attempt to acquire the same mutex.

Rework pmbus_regulator_notify() to utilize a worker function to
send notifications outside of the mutex protection. Events are
stored as atomics in a per-page bitmask and processed by the worker.

Initialize the worker and its associated data during regulator
registration, and ensure it is cancelled on device removal using
devm_add_action_or_reset().

While at it, remove the unnecessary include of linux/of.h.

Cc: Sanman Pradhan <psanman@juniper.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Reorder new code to actually compile (sorry ;-)

 drivers/hwmon/pmbus/pmbus_core.c | 114 ++++++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..acd255864e88 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2012 Guenter Roeck
  */
 
+#include <linux/atomic.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dcache.h>
@@ -21,8 +22,8 @@
 #include <linux/pmbus.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
-#include <linux/of.h>
 #include <linux/thermal.h>
+#include <linux/workqueue.h>
 #include "pmbus.h"
 
 /*
@@ -112,6 +113,11 @@ struct pmbus_data {
 
 	struct mutex update_lock;
 
+#if IS_ENABLED(CONFIG_REGULATOR)
+	atomic_t regulator_events[PMBUS_PAGES];
+	struct work_struct regulator_notify_work;
+#endif
+
 	bool has_status_word;		/* device uses STATUS_WORD register */
 	int (*read_status)(struct i2c_client *client, int page);
 
@@ -3176,12 +3182,19 @@ static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
 		.class = PSC_VOLTAGE_OUT,
 		.convert = true,
 	};
+	int ret;
 
+	mutex_lock(&data->update_lock);
 	s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);
-	if (s.data < 0)
-		return s.data;
+	if (s.data < 0) {
+		ret = s.data;
+		goto unlock;
+	}
 
-	return (int)pmbus_reg2data(data, &s) * 1000; /* unit is uV */
+	ret = (int)pmbus_reg2data(data, &s) * 1000; /* unit is uV */
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
@@ -3198,16 +3211,22 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 	};
 	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
 	int low, high;
+	int ret;
 
 	*selector = 0;
 
+	mutex_lock(&data->update_lock);
 	low = pmbus_regulator_get_low_margin(client, s.page);
-	if (low < 0)
-		return low;
+	if (low < 0) {
+		ret = low;
+		goto unlock;
+	}
 
 	high = pmbus_regulator_get_high_margin(client, s.page);
-	if (high < 0)
-		return high;
+	if (high < 0) {
+		ret = high;
+		goto unlock;
+	}
 
 	/* Make sure we are within margins */
 	if (low > val)
@@ -3217,7 +3236,10 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 
 	val = pmbus_data2reg(data, &s, val);
 
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
@@ -3227,6 +3249,7 @@ static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int val, low, high;
+	int ret;
 
 	if (data->flags & PMBUS_VOUT_PROTECTED)
 		return 0;
@@ -3239,18 +3262,29 @@ static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
 	val = DIV_ROUND_CLOSEST(rdev->desc->min_uV +
 				(rdev->desc->uV_step * selector), 1000); /* convert to mV */
 
+	mutex_lock(&data->update_lock);
+
 	low = pmbus_regulator_get_low_margin(client, rdev_get_id(rdev));
-	if (low < 0)
-		return low;
+	if (low < 0) {
+		ret = low;
+		goto unlock;
+	}
 
 	high = pmbus_regulator_get_high_margin(client, rdev_get_id(rdev));
-	if (high < 0)
-		return high;
+	if (high < 0) {
+		ret = high;
+		goto unlock;
+	}
 
-	if (val >= low && val <= high)
-		return val * 1000; /* unit is uV */
+	if (val >= low && val <= high) {
+		ret = val * 1000; /* unit is uV */
+		goto unlock;
+	}
 
-	return 0;
+	ret = 0;
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 const struct regulator_ops pmbus_regulator_ops = {
@@ -3281,12 +3315,42 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, "PMBUS");
 
+static void pmbus_regulator_notify_work_cancel(void *data)
+{
+	struct pmbus_data *pdata = data;
+
+	cancel_work_sync(&pdata->regulator_notify_work);
+}
+
+static void pmbus_regulator_notify_worker(struct work_struct *work)
+{
+	struct pmbus_data *data =
+		container_of(work, struct pmbus_data, regulator_notify_work);
+	int i, j;
+
+	for (i = 0; i < data->info->pages; i++) {
+		int event;
+
+		event = atomic_xchg(&data->regulator_events[i], 0);
+		if (!event)
+			continue;
+
+		for (j = 0; j < data->info->num_regulators; j++) {
+			if (i == rdev_get_id(data->rdevs[j])) {
+				regulator_notifier_call_chain(data->rdevs[j],
+							      event, NULL);
+				break;
+			}
+		}
+	}
+}
+
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
 	struct device *dev = data->dev;
 	const struct pmbus_driver_info *info = data->info;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
-	int i;
+	int i, ret;
 
 	data->rdevs = devm_kzalloc(dev, sizeof(struct regulator_dev *) * info->num_regulators,
 				   GFP_KERNEL);
@@ -3310,19 +3374,19 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 					     info->reg_desc[i].name);
 	}
 
+	INIT_WORK(&data->regulator_notify_work, pmbus_regulator_notify_worker);
+
+	ret = devm_add_action_or_reset(dev, pmbus_regulator_notify_work_cancel, data);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
 static void pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 {
-	int j;
-
-	for (j = 0; j < data->info->num_regulators; j++) {
-		if (page == rdev_get_id(data->rdevs[j])) {
-			regulator_notifier_call_chain(data->rdevs[j], event, NULL);
-			break;
-		}
-	}
+	atomic_or(event, &data->regulator_events[page]);
+	schedule_work(&data->regulator_notify_work);
 }
 #else
 static int pmbus_regulator_register(struct pmbus_data *data)
-- 
2.45.2

