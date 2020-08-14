Return-Path: <SRS0=9O35=BY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30383C433E1
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Aug 2020 19:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA29920771
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Aug 2020 19:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf8Kw2hZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgHNTnT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Aug 2020 15:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgHNTnT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Aug 2020 15:43:19 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D7EC061385;
        Fri, 14 Aug 2020 12:43:18 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m20so7677362eds.2;
        Fri, 14 Aug 2020 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DlOH5wy2YfhdKtKghMHVsxNnf1s3J1tX4dAXQMixmhg=;
        b=Rf8Kw2hZBvCnE26GeBVSVATky871JvYyjOcHw9kItkv3cPzxHFPA4qAAONBx2F0upU
         p1+8LtgWyCoBu3nB+dGQ6qsVqiZAo86OsgzkPPS4cPmwjVbfAOxGFGEpqA2vox8Vjove
         hwsdlhALyeidZt5+tXzfZte/4tNnKWvXGXze409WL+LCwSv9Icg+rFTK/w3Yeya2+fve
         xcO+ay7nODQEwnyorxpAT7H4It9cORG6U04f5YhK1E4170hob6w+DbeHPJHwziC8LhjK
         L0KJOqW+Ii9uzJTVzxNuz93DL/2G+HkhINq3ncdboczAn7F6NtYQTiU5H/fhva5Jl5P0
         kG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DlOH5wy2YfhdKtKghMHVsxNnf1s3J1tX4dAXQMixmhg=;
        b=Vd9pDr7My2mFLMi4G6Kid9ahdMrO3KEdtFlJNXtTFh7NH9Y+0l14fsiGY/1ru2t6jF
         KG066n4kLymTM6WPFHmjs7SxR8sYVSOXMxjUfyj3nl4Qttq0X8JfiGaIiLfhHofaExjn
         3XehQ0nkY7kRxBFD5v074AGWxdnAvNXx2JsxrKUIMZRGoIH2uBgKW9sMvLZvy9WHsueS
         hyXr8bII2iFxX6nXPs7PmSWMNidPP+U1EjfK+LbviuMcwryg/CDTM1/xxLZSErvM4+Xy
         pvTmvwqn8P1rrv/I2v8N8/FkHjZyUeshj/Z/d6eVe07A+QPuAAmARZX2tbrAQx67i+PY
         Bcjg==
X-Gm-Message-State: AOAM533CEgwtsag6hKH5BQh/2zkyTrHzH/MWjBagEzL4Kvs/mWu5Twx5
        ePZfQU7INFOKAehY/uzb+tlPF359vy0fDQ==
X-Google-Smtp-Source: ABdhPJyErn2HUFuTzU60dU9wUk2M0bxKBRT4A87MzfgMhz12NDYjkNmkLlZY0ij9AeHfJ81NiqOR0Q==
X-Received: by 2002:aa7:c34d:: with SMTP id j13mr3772252edr.209.1597434196851;
        Fri, 14 Aug 2020 12:43:16 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id s9sm7554036edt.36.2020.08.14.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 12:43:16 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>
Subject: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
Date:   Fri, 14 Aug 2020 21:42:03 +0200
Message-Id: <20200814194202.327141-1-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adds fan/pwm support for H100i platinum.
temp/fan curves are not supported, you can reset to default if needed.

v3:
 - tineout is now a #define
 - made all funcions static
 - removed all retval != 0
 - removed horrible mess during hwmon_init using a device table
 - removed C++ style comments
 - added USB dependency

Sorry for the long delay, I send this patch in earlier before going
away, but in some haste forgot to add V3 to the subject.
I would have been unavailable for comment anyways. Here is an
update on the h100i platinum driver, I'm back and thus available
for comment again. Probably wasnt going to make 5.8 anyways,
hoping to make 5.9 :).

Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
---
 drivers/hwmon/Kconfig               |   7 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/corsair_hydro_i_pro.c | 718 ++++++++++++++++++++++++++++
 3 files changed, 726 insertions(+)
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
index 000000000000..38ca2554a5c1
--- /dev/null
+++ b/drivers/hwmon/corsair_hydro_i_pro.c
@@ -0,0 +1,718 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid coolers.
+ * Copyright (c) Jaap Aarts 2020
+ * 
+ * Protocol reverse engineered by audiohacked
+ * https://github.com/audiohacked/OpendriverLink
+ */
+
+/*
+ * Supports following liquid coolers:
+ * H100i platinum
+ * 
+ * Other products should work with this driver but no testing has been done.
+ * 
+ * Note: platinum is the codename name for pro within the driver, so H100i platinum = H100i pro.
+ * But some products are actually calles platinum, these are not intended to be supported.
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
+	u16 vendor_id;
+	u16 product_id;
+	u8 fancount;
+	const struct hwmon_channel_info **hwmon_info;
+};
+
+struct hydro_i_pro_device {
+	struct usb_device *udev;
+
+	const struct device_config *config;
+
+	unsigned char *bulk_out_buffer;
+	char *bulk_in_buffer;
+	size_t bulk_out_size;
+	size_t bulk_in_size;
+	char bulk_in_endpointAddr;
+	char bulk_out_endpointAddr;
+
+	struct usb_interface *interface; /* the interface for this device */
+	struct semaphore
+		limit_sem; /* limiting the number of writes in progress */
+};
+
+struct hwmon_data {
+	struct hydro_i_pro_device *hdev;
+	int channel_count;
+	void **channel_data;
+};
+
+struct curve_point {
+	uint8_t temp;
+	uint8_t pwm;
+};
+
+struct hwmon_fan_data {
+	char fan_channel;
+	long fan_target;
+	unsigned char fan_pwm_target;
+	long mode;
+	struct curve_point curve[7];
+};
+
+struct curve_point quiet_curve[] = {
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
+#define default_curve quiet_curve
+
+static const struct hwmon_channel_info *dual_fan[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+
+	NULL
+};
+
+static const struct device_config config_table[] = {
+	{
+		.vendor_id = 0x1b1c,
+		.product_id = 0x0c15,
+		.fancount = 2,
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
+static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])
+{
+	char success[SUCCES_LENGTH] = { command, SUCCES_CODE };
+	return strncmp(ret, success, SUCCES_LENGTH) == 0;
+}
+
+static const struct device_config *get_device_configuration(u16 vendor_id,
+							    u16 product_id)
+{
+	const struct device_config *config;
+	int i = 0;
+	int n = ARRAY_SIZE(config_table);
+	for (i = 0; i < n; i++) {
+		config = &config_table[i];
+		if (config->vendor_id == vendor_id &&
+		    config->product_id == product_id) {
+			return config;
+		}
+	}
+	return config;
+}
+
+static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
+			     struct hwmon_fan_data *fan_data,
+			     struct curve_point point[7])
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
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
+	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 16, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 4, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_info(&hdev->udev->dev,
+			 "[*] failed setting fan curve %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
+			      struct hwmon_fan_data *fan_data, long val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
+
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	fan_data->fan_target = val;
+	fan_data->fan_pwm_target = 0;
+
+	send_buf[0] = RPM_FAN_TARGET_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = (fan_data->fan_target >> 8);
+	send_buf[3] = fan_data->fan_target;
+
+	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_info(&hdev->udev->dev,
+			 "[*] failed setting fan rpm %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
+			       struct hwmon_fan_data *fan_data, long *val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
+
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	send_buf[0] = PWM_GET_CURRENT_CMD;
+	send_buf[1] = fan_data->fan_channel;
+
+	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 2, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel) {
+		dev_info(&hdev->udev->dev,
+			 "[*] failed retrieving fan rmp %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+		return -EINVAL;
+	}
+
+	*val = ((recv_buf[4]) << 8) + recv_buf[5];
+	return 0;
+}
+
+static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
+			      struct hwmon_fan_data *fan_data, long val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
+
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	fan_data->fan_pwm_target = val;
+	fan_data->fan_target = 0;
+
+	send_buf[0] = PWM_FAN_TARGET_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[3] = fan_data->fan_pwm_target;
+
+	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_info(&hdev->udev->dev,
+			 "[*] failed setting fan pwm %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+		return -EINVAL;
+	}
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
+			break;
+		case hwmon_fan_target:
+			return 0644;
+			break;
+		case hwmon_fan_min:
+			return 0444;
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0200;
+			break;
+		case hwmon_pwm_enable:
+			return 0644;
+			break;
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
+	if (channel >= data->channel_count)
+		return -ECHRNG;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1)
+				return -EINVAL;
+
+			retval = usb_autopm_get_interface(hdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&hdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = set_fan_target_rpm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1)
+				return -EINVAL;
+
+			retval = usb_autopm_get_interface(hdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&hdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = set_fan_target_pwm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		case hwmon_pwm_enable:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(hdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&hdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+			fan_data->mode = val;
+
+			switch (val) {
+			case 0:
+				set_fan_pwm_curve(hdev, fan_data,
+						  default_curve);
+				break;
+			case 1:
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
+				break;
+			case 2:
+				set_fan_pwm_curve(hdev, fan_data,
+						  default_curve);
+				break;
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+	default:
+		return -EINVAL;
+	}
+
+cleanup:
+	up(&hdev->limit_sem);
+cleanup_interface:
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
+	if (channel >= data->channel_count)
+		return -ECHRNG;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(hdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&hdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = get_fan_current_rpm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			goto cleanup;
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1) {
+				*val = 0;
+				goto exit;
+			}
+			*val = fan_data->fan_target;
+			goto exit;
+		case hwmon_fan_min:
+			*val = 200;
+			goto exit;
+
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+
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
+cleanup:
+	up(&hdev->limit_sem);
+cleanup_interface:
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
+static void hwmon_init(struct hydro_i_pro_device *hdev)
+{
+	int fan_id;
+	struct device *hwmon_dev;
+	struct hwmon_fan_data *fan;
+	struct hwmon_data *data = devm_kzalloc(
+		&hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
+	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
+		&hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
+
+	data->channel_count = hdev->config->fancount;
+	data->channel_data =
+		devm_kzalloc(&hdev->udev->dev,
+			     sizeof(char *) * data->channel_count, GFP_KERNEL);
+
+	/* For each fan create a data channel a fan config entry and a pwm config entry */
+	for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
+		fan = devm_kzalloc(&hdev->udev->dev,
+				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
+		fan->fan_channel = fan_id;
+		fan->mode = 2;
+		data->channel_data[fan_id] = fan;
+	}
+
+	hwmon_info->ops = &i_pro_ops;
+	hwmon_info->info = hdev->config->hwmon_info;
+
+	data->hdev = hdev;
+	hwmon_dev = devm_hwmon_device_register_with_info(
+		&hdev->udev->dev, "driver_fan", data, hwmon_info, NULL);
+	dev_info(&hdev->udev->dev, "[*] Setup hwmon\n");
+}
+
+/*
+ * Devices that work with this driver.
+ * More devices should work, however none have been tested.
+ */
+static const struct usb_device_id astk_table[] = {
+	{ USB_DEVICE(0x1b1c, 0x0c15) },
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
+	 *and you switch to this driver, the device will not respond unless you run this.
+	 */
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
+				 0xffff, 0x0000, 0, 0, 0);
+	/*this always returns error*/
+	if (retval)
+		;
+
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+				 0x0002, 0x0000, 0, 0, 0);
+	return retval;
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
+	kfree(hdev->bulk_in_buffer);
+	kfree(hdev->bulk_out_buffer);
+	kfree(hdev);
+}
+
+static int astk_probe(struct usb_interface *interface,
+		      const struct usb_device_id *id)
+{
+	struct hydro_i_pro_device *hdev;
+	int retval;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+
+	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
+	if (!hdev) {
+		retval = -ENOMEM;
+		goto exit;
+	}
+
+	hdev->config = get_device_configuration(id->idVendor, id->idProduct);
+	if (hdev->config == NULL) {
+		retval = -ENOMEM;
+		goto exit;
+	}
+
+	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
+					   &bulk_out, NULL, NULL);
+	if (retval)
+		goto exit;
+
+	hdev->udev = usb_get_dev(interface_to_usbdev(interface));
+	hdev->interface = usb_get_intf(interface);
+
+	/*
+	 * set up the endpoint information 
+	 * use only the first bulk-in and bulk-out endpoints 
+	 */
+	hdev->bulk_in_size = usb_endpoint_maxp(bulk_in);
+	hdev->bulk_in_buffer = kmalloc(hdev->bulk_in_size, GFP_KERNEL);
+	hdev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
+	hdev->bulk_out_size = usb_endpoint_maxp(bulk_out);
+	hdev->bulk_out_buffer = kmalloc(hdev->bulk_out_size, GFP_KERNEL);
+	hdev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
+
+	retval = init_device(hdev->udev);
+	if (retval) {
+		dev_err(&interface->dev, "failed initialising this device.\n");
+		goto exit;
+	}
+
+	hwmon_init(hdev);
+
+	usb_set_intfdata(interface, hdev);
+	sema_init(&hdev->limit_sem, 8);
+exit:
+	return retval;
+}
+
+static void astk_disconnect(struct usb_interface *interface)
+{
+	struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
+
+	dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");
+	usb_set_intfdata(interface, NULL);
+	astk_delete(hdev);
+	deinit_device(hdev->udev);
+}
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
+static int __init hydro_i_pro_init(void)
+{
+	return usb_register(&hydro_i_pro_driver);
+}
+
+static void __exit hydro_i_pro_exit(void)
+{
+	usb_deregister(&hydro_i_pro_driver);
+}
+
+module_init(hydro_i_pro_init);
+module_exit(hydro_i_pro_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
+MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
-- 
2.27.0

