Return-Path: <SRS0=SncT=A4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5BEC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Jul 2020 23:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5711520768
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Jul 2020 23:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPJ7JqxJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgGQXP0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Jul 2020 19:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgGQXPZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Jul 2020 19:15:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747FFC0619D2;
        Fri, 17 Jul 2020 16:15:25 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gc9so7181273pjb.2;
        Fri, 17 Jul 2020 16:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qyt9FI0PXtBuXKCrgsa1mv66XMot6C6gqk5C25YUvOI=;
        b=RPJ7JqxJ3/ObYztZGs3T6p6AgrIH2q/wdxkA8Qk58jFxv991taubbYpGjNVwu2Dii0
         9PPG3NDJSKD5GOT/bF3/3FnzS1JzItrS+RbapVhFPMnJauS4LxybidSdgs8rDm7B6tcS
         kdCPW3hL1ltAQUtijwdrKF9GXaeraXBPeBQOTBtgmPgWA724+shAnuSQzM04czt5wlbe
         ZpXVIJv5X+zQhnjKbOffSGYh4OtJ82mX5PElc5R9tZXKGgOZjc7ArkdgtZIAnkG7mbGU
         LX6Z4m06xmTHeLpeRHoEZqRAy1A6vukl44a0S/kjQBbtUm9Lp9O+333/aSSxZn4s3ycd
         nKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Qyt9FI0PXtBuXKCrgsa1mv66XMot6C6gqk5C25YUvOI=;
        b=BiOc9zy7koMmM84jgKwrA9P9L2t/18wryFTXWYckoI7zWDhGtqu+WsFEt0p93txGiC
         89DHyZwK2gmFbbjcRZpd7G559ksMIDXv2lNnH8v+LCLEI8XKZNflSgzSGdNxdxYBgp9w
         uz0CkENqPFEQ4I0lHnxY1D0lk85dI6dTWylwIU8/YYITpQ27E2N+43mvF/LrbNY9DIPl
         TychP6KfoYk6Kpt2djWbqJLtekUQlBBvAtP5EzVculIQnDZPfNG0ivKrZeifEfNiqAEl
         Nc4AJwNsofHCOPVJVHTbLAmVIBFp3WAwOZ58D2CFYaqeL69Sw3ONK8O3LqmxRImMqKCQ
         R1lw==
X-Gm-Message-State: AOAM532HsKIjQPeE751jzYxYW0le6TGv0jrg8Y+INl/bE4GE2oLzPPa1
        amYczRDxynVjSG0PxZunUFVmNAz/
X-Google-Smtp-Source: ABdhPJxkx7myIDTsOBscUIwT06xGxU1PRLE445wJtCeqx/Pyu4d4zIUu4iy/gNdRdfhBorlD/2yUIw==
X-Received: by 2002:a17:90b:4b8d:: with SMTP id lr13mr11922375pjb.236.1595027724431;
        Fri, 17 Jul 2020 16:15:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x66sm8818307pgb.12.2020.07.17.16.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 16:15:23 -0700 (PDT)
Subject: Re: [PATCH V2] hwmon: add fan/pwm driver for corsair h100i platinum
To:     jaap aarts <jaap.aarts1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20200717121642.41022-1-jaap.aarts1@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6a5bcebd-379b-58d8-ac26-0bb2a27b9291@roeck-us.net>
Date:   Fri, 17 Jul 2020 16:15:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717121642.41022-1-jaap.aarts1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/17/20 5:16 AM, jaap aarts wrote:
> Adds fan/pwm support for H100i platinum.
> Custom temp/fan curves are not supported, however
> the presets found in the proprietary drivers are available.
> 
> Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>

Most of my comments have not been addressed.
Change log is missing.
0-day feedback has not been adressed.

Guenter

> ---
>  drivers/hwmon/Kconfig               |   6 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/corsair_hydro_i_pro.c | 791 ++++++++++++++++++++++++++++
>  3 files changed, 798 insertions(+)
>  create mode 100644 drivers/hwmon/corsair_hydro_i_pro.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 288ae9f63588..9831a40fb05f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -378,6 +378,12 @@ config SENSORS_ARM_SCPI
>  	  and power sensors available on ARM Ltd's SCP based platforms. The
>  	  actual number and type of sensors exported depend on the platform.
>  
> +config SENSORS_CORSAIR_HYDRO_I_PRO
> +	tristate "Corsair hydro HXXXi pro driver"
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
> index 000000000000..43bf52d8d365
> --- /dev/null
> +++ b/drivers/hwmon/corsair_hydro_i_pro.c
> @@ -0,0 +1,791 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid coolers.
> + * Copyright (c) Jaap Aarts 2020
> + *
> + * Protocol reverse engineered by audiohacked
> + * https://github.com/audiohacked/OpendriverLink
> + */
> +
> +/*
> + * Supports following liquid coolers:
> + * H100i platinum
> + *
> + * Other products should work with this driver but no testing has been done.
> + *
> + * Note: platinum is the codename name for pro within the driver, so H100i platinum = H100i pro.
> + * But some products are actually calles platinum, these are not intended to be supported.
> + *
> + * Note: fan curve control has not been implemented
> + */
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +struct hydro_i_pro_device {
> +	struct usb_device *udev;
> +
> +	unsigned char *bulk_out_buffer;
> +	char *bulk_in_buffer;
> +	size_t bulk_out_size;
> +	size_t bulk_in_size;
> +	char bulk_in_endpointAddr;
> +	char bulk_out_endpointAddr;
> +
> +	struct usb_interface *interface; /* the interface for this device */
> +	struct semaphore
> +		limit_sem; /* limiting the number of writes in progress */
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
> +	struct hydro_i_pro_device *hdev;
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
> +
> +#define default_curve quiet_curve
> +
> +enum opcodes {
> +	PWM_FAN_CURVE_CMD = 0x40,
> +	PWM_GET_CURRENT_CMD = 0x41,
> +	PWM_FAN_TARGET_CMD = 0x42,
> +	RPM_FAN_TARGET_CMD = 0x43,
> +};
> +
> +#define SUCCES_LENGTH 3
> +#define SUCCES_CODE (0x12, 0x34)
> +static const char SUCCESS[SUCCES_LENGTH - 1] = { 0x12, 0x34 };
> +
> +static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])
> +{
> +	char success[SUCCES_LENGTH] = { command, SUCCES_CODE };
> +
> +	return strncmp(ret, success, SUCCES_LENGTH) == 0;
> +}
> +
> +int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> +		      struct hwmon_fan_data *fan_data,
> +		      struct curve_point point[7])
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
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
> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 16, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf)) {
> +		dev_info(&hdev->udev->dev,
> +			 "[*] failed setting fan curve %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
> +		       struct hwmon_fan_data *fan_data, long val)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> +
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
> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf)) {
> +		dev_info(&hdev->udev->dev,
> +			 "[*] failed setting fan rpm %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
> +			struct hwmon_fan_data *fan_data, long *val)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> +
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	send_buf[0] = PWM_GET_CURRENT_CMD;
> +	send_buf[1] = fan_data->fan_channel;
> +
> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 2, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf) ||
> +	    recv_buf[3] != fan_data->fan_channel) {
> +		dev_info(&hdev->udev->dev,
> +			 "[*] failed retrieving fan rmp %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +		return -EINVAL;
> +	}
> +
> +	*val = ((recv_buf[4]) << 8) + recv_buf[5];
> +	return 0;
> +}
> +
> +int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> +		       struct hwmon_fan_data *fan_data, long val)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> +
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	fan_data->fan_pwm_target = val;
> +	fan_data->fan_target = 0;
> +
> +	send_buf[0] = PWM_FAN_TARGET_CMD;
> +	send_buf[1] = fan_data->fan_channel;
> +	send_buf[3] = fan_data->fan_pwm_target;
> +
> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return retval;
> +
> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
> +	if (retval != 0)
> +		return retval;
> +
> +	if (!check_succes(send_buf[0], recv_buf)) {
> +		dev_info(&hdev->udev->dev,
> +			 "[*] failed setting fan pwm %d,%d,%d/%d\n",
> +			 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +umode_t hwmon_is_visible(const void *d, enum hwmon_sensor_types type, u32 attr,
> +			 int channel)
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
> +			retval = usb_autopm_get_interface(hdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&hdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +
> +			retval = set_fan_target_rpm(hdev, fan_data, val);
> +			if (retval)
> +				goto cleanup;
> +
> +			break;
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
> +			retval = usb_autopm_get_interface(hdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&hdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +
> +			retval = set_fan_target_pwm(hdev, fan_data, val);
> +			if (retval)
> +				goto cleanup;
> +
> +			break;
> +		case hwmon_pwm_enable:
> +			fan_data = data->channel_data[channel];
> +
> +			retval = usb_autopm_get_interface(hdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&hdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
> +			fan_data->mode = val;
> +
> +			switch (val) {
> +			case 0:
> +				set_fan_pwm_curve(hdev, fan_data,
> +						  default_curve);
> +				break;
> +			case 1:
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
> +				break;
> +			case 2:
> +				set_fan_pwm_curve(hdev, fan_data, quiet_curve);
> +				break;
> +			case 3:
> +				set_fan_pwm_curve(hdev, fan_data,
> +						  balanced_curve);
> +				break;
> +			case 4:
> +				set_fan_pwm_curve(hdev, fan_data,
> +						  extreme_curve);
> +				break;
> +			}
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		goto exit;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +cleanup:
> +	up(&hdev->limit_sem);
> +cleanup_interface:
> +	usb_autopm_put_interface(hdev->interface);
> +exit:
> +	return retval;
> +}
> +
> +int hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	       int channel, long *val)
> +{
> +	struct hwmon_data *data = dev_get_drvdata(dev);
> +	struct hydro_i_pro_device *hdev = data->hdev;
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
> +			retval = usb_autopm_get_interface(hdev->interface);
> +			if (retval)
> +				goto exit;
> +
> +			if (down_trylock(&hdev->limit_sem)) {
> +				retval = -EAGAIN;
> +				goto cleanup_interface;
> +			}
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
> +	up(&hdev->limit_sem);
> +cleanup_interface:
> +	usb_autopm_put_interface(hdev->interface);
> +exit:
> +	return retval;
> +}
> +
> +#define fan_config (HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN)
> +#define pwm_config (HWMON_PWM_INPUT | HWMON_PWM_ENABLE)
> +
> +static const struct hwmon_ops i_pro_ops = {
> +	.is_visible = hwmon_is_visible,
> +	.read = hwmon_read,
> +	.write = hwmon_write,
> +};
> +
> +bool does_fan_exist(struct hydro_i_pro_device *hdev, int channel)
> +{
> +	int retval;
> +	int wrote;
> +	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> +	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> +
> +	unsigned char *send_buf = hdev->bulk_out_buffer;
> +	unsigned char *recv_buf = hdev->bulk_in_buffer;
> +
> +	send_buf[0] = RPM_FAN_TARGET_CMD;
> +	send_buf[1] = channel;
> +	send_buf[2] = (600 >> 8);
> +	send_buf[3] = (unsigned char)600;
> +
> +	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> +	if (retval != 0)
> +		return false;
> +
> +	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
> +	if (retval != 0)
> +		return false;
> +
> +	if (!check_succes(send_buf[0], recv_buf))
> +		return false;
> +	return true;
> +}
> +
> +int get_fan_count(struct hydro_i_pro_device *hdev)
> +{
> +	int fan;
> +
> +	for (fan = 0; does_fan_exist(hdev, fan); fan += 1)
> +		;
> +	return fan;
> +}
> +
> +void hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +	int fan_id;
> +	struct device *hwmon_dev;
> +	struct hwmon_fan_data *fan;
> +	struct hwmon_data *data = devm_kzalloc(
> +		&hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
> +	struct hwmon_chip_info *hwmon_info = devm_kzalloc(
> +		&hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
> +	//Allocate the info table
> +	struct hwmon_channel_info **aio_info =
> +		devm_kzalloc(&hdev->udev->dev,
> +			     sizeof(struct hwmon_channel_info *) * 2,
> +			     GFP_KERNEL); //2 for each channel info.
> +
> +	//Allocate the fan and PWM configuration
> +	u32 *fans_config = devm_kzalloc(&hdev->udev->dev,
> +					sizeof(u32) * (data->channel_count + 1),
> +					GFP_KERNEL);
> +	u32 *pwms_config = devm_kzalloc(&hdev->udev->dev,
> +					sizeof(u32) * (data->channel_count + 1),
> +					GFP_KERNEL);
> +
> +	data->channel_count = get_fan_count(hdev); //amount of fans
> +	data->channel_data =
> +		devm_kzalloc(&hdev->udev->dev,
> +			     sizeof(char *) * data->channel_count, GFP_KERNEL);
> +
> +	//For each fan create a data channel a fan config entry and a pwm config entry
> +	for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
> +		fan = devm_kzalloc(&hdev->udev->dev,
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
> +	aio_info[0] =
> +		devm_kzalloc(&hdev->udev->dev,
> +			     sizeof(struct hwmon_channel_info), GFP_KERNEL);
> +	aio_info[0]->type = hwmon_fan;
> +	aio_info[0]->config = fans_config;
> +
> +	aio_info[1] =
> +		devm_kzalloc(&hdev->udev->dev,
> +			     sizeof(struct hwmon_channel_info), GFP_KERNEL);
> +	aio_info[1]->type = hwmon_pwm;
> +	aio_info[1]->config = pwms_config;
> +
> +	hwmon_info->ops = &i_pro_ops;
> +	hwmon_info->info = (const struct hwmon_channel_info **)aio_info;
> +
> +	data->hdev = hdev;
> +	hwmon_dev = devm_hwmon_device_register_with_info(
> +		&hdev->udev->dev, "driver_fan", data, hwmon_info, NULL);
> +	dev_info(&hdev->udev->dev, "[*] Setup hwmon\n");
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
> +	//This is needed because when running windows in a vm with proprietary driver
> +	//and you switch to this driver, the device will not respond unless you run this.
> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
> +				 0xffff, 0x0000, 0, 0, 0);
> +	//this always returns error
> +	if (retval != 0)
> +		;
> +
> +	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +				 0x0002, 0x0000, 0, 0, 0);
> +	return retval;
> +}
> +
> +int deinit_device(struct usb_device *udev)
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
> +	struct hydro_i_pro_device *hdev;
> +	int retval;
> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
> +	if (!hdev) {
> +		retval = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
> +					   &bulk_out, NULL, NULL);
> +	if (retval != 0)
> +		goto exit;
> +
> +	hdev->udev = usb_get_dev(interface_to_usbdev(interface));
> +	hdev->interface = usb_get_intf(interface);
> +
> +	/* set up the endpoint information */
> +	/* use only the first bulk-in and bulk-out endpoints */
> +	hdev->bulk_in_size = usb_endpoint_maxp(bulk_in);
> +	hdev->bulk_in_buffer = kmalloc(hdev->bulk_in_size, GFP_KERNEL);
> +	hdev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
> +	hdev->bulk_out_size = usb_endpoint_maxp(bulk_out);
> +	hdev->bulk_out_buffer = kmalloc(hdev->bulk_out_size, GFP_KERNEL);
> +	hdev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
> +
> +	retval = init_device(hdev->udev);
> +	if (retval) {
> +		dev_err(&interface->dev, "failed initialising this device.\n");
> +		goto exit;
> +	}
> +
> +	hwmon_init(hdev);
> +
> +	usb_set_intfdata(interface, hdev);
> +	sema_init(&hdev->limit_sem, 8);
> +exit:
> +	return retval;
> +}
> +
> +static void astk_disconnect(struct usb_interface *interface)
> +{
> +	struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
> +
> +	dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");
> +	usb_set_intfdata(interface, NULL);
> +	astk_delete(hdev);
> +	deinit_device(hdev->udev);
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
> +static int __init hydro_i_pro_init(void)
> +{
> +	return usb_register(&hydro_i_pro_driver);
> +}
> +
> +static void __exit hydro_i_pro_exit(void)
> +{
> +	usb_deregister(&hydro_i_pro_driver);
> +}
> +
> +module_init(hydro_i_pro_init);
> +module_exit(hydro_i_pro_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
> +MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
> 

