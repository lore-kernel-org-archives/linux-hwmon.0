Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E799C27C40
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Aug 2023 19:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjHXTlx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 15:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243339AbjHXTl1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 15:41:27 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAB52117
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 12:40:54 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf7423ef3eso2170965ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692905997; x=1693510797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+4FvgC+8WCqulXgM9t3Muw+1+IP+cqq9qd5zxRGj9M=;
        b=iOyL6G9rifGEVoUknResCV7Q5QZAce+uVuUModjXhHWIgejuhhbqQYKjvck3J/oaeD
         GOAe8qG+Mb5niAgG1YStkFIpyg0g66L/jz8iQ8aTHguUgf2uaok0I1HapHZrcCnZ54C6
         8V+JkBSay7ATJAe0kbbmXYyb9EoPYZEip36/Lf7246F9dStTaW8tp4PNlL2AWlzBG9Ec
         /IlkWUWyJAfBlipIZ85lq/rJQcCwGxcV6YardexNM72rfFcIYG/PutRyy2sY7ZXAVy9Q
         quUEfDro4pPzsm0u7Wvvh5vsY+UJECa1saFmb+nT4Hzp+QB0NeSkU7DQjQEU51IcnGTs
         OvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692905997; x=1693510797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+4FvgC+8WCqulXgM9t3Muw+1+IP+cqq9qd5zxRGj9M=;
        b=gMB+dYwEwJii+NToKTs7ZGvGWozcy7waMOD0KARwQ3PunuWWkMEnZn1cM8/2KDsM/U
         KXRcTO1IMk8VLYz5kn76mZhYHllItiOSNUFW/FjYwJNfMZ8wSWOQo7uJFayH/McdukQl
         38rR1R7juRFkf7NYDSodK7Y7oV+q86ReOecEkkjuICipHP3pPW3hVNuvt05Ga/iIAlzo
         7ttO0TRwypPxsOIkZIpKyVT0MLIjAtDxN+LYtN0o6oZreFnu4oeC9fhsyjvxAYvEDFeJ
         WenhEEuXe4tgX2HBXM5Lb5W2S+A/6O05UnmeM+6dUF/5JK94VIvx9z1Bfc8elH8bxYNK
         E+fA==
X-Gm-Message-State: AOJu0YwRiF298Q6iAj2HNaR8w0F8ecVVYqZtoEfSUy9g2hMJnmKUA+xc
        EDwi9TyIe8eihhTXFJygry+6NjiLpkg=
X-Google-Smtp-Source: AGHT+IHjprW9tXuP1zmfVotoCKQAzFebFXXMYUkmLO88YGPXkhxRThbvkqzHUzoNH5df4Nzq20PHhw==
X-Received: by 2002:a17:902:d2c7:b0:1bb:a125:f831 with SMTP id n7-20020a170902d2c700b001bba125f831mr18812369plc.58.1692905996580;
        Thu, 24 Aug 2023 12:39:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9-20020a17090332c900b001b03f208323sm37884plr.64.2023.08.24.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 12:39:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Aug 2023 12:39:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jeremy Soller <jeremy@system76.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add System76 Thelio Io driver
Message-ID: <a3af270b-d432-4cf2-b896-2512dc6b3a1d@roeck-us.net>
References: <84162cdd-cf70-4148-96ea-2a9d28a37ae2@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84162cdd-cf70-4148-96ea-2a9d28a37ae2@app.fastmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 24, 2023 at 11:17:58AM -0600, Jeremy Soller wrote:
> This driver allows fan control using System76 Thelio Io.
> 
Explain what that is. If this is more than a fan controller,
clarify that and explain why other functionality is not
supported.

Read and follow Documentation/hwmon/submitting-patches.rst.
Just by browsing through the code I can see at least five
violations.

> Signed-off-by: Jeremy Soller <jeremy@system76.com>
> ---
>  MAINTAINERS                        |   9 +-
>  drivers/hwmon/Kconfig              |  10 +
>  drivers/hwmon/Makefile             |   1 +
>  drivers/hwmon/system76-thelio-io.c | 424 +++++++++++++++++++++++++++++

* Document the driver in Documentation/hwmon/<driver_name>.rst.

>  4 files changed, 443 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwmon/system76-thelio-io.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 48abe1a281f2..7e43d1937cfa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20733,11 +20733,18 @@ F:	include/uapi/linux/stm.h
>  
>  SYSTEM76 ACPI DRIVER
>  M:	Jeremy Soller <jeremy@system76.com>
> -M:	System76 Product Development <productdev@system76.com>
> +M:	System76 <info@system76.com>

* Never mix bug fixes, cleanup, and functional enhancements in a single patch.

This change is completely unrelated and inappropriate in this patch.

>  L:	platform-driver-x86@vger.kernel.org
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
> index 307477b8a371..108c87667c96 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2433,6 +2433,16 @@ config SENSORS_HP_WMI
>  	  This driver can also be built as a module. If so, the module
>  	  will be called hp_wmi_sensors.
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

Why would this driver silently depend on ACPI ?

>  endif # ACPI
>  
>  endif # HWMON
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
> index 000000000000..5796810a2997
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
> +#define BUFFER_SIZE 32
> +#define REQ_TIMEOUT 300

#define<space>DEFINE<tab>value
> +
> +#define HID_CMD 0
> +#define HID_RES 1
> +#define HID_DATA 2
> +
> +#define CMD_FAN_GET  7
> +#define CMD_FAN_SET 8
> +#define CMD_LED_SET_MODE 16
> +#define CMD_FAN_TACH 22
> +
> +struct thelio_io_device {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;
> +#ifdef CONFIG_PM_SLEEP
> +	struct notifier_block pm_notifier;
> +#endif

You'll need to explain in detail why normal pm callback functions
would not work.

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
> +		hid_err(thelio_io->hdev, "unknown response error: %d", thelio_io->buffer[HID_RES]);

* Limit the number of kernel log messages. In general, your driver should not
  generate an error message just because a runtime operation failed. Report
  errors to user space instead, using an appropriate error code. Keep in mind
  that kernel error log messages not only fill up the kernel log, but also are
  printed synchronously, most likely with interrupt disabled, often to a serial
  console. Excessive logging can seriously affect system performance.

> +		return -EIO;
> +	}
> +}
> +
> +/* send command, check for error in response, response in thelio_io->buffer */
> +static int send_usb_cmd(struct thelio_io_device *thelio_io, u8 command,
> +	u8 byte1, u8 byte2, u8 byte3)

* Please run your patch through 'checkpatch --strict'. There should be no
  errors, no warnings, and few if any check messages. If there are any
  messages, please be prepared to explain.

> +{
> +	unsigned long t;
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
> +	t = wait_for_completion_timeout(&thelio_io->wait_input_report,
> +		msecs_to_jiffies(REQ_TIMEOUT));
> +	if (!t)

Unnecessary variable.
	if (!wait_for_completion_timeout())

> +		return -ETIMEDOUT;
> +
> +	return thelio_io_get_errno(thelio_io);
> +}
> +
> +static int thelio_io_raw_event(struct hid_device *hdev, struct hid_report *report,
> +	u8 *data, int size)
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
> +	bool two_byte_data)
> +{
> +	int ret;
> +
> +	mutex_lock(&thelio_io->mutex);
> +
> +	ret = send_usb_cmd(thelio_io, command, channel, 0, 0);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = (int)thelio_io->buffer[HID_DATA + 1];

Unnecessary typecast. There is no need for one for a u8 -> int conversion.

> +	if (two_byte_data)
> +		ret |= (((int)thelio_io->buffer[HID_DATA + 2]) << 8);

Same here.

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
> +			   u32 attr, int channel, const char **str)
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
> +			u32 attr, int channel, long *val)
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
> +			 u32 attr, int channel, long val)
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
> +				  u32 attr, int channel)
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

Again, you'll need to explain in detail why the standard pm callback
functions won't work.

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
> +	if (hdev->maxcollection == 1 && hdev->collection[0].usage == 0xFF600061) {
> +		hid_info(hdev, "found command device\n");

Now this is really noise.

> +		thelio_io->hwmon_dev = hwmon_device_register_with_info(&hdev->dev,
> +			"system76_thelio_io", thelio_io, &thelio_io_chip_info, 0);
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

This leaves the driver running even if there is no hwmon device, and let it
just sit there doing nothing. What would be the point of that ?

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
> +#ifdef CONFIG_PM_SLEEP
> +	unregister_pm_notifier(&thelio_io->pm_notifier);
> +#endif

.... and then, worse, it tries to unregister a pm notifier which
it never registered because it didn't register a hwmon device
and didn't bail out either.

> +
> +	if (thelio_io->hwmon_dev)
> +		hwmon_device_unregister(thelio_io->hwmon_dev);
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id thelio_io_devices[] = {
> +	{ HID_USB_DEVICE(0x3384, 0x000B) }, // thelio_io_2

* Please use the standard multi-line comment style. Do not mix C and C++
  style comments in a single driver (with the exception of the SPDX license
  identifier).

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
