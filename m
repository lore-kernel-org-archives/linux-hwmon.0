Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B2EC433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Dec 2020 12:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AFB1229C6
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Dec 2020 12:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgLUM4K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Dec 2020 07:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgLUM4J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Dec 2020 07:56:09 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14EDC0613D3
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Dec 2020 04:55:28 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b26so13875086lff.9
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Dec 2020 04:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9ZCe4Zti/hohJdNTddMURuu5t+LzK7JFhDVAjJ7rT4=;
        b=P5/XXqjdQR+pEGDlLSq4ZSfVI2qL2XlsPjHjogFPZa2xvY/1bxgiKQimerURk7Nkb6
         JNK+flVJz13RczJvirJhxHS1RNakz2L1UuTcberHcyFPj2+VSLgaJprcogTmzGHCov8o
         3EG386/X7Aek8465Lct1NWnd2ii9qOQWGye6/vO6OX/2HLUl93omBoqO80YVeArW/D5A
         3trR114SF/jV2gkIFBsVUtciIpLd4FscOLic0o1VIB1HiJcP9hX/4oMOwapkYyi3J0Tt
         zPas+YqxXVAjzfWBKzeucnTHFHTi2K5xcOumPR+NfWYsmf6R1eSwiLld7WtiZ0jSLQNJ
         ciag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9ZCe4Zti/hohJdNTddMURuu5t+LzK7JFhDVAjJ7rT4=;
        b=dhKsSWgm9E+cOpys+mILQOLT6xZa0W3rl6To0wAZgWPU8s3+SebpoOkZQdJyunm9RX
         jVTCYii5Bf/pYS/Su6PWzyEQ0ua2dozhoc09icdbNgI4K+zeT21h2FXvOq2Uimo0jnTN
         vZkl1Jjk6WSSwvsE7JJKEz38oQajH1k3D+CNq/oHl93dU88iD44C8a2uXICWmmrFD1Nv
         vrCU4i33xWF8yHQNrAgYCWg3OthB5KszmuHlejOmW1aY9/w5xPQVr2u+/DkACdSrIEQq
         at/iqBa056KUykm40S8JfD79XZc8pLYdoPoX7PPyHZT9Cnf59wlBe6es311GtzyK+cjJ
         k3XA==
X-Gm-Message-State: AOAM530sdtXzTCnVXi2Kle7Svq4F0r4NMEs8OEBIsmmAFLsAyQ8W+NVp
        SDXkLL971TjTWl4sJIc1nQejgg==
X-Google-Smtp-Source: ABdhPJyyU0Y01eWBcMJ5YqX/88JeBZuNvwI51o9LzLV5U54AYEGMQcA0yMs0wIGRSmGCySEKuDULCA==
X-Received: by 2002:a19:2256:: with SMTP id i83mr6951072lfi.602.1608555327020;
        Mon, 21 Dec 2020 04:55:27 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id l19sm2220497ljj.87.2020.12.21.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 04:55:26 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hwmon: (abx500): Decomission abx500 driver
Date:   Mon, 21 Dec 2020 13:55:21 +0100
Message-Id: <20201221125521.768082-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This deletes the ABx500 hwmon driver, the only supported
variant being the AB8500.

This driver has been replaced by generic frameworks. By
inspecting the abx500 sysfs files we see that it contains
things such as temp1_max, temp1_max_alarm, temp1_max_hyst,
temp1_max_hyst_alarm, temp1_min, temp1_min_alarm.

It becomes obvious that the abx500.c is a reimplementation
of thermal zones. This is not very strange as the generic
thermal zones were not invented when this driver was merged
so people were rolling their own.

The ab8500.c driver contains conversion tables for handling
a thermistor on ADC channels AUX1 and AUX2.

I managed to replace the functionality of the driver with:

- Activation of the ntc_thermistor.c driver,
  CONFIG_SENSORS_NTC_THERMISTOR
- Activation of thermal zones, CONFIG_THERMAL
- In the device tree, connecting the NTC driver to the
  processed IIO channels from the AB8500 GPADC ADC forming
  two instances of NTC sensors.
- Connecting the two NTC sensors to a "chassis" thermal zone
  in the device tree and setting that to hit the CPU frequency
  at 50 degrees celsius and do a critical shutdown at 70
  degrees celsius, deploying a policy using the sensors.

After talking to the original authors we concluded that the
driver was never properly parameterized in production so
what we now have in the device tree is already puts the
thermistors to better use than what the hwmon driver did.

The two remaining channels for two battery temperatures is
already handled in the charging algorithms but can be
optionally extended to thermal zones as well if we want
these to trigger critical shutdown for the platform.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/ab8500.c | 224 -------------------
 drivers/hwmon/abx500.c | 487 -----------------------------------------
 drivers/hwmon/abx500.h |  69 ------
 3 files changed, 780 deletions(-)
 delete mode 100644 drivers/hwmon/ab8500.c
 delete mode 100644 drivers/hwmon/abx500.c
 delete mode 100644 drivers/hwmon/abx500.h

diff --git a/drivers/hwmon/ab8500.c b/drivers/hwmon/ab8500.c
deleted file mode 100644
index 53f3379d799d..000000000000
--- a/drivers/hwmon/ab8500.c
+++ /dev/null
@@ -1,224 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) ST-Ericsson 2010 - 2013
- * Author: Martin Persson <martin.persson@stericsson.com>
- *         Hongbo Zhang <hongbo.zhang@linaro.org>
- *
- * When the AB8500 thermal warning temperature is reached (threshold cannot
- * be changed by SW), an interrupt is set, and if no further action is taken
- * within a certain time frame, kernel_power_off will be called.
- *
- * When AB8500 thermal shutdown temperature is reached a hardware shutdown of
- * the AB8500 will occur.
- */
-
-#include <linux/err.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/mfd/abx500.h>
-#include <linux/mfd/abx500/ab8500-bm.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/power/ab8500.h>
-#include <linux/reboot.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/iio/consumer.h>
-#include "abx500.h"
-
-#define DEFAULT_POWER_OFF_DELAY	(HZ * 10)
-#define THERMAL_VCC		1800
-#define PULL_UP_RESISTOR	47000
-
-#define AB8500_SENSOR_AUX1		0
-#define AB8500_SENSOR_AUX2		1
-#define AB8500_SENSOR_BTEMP_BALL	2
-#define AB8500_SENSOR_BAT_CTRL		3
-#define NUM_MONITORED_SENSORS		4
-
-struct ab8500_gpadc_cfg {
-	const struct abx500_res_to_temp *temp_tbl;
-	int tbl_sz;
-	int vcc;
-	int r_up;
-};
-
-struct ab8500_temp {
-	struct iio_channel *aux1;
-	struct iio_channel *aux2;
-	struct ab8500_btemp *btemp;
-	struct delayed_work power_off_work;
-	struct ab8500_gpadc_cfg cfg;
-	struct abx500_temp *abx500_data;
-};
-
-/*
- * The hardware connection is like this:
- * VCC----[ R_up ]-----[ NTC ]----GND
- * where R_up is pull-up resistance, and GPADC measures voltage on NTC.
- * and res_to_temp table is strictly sorted by falling resistance values.
- */
-static int ab8500_voltage_to_temp(struct ab8500_gpadc_cfg *cfg,
-		int v_ntc, int *temp)
-{
-	int r_ntc, i = 0, tbl_sz = cfg->tbl_sz;
-	const struct abx500_res_to_temp *tbl = cfg->temp_tbl;
-
-	if (cfg->vcc < 0 || v_ntc >= cfg->vcc)
-		return -EINVAL;
-
-	r_ntc = v_ntc * cfg->r_up / (cfg->vcc - v_ntc);
-	if (r_ntc > tbl[0].resist || r_ntc < tbl[tbl_sz - 1].resist)
-		return -EINVAL;
-
-	while (!(r_ntc <= tbl[i].resist && r_ntc > tbl[i + 1].resist) &&
-			i < tbl_sz - 2)
-		i++;
-
-	/* return milli-Celsius */
-	*temp = tbl[i].temp * 1000 + ((tbl[i + 1].temp - tbl[i].temp) * 1000 *
-		(r_ntc - tbl[i].resist)) / (tbl[i + 1].resist - tbl[i].resist);
-
-	return 0;
-}
-
-static int ab8500_read_sensor(struct abx500_temp *data, u8 sensor, int *temp)
-{
-	int voltage, ret;
-	struct ab8500_temp *ab8500_data = data->plat_data;
-
-	if (sensor == AB8500_SENSOR_BTEMP_BALL) {
-		*temp = ab8500_btemp_get_temp(ab8500_data->btemp);
-	} else if (sensor == AB8500_SENSOR_BAT_CTRL) {
-		*temp = ab8500_btemp_get_batctrl_temp(ab8500_data->btemp);
-	} else if (sensor == AB8500_SENSOR_AUX1) {
-		ret = iio_read_channel_processed(ab8500_data->aux1, &voltage);
-		if (ret < 0)
-			return ret;
-		ret = ab8500_voltage_to_temp(&ab8500_data->cfg, voltage, temp);
-		if (ret < 0)
-			return ret;
-	} else if (sensor == AB8500_SENSOR_AUX2) {
-		ret = iio_read_channel_processed(ab8500_data->aux2, &voltage);
-		if (ret < 0)
-			return ret;
-		ret = ab8500_voltage_to_temp(&ab8500_data->cfg, voltage, temp);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static void ab8500_thermal_power_off(struct work_struct *work)
-{
-	struct ab8500_temp *ab8500_data = container_of(work,
-				struct ab8500_temp, power_off_work.work);
-	struct abx500_temp *abx500_data = ab8500_data->abx500_data;
-
-	dev_warn(&abx500_data->pdev->dev, "Power off due to critical temp\n");
-
-	kernel_power_off();
-}
-
-static ssize_t ab8500_show_name(struct device *dev,
-		struct device_attribute *devattr, char *buf)
-{
-	return sprintf(buf, "ab8500\n");
-}
-
-static ssize_t ab8500_show_label(struct device *dev,
-		struct device_attribute *devattr, char *buf)
-{
-	char *label;
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	int index = attr->index;
-
-	switch (index) {
-	case 1:
-		label = "ext_adc1";
-		break;
-	case 2:
-		label = "ext_adc2";
-		break;
-	case 3:
-		label = "bat_temp";
-		break;
-	case 4:
-		label = "bat_ctrl";
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return sprintf(buf, "%s\n", label);
-}
-
-static int ab8500_temp_irq_handler(int irq, struct abx500_temp *data)
-{
-	struct ab8500_temp *ab8500_data = data->plat_data;
-
-	dev_warn(&data->pdev->dev, "Power off in %d s\n",
-		 DEFAULT_POWER_OFF_DELAY / HZ);
-
-	schedule_delayed_work(&ab8500_data->power_off_work,
-		DEFAULT_POWER_OFF_DELAY);
-	return 0;
-}
-
-int abx500_hwmon_init(struct abx500_temp *data)
-{
-	struct ab8500_temp *ab8500_data;
-
-	ab8500_data = devm_kzalloc(&data->pdev->dev, sizeof(*ab8500_data),
-		GFP_KERNEL);
-	if (!ab8500_data)
-		return -ENOMEM;
-
-	ab8500_data->btemp = ab8500_btemp_get();
-	if (IS_ERR(ab8500_data->btemp))
-		return PTR_ERR(ab8500_data->btemp);
-
-	INIT_DELAYED_WORK(&ab8500_data->power_off_work,
-			  ab8500_thermal_power_off);
-
-	ab8500_data->cfg.vcc = THERMAL_VCC;
-	ab8500_data->cfg.r_up = PULL_UP_RESISTOR;
-	ab8500_data->cfg.temp_tbl = ab8500_temp_tbl_a_thermistor;
-	ab8500_data->cfg.tbl_sz = ab8500_temp_tbl_a_size;
-
-	data->plat_data = ab8500_data;
-	ab8500_data->aux1 = devm_iio_channel_get(&data->pdev->dev, "aux1");
-	if (IS_ERR(ab8500_data->aux1)) {
-		if (PTR_ERR(ab8500_data->aux1) == -ENODEV)
-			return -EPROBE_DEFER;
-		dev_err(&data->pdev->dev, "failed to get AUX1 ADC channel\n");
-		return PTR_ERR(ab8500_data->aux1);
-	}
-	ab8500_data->aux2 = devm_iio_channel_get(&data->pdev->dev, "aux2");
-	if (IS_ERR(ab8500_data->aux2)) {
-		if (PTR_ERR(ab8500_data->aux2) == -ENODEV)
-			return -EPROBE_DEFER;
-		dev_err(&data->pdev->dev, "failed to get AUX2 ADC channel\n");
-		return PTR_ERR(ab8500_data->aux2);
-	}
-
-	data->gpadc_addr[0] = AB8500_SENSOR_AUX1;
-	data->gpadc_addr[1] = AB8500_SENSOR_AUX2;
-	data->gpadc_addr[2] = AB8500_SENSOR_BTEMP_BALL;
-	data->gpadc_addr[3] = AB8500_SENSOR_BAT_CTRL;
-	data->monitored_sensors = NUM_MONITORED_SENSORS;
-
-	data->ops.read_sensor = ab8500_read_sensor;
-	data->ops.irq_handler = ab8500_temp_irq_handler;
-	data->ops.show_name = ab8500_show_name;
-	data->ops.show_label = ab8500_show_label;
-	data->ops.is_visible = NULL;
-
-	return 0;
-}
-EXPORT_SYMBOL(abx500_hwmon_init);
-
-MODULE_AUTHOR("Hongbo Zhang <hongbo.zhang@linaro.org>");
-MODULE_DESCRIPTION("AB8500 temperature driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/abx500.c b/drivers/hwmon/abx500.c
deleted file mode 100644
index 50e67cdd8e5e..000000000000
--- a/drivers/hwmon/abx500.c
+++ /dev/null
@@ -1,487 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) ST-Ericsson 2010 - 2013
- * Author: Martin Persson <martin.persson@stericsson.com>
- *         Hongbo Zhang <hongbo.zhang@linaro.org>
- *
- * ABX500 does not provide auto ADC, so to monitor the required temperatures,
- * a periodic work is used. It is more important to not wake up the CPU than
- * to perform this job, hence the use of a deferred delay.
- *
- * A deferred delay for thermal monitor is considered safe because:
- * If the chip gets too hot during a sleep state it's most likely due to
- * external factors, such as the surrounding temperature. I.e. no SW decisions
- * will make any difference.
- */
-
-#include <linux/err.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/interrupt.h>
-#include <linux/jiffies.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/workqueue.h>
-#include "abx500.h"
-
-#define DEFAULT_MONITOR_DELAY	HZ
-#define DEFAULT_MAX_TEMP	130
-
-static inline void schedule_monitor(struct abx500_temp *data)
-{
-	data->work_active = true;
-	schedule_delayed_work(&data->work, DEFAULT_MONITOR_DELAY);
-}
-
-static void threshold_updated(struct abx500_temp *data)
-{
-	int i;
-	for (i = 0; i < data->monitored_sensors; i++)
-		if (data->max[i] != 0 || data->min[i] != 0) {
-			schedule_monitor(data);
-			return;
-		}
-
-	dev_dbg(&data->pdev->dev, "No active thresholds.\n");
-	cancel_delayed_work_sync(&data->work);
-	data->work_active = false;
-}
-
-static void gpadc_monitor(struct work_struct *work)
-{
-	int temp, i, ret;
-	char alarm_node[30];
-	bool updated_min_alarm, updated_max_alarm;
-	struct abx500_temp *data;
-
-	data = container_of(work, struct abx500_temp, work.work);
-	mutex_lock(&data->lock);
-
-	for (i = 0; i < data->monitored_sensors; i++) {
-		/* Thresholds are considered inactive if set to 0 */
-		if (data->max[i] == 0 && data->min[i] == 0)
-			continue;
-
-		if (data->max[i] < data->min[i])
-			continue;
-
-		ret = data->ops.read_sensor(data, data->gpadc_addr[i], &temp);
-		if (ret < 0) {
-			dev_err(&data->pdev->dev, "GPADC read failed\n");
-			continue;
-		}
-
-		updated_min_alarm = false;
-		updated_max_alarm = false;
-
-		if (data->min[i] != 0) {
-			if (temp < data->min[i]) {
-				if (data->min_alarm[i] == false) {
-					data->min_alarm[i] = true;
-					updated_min_alarm = true;
-				}
-			} else {
-				if (data->min_alarm[i] == true) {
-					data->min_alarm[i] = false;
-					updated_min_alarm = true;
-				}
-			}
-		}
-		if (data->max[i] != 0) {
-			if (temp > data->max[i]) {
-				if (data->max_alarm[i] == false) {
-					data->max_alarm[i] = true;
-					updated_max_alarm = true;
-				}
-			} else if (temp < data->max[i] - data->max_hyst[i]) {
-				if (data->max_alarm[i] == true) {
-					data->max_alarm[i] = false;
-					updated_max_alarm = true;
-				}
-			}
-		}
-
-		if (updated_min_alarm) {
-			ret = sprintf(alarm_node, "temp%d_min_alarm", i + 1);
-			sysfs_notify(&data->pdev->dev.kobj, NULL, alarm_node);
-		}
-		if (updated_max_alarm) {
-			ret = sprintf(alarm_node, "temp%d_max_alarm", i + 1);
-			sysfs_notify(&data->pdev->dev.kobj, NULL, alarm_node);
-		}
-	}
-
-	schedule_monitor(data);
-	mutex_unlock(&data->lock);
-}
-
-/* HWMON sysfs interfaces */
-static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	/* Show chip name */
-	return data->ops.show_name(dev, devattr, buf);
-}
-
-static ssize_t label_show(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	/* Show each sensor label */
-	return data->ops.show_label(dev, devattr, buf);
-}
-
-static ssize_t input_show(struct device *dev,
-			  struct device_attribute *devattr, char *buf)
-{
-	int ret, temp;
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	u8 gpadc_addr = data->gpadc_addr[attr->index];
-
-	ret = data->ops.read_sensor(data, gpadc_addr, &temp);
-	if (ret < 0)
-		return ret;
-
-	return sprintf(buf, "%d\n", temp);
-}
-
-/* Set functions (RW nodes) */
-static ssize_t min_store(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
-{
-	unsigned long val;
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	int res = kstrtol(buf, 10, &val);
-	if (res < 0)
-		return res;
-
-	val = clamp_val(val, 0, DEFAULT_MAX_TEMP);
-
-	mutex_lock(&data->lock);
-	data->min[attr->index] = val;
-	threshold_updated(data);
-	mutex_unlock(&data->lock);
-
-	return count;
-}
-
-static ssize_t max_store(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
-{
-	unsigned long val;
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	int res = kstrtol(buf, 10, &val);
-	if (res < 0)
-		return res;
-
-	val = clamp_val(val, 0, DEFAULT_MAX_TEMP);
-
-	mutex_lock(&data->lock);
-	data->max[attr->index] = val;
-	threshold_updated(data);
-	mutex_unlock(&data->lock);
-
-	return count;
-}
-
-static ssize_t max_hyst_store(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
-{
-	unsigned long val;
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	int res = kstrtoul(buf, 10, &val);
-	if (res < 0)
-		return res;
-
-	val = clamp_val(val, 0, DEFAULT_MAX_TEMP);
-
-	mutex_lock(&data->lock);
-	data->max_hyst[attr->index] = val;
-	threshold_updated(data);
-	mutex_unlock(&data->lock);
-
-	return count;
-}
-
-/* Show functions (RO nodes) */
-static ssize_t min_show(struct device *dev, struct device_attribute *devattr,
-			char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-
-	return sprintf(buf, "%lu\n", data->min[attr->index]);
-}
-
-static ssize_t max_show(struct device *dev, struct device_attribute *devattr,
-			char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-
-	return sprintf(buf, "%lu\n", data->max[attr->index]);
-}
-
-static ssize_t max_hyst_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-
-	return sprintf(buf, "%lu\n", data->max_hyst[attr->index]);
-}
-
-static ssize_t min_alarm_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-
-	return sprintf(buf, "%d\n", data->min_alarm[attr->index]);
-}
-
-static ssize_t max_alarm_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct abx500_temp *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-
-	return sprintf(buf, "%d\n", data->max_alarm[attr->index]);
-}
-
-static umode_t abx500_attrs_visible(struct kobject *kobj,
-				   struct attribute *attr, int n)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct abx500_temp *data = dev_get_drvdata(dev);
-
-	if (data->ops.is_visible)
-		return data->ops.is_visible(attr, n);
-
-	return attr->mode;
-}
-
-/* Chip name, required by hwmon */
-static SENSOR_DEVICE_ATTR_RO(name, name, 0);
-
-/* GPADC - SENSOR1 */
-static SENSOR_DEVICE_ATTR_RO(temp1_label, label, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_input, input, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_min, min, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_max, max, 0);
-static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, max_hyst, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_min_alarm, min_alarm, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, max_alarm, 0);
-
-/* GPADC - SENSOR2 */
-static SENSOR_DEVICE_ATTR_RO(temp2_label, label, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, input, 1);
-static SENSOR_DEVICE_ATTR_RW(temp2_min, min, 1);
-static SENSOR_DEVICE_ATTR_RW(temp2_max, max, 1);
-static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, max_hyst, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_min_alarm, min_alarm, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, max_alarm, 1);
-
-/* GPADC - SENSOR3 */
-static SENSOR_DEVICE_ATTR_RO(temp3_label, label, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_input, input, 2);
-static SENSOR_DEVICE_ATTR_RW(temp3_min, min, 2);
-static SENSOR_DEVICE_ATTR_RW(temp3_max, max, 2);
-static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, max_hyst, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_min_alarm, min_alarm, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, max_alarm, 2);
-
-/* GPADC - SENSOR4 */
-static SENSOR_DEVICE_ATTR_RO(temp4_label, label, 3);
-static SENSOR_DEVICE_ATTR_RO(temp4_input, input, 3);
-static SENSOR_DEVICE_ATTR_RW(temp4_min, min, 3);
-static SENSOR_DEVICE_ATTR_RW(temp4_max, max, 3);
-static SENSOR_DEVICE_ATTR_RW(temp4_max_hyst, max_hyst, 3);
-static SENSOR_DEVICE_ATTR_RO(temp4_min_alarm, min_alarm, 3);
-static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, max_alarm, 3);
-
-static struct attribute *abx500_temp_attributes[] = {
-	&sensor_dev_attr_name.dev_attr.attr,
-
-	&sensor_dev_attr_temp1_label.dev_attr.attr,
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp1_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp2_label.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_min.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp2_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp3_label.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_min.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp3_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp3_max_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp4_label.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_min.dev_attr.attr,
-	&sensor_dev_attr_temp4_max.dev_attr.attr,
-	&sensor_dev_attr_temp4_max_hyst.dev_attr.attr,
-	&sensor_dev_attr_temp4_min_alarm.dev_attr.attr,
-	&sensor_dev_attr_temp4_max_alarm.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group abx500_temp_group = {
-	.attrs = abx500_temp_attributes,
-	.is_visible = abx500_attrs_visible,
-};
-
-static irqreturn_t abx500_temp_irq_handler(int irq, void *irq_data)
-{
-	struct platform_device *pdev = irq_data;
-	struct abx500_temp *data = platform_get_drvdata(pdev);
-
-	data->ops.irq_handler(irq, data);
-	return IRQ_HANDLED;
-}
-
-static int setup_irqs(struct platform_device *pdev)
-{
-	int ret;
-	int irq = platform_get_irq_byname(pdev, "ABX500_TEMP_WARM");
-
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Get irq by name failed\n");
-		return irq;
-	}
-
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-		abx500_temp_irq_handler, 0, "abx500-temp", pdev);
-	if (ret < 0)
-		dev_err(&pdev->dev, "Request threaded irq failed (%d)\n", ret);
-
-	return ret;
-}
-
-static int abx500_temp_probe(struct platform_device *pdev)
-{
-	struct abx500_temp *data;
-	int err;
-
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->pdev = pdev;
-	mutex_init(&data->lock);
-
-	/* Chip specific initialization */
-	err = abx500_hwmon_init(data);
-	if (err	< 0 || !data->ops.read_sensor || !data->ops.show_name ||
-			!data->ops.show_label)
-		return err;
-
-	INIT_DEFERRABLE_WORK(&data->work, gpadc_monitor);
-
-	platform_set_drvdata(pdev, data);
-
-	err = sysfs_create_group(&pdev->dev.kobj, &abx500_temp_group);
-	if (err < 0) {
-		dev_err(&pdev->dev, "Create sysfs group failed (%d)\n", err);
-		return err;
-	}
-
-	data->hwmon_dev = hwmon_device_register(&pdev->dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		err = PTR_ERR(data->hwmon_dev);
-		dev_err(&pdev->dev, "Class registration failed (%d)\n", err);
-		goto exit_sysfs_group;
-	}
-
-	if (data->ops.irq_handler) {
-		err = setup_irqs(pdev);
-		if (err < 0)
-			goto exit_hwmon_reg;
-	}
-	return 0;
-
-exit_hwmon_reg:
-	hwmon_device_unregister(data->hwmon_dev);
-exit_sysfs_group:
-	sysfs_remove_group(&pdev->dev.kobj, &abx500_temp_group);
-	return err;
-}
-
-static int abx500_temp_remove(struct platform_device *pdev)
-{
-	struct abx500_temp *data = platform_get_drvdata(pdev);
-
-	cancel_delayed_work_sync(&data->work);
-	hwmon_device_unregister(data->hwmon_dev);
-	sysfs_remove_group(&pdev->dev.kobj, &abx500_temp_group);
-
-	return 0;
-}
-
-static int abx500_temp_suspend(struct platform_device *pdev,
-			       pm_message_t state)
-{
-	struct abx500_temp *data = platform_get_drvdata(pdev);
-
-	if (data->work_active)
-		cancel_delayed_work_sync(&data->work);
-
-	return 0;
-}
-
-static int abx500_temp_resume(struct platform_device *pdev)
-{
-	struct abx500_temp *data = platform_get_drvdata(pdev);
-
-	if (data->work_active)
-		schedule_monitor(data);
-
-	return 0;
-}
-
-#ifdef CONFIG_OF
-static const struct of_device_id abx500_temp_match[] = {
-	{ .compatible = "stericsson,abx500-temp" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, abx500_temp_match);
-#endif
-
-static struct platform_driver abx500_temp_driver = {
-	.driver = {
-		.name = "abx500-temp",
-		.of_match_table = of_match_ptr(abx500_temp_match),
-	},
-	.suspend = abx500_temp_suspend,
-	.resume = abx500_temp_resume,
-	.probe = abx500_temp_probe,
-	.remove = abx500_temp_remove,
-};
-
-module_platform_driver(abx500_temp_driver);
-
-MODULE_AUTHOR("Martin Persson <martin.persson@stericsson.com>");
-MODULE_DESCRIPTION("ABX500 temperature driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/abx500.h b/drivers/hwmon/abx500.h
deleted file mode 100644
index 4517594260f2..000000000000
--- a/drivers/hwmon/abx500.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) ST-Ericsson 2010 - 2013
- * Author: Martin Persson <martin.persson@stericsson.com>
- *         Hongbo Zhang <hongbo.zhang@linaro.com>
- */
-
-#ifndef _ABX500_H
-#define _ABX500_H
-
-#define NUM_SENSORS 5
-
-struct abx500_temp;
-
-/*
- * struct abx500_temp_ops - abx500 chip specific ops
- * @read_sensor: reads gpadc output
- * @irq_handler: irq handler
- * @show_name: hwmon device name
- * @show_label: hwmon attribute label
- * @is_visible: is attribute visible
- */
-struct abx500_temp_ops {
-	int (*read_sensor)(struct abx500_temp *, u8, int *);
-	int (*irq_handler)(int, struct abx500_temp *);
-	ssize_t (*show_name)(struct device *,
-			struct device_attribute *, char *);
-	ssize_t (*show_label) (struct device *,
-			struct device_attribute *, char *);
-	int (*is_visible)(struct attribute *, int);
-};
-
-/*
- * struct abx500_temp - representation of temp mon device
- * @pdev: platform device
- * @hwmon_dev: hwmon device
- * @ops: abx500 chip specific ops
- * @gpadc_addr: gpadc channel address
- * @min: sensor temperature min value
- * @max: sensor temperature max value
- * @max_hyst: sensor temperature hysteresis value for max limit
- * @min_alarm: sensor temperature min alarm
- * @max_alarm: sensor temperature max alarm
- * @work: delayed work scheduled to monitor temperature periodically
- * @work_active: True if work is active
- * @lock: mutex
- * @monitored_sensors: number of monitored sensors
- * @plat_data: private usage, usually points to platform specific data
- */
-struct abx500_temp {
-	struct platform_device *pdev;
-	struct device *hwmon_dev;
-	struct abx500_temp_ops ops;
-	u8 gpadc_addr[NUM_SENSORS];
-	unsigned long min[NUM_SENSORS];
-	unsigned long max[NUM_SENSORS];
-	unsigned long max_hyst[NUM_SENSORS];
-	bool min_alarm[NUM_SENSORS];
-	bool max_alarm[NUM_SENSORS];
-	struct delayed_work work;
-	bool work_active;
-	struct mutex lock;
-	int monitored_sensors;
-	void *plat_data;
-};
-
-int abx500_hwmon_init(struct abx500_temp *data);
-
-#endif /* _ABX500_H */
-- 
2.29.2

