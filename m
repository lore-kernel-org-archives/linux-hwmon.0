Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E48C6FA8F
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Aug 2023 20:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243523AbjHXUer (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 16:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243570AbjHXUe3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 16:34:29 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ADDE7D
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 13:34:27 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 79D53320031A;
        Thu, 24 Aug 2023 16:34:26 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute6.internal (MEProxy); Thu, 24 Aug 2023 16:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
        cc:cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1692909265; x=1692995665; bh=FS
        Ug+dPG3ZPg5catW9VcgZaZ2R8YuYwsSat78fU41Hw=; b=IOhmQmdZE+Ki4/Y8aY
        8XbHLxpTgA9cPh8N8pijX9hmmrUrdkabqyHiWoUvJWbbuUomRuQK4SEnod6TmnnY
        uISHU6db3yF+faxKLo6U3uTcinBVImF8MZSHI/VmrHxdtbz2B/Srwi6RSlVYY0lk
        uYddygw2nVCFQmMdNMh40WnflPVzgcAi9HfGE01oOJdgepdH44j1A799xJAtnSC7
        gIeNtksM+ICwikEfBWml4OIeR+ap8HVHdvF0zAoSU9O/u9vAKoIVRjvZEiSJFK5U
        In1ZI5NwB8kNFL1B3JoXJr8N7m0KBFfmZpxIEmZXju7zkjBf6W1x8YeLOJUfLq2G
        Xvvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692909265; x=1692995665; bh=FSUg+dPG3ZPg5
        catW9VcgZaZ2R8YuYwsSat78fU41Hw=; b=H9q4YiQb/qnYS8ACIaQPajFeSS0pw
        +NTpQDYPWEBjY8OEQoW5Mn5CG9lsUakxXEVq9yYwJ/KKJSeUUeEGVDyZqtRIqXHT
        +9o8TGooIXgDZe4/XM//iyEc6M7dJwKj7E7Hc+fDq0MphDwerMe06G7acnmUFvQz
        5GoYnsm8+yUHK6EIdyS8lbv8FtD8wqM879UJOoIhcTY+IeQQoGBHcCKgqngMQSMz
        tREMFnT5QqzfkMS2cNRGubB44lVP6n74f7ZH/tgc4JPj9KgENftCs0jCOY6e7Zye
        D+QaLHv+o0S6sf5mQdNZKIvjb08PJ6cbFsN3HQvSKLFzjikBH7DzQElJA==
X-ME-Sender: <xms:0b7nZPQwSW5Uglj0fqNYz6ePQVP8ggXCc-_bxi0-k_VEEYInvYox1Q>
    <xme:0b7nZAwsC7he9dtI_3Ck0cuA1iBofiyUMTp6i-nlXzAma-zaeDekab6wYwyhPOP45
    owmUkCQiFn7uKXJug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddviedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtse
    httdertderredtnecuhfhrohhmpedflfgvrhgvmhihucfuohhllhgvrhdfuceojhgvrhgv
    mhihsehshihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnheptdefheeugeekgf
    egjeevteehhfevgfefvdegueegudfhhfehuedvleejvdelkedunecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgvrhgvmhihsehshihsthgvmh
    ejiedrtghomh
X-ME-Proxy: <xmx:0b7nZE3hxGDGhENivqvleJ9S2voKeGPWMMIoG-FsiNQBDvly4PwBgA>
    <xmx:0b7nZPCHHtQZmW5j6ADbpdrwnKv6gzKXN9kFhJU7AxluYALviEZkiw>
    <xmx:0b7nZIhFpWwMHWAmOTj5v3ISB2nUDoVIB3T7O_y80m5qLK5FFEgDlQ>
    <xmx:0b7nZGdUTOs4nJep_UutzZjU2QAP4M-9_j79W8VT3v9baQqdZyluNw>
Feedback-ID: ic629427b:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B469A36A0075; Thu, 24 Aug 2023 16:34:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-647-g545049cfe6-fm-20230814.001-g545049cf
Mime-Version: 1.0
Message-Id: <fc68960f-609e-4fe4-a3e9-c23023717beb@app.fastmail.com>
In-Reply-To: <a2cc2fea-ae5c-4c03-8cf6-a913d39c253d@app.fastmail.com>
References: <84162cdd-cf70-4148-96ea-2a9d28a37ae2@app.fastmail.com>
 <a3af270b-d432-4cf2-b896-2512dc6b3a1d@roeck-us.net>
 <e50f3375-b3d2-40e8-bfa3-5e0bbb0f386f@app.fastmail.com>
 <a2cc2fea-ae5c-4c03-8cf6-a913d39c253d@app.fastmail.com>
Date:   Thu, 24 Aug 2023 14:34:04 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [PATCH v3] hwmon: Add System76 Thelio Io driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The System76 Thelio Io is a fan and power button LED controller. This
driver fully supports the System76 Thelio Io, by exposing fan controls
and sending the system suspend/resume state.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
---
 MAINTAINERS                        |   7 +
 drivers/hwmon/Kconfig              |  10 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/system76-thelio-io.c | 424 +++++++++++++++++++++++++++++
 4 files changed, 442 insertions(+)
 create mode 100644 drivers/hwmon/system76-thelio-io.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 48abe1a281f2..f4e8f7bdd1f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20738,6 +20738,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/system76_acpi.c
 
+SYSTEM76 THELIO IO DRIVER
+M:	Jeremy Soller <jeremy@system76.com>
+M:	System76 <info@system76.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/system76-thelio-io.c
+
 SYSV FILESYSTEM
 S:	Orphan
 F:	Documentation/filesystems/sysv-fs.rst
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 307477b8a371..fdcf0baa2669 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1965,6 +1965,16 @@ config SENSORS_SMM665
 	  This driver can also be built as a module. If so, the module will
 	  be called smm665.
 
+config SENSORS_SYSTEM76_THELIO_IO
+	tristate "System76 Thelio Io controller"
+	depends on HID
+	help
+	  If you say yes here you get support for the System76 Thelio Io
+	  controller.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called system76-thelio-io.
+
 config SENSORS_ADC128D818
 	tristate "Texas Instruments ADC128D818"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3f4b0fda0998..7cfdabb4e66f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -199,6 +199,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
 obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
+obj-$(CONFIG_SENSORS_SYSTEM76_THELIO_IO) += system76-thelio-io.o
 obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
 obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
 obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
diff --git a/drivers/hwmon/system76-thelio-io.c b/drivers/hwmon/system76-thelio-io.c
new file mode 100644
index 000000000000..4d9c2229cd3d
--- /dev/null
+++ b/drivers/hwmon/system76-thelio-io.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ * system76-thelio-io.c - Linux driver for System76 Thelio Io
+ * Copyright (C) 2023 System76
+ *
+ * Based on:
+ * corsair-cpro.c - Linux driver for Corsair Commander Pro
+ * Copyright (C) 2020 Marius Zachmann <mail@mariuszachmann.de>
+ *
+ * This driver uses hid reports to communicate with the device to allow hidraw userspace drivers
+ * still being used. The device does not use report ids. When using hidraw and this driver
+ * simultaniously, reports could be switched.
+ */
+
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/suspend.h>
+#include <linux/types.h>
+
+#define BUFFER_SIZE	32
+#define REQ_TIMEOUT	300
+
+#define HID_CMD		0
+#define HID_RES		1
+#define HID_DATA	2
+
+#define CMD_FAN_GET		7
+#define CMD_FAN_SET		8
+#define CMD_LED_SET_MODE	16
+#define CMD_FAN_TACH		22
+
+struct thelio_io_device {
+	struct hid_device *hdev;
+	struct device *hwmon_dev;
+#ifdef CONFIG_PM_SLEEP
+	struct notifier_block pm_notifier;
+#endif
+	struct completion wait_input_report;
+	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
+	u8 *buffer;
+};
+
+/* converts response error in buffer to errno */
+static int thelio_io_get_errno(struct thelio_io_device *thelio_io)
+{
+	switch (thelio_io->buffer[HID_RES]) {
+	case 0x00: /* success */
+		return 0;
+	default:
+		return -EIO;
+	}
+}
+
+/* send command, check for error in response, response in thelio_io->buffer */
+static int send_usb_cmd(struct thelio_io_device *thelio_io, u8 command,
+			u8 byte1, u8 byte2, u8 byte3)
+{
+	int ret;
+
+	memset(thelio_io->buffer, 0x00, BUFFER_SIZE);
+	thelio_io->buffer[HID_CMD] = command;
+	thelio_io->buffer[HID_DATA] = byte1;
+	thelio_io->buffer[HID_DATA + 1] = byte2;
+	thelio_io->buffer[HID_DATA + 2] = byte3;
+
+	reinit_completion(&thelio_io->wait_input_report);
+
+	ret = hid_hw_output_report(thelio_io->hdev, thelio_io->buffer, BUFFER_SIZE);
+	if (ret < 0)
+		return ret;
+
+	if (!wait_for_completion_timeout(&thelio_io->wait_input_report,
+					 msecs_to_jiffies(REQ_TIMEOUT)))
+		return -ETIMEDOUT;
+
+	return thelio_io_get_errno(thelio_io);
+}
+
+static int thelio_io_raw_event(struct hid_device *hdev, struct hid_report *report,
+			       u8 *data, int size)
+{
+	struct thelio_io_device *thelio_io = hid_get_drvdata(hdev);
+
+	/* only copy buffer when requested */
+	if (completion_done(&thelio_io->wait_input_report))
+		return 0;
+
+	memcpy(thelio_io->buffer, data, min(BUFFER_SIZE, size));
+	complete(&thelio_io->wait_input_report);
+
+	return 0;
+}
+
+/* requests and returns single data values depending on channel */
+static int get_data(struct thelio_io_device *thelio_io, int command, int channel,
+		    bool two_byte_data)
+{
+	int ret;
+
+	mutex_lock(&thelio_io->mutex);
+
+	ret = send_usb_cmd(thelio_io, command, channel, 0, 0);
+	if (ret)
+		goto out_unlock;
+
+	ret = thelio_io->buffer[HID_DATA + 1];
+	if (two_byte_data)
+		ret |= thelio_io->buffer[HID_DATA + 2] << 8;
+
+out_unlock:
+	mutex_unlock(&thelio_io->mutex);
+	return ret;
+}
+
+static int set_pwm(struct thelio_io_device *thelio_io, int channel, long val)
+{
+	int ret;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	mutex_lock(&thelio_io->mutex);
+
+	ret = send_usb_cmd(thelio_io, CMD_FAN_SET, channel, val, 0);
+
+	mutex_unlock(&thelio_io->mutex);
+	return ret;
+}
+
+static int thelio_io_read_string(struct device *dev, enum hwmon_sensor_types type,
+				 u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_label:
+			switch (channel) {
+			case 0:
+				*str = "CPU Fan";
+				return 0;
+			case 1:
+				*str = "Intake Fan";
+				return 0;
+			case 2:
+				*str = "GPU Fan";
+				return 0;
+			case 3:
+				*str = "Aux Fan";
+				return 0;
+			default:
+				break;
+			}
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int thelio_io_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *val)
+{
+	struct thelio_io_device *thelio_io = dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret = get_data(thelio_io, CMD_FAN_TACH, channel, true);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret = get_data(thelio_io, CMD_FAN_GET, channel, false);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+};
+
+static int thelio_io_write(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long val)
+{
+	struct thelio_io_device *thelio_io = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return set_pwm(thelio_io, channel, val);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+};
+
+static umode_t thelio_io_is_visible(const void *data, enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_label:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+};
+
+static const struct hwmon_ops thelio_io_hwmon_ops = {
+	.is_visible = thelio_io_is_visible,
+	.read = thelio_io_read,
+	.read_string = thelio_io_read_string,
+	.write = thelio_io_write,
+};
+
+static const struct hwmon_channel_info *thelio_io_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL
+			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT
+			   ),
+	NULL
+};
+
+static const struct hwmon_chip_info thelio_io_chip_info = {
+	.ops = &thelio_io_hwmon_ops,
+	.info = thelio_io_info,
+};
+
+#ifdef CONFIG_PM_SLEEP
+static int thelio_io_pm(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct thelio_io_device *thelio_io = container_of(nb, struct thelio_io_device, pm_notifier);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		mutex_lock(&thelio_io->mutex);
+		send_usb_cmd(thelio_io, CMD_LED_SET_MODE, 0, 1, 0);
+		mutex_unlock(&thelio_io->mutex);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_SUSPEND:
+		mutex_lock(&thelio_io->mutex);
+		send_usb_cmd(thelio_io, CMD_LED_SET_MODE, 0, 0, 0);
+		mutex_unlock(&thelio_io->mutex);
+		break;
+
+	case PM_POST_RESTORE:
+	case PM_RESTORE_PREPARE:
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+#endif
+
+static int thelio_io_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct thelio_io_device *thelio_io;
+	int ret;
+
+	thelio_io = devm_kzalloc(&hdev->dev, sizeof(*thelio_io), GFP_KERNEL);
+	if (!thelio_io)
+		return -ENOMEM;
+
+	thelio_io->buffer = devm_kmalloc(&hdev->dev, BUFFER_SIZE, GFP_KERNEL);
+	if (!thelio_io->buffer)
+		return -ENOMEM;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_open(hdev);
+	if (ret)
+		goto out_hw_stop;
+
+	thelio_io->hdev = hdev;
+	hid_set_drvdata(hdev, thelio_io);
+	mutex_init(&thelio_io->mutex);
+	init_completion(&thelio_io->wait_input_report);
+
+	hid_device_io_start(hdev);
+
+	if (hdev->maxcollection == 1 && hdev->collection[0].usage == 0xFF600061) {
+		thelio_io->hwmon_dev = hwmon_device_register_with_info(&hdev->dev,
+								       "system76_thelio_io",
+								       thelio_io,
+								       &thelio_io_chip_info,
+								       0);
+		if (IS_ERR(thelio_io->hwmon_dev)) {
+			ret = PTR_ERR(thelio_io->hwmon_dev);
+			goto out_hw_close;
+		}
+
+	#ifdef CONFIG_PM_SLEEP
+		thelio_io->pm_notifier.notifier_call = thelio_io_pm;
+		register_pm_notifier(&thelio_io->pm_notifier);
+	#endif
+	}
+
+	return 0;
+
+out_hw_close:
+	hid_hw_close(hdev);
+out_hw_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void thelio_io_remove(struct hid_device *hdev)
+{
+	struct thelio_io_device *thelio_io = hid_get_drvdata(hdev);
+
+	if (thelio_io->hwmon_dev) {
+		hwmon_device_unregister(thelio_io->hwmon_dev);
+
+	#ifdef CONFIG_PM_SLEEP
+		unregister_pm_notifier(&thelio_io->pm_notifier);
+	#endif
+	}
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id thelio_io_devices[] = {
+	{ HID_USB_DEVICE(0x3384, 0x000B) }, /* thelio_io_2 */
+	{ }
+};
+
+static struct hid_driver thelio_io_driver = {
+	.name = "system76-thelio-io",
+	.id_table = thelio_io_devices,
+	.probe = thelio_io_probe,
+	.remove = thelio_io_remove,
+	.raw_event = thelio_io_raw_event,
+};
+
+MODULE_DEVICE_TABLE(hid, thelio_io_devices);
+MODULE_LICENSE("GPL");
+
+static int __init thelio_io_init(void)
+{
+	return hid_register_driver(&thelio_io_driver);
+}
+
+static void __exit thelio_io_exit(void)
+{
+	hid_unregister_driver(&thelio_io_driver);
+}
+
+/*
+ * When compiling this driver as built-in, hwmon initcalls will get called before the
+ * hid driver and this driver would fail to register. late_initcall solves this.
+ */
+late_initcall(thelio_io_init);
+module_exit(thelio_io_exit);
-- 
2.34.1
