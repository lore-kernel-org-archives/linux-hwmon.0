Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29599C433E1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC2E3221FD
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG3G+r1B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgGNKEF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 06:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgGNKEE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 06:04:04 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CACC061755;
        Tue, 14 Jul 2020 03:04:04 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y10so20909470eje.1;
        Tue, 14 Jul 2020 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FoFCdoq0mvyOA4dLvLGRa4+3iPp0G4Z9Noxq96BRCQM=;
        b=ZG3G+r1BqlIKp4BJEg6GtOmFqiRO858TPnemO2ohEJTZgNomlhLscS22J5uButb6pN
         L2+oDxquc+gTeuCtvEd+znA42+OH4I01aNpDM9nkwyJPYyKzZoA+OsJ5ezDnpqmRDNQr
         oGeNhjVECqAf2zMITVaGm/Pz+sWjPQTLKOLJ4YZlZtI8JTKX122A+cPvJt0/ztmy6N1S
         IbWEGb3b1Q7EGWub9q0/yAa4JytLULqPjRfUNxfPkhAxHz+Ih2Q3/NYCNTkAjngyVC3g
         lLASWLPOK99OuqonUDrO85hoQfEznRyqQ/d39OXTRwjzNFZVK1Vd7j66RbrA45n3l20p
         BCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FoFCdoq0mvyOA4dLvLGRa4+3iPp0G4Z9Noxq96BRCQM=;
        b=a3j4MzzJVhHOOmIfvEki+QsXisCL7yA9ggWPzMsljJCqgwb1e94K22GK3OSCdPOgsa
         P1YtSUhX4IfnbwYnJhkZAHDdnMrwJlGYHL/mV7jG1xw0JDn3VL7/yhIeq4H+AwKr2v3W
         czzPuLkaiYU+mV8/uJ9PTfE3UNWNGCK7RI9MsmLyPyrzC20BKEWV5DzIR7vP+3b0mcWg
         fDrIutjKDIQyhLNjzA/mryi0BBfXRErH1bQAquJoP1nnGvVxAUkNRHDLM1gIToV8kIfb
         LSHee7WBuHkTVT12Mb1SFA7iO5aHeA+iJ+zNw3TN6r8TrAnH5Ef5nH6BS8axZspIOvkk
         lKTw==
X-Gm-Message-State: AOAM5300aqeY3kin0/NsOEYSKTeex35sMB5QImc3uYdbcPFitL/dmqub
        aYGScXepZUKkWD7/8HtJnXc=
X-Google-Smtp-Source: ABdhPJw4iZEEdw16z3UYfxpU1r5pXG9qMrrZH8DZ2sTcqJO0SzqmKlQ+2idQv3FJMzQ1iuw8pVVovQ==
X-Received: by 2002:a17:906:1453:: with SMTP id q19mr3864757ejc.111.1594721042770;
        Tue, 14 Jul 2020 03:04:02 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id d23sm12055378eja.27.2020.07.14.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 03:04:02 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     jaap aarts <jaap.aarts1@gmail.com>
Subject: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Date:   Tue, 14 Jul 2020 12:03:38 +0200
Message-Id: <20200714100337.48719-1-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adds fan/pwm support for H1000i platinum.
Custom temp/fan curves are not supported, however
the presets found in the proprietary drivers are avaiable.

Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
---
 drivers/hwmon/Kconfig       |   6 +
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/asetek_gen6.c | 801 ++++++++++++++++++++++++++++++++++++
 3 files changed, 808 insertions(+)
 create mode 100644 drivers/hwmon/asetek_gen6.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 288ae9f63588..521a9e0c88ca 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -378,6 +378,12 @@ config SENSORS_ARM_SCPI
 	  and power sensors available on ARM Ltd's SCP based platforms. The
 	  actual number and type of sensors exported depend on the platform.
 
+config SENSORS_ASETEK_GEN6
+	tristate "Asetek generation 6 driver"
+	help
+	  If you say yes here you get support for asetek generation 6 boards
+	  found on most AIO liquid coolers with an asetek pump.
+
 config SENSORS_ASB100
 	tristate "Asus ASB100 Bach"
 	depends on X86 && I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3e32c21f5efe..9683d2aae2b2 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
 obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
 obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
 obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
+obj-$(CONFIG_SENSORS_ASETEK_GEN6)	+= asetek_gen6.o
 
 obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
 obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
new file mode 100644
index 000000000000..4aea9ae0b944
--- /dev/null
+++ b/drivers/hwmon/asetek_gen6.c
@@ -0,0 +1,801 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * A hwmon driver for most asetek gen 6 all-in-one liquid coolers.
+ * Copyright (c) Jaap Aarts 2020
+ * 
+ * Protocol reverse engineered by audiohacked
+ * https://github.com/audiohacked/OpendriverLink
+ */
+
+/*
+ * Supports following chips:
+ * h100i platinum
+ * 
+ * Other products should work with this driver but no testing has been done.
+ * 
+ * Note: platinum is the codename name for pro within driver, so h100i platinum = h1ooi pro
+ * 
+ * Note: fan curve control has not been implemented
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+
+struct driver {
+	struct usb_device *udev;
+
+	char *bulk_out_buffer;
+	char *bulk_in_buffer;
+	size_t bulk_out_size;
+	size_t bulk_in_size;
+	char bulk_in_endpointAddr;
+	char bulk_out_endpointAddr;
+
+	struct usb_interface *interface; /* the interface for this device */
+	struct mutex io_mutex; /* synchronize I/O with disconnect */
+	struct semaphore
+		limit_sem; /* limiting the number of writes in progress */
+
+	struct kref kref;
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
+struct hwmon_data {
+	struct driver *dev;
+	int channel_count;
+	void **channel_data;
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
+struct curve_point balanced_curve[] = {
+	{
+		.temp = 0x1C,
+		.pwm = 0x15,
+	},
+	{
+		.temp = 0x1E,
+		.pwm = 0x1B,
+	},
+	{
+		.temp = 0x20,
+		.pwm = 0x23,
+	},
+	{
+		.temp = 0x22,
+		.pwm = 0x28,
+	},
+	{
+		.temp = 0x24,
+		.pwm = 0x32,
+	},
+	{
+		.temp = 0x27,
+		.pwm = 0x48,
+	},
+	{
+		.temp = 0x29,
+		.pwm = 0x64,
+	},
+};
+
+struct curve_point extreme_curve[] = {
+	{
+		.temp = 0x19,
+		.pwm = 0x28,
+	},
+	{
+		.temp = 0x1B,
+		.pwm = 0x2E,
+	},
+	{
+		.temp = 0x1D,
+		.pwm = 0x37,
+	},
+	{
+		.temp = 0x1E,
+		.pwm = 0x41,
+	},
+	{
+		.temp = 0x1F,
+		.pwm = 0x4C,
+	},
+	{
+		.temp = 0x20,
+		.pwm = 0x56,
+	},
+	{
+		.temp = 0x21,
+		.pwm = 0x64,
+	},
+};
+
+#define default_curve quiet_curve
+
+static const char SUCCESS[2] = { 0x12, 0x34 };
+
+#define SUCCES_LENGTH 3
+
+static bool check_succes(char command, char ret[SUCCES_LENGTH])
+{
+	char success[SUCCES_LENGTH] = { command };
+
+	strncpy(&success[1], SUCCESS, SUCCES_LENGTH - 1);
+	return strncmp(ret, success, SUCCES_LENGTH - 1) == 0;
+}
+
+int set_fan_rpm_curve(struct driver *cdev, struct hwmon_fan_data *fan_data,
+		      struct curve_point point[7])
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
+
+	send_buf[0] = 0x40;
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
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 16, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf))
+		dev_info("[*] Failled setting fan curve %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+	return 0;
+}
+
+int set_fan_target_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
+		       long val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	fan_data->fan_target = val;
+	fan_data->fan_pwm_target = 0;
+
+	send_buf[0] = 0x43;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = (fan_data->fan_target >> 8);
+	send_buf[3] = fan_data->fan_target;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
+	if (retval != 0)
+		return retval;
+
+	//no error
+	if (!check_succes(send_buf[0], recv_buf))
+		dev_info("[*] Failled setting fan rpm %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+	return 0;
+}
+
+void get_fan_target_rpm(struct hwmon_fan_data *fan_data, long *val)
+{
+	*val = fan_data->fan_target;
+}
+
+int get_fan_current_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
+			long *val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	send_buf[0] = 0x41;
+	send_buf[1] = fan_data->fan_channel;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 2, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	if (!check_succes(0x41, recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel)
+		dev_info("[*] Failled retrieving fan rmp %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+
+	*val = (((uint8_t)recv_buf[4]) << 8) + (uint8_t)recv_buf[5];
+	return 0;
+}
+
+int set_fan_target_pwm(struct driver *cdev, struct hwmon_fan_data *fan_data,
+		       long val)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	unsigned char *send_buf = cdev->bulk_out_buffer;
+	unsigned char *recv_buf = cdev->bulk_in_buffer;
+
+	fan_data->fan_pwm_target = val;
+	fan_data->fan_target = 0;
+
+	send_buf[0] = 0x42;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[3] = fan_data->fan_pwm_target;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return retval;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
+	if (retval != 0)
+		return retval;
+
+	//no error
+	if (!check_succes(send_buf[0], recv_buf))
+		dev_info("[*] Failled setting fan pwm %d,%d,%d/%d\n",
+			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
+	return 0;
+}
+
+umode_t is_visible_func(const void *d, enum hwmon_sensor_types type, u32 attr,
+			int channel)
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
+		case hwmon_pwm_mode:
+			return 0644;
+			break;
+		default:
+			break;
+		}
+		break;
+
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int write_func(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct driver *cdev = data->dev;
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
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = set_fan_target_rpm(cdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			goto exit;
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
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = set_fan_target_pwm(cdev, fan_data, val);
+			if (retval)
+				return retval;
+
+			goto cleanup;
+		case hwmon_pwm_enable:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+			fan_data->mode = val;
+
+			switch (val) {
+			case 0:
+				set_fan_rpm_curve(cdev, fan_data,
+						  default_curve);
+				break;
+			case 1:
+				if (fan_data->fan_target != 0) {
+					retval = set_fan_target_rpm(
+						cdev, fan_data,
+						fan_data->fan_target);
+					if (retval)
+						goto cleanup;
+				} else if (fan_data->fan_pwm_target != 0) {
+					retval = set_fan_target_pwm(
+						cdev, fan_data,
+						fan_data->fan_pwm_target);
+					if (retval)
+						goto cleanup;
+				}
+				break;
+			case 2:
+				set_fan_rpm_curve(cdev, fan_data, quiet_curve);
+				break;
+			case 3:
+				set_fan_rpm_curve(cdev, fan_data,
+						  balanced_curve);
+				break;
+			case 4:
+				set_fan_rpm_curve(cdev, fan_data,
+						  extreme_curve);
+				break;
+			}
+			goto cleanup;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+	default:
+		return -EINVAL;
+	}
+
+cleanup:
+	up(&cdev->limit_sem);
+cleanup_interface:
+	usb_autopm_put_interface(cdev->interface);
+exit:
+	return retval;
+}
+
+int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	      int channel, long *val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct driver *cdev = data->dev;
+	struct hwmon_fan_data *fan_data;
+	int retval = 0;
+
+	if (channel >= data->channel_count)
+		return -EAGAIN;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			fan_data = data->channel_data[channel];
+
+			retval = usb_autopm_get_interface(cdev->interface);
+			if (retval)
+				goto exit;
+
+			if (down_trylock(&cdev->limit_sem)) {
+				retval = -EAGAIN;
+				goto cleanup_interface;
+			}
+
+			retval = get_fan_current_rpm(cdev, fan_data, val);
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
+
+			get_fan_target_rpm(fan_data, val);
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
+		case hwmon_pwm_mode:
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
+	up(&cdev->limit_sem);
+cleanup_interface:
+	usb_autopm_put_interface(cdev->interface);
+exit:
+	return retval;
+}
+
+#define fan_config (HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN)
+#define pwm_config (HWMON_PWM_INPUT | HWMON_PWM_ENABLE)
+
+static const struct hwmon_ops asetek_6_ops = {
+	.is_visible = is_visible_func,
+	.read = read_func,
+	.write = write_func,
+};
+
+bool does_fan_exist(struct driver *cdev, int channel)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
+
+	char *send_buf = cdev->bulk_out_buffer;
+	char *recv_buf = cdev->bulk_in_buffer;
+
+	send_buf[0] = 0x43;
+	send_buf[1] = channel;
+	send_buf[2] = (600 >> 8);
+	send_buf[3] = 600;
+
+	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
+	if (retval != 0)
+		return false;
+
+	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
+	if (retval != 0)
+		return false;
+
+	if (!check_succes(send_buf[0], recv_buf))
+		return false;
+	return true;
+}
+
+int get_fan_count(struct driver *dev)
+{
+	int fan;
+
+	for (fan = 0; does_fan_exist(dev, fan); fan += 1)
+		;
+	return fan;
+}
+
+void hwmon_init(struct driver *dev)
+{
+	int fan_id;
+	struct device *hwmon_dev;
+	struct hwmon_fan_data *fan;
+	struct hwmon_data *data = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
+	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
+	//Allocate the info table
+	struct hwmon_channel_info **aio_info =
+		devm_kzalloc(&dev->udev->dev,
+			     sizeof(struct hwmon_channel_info *) * 2,
+			     GFP_KERNEL); //2 for each channel info.
+
+	//Allocate the fan and PWM configuration
+	u32 *fans_config = devm_kzalloc(&dev->udev->dev,
+					sizeof(u32) * (data->channel_count + 1),
+					GFP_KERNEL);
+	u32 *pwms_config = devm_kzalloc(&dev->udev->dev,
+					sizeof(u32) * (data->channel_count + 1),
+					GFP_KERNEL);
+
+	data->channel_count = get_fan_count(dev); //amount of fans
+	data->channel_data =
+		devm_kzalloc(&dev->udev->dev,
+			     sizeof(char *) * data->channel_count, GFP_KERNEL);
+
+	//For each fan create a data channel a fan config entry and a pwm config entry
+	for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
+		fan = devm_kzalloc(&dev->udev->dev,
+				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
+		fan->fan_channel = fan_id;
+		fan->mode = 2;
+		data->channel_data[fan_id] = fan;
+		fans_config[fan_id] = fan_config;
+		pwms_config[fan_id] = pwm_config;
+	}
+	fans_config[data->channel_count] = 0;
+	pwms_config[data->channel_count] = 0;
+
+	aio_info[0] = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_channel_info), GFP_KERNEL);
+	aio_info[0]->type = hwmon_fan;
+	aio_info[0]->config = fans_config;
+
+	aio_info[1] = devm_kzalloc(
+		&dev->udev->dev, sizeof(struct hwmon_channel_info), GFP_KERNEL);
+	aio_info[1]->type = hwmon_pwm;
+	aio_info[1]->config = pwms_config;
+
+	hwmon_info->ops = &asetek_6_ops;
+	hwmon_info->info = (const struct hwmon_channel_info **)aio_info;
+
+	data->dev = dev;
+	hwmon_dev = devm_hwmon_device_register_with_info(
+		&dev->udev->dev, "driver_fan", data, hwmon_info, NULL);
+	dev_info("[*] Setup hwmon\n");
+}
+
+void hwmon_deinit(struct driver *dev)
+{
+	hwmon_device_unregister(&dev->udev->dev);
+	dev_info("[*] HWMON DISCONNECT\n");
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
+int init_device(struct usb_device *udev)
+{
+	int retval;
+
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
+				 0xffff, 0x0000, 0, 0, 0);
+	//this always returns error
+	if (retval != 0)
+		;
+
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+				 0x0002, 0x0000, 0, 0, 0);
+	if (retval != 0)
+		return retval;
+
+	return 0;
+}
+
+int deinit_device(struct usb_device *udev)
+{
+	int retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+				     0x0004, 0x0000, 0, 0, 0);
+	if (retval != 0)
+		return retval;
+
+	return 0;
+}
+
+static void astk_delete(struct kref *kref)
+{
+	struct driver *dev = container_of(kref, struct driver, kref);
+
+	usb_put_intf(dev->interface);
+	usb_put_dev(dev->udev);
+	kfree(dev->bulk_in_buffer);
+	kfree(dev->bulk_out_buffer);
+	kfree(dev);
+}
+
+static int astk_probe(struct usb_interface *interface,
+		      const struct usb_device_id *id)
+{
+	struct driver *dev;
+	int retval = 0;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev) {
+		retval = -ENOMEM;
+		goto exit;
+	}
+
+	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
+					   &bulk_out, NULL, NULL);
+	if (retval != 0)
+		goto exit;
+
+	dev->udev = usb_get_dev(interface_to_usbdev(interface));
+	dev->interface = usb_get_intf(interface);
+
+	/* set up the endpoint information */
+	/* use only the first bulk-in and bulk-out endpoints */
+	dev->bulk_in_size = usb_endpoint_maxp(bulk_in);
+	dev->bulk_in_buffer = kmalloc(dev->bulk_in_size, GFP_KERNEL);
+	dev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
+	dev->bulk_out_size = usb_endpoint_maxp(bulk_out);
+	dev->bulk_out_buffer = kmalloc(dev->bulk_out_size, GFP_KERNEL);
+	dev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
+
+	retval = init_device(dev->udev);
+	if (retval) {
+		dev_err(&interface->dev, "Failled initialising this device.\n");
+		goto exit;
+	}
+
+	hwmon_init(dev);
+
+	usb_set_intfdata(interface, dev);
+	kref_init(&dev->kref);
+	mutex_init(&dev->io_mutex);
+	sema_init(&dev->limit_sem, 8);
+exit:
+	return retval;
+}
+
+static void astk_disconnect(struct usb_interface *interface)
+{
+	struct driver *dev = usb_get_intfdata(interface);
+
+	hwmon_deinit(dev);
+	usb_set_intfdata(interface, NULL);
+	kref_put(&dev->kref, astk_delete);
+	deinit_device(dev->udev);
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
+static struct usb_driver astk_driver = {
+	.name = "Asetek gen6 driver",
+	.id_table = astk_table,
+	.probe = astk_probe,
+	.disconnect = astk_disconnect,
+	.resume = astk_resume,
+	.suspend = astk_suspend,
+	.supports_autosuspend = 1,
+};
+
+static int __init astk_init(void)
+{
+	int ret = usb_register(&astk_driver);
+
+	return ret;
+}
+
+static void __exit astk_exit(void)
+{
+	usb_deregister(&astk_driver);
+}
+
+module_init(astk_init);
+module_exit(astk_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
+MODULE_DESCRIPTION("Asetek gen6 driver");
-- 
2.27.0

