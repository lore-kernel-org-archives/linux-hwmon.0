Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82473043DB
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462603; cv=none; b=lRN1ZziqX1awAceSlluhTls66vqeWc7m2wGPQayIiKAwXPs/djHik4y5zxwRMvMESm90eebo+PNe+m1agTZO9QrAs1RcFxsBY5nbwy9jZq62utOIag50Jcbh/6a8wFnMy0PnU+/Vd2QNxXwRCsVvqcaT5sNNtPXdr3R7uRU+6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462603; c=relaxed/simple;
	bh=SBrcbZLVMuvQwzzWc/Owpyd+ige85+VDQuwawa67rJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRono6lFGPR9VWP2hPfAMW+DZIkEyzeZONUZCMIYUBB0euYUpXOJZfotNCFoUWznPfGxrD0aAP2E0azNkMrlIEBjIZhTRbxIBmE1Cybz6p/RLJGdv76cg5LhCxQ6uaYUST0v0RunpnEUwyLplnTcgN71ZU9vRVDWp+Wb74q0gIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/s8Ev3Y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/s8Ev3Y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad4d639db3so666015ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462600; x=1775067400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arDI25C3s7Te1RnvPw+t3hcyia2leXrFlptDbZN6L9A=;
        b=E/s8Ev3YXX7DVtLoAi+/KSfmzuaXhtgJ4txPrqCoPqOp4bTbk2q5HcW04nbGaZXQfu
         1U6sQkb68WapxigFB+1ovdItWG5LTE1OJavgSMkl3NYnV0jQC+wYHMtQt1lfR14mPo6o
         iWgbUITplvUBaA5ub1Btmocjrvksbh7Jory+js9lVfx+qXZ7FBUbP7OPr0bUXc5YUbZA
         HF4XuA+uCTZJkIwBVMDnCNwmTiTdkjuElmgvyp7ukntd30o5xzwC7GN0U2TINTM7BAwr
         2cR/ekHNRl8732mRH3f8oq/qFcilafpFsMldPaumPWQrLw1ZP7Fu8L0pSwGIFPBzC21Z
         3z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462600; x=1775067400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=arDI25C3s7Te1RnvPw+t3hcyia2leXrFlptDbZN6L9A=;
        b=DGzx8dMUKS1d99/5HPYlp4O8rfGuYvK/CXVWPq7URNF2alTyClRLDQJ+17nBIdQBOf
         lfGoJ9yzU248mkHoJtWIB3pnBnh/mB0sxsbgzZlOir18Vdc7axMcD/aqvtjyO5+1uIek
         JKCD1/njfiXISaKDEAj+0LqMxCtfooXe2ZQNuJBglbRsBiUg2zTJZcp/GBKjS6cNR4vC
         DsEFy+Toi3dyj+L9yBo0bKSS76fScAjtf2JfVj32Ld2JvB3wfpaBwrkC/VEM/lrRHrP1
         vKC2YPVNZ5bn5uLN42lB0WQzQxbOKXkI0TrHsXjQmHg1vjr2sbkTlef4mLkK+vOYB5xl
         4EbA==
X-Gm-Message-State: AOJu0YxA/+ZIiMOuBl4Syzn78iQVx1NKC0vdcBI9zFMjL0MZzPug15+P
	AeATqtJP44+iH5S4MaIc6b3/wWTvtuu6hLTmtqwyliclCwX8PQY7nqJPnppiJg==
X-Gm-Gg: ATEYQzx0yfZJ+QU9R1BSIYgxvoxOEBOrAxshU/F22ZS1cwuDo5kax62SIZgttT3o5rg
	8G+nSQT9ygJkQ4zVynhiTBtOBQr9xKpgh7/TiJv/p0QAZ0IGn4ATbDz9/1cXjAAo8RI/GjDIV+1
	AAoEJni23wdSO9kLWqrxnjkOVn98uy+TWpcchy4AnKTy17totW698Tyii49bjynyB0byHUVPfb8
	b7tFaRPfjL1u8TVGaOavAINe0R9QsyRs9Y0rouJFfxKAaDnj4lQWyTpf8VzbCUMbtyBd0LQrsZ5
	eLJdYRJnXF1cPVgiVbKnxgOUtEqeGiKj0tlHbna2ui2vb1jOx7HzAHdu0RJupLJ5DfCTuStqEJJ
	nMO+TsDYRx3cgW0/Qpyw606SZq2DDGREscCpVFIz8SGNiV3xEDWHcEuAM2/msFF0iP64YijtYpZ
	F61lEDBGfqujmehwJdl2KMeQoZ30i6sTTGQm/I
X-Received: by 2002:a17:903:1b24:b0:2ae:a928:f544 with SMTP id d9443c01a7336-2b0b0b0dc2fmr48242755ad.45.1774462600145;
        Wed, 25 Mar 2026 11:16:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm6207045ad.0.2026.03.25.11.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:16:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] hwmon: (pmbus/core) Protect regulator operations with mutex
Date: Wed, 25 Mar 2026 11:16:29 -0700
Message-ID: <20260325181631.17259-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325181631.17259-1-linux@roeck-us.net>
References: <20260325181631.17259-1-linux@roeck-us.net>
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
Fixes: ddbb4db4ced1b ("hwmon: (pmbus) Add regulator support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 114 ++++++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index cbc36f0ba4bf..572be3ebc03d 100644
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
 
@@ -3228,12 +3234,19 @@ static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
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
@@ -3250,16 +3263,22 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
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
@@ -3269,7 +3288,10 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 
 	val = pmbus_data2reg(data, &s, val);
 
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
@@ -3279,6 +3301,7 @@ static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int val, low, high;
+	int ret;
 
 	if (data->flags & PMBUS_VOUT_PROTECTED)
 		return 0;
@@ -3291,18 +3314,29 @@ static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
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
@@ -3333,12 +3367,42 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
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
@@ -3362,19 +3426,19 @@ static int pmbus_regulator_register(struct pmbus_data *data)
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

