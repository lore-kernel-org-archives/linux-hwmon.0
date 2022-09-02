Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97027C38145
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Sep 2022 03:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbiIBDFi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 23:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiIBDFg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 23:05:36 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A361DA61;
        Thu,  1 Sep 2022 20:05:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso4230385pjh.5;
        Thu, 01 Sep 2022 20:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=QEWNfUge4lsDD/PbdEoUksefxJBZM42MAJe3WnQ0Wb8=;
        b=gbEnvS057elDT9qGIB1Me26xSY8Dur1hLnRbWrshk54kCV1q9nfOBG/3dMGM7JMa0O
         M8YTfXMpFYKs7htVpeflC+BOgafiH4vpPVbdYwmjSZJ26ujzGPcsfW9kMElxZaU3Kf4O
         pMc7cErOgXaTzYKVE1EjGAbWWiC0uL8qPKXoGLPkHmOb/kJeMh/prM6JtFw5UBU5JjMO
         i1sGsLs9J+jMAleNq9r5rA96wnnRAv3tdt8rCfYdoABOx9ZHqxLKiJhA1I5fmS3iBUlc
         AxaesCrTJuhwpFKE8H9ZaxgpQne50LZb2B5LTIubtRk8d0S0cr0gjKXqKouI3t+mVhWV
         U9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=QEWNfUge4lsDD/PbdEoUksefxJBZM42MAJe3WnQ0Wb8=;
        b=tklteLstA0Xr7OYMPa4R79vXJqA5iKrQjfTg8ll/crSz+p9E6Ixc3In0wQSrAC+Y6G
         twBlv8pSdZ2sJtQkRKiaOUDAnu+2198KG+m46oUE2xXVCbJOobA2xETJJF1RR0hUgdTh
         5+1NFSlnguUWn0XAh8JdyTdnUQz1VX3IGhscQHjT2Mg3dlGiMibDlwL7K3pnpRv3++9z
         g0dd3I/pimpSSaDS1WAXQa0W4CKgAkYXh1R4AL9r0rPfBfXQus079skA9kJ6Wn+Nii3p
         25nDrb+IptBZOTh6lPRxvQWL1cB39oD0kkdTBg+QGmIIyA59ruQfsmyV9GVlMUo8Ss81
         QKRQ==
X-Gm-Message-State: ACgBeo0Rx9ue+5p/qvlWG27VLsea7QeJ/0IsILaGiz/nTZ+InIHJey8l
        XMS0I+PXE4G9zaTnV70XBUJnT3gydaf2Pw==
X-Google-Smtp-Source: AA6agR4M/jEAChLOnw9zcmn+aTmrMLQr/7PkuM+A//FwJSRmzN89pbEa0FFXKj/RGAHhea6d59L5RQ==
X-Received: by 2002:a17:902:c102:b0:175:15e5:989e with SMTP id 2-20020a170902c10200b0017515e5989emr15978713pli.162.1662087935149;
        Thu, 01 Sep 2022 20:05:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 2-20020a621502000000b00537f9e32b00sm378754pfv.37.2022.09.01.20.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 20:05:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <078e69af-ca56-b43d-bf60-8c49a06ec7ac@roeck-us.net>
Date:   Thu, 1 Sep 2022 20:05:32 -0700
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
 <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
 <5d903a0f-945b-d90c-00a9-722227bd8d41@vorpal.se>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <5d903a0f-945b-d90c-00a9-722227bd8d41@vorpal.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/1/22 15:51, Arvid Norlander wrote:
> Hi,
> 
> On 2022-09-02 00:27, Guenter Roeck wrote:
>> On 9/1/22 14:58, Arvid Norlander wrote:
>>> This expands on the previous commit, exporting the fan RPM via hwmon.
>>>
>>> This will look something like the following when using the "sensors"
>>> command from lm_sensors:
>>>
>>> toshiba_acpi_sensors-acpi-0
>>> Adapter: ACPI interface
>>> fan1:           0 RPM
>>>
>>> Signed-off-by: Arvid Norlander <lkml@vorpal.se>
>>> ---
>>>    drivers/platform/x86/Kconfig        |  1 +
>>>    drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++++++++
>>>    2 files changed, 73 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index f2f98e942cf2..4d0d2676939a 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -797,6 +797,7 @@ config ACPI_TOSHIBA
>>>        depends on INPUT
>>>        depends on SERIO_I8042 || SERIO_I8042 = n
>>>        depends on ACPI_VIDEO || ACPI_VIDEO = n
>>> +    depends on HWMON || HWMON = n
>>>        depends on RFKILL || RFKILL = n
>>>        depends on IIO
>>>        select INPUT_SPARSEKMAP
>>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>>> index 02e3522f4eeb..a976dfb97a5e 100644
>>> --- a/drivers/platform/x86/toshiba_acpi.c
>>> +++ b/drivers/platform/x86/toshiba_acpi.c
>>> @@ -46,6 +46,10 @@
>>>    #include <linux/toshiba.h>
>>>    #include <acpi/video.h>
>>>    +#ifdef CONFIG_HWMON
>>> +#include <linux/hwmon.h>
>>> +#endif
>>
>> ifdef not needed here.
> 
> I will fix this to v3. Being new to kernel development, the number of rules
> and patterns is quite overwhelming.
> 
>>
>>> +
>>>    MODULE_AUTHOR("John Belmonte");
>>>    MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>>>    MODULE_LICENSE("GPL");
>>> @@ -171,6 +175,9 @@ struct toshiba_acpi_dev {
>>>        struct miscdevice miscdev;
>>>        struct rfkill *wwan_rfk;
>>>        struct iio_dev *indio_dev;
>>> +#ifdef CONFIG_HWMON
>>> +    struct device *hwmon_device;
>>> +#endif
>>>          int force_fan;
>>>        int last_key_event;
>>> @@ -2941,6 +2948,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>>>        return 0;
>>>    }
>>>    +/* HWMON support for fan */
>>> +#ifdef CONFIG_HWMON
>>
>> This should be #if IS_REACHABLE(CONFIG_HWMON)
> 
> Hm okay. I copied the existing pattern of "#ifdef CONFIG_PM_SLEEP" around
> toshiba_acpi_suspend/toshiba_acpi_resume(). I assumed the same pattern
> could be reused here. I guess not. Is the reason that this one is tristate?
> (Unlike CONFIG_PM_SLEEP.)
> 
Exactly.

Thanks,
Guenter
