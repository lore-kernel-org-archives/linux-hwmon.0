Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E29ECAAD1
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 15:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbiIAP2m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 11:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbiIAP2a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 11:28:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D0673928;
        Thu,  1 Sep 2022 08:28:26 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j9-20020a17090a3e0900b001fd9568b117so2970380pjc.3;
        Thu, 01 Sep 2022 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=wEerm5cbSJvTyiBOsASMxSPS6q8GA3C8ZDCfvaCuHPs=;
        b=g95jufkFg2xQVNeZJrEE/E24jwvwaduqGGFnYBi3XNqjAM1SI/zdiTMhvsDaDR5H3x
         C9D6EEFdNd41ZOwKYaagnXo4bxogP5FjzCAlsRT3tywKIt9yorckWVpxRa5tnyjEBfh1
         ae1Y5GZvCzz11KiRKjTzI+Q1YS9UeWKphzK9GDNpdEehpgL7/Eflaavrpp/UG6VZCUKn
         yemqWDTsfi7ts9EOFfkcDauHpF4QIpuR4HoYvD6EJTOSk1zGRC1NCBZ8r1Xp7x5dF36h
         a+/nX62LOKfdwurK6XBhGuj4OVTDcUxgN4z1xa6WxJ1mK5mnmFcJOxf0yOfDddXyYbnX
         hs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=wEerm5cbSJvTyiBOsASMxSPS6q8GA3C8ZDCfvaCuHPs=;
        b=uON7mQgLGOqfdXjHa+vcNyJG1rB8bDFqjTkENHJMyBZKUcGyYcZ2ZF1rHGzDjwPlmY
         91Eeg3ikjbuhUreVe1QtDCcZKS/yz5JILqRgbJfWqMRTu1aGhILjnfHoEY+F6svMra7Y
         1EfBdDnk1pkygt/OJZRT5d7zmcLMlGDoXG34Holdnda6D9S5MauGqJ3vKoemSktS+iKF
         2ulmWZSm1HLJ34hHPrsHWMKiRFEAP/QPXF4swk3B6Dv8dVLFovpr5R4J8IDKddnzq0mJ
         eTJnGVFmI6Lb/DyRugfDcjrvMQsG9h54CZmo8sBSMD8ilI31rgLlPB4ZzK4ML1f6Yyrn
         1a4Q==
X-Gm-Message-State: ACgBeo1IBSCQBryVGWRTVkVU96ikKos+4IGzF2WyDrluAv3VTYGtpxrL
        XgAsFO+/9pq6sFTjlNTSd+8lpo4JLdmnbQ==
X-Google-Smtp-Source: AA6agR6x+PwArx26Qef/X/aA+gpcXsed/47WfSQNPZu46hmXulMsd8faOMmju9hcF9RG56Sjs2IQZw==
X-Received: by 2002:a17:902:c401:b0:16f:b59:85a7 with SMTP id k1-20020a170902c40100b0016f0b5985a7mr30910891plk.115.1662046106097;
        Thu, 01 Sep 2022 08:28:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14-20020a62190e000000b005366696b735sm13433486pfz.77.2022.09.01.08.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:28:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c5f0f1c3-4cec-1f68-b83d-5277e18c050f@roeck-us.net>
Date:   Thu, 1 Sep 2022 08:28:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] [RFC] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901144941.1426407-1-lkml@vorpal.se>
 <20220901144941.1426407-3-lkml@vorpal.se>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220901144941.1426407-3-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/1/22 07:49, Arvid Norlander wrote:
> This expands on the previous commit, exporting the fan RPM via hwmon.
> 
> This will look something like the following when using the "sensors"
> command from lm_sensors:
> 
> toshiba_acpi_sensors-acpi-0
> Adapter: ACPI interface
> fan1:           0 RPM
> 
> Signed-off-by: Arvid Norlander <lkml@vorpal.se>
> ---
>   drivers/platform/x86/Kconfig        |  1 +
>   drivers/platform/x86/toshiba_acpi.c | 49 +++++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..9a98974ab8bf 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -799,6 +799,7 @@ config ACPI_TOSHIBA
>   	depends on ACPI_VIDEO || ACPI_VIDEO = n
>   	depends on RFKILL || RFKILL = n
>   	depends on IIO
> +	select HWMON

This is wrong. I know other drivers in this directory do it, but it is
still wrong. It should be something like

	depends on HWMON || HWMON=n

and the code should deal with the conditionals.

>   	select INPUT_SPARSEKMAP
>   	help
>   	  This driver adds support for access to certain system settings
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 02e3522f4eeb..2b71dac34cf0 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -39,6 +39,7 @@
>   #include <linux/i8042.h>
>   #include <linux/acpi.h>
>   #include <linux/dmi.h>
> +#include <linux/hwmon.h>
>   #include <linux/uaccess.h>
>   #include <linux/miscdevice.h>
>   #include <linux/rfkill.h>
> @@ -171,6 +172,7 @@ struct toshiba_acpi_dev {
>   	struct miscdevice miscdev;
>   	struct rfkill *wwan_rfk;
>   	struct iio_dev *indio_dev;
> +	struct device *hwmon_device;
>   
>   	int force_fan;
>   	int last_key_event;
> @@ -2941,6 +2943,38 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>   	return 0;
>   }
>   
> +
> +/* HWMON support for fan */
> +static ssize_t fan_fan1_input_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	u32 value;
> +	int ret;
> +
> +	ret = get_fan_rpm(toshiba_acpi, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static DEVICE_ATTR(fan1_input, S_IRUGO, fan_fan1_input_show, NULL);
> +
> +static struct attribute *fan_attributes[] = {
> +	&dev_attr_fan1_input.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group fan_attr_group = {
> +	.attrs = fan_attributes,
> +};
> +
> +static const struct attribute_group *toshiba_acpi_hwmon_groups[] = {
> +	&fan_attr_group,
> +	NULL,
> +};
> +
>   static void print_supported_features(struct toshiba_acpi_dev *dev)
>   {
>   	pr_info("Supported laptop features:");
> @@ -2995,6 +3029,9 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>   
>   	remove_toshiba_proc_entries(dev);
>   
> +	if (dev->hwmon_device)
> +		hwmon_device_unregister(dev->hwmon_device);
> +
>   	if (dev->accelerometer_supported && dev->indio_dev) {
>   		iio_device_unregister(dev->indio_dev);
>   		iio_device_free(dev->indio_dev);
> @@ -3187,6 +3224,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>   	ret = get_fan_rpm(dev, &dummy);
>   	dev->fan_rpm_supported = !ret;
>   
> +	if (dev->fan_rpm_supported) {
> +		dev->hwmon_device = hwmon_device_register_with_groups(

New drivers should register using [devm_]hwmon_device_register_with_info().

> +			&dev->acpi_dev->dev, "toshiba_acpi_sensors", NULL,
> +			toshiba_acpi_hwmon_groups);
> +		if (IS_ERR(dev->hwmon_device)) {
> +			ret = PTR_ERR(dev->hwmon_device);
> +			dev->hwmon_device = NULL;
> +			pr_err("unable to register hwmon device\n");
> +			goto error;

The driver works just fine without hwmon, and should not fail to probe
if hwmon registration fails. It did not fail before this patch was applied
either, and hwmon is not essential functionality for this driver.

Guenter

> +		}
> +	}
> +
>   	toshiba_wwan_available(dev);
>   	if (dev->wwan_supported)
>   		toshiba_acpi_setup_wwan_rfkill(dev);

