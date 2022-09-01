Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4DFECAAD3
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 22:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbiIAWvK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 18:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbiIAWvJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 18:51:09 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9916D575;
        Thu,  1 Sep 2022 15:51:07 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 10486142D4;
        Thu,  1 Sep 2022 22:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662072666; bh=5BRCQf7FQvYHnHyCbkln+vZ8ea6LR/mtdHCTsyaO9Xg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=H8KcqPejhEu35YLAAJwTsaJq2tXfTO0sPUcjogBX19osSzGOKjF/rozR2Vd1DsuOz
         8wyDVND6mRjcuFELfiqeLd5ZZ7pHj8qL7Qv1tz/zytl611+5EC6zlryyOdQdWOzW0E
         lfIx+wP0gxmTVYACt4dJ7FSJ3V468oFfkFpTQQzfkW/LBXy8Bdu8mihU6u3ef7NYoT
         VQBi4TDaKIhY7DCjbVvbBOOrozZTHTFyONcFtVIqQ9V9X4Z0hDwj1n//Hp+8St/aQm
         zA6qa/LnPjbTVQUbrmY67wx5PelaBt4zEIWXsfVcYT0lSYP669BmaRMxN35sm9rxLN
         dp5LrnXkgseKw==
Message-ID: <5d903a0f-945b-d90c-00a9-722227bd8d41@vorpal.se>
Date:   Fri, 2 Sep 2022 00:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901215819.1608723-1-lkml@vorpal.se>
 <20220901215819.1608723-3-lkml@vorpal.se>
 <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
From:   Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2022-09-02 00:27, Guenter Roeck wrote:
> On 9/1/22 14:58, Arvid Norlander wrote:
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
>>   drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++++++++
>>   2 files changed, 73 insertions(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index f2f98e942cf2..4d0d2676939a 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -797,6 +797,7 @@ config ACPI_TOSHIBA
>>       depends on INPUT
>>       depends on SERIO_I8042 || SERIO_I8042 = n
>>       depends on ACPI_VIDEO || ACPI_VIDEO = n
>> +    depends on HWMON || HWMON = n
>>       depends on RFKILL || RFKILL = n
>>       depends on IIO
>>       select INPUT_SPARSEKMAP
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 02e3522f4eeb..a976dfb97a5e 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -46,6 +46,10 @@
>>   #include <linux/toshiba.h>
>>   #include <acpi/video.h>
>>   +#ifdef CONFIG_HWMON
>> +#include <linux/hwmon.h>
>> +#endif
> 
> ifdef not needed here.

I will fix this to v3. Being new to kernel development, the number of rules
and patterns is quite overwhelming.

> 
>> +
>>   MODULE_AUTHOR("John Belmonte");
>>   MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>>   MODULE_LICENSE("GPL");
>> @@ -171,6 +175,9 @@ struct toshiba_acpi_dev {
>>       struct miscdevice miscdev;
>>       struct rfkill *wwan_rfk;
>>       struct iio_dev *indio_dev;
>> +#ifdef CONFIG_HWMON
>> +    struct device *hwmon_device;
>> +#endif
>>         int force_fan;
>>       int last_key_event;
>> @@ -2941,6 +2948,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>>       return 0;
>>   }
>>   +/* HWMON support for fan */
>> +#ifdef CONFIG_HWMON
> 
> This should be #if IS_REACHABLE(CONFIG_HWMON)

Hm okay. I copied the existing pattern of "#ifdef CONFIG_PM_SLEEP" around
toshiba_acpi_suspend/toshiba_acpi_resume(). I assumed the same pattern
could be reused here. I guess not. Is the reason that this one is tristate?
(Unlike CONFIG_PM_SLEEP.)

<snip>

Best regards,
Arvid Norlander
