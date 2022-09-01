Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB85ECAAD5
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 18:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbiIASL1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 14:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbiIASLE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 14:11:04 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63BC786ED;
        Thu,  1 Sep 2022 11:10:45 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 2D35C142D4;
        Thu,  1 Sep 2022 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662055843; bh=g9vNwg893t2qP2cvJ34PAs68DLtBraMZMZ1eKQJITow=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LRbCSxGNultzKNwouxAcjJaWU3cO/S69gmKkf5a7f8ER06V4I8Z/pySgXHdbwF4Kp
         d7AEaIBythzMNSWGVgbYWqnUYSjdgrxrdM1rw5I0Rm6kMXXcaqsFKoc2oVjuFTqpO4
         k5nHza4EcLjEK9VTu7ChXa3BzkgYwP9DOpfSSzEhY5uN/numkjeWTd8MV4A4C37xdF
         VjNZQ4ES4nPr5jC2sgGWdXireKJkF24DJw+ijg3ewVRlRxtyDynBqjs/rlDUUsnfM1
         Cv9MJ5SNuEe+CsUukpNcvvXQQKt+rH3aJvZJw+j929izaH1n48/qB6YI/IszR74JR4
         ogZfFvucgaGVw==
Message-ID: <2d059eb6-3e3d-4490-3988-5f7e493c69a9@vorpal.se>
Date:   Thu, 1 Sep 2022 20:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] [RFC] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901144941.1426407-1-lkml@vorpal.se>
 <20220901144941.1426407-3-lkml@vorpal.se>
 <c5f0f1c3-4cec-1f68-b83d-5277e18c050f@roeck-us.net>
From:   Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <c5f0f1c3-4cec-1f68-b83d-5277e18c050f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2022-09-01 17:28, Guenter Roeck wrote:
> On 9/1/22 07:49, Arvid Norlander wrote:
>> This expands on the previous commit, exporting the fan RPM via hwmon.
>>
>> This will look something like the following when using the "sensors"
>> command from lm_sensors:
>>
>> toshiba_acpi_sensors-acpi-0
>> Adapter: ACPI interface
>> fan1:           0 RPM
>>
>> Signed-off-by: Arvid Norlander <lkml@vorpal.se>
>> ---
>>   drivers/platform/x86/Kconfig        |  1 +
>>   drivers/platform/x86/toshiba_acpi.c | 49 +++++++++++++++++++++++++++++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index f2f98e942cf2..9a98974ab8bf 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -799,6 +799,7 @@ config ACPI_TOSHIBA
>>       depends on ACPI_VIDEO || ACPI_VIDEO = n
>>       depends on RFKILL || RFKILL = n
>>       depends on IIO
>> +    select HWMON
> 
> This is wrong. I know other drivers in this directory do it, but it is
> still wrong. It should be something like
> 
>     depends on HWMON || HWMON=n
> 
> and the code should deal with the conditionals.

Thanks, I will do that. Perhaps ping the thinkpad_acpi maintainers about
this as well, that is where I copied it from.

> 
>>       select INPUT_SPARSEKMAP
>>       help
>>         This driver adds support for access to certain system settings
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 02e3522f4eeb..2b71dac34cf0 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -39,6 +39,7 @@
>>   #include <linux/i8042.h>
>>   #include <linux/acpi.h>
>>   #include <linux/dmi.h>
>> +#include <linux/hwmon.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/miscdevice.h>
>>   #include <linux/rfkill.h>
>> @@ -171,6 +172,7 @@ struct toshiba_acpi_dev {
>>       struct miscdevice miscdev;
>>       struct rfkill *wwan_rfk;
>>       struct iio_dev *indio_dev;
>> +    struct device *hwmon_device;
>>         int force_fan;
>>       int last_key_event;
>> @@ -2941,6 +2943,38 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>>       return 0;
>>   }
>>   +
>> +/* HWMON support for fan */
>> +static ssize_t fan_fan1_input_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    u32 value;
>> +    int ret;
>> +
>> +    ret = get_fan_rpm(toshiba_acpi, &value);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return sysfs_emit(buf, "%u\n", value);
>> +}
>> +
>> +static DEVICE_ATTR(fan1_input, S_IRUGO, fan_fan1_input_show, NULL);
>> +
>> +static struct attribute *fan_attributes[] = {
>> +    &dev_attr_fan1_input.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group fan_attr_group = {
>> +    .attrs = fan_attributes,
>> +};
>> +
>> +static const struct attribute_group *toshiba_acpi_hwmon_groups[] = {
>> +    &fan_attr_group,
>> +    NULL,
>> +};
>> +
>>   static void print_supported_features(struct toshiba_acpi_dev *dev)
>>   {
>>       pr_info("Supported laptop features:");
>> @@ -2995,6 +3029,9 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>>         remove_toshiba_proc_entries(dev);
>>   +    if (dev->hwmon_device)
>> +        hwmon_device_unregister(dev->hwmon_device);
>> +
>>       if (dev->accelerometer_supported && dev->indio_dev) {
>>           iio_device_unregister(dev->indio_dev);
>>           iio_device_free(dev->indio_dev);
>> @@ -3187,6 +3224,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>>       ret = get_fan_rpm(dev, &dummy);
>>       dev->fan_rpm_supported = !ret;
>>   +    if (dev->fan_rpm_supported) {
>> +        dev->hwmon_device = hwmon_device_register_with_groups(
> 
> New drivers should register using [devm_]hwmon_device_register_with_info().

Again, copied thikpad_acpi, but I'll look into that function for version 2.

> 
>> +            &dev->acpi_dev->dev, "toshiba_acpi_sensors", NULL,
>> +            toshiba_acpi_hwmon_groups);
>> +        if (IS_ERR(dev->hwmon_device)) {
>> +            ret = PTR_ERR(dev->hwmon_device);
>> +            dev->hwmon_device = NULL;
>> +            pr_err("unable to register hwmon device\n");
>> +            goto error;
> 
> The driver works just fine without hwmon, and should not fail to probe
> if hwmon registration fails. It did not fail before this patch was applied
> either, and hwmon is not essential functionality for this driver.

Good point. Again, this was based on thinkpad_acpi which it appears then
has some legacy behaviour.

> 
> Guenter
> 
>> +        }
>> +    }
>> +
>>       toshiba_wwan_available(dev);
>>       if (dev->wwan_supported)
>>           toshiba_acpi_setup_wwan_rfkill(dev);
> 

Best regards,
Arvid Norlander
