Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC88C433E1
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E36A2065C
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 00:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMDNmjNS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgHPAEi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Aug 2020 20:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgHPAEh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Aug 2020 20:04:37 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B804BC061786;
        Sat, 15 Aug 2020 17:04:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i92so6667769pje.0;
        Sat, 15 Aug 2020 17:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=rp2TJspZOkPHBnlZOEmt4KdrSTA6oCHN76oFkNYpyMY=;
        b=CMDNmjNSTlXLBMYiBiUCupVfDSstNva/iTyIkZYf7TyyIW5vRtlJlf9XfOcBEqsBoL
         XOsRtyZLeCLTYW2pyGMRo8KcyMiQwb+4SeH6EAvtHdWx4WvgQoq7TJGIfY/YS7C41Acg
         Z2mV0dw9KozrTLTlY+gfInql84RPA8fbqYzD3RgiH0561UqCiVwWuV9CDSmYqFniT+Fa
         gUlgQsdqKGgdH9Aqjzs4sN6D9DdsUSh+PD8GgykJJFKy9hLF5csYPd83702ji3dQM1/R
         Y3tf5O/YSCg5w8/cYwk9dGKNXHCn0RGYAVzAPwLJAEtNC8cCAZXoIGpccWU6kYd791AH
         mSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=rp2TJspZOkPHBnlZOEmt4KdrSTA6oCHN76oFkNYpyMY=;
        b=eT1nnJsQJOvam3YDYyMYVkocC8pbVscNDDVcnF9ODIPwnH5jO20FWl56wwAyVqK2RM
         DPsyhkY8oxVOAQ73Wz7N3AZ1WBnxMQSybN3GS9J5exgGrN6KhOsXuWG8yCsbWsj/LrfR
         vtsMeT4AZVv0Fk5t8Q4PtcMFKEaEn+kMTG/XlIccccaKudrselwfoyWpVgZSfB8X6vV+
         kpN43WtFEt19qCudgAN+OulBHmyXliBxC87H2RUCYKmP0jcd/PUz0gnyRw65cKI9v2Ht
         30B51t0rf/nxey+CYxLYgtd40c6nVJ/52bgSYHq+zbxG49QruCyGcfJGR++FKJGmggNk
         Ldxw==
X-Gm-Message-State: AOAM532SS48sgqtq79OPLYbrUH/sz9/Kn1esdyFypFC/I7PJk9I11Zd+
        tnMEc2K2RA+rJcDHAa2fC2g=
X-Google-Smtp-Source: ABdhPJy91+s1Y5sOXDkr4ihKyMuQzowtV2i/qGVtDfHoSN/NMqBAg/pbIV9fEQoZA8SoEAWzTfcVoA==
X-Received: by 2002:a17:90b:816:: with SMTP id bk22mr7628261pjb.185.1597536276444;
        Sat, 15 Aug 2020 17:04:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k23sm11808608pgb.92.2020.08.15.17.04.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 17:04:35 -0700 (PDT)
Date:   Sat, 15 Aug 2020 17:04:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <20200816000435.GA11977@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Aug 15, 2020 at 11:16:17PM +0200, jaap aarts wrote:
> Adds fan/pwm support for H100i platinum.
> Custom temp/fan curves are not supported.
> 
> v4:
>  - fixed spelling
>  - more consistent use of uN and other inconsistencies
>  - moved from semaphore to mutex, fixing 2 locking bugs allong the way
>  - moved to memcmp vs strncmp
>  - now uses driver_info for the device configuration
>  - check input ranges for fan rpm/pwm
>  - fix default case
>  - off-by-one loop range
>  - improved naming and logging messages
>  - fixed unfreed hdev
>  - use module_usb_driver
>  - use fixed-sized array for rpm/pwm channels independant of device.
>  - use common function for the USB bulk messages.
> 
> Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>

checkpatch --strict says:

total: 7 errors, 12 warnings, 13 checks, 714 lines checked

Guenter

> ---
>  drivers/hwmon/Kconfig               |   7 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/corsair_hydro_i_pro.c | 694 ++++++++++++++++++++++++++++
>  3 files changed, 702 insertions(+)
>  create mode 100644 drivers/hwmon/corsair_hydro_i_pro.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 288ae9f63588..f466b72d0f67 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -378,6 +378,13 @@ config SENSORS_ARM_SCPI
>  	  and power sensors available on ARM Ltd's SCP based platforms. The
>  	  actual number and type of sensors exported depend on the platform.
>  
> +config SENSORS_CORSAIR_HYDRO_I_PRO
> +	tristate "Corsair hydro HXXXi pro driver"
> +	depends on USB
> +	help
> +	  If you say yes here you get support for the corsair hydro HXXXi pro
> +	  range of devices.
> +
>  config SENSORS_ASB100
>  	tristate "Asus ASB100 Bach"
>  	depends on X86 && I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3e32c21f5efe..ec63294b3ef1 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
>  obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
>  obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
>  obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
> +obj-$(CONFIG_SENSORS_CORSAIR_HYDRO_I_PRO)	+= corsair_hydro_i_pro.o
>  
>  obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
>  obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
> diff --git a/drivers/hwmon/corsair_hydro_i_pro.c b/drivers/hwmon/corsair_hydro_i_pro.c
> new file mode 100644
> index 000000000000..f4dd435be7dd
> --- /dev/null
> +++ b/drivers/hwmon/corsair_hydro_i_pro.c
> @@ -0,0 +1,694 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid coolers.
> + * Copyright (c) Jaap Aarts 2020
> + * 
> + * Protocol partially reverse engineered by audiohacked
> + * https://github.com/audiohacked/OpendriverLink
> + */
> +
> +/*
> + * Supports following liquid coolers:
> + * H100i platinum
> + * 
> + * Other products should work with this driver with slight modification.
> + * 
> + * Note: platinum is the codename name for pro within the driver, so H100i platinum = H100i pro.
> + * But some products are actually called platinum, these are not intended to be supported (yet).
> + * 
> + * Note: fan curve control has not been implemented
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +struct device_config {
> +	u16 vendor_id;
> +	u16 product_id;
> +	u8 fancount;
> +	const char *name;
> +	const struct hwmon_channel_info **hwmon_info;
> +};
> +
> +struct hydro_i_pro_device {
> +	struct usb_device *udev;
> +
> +	const struct device_config *config;
> +
> +	unsigned char *bulk_out_buffer;
> +	unsigned char *bulk_in_buffer;
> +	size_t bulk_out_size;
> +	size_t bulk_in_size;
> +	char bulk_in_endpointAddr;
> +	char bulk_out_endpointAddr;
> +
> +	struct usb_interface *interface; /* the interface for this device */
> +	struct mutex io_mutex;
> +};
> +
> +#define max_fan_count 2
> +#define max_pwm_channel_count max_fan_count
> +
> +struct hwmon_data {
> +	struct hydro_i_pro_device *hdev;
> +	int channel_count;
> +	void *channel_data[max_pwm_channel_count];
> +};
> +
> +struct curve_point {
> +	u8 temp;
> +	u8 pwm;
> +};
> +
> +struct hwmon_fan_data {
> +	u8 fan_channel;
> +	u16 fan_target;
> +	u8 fan_pwm_target;
> +	u8 mode;
> +	struct curve_point curve[7];
> +};
> +
> +struct curve_point quiet_curve[] = {
> +	{
> +		.temp = 0x1F,
> +		.pwm = 0x15,
> +	},
> +	{
> +		.temp = 0x21,
> +		.pwm = 0x1E,
> +	},
> +	{
> +		.temp = 0x24,
> +		.pwm = 0x25,
> +	},
> +	{
> +		.temp = 0x27,
> +		.pwm = 0x2D,
> +	},
> +	{
> +		.temp = 0x29,
> +		.pwm = 0x38,
> +	},
> +	{
> +		.temp = 0x2C,
> +		.pwm = 0x4A,
> +	},
> +	{
> +		.temp = 0x2F,
> +		.pwm = 0x64,
> +	},
> +};
> +
> +#define default_curve quiet_curve
> +
> +static const struct hwmon_channel_info *dual_fan[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN,
> +			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +
> +	NULL
> +};
> +
> +static const struct device_config config_table[] = {
> +	{
> +		.vendor_id = 0x1b1c,
> +		.product_id = 0x0c15,
> +		.fancount = 2,
> +		.name = "corsair_H100i_pro",
> +		.hwmon_info = dual_fan,
> +	},
> +};
> +
> +#define BULK_TIMEOUT 100
> +
> +enum opcodes {
> +	PWM_FAN_CURVE_CMD = 0x40,
> +	PWM_GET_CURRENT_CMD = 0x41,
> +	PWM_FAN_TARGET_CMD = 0x42,
> +	RPM_FAN_TARGET_CMD = 0x43,
> +};
> +
> +#define SUCCES_LENGTH 3
> +#define SUCCES_CODE 0x12, 0x34
> +
> +static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])
> +{
> +	char success[SUCCES_LENGTH] = { command, SUCCES_CODE };
> +	return memcmp(ret, success, SUCCES_LENGTH) == 0;
> +}
> +
> +static int acquire_lock(struct hydro_i_pro_device *hdev)
> +{
> +	int retval = usb_autopm_get_interface(hdev->interface);
> +	if (retval)
> +		return retval;
> +
> +	mutex_lock(&hdev->io_mutex);
> +	return 0;
> +}
> +
> +static int transfer_usb(struct hydro_i_pro_device *hdev,
> +			unsigned char *send_buf, unsigned char *recv_buf,
> +			int send_len, int recv_len)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> +
> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, &wrote,
> +			      BULK_TIMEOUT);
> +	if (retval)
> +		return retval;
> +
> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
> +			      BULK_TIMEOUT);
> +	if (retval)
> +		return retval;
> +	return 0;
> +}
> +
> +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> +			     struct hwmon_fan_data *fan_data,
> +			     struct curve_point point[7])
> +{
> +	int retval;
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	memcpy(fan_data->curve, point, sizeof(struct curve_point) * 7);
> +
> +	send_buf[0] = PWM_FAN_CURVE_CMD;
> +	send_buf[1] = fan_data->fan_channel;
> +	send_buf[2] = point[0].temp;
> +	send_buf[3] = point[1].temp;
> +	send_buf[4] = point[2].temp;
> +	send_buf[5] = point[3].temp;
> +	send_buf[6] = point[4].temp;
> +	send_buf[7] = point[5].temp;
> +	send_buf[8] = point[6].temp;
> +	send_buf[9] = point[0].pwm;
> +	send_buf[10] = point[1].pwm;
> +	send_buf[11] = point[2].pwm;
> +	send_buf[12] = point[3].pwm;
> +	send_buf[13] = point[4].pwm;
> +	send_buf[14] = point[5].pwm;
> +	send_buf[15] = point[6].pwm;
> +
> +	retval = transfer_usb(hdev, send_buf, recv_buf, 16, 4);
> +	if (retval)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf)) {
> +		dev_warn(
> +			&hdev->udev->dev,
> +			"failed setting fan pwm/temp curve for %s on channel %d %d,%d,%d\n",
> +			hdev->config->name, recv_buf[3], recv_buf[0],
> +			recv_buf[1], recv_buf[2]);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
> +			      struct hwmon_fan_data *fan_data, u16 val)
> +{
> +	int retval;
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	fan_data->fan_target = val;
> +	fan_data->fan_pwm_target = 0;
> +
> +	send_buf[0] = RPM_FAN_TARGET_CMD;
> +	send_buf[1] = fan_data->fan_channel;
> +	send_buf[2] = (fan_data->fan_target >> 8);
> +	send_buf[3] = fan_data->fan_target;
> +
> +	retval = transfer_usb(hdev, send_buf, recv_buf, 4, 6);
> +	if (retval)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf)) {
> +		dev_warn(
> +			&hdev->udev->dev,
> +			"failed setting fan rpm for %s on channel %d %d,%d,%d\n",
> +			hdev->config->name, recv_buf[3], recv_buf[0],
> +			recv_buf[1], recv_buf[2]);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
> +			       struct hwmon_fan_data *fan_data, long *val)
> +{
> +	int retval;
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	send_buf[0] = PWM_GET_CURRENT_CMD;
> +	send_buf[1] = fan_data->fan_channel;
> +
> +	retval = transfer_usb(hdev, send_buf, recv_buf, 2, 6);
> +	if (retval)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf) ||
> +	    recv_buf[3] != fan_data->fan_channel) {
> +		dev_warn(
> +			&hdev->udev->dev,
> +			"failed retreiving fan pwm for %s on channel %d %d,%d,%d\n",
> +			hdev->config->name, recv_buf[3], recv_buf[0],
> +			recv_buf[1], recv_buf[2]);
> +		return -EINVAL;
> +	}
> +
> +	*val = ((recv_buf[4]) << 8) + recv_buf[5];
> +	return 0;
> +}
> +
> +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> +			      struct hwmon_fan_data *fan_data, u8 val)
> +{
> +	int retval;
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	fan_data->fan_target = 0;
> +	fan_data->fan_pwm_target = val;
> +
> +	send_buf[0] = PWM_FAN_TARGET_CMD;
> +	send_buf[1] = fan_data->fan_channel;
> +	send_buf[3] = fan_data->fan_pwm_target;
> +
> +	retval = transfer_usb(hdev, send_buf, recv_buf, 4, 6);
> +	if (retval)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf)) {
> +		dev_warn(
> +			&hdev->udev->dev,
> +			"failed setting fan pwm for %s on channel %d %d,%d,%d\n",
> +			hdev->config->name, recv_buf[3], recv_buf[0],
> +			recv_buf[1], recv_buf[2]);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static umode_t hwmon_is_visible(const void *d, enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +			break;
> +		case hwmon_fan_target:
> +			return 0644;
> +			break;
> +		case hwmon_fan_min:
> +			return 0444;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return 0200;
> +			break;
> +		case hwmon_pwm_enable:
> +			return 0644;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long val)
> +{
> +	struct hwmon_data *data = dev_get_drvdata(dev);
> +	struct hydro_i_pro_device *hdev = data->hdev;
> +	struct hwmon_fan_data *fan_data;
> +	int retval = 0;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_target:
> +			fan_data = data->channel_data[channel];
> +			if (fan_data->mode != 1)
> +				return -EINVAL;
> +
> +			if (val < (2 ^ 16) - 2)
> +				return -EINVAL;
> +
> +			retval = acquire_lock(hdev);
> +			if (retval)
> +				goto exit;
> +
> +			retval = set_fan_target_rpm(hdev, fan_data, val);
> +			if (retval)
> +				goto cleanup;
> +
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			fan_data = data->channel_data[channel];
> +			if (fan_data->mode != 1)
> +				return -EINVAL;
> +
> +			if (val < (2 ^ 8) - 2)
> +				return -EINVAL;
> +
> +			retval = acquire_lock(hdev);
> +			if (retval)
> +				goto exit;
> +
> +			retval = set_fan_target_pwm(hdev, fan_data, val);
> +			if (retval)
> +				goto cleanup;
> +
> +			break;
> +		case hwmon_pwm_enable:
> +			fan_data = data->channel_data[channel];
> +
> +			switch (val) {
> +			case 0:
> +				retval = acquire_lock(hdev);
> +				if (retval)
> +					goto exit;
> +
> +				retval = set_fan_pwm_curve(hdev, fan_data,
> +							   default_curve);
> +				if (retval)
> +					goto cleanup;
> +				fan_data->mode = 0;
> +				break;
> +			case 1:
> +				retval = acquire_lock(hdev);
> +				if (retval)
> +					goto exit;
> +
> +				if (fan_data->fan_target != 0) {
> +					retval = set_fan_target_rpm(
> +						hdev, fan_data,
> +						fan_data->fan_target);
> +					if (retval)
> +						goto cleanup;
> +				} else if (fan_data->fan_pwm_target != 0) {
> +					retval = set_fan_target_pwm(
> +						hdev, fan_data,
> +						fan_data->fan_pwm_target);
> +					if (retval)
> +						goto cleanup;
> +				}
> +				fan_data->mode = 1;
> +				break;
> +			case 2:
> +				retval = acquire_lock(hdev);
> +				if (retval)
> +					goto exit;
> +
> +				retval = set_fan_pwm_curve(hdev, fan_data,
> +							   default_curve);
> +				if (retval)
> +					goto cleanup;
> +				fan_data->mode = 2;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +cleanup:
> +	mutex_unlock(&hdev->io_mutex);
> +	usb_autopm_put_interface(hdev->interface);
> +exit:
> +	return retval;
> +}
> +
> +static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct hwmon_data *data = dev_get_drvdata(dev);
> +	struct hydro_i_pro_device *hdev = data->hdev;
> +	struct hwmon_fan_data *fan_data;
> +	int retval = 0;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			fan_data = data->channel_data[channel];
> +
> +			retval = acquire_lock(hdev);
> +			if (retval)
> +				goto exit;
> +
> +			retval = get_fan_current_rpm(hdev, fan_data, val);
> +			if (retval)
> +				goto cleanup;
> +
> +			goto cleanup;
> +		case hwmon_fan_target:
> +			fan_data = data->channel_data[channel];
> +			if (fan_data->mode != 1) {
> +				*val = 0;
> +				goto exit;
> +			}
> +			*val = fan_data->fan_target;
> +			goto exit;
> +		case hwmon_fan_min:
> +			*val = 200;
> +			goto exit;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +		goto exit;
> +
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			fan_data = data->channel_data[channel];
> +			*val = fan_data->mode;
> +			goto exit;
> +		default:
> +			return -EINVAL;
> +		}
> +		goto exit;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +cleanup:
> +	mutex_unlock(&hdev->io_mutex);
> +	usb_autopm_put_interface(hdev->interface);
> +exit:
> +	return retval;
> +}
> +
> +static const struct hwmon_ops i_pro_ops = {
> +	.is_visible = hwmon_is_visible,
> +	.read = hwmon_read,
> +	.write = hwmon_write,
> +};
> +
> +static void hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +	u8 fan_id;
> +	struct device *hwmon_dev;
> +	struct hwmon_fan_data *fan;
> +	struct hwmon_data *data = devm_kzalloc(
> +		&hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
> +	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
> +		&hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
> +
> +	/* You did something bad!! Either adjust  max_fan_count or the fancount for the config!*/
> +	WARN_ON(hdev->config->fancount >= max_pwm_channel_count);
> +	data->channel_count = hdev->config->fancount;
> +
> +	/* For each fan create a data channel a fan config entry and a pwm config entry */
> +	for (fan_id = 0; fan_id < data->channel_count; fan_id++) {
> +		fan = devm_kzalloc(&hdev->udev->dev,
> +				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
> +		fan->fan_channel = fan_id;
> +		fan->mode = 0;
> +		data->channel_data[fan_id] = fan;
> +	}
> +
> +	hwmon_info->ops = &i_pro_ops;
> +	hwmon_info->info = hdev->config->hwmon_info;
> +
> +	data->hdev = hdev;
> +	hwmon_dev = devm_hwmon_device_register_with_info(
> +		&hdev->udev->dev, hdev->config->name, data, hwmon_info, NULL);
> +	dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name);
> +}
> +
> +const int USB_VENDOR_ID_CORSAIR = 0x1b1c;
> +const int USB_PRODUCT_ID_H100I_PRO = 0x0c15;
> +/*
> + * Devices that work with this driver.
> + * More devices should work, however none have been tested.
> + */
> +static const struct usb_device_id astk_table[] = {
> +	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
> +	  .driver_info = (kernel_ulong_t)&config_table[0] },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(usb, astk_table);
> +
> +static int init_device(struct usb_device *udev)
> +{
> +	int retval;
> +
> +	/*
> +	 * This is needed because when running windows in a vm with proprietary driver
> +	 * and you switch to this driver, the device will not respond unless you run this.
> +	 */
> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
> +				 0xffff, 0x0000, 0, 0, 0);
> +	/*this always returns error*/
> +	if (retval)
> +		;
> +
> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +				 0x0002, 0x0000, 0, 0, 0);
> +	return retval;
> +}
> +
> +static int deinit_device(struct usb_device *udev)
> +{
> +	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +			       0x0004, 0x0000, 0, 0, 0);
> +}
> +
> +static void astk_delete(struct hydro_i_pro_device *hdev)
> +{
> +	usb_put_intf(hdev->interface);
> +	usb_put_dev(hdev->udev);
> +	kfree(hdev->bulk_in_buffer);
> +	kfree(hdev->bulk_out_buffer);
> +	kfree(hdev);
> +}
> +
> +static int astk_probe(struct usb_interface *interface,
> +		      const struct usb_device_id *id)
> +{
> +	struct hydro_i_pro_device *hdev =
> +		kzalloc(sizeof(struct hydro_i_pro_device), GFP_KERNEL);
> +	int retval;
> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +	if (!hdev) {
> +		kfree(hdev);
> +		retval = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	hdev->config = (const struct device_config *)id->driver_info;
> +	/* You should set the driver_info to a pointer to the correct configuration!!*/
> +	WARN_ON(hdev->config == NULL);
> +
> +	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
> +					   &bulk_out, NULL, NULL);
> +	if (retval) {
> +		kfree(hdev);
> +		goto exit;
> +	}
> +
> +	hdev->udev = usb_get_dev(interface_to_usbdev(interface));
> +	hdev->interface = usb_get_intf(interface);
> +
> +	/*
> +	 * set up the endpoint information 
> +	 * use only the first bulk-in and bulk-out endpoints 
> +	 */
> +	hdev->bulk_in_size = usb_endpoint_maxp(bulk_in);
> +	hdev->bulk_in_buffer = kmalloc(hdev->bulk_in_size, GFP_KERNEL);
> +	hdev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
> +	hdev->bulk_out_size = usb_endpoint_maxp(bulk_out);
> +	hdev->bulk_out_buffer = kmalloc(hdev->bulk_out_size, GFP_KERNEL);
> +	hdev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
> +
> +	retval = init_device(hdev->udev);
> +	if (retval) {
> +		dev_err(&interface->dev, "failed initialising %s\n",
> +			hdev->config->name);
> +		kfree(hdev);
> +		goto exit;
> +	}
> +
> +	hwmon_init(hdev);
> +
> +	usb_set_intfdata(interface, hdev);
> +	mutex_init(&hdev->io_mutex);
> +exit:
> +	return retval;
> +}
> +
> +static void astk_disconnect(struct usb_interface *interface)
> +{
> +	struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
> +	dev_info(&hdev->udev->dev, "removed hwmon for %s\n",
> +		 hdev->config->name);
> +	deinit_device(hdev->udev);
> +	usb_set_intfdata(interface, NULL);
> +	astk_delete(hdev);
> +}
> +static int astk_resume(struct usb_interface *intf)
> +{
> +	return 0;
> +}
> +
> +static int astk_suspend(struct usb_interface *intf, pm_message_t message)
> +{
> +	return 0;
> +}
> +
> +static struct usb_driver hydro_i_pro_driver = {
> +	.name = "hydro_i_pro_device",
> +	.id_table = astk_table,
> +	.probe = astk_probe,
> +	.disconnect = astk_disconnect,
> +	.resume = astk_resume,
> +	.suspend = astk_suspend,
> +	.supports_autosuspend = 1,
> +};
> +
> +module_usb_driver(hydro_i_pro_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
> +MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
> -- 
> 2.28.0
> 
