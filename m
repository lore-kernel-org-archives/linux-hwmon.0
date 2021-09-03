Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B75CC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 17:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F20F86054F
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 17:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349686AbhICRHH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 13:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhICRHH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Sep 2021 13:07:07 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26516C061575
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Sep 2021 10:06:07 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso7324485ots.5
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Sep 2021 10:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jk/ds5F37IqwG64R4qKXsxWiUJS71tr+vH8c4RiQR98=;
        b=lLHoT1goTxJJD01OowdU8Xe+njPimCqcwuLHeAGoO1tq4a1xMkziff+fu65WBJgiTR
         DU8216uK4obC0EzdktPHG1J3qZ6AkISPwg56kvpnRflhhDbDoqnZ7+CUMEsau/u7P1pO
         UfxDEdJTNPtnMA6iI7kovddckQb2WvS6jxA6KBGKQrZ813AvU5PP/GEngJBlD8g1zPns
         jf5kPnfau2IUNLB6kh7uRNJhjVfto6QGTnh8SW64lvFpbgyNOxzkrHe67V/isRzK0Uvp
         2Dfy3cHmaZVM5cjh87YdOBRuIAE+OQmvewNND5piG/GBmBrDrH5afUQLtHIMOt+AZfD1
         Z0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jk/ds5F37IqwG64R4qKXsxWiUJS71tr+vH8c4RiQR98=;
        b=Gn39cAAPaRQpe5nMEinRg/w5o5OHc59n0XgYOTtWiLETjOA+ejwNC5aLXz3Z/AqRTE
         Jn4tsvTj7WJsHD9Nxm5CVZQFpkMh7NbV/DnQlKNery/SO/n+uQa+lWYl9qZ33x5RygVE
         1JlcgnbChwIE5ucp8xJ7suMpHyXxKexYyUm/0I+e9Mlc6jaD10vDLOmCx+sLKLwoW0q5
         QLsD0tQ92s9nOoEXwAlpdMkwJ1zuG8Am8+5rVl09ZnUdhmDyPmXEypRR92/nXHC+T5jF
         cuUWd4oFA5x+eSvggeZY8VqmBFKc9Ko1Dj3/FoW42dKv2VT/+1enlOvp8AZQy2grizLs
         u0cw==
X-Gm-Message-State: AOAM532jlT8j8wgooJ+lmohmXt5DxluTKlM4ceMzWrsfbcXQFDNAuFj/
        /3XQ76Iy9Qwp5EMcp8zXnpCOmn7UTYc=
X-Google-Smtp-Source: ABdhPJzrete5+WnHxbSq40rTk2YkCHCj7BlPb12WUS3ft4RxgLZfvDE4cvr42Xaqe/JFPKMqeCsuCQ==
X-Received: by 2002:a05:6830:2b2c:: with SMTP id l44mr57899otv.238.1630688765282;
        Fri, 03 Sep 2021 10:06:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c24sm1077027otf.71.2021.09.03.10.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:06:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210903142456.9926-1-W_Armin@gmx.de>
 <20210903144908.vrrae6oeivjxqpkj@pali>
 <cbca6113-9a47-4a69-26bc-92a1fcf9679a@roeck-us.net>
 <4bddae04-808a-b536-7c91-5b634116cb15@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (dell-smm) Show fan_max param in sysfs
Message-ID: <4314aec6-38de-8d32-ba29-cb76c3286031@roeck-us.net>
Date:   Fri, 3 Sep 2021 10:05:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4bddae04-808a-b536-7c91-5b634116cb15@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/3/21 8:40 AM, Armin Wolf wrote:
> Am 03.09.21 um 16:59 schrieb Guenter Roeck:
>> On 9/3/21 7:49 AM, Pali Rohár wrote:
>>> On Friday 03 September 2021 16:24:56 W_Armin@gmx.de wrote:
>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>
>>>> For allowing tools like i8kutils to query the fan state
>>>> without having to rely on the deprecated /proc/i8k interface,
>>>> they need to scale the pwm values (0 - 255) back to the
>>>> real hardware values (0 - 2/3).
>>>> Show fan_max in sysfs to allow for such a scenario.
>>>
>>> Guenter, I think that this is general problem and not specific to
>>> dell-smm-hwmon.c driver and i8kutils.
>>>
>>> All other hwmon tools should have similar problem. If e.g. GUI tool has
>>> slider for controlling pwm then such tool needs to know number of steps.
>>> Otherwise usage of such slider would be not very user friendly...
>>>
>>> Currently in hwmon sysfs API there is not attribute which could export
>>> this kind of information.
>>>
>>> What about e.g. introducing 'pwm_steps' attribute which would provide
>>> this information?
>>>
>>
>> It isn't really a problem. The problem is that the tool writers insist
>> not following the ABI. All they would have to do is to use a scale of
>> 0..255,
>> read back any written pwm value, and adjust the displayed value based
>> on the returned value. I do not see why this would be "not user
>> friendly".
>>
>> An attribute such as pwm_steps would not work because the step size
>> can be
>> non-linear.
>>
>> Guenter
>>
> i8kutils uses values from 0 to 2/3 for historic reasons, as the
> deprecated /proc/i8k interface
> provided such values. In order to not break backwards compatibility,
> they cannot simply
> switch to standard pwm values (ithink).
> I believe that showing fan_max via sysfs would allow i8kutils to finally
> use the standard interface,
> since when this happens, we maybe can remove the /proc/i8k interface.

No, we can't, because that is an ABI, and we can not remove it
because someone might insist using an old version of i8kutils with
a new kernel. Also, fan_max is _not_ a 'standard' interface.
If i8kutils wants to use fan_max, it can get it from the existing
proc interface.

Besides, fan_max is repurposed here: So far it is a module parameter.
With the proposed changes in place, it would no longer be a module
parameter but a sysfs attribute disguised as module parameter
that is abused to report a value (one changed by the driver)
to userspace.

Guenter

>>>> Tested on a Dell Latitude C600.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>   drivers/hwmon/dell-smm-hwmon.c | 7 +++++--
>>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>>> b/drivers/hwmon/dell-smm-hwmon.c
>>>> index 774c1b0715d9..6d3fd4f0f99d 100644
>>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>>> @@ -107,7 +107,7 @@ module_param(fan_mult, uint, 0);
>>>>   MODULE_PARM_DESC(fan_mult, "Factor to multiply fan speed with
>>>> (default: autodetect)");
>>>>
>>>>   static uint fan_max;
>>>> -module_param(fan_max, uint, 0);
>>>> +module_param(fan_max, uint, 0444);
>>>>   MODULE_PARM_DESC(fan_max, "Maximum configurable fan speed
>>>> (default: autodetect)");
>>>>
>>>>   struct smm_regs {
>>>> @@ -1245,7 +1245,10 @@ static int __init dell_smm_probe(struct
>>>> platform_device *pdev)
>>>>               fan_max = conf->fan_max;
>>>>       }
>>>>
>>>> -    data->i8k_fan_max = fan_max ? : I8K_FAN_HIGH;    /* Must not be
>>>> 0 */
>>>> +    if (!fan_max)    /* Must not be 0*/
>>>> +        fan_max = I8K_FAN_HIGH;
>>>> +
>>>> +    data->i8k_fan_max = fan_max;
>>>>       data->i8k_pwm_mult = DIV_ROUND_UP(255, data->i8k_fan_max);
>>>>
>>>>       fan_control = dmi_first_match(i8k_whitelist_fan_control);
>>>> -- 
>>>> 2.20.1
>>>>
>>

