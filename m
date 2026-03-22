Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055635E95F
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197254; cv=none; b=fCg8/lczNqmXcHTaBqNqgIiu09sFnLvN9ysz4CDOcmyaeZlIkLHi8o8hKCQc2QCwywVOrEd6W2JLcvCzAC+cUIQ5WVt9+BsnVl8EXqFcUj1gEtzKGyhnkLsjwm6w7c0doFhe5wo9H6ZFpn4qJf0HXM3bmwWZ4O8RGIVfAOXWkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197254; c=relaxed/simple;
	bh=qNOYVfI3mbuyG8mqvwWtxFBm24Z6R38Th/RXdzXsfuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snm8irU3QeBouy7sb6RyDJ01r0JysqkuvGT5xu9mFEeFU5o/GqKHf3Wz+l7YPDFuFkfXGQ5bZaAqvK/9tqFUdRgreBO4M4PhkkWp3WIBWRs2Zt2o8gch96LKoxSy1MPeUdB12c0aWFjjpnDsFndAVNpb21T2DWsOLDPACUXZ/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhqaOSlk; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhqaOSlk"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c1092cc08cso351790eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774197252; x=1774802052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJhZUFgvtgrG9ysLM9vDRCWJf/E4J1jQMl0z9MMFnT4=;
        b=PhqaOSlkHM+RE+wiRcGmYcKHOI+d8zSSodXcSyitFYa3pDsGkBIgPwLdhlmGGx4+xd
         Q7aQLEAOFuN6FICWhpNHTaMELE7Lo/juT6soa/v4tEnMt4qczDW7ycu/MglXFh0kJBvX
         8Gm/VWW/u0EFNkpJAW0EjjIVEutw4hF03zdT35be2rIBcUKldNdXHgTi4XhZnvrG9q+r
         JO/5mDMnz3ilTveTI/qUN9L2Xe9/8HaFQ8uZYzcDvyY0OKmTnl3V3FEbpxZBu2j09WUc
         xNE1gP7akUBil8X0ksF4Cqdp8xCV8yXJlBzdrpw8i17wq0NhPdbK64iKWwnBz3UJzCfx
         XmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774197252; x=1774802052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJhZUFgvtgrG9ysLM9vDRCWJf/E4J1jQMl0z9MMFnT4=;
        b=cDPVHcvhAyxuJOGpIISMvazYORCexIDL/Oq+QYrBjYpQp8blBVerzk0DwoygWEdMJ2
         hznuQcULwCTUX6NqHxAqj0zATDt4ru+DDNifRjKi/iuNf5K52RdtbBsQILATwrIt4qQG
         TQl9Su5fHtjWnbRyiIvkIaiy0hfee1kbWP2+ublGXTAchbvxtdALfP6c6HVtQD9Om1Ea
         UJ4vvZW/Q5pm2uYQLPdETej4DfUcAo8l1c36rXO2qwjFn0HnICacB4vz6f2XrThk/68p
         IJnrTfAhZfUusOChjKWOdRoTmJJSGqxU5UjQ40VtZpjmyBVHPV+YoG9U6oo9D/g2SQqn
         CWZw==
X-Gm-Message-State: AOJu0YzbhNnUk/DzKROYuRIM7S4jDSfYmX/Xdpoz06n+YZ8ko/fNLMB0
	OG7TCwjhRzlwSklh4O2twxaWjVQ6EN9A33ynFSrfHlM5Aj2ocNv0fFnrAdNmqw==
X-Gm-Gg: ATEYQzyp/w4OkWyFeGAxVbnKYOVBH4W2Euerkk1F1eNm/22cNggRmVy3WLnm5rbgos2
	L8DXaKnQzQmxN4voqB2v4tDIhjw/hdyvy0uzr5+XgNtFX0MBehZcZfpkfBbzHOzws83HNE97ah1
	KN1e8zcXsQsGspPVxBNSexSQOgWzX5P7U660cFCKm7GgVlV2l0tyj2+/10mbiAu7nD7ma9fWv9M
	PTPoNry+e6Hf2mWoazCNmJlhdl8o5aQti2PmtABV14RhQSdxvlZbRVEQUz7mug6g8LX8Vf2dWxG
	YybDIkfOxo0EAjBa3o0U99ZYB2Ks69WYyj751yZVo/FCgFZv8jzfKR4+xjOY0fPRVpdcJwXvtk1
	o56uO8Hp85O64nt7WsbcR2LjP6dBZ2P6wxCDPORqa/b56PReZluY11JbOgiBXk/d9tfyqUdeHrj
	lVjM5BzEWodm0ylXoWypq+W9W70B3mcDnoT2sg
X-Received: by 2002:a05:7300:572a:b0:2be:e4b:60d2 with SMTP id 5a478bee46e88-2c1095a74e0mr4820047eec.4.1774197251549;
        Sun, 22 Mar 2026 09:34:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2e6c30sm9962808eec.25.2026.03.22.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:34:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sanman Pradhan <psanman@juniper.net>
Subject: [RFT PATCH] hwmon: (pmbus/core) Protect regulator operations with mutex
Date: Sun, 22 Mar 2026 09:34:06 -0700
Message-ID: <20260322163406.1530478-1-linux@roeck-us.net>
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
 drivers/hwmon/pmbus/pmbus_core.c | 114 ++++++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..c349ffd6ea21 100644
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
@@ -3281,12 +3315,19 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, "PMBUS");
 
+static void pmbus_regulator_notify_work_cancel(void *data)
+{
+	struct pmbus_data *pdata = data;
+
+	cancel_work_sync(&pdata->regulator_notify_work);
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
@@ -3310,19 +3351,42 @@ static int pmbus_regulator_register(struct pmbus_data *data)
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

