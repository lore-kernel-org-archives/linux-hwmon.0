Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4EBC6FA8F
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Aug 2023 02:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjHYC5T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 22:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234426AbjHYC4r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 22:56:47 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9554410F
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 19:56:44 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-570e005c480so357812eaf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 19:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692932204; x=1693537004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/R0ZqMBzJhCv+Dc0jw9w1p2CuU0BFjb+1mF+I/a+dso=;
        b=G+9TNsk64P0v7Eu+D8Udi8qODc1YLUXMFZOGHVmOtBGf4cp91bDC/fA98omxg6POyX
         ZgQ4uLtaeh4vC3Cq3A3Pfnw3+M4uHax6OOS2MzsXGz283pT7SuXNWN9QwgElIzSe/Smv
         9FghK7soRsbJgums/ZrgV46onTS0ECMPPjRg/FcYct3QrAq+Zgmi1qs6ZVhY+eVduP1h
         kBsNaJRRCoJyTQJ3MPj5yFa1FLYM+BVPoDXHG9tWi5XMY7xYsXHmOKk8IrtVNdskGlco
         qAdqRLBEK6yHrF6Tx3J2hlHWPziWTf8BeIIGv2pl4clP4s7uvK8ueI88QbxJQXi+GRiX
         tQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692932204; x=1693537004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R0ZqMBzJhCv+Dc0jw9w1p2CuU0BFjb+1mF+I/a+dso=;
        b=LYC0W/zr/uuKanRH1k9xk7hJKVAcrgUUhoXMQ+V7V1YsfwdIY5TUzhEvOhlpfvaaK8
         MZFTTaKJBh5MRC3I9DrnUz810FsxD5LatxUSV7mZjujx+Pa6imHFIX276rPiYggq7CVi
         v2spTutUXaX85XK7URKOOXyJ4dQ23AdpocwGog4J7AsmgmBRkBGliryF/qIldfEPTqmQ
         ZG45HU5GYOxexD4f2SJHOn/PV4dYa//kGFUA2ynAcMs8ZUCoLFWuC7ujLBLcOSv7SoOl
         5RdK1xwk1yz5Xno9ohw6PGC8SOhT2l9XbeqGtTcz5lid1Z2rNKL5GN/GClDSn5a/nEdU
         lG2A==
X-Gm-Message-State: AOJu0YzSwEqtqbtjeOLmqB5rEEHGe6Kx8vhWGpX90uTf+gyhoFrPcwyn
        t73Igk+v38clKuGqQO/IWUs7ty/Cwsg=
X-Google-Smtp-Source: AGHT+IGbgW4bHiS6USBC2bgb5CedVc+5bK3aOd78c7T7MEoVToCy0ApYFz/u88voQmmcUa0O86RUzQ==
X-Received: by 2002:a05:6870:b522:b0:1b0:2ded:bd7 with SMTP id v34-20020a056870b52200b001b02ded0bd7mr1811477oap.26.1692932203601;
        Thu, 24 Aug 2023 19:56:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gw15-20020a17090b0a4f00b0026f90d7947csm445360pjb.34.2023.08.24.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:56:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Aug 2023 19:56:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jeremy Soller <jeremy@system76.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: Add System76 Thelio Io driver
Message-ID: <94fb1d6c-7ddc-4d7c-8ef7-44a1f3fe7038@roeck-us.net>
References: <84162cdd-cf70-4148-96ea-2a9d28a37ae2@app.fastmail.com>
 <a3af270b-d432-4cf2-b896-2512dc6b3a1d@roeck-us.net>
 <e50f3375-b3d2-40e8-bfa3-5e0bbb0f386f@app.fastmail.com>
 <a2cc2fea-ae5c-4c03-8cf6-a913d39c253d@app.fastmail.com>
 <fc68960f-609e-4fe4-a3e9-c23023717beb@app.fastmail.com>
 <4d3dff93-5c70-4ca1-b819-7f0eca3a8b38@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d3dff93-5c70-4ca1-b819-7f0eca3a8b38@app.fastmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 24, 2023 at 02:39:02PM -0600, Jeremy Soller wrote:
> The System76 Thelio Io is a fan and power button LED controller. This
> driver fully supports the System76 Thelio Io, by exposing fan controls
> and sending the system suspend/resume state.
> 

You might want to consider reading
Documentation/process/submitting-patches.rst. It would tell you that

... However, for a multi-patch series, it is generally
best to avoid using In-Reply-To: to link to older versions of the
series.  This way multiple versions of the patch don't become an
unmanageable forest of references in email clients.  If a link is
helpful, you can use the https://lore.kernel.org/ redirector (e.g., in
the cover email text) to link to an earlier version of the patch series.

It might possibly make sense to also add a note saying something like
"don't send X revisions of your patch in a row".

> Signed-off-by: Jeremy Soller <jeremy@system76.com>
> ---

Missing change log. You are flooding me with patch revisions. Do you
really expect me to look into each of those to figure out what you
changed ?

Random feedback below. Since the is no explanation for what has
changed and what hasn't and why, the feedback is necessarily
incomplete.

>  Documentation/hwmon/system76-thelio-io.rst |  31 ++

Missing reference in Documentation/hwmon/index.rst

>  MAINTAINERS                                |   7 +
>  drivers/hwmon/Kconfig                      |  10 +
>  drivers/hwmon/Makefile                     |   1 +
>  drivers/hwmon/system76-thelio-io.c         | 424 +++++++++++++++++++++
>  5 files changed, 473 insertions(+)
>  create mode 100644 Documentation/hwmon/system76-thelio-io.rst
>  create mode 100644 drivers/hwmon/system76-thelio-io.c
> 
> diff --git a/Documentation/hwmon/system76-thelio-io.rst b/Documentation/hwmon/system76-thelio-io.rst
> new file mode 100644
> index 000000000000..7ca34bb47bbb
> --- /dev/null
> +++ b/Documentation/hwmon/system76-thelio-io.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver system76-thelio-io
> +==========================
> +
> +Supported devices:
> +
> +  * System76 Thelio Io (thelio_io_2)
> +
> +Author: Jeremy Soller
> +
> +Description
> +-----------
> +
> +This driver implements the sysfs interface for the System76 Thelio Io.
> +The System76 Thelio Io is a USB device with 4 fan connectors and a
> +power button LED.
> +
> +Usage Notes
> +-----------
> +
> +Since it is a USB device, hotswapping is possible. The device is autodetected.
> +
> +Sysfs entries
> +-------------
> +
> +======================= =====================================================================
> +fan[1-4]_input		Connected fan rpm.
> +fan[1-4]_label		Shows fan connector name.
> +pwm[1-4]		Sets the fan speed. Values from 0-255.
> +======================= =====================================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 48abe1a281f2..f4e8f7bdd1f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20738,6 +20738,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/system76_acpi.c
>  
> +SYSTEM76 THELIO IO DRIVER
> +M:	Jeremy Soller <jeremy@system76.com>
> +M:	System76 <info@system76.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/system76-thelio-io.c
> +
>  SYSV FILESYSTEM
>  S:	Orphan
>  F:	Documentation/filesystems/sysv-fs.rst
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 307477b8a371..fdcf0baa2669 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1965,6 +1965,16 @@ config SENSORS_SMM665
>  	  This driver can also be built as a module. If so, the module will
>  	  be called smm665.
>  
> +config SENSORS_SYSTEM76_THELIO_IO
> +	tristate "System76 Thelio Io controller"
> +	depends on HID
> +	help
> +	  If you say yes here you get support for the System76 Thelio Io
> +	  controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called system76-thelio-io.
> +
>  config SENSORS_ADC128D818
>  	tristate "Texas Instruments ADC128D818"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3f4b0fda0998..7cfdabb4e66f 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -199,6 +199,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>  obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
>  obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
>  obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
> +obj-$(CONFIG_SENSORS_SYSTEM76_THELIO_IO) += system76-thelio-io.o
>  obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>  obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
>  obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
> diff --git a/drivers/hwmon/system76-thelio-io.c b/drivers/hwmon/system76-thelio-io.c
> new file mode 100644
> index 000000000000..4d9c2229cd3d
> --- /dev/null
> +++ b/drivers/hwmon/system76-thelio-io.c
> @@ -0,0 +1,424 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *
> + * system76-thelio-io.c - Linux driver for System76 Thelio Io
> + * Copyright (C) 2023 System76
> + *
> + * Based on:
> + * corsair-cpro.c - Linux driver for Corsair Commander Pro
> + * Copyright (C) 2020 Marius Zachmann <mail@mariuszachmann.de>
> + *
> + * This driver uses hid reports to communicate with the device to allow hidraw userspace drivers
> + * still being used. The device does not use report ids. When using hidraw and this driver
> + * simultaniously, reports could be switched.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/completion.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/suspend.h>
> +#include <linux/types.h>
> +
> +#define BUFFER_SIZE	32
> +#define REQ_TIMEOUT	300

Nit: It is customary to either add a comment describing the unit
(here: milli-seconds) or to indicate it in the define (e.g.
REQ_TIMEOUT_MS).
> +
> +#define HID_CMD		0
> +#define HID_RES		1
> +#define HID_DATA	2
> +
> +#define CMD_FAN_GET		7
> +#define CMD_FAN_SET		8
> +#define CMD_LED_SET_MODE	16
> +#define CMD_FAN_TACH		22
> +
> +struct thelio_io_device {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;
> +#ifdef CONFIG_PM_SLEEP
> +	struct notifier_block pm_notifier;
> +#endif
> +	struct completion wait_input_report;
> +	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
> +	u8 *buffer;
> +};
> +
> +/* converts response error in buffer to errno */
> +static int thelio_io_get_errno(struct thelio_io_device *thelio_io)
> +{
> +	switch (thelio_io->buffer[HID_RES]) {
> +	case 0x00: /* success */
> +		return 0;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +/* send command, check for error in response, response in thelio_io->buffer */
> +static int send_usb_cmd(struct thelio_io_device *thelio_io, u8 command,
> +			u8 byte1, u8 byte2, u8 byte3)
> +{
> +	int ret;
> +
> +	memset(thelio_io->buffer, 0x00, BUFFER_SIZE);
> +	thelio_io->buffer[HID_CMD] = command;
> +	thelio_io->buffer[HID_DATA] = byte1;
> +	thelio_io->buffer[HID_DATA + 1] = byte2;
> +	thelio_io->buffer[HID_DATA + 2] = byte3;
> +
> +	reinit_completion(&thelio_io->wait_input_report);
> +
> +	ret = hid_hw_output_report(thelio_io->hdev, thelio_io->buffer, BUFFER_SIZE);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!wait_for_completion_timeout(&thelio_io->wait_input_report,
> +					 msecs_to_jiffies(REQ_TIMEOUT)))
> +		return -ETIMEDOUT;
> +
> +	return thelio_io_get_errno(thelio_io);
> +}
> +
> +static int thelio_io_raw_event(struct hid_device *hdev, struct hid_report *report,
> +			       u8 *data, int size)
> +{
> +	struct thelio_io_device *thelio_io = hid_get_drvdata(hdev);
> +
> +	/* only copy buffer when requested */
> +	if (completion_done(&thelio_io->wait_input_report))
> +		return 0;
> +
> +	memcpy(thelio_io->buffer, data, min(BUFFER_SIZE, size));
> +	complete(&thelio_io->wait_input_report);
> +
> +	return 0;
> +}
> +
> +/* requests and returns single data values depending on channel */
> +static int get_data(struct thelio_io_device *thelio_io, int command, int channel,
> +		    bool two_byte_data)
> +{
> +	int ret;
> +
> +	mutex_lock(&thelio_io->mutex);
> +
> +	ret = send_usb_cmd(thelio_io, command, channel, 0, 0);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = thelio_io->buffer[HID_DATA + 1];
> +	if (two_byte_data)
> +		ret |= thelio_io->buffer[HID_DATA + 2] << 8;
> +
> +out_unlock:
> +	mutex_unlock(&thelio_io->mutex);
> +	return ret;
> +}
> +
> +static int set_pwm(struct thelio_io_device *thelio_io, int channel, long val)
> +{
> +	int ret;
> +
> +	if (val < 0 || val > 255)
> +		return -EINVAL;
> +
> +	mutex_lock(&thelio_io->mutex);
> +
> +	ret = send_usb_cmd(thelio_io, CMD_FAN_SET, channel, val, 0);
> +
> +	mutex_unlock(&thelio_io->mutex);
> +	return ret;
> +}
> +
> +static int thelio_io_read_string(struct device *dev, enum hwmon_sensor_types type,
> +				 u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_label:
> +			switch (channel) {
> +			case 0:
> +				*str = "CPU Fan";
> +				return 0;
> +			case 1:
> +				*str = "Intake Fan";
> +				return 0;
> +			case 2:
> +				*str = "GPU Fan";
> +				return 0;
> +			case 3:
> +				*str = "Aux Fan";
> +				return 0;
> +			default:
> +				break;
> +			}
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int thelio_io_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *val)
> +{
> +	struct thelio_io_device *thelio_io = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			ret = get_data(thelio_io, CMD_FAN_TACH, channel, true);
> +			if (ret < 0)
> +				return ret;
> +			*val = ret;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = get_data(thelio_io, CMD_FAN_GET, channel, false);
> +			if (ret < 0)
> +				return ret;
> +			*val = ret;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +};
> +
> +static int thelio_io_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
> +{
> +	struct thelio_io_device *thelio_io = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return set_pwm(thelio_io, channel, val);
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +};
> +
> +static umode_t thelio_io_is_visible(const void *data, enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_label:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +};
> +
> +static const struct hwmon_ops thelio_io_hwmon_ops = {
> +	.is_visible = thelio_io_is_visible,
> +	.read = thelio_io_read,
> +	.read_string = thelio_io_read_string,
> +	.write = thelio_io_write,
> +};
> +
> +static const struct hwmon_channel_info *thelio_io_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL
> +			   ),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT
> +			   ),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info thelio_io_chip_info = {
> +	.ops = &thelio_io_hwmon_ops,
> +	.info = thelio_io_info,
> +};
> +
> +#ifdef CONFIG_PM_SLEEP

You suggested in one of your replies that is would by my responsibility
to prove that standard PM calls are insufficient. That is not the case.

> +static int thelio_io_pm(struct notifier_block *nb, unsigned long action, void *data)
> +{
> +	struct thelio_io_device *thelio_io = container_of(nb, struct thelio_io_device, pm_notifier);
> +
> +	switch (action) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_SUSPEND_PREPARE:
> +		mutex_lock(&thelio_io->mutex);
> +		send_usb_cmd(thelio_io, CMD_LED_SET_MODE, 0, 1, 0);
> +		mutex_unlock(&thelio_io->mutex);
> +		break;
> +
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_SUSPEND:
> +		mutex_lock(&thelio_io->mutex);
> +		send_usb_cmd(thelio_io, CMD_LED_SET_MODE, 0, 0, 0);
> +		mutex_unlock(&thelio_io->mutex);
> +		break;
> +
> +	case PM_POST_RESTORE:
> +	case PM_RESTORE_PREPARE:
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +#endif
> +
> +static int thelio_io_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +	struct thelio_io_device *thelio_io;
> +	int ret;
> +
> +	thelio_io = devm_kzalloc(&hdev->dev, sizeof(*thelio_io), GFP_KERNEL);
> +	if (!thelio_io)
> +		return -ENOMEM;
> +
> +	thelio_io->buffer = devm_kmalloc(&hdev->dev, BUFFER_SIZE, GFP_KERNEL);
> +	if (!thelio_io->buffer)
> +		return -ENOMEM;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_open(hdev);
> +	if (ret)
> +		goto out_hw_stop;
> +
> +	thelio_io->hdev = hdev;
> +	hid_set_drvdata(hdev, thelio_io);
> +	mutex_init(&thelio_io->mutex);
> +	init_completion(&thelio_io->wait_input_report);
> +
> +	hid_device_io_start(hdev);
> +

Just in case the below is _really_ necessary, which seems unlikely to me,
why call hid_device_io_start() even if no hwmon device is going to be
registered ? Why start IO on a device that isn't doing anything ?

> +	if (hdev->maxcollection == 1 && hdev->collection[0].usage == 0xFF600061) {
> +		thelio_io->hwmon_dev = hwmon_device_register_with_info(&hdev->dev,
> +								       "system76_thelio_io",
> +								       thelio_io,
> +								       &thelio_io_chip_info,
> +								       0);
> +		if (IS_ERR(thelio_io->hwmon_dev)) {
> +			ret = PTR_ERR(thelio_io->hwmon_dev);
> +			goto out_hw_close;
> +		}
> +
> +	#ifdef CONFIG_PM_SLEEP
> +		thelio_io->pm_notifier.notifier_call = thelio_io_pm;
> +		register_pm_notifier(&thelio_io->pm_notifier);
> +	#endif
> +	}

Ok, whatever your explanation for this is: I am not going to accept it,
period. It doesn't make sense to instantiate a driver that doesn't do
anything. If this would for whatever reason _really_ _really_ _really_
be necessary, I'd expect a lengthy comment describing why this is the
case and why it would be necessary to keep possibly multiple instances
of this driver around that don't do anything.

And, no, I am not going to dig through all your replies trying
to figure out your rationale for doing this. Note that, given that
there is not a single driver in the kernel doing anything similar,
you might have a hard time convincing me that this makes sense
and is necessary (both the check and successfully instantiating the
driver without registering a hwmon device).

> +
> +	return 0;
> +
> +out_hw_close:
> +	hid_hw_close(hdev);
> +out_hw_stop:
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void thelio_io_remove(struct hid_device *hdev)
> +{
> +	struct thelio_io_device *thelio_io = hid_get_drvdata(hdev);
> +
> +	if (thelio_io->hwmon_dev) {
> +		hwmon_device_unregister(thelio_io->hwmon_dev);
> +
> +	#ifdef CONFIG_PM_SLEEP
> +		unregister_pm_notifier(&thelio_io->pm_notifier);
> +	#endif
> +	}
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id thelio_io_devices[] = {
> +	{ HID_USB_DEVICE(0x3384, 0x000B) }, /* thelio_io_2 */
> +	{ }
> +};
> +
> +static struct hid_driver thelio_io_driver = {
> +	.name = "system76-thelio-io",
> +	.id_table = thelio_io_devices,
> +	.probe = thelio_io_probe,
> +	.remove = thelio_io_remove,
> +	.raw_event = thelio_io_raw_event,
> +};
> +
> +MODULE_DEVICE_TABLE(hid, thelio_io_devices);
> +MODULE_LICENSE("GPL");
> +
> +static int __init thelio_io_init(void)
> +{
> +	return hid_register_driver(&thelio_io_driver);
> +}
> +
> +static void __exit thelio_io_exit(void)
> +{
> +	hid_unregister_driver(&thelio_io_driver);
> +}
> +
> +/*
> + * When compiling this driver as built-in, hwmon initcalls will get called before the
> + * hid driver and this driver would fail to register. late_initcall solves this.
> + */
> +late_initcall(thelio_io_init);
> +module_exit(thelio_io_exit);
> -- 
> 2.34.1
