Return-Path: <SRS0=YkMd=A2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0026C433E1
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 03:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F12B2070E
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jul 2020 03:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5QV3Hbv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgGODHo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 23:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726782AbgGODHn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 23:07:43 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC2BC061755;
        Tue, 14 Jul 2020 20:07:43 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f16so1679868pjt.0;
        Tue, 14 Jul 2020 20:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yD642wVoV2+dsoE8YvjvtDuLLzODMdvjeOi3TJFUf08=;
        b=r5QV3HbvlHvGDKXrqkOi8Wudpgt6x/jRVK4CmAKKWU+jD3AoOsXYjZyiJTrE8jcsGH
         hBa8UoLwdu4MQveoZqdllEOsAOmut8VIvD73dZzHKOBOnAZMxzysx+0uwkEUzOE1EHIk
         VevOJpfk2nu2szbro5Mce6AHcCmUYrgxK7tjnHLBIE5yIunWYrmuMp7wi/n+LkrR9lPk
         tjwfmeLVTplfaefCuRvqvtPpc8ZfuExwAiN00tWhfhimIyhKiB+GTmR4KekSNjCq4bfV
         bkSj0hCgialuYhhH4SGzLhdUG32ilNIOObCJ3tavaKbOwKjzpTmMCSR3uaFZIA6TjS8L
         cwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=yD642wVoV2+dsoE8YvjvtDuLLzODMdvjeOi3TJFUf08=;
        b=jXXbYm3zzxL3PjUYS7GGbtj69moeJNG8x/7LJOk0IXNHl+I2G+TWzPC6XD0sBxE8WA
         i1pwlgWxhymS3Ztt1jkOkqVXRY/YU35B8vT9/IAAqp4NDho41UGjmcJNCyd7uA1idsmj
         9IW8cgJ23zLD1gp3aZTpFCwc/ljmB9DaJuk4eFadKvDz5JjTIwT7KCHWDrBjZMsQ+ke4
         MFaiuQJ7X04CBmN7IzaGR+4891L3InFkxEojus3RM7A+86NlHCSGDIG2P2tVAVCt4Qui
         YOPEE1XbMSHOeIT/fUGxGnypCnI3Vt6AJ0zbRJmutmTPXB9UGtYVUGo/JavC7AUxGSuJ
         QDtw==
X-Gm-Message-State: AOAM5334ImaTwyMUCoVbfdbrO8Rdt3aJUk5WknatFeiMP6iCebC0nwCA
        DfPswyj9hG4tH5LNgEBVrtI=
X-Google-Smtp-Source: ABdhPJx7yLXytJI5/CouWawqZ5gBM7oQ/Gvs6dJlcoKpmW+nK7XVOV5UUL6f4p7URm6BHwpoBsh8bA==
X-Received: by 2002:a17:90a:2562:: with SMTP id j89mr7551092pje.218.1594782462694;
        Tue, 14 Jul 2020 20:07:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y19sm443426pgj.35.2020.07.14.20.07.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 20:07:41 -0700 (PDT)
Date:   Tue, 14 Jul 2020 20:07:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Marius Zachmann <mail@mariuszachmann.de>
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <20200715030740.GB164279@roeck-us.net>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714100337.48719-1-jaap.aarts1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 14, 2020 at 12:03:38PM +0200, jaap aarts wrote:
> Adds fan/pwm support for H1000i platinum.
> Custom temp/fan curves are not supported, however
> the presets found in the proprietary drivers are avaiable.
> 
> Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>

+Marius Zachmann for input.

Questions:
- Does this really have to be a different driver or can it be merged into
  the corsair-cpro driver ?
- What about HID vs. USB driver ?
- is the kref complexity really needed ?

> ---
>  drivers/hwmon/Kconfig       |   6 +
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/asetek_gen6.c | 801 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 808 insertions(+)
>  create mode 100644 drivers/hwmon/asetek_gen6.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 288ae9f63588..521a9e0c88ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -378,6 +378,12 @@ config SENSORS_ARM_SCPI
>  	  and power sensors available on ARM Ltd's SCP based platforms. The
>  	  actual number and type of sensors exported depend on the platform.
>  
> +config SENSORS_ASETEK_GEN6
> +	tristate "Asetek generation 6 driver"
> +	help
> +	  If you say yes here you get support for asetek generation 6 boards
> +	  found on most AIO liquid coolers with an asetek pump.
> +
>  config SENSORS_ASB100
>  	tristate "Asus ASB100 Bach"
>  	depends on X86 && I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3e32c21f5efe..9683d2aae2b2 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
>  obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
>  obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
>  obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
> +obj-$(CONFIG_SENSORS_ASETEK_GEN6)	+= asetek_gen6.o
>  
>  obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
>  obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
> diff --git a/drivers/hwmon/asetek_gen6.c b/drivers/hwmon/asetek_gen6.c
> new file mode 100644
> index 000000000000..4aea9ae0b944
> --- /dev/null
> +++ b/drivers/hwmon/asetek_gen6.c
> @@ -0,0 +1,801 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * A hwmon driver for most asetek gen 6 all-in-one liquid coolers.
> + * Copyright (c) Jaap Aarts 2020
> + * 
> + * Protocol reverse engineered by audiohacked
> + * https://github.com/audiohacked/OpendriverLink
> + */
> +
> +/*
> + * Supports following chips:

This isn't really a chip, it is a liquid cooler.

> + * h100i platinum
> + * 
> + * Other products should work with this driver but no testing has been done.
> + * 
> + * Note: platinum is the codename name for pro within driver, so h100i platinum = h1ooi pro

h1ooi ? o's instead of 0 ?

> + * 
> + * Note: fan curve control has not been implemented
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/usb.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Alphabetic order, please. Also, it doesn't look like hwmon-sysfs.h is used.

> +
> +struct driver {

this is a terribly generic name for a local structure.

> +	struct usb_device *udev;
> +
> +	char *bulk_out_buffer;
> +	char *bulk_in_buffer;
> +	size_t bulk_out_size;
> +	size_t bulk_in_size;
> +	char bulk_in_endpointAddr;
> +	char bulk_out_endpointAddr;
> +
> +	struct usb_interface *interface; /* the interface for this device */
> +	struct mutex io_mutex; /* synchronize I/O with disconnect */

Not used anywhere.

> +	struct semaphore
> +		limit_sem; /* limiting the number of writes in progress */

I don't see the need for a semaphore in this driver.

> +
> +	struct kref kref;
> +};
> +
> +struct curve_point {
> +	uint8_t temp;
> +	uint8_t pwm;
> +};
> +
> +struct hwmon_fan_data {
> +	char fan_channel;
> +	long fan_target;
> +	unsigned char fan_pwm_target;
> +	long mode;
> +	struct curve_point curve[7];
> +};
> +
> +struct hwmon_data {
> +	struct driver *dev;
> +	int channel_count;
> +	void **channel_data;
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
> +struct curve_point balanced_curve[] = {
> +	{
> +		.temp = 0x1C,
> +		.pwm = 0x15,
> +	},
> +	{
> +		.temp = 0x1E,
> +		.pwm = 0x1B,
> +	},
> +	{
> +		.temp = 0x20,
> +		.pwm = 0x23,
> +	},
> +	{
> +		.temp = 0x22,
> +		.pwm = 0x28,
> +	},
> +	{
> +		.temp = 0x24,
> +		.pwm = 0x32,
> +	},
> +	{
> +		.temp = 0x27,
> +		.pwm = 0x48,
> +	},
> +	{
> +		.temp = 0x29,
> +		.pwm = 0x64,
> +	},
> +};
> +
> +struct curve_point extreme_curve[] = {
> +	{
> +		.temp = 0x19,
> +		.pwm = 0x28,
> +	},
> +	{
> +		.temp = 0x1B,
> +		.pwm = 0x2E,
> +	},
> +	{
> +		.temp = 0x1D,
> +		.pwm = 0x37,
> +	},
> +	{
> +		.temp = 0x1E,
> +		.pwm = 0x41,
> +	},
> +	{
> +		.temp = 0x1F,
> +		.pwm = 0x4C,
> +	},
> +	{
> +		.temp = 0x20,
> +		.pwm = 0x56,
> +	},
> +	{
> +		.temp = 0x21,
> +		.pwm = 0x64,
> +	},
> +};

We don't get into the business of deciding fan curves in the kernel.
The driver should implement sets of {pwm_auto_pointN_temp,
pwm_auto_pointN_pwm} instead and leave it up to userspace to set
actual values.

> +
> +#define default_curve quiet_curve
> +
> +static const char SUCCESS[2] = { 0x12, 0x34 };
> +
> +#define SUCCES_LENGTH 3
> +
> +static bool check_succes(char command, char ret[SUCCES_LENGTH])
> +{
> +	char success[SUCCES_LENGTH] = { command };
> +
> +	strncpy(&success[1], SUCCESS, SUCCES_LENGTH - 1);
> +	return strncmp(ret, success, SUCCES_LENGTH - 1) == 0;
> +}

This seems terribly expensive and complicated. I have not spend time trying
to analyze what it actually does, but it seems highly unlikely that such a
complex evaluation is needed.

> +
> +int set_fan_rpm_curve(struct driver *cdev, struct hwmon_fan_data *fan_data,
> +		      struct curve_point point[7])
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
> +	char *send_buf = cdev->bulk_out_buffer;
> +	char *recv_buf = cdev->bulk_in_buffer;
> +
> +	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
> +
> +	send_buf[0] = 0x40;
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
> +	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 16, &wrote, 100);
> +	if (retval != 0)

	if (retval)
> +		return retval;
> +
> +	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf))
> +		dev_info("[*] Failled setting fan curve %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);

No error return ? Then drop the check.

> +	return 0;
> +}
> +
> +int set_fan_target_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
> +		       long val)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
> +
> +	char *send_buf = cdev->bulk_out_buffer;
> +	char *recv_buf = cdev->bulk_in_buffer;
> +
> +	fan_data->fan_target = val;
> +	fan_data->fan_pwm_target = 0;
> +
> +	send_buf[0] = 0x43;

Please use defines instead of magic values.

> +	send_buf[1] = fan_data->fan_channel;
> +	send_buf[2] = (fan_data->fan_target >> 8);
> +	send_buf[3] = fan_data->fan_target;
> +
> +	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);

100 seconds timeout is a bit unreal.

> +	if (retval != 0)
> +		return retval;
> +
> +	//no error

Useless comment.

> +	if (!check_succes(send_buf[0], recv_buf))
> +		dev_info("[*] Failled setting fan rpm %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +	return 0;
> +}
> +
> +void get_fan_target_rpm(struct hwmon_fan_data *fan_data, long *val)
> +{
> +	*val = fan_data->fan_target;
> +}

This function does not add any value. Caller can access fan_data->fan_target
directly.

> +
> +int get_fan_current_rpm(struct driver *cdev, struct hwmon_fan_data *fan_data,
> +			long *val)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
> +
> +	char *send_buf = cdev->bulk_out_buffer;
> +	char *recv_buf = cdev->bulk_in_buffer;
> +
> +	send_buf[0] = 0x41;
> +	send_buf[1] = fan_data->fan_channel;
> +
> +	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 2, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	if (!check_succes(0x41, recv_buf) ||
> +	    recv_buf[3] != fan_data->fan_channel)
> +		dev_info("[*] Failled retrieving fan rmp %d,%d,%d/%d\n",

Failed, rpm. But that message is really pointless (as is the check),
since the result is ignored and whatever is in the buffer is returned
to the caller anyway.

> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +
> +	*val = (((uint8_t)recv_buf[4]) << 8) + (uint8_t)recv_buf[5];

Declaring send_buf and recv_buf as char pointer just to typecast recv_buf
is not really useful and just makes the code more complex.

> +	return 0;
> +}
> +
> +int set_fan_target_pwm(struct driver *cdev, struct hwmon_fan_data *fan_data,
> +		       long val)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
> +
> +	unsigned char *send_buf = cdev->bulk_out_buffer;
> +	unsigned char *recv_buf = cdev->bulk_in_buffer;

Now we have char, uint8_t, and unsigned char. Please be consistent.

> +
> +	fan_data->fan_pwm_target = val;
> +	fan_data->fan_target = 0;
> +
> +	send_buf[0] = 0x42;
> +	send_buf[1] = fan_data->fan_channel;
> +	send_buf[3] = fan_data->fan_pwm_target;
> +
> +	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
> +	if (retval != 0)
> +		return retval;
> +
> +	//no error
> +	if (!check_succes(send_buf[0], recv_buf))
> +		dev_info("[*] Failled setting fan pwm %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +	return 0;
> +}
> +
> +umode_t is_visible_func(const void *d, enum hwmon_sensor_types type, u32 attr,

_func is quite pointless in function names.

> +			int channel)

Maximum line length is now 100.

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
> +		case hwmon_pwm_mode:
> +			return 0644;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int write_func(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long val)
> +{
> +	struct hwmon_data *data = dev_get_drvdata(dev);
> +	struct driver *cdev = data->dev;
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
> +			retval = usb_autopm_get_interface(cdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&cdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +
> +			retval = set_fan_target_rpm(cdev, fan_data, val);
> +			if (retval)
> +				goto cleanup;
> +
> +			goto exit;

All those "goto exit;" are useless and inconsistent.

> +		default:
> +			return -EINVAL;
> +		}
> +		goto exit;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			fan_data = data->channel_data[channel];
> +			if (fan_data->mode != 1)
> +				return -EINVAL;
> +
> +			retval = usb_autopm_get_interface(cdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&cdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +
> +			retval = set_fan_target_pwm(cdev, fan_data, val);
> +			if (retval)
> +				return retval;
> +
> +			goto cleanup;

goto are expected to be used for error cleanup, not for normal function exits.

> +		case hwmon_pwm_enable:
> +			fan_data = data->channel_data[channel];
> +
> +			retval = usb_autopm_get_interface(cdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&cdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +			fan_data->mode = val;
> +
> +			switch (val) {
> +			case 0:
> +				set_fan_rpm_curve(cdev, fan_data,
> +						  default_curve);
> +				break;
> +			case 1:
> +				if (fan_data->fan_target != 0) {
> +					retval = set_fan_target_rpm(
> +						cdev, fan_data,
> +						fan_data->fan_target);
> +					if (retval)
> +						goto cleanup;
> +				} else if (fan_data->fan_pwm_target != 0) {
> +					retval = set_fan_target_pwm(
> +						cdev, fan_data,
> +						fan_data->fan_pwm_target);
> +					if (retval)
> +						goto cleanup;
> +				}
> +				break;
> +			case 2:
> +				set_fan_rpm_curve(cdev, fan_data, quiet_curve);
> +				break;
> +			case 3:
> +				set_fan_rpm_curve(cdev, fan_data,
> +						  balanced_curve);
> +				break;
> +			case 4:
> +				set_fan_rpm_curve(cdev, fan_data,
> +						  extreme_curve);
> +				break;
> +			}

"pwm_enable" is not supposed to be used for parameter settings as done here.
It is supposd to be used to enable/disable automatic fan control.

> +			goto cleanup;
> +		default:
> +			return -EINVAL;
> +		}
> +		goto exit;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +cleanup:
> +	up(&cdev->limit_sem);
> +cleanup_interface:
> +	usb_autopm_put_interface(cdev->interface);
> +exit:
> +	return retval;
> +}
> +
> +int read_func(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	      int channel, long *val)
> +{
> +	struct hwmon_data *data = dev_get_drvdata(dev);
> +	struct driver *cdev = data->dev;
> +	struct hwmon_fan_data *fan_data;
> +	int retval = 0;
> +
> +	if (channel >= data->channel_count)
> +		return -EAGAIN;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			fan_data = data->channel_data[channel];
> +
> +			retval = usb_autopm_get_interface(cdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&cdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +
> +			retval = get_fan_current_rpm(cdev, fan_data, val);
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
> +
> +			get_fan_target_rpm(fan_data, val);
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
> +		case hwmon_pwm_mode:
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
> +	up(&cdev->limit_sem);
> +cleanup_interface:
> +	usb_autopm_put_interface(cdev->interface);
> +exit:
> +	return retval;
> +}
> +
> +#define fan_config (HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN)
> +#define pwm_config (HWMON_PWM_INPUT | HWMON_PWM_ENABLE)
> +
> +static const struct hwmon_ops asetek_6_ops = {
> +	.is_visible = is_visible_func,
> +	.read = read_func,
> +	.write = write_func,
> +};
> +
> +bool does_fan_exist(struct driver *cdev, int channel)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(cdev->udev, cdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(cdev->udev, cdev->bulk_in_endpointAddr);
> +
> +	char *send_buf = cdev->bulk_out_buffer;
> +	char *recv_buf = cdev->bulk_in_buffer;
> +
> +	send_buf[0] = 0x43;
> +	send_buf[1] = channel;
> +	send_buf[2] = (600 >> 8);
> +	send_buf[3] = 600;
> +
> +	retval = usb_bulk_msg(cdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return false;
> +
> +	retval = usb_bulk_msg(cdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
> +	if (retval != 0)
> +		return false;
> +
> +	if (!check_succes(send_buf[0], recv_buf))
> +		return false;
> +	return true;
> +}
> +
> +int get_fan_count(struct driver *dev)
> +{
> +	int fan;
> +
> +	for (fan = 0; does_fan_exist(dev, fan); fan += 1)
> +		;
> +	return fan;
> +}
> +
> +void hwmon_init(struct driver *dev)
> +{
> +	int fan_id;
> +	struct device *hwmon_dev;
> +	struct hwmon_fan_data *fan;
> +	struct hwmon_data *data = devm_kzalloc(
> +		&dev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
> +	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
> +		&dev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
> +	//Allocate the info table
> +	struct hwmon_channel_info **aio_info =
> +		devm_kzalloc(&dev->udev->dev,
> +			     sizeof(struct hwmon_channel_info *) * 2,
> +			     GFP_KERNEL); //2 for each channel info.
> +
> +	//Allocate the fan and PWM configuration
> +	u32 *fans_config = devm_kzalloc(&dev->udev->dev,
> +					sizeof(u32) * (data->channel_count + 1),
> +					GFP_KERNEL);
> +	u32 *pwms_config = devm_kzalloc(&dev->udev->dev,
> +					sizeof(u32) * (data->channel_count + 1),
> +					GFP_KERNEL);
> +
> +	data->channel_count = get_fan_count(dev); //amount of fans
> +	data->channel_data =
> +		devm_kzalloc(&dev->udev->dev,
> +			     sizeof(char *) * data->channel_count, GFP_KERNEL);
> +
> +	//For each fan create a data channel a fan config entry and a pwm config entry

Please no C++ comments

> +	for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
> +		fan = devm_kzalloc(&dev->udev->dev,
> +				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
> +		fan->fan_channel = fan_id;
> +		fan->mode = 2;
> +		data->channel_data[fan_id] = fan;
> +		fans_config[fan_id] = fan_config;
> +		pwms_config[fan_id] = pwm_config;
> +	}
> +	fans_config[data->channel_count] = 0;
> +	pwms_config[data->channel_count] = 0;
> +
> +	aio_info[0] = devm_kzalloc(
> +		&dev->udev->dev, sizeof(struct hwmon_channel_info), GFP_KERNEL);
> +	aio_info[0]->type = hwmon_fan;
> +	aio_info[0]->config = fans_config;
> +
> +	aio_info[1] = devm_kzalloc(
> +		&dev->udev->dev, sizeof(struct hwmon_channel_info), GFP_KERNEL);
> +	aio_info[1]->type = hwmon_pwm;
> +	aio_info[1]->config = pwms_config;
> +
> +	hwmon_info->ops = &asetek_6_ops;
> +	hwmon_info->info = (const struct hwmon_channel_info **)aio_info;
> +
> +	data->dev = dev;
> +	hwmon_dev = devm_hwmon_device_register_with_info(
> +		&dev->udev->dev, "driver_fan", data, hwmon_info, NULL);
> +	dev_info("[*] Setup hwmon\n");

Does this even compile ?

> +}
> +
> +void hwmon_deinit(struct driver *dev)
> +{
> +	hwmon_device_unregister(&dev->udev->dev);

Defeats the purpose of devm_hwmon_device_register_with_info().

> +	dev_info("[*] HWMON DISCONNECT\n");
> +}
> +
> +/*
> + * Devices that work with this driver.
> + * More devices should work, however none have been tested.
> + */
> +static const struct usb_device_id astk_table[] = {
> +	{ USB_DEVICE(0x1b1c, 0x0c15) },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(usb, astk_table);
> +
> +int init_device(struct usb_device *udev)
> +{
> +	int retval;
> +
> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
> +				 0xffff, 0x0000, 0, 0, 0);
> +	//this always returns error

Needs explanation why it is needed.

> +	if (retval != 0)
> +		;
> +
> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +				 0x0002, 0x0000, 0, 0, 0);
> +	if (retval != 0)
> +		return retval;
> +
> +	return 0;

	return retval;

> +}
> +
> +int deinit_device(struct usb_device *udev)
> +{
> +	int retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +				     0x0004, 0x0000, 0, 0, 0);
> +	if (retval != 0)
> +		return retval;
> +
> +	return 0;

> +}
> +
> +static void astk_delete(struct kref *kref)
> +{
> +	struct driver *dev = container_of(kref, struct driver, kref);
> +
> +	usb_put_intf(dev->interface);
> +	usb_put_dev(dev->udev);
> +	kfree(dev->bulk_in_buffer);
> +	kfree(dev->bulk_out_buffer);
> +	kfree(dev);
> +}
> +
> +static int astk_probe(struct usb_interface *interface,
> +		      const struct usb_device_id *id)
> +{
> +	struct driver *dev;
> +	int retval = 0;

Unnecessary initialization.

> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev) {
> +		retval = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
> +					   &bulk_out, NULL, NULL);
> +	if (retval != 0)
> +		goto exit;
> +
> +	dev->udev = usb_get_dev(interface_to_usbdev(interface));
> +	dev->interface = usb_get_intf(interface);
> +
> +	/* set up the endpoint information */
> +	/* use only the first bulk-in and bulk-out endpoints */
> +	dev->bulk_in_size = usb_endpoint_maxp(bulk_in);
> +	dev->bulk_in_buffer = kmalloc(dev->bulk_in_size, GFP_KERNEL);
> +	dev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
> +	dev->bulk_out_size = usb_endpoint_maxp(bulk_out);
> +	dev->bulk_out_buffer = kmalloc(dev->bulk_out_size, GFP_KERNEL);
> +	dev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
> +
> +	retval = init_device(dev->udev);
> +	if (retval) {
> +		dev_err(&interface->dev, "Failled initialising this device.\n");
> +		goto exit;
> +	}
> +
> +	hwmon_init(dev);
> +
> +	usb_set_intfdata(interface, dev);
> +	kref_init(&dev->kref);
> +	mutex_init(&dev->io_mutex);
> +	sema_init(&dev->limit_sem, 8);
> +exit:
> +	return retval;
> +}
> +
> +static void astk_disconnect(struct usb_interface *interface)
> +{
> +	struct driver *dev = usb_get_intfdata(interface);
> +
> +	hwmon_deinit(dev);
> +	usb_set_intfdata(interface, NULL);
> +	kref_put(&dev->kref, astk_delete);
> +	deinit_device(dev->udev);
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

What is the point of those functions if they don't do anything ?

> +
> +static struct usb_driver astk_driver = {
> +	.name = "Asetek gen6 driver",
> +	.id_table = astk_table,
> +	.probe = astk_probe,
> +	.disconnect = astk_disconnect,
> +	.resume = astk_resume,
> +	.suspend = astk_suspend,
> +	.supports_autosuspend = 1,
> +};
> +
> +static int __init astk_init(void)
> +{
> +	int ret = usb_register(&astk_driver);
> +
> +	return ret;

	return usb_register(...);

> +}
> +
> +static void __exit astk_exit(void)
> +{
> +	usb_deregister(&astk_driver);
> +}
> +
> +module_init(astk_init);
> +module_exit(astk_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
> +MODULE_DESCRIPTION("Asetek gen6 driver");
> -- 
> 2.27.0
> 
