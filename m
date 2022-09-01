Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5480FECAAD2
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 22:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbiIAW32 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 18:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbiIAW3C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 18:29:02 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903895A2D2;
        Thu,  1 Sep 2022 15:27:04 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id c24so352984pgg.11;
        Thu, 01 Sep 2022 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=urWiAJvJTeU3odRH4F2HVAZeh9sdqu14J1UUhMV1XWA=;
        b=K18uVnJ0z7HvkYrHtMmB7bKXLLOvXseJrnmbMxkLfptllaNXdK1kaIHgtBotHEDYjL
         zyajOWk8XX+ABgiYmC9WH8Vz6D147ZcABpw5Ig9zoKyoms3i/jXM+FZc7gCa4aC9wDEb
         +zVaSUYhCKjkHVMxM1UV7LJk4iCSFpm+XOMeTt3pDlQYm/MUIJ2QMnRNXFEx2im7QONL
         NotXQdBA7MV7EOSXyged+palsy162Hh/yWMjgcPC+qr0wGE/LnSSJQpqYqjQ+mJQfQyR
         +pnWXAjmomunJgxmVk3z7u0vHVF6FUbtp5vX+pLdjOO9bOr6HgDqp0YtDkWNhWx306pe
         bRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=urWiAJvJTeU3odRH4F2HVAZeh9sdqu14J1UUhMV1XWA=;
        b=2QgdJ9azCUxETUrZi5/GCqH6cL3l3BEthZ/0paxC8r/WVAvEgYhrsaZ+Mc8wquiqhx
         kkpTLaQhou3AxbhrZQF+7h34hSaQS+wEtQxRgx+S6MpzMTDW9VMYYT1BLPTRySrfnuwC
         xGQ32wYuC0LdcEHpG+cJV531CFe/S4SPQu37IQLepFRcZQkKIFgRAvyeOvG7gL8Cs1iL
         /N74mA+H1KLr2ss/R3MV0tqNM78lP0fti1wxXbUSUxPC+fV1H+BWJbNFSDuPpd4sslis
         RyOPP1TQRtjOpXUAz/S7/NNzS0Sx4lyGdUTU9p6Pma1Nlf4sUmVmb4j4M+QpxgJfzHzP
         2SfA==
X-Gm-Message-State: ACgBeo3x17ovgHEXeeSI1cjm8rndRzrTIkeoqBbj9UoNUj0CalWAgL0e
        5J0wCE4+N3BYyoLp23xwM2oXc2W8K9uAEA==
X-Google-Smtp-Source: AA6agR6hieGYuvU+3IO1KtRYSSSoMesegNmN7YLHBVQcXOpr0+kBjREqZaZ5QshzO9ev4aDx7spIhQ==
X-Received: by 2002:a05:6a00:a8f:b0:530:3c05:4644 with SMTP id b15-20020a056a000a8f00b005303c054644mr33637514pfl.79.1662071223577;
        Thu, 01 Sep 2022 15:27:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t8-20020a6564c8000000b0042c29d1610dsm30240pgv.63.2022.09.01.15.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 15:27:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
Date:   Thu, 1 Sep 2022 15:27:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901215819.1608723-1-lkml@vorpal.se>
 <20220901215819.1608723-3-lkml@vorpal.se>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220901215819.1608723-3-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/1/22 14:58, Arvid Norlander wrote:
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
>   drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..4d0d2676939a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -797,6 +797,7 @@ config ACPI_TOSHIBA
>   	depends on INPUT
>   	depends on SERIO_I8042 || SERIO_I8042 = n
>   	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on HWMON || HWMON = n
>   	depends on RFKILL || RFKILL = n
>   	depends on IIO
>   	select INPUT_SPARSEKMAP
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 02e3522f4eeb..a976dfb97a5e 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -46,6 +46,10 @@
>   #include <linux/toshiba.h>
>   #include <acpi/video.h>
>   
> +#ifdef CONFIG_HWMON
> +#include <linux/hwmon.h>
> +#endif

ifdef not needed here.

> +
>   MODULE_AUTHOR("John Belmonte");
>   MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>   MODULE_LICENSE("GPL");
> @@ -171,6 +175,9 @@ struct toshiba_acpi_dev {
>   	struct miscdevice miscdev;
>   	struct rfkill *wwan_rfk;
>   	struct iio_dev *indio_dev;
> +#ifdef CONFIG_HWMON
> +	struct device *hwmon_device;
> +#endif
>   
>   	int force_fan;
>   	int last_key_event;
> @@ -2941,6 +2948,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>   	return 0;
>   }
>   
> +/* HWMON support for fan */
> +#ifdef CONFIG_HWMON

This should be #if IS_REACHABLE(CONFIG_HWMON)

> +umode_t toshiba_acpi_hwmon_is_visible(const void *drvdata,
> +				      enum hwmon_sensor_types type,
> +				      u32 attr, int channel)
> +{
> +	return 0444;
> +}
> +
> +int toshiba_acpi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long *val)
> +{
> +	/*
> +	 * There is only a single channel and single attribute (for the
> +	 * fan) at this point.
> +	 * This can be replaced with more advanced logic in the future,
> +	 * should the need arise.
> +	 */
> +	if (type == hwmon_fan && channel == 0 && attr == hwmon_fan_input) {
> +		u32 value;
> +		int ret;
> +
> +		ret = get_fan_rpm(toshiba_acpi, &value);
> +		if (ret)
> +			return ret;
> +
> +		*val = value;
> +		return 0;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_channel_info *toshiba_acpi_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops toshiba_acpi_hwmon_ops = {
> +	.is_visible = toshiba_acpi_hwmon_is_visible,
> +	.read = toshiba_acpi_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info toshiba_acpi_hwmon_chip_info = {
> +	.ops = &toshiba_acpi_hwmon_ops,
> +	.info = toshiba_acpi_hwmon_info,
> +};
> +#endif
> +
>   static void print_supported_features(struct toshiba_acpi_dev *dev)
>   {
>   	pr_info("Supported laptop features:");
> @@ -2995,6 +3050,11 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>   
>   	remove_toshiba_proc_entries(dev);
>   
> +#ifdef CONFIG_HWMON

#if IS_REACHABLE()

> +	if (dev->hwmon_device)
> +		hwmon_device_unregister(dev->hwmon_device);
> +#endif
> +
>   	if (dev->accelerometer_supported && dev->indio_dev) {
>   		iio_device_unregister(dev->indio_dev);
>   		iio_device_free(dev->indio_dev);
> @@ -3187,6 +3247,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>   	ret = get_fan_rpm(dev, &dummy);
>   	dev->fan_rpm_supported = !ret;
>   
> +#ifdef CONFIG_HWMON


... and again.

> +	if (dev->fan_rpm_supported) {
> +		dev->hwmon_device = hwmon_device_register_with_info(
> +			&dev->acpi_dev->dev, "toshiba_acpi_sensors", NULL,
> +			&toshiba_acpi_hwmon_chip_info, NULL);
> +		if (IS_ERR(dev->hwmon_device)) {
> +			dev->hwmon_device = NULL;
> +			pr_warn("unable to register hwmon device, skipping\n");
> +		}
> +	}
> +#endif
> +
>   	toshiba_wwan_available(dev);
>   	if (dev->wwan_supported)
>   		toshiba_acpi_setup_wwan_rfkill(dev);

