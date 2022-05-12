Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A68C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 01:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiELB6i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 21:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233967AbiELB6h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 21:58:37 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F646393D7
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 18:58:36 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id e189so4803399oia.8
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 18:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=LyfiegZodmpseTjdBN44qFldUpzUgmoknj3mxZZaPPY=;
        b=erXJn2m20nsj3E4zP/IiZ5fY/9eg9dfh6d9BVeF+BZXDt76mVpd/v/jx9kgGeDHgP6
         S2CY47lSiYHe4DZVRUE57qpyfVNyHODEjdayrh40BuMehEYAjRFt82m9coulUJ2Tod9B
         C1Gm20eXC+ZSDuJLTUcTf6rn1x33BEUBVOvXlSHX/vwdKJRAoUe3PwNJONCGUwbmnzHA
         J1iS60AovAdSAAj3EjEoOINuOPdosflpL6qy/Q7Kur9NzA/rqN1icCREKYZmxeuK32pr
         cZvRJcj5dGA3Yrelb8P+8WfJHZ/jvnKgUaM5TLyBiPLodGUUqfQSuwABgLk0vm20b3B/
         /dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=LyfiegZodmpseTjdBN44qFldUpzUgmoknj3mxZZaPPY=;
        b=F0TEOZiNmKu5vamk2vUwph/6IF6nqOyl3fc9mC/+ClIgiYAEsDkS7gjdRT9pGL69+j
         L1xMc/lM/ozJMs1VRN3uIxgnhhl61GCQGI91DRJQX1CE3454CXXApGM6UJP7JEuLCZSh
         mnKp40F95o1HZYkHunq/MRlNIrZQZzg7EBcrlASrNPCAfaJ+LeOjoqZ2ppGYViP1V0BJ
         SwyHJYTkEkXdv0yeNIyaHE4AZXOEi3w2UQt51MpWsLeLbVi3+bQ0Edx6s+7Z/wU56EsD
         W+GBIS5LvUOTwXpeCRj3+Ymx/0also12fA09vzIK12Xo+mIb/OzQWsIs5uP9CejfQykt
         jOuw==
X-Gm-Message-State: AOAM530JzKULQtDpf14spwzsbKsHZNvB5p7FxX+AS7he+1CK931KkI5i
        5dh5zNcd3MzhLahlXdW8bpo=
X-Google-Smtp-Source: ABdhPJwlHir/1NL4OaK1ckYfB7+/AZEP8h2FBPv9ZEElWwlBjJf2M9jlDcrXHmSRfsXJdoF19CsOxA==
X-Received: by 2002:a05:6808:300f:b0:325:a942:fd64 with SMTP id ay15-20020a056808300f00b00325a942fd64mr4286518oib.41.1652320715944;
        Wed, 11 May 2022 18:58:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z61-20020a9d24c3000000b00606765d8db2sm1426511ota.77.2022.05.11.18.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 18:58:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <31b7f0f8-f27c-9731-9cfc-f7f99601362e@roeck-us.net>
Date:   Wed, 11 May 2022 18:58:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Zhang Rui <rui.zhang@intel.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
 <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
 <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
 <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
 <43abbaa52f116c30f93f51d1d9f86a958c64f3c8.camel@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
In-Reply-To: <43abbaa52f116c30f93f51d1d9f86a958c64f3c8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/22 18:04, Zhang Rui wrote:
> On Wed, 2022-05-11 at 09:53 -0700, Guenter Roeck wrote:
>> On 5/11/22 07:37, Zhang Rui wrote:
>>> Hi, Guenter,
>>>
>>> On Wed, 2022-05-11 at 06:12 -0700, Guenter Roeck wrote:
>>>> On 5/11/22 00:54, Zhang Rui wrote:
>>>>> The acpi_power_meter driver doesn't create any standard hwmon
>>>>> sysfs
>>>>> attributes under its hwmon device node, but instead, the driver
>>>>> has
>>>>> its
>>>>> own code to create the hwmon style sysfs attributes in the ACPI
>>>>> device
>>>>> node of the ACPI Power Meter device.
>>>>> I'm not clear why it was designed in that way.
>>>>>
>>>>> In order to elimite
>>>>> [   79.960333] power_meter ACPI000D:00: hwmon_device_register()
>>>>> is
>>>>> deprecated. Please convert the driver to use
>>>>> hwmon_device_register_with_info().
>>>>> convert the driver to use the new API, no chip_info or
>>>>> sysfs_groups
>>>>> parameter needed.
>>>>>
>>>>> The only difference brought by this patch is that the "name"
>>>>> attribute
>>>>> will be created under the hwmon device node. Not sure if this
>>>>> matters or
>>>>> not.
>>>>>
>>>>> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
>>>>
>>>> No, this is not a conversion and not acceptable. Corentin Labbe
>>>> is
>>>> working on the real thing. See
>>>>
>>>
>>>
> https://patchwork.kernel.org/project/linux-hwmon/patch/20220509063010.3878134-3-clabbe@baylibre.com/
>>>>
>>>>
>>>
>>> Thanks for the pointer. And this was my original intension about
>>> how to
>>> do the conversion.
>>>
>>> But then I realized that, just like I described in the changelog,
>>> the original sysfs attributes in this driver, although they're
>>> hwmon
>>> style, but they are actually located under the ACPI device node.
>>> And the patch above will move them to the hwmon device node, right?
>>>
>>> With any patch, this is what I got under the hwmon device node
>>> # ls /sys/class/hwmon/hwmon0/
>>> device  power  subsystem  uevent
>>>
>>> and this is what I got under the ACPI device node
>>> # ls /sys/class/hwmon/hwmon0/device/
>>> driver  hid  hwmon  measures  modalias  name  path  physical_node
>>> powe
>>> r  power1_model_number  power1_oem_info  power1_serial_number  stat
>>> us
>>> subsystem  uevent  uid
>>>
>>
>> That is part of the conversion to any of the new APIs, and
>> intentional.
>> If that is unacceptable for some reason, you'll have to stick with
>> the old
>> API and accept the warning. Abusing the new APIs is not acceptable.
>>
> 
> I don't know why these attributes were put under the ACPI device node,
> and if it is okay to move the location. This is part of the reason that
> I'm sending this as RFC.
> But if moving them back to hwmon device node doesn't break anything,
> surely I'd vote for this.
> 

Applications should never access sysfs attributes directly but use
libsensors, which handles both locations. So far none of the conversions
caused any problems, so let's assume that this one doesn't cause
problems either.

Thanks,
Guenter
