Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97997C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 23:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ2XbB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 19:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJ2XbA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 19:31:00 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1350337188;
        Sat, 29 Oct 2022 16:30:59 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-13bd19c3b68so10121077fac.7;
        Sat, 29 Oct 2022 16:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiB8WBYSVUHRiFTekIodls5gRlhdDZk8QB5Q49Q2r9s=;
        b=QfCuFwsUPn19IbbWUHHqnMyf6cCTdg4a9eCCsVkqMVCZezA5zI7lsMlwjnUi3eBrVP
         GWkF+/hai+7pZCLLSOCsbI/xE0gW+q779aREpF55Ot4hrjA1IvM0O9KpXFmg0K5/cBMZ
         92cN4jvxnUA7eGxsJLZr9d3ID27//2Z8D/lzgw/HgJjQXElHjjNW5Xu19Yn3WnwjimjY
         ZWnnwMZGwWZkZI8osB+Fdc2ZHX9JZKJZuRdikb7YjZOmpjlufD/5gnFth2UGM9D+lf+3
         9ok9YEl7TH1Y+5AVNroGUdoX3uofPLeEIGzwpo0qJ0bIBU3OS4APUe3F1h25slO43VIX
         qwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiB8WBYSVUHRiFTekIodls5gRlhdDZk8QB5Q49Q2r9s=;
        b=NcPJpcsZYOdYSQNFBzm/b6X8tBGDWYZZm6u+1ye0QfInIy9uZoKVS7U835BM+BkqM6
         u72ZYCbfTiX5NW4qymnqXTcKM0VdL9BEs8qrVc58pJJCpbAt9CF+cliTRl+T3k1VA2B2
         J7GWHRMDLfE9kTN/8IfhCTDG3S2TG0Fk2gg2yXimMxg+Svffl09YRvh6ttyUPDw59sec
         f4FetDlXZpwA7eadOnOEJ2ijGyc8iTBwEji4M+PeQNkKgfF4cDfj5/NO7zNk4n5nzn2z
         0Q6UKqRRzTv/EhQcnBpQS7XBxA1b3ZikJYF7zhhHBcCKPr/0h0KjnxDAQAK5zmvchLPv
         /v3g==
X-Gm-Message-State: ACrzQf0PPehHXHZ6YAr0Fb6hf+ffCREepe5CBqNHTQYpZBgENXG4GwKP
        wTkuvloXLFfS9fcSBgaFoNY=
X-Google-Smtp-Source: AMsMyM4nkRLNikfuuhhxLtm7B2TM3L0s6Qy46DDHtTMj1webIe08hXDKRNx53ABuQ+9Xx8zVv7jQ/g==
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id ba11-20020a056870c58b00b0010bd21dad5emr3358188oab.287.1667086258225;
        Sat, 29 Oct 2022 16:30:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p1-20020a9d6941000000b0066c483fdb4dsm236526oto.4.2022.10.29.16.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 16:30:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <506a6e7f-4566-2dcf-37f3-0f41f4ce983b@roeck-us.net>
Date:   Sat, 29 Oct 2022 16:30:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= 
        <samsagax@gmail.com>, hdegoede@redhat.com
Cc:     markgross@kernel.org, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20221029225051.1171795-1-samsagax@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Add OneXPlayer mini AMD board driver
In-Reply-To: <20221029225051.1171795-1-samsagax@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/29/22 15:50, Joaquín Ignacio Aramendía wrote:
> Platform driver for OXP Handhelds that expose fan reading and control
> via hwmon sysfs.
> 
> As far as I could gather all OXP boards have the same DMI strings and
> they are told appart by the boot cpu vendor (Intel/AMD).
> Currently only AMD boards are supported but the code is made to be simple
> to add other handheld boards in the future.
> 
> Fan control is provided via pwm interface in the range [0-255]. AMD
> boards have [0-100] as range in the EC, the written value is scaled to
> accomodate for that.
> 
> PWM control is disabled by default, can be enabled via module parameter
> `fan_control=1`.
> ---
>   drivers/platform/x86/Kconfig        |   8 +
>   drivers/platform/x86/Makefile       |   3 +
>   drivers/platform/x86/oxp-platform.c | 393 ++++++++++++++++++++++++++++
>   3 files changed, 404 insertions(+)
>   create mode 100644 drivers/platform/x86/oxp-platform.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f5312f51de19..8fe3ca1dd808 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -738,6 +738,14 @@ config XO1_RFKILL
>   	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
>   	  laptop.
> 
> +config OXP_DEVICE
> +	tristate "OneXPlayer EC fan control"
> +	depends on ACPI
> +	depends on HWMON
> +	help
> +		Support for OneXPlayer device board EC fan control. Only AMD boards
> +		are supported.
> +
>   config PCENGINES_APU2
>   	tristate "PC Engines APUv2/3 front button and LEDs driver"
>   	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a428caa654a..fa6f5c68ec45 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -80,6 +80,9 @@ obj-$(CONFIG_MSI_WMI)		+= msi-wmi.o
>   obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
>   obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
> 
> +# OneXPlayer
> +obj-$(CONFIG_OXP_DEVICE) += oxp-platform.o
> +
>   # PC Engines
>   obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
> 
> diff --git a/drivers/platform/x86/oxp-platform.c b/drivers/platform/x86/oxp-platform.c
> new file mode 100644
> index 000000000000..4fb13e7450ff
> --- /dev/null
> +++ b/drivers/platform/x86/oxp-platform.c
> @@ -0,0 +1,393 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Platform driver for OXP Handhelds that expose fan reading and control
> + * via hwmon sysfs.
> + *
> + * All boards have the same DMI strings and they are told appart by the
> + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supported
> + * but the code is made to be simple to add other handheld boards in the
> + * future.
> + * Fan control is provided via pwm interface in the range [0-255]. AMD
> + * boards use [0-100] as range in the EC, the written value is scaled to
> + * accomodate for that.
> + *
> + * PWM control is disabled by default, can be enabled via module parameter.
> + *
> + * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <asm/processor.h>
> +
> +static bool fan_control;
> +module_param_hw(fan_control, bool, other, 0644);

Runtime writeable parameter is unacceptable. Why would this be needed anyway ?
What is it supposed to accomplish that can not be done with a sysfs attribute ?

> +MODULE_PARM_DESC(fan_control, "Enable fan control");
> +
> +#define ACPI_LOCK_DELAY_MS	500
> +
> +/* Handle ACPI lock mechanism */
> +struct lock_data {
> +	u32 mutex;
> +	bool (*lock)(struct lock_data *data);
> +	bool (*unlock)(struct lock_data *data);
> +};
> +
> +static bool lock_global_acpi_lock(struct lock_data *data)
> +{
> +	return ACPI_SUCCESS(acpi_acquire_global_lock(ACPI_LOCK_DELAY_MS,
> +								 &data->mutex));
> +}
> +
> +static bool unlock_global_acpi_lock(struct lock_data *data)
> +{
> +	return ACPI_SUCCESS(acpi_release_global_lock(data->mutex));
> +}
> +
> +#define MAX_IDENTICAL_BOARD_VARIATIONS	2
> +
> +enum board_family {
> +	family_unknown,
> +	family_mini_amd,
> +};
> +
> +enum oxp_sensor_type {
> +	oxp_sensor_fan = 0,
> +	oxp_sensor_pwm,
> +	oxp_sensor_number,
> +};
> +
> +struct oxp_ec_sensor_addr {
> +	enum hwmon_sensor_types type;
> +	u8 reg;
> +	short size;
> +	union {
> +		struct {
> +			u8 enable;
> +			u8 val_enable;
> +			u8 val_disable;
> +		};
> +		struct {
> +		  int max_speed;
> +		};
> +	};
> +};
> +
> +

Extra empty line.

> +/* AMD board EC addresses */
> +static const struct oxp_ec_sensor_addr amd_sensors[] = {
> +	[oxp_sensor_fan] = {
> +		.type = hwmon_fan,
> +		.reg = 0x76,
> +		.size = 2,
> +		.max_speed = 5000,
> +	},
> +	[oxp_sensor_pwm] = {
> +		.type = hwmon_pwm,
> +		.reg = 0x4B,
> +		.size = 1,
> +		.enable = 0x4A,
> +		.val_enable = 0x01,
> +		.val_disable = 0x00,
> +	},

I don't see the point of this data structure. There is just one
entry. Why not use defines ?

> +	{},
> +};
> +
> +struct ec_board_info {
> +	const char *board_names[MAX_IDENTICAL_BOARD_VARIATIONS];
> +	enum board_family family;
> +	const struct oxp_ec_sensor_addr *sensors;
> +};
> +
> +static const struct ec_board_info board_info[] = {
> +	{
> +		.board_names = {"ONE XPLAYER", "ONEXPLAYER mini A07"},
> +		.family = family_mini_amd,
> +		.sensors = amd_sensors,
> +	},

There is just one family. What is the point of this data structure ?

> +	{}
> +};
> +
> +struct oxp_status {
> +	struct ec_board_info board;
> +	struct lock_data lock_data;
> +};
> +
> +/* Helper functions */
> +static int read_from_ec(u8 reg, int size, long *val)
> +{
> +	int i;
> +	int ret;
> +	u8 buffer;
> +
> +	*val = 0;
> +	for (i = 0; i < size; i++) {
> +		ret = ec_read(reg + i, &buffer);
> +		if (ret)
> +			return ret;
> +		(*val) <<= i*8;

space between i and 8

> +		*val += buffer;
> +	}
> +	return ret;

	return 0;

> +}
> +
> +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
> +{
> +	struct oxp_status *state = dev_get_drvdata(dev);
> +	int ret = -1;

unnecessary (and bad) variable initialization

> +
> +	if (!state->lock_data.lock(&state->lock_data)) {
> +		dev_warn(dev, "Failed to acquire mutex");
> +		return -EBUSY;
> +	}
> +
> +	ret = ec_write(reg, value);
> +
> +	if (!state->lock_data.unlock(&state->lock_data))
> +		dev_err(dev, "Failed to release mutex");
> +
> +	return ret;
> +}
> +
> +/* Callbacks for hwmon interface */
> +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> +					enum hwmon_sensor_types type, u32 attr, int channel)
> +{
> +	switch (type) {
> +		case hwmon_fan:
> +			return S_IRUGO;
> +		case hwmon_pwm:
> +			return S_IRUGO | S_IWUSR;

Please use 0444 and 0644 directly. Checkpatch will tell.

> +		default:
> +			return 0;
> +	}
> +	return 0;
> +}
> +
> +static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
> +		u32 attr, int channel, long *val)

Align continuation line with '('. Checkpatch will tell.

> +{
> +	int ret = -1;
> +	const struct oxp_status *state = dev_get_drvdata(dev);
> +	const struct ec_board_info *board = &state->board;
> +
> +	switch(type) {
> +		case hwmon_fan:
> +			switch(attr) {
> +				case hwmon_fan_input:
> +					ret = read_from_ec(board->sensors[oxp_sensor_fan].reg,
> +							board->sensors[oxp_sensor_fan].size, val);
> +					break;
> +				case hwmon_fan_max:
> +					ret = 0;
> +					*val = board->sensors[oxp_sensor_fan].max_speed;
> +					break;
> +				case hwmon_fan_min:
> +					ret = 0;
> +					*val = 0;
> +					break;

If fan_max and fan_min are not sent to/from the EC, do not provide the attributes.

> +				default:
> +					dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);

missing break;

> +			}
> +			return ret;
> +		case hwmon_pwm:
> +			switch(attr) {
> +				case hwmon_pwm_input:
> +					ret = read_from_ec(board->sensors[oxp_sensor_pwm].reg,
> +							board->sensors[oxp_sensor_pwm].size, val);
> +					if (board->family == family_mini_amd) {
> +						*val = (*val * 255) / 100;
> +					}
> +					break;
> +				case hwmon_pwm_enable:
> +					ret = read_from_ec(board->sensors[oxp_sensor_pwm].enable, 1, val);
> +					if (*val == board->sensors[oxp_sensor_pwm].val_enable) {
> +						*val = 1;
> +					} else {
> +						*val = 0;
> +					}

Unnecessary { }. Checkpatch would tell.

I don't see the point of this code. Why have board->sensors[oxp_sensor_pwm].val_enable
to start with ? It is 1. Can the EC return something else ? If so, what is the
rationale to map it to 0 ?

> +					break;
> +				default:
> +					dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);

missing break;

> +			}
> +			return ret;
> +		default:
> +			dev_dbg(dev, "Unknown sensor type %d.\n", type);
> +			return -1;

bad error code.

> +	}
> +}
> +
> +static int oxp_pwm_enable(const struct device *dev)
> +{
> +	int ret = -1;

Unnecessary (and bad) variable initialization.

> +	struct oxp_status *state = dev_get_drvdata(dev);
> +	const struct ec_board_info *board = &state->board;
> +
> +	if (!fan_control) {
> +		dev_info(dev, "Can't enable pwm, fan_control=0");
> +		return -EPERM;
> +	}
> +
> +	ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
> +		board->sensors[oxp_sensor_pwm].val_enable);
> +
> +	return ret;

... and unnecessary variable.

> +}
> +
> +static int oxp_pwm_disable(const struct device *dev)
> +{
> +	int ret = -1;

Unnecessary initialization, and bad error code.

> +	struct oxp_status *state = dev_get_drvdata(dev);
> +	const struct ec_board_info *board = &state->board;
> +
> +	if (!fan_control) {
> +		dev_info(dev, "Can't disable pwm, fan_control=0");
> +		return -EPERM;
> +	}

I really don't see the point of the "fan_control" module parameter.
One can set it to 1 (or true) to enable the pwm_enable attribute,
or set it to 0 to disable it. It is effectively the same as just
another attribute, forcing users to write two attributes instead
of one. That really doesn't make sense.

> +
> +	ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
> +		board->sensors[oxp_sensor_pwm].val_disable);
> +
> +	return ret;

Just
	return write_to_ec(...);

would do. There is no need for the ret variable. Same elsewhere.

> +}
> +
> +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
> +		u32 attr, int channel, long val)
> +{
> +	int ret = -1;

bad error code.

> +	struct oxp_status *state = dev_get_drvdata(dev);
> +	const struct ec_board_info *board = &state->board;
> +
> +	switch(type) {
> +		case hwmon_pwm:
> +			if (!fan_control) {
> +				dev_info(dev, "Can't control fans, fan_control=0");
> +				return -EPERM;
> +			}
> +			switch(attr) {
> +				case hwmon_pwm_enable:
> +					if (val == 1) {
> +						ret = oxp_pwm_enable(dev);
> +					} else if (val == 0) {
> +						ret = oxp_pwm_disable(dev);
> +					} else {
> +						return -EINVAL;
> +					}

Unnecessary { }, and the single return on error instead of
						ret = -EINVAL;
is inconsistent.

> +					return ret;
> +				case hwmon_pwm_input:
> +					if (val < 0 || val > 255)
> +						return -EINVAL;
> +					if (board->family == family_mini_amd)
> +						val = (val * 100) / 255;
> +					ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].reg, val);
> +					return ret;
> +				default:
> +					dev_dbg(dev, "Unknown attribute for type %d: %d", type, attr);
> +					return ret;
> +			}
> +		default:
> +			dev_dbg(dev, "Unknown sensor type: %d", type);

break missing

> +	}
> +	return ret;
> +}
> +
> +/* Known sensors in the OXP EC controllers */
> +static const struct hwmon_channel_info *oxp_platform_sensors[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +		HWMON_F_INPUT | HWMON_F_MAX | HWMON_F_MIN),
> +	HWMON_CHANNEL_INFO(pwm,
> +		HWMON_PWM_INPUT | HWMON_PWM_ENABLE),

bad alignment. Please use checkpatch --strict and fix what it reports.

> +	NULL
> +};
> +
> +static const struct hwmon_ops oxp_ec_hwmon_ops = {
> +	.is_visible = oxp_ec_hwmon_is_visible,
> +	.read = oxp_platform_read,
> +	.write = oxp_platform_write,
> +};
> +
> +static const struct hwmon_chip_info oxp_ec_chip_info = {
> +	.ops = &oxp_ec_hwmon_ops,
> +	.info = oxp_platform_sensors,
> +};
> +
> +/* Initialization logic */
> +static const struct ec_board_info * __init get_board_info(struct device *dev)
> +{
> +	const char *dmi_board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> +	const char *dmi_board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +	const struct ec_board_info *board;
> +
> +	if (!dmi_board_vendor || !dmi_board_name ||
> +	    (strcasecmp(dmi_board_vendor, "ONE-NETBOOK TECHNOLOGY CO., LTD.") &&
> +	     strcasecmp(dmi_board_vendor, "ONE-NETBOOK")))
> +		return NULL;
> +
> +	/* Match our known boards */
> +	/* Need to check for AMD/Intel here */
> +	for (board = board_info; board->sensors; board++) {
> +		if (match_string(board->board_names,
> +				 MAX_IDENTICAL_BOARD_VARIATIONS,
> +				 dmi_board_name) >= 0) {
> +			if (board->family == family_mini_amd &&
> +					boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
> +				return board;
> +			}
> +		}
> +	}
> +	return NULL;

Why not use a dmi match table for the above code ?

> +}
> +
> +static int __init oxp_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *hwdev;
> +	const struct ec_board_info *pboard_info;
> +	struct oxp_status *state;
> +
> +	pboard_info = get_board_info(dev);
> +	if (!pboard_info)
> +		return -ENODEV;
> +
> +	state = devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->board = *pboard_info;
> +
> +	state->lock_data.mutex = 0;
> +	state->lock_data.lock = lock_global_acpi_lock;
> +	state->lock_data.unlock = unlock_global_acpi_lock;
> +
> +	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", state,
> +							&oxp_ec_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwdev);

This only configures a hwmon driver and thus should reside in the hwmon
subsystem/directory.

> +}
> +
> +static const struct acpi_device_id acpi_ec_ids[] = {
> +	/* Embedded Controller Device */
> +	{ "PNP0C09", 0 },
> +	{}
> +};

I am not sure if this works. There are other drivers mapping to the same ACPI ID;
those may refuse to load if this driver is in the system. We had problems with
this before, so I am very concerned about side effects.

> +
> +static struct platform_driver oxp_platform_driver = {
> +	.driver = {
> +		.name	= "oxp-platform",
> +		.acpi_match_table = acpi_ec_ids,
> +	},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, acpi_ec_ids);
> +module_platform_driver_probe(oxp_platform_driver, oxp_platform_probe);
> +
> +MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
> +MODULE_DESCRIPTION(
> +	"Platform driver that handles ACPI EC of OneXPlayer devices");
> +MODULE_LICENSE("GPL");
> --
> 2.38.1
> 

