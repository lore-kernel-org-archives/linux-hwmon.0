Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CF9C6FA83
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Sep 2022 18:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIBSeY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Sep 2022 14:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiIBSeW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Sep 2022 14:34:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A38D543D1;
        Fri,  2 Sep 2022 11:24:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id i5-20020a17090a2a0500b001fd8708ffdfso6282745pjd.2;
        Fri, 02 Sep 2022 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=uyTm05R0KmCGyiCKTQnO3b4VmBCfti/ZXYusW2p4M5U=;
        b=oe/wzWmjqXTLNFgU7jvBNXdzXv8NSotkxX9V8ZHVmlM0zIJ95tqWW3N8oo+hIoImUF
         EINi7wIzFUpQuFw2BdVmdF3OpblbIyiFm4eZkLT/rjdvgHlRAeQ9DKK0CtubdyY02gg5
         dJOM8HG4TxsZfu24WKd0EslJ3tAkS4W4mx9hJL56Rc5F55FoJVT1CHpyaANJkdCSOabM
         IGNtTkLbYVZOXRFlew7NPzK+W7tggy8fS25LW6I6x9KV128fjfZPCcBQO2Zb//H4CTlb
         Sfnb5FkOnDR6o//VkpfmAr10mpaHDivH2F0Qy+wvYpw7AgxA9oVZ+JZTYD71GK5MG+k/
         rHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uyTm05R0KmCGyiCKTQnO3b4VmBCfti/ZXYusW2p4M5U=;
        b=A+T+5xknIrMtCCcc2naTnwtTSdJ+v8Bf8FeTcvHgc/CbL3IAZu87BvPF/05nXqjckn
         XvIJ/8tNEaXsQO2+yIHC0pj4KbPH/+mJ/8t1Y5unmz94G5NcBR2YWf12DXYnanvuXwNj
         6zPLddTTM3Qvhoqzg1kqdNDA5gQ5bShlGfbBix8oOt19QfCuPGiuLkR0IaTqGVlDc1q6
         Q4CFVP7xqSnlA9IIr6rpr2skGMjOAtc05HuwSgHfVO1QKYwDwvxh2FH52LAYgSUxv8b2
         T09Ng1myKzTPnT+QbvDoYjJSYdMno9Vz1krwi9c2YAQp2KP9xYj5wx1/0YSRGriIpWRU
         CiFw==
X-Gm-Message-State: ACgBeo1Fb7G8KMB1N50TlKbMTbhKNdxnGUN0lSyFIR6X/e5MHEJIhZB7
        lOa1FEayXYJwhl3gKbZTXWM=
X-Google-Smtp-Source: AA6agR4dciytV/OkSTT0a+Bc07lhm8+/ZKkP13FREZYPdk99jjAh7lSK8WCi0mkMezH6Er1hsS2O7A==
X-Received: by 2002:a17:90b:3ec9:b0:1f5:62d5:4157 with SMTP id rm9-20020a17090b3ec900b001f562d54157mr6011463pjb.183.1662143095447;
        Fri, 02 Sep 2022 11:24:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902a38a00b0017300ec80b0sm1942629pla.308.2022.09.02.11.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:24:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Sep 2022 11:24:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arvid Norlander <lkml@vorpal.se>
Cc:     platform-driver-x86@vger.kernel.org,
        Azael Avalos <coproscefalo@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Message-ID: <20220902182452.GA26331@roeck-us.net>
References: <20220902174018.1720029-1-lkml@vorpal.se>
 <20220902174018.1720029-3-lkml@vorpal.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902174018.1720029-3-lkml@vorpal.se>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 02, 2022 at 07:40:18PM +0200, Arvid Norlander wrote:
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
>  drivers/platform/x86/Kconfig        |  1 +
>  drivers/platform/x86/toshiba_acpi.c | 70 +++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..4d0d2676939a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -797,6 +797,7 @@ config ACPI_TOSHIBA
>  	depends on INPUT
>  	depends on SERIO_I8042 || SERIO_I8042 = n
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on HWMON || HWMON = n
>  	depends on RFKILL || RFKILL = n
>  	depends on IIO
>  	select INPUT_SPARSEKMAP
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 02e3522f4eeb..0949b1bcab83 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -42,10 +42,12 @@
>  #include <linux/uaccess.h>
>  #include <linux/miscdevice.h>
>  #include <linux/rfkill.h>
> +#include <linux/hwmon.h>
>  #include <linux/iio/iio.h>
>  #include <linux/toshiba.h>
>  #include <acpi/video.h>
>  
> +

Unnecessary double empty line

Otherwise 

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

>  MODULE_AUTHOR("John Belmonte");
>  MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>  MODULE_LICENSE("GPL");
> @@ -171,6 +173,9 @@ struct toshiba_acpi_dev {
>  	struct miscdevice miscdev;
>  	struct rfkill *wwan_rfk;
>  	struct iio_dev *indio_dev;
> +#if IS_ENABLED(CONFIG_HWMON)
> +	struct device *hwmon_device;
> +#endif
>  
>  	int force_fan;
>  	int last_key_event;
> @@ -2941,6 +2946,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>  	return 0;
>  }
>  
> +/* HWMON support for fan */
> +#if IS_ENABLED(CONFIG_HWMON)
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
>  static void print_supported_features(struct toshiba_acpi_dev *dev)
>  {
>  	pr_info("Supported laptop features:");
> @@ -2995,6 +3048,11 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>  
>  	remove_toshiba_proc_entries(dev);
>  
> +#if IS_ENABLED(CONFIG_HWMON)
> +	if (dev->hwmon_device)
> +		hwmon_device_unregister(dev->hwmon_device);
> +#endif
> +
>  	if (dev->accelerometer_supported && dev->indio_dev) {
>  		iio_device_unregister(dev->indio_dev);
>  		iio_device_free(dev->indio_dev);
> @@ -3187,6 +3245,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  	ret = get_fan_rpm(dev, &dummy);
>  	dev->fan_rpm_supported = !ret;
>  
> +#if IS_ENABLED(CONFIG_HWMON)
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
>  	toshiba_wwan_available(dev);
>  	if (dev->wwan_supported)
>  		toshiba_acpi_setup_wwan_rfkill(dev);
> -- 
> 2.37.3
> 
