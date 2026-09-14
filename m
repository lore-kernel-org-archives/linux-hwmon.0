Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5603C3432
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385944; cv=none; b=ALO545aMs6rpBVqOe3FKd9I+ITLI40PVAbYux+A7cyEqh2ppo6phJteq6M3eulJ1xpfjuXNMek5dAbIEsDlFkTuzvt0wYtvIwbUaJPM/RrXZRujnkFawHIDZ8KblHI1Ae+D6wvgHHYHMcY66kDDzcOND6vipWLEkJxjgw5P9yT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385944; c=relaxed/simple;
	bh=nzaw1ZAmtOROpgCKmG5DjRksvIPCMA3GYz9v8u/qerU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l9dDGr7ocjN+ekqAgcxAPWu1VVICUIkDXdj/tSp2IaXuIhccfnSOa9nAjqLFNnWzgg8PZVcvl320Goj17H26UZ1wHv3QR5fge1gfiQfBkESn73JwkyyRjp2Z/x47F6rHx5DDgQ3UPILr/4g9N/5WTbQweQiJ4KFvi13CapOU62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/roNM34; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/roNM34"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so449556a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385942; x=1789990742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbek3cNhmINKfcKEFQeZ34orcON/ITUbplZKcMIGouo=;
        b=L/roNM34BUUAjtnQP7Pk7v53dwOAxM1rBAP6bQ9UgN5YRxOcDVmoKV0/bzVxpOwsp0
         Thx3DYQascfxtKkbqXPiIOlTWSS2/2pxvxbtdHJQ4gKhnXId5FKvxpNnlCRKgDrqdqNJ
         GSjDxrY+KSnxGONtsRh0FzQ/oOUoxqcoYV85d2n0QMubu39LzKK7aaOzXiUxfsrvGQwk
         H04j7JjpgIsQ2tYNrZsnfC5/GrjYv7BHtsMyHspBZKXoX/gJeIHpjw469DqrQfZdLebQ
         dSz+lVVgYJJAaySp7zq95xF0JxPgAutoS3PiSmlmkpCV99dhP11idLAaUGaQ+w12EuQ5
         6pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385942; x=1789990742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbek3cNhmINKfcKEFQeZ34orcON/ITUbplZKcMIGouo=;
        b=O4nhh58bxSbTKFu4xsxMTgZ1ZQ0Se/c5GmsFVGA03fJ19YLPrfmzpMgbx9TE9IDYZX
         07pyipogQwLYzYvYZOBgI6ZEHumEqGrDRsBjMTzJveRUpO41AaXssjhjyRJe0JM9NDOo
         n/DYPuOfyuuLLO6ZwYGzrS/88FKcqywF7Y/DWwavU6bI8W/jJFfJjhbgvjgtWQjnQYRe
         DyXW8chytM1Fvrvv8fr/NmcKwuP78pr/yQ9pDZX/vqyTo7L/W6U2vDoTWzeUrOb76te5
         Gawx54iKM8VLKtrhTQh9BBPEbDT0htmvXqTKnOfd9J/hMrKyJUi2i2TYt5lcyqW70kZM
         AP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmZAXGFEBCkfI+r+MUF6rDg33dzOwJs3zXIGD8ZiK1vH6GtH4W21FGoMlKiyr293aQ6AS81Mzuv1vrdg==@vger.kernel.org
X-Gm-Message-State: AFuF++nByLEEj+iwUwMnurmx6ZiUoe1K6uXLePKRMeDLQm2XOXjaMQQc
	x2fG3Pd0j/zfS+GypHTn0CkIhDGHP1egVEs/nts4WcAyTlr7Vaz6J16W
X-Gm-Gg: AYBFou2UvFgWiYCaG7t71aKY7cwXLJHRoiXR0VBqDs4XM3EBOHCtEbQ1y+xXekoUu3J
	Av0PxOAw972rpUe2tO+QbADB/jR2lVJ2C/TEP6H9TNXhvQLl75lKoZTf/qtp9WaKfty6n4JdcAN
	1FFOIzLj+t3FA3i11HzObOvqUMVYrVe1HRPRoRjY3pMvIGnQVs7CnEGRlNTHkL46rbBvMlFX4hy
	8ngGmD6b0+3zifgAO98Z3Eis7yUnx1mHxAOc4ngrQHNB9tlgApN1kV4qSv5tm5WFcIl0ZtLUS6O
	LKmJGnOdfe7q9g/3Z/62eYDhNHe7XdJHKFCffpK+Dnq4TO7JiRaSvnEUx1ZsWrGXbR4/BF/FBHl
	DsHNpDXZDzLWzxJWJ/tuKeu93pCsx3VCiggkk0HnJG1YqEYsysN4Vc+7JnQdd6zNnK55mbA8ay9
	krw3cM4MLYVD4PfsHFflAyPylUKlXmY0pytWxjNz6Gxo51SPmC3QNpC8O6G1xxM0gona1NhWPf2
	BOPbw5+jO4yz2Of
X-Received: by 2002:a17:90b:4c0a:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39dec4e1a4emr2279547a91.13.1789385941910;
        Mon, 14 Sep 2026 04:39:01 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994d8af1sm21910095a91.11.2026.09.14.04.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:39:01 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Mon, 14 Sep 2026 18:38:56 +0700
Message-Id: <20260914113856.1987128-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally in probe, but its devm cleanup
is only registered when control GPIOs are present, so alarm-only fans
never get pm_runtime_disable() on unbind.

v2's fix moved pm_runtime_enable() earlier and opened a sysfs race; v3
fixed that. Guenter asked this version also close the other two PM
issues Sashiko found: a pm_enabled guard so an early probe failure
can't drop a PM ref that was never taken, and a lock around the
enable-and-check block so a racing sysfs write can't double-take one.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260901111903.660681-1-congnt264@gmail.com
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v4:
- Covers the other 2 PM findings Guenter asked for: pm_enabled guard
  on gpio_fan_stop(), and a lock around the enable-and-check block.

 drivers/hwmon/gpio-fan.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..93dd685c4fa5 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -46,6 +46,7 @@ struct gpio_fan_data {
 	struct gpio_desc	*alarm_gpio;
 	struct work_struct	alarm_work;
 	struct regulator	*supply;
+	bool			pm_enabled;
 };
 
 /*
@@ -522,10 +523,21 @@ static void gpio_fan_stop(void *data)
 	struct gpio_fan_data *fan_data = data;
 
 	mutex_lock(&fan_data->lock);
-	set_fan_speed(data, 0);
+	/* set_fan_speed(0) drops a PM ref; only valid once PM is enabled. */
+	if (fan_data->pm_enabled)
+		set_fan_speed(data, 0);
+	else
+		__set_fan_ctrl(fan_data, fan_data->speed[0].ctrl_val);
 	mutex_unlock(&fan_data->lock);
+}
 
-	pm_runtime_disable(fan_data->dev);
+static void gpio_fan_pm_runtime_disable(void *data)
+{
+	struct gpio_fan_data *fan_data = data;
+
+	/* Registered before pm_runtime_enable() runs; skip if it never did. */
+	if (fan_data->pm_enabled)
+		pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -553,6 +565,11 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
 				     "Failed to get fan-supply");
 
+	/* Register before gpio_fan_stop() so LIFO teardown runs that first. */
+	err = devm_add_action_or_reset(dev, gpio_fan_pm_runtime_disable, fan_data);
+	if (err)
+		return err;
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -580,16 +597,22 @@ static int gpio_fan_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	/* Lock so a racing sysfs write can't double-take a PM ref here. */
+	mutex_lock(&fan_data->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
+	fan_data->pm_enabled = true;
 	/* If current GPIO state is active, mark RPM as active as well */
 	if (fan_data->speed_index > 0) {
 		int ret;
 
 		ret = pm_runtime_resume_and_get(&pdev->dev);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&fan_data->lock);
 			return ret;
+		}
 	}
+	mutex_unlock(&fan_data->lock);
 
 	/* Optional cooling device register for Device tree platforms */
 	fan_data->cdev = devm_thermal_of_child_cooling_device_register(dev, np,
-- 
2.25.1

