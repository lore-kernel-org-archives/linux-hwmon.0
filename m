Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D95BC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jan 2022 15:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbiAPP66 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jan 2022 10:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiAPP66 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jan 2022 10:58:58 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A33C061574
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jan 2022 07:58:57 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso16760994otr.6
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jan 2022 07:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OsKT9aw1QIEFszecx+8Yc2VuexXyAqpAMPy2X+qKFdM=;
        b=gwgPV2FZbdAmtZ2pabaIK8P8OYPJZRoqUdEsztS/DbvCpeiHnOU8XcQ2rFEq1G+3mt
         L3HfrpanqexTU4TA9myOobtrng1SpFSBl8NIPOWl3sV7kcC1oMwQfoC6WVY9KaDqoQii
         81AP4rR4Ca6qswzZC+wlGu47XDloHltMm1RzNgEGoRymiZKnrKkWJoozsiNd8VNwQYPU
         /TsjBbjMK93Ln5r5kaU7PwyNr/uxpvFuAJyoqrVg5iZCiDGtwikp7ogJaT00FpGAwPTc
         0iPt6S9DHu3uQmpeESh1BXMuMOp3FkhAbi77VT4a5teLqopZQscztazlgTg+OsJ/A2Zd
         MMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OsKT9aw1QIEFszecx+8Yc2VuexXyAqpAMPy2X+qKFdM=;
        b=KlyZTBp+gXwJwrdqk4iqALhPE3NelDkHuze8D1dd7V05ic/l22u6o1RRlN/VusV2wh
         pDzQpYvjqF2j3Wz1f5/O+6YTAsimpJ+MkU0tUwBCHnZyfSOrxluwcGcBxVlMVEYRgINK
         hp+rngtJhVo6c3XGJzDGdyOHE6lASoKCZqJDACAwpzM2RxnHTYyn+FJKo9HWKiBt40zF
         71qHw2Bir+Wy6Y+GGmlx6z035n58s+U3J3JOPqYWX20Jr10e4DGwyttFU909ObNY/Qpj
         VuWUTSSMUQ7HGjU94nxFlBRgDvR9/F1Oz/437e91bgn8264Rz4hrLAFbBDfBG0QzMOq3
         n6zg==
X-Gm-Message-State: AOAM530Y+yB/qPGSedgYLHMvxJB/cNXaalGfUCwr2+xWV7lf5B5nwlxg
        /EMrLJjjkt/FGnhKkkhJNLw=
X-Google-Smtp-Source: ABdhPJzkbzwhWRAIqG0wdDQ6Uqte4l42iJWDjVMjsLaVqUUFlYL0cXC2koTb5Lz+7xzyi5doKSqdAQ==
X-Received: by 2002:a9d:2007:: with SMTP id n7mr13646360ota.234.1642348737184;
        Sun, 16 Jan 2022 07:58:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd2sm5306271oib.31.2022.01.16.07.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 07:58:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-7-linux@roeck-us.net>
 <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
 <0842cd57-9060-eb18-3ec5-c67542fdfa55@gmail.com>
 <93718b89-5b79-1d24-45ed-ada964429e2e@roeck-us.net>
 <ae0dff3a-fb19-1dae-6e74-07ed50161fc6@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
Message-ID: <147d69f8-6465-1e19-c1a3-a8ab18a72bc0@roeck-us.net>
Date:   Sun, 16 Jan 2022 07:58:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ae0dff3a-fb19-1dae-6e74-07ed50161fc6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/16/22 12:14 AM, Dmitry Osipenko wrote:
> 16.01.2022 00:11, Guenter Roeck пишет:
>> On 1/15/22 12:41 PM, Dmitry Osipenko wrote:
>>> 15.01.2022 23:33, Dmitry Osipenko пишет:
>>>> 11.01.2022 19:51, Guenter Roeck пишет:
>>>>> sysfs and udev notifications need to be sent to the _alarm
>>>>> attributes, not to the value attributes.
>>>>>
>>>>> Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
>>>>> Cc: Dmitry Osipenko <digetx@gmail.com>
>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>> ---
>>>>>    drivers/hwmon/lm90.c | 12 ++++++------
>>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>>>> index ba01127c1deb..1c9493c70813 100644
>>>>> --- a/drivers/hwmon/lm90.c
>>>>> +++ b/drivers/hwmon/lm90.c
>>>>> @@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct
>>>>> i2c_client *client, u16 *status)
>>>>>          if (st & LM90_STATUS_LLOW)
>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>> -                   hwmon_temp_min, 0);
>>>>> +                   hwmon_temp_min_alarm, 0);
>>>>>        if (st & LM90_STATUS_RLOW)
>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>> -                   hwmon_temp_min, 1);
>>>>> +                   hwmon_temp_min_alarm, 1);
>>>>>        if (st2 & MAX6696_STATUS2_R2LOW)
>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>> -                   hwmon_temp_min, 2);
>>>>> +                   hwmon_temp_min_alarm, 2);
>>>>>        if (st & LM90_STATUS_LHIGH)
>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>> -                   hwmon_temp_max, 0);
>>>>> +                   hwmon_temp_max_alarm, 0);
>>>>>        if (st & LM90_STATUS_RHIGH)
>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>> -                   hwmon_temp_max, 1);
>>>>> +                   hwmon_temp_max_alarm, 1);
>>>>>        if (st2 & MAX6696_STATUS2_R2HIGH)
>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>> -                   hwmon_temp_max, 2);
>>>>> +                   hwmon_temp_max_alarm, 2);
>>>>
>>>>
>>>> IIUC, "alarm" is about the T_CRIT output line. While these attributes
>>>> are about the ALERT line. Hence why "alert" notifications need to be
>>>> sent to the unrelated "alarm" attributes? This change doesn't look
>>>> right.
>>>>
>>>
>>> Although, no. I see now that the "alarm_bits" in the code are about the
>>> alerts. Should be okay then.
>>>
>>
>> Alarm attributes are really neither about interrupts nor about alerts.
>> Alarm attributes alert userspace that a limit has been exceeded.
>> How and if the driver notices that a limit has been exceeded is
>> an implementation detail. In a specific implementation, alerts
>> or interrupts can be used to notify a driver that a notable event
>> has occurred on a given device, but technically that is not
>> necessary. Polling would do just as well.
> 
> Datasheet refers to T_CRIT using the "alarm" term, this confused me a tad.
> 
> BTW, we don't have events wired for the temp_crit_alarm attribute.
> 
And not for for emergency alarms either. I have a patch prepared to address
this, as part of a larger patch series. Unlike the patches in this series,
I considered adding events for those attributes an enhancement and not
a bug fix.

Guenter
