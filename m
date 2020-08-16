Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88BAC433E1
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 16:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE6E020826
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 16:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px0x5kKq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgHPQqh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 12:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgHPQqc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 12:46:32 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B94EC061786;
        Sun, 16 Aug 2020 09:46:31 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id m22so15016163eje.10;
        Sun, 16 Aug 2020 09:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVK8nUg8L9Z+nRUoH20o9hguCIhQfJ+8MU3U/ytCJiw=;
        b=Px0x5kKqJALJQJTxNRT5vYOkPyZk/EvGTrsIhIq3AbhM7VyVrXROIAt7HyYqA+9oGv
         SZGOIGitAHRmAfTGRZPZmU3C7uOrKfFwW56MM+m8+T76HLSYTrGMBJijP2UdrNbohRwb
         uAL8lgS7ueszzG+p6lysZwxYiWjaYhNLu2NKDLUvK5TgzZ3AQPqpLUjw/qlfd6ubY+cH
         QG2BMh/25Bs8EFPoAkvm8n+H8MXamBGbOKDViGjJgNJADvhnGhmDyBIrCBi+HC3U5hl/
         xx3oTs16DNt1bDvncr3PcW5NjiaK8nhtWXfV7Wf9Jpq4rrw+Wc8M9QHAygho4VuYTo/e
         Q3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVK8nUg8L9Z+nRUoH20o9hguCIhQfJ+8MU3U/ytCJiw=;
        b=mPmpwMzPtqDJP/WT3k3yqRU5/d1m/WhTmIQKF3V9Nj0GY45l2DV58v8auXVPUaWWQO
         AJC6kYi4KL7VEvagNahEfjZoZNRHJODyA/3Fan58B+4qVxXxl8kYd08DpNfwrlURXHl7
         8YJmOljGc0z8WUSfSFP5m61h7aLiIuDLz/E5TYzLqhH9eZ7W9GyeSGw5d8W3cC1DaWLa
         5fpv+bPlaa0KUWnGSOjwDFv+RfD371upajVVGhAWUL812nLd+9vtUqYDplPg5HSLomvk
         zDSsnRg1V/NiuBKDBfeZeTNbtwO3M0Zj3VrA/ObfTcGBqZvqG1H9hrxbEktI+gM2ZtwN
         irag==
X-Gm-Message-State: AOAM530EUSJncbKdCVTlaHJpy+nsE2FqIvZr5E5J/nA9JpbhLYfIvyWn
        OBhvVgh+pOHgXlZeKMs8rh8=
X-Google-Smtp-Source: ABdhPJzJyDLyTdha3M8Q5UAwTCH2QASqfm8TnKdJka2ejz8DmfBiDu51WF140tjC9IUKq4eaR6K0KA==
X-Received: by 2002:a17:906:b08:: with SMTP id u8mr11781800ejg.401.1597596388624;
        Sun, 16 Aug 2020 09:46:28 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id y26sm11681789edu.96.2020.08.16.09.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 09:46:27 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     jaap aarts <jaap.aarts1@gmail.com>
Subject: [PATCH V6] hwmon: add fan/pwm driver for corsair h100i platinum
Date:   Sun, 16 Aug 2020 18:46:17 +0200
Message-Id: <20200816164616.417500-1-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adds fan/pwm support for H100i platinum.
Custom temp/fan curves are not supported.

v6:
 - fixed memory leak
 - more time convertions
 - removed unnecesary fields
 - interuptable lock
 - moved setting rpm/pwm variables until after applying
 - no more debug prints
 - fix switch statements
 - fixed sizeof
 - add support for hwmon_fan_max

Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
---
 drivers/hwmon/Kconfig               |   7 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/corsair_hydro_i_pro.c | 731 ++++++++++++++++++++++++++++
 3 files changed, 739 insertions(+)
 create mode 100644 drivers/hwmon/corsair_hydro_i_pro.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 288ae9f63588..f466b72d0f67 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -378,6 +378,13 @@ config SENSORS_ARM_SCPI
 	  and power sensors available on ARM Ltd's SCP based platforms. The
 	  actual number and type of sensors exported depend on the platform.
 
+config SENSORS_CORSAIR_HYDRO_I_PRO
+	tristate "Corsair hydro HXXXi pro driver"
+	depends on USB
+	help
+	  If you say yes here you get support for the corsair hydro HXXXi pro
+	  range of devices.
+
 config SENSORS_ASB100
 	tristate "Asus ASB100 Bach"
 	depends on X86 && I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3e32c21f5efe..ec63294b3ef1 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
 obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
 obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
 obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
+obj-$(CONFIG_SENSORS_CORSAIR_HYDRO_I_PRO)	+= corsair_hydro_i_pro.o
 
 obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
 obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
diff --git a/drivers/hwmon/corsair_hydro_i_pro.c b/drivers/hwmon/corsair_hydro_i_pro.c
new file mode 100644
index 000000000000..ec5cadf10a53
--- /dev/null
+++ b/drivers/hwmon/corsair_hydro_i_pro.c
@@ -0,0 +1,731 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid coolers.
+ * Copyright (c) Jaap Aarts 2020
+ *
+ * Protocol partially reverse engineered by audiohacked
+ * https://github.com/audiohacked/OpendriverLink
+ */
+
+/*
+ * Supports following liquid coolers:
+ * H100i platinum
+ *
+ * Other products should work with this driver with slight modification.
+ *
+ * Note: platinum is the codename name for pro within the driver, so H100i platinum = H100i pro.
+ * But some products are actually called platinum, these are not intended to be supported (yet).
+ *
+ * Note: fan curve control has not been implemented
+ */
+
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+struct device_config {
+	const u16 vendor_id;
+	const u16 product_id;
+	const u8 fancount;
+	const u16 rpm_min;
+	const u16 rpm_max;
+	const u8 pwm_max;
+	const char *name;
+	const struct hwmon_channel_info **hwmon_info;
+};
+
+struct hydro_i_pro_device {
+	struct usb_device *udev;
+
+	const struct device_config *config;
+
+	unsigned char *bulk_out_buffer;
+	unsigned char *bulk_in_buffer;
+	size_t bulk_out_size;
+	size_t bulk_in_size;
+	char bulk_in_endpointAddr;
+	char bulk_out_endpointAddr;
+
+	struct usb_interface *interface; /* the interface for this device */
+	struct mutex io_mutex;
+};
+
+#define MAX_FAN_COUNT 2
+#define MAX_PWM_CHANNEL_COUNT MAX_FAN_COUNT
+
+struct hwmon_data {
+	struct hydro_i_pro_device *hdev;
+	u8 channel_count;
+	void *channel_data[MAX_PWM_CHANNEL_COUNT];
+};
+
+struct curve_point {
+	u8 temp;
+	u8 pwm;
+};
+
+#define FAN_CURVE_COUNT 7
+
+struct hwmon_fan_data {
+	u8 fan_channel;
+	u16 fan_target;
+	u8 fan_pwm_target;
+	u8 mode;
+	struct curve_point curve[FAN_CURVE_COUNT];
+};
+
+static struct curve_point quiet_curve[FAN_CURVE_COUNT] = {
+	{
+		.temp = 0x1F,
+		.pwm = 0x15,
+	},
+	{
+		.temp = 0x21,
+		.pwm = 0x1E,
+	},
+	{
+		.temp = 0x24,
+		.pwm = 0x25,
+	},
+	{
+		.temp = 0x27,
+		.pwm = 0x2D,
+	},
+	{
+		.temp = 0x29,
+		.pwm = 0x38,
+	},
+	{
+		.temp = 0x2C,
+		.pwm = 0x4A,
+	},
+	{
+		.temp = 0x2F,
+		.pwm = 0x64,
+	},
+};
+
+#define DEFAULT_CURVE quiet_curve
+
+static const struct hwmon_channel_info *dual_fan[] = {
+	HWMON_CHANNEL_INFO(
+		fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN | HWMON_F_MAX,
+		HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+	NULL
+};
+
+static const struct device_config config_table[] = {
+	{
+		.fancount = 2,
+		.rpm_min = 200,
+		.rpm_max = 3000,
+		.pwm_max = 100,
+		.name = "corsair_H100i_pro",
+		.hwmon_info = dual_fan,
+	},
+};
+
+#define BULK_TIMEOUT 100
+
+enum opcodes {
+	PWM_FAN_CURVE_CMD = 0x40,
+	PWM_GET_CURRENT_CMD = 0x41,
+	PWM_FAN_TARGET_CMD = 0x42,
+	RPM_FAN_TARGET_CMD = 0x43,
+};
+
+#define SUCCES_LENGTH 3
+#define SUCCES_CODE 0x12, 0x34
+
+static bool check_succes(enum opcodes command, char ret[static SUCCES_LENGTH])
+{
+	char success[SUCCES_LENGTH] = { command, SUCCES_CODE };
+
+	return memcmp(ret, success, SUCCES_LENGTH) == 0;
+}
+
+static int acquire_lock(struct hydro_i_pro_device *hdev)
+{
+	int retval = usb_autopm_get_interface(hdev->interface);
+
+	if (retval)
+		return retval;
+
+	return mutex_lock_interruptible(&hdev->io_mutex);
+}
+
+static int transfer_usb(struct hydro_i_pro_device *hdev,
+			unsigned char *send_buf, unsigned char *recv_buf,
+			int send_len, int recv_len)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
+
+	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+	if (wrote != send_len)
+		return -EIO;
+
+	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+	if (wrote != recv_len)
+		return -EIO;
+
+	return 0;
+}
+
+static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
+			     struct hwmon_fan_data *fan_data,
+			     struct curve_point point[static FAN_CURVE_COUNT])
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	send_buf[0] = PWM_FAN_CURVE_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = point[0].temp;
+	send_buf[3] = point[1].temp;
+	send_buf[4] = point[2].temp;
+	send_buf[5] = point[3].temp;
+	send_buf[6] = point[4].temp;
+	send_buf[7] = point[5].temp;
+	send_buf[8] = point[6].temp;
+	send_buf[9] = point[0].pwm;
+	send_buf[10] = point[1].pwm;
+	send_buf[11] = point[2].pwm;
+	send_buf[12] = point[3].pwm;
+	send_buf[13] = point[4].pwm;
+	send_buf[14] = point[5].pwm;
+	send_buf[15] = point[6].pwm;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 16, 3);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed setting fan pwm/temp curve for %s on channel %d %d,%d,%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2]);
+		return -EINVAL;
+	}
+
+	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
+
+	return 0;
+}
+
+static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
+			      struct hwmon_fan_data *fan_data, u16 val)
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	send_buf[0] = RPM_FAN_TARGET_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = (val >> 8);
+	send_buf[3] = val;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 4, 3);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed setting fan rpm for %s on channel %d %d,%d,%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2]);
+		return -EINVAL;
+	}
+	fan_data->fan_target = val;
+	fan_data->fan_pwm_target = 0;
+
+	return 0;
+}
+
+static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
+			       struct hwmon_fan_data *fan_data, long *val)
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	send_buf[0] = PWM_GET_CURRENT_CMD;
+	send_buf[1] = fan_data->fan_channel;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 2, 6);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed retrieving fan pwm for %s on channel %d %d,%d,%d/%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2], recv_buf[3]);
+		return -EINVAL;
+	}
+
+	*val = ((recv_buf[4]) << 8) + recv_buf[5];
+	return 0;
+}
+
+static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
+			      struct hwmon_fan_data *fan_data, u8 val)
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	send_buf[0] = PWM_FAN_TARGET_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = val;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 3, 3);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed setting fan pwm for %s on channel %d %d,%d,%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2]);
+		return -EINVAL;
+	}
+	fan_data->fan_target = 0;
+	fan_data->fan_pwm_target = val;
+
+	return 0;
+}
+
+static umode_t hwmon_is_visible(const void *d, enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_target:
+			return 0644;
+		case hwmon_fan_min:
+			return 0444;
+		case hwmon_fan_max:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0200;
+		case hwmon_pwm_enable:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct hydro_i_pro_device *hdev = data->hdev;
+	struct hwmon_fan_data *fan_data;
+	int retval = 0;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1)
+				return -EINVAL;
+
+			val = clamp_val(val, hdev->config->rpm_min,
+					hdev->config->rpm_max);
+
+			retval = acquire_lock(hdev);
+			if (retval)
+				goto exit;
+
+			retval = set_fan_target_rpm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1)
+				return -EINVAL;
+
+			val = clamp_val(val, 0, hdev->config->pwm_max);
+			retval = acquire_lock(hdev);
+			if (retval)
+				goto exit;
+
+			retval = set_fan_target_pwm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		case hwmon_pwm_enable:
+			fan_data = data->channel_data[channel];
+
+			switch (val) {
+			case 2:
+			case 0:
+				retval = acquire_lock(hdev);
+				if (retval)
+					goto exit;
+
+				retval = set_fan_pwm_curve(hdev, fan_data,
+							   DEFAULT_CURVE);
+				if (retval)
+					goto cleanup;
+				fan_data->mode = val;
+				break;
+			case 1:
+				retval = acquire_lock(hdev);
+				if (retval)
+					goto exit;
+
+				if (fan_data->fan_target != 0) {
+					retval = set_fan_target_rpm(
+						hdev, fan_data,
+						fan_data->fan_target);
+					if (retval)
+						goto cleanup;
+				} else if (fan_data->fan_pwm_target != 0) {
+					retval = set_fan_target_pwm(
+						hdev, fan_data,
+						fan_data->fan_pwm_target);
+					if (retval)
+						goto cleanup;
+				}
+				fan_data->mode = 1;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+cleanup:
+	mutex_unlock(&hdev->io_mutex);
+	usb_autopm_put_interface(hdev->interface);
+exit:
+	return retval;
+}
+
+static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct hydro_i_pro_device *hdev = data->hdev;
+	struct hwmon_fan_data *fan_data;
+	int retval = 0;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			fan_data = data->channel_data[channel];
+
+			retval = acquire_lock(hdev);
+			if (retval)
+				goto exit;
+
+			retval = get_fan_current_rpm(hdev, fan_data, val);
+			break;
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1) {
+				*val = 0;
+				goto exit;
+			}
+			*val = fan_data->fan_target;
+			goto exit;
+		case hwmon_fan_min:
+			*val = hdev->config->rpm_min;
+			goto exit;
+		case hwmon_fan_max:
+			*val = hdev->config->rpm_max;
+			goto exit;
+
+		default:
+			return -EINVAL;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_enable:
+			fan_data = data->channel_data[channel];
+			*val = fan_data->mode;
+			goto exit;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+
+	default:
+		return -EINVAL;
+	}
+
+	mutex_unlock(&hdev->io_mutex);
+	usb_autopm_put_interface(hdev->interface);
+exit:
+	return retval;
+}
+
+static const struct hwmon_ops i_pro_ops = {
+	.is_visible = hwmon_is_visible,
+	.read = hwmon_read,
+	.write = hwmon_write,
+};
+
+static int hwmon_init(struct hydro_i_pro_device *hdev)
+{
+	u8 fan_id;
+	struct device *hwmon_dev;
+	struct hwmon_fan_data *fan;
+	struct hwmon_data *data;
+	struct hwmon_chip_info *hwmon_info;
+
+	data = devm_kzalloc(&hdev->udev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	hwmon_info =
+		devm_kzalloc(&hdev->udev->dev, sizeof(hwmon_info), GFP_KERNEL);
+	if (!hwmon_info) {
+		free(data);
+		return -ENOMEM;
+	}
+
+	/* You did something bad!! Either adjust  MAX_FAN_COUNT or the fancount for the config!*/
+	WARN_ON(hdev->config->fancount >= MAX_PWM_CHANNEL_COUNT);
+	data->channel_count =
+		clamp_val(hdev->config->fancount, 0, MAX_PWM_CHANNEL_COUNT);
+
+	/* For each fan create a data channel a fan config entry and a pwm config entry */
+	for (fan_id = 0; fan_id < data->channel_count; fan_id++) {
+		fan = devm_kzalloc(&hdev->udev->dev, sizeof(fan), GFP_KERNEL);
+		if (!fan)
+			return -ENOMEM;
+
+		fan->fan_channel = fan_id;
+		fan->mode = 0;
+		data->channel_data[fan_id] = fan;
+	}
+
+	hwmon_info->ops = &i_pro_ops;
+	hwmon_info->info = hdev->config->hwmon_info;
+
+	data->hdev = hdev;
+	hwmon_dev = devm_hwmon_device_register_with_info(
+		&hdev->udev->dev, hdev->config->name, data, hwmon_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name);
+	return 0;
+}
+
+#define USB_VENDOR_ID_CORSAIR 0x1b1c
+#define USB_PRODUCT_ID_H100I_PRO 0x0c15
+/*
+ * Devices that work with this driver.
+ * More devices should work, however none have been tested.
+ */
+static const struct usb_device_id astk_table[] = {
+	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
+	  .driver_info = (kernel_ulong_t)&config_table[0] },
+	{},
+};
+
+MODULE_DEVICE_TABLE(usb, astk_table);
+
+static int init_device(struct usb_device *udev)
+{
+	int retval;
+
+	/*
+	 * This is needed because when running windows in a vm with proprietary driver
+	 * and you switch to this driver, the device will not respond unless you run this.
+	 */
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
+				 0xffff, 0x0000, 0, 0, 0);
+
+	/*this always returns error, but it required for propper initialisation*/
+	if (retval != -EPIPE)
+		return retval;
+
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+			       0x0002, 0x0000, 0, 0, 0);
+}
+
+static int deinit_device(struct usb_device *udev)
+{
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+			       0x0004, 0x0000, 0, 0, 0);
+}
+
+static void astk_delete(struct hydro_i_pro_device *hdev)
+{
+	usb_put_intf(hdev->interface);
+	usb_put_dev(hdev->udev);
+	mutex_destroy(&hdev->io_mutex);
+}
+
+static int astk_probe(struct usb_interface *interface,
+		      const struct usb_device_id *id)
+{
+	struct usb_device *udev = usb_get_dev(interface_to_usbdev(interface));
+	struct hydro_i_pro_device *hdev;
+	int retval;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+
+	hdev = devm_kzalloc(&udev->dev, sizeof(*hdev), GFP_KERNEL);
+
+	if (!hdev) {
+		retval = -ENOMEM;
+		goto exit;
+	}
+
+	hdev->config = (const struct device_config *)id->driver_info;
+	/* You should set the driver_info to a pointer to the correct configuration!!*/
+	WARN_ON(!hdev->config);
+
+	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
+					   &bulk_out, NULL, NULL);
+	if (retval) {
+		kfree(hdev);
+		goto exit;
+	}
+
+	hdev->udev = ;
+	hdev->interface = usb_get_intf(interface);
+
+	/*
+	 * set up the endpoint information
+	 * use only the first bulk-in and bulk-out endpoints
+	 */
+	hdev->bulk_in_size = usb_endpoint_maxp(bulk_in);
+	hdev->bulk_in_buffer =
+		devm_kzalloc(&hdev->udev->dev, hdev->bulk_in_size, GFP_KERNEL);
+	hdev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
+	if (!hdev->bulk_in_buffer) {
+		kfree(hdev);
+		goto exit;
+	}
+
+	hdev->bulk_out_size = usb_endpoint_maxp(bulk_out);
+	hdev->bulk_out_buffer =
+		devm_kzalloc(&hdev->udev->dev, hdev->bulk_out_size, GFP_KERNEL);
+	hdev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
+	if (!hdev->bulk_out_buffer) {
+		kfree(hdev);
+		kfree(hdev->bulk_in_buffer);
+		goto exit;
+	}
+
+	retval = init_device(hdev->udev);
+	if (retval) {
+		dev_err(&interface->dev, "failed initialising %s:%d\n",
+			hdev->config->name, retval);
+		kfree(hdev);
+		kfree(hdev->bulk_in_buffer);
+		kfree(hdev->bulk_out_buffer);
+		goto exit;
+	}
+
+	retval = hwmon_init(hdev);
+	if (retval) {
+		dev_err(&interface->dev, "failed initialising hwmon %s:%d\n",
+			hdev->config->name, retval);
+		kfree(hdev);
+		kfree(hdev->bulk_in_buffer);
+		kfree(hdev->bulk_out_buffer);
+		goto exit;
+	}
+
+	usb_set_intfdata(interface, hdev);
+	mutex_init(&hdev->io_mutex);
+exit:
+	return retval;
+}
+
+static void astk_disconnect(struct usb_interface *interface)
+{
+	struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
+
+	dev_info(&hdev->udev->dev, "removed hwmon for %s\n",
+		 hdev->config->name);
+	deinit_device(hdev->udev);
+	usb_set_intfdata(interface, NULL);
+	astk_delete(hdev);
+}
+
+static int astk_resume(struct usb_interface *intf)
+{
+	return 0;
+}
+
+static int astk_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	return 0;
+}
+
+static struct usb_driver hydro_i_pro_driver = {
+	.name = "hydro_i_pro_device",
+	.id_table = astk_table,
+	.probe = astk_probe,
+	.disconnect = astk_disconnect,
+	.resume = astk_resume,
+	.suspend = astk_suspend,
+	.supports_autosuspend = 1,
+};
+
+module_usb_driver(hydro_i_pro_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
+MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
-- 
2.28.0

