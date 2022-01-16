Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FECC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jan 2022 08:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbiAPIOe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jan 2022 03:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234582AbiAPIOe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jan 2022 03:14:34 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6507C061574
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jan 2022 00:14:33 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id x11so19888652lfa.2
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jan 2022 00:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NAa5BIV0kUIRtaahZktRbX3L/i4GEhXnY5homOgyhjk=;
        b=i80P90x3EnFR1lWAVMUWATzuL91+KceowcQpwCd2Tt+d0ee20sVABpC7wKDojfnWHk
         Jmrp9MEWIT7QIGfZoRfQkzHMD4SmpppFd0oM2KzPzYFHgFio3psA3eiVodaW6Nu4i0Wz
         g/4bnYtGH6KKcpZ4VWTnz/uDl3p7zQBPTt6/Itp6x7XZKaXkIV3dE/rM/IiZZCh3dCff
         ZYZeQBBYF1NDjUuPr+2lXpT/ZweuloyLJ2vP/dDW0IEJf7eswLzV3tLr0oMyFlw33iVY
         QOWO4gjmc/ecqUZxhFChoL9LkF6AO7S0wHV8NWODBOENa4IXiDlvtr/3bCD85LQ1E6gN
         6h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NAa5BIV0kUIRtaahZktRbX3L/i4GEhXnY5homOgyhjk=;
        b=26DSIpXGiX152xUsrlMXkgK81BVJXOuVzjRTnOznqmQZC4rVXaGn4rmf2OBICK8qh4
         7evbUI6EtTq4KbDrfd++6DSP6dESApaqZXsjs8ORFwoUWh8K51whAEw9Ir9iXl/HdX2I
         dJMlRV6UShh5efYOxoDFIXHsvYTls3Ax/7DIhrhWmJxQoTQS9m9j2q3aUVihzhSZxw3M
         wPZRlPNhxGt3at3JhcJGFpYL1CxX8fB/96y0S+sWzY0zRjoNb05ANOC45jrxTDf4hDRH
         Vol52RboUMnEJvNJCiclbce1mpmHrNDhYt1YgHVNGAfPFnQ1GQDizUnR+r4i9VsHXH1u
         KARw==
X-Gm-Message-State: AOAM532ZdbxA9bgjgHdYfo3bwby0nAkwigeRppKCi3I+mcnDs9OJsPWY
        MIbvXG0sd1sHi813sIVGmYDbkSkIOV8=
X-Google-Smtp-Source: ABdhPJwZ3dZ/Cmx+9eNNVAqwlzhxMTdwRuXousNb6N98GEVGxC3fJqCICUxQEyf50o75sU9JvnPZ2A==
X-Received: by 2002:a05:6512:3d12:: with SMTP id d18mr12792867lfv.213.1642320872015;
        Sun, 16 Jan 2022 00:14:32 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id o17sm1053711lfu.122.2022.01.16.00.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 00:14:31 -0800 (PST)
Subject: Re: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-7-linux@roeck-us.net>
 <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
 <0842cd57-9060-eb18-3ec5-c67542fdfa55@gmail.com>
 <93718b89-5b79-1d24-45ed-ada964429e2e@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae0dff3a-fb19-1dae-6e74-07ed50161fc6@gmail.com>
Date:   Sun, 16 Jan 2022 11:14:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <93718b89-5b79-1d24-45ed-ada964429e2e@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

16.01.2022 00:11, Guenter Roeck пишет:
> On 1/15/22 12:41 PM, Dmitry Osipenko wrote:
>> 15.01.2022 23:33, Dmitry Osipenko пишет:
>>> 11.01.2022 19:51, Guenter Roeck пишет:
>>>> sysfs and udev notifications need to be sent to the _alarm
>>>> attributes, not to the value attributes.
>>>>
>>>> Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
>>>> Cc: Dmitry Osipenko <digetx@gmail.com>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> ---
>>>>   drivers/hwmon/lm90.c | 12 ++++++------
>>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>>> index ba01127c1deb..1c9493c70813 100644
>>>> --- a/drivers/hwmon/lm90.c
>>>> +++ b/drivers/hwmon/lm90.c
>>>> @@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct
>>>> i2c_client *client, u16 *status)
>>>>         if (st & LM90_STATUS_LLOW)
>>>>           hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>> -                   hwmon_temp_min, 0);
>>>> +                   hwmon_temp_min_alarm, 0);
>>>>       if (st & LM90_STATUS_RLOW)
>>>>           hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>> -                   hwmon_temp_min, 1);
>>>> +                   hwmon_temp_min_alarm, 1);
>>>>       if (st2 & MAX6696_STATUS2_R2LOW)
>>>>           hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>> -                   hwmon_temp_min, 2);
>>>> +                   hwmon_temp_min_alarm, 2);
>>>>       if (st & LM90_STATUS_LHIGH)
>>>>           hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>> -                   hwmon_temp_max, 0);
>>>> +                   hwmon_temp_max_alarm, 0);
>>>>       if (st & LM90_STATUS_RHIGH)
>>>>           hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>> -                   hwmon_temp_max, 1);
>>>> +                   hwmon_temp_max_alarm, 1);
>>>>       if (st2 & MAX6696_STATUS2_R2HIGH)
>>>>           hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>> -                   hwmon_temp_max, 2);
>>>> +                   hwmon_temp_max_alarm, 2);
>>>
>>>
>>> IIUC, "alarm" is about the T_CRIT output line. While these attributes
>>> are about the ALERT line. Hence why "alert" notifications need to be
>>> sent to the unrelated "alarm" attributes? This change doesn't look
>>> right.
>>>
>>
>> Although, no. I see now that the "alarm_bits" in the code are about the
>> alerts. Should be okay then.
>>
> 
> Alarm attributes are really neither about interrupts nor about alerts.
> Alarm attributes alert userspace that a limit has been exceeded.
> How and if the driver notices that a limit has been exceeded is
> an implementation detail. In a specific implementation, alerts
> or interrupts can be used to notify a driver that a notable event
> has occurred on a given device, but technically that is not
> necessary. Polling would do just as well.

Datasheet refers to T_CRIT using the "alarm" term, this confused me a tad.

BTW, we don't have events wired for the temp_crit_alarm attribute.
