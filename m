Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E8AC433B4
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Apr 2021 14:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E33996044F
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Apr 2021 14:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbhDJO5v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Apr 2021 10:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234849AbhDJO5v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Apr 2021 10:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618066655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WESgVjTmkV6HoxjY/ygSJrZoGJHew+Te92638uOsTcI=;
        b=YfoLUIqZsDifywZ25eopRNbmPau32/wFw0cTaAiAN3UfttFK1JMGuKy5d4iVHDbDbFNjnV
        Zey8U4TpMlpubtDOXbAc9Z0CyNG64rSgD81nJ1jC+PSfrdfGATx0nCHQSuCUKN5NOVa/2b
        sGXyuyG0DOwVL/QHEdpvrhcx8I/3Ir4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-bq6Hrw9DP1mTc-eRKX-kBg-1; Sat, 10 Apr 2021 10:57:32 -0400
X-MC-Unique: bq6Hrw9DP1mTc-eRKX-kBg-1
Received: by mail-ed1-f72.google.com with SMTP id dj13so702100edb.14
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Apr 2021 07:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WESgVjTmkV6HoxjY/ygSJrZoGJHew+Te92638uOsTcI=;
        b=ekMNsqt3x1rQfQKesROuDN9tE/H3w3QwZU7pUN1r1tq8sE2X0aXBBMOMidZUcc2DJ2
         DqfqEL9ZstMW9WBxrJOT3xMowThAIC4ff3AVMQoK0z6uhesZq2t51x/DmrPi4hC3NECQ
         0wLW+NfYv0GZ3xM+6toN4rvgiEUaIHfQMk2mT05CNQxGwnRtzcsMa7Oh/FNX5GKG4C/j
         mQpVl/K0JVNOIBjmXfrWfoCCnv/ZDQS9XRWRHRykLLsB8H5CIIQZNIqZ8MRx/9afKANu
         XV7M5s8Hm6m2/zzmzITkKf/w/PZOeNQ7zKT83l0iLUK7yxn0jytGaMFPlmTh+8WizxNL
         kfwA==
X-Gm-Message-State: AOAM530W6cVOX7j9KHVLyQiGzx/YbhKlaJfoSFVw/z7tEzT3ffi0cPW/
        dMQNdt2KheEpFHL2/2y9WdfxG9yFJGF4yal9F4P34Hwef7dQMdDFG0lT34JLT4b/2IW5DEWI81F
        /zjj9pcvCjGz0ThYwgbm3MEA=
X-Received: by 2002:a17:906:8a6e:: with SMTP id hy14mr20618206ejc.356.1618066650953;
        Sat, 10 Apr 2021 07:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysoiSYG+4jRSj0ocs9UzI6eOnisignfmDXJUdDjzRR30WaRbcA9svem5MzMemvo4HMIuqfKw==
X-Received: by 2002:a17:906:8a6e:: with SMTP id hy14mr20618189ejc.356.1618066650750;
        Sat, 10 Apr 2021 07:57:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e15sm2775993ejh.56.2021.04.10.07.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 07:57:30 -0700 (PDT)
Subject: Re: [PATCH v3] platform/x86: add Gigabyte WMI temperature driver
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>
References: <117cadef-c1cb-d66a-15f8-ce50d596be4b@redhat.com>
 <20210410144021.138035-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e1b86746-b04d-0f14-8121-d24da4d10ceb@redhat.com>
Date:   Sat, 10 Apr 2021 16:57:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210410144021.138035-1-linux@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 4/10/21 4:40 PM, Thomas Weißschuh wrote:
> Changes since v1:
> * Incorporate feedback from Barnabás Pőcze
>   * Use a WMI driver instead of a platform driver
>   * Let the kernel manage the driver lifecycle
>   * Fix errno/ACPI error confusion
>   * Fix resource cleanup
>   * Document reason for integer casting
> 
> Changes since v2:
> * Style cleanups
> * Test for usability during probing
> * DMI-based whitelist
> * CC hwmon maintainers
> 
> -- >8 --
> 
> Tested with a X570 I Aorus Pro Wifi.
> The mainboard contains an ITE IT8688E chip for management.
> This chips is also handled by drivers/hwmon/i87.c but as it is also used
> by the firmware itself it needs an ACPI driver.
> 
> Unfortunately not all sensor registers are handled by the firmware and even
> less are exposed via WMI.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

This looks good, one small nitpick:

I know this is a touchy subject for some, but we are trying to move away
from the whitelist/blacklist naming where possible and we don't want to
introduce any new cases, see:

https://github.com/torvalds/linux/blob/master/Documentation/process/coding-style.rst#4-naming

The driver currently uses this twice:
"Force loading on non-whitelisted platform"
"Forcing loading on non-whitelisted platform"

Interestingly enough you already avoided naming the dmi_system_id table
a whitelist (good).

I would like to see "non-whitelisted" replaced with "unknown" so that we end up with:

"Force loading on unknown platform"
"Forcing loading on unknown platform"

And while at it, I think for the second sentence this would be better English
(I'm not a native speaker myself):

"Forcing load on unknown platform"

If you are ok with these changes I can fix this up while merging, no need
to send a v4. Although if you prefer to send a v4 that is fine too.

Either way let me know.

Regards,

Hans

p.s.

For v4 or for a next patch, the way to add the changelog so that it does
not get picked up / automatically gets snipped by git am is to put it
below the Signed-off-by at the end of the commit message like this:

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes since v1:
* Incorporate feedback from Barnabás Pőcze
  * Use a WMI driver instead of a platform driver
  * Let the kernel manage the driver lifecycle
  * Fix errno/ACPI error confusion
  * Fix resource cleanup
  * Document reason for integer casting
 
Changes since v2:
* Style cleanups
* Test for usability during probing
* DMI-based whitelist
* CC hwmon maintainers







> ---
>  MAINTAINERS                         |   6 +
>  drivers/platform/x86/Kconfig        |  11 ++
>  drivers/platform/x86/Makefile       |   1 +
>  drivers/platform/x86/gigabyte-wmi.c | 194 ++++++++++++++++++++++++++++
>  4 files changed, 212 insertions(+)
>  create mode 100644 drivers/platform/x86/gigabyte-wmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92f85ca831d..9c10cfc00fe8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7543,6 +7543,12 @@ F:	Documentation/filesystems/gfs2*
>  F:	fs/gfs2/
>  F:	include/uapi/linux/gfs2_ondisk.h
>  
> +GIGABYTE WMI DRIVER
> +M:	Thomas Weißschuh <linux@weissschuh.net>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/gigabyte-wmi.c
> +
>  GNSS SUBSYSTEM
>  M:	Johan Hovold <johan@kernel.org>
>  S:	Maintained
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ad4e630e73e2..96622a2106f7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -123,6 +123,17 @@ config XIAOMI_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called xiaomi-wmi.
>  
> +config GIGABYTE_WMI
> +	tristate "Gigabyte WMI temperature driver"
> +	depends on ACPI_WMI
> +	depends on HWMON
> +	help
> +	  Say Y here if you want to support WMI-based temperature reporting on
> +	  Gigabyte mainboards.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called gigabyte-wmi.
> +
>  config ACERHDF
>  	tristate "Acer Aspire One temperature and fan driver"
>  	depends on ACPI && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 60d554073749..1621ebfd04fd 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
>  obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>  obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
> +obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  
>  # Acer
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> new file mode 100644
> index 000000000000..fb4e6d4c1823
> --- /dev/null
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright (C) 2021 Thomas Weißschuh <thomas@weissschuh.net>
> + */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#define GIGABYTE_WMI_GUID "DEADBEEF-2001-0000-00A0-C90629100000"
> +#define NUM_TEMPERATURE_SENSORS 6
> +
> +static bool force_load;
> +module_param(force_load, bool, 0);
> +MODULE_PARM_DESC(force_load, "Force loading on non-whitelisted platform");
> +
> +enum gigabyte_wmi_commandtype {
> +	GIGABYTE_WMI_BUILD_DATE_QUERY       =   0x1,
> +	GIGABYTE_WMI_MAINBOARD_TYPE_QUERY   =   0x2,
> +	GIGABYTE_WMI_FIRMWARE_VERSION_QUERY =   0x4,
> +	GIGABYTE_WMI_MAINBOARD_NAME_QUERY   =   0x5,
> +	GIGABYTE_WMI_TEMPERATURE_QUERY      = 0x125,
> +};
> +
> +struct gigabyte_wmi_args {
> +	u32 arg1;
> +};
> +
> +static int gigabyte_wmi_perform_query(struct wmi_device *wdev,
> +				      enum gigabyte_wmi_commandtype command,
> +				      struct gigabyte_wmi_args *args, struct acpi_buffer *out)
> +{
> +	const struct acpi_buffer in = {
> +		.length = sizeof(*args),
> +		.pointer = args,
> +	};
> +
> +	acpi_status ret = wmidev_evaluate_method(wdev, 0x0, command, &in, out);
> +
> +	if ACPI_FAILURE(ret)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int gigabyte_wmi_query_integer(struct wmi_device *wdev,
> +				      enum gigabyte_wmi_commandtype command,
> +				      struct gigabyte_wmi_args *args, u64 *res)
> +{
> +	union acpi_object *obj;
> +	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
> +	int ret;
> +
> +	ret = gigabyte_wmi_perform_query(wdev, command, args, &result);
> +	if (ret)
> +		return ret;
> +	obj = result.pointer;
> +	if (obj && obj->type == ACPI_TYPE_INTEGER)
> +		*res = obj->integer.value;
> +	else
> +		ret = -EIO;
> +	kfree(result.pointer);
> +	return ret;
> +}
> +
> +static int gigabyte_wmi_temperature(struct wmi_device *wdev, u8 sensor, long *res)
> +{
> +	struct gigabyte_wmi_args args = {
> +		.arg1 = sensor,
> +	};
> +	u64 temp;
> +	acpi_status ret;
> +
> +	ret = gigabyte_wmi_query_integer(wdev, GIGABYTE_WMI_TEMPERATURE_QUERY, &args, &temp);
> +	if (ret == 0) {
> +		if (temp == 0)
> +			return -ENODEV;
> +		*res = (s8)temp * 1000; // value is a signed 8-bit integer
> +	}
> +	return ret;
> +}
> +
> +static int gigabyte_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +				   u32 attr, int channel, long *val)
> +{
> +	struct wmi_device *wdev = dev_get_drvdata(dev);
> +
> +	return gigabyte_wmi_temperature(wdev, channel, val);
> +}
> +
> +static umode_t gigabyte_wmi_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> +					     u32 attr, int channel)
> +{
> +	return 0444;
> +}
> +
> +static const struct hwmon_channel_info *gigabyte_wmi_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT,
> +			   HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops gigabyte_wmi_hwmon_ops = {
> +	.read = gigabyte_wmi_hwmon_read,
> +	.is_visible = gigabyte_wmi_hwmon_is_visible,
> +};
> +
> +static const struct hwmon_chip_info gigabyte_wmi_hwmon_chip_info = {
> +	.ops = &gigabyte_wmi_hwmon_ops,
> +	.info = gigabyte_wmi_hwmon_info,
> +};
> +
> +static int gigabyte_wmi_validate_sensor_presence(struct wmi_device *wdev)
> +{
> +	int working_sensors = 0, i;
> +	long temp;
> +
> +	for (i = 0; i < NUM_TEMPERATURE_SENSORS; i++) {
> +		if (!gigabyte_wmi_temperature(wdev, i, &temp))
> +			working_sensors++;
> +	}
> +	return working_sensors ? 0 : -ENODEV;
> +}
> +
> +static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550 GAMING X V2"),
> +	}},
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "B550M DS3H"),
> +	}},
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "Z390 I AORUS PRO WIFI-CF"),
> +	}},
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 I AORUS PRO WIFI"),
> +	}},
> +	{ }
> +};
> +
> +static int gigabyte_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	if (!dmi_check_system(gigabyte_wmi_known_working_platforms)) {
> +		if (force_load)
> +			dev_warn(&wdev->dev, "Forcing loading on non-whitelisted platform");
> +		else
> +			return -ENODEV;
> +	}
> +
> +	ret = gigabyte_wmi_validate_sensor_presence(wdev);
> +	if (ret) {
> +		dev_info(&wdev->dev, "No temperature sensors usable");
> +		return ret;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev, "gigabyte_wmi", wdev,
> +							 &gigabyte_wmi_hwmon_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct wmi_device_id gigabyte_wmi_id_table[] = {
> +	{ GIGABYTE_WMI_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver gigabyte_wmi_driver = {
> +	.driver = {
> +		.name = "gigabyte-wmi",
> +	},
> +	.id_table = gigabyte_wmi_id_table,
> +	.probe = gigabyte_wmi_probe,
> +};
> +module_wmi_driver(gigabyte_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, gigabyte_wmi_id_table);
> +MODULE_AUTHOR("Thomas Weißschuh <thomas@weissschuh.net>");
> +MODULE_DESCRIPTION("Gigabyte WMI temperature Driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: 144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
> 

