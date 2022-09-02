Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC85ECAAD5
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Sep 2022 14:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbiIBO0d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Sep 2022 10:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237121AbiIBO0R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Sep 2022 10:26:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703A75F120;
        Fri,  2 Sep 2022 06:53:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o4so2096023pjp.4;
        Fri, 02 Sep 2022 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=5RLBa13ipEWAkpiaQtXZ6Miu9XQu43K14Fb1Ip6In04=;
        b=pwyCU8O4/acAUKXQY58Ih4qrZpW+ruGqollsRjkVqVbbki6npX0Hj4Fivb9hqesjBu
         RPfVWl/dS3xRputH6HAiycosYH+CK+V4VsX3+5JwEllkwWwn5zF25Vh9EM52xaoKac6Y
         yQrfxQqXQwAlsa+QULESlsOnPU0Vzj5Ln5eneb+zX+J1B9fd68JYG5Ma6J5yQkDVQzLu
         9YB0JaKTtLAiRjhNpVGb1XxRyavOhVp8qm3VkyrQJMZFzYVM3pMsQVTvxtoq2tLRJ2cU
         +jyK17z/DHNGnGRStH5weRACodYARykR43ppwEbNs+TxhWoIE/HSNkGOwoalqOGR4V1k
         DZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=5RLBa13ipEWAkpiaQtXZ6Miu9XQu43K14Fb1Ip6In04=;
        b=lwD5BhNyNhlyf3sxoBYbT29jaSGgKRTYgP5O1fLOxadNxyQ9d3GAduB2mJ8ZrwyPf2
         ndrL5grU+G4BcoNyIRmWIvkiJ2RhAaeamtWILlbVDN3FckQg0MNN0QJKr+8lprzgDR+Y
         qeDTyorw6fR7sqVLSrrPUH3Yt35FxF5xopUcZBGgtP+mLDmNuSTG8cGaqaJ6nOCxWrBq
         MfLdGs5APzXhRmJy4M5+ArtUC3tQakHpbNDDPlUdKcNi+3InPLFtYNGfR0KRZCjEZiva
         T+K8dfaWWxSDrFlUZIgQErtSR9IGsuzvu1z8JDP/PrKAxRTl94snJgYdVlQ1s2grvK9T
         SkBw==
X-Gm-Message-State: ACgBeo3PRziD8wmIQ22uug4zMYmgf+0vWv7oVSv5Qq2q2VyQTSXkG9WO
        qQS7g2TzZb+wmUK1kLfKOBk=
X-Google-Smtp-Source: AA6agR4BRMVL3/Y1sJ5NnmmVdAulRFNJV3hU3ss/jlsea4zTWR965R6XYNuG6X53l1Wqdx+rIapQ1g==
X-Received: by 2002:a17:90b:3511:b0:1f7:3c52:4b98 with SMTP id ls17-20020a17090b351100b001f73c524b98mr4855463pjb.17.1662126811439;
        Fri, 02 Sep 2022 06:53:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e18-20020a656892000000b0041d6cda2d60sm1443828pgt.66.2022.09.02.06.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 06:53:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8f74ce03-c5b6-f81f-bac5-42cde4e318d8@roeck-us.net>
Date:   Fri, 2 Sep 2022 06:53:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901215819.1608723-1-lkml@vorpal.se>
 <20220901215819.1608723-3-lkml@vorpal.se>
 <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
 <891c2cd5-cacc-f19d-0334-0186d37b9bd2@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <891c2cd5-cacc-f19d-0334-0186d37b9bd2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/2/22 01:29, Hans de Goede wrote:
> Hi Guenter, Arvid,
> 
> On 9/2/22 00:27, Guenter Roeck wrote:
>> On 9/1/22 14:58, Arvid Norlander wrote:
>>> This expands on the previous commit, exporting the fan RPM via hwmon.
>>>
>>> This will look something like the following when using the "sensors"
>>> command from lm_sensors:
>>>
>>> toshiba_acpi_sensors-acpi-0
>>> Adapter: ACPI interface
>>> fan1:           0 RPM
>>>
>>> Signed-off-by: Arvid Norlander <lkml@vorpal.se>
>>> ---
>>>    drivers/platform/x86/Kconfig        |  1 +
>>>    drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++++++++
>>>    2 files changed, 73 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index f2f98e942cf2..4d0d2676939a 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -797,6 +797,7 @@ config ACPI_TOSHIBA
>>>        depends on INPUT
>>>        depends on SERIO_I8042 || SERIO_I8042 = n
>>>        depends on ACPI_VIDEO || ACPI_VIDEO = n
>>> +    depends on HWMON || HWMON = n
>>>        depends on RFKILL || RFKILL = n
>>>        depends on IIO
>>>        select INPUT_SPARSEKMAP
>>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>>> index 02e3522f4eeb..a976dfb97a5e 100644
>>> --- a/drivers/platform/x86/toshiba_acpi.c
>>> +++ b/drivers/platform/x86/toshiba_acpi.c
>>> @@ -46,6 +46,10 @@
>>>    #include <linux/toshiba.h>
>>>    #include <acpi/video.h>
>>>    +#ifdef CONFIG_HWMON
>>> +#include <linux/hwmon.h>
>>> +#endif
>>
>> ifdef not needed here.
> 
> Ack.
> 
>>
>>> +
>>>    MODULE_AUTHOR("John Belmonte");
>>>    MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>>>    MODULE_LICENSE("GPL");
>>> @@ -171,6 +175,9 @@ struct toshiba_acpi_dev {
>>>        struct miscdevice miscdev;
>>>        struct rfkill *wwan_rfk;
>>>        struct iio_dev *indio_dev;
>>> +#ifdef CONFIG_HWMON
>>> +    struct device *hwmon_device;
>>> +#endif
>>>          int force_fan;
>>>        int last_key_event;
>>> @@ -2941,6 +2948,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>>>        return 0;
>>>    }
>>>    +/* HWMON support for fan */
>>> +#ifdef CONFIG_HWMON
>>
>> This should be #if IS_REACHABLE(CONFIG_HWMON)
> 
> Actually that should be IS_ENABLED since you suggested that
> Arvid should use:
> 
> 	depends on HWMON || HWMON = n
> 
Yes, you are absolutely correct.

Thanks,
Guenter
