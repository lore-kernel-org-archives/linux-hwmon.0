Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D52C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jan 2022 18:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235965AbiAPSUp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jan 2022 13:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233559AbiAPSUp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jan 2022 13:20:45 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E2FC061574
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jan 2022 10:20:44 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x7so49284946lfu.8
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jan 2022 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z+IuK0+2S1NqsfbtfKCeHv1P96bT3AHasq7MGR5mveg=;
        b=nLweSchUrfVhUdmq0CuAILXYQwgmpe2SkKS04wwpIEhX91j31slOk2YusjOxyfVGr3
         AbQo9Akm9qqzYQL3Mg4BoUo88kclDNr7r/cxaEFoAMCBK2iCGtjAWkE2ltLysevTXHfg
         4toJfAEm9Vhmsrkz8oOZdo12KYYb3UBkvVB27U7OktxWbWBXalfdYzsjsRcOyWpPR1x9
         64dQDC5rD13zJDJqjXUa5R2n1tFYpc8iLOaHPjNFRc2PTmWA6Y1VnN4bJd09D/z40trY
         qYgF+p8kHhsnek1F56lHNlWUOzJIIeAdAoLxcHlxg3ZwjmZvSNMkPLVU82L6LtAtwepF
         2ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z+IuK0+2S1NqsfbtfKCeHv1P96bT3AHasq7MGR5mveg=;
        b=CNUqt9OAsFoHgZbduK1hm4d1JelpQaAcaQpEXK4wQo/yWJbVQInRCrQVIDltuXGJM/
         GgdMI57t3vgtEdSdm9zJ4HBcd3PPeH+/FKdj7cyBRdUAmhamro9F9XWtqGNz8eD6Rlsc
         DcpklPfoEgLIcGFbC9uqm+iOKKEOpcM9ep4yv0RMi3gcMsguZVcwA96H/hywYViZ4dCd
         EqBNXg8cQrKZrhB6Rmgk14hHlMlK6PkD0yUN//kjkhRNM5xqIK6laUbaCgsKMvbrMS4c
         a3OBPL4mxdPxNX9BqIZ/dfF2DEF21GEJg3wzcjnTdmfzX8uwcWM0OBoZ4wiMhhUFZPXX
         qKag==
X-Gm-Message-State: AOAM532AJhdNAziabJPSLamhgoLSOmMcbuA7q5wzQFSp5WyOJcuA0Hqh
        TD3IpGgzkjrx8FXgkyIv40Y=
X-Google-Smtp-Source: ABdhPJzLagCWyW97y9T+SlbJU+OOolrwd3O5dxau2LI0Lcz+MO18SgyhtarI9VCJ1/hyb3r0lZAX9A==
X-Received: by 2002:a2e:5d6:: with SMTP id 205mr10637746ljf.270.1642357242869;
        Sun, 16 Jan 2022 10:20:42 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id n6sm776624lji.121.2022.01.16.10.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 10:20:42 -0800 (PST)
Subject: Re: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-7-linux@roeck-us.net>
 <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
 <0842cd57-9060-eb18-3ec5-c67542fdfa55@gmail.com>
 <93718b89-5b79-1d24-45ed-ada964429e2e@roeck-us.net>
 <ae0dff3a-fb19-1dae-6e74-07ed50161fc6@gmail.com>
 <147d69f8-6465-1e19-c1a3-a8ab18a72bc0@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a3811a06-6399-b71c-8031-13f8765dffea@gmail.com>
Date:   Sun, 16 Jan 2022 21:20:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <147d69f8-6465-1e19-c1a3-a8ab18a72bc0@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

16.01.2022 18:58, Guenter Roeck пишет:
> On 1/16/22 12:14 AM, Dmitry Osipenko wrote:
>> 16.01.2022 00:11, Guenter Roeck пишет:
>>> On 1/15/22 12:41 PM, Dmitry Osipenko wrote:
>>>> 15.01.2022 23:33, Dmitry Osipenko пишет:
>>>>> 11.01.2022 19:51, Guenter Roeck пишет:
>>>>>> sysfs and udev notifications need to be sent to the _alarm
>>>>>> attributes, not to the value attributes.
>>>>>>
>>>>>> Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
>>>>>> Cc: Dmitry Osipenko <digetx@gmail.com>
>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>>> ---
>>>>>>    drivers/hwmon/lm90.c | 12 ++++++------
>>>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>>>>> index ba01127c1deb..1c9493c70813 100644
>>>>>> --- a/drivers/hwmon/lm90.c
>>>>>> +++ b/drivers/hwmon/lm90.c
>>>>>> @@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct
>>>>>> i2c_client *client, u16 *status)
>>>>>>          if (st & LM90_STATUS_LLOW)
>>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>>> -                   hwmon_temp_min, 0);
>>>>>> +                   hwmon_temp_min_alarm, 0);
>>>>>>        if (st & LM90_STATUS_RLOW)
>>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>>> -                   hwmon_temp_min, 1);
>>>>>> +                   hwmon_temp_min_alarm, 1);
>>>>>>        if (st2 & MAX6696_STATUS2_R2LOW)
>>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>>> -                   hwmon_temp_min, 2);
>>>>>> +                   hwmon_temp_min_alarm, 2);
>>>>>>        if (st & LM90_STATUS_LHIGH)
>>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>>> -                   hwmon_temp_max, 0);
>>>>>> +                   hwmon_temp_max_alarm, 0);
>>>>>>        if (st & LM90_STATUS_RHIGH)
>>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>>> -                   hwmon_temp_max, 1);
>>>>>> +                   hwmon_temp_max_alarm, 1);
>>>>>>        if (st2 & MAX6696_STATUS2_R2HIGH)
>>>>>>            hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>>>>> -                   hwmon_temp_max, 2);
>>>>>> +                   hwmon_temp_max_alarm, 2);
>>>>>
>>>>>
>>>>> IIUC, "alarm" is about the T_CRIT output line. While these attributes
>>>>> are about the ALERT line. Hence why "alert" notifications need to be
>>>>> sent to the unrelated "alarm" attributes? This change doesn't look
>>>>> right.
>>>>>
>>>>
>>>> Although, no. I see now that the "alarm_bits" in the code are about the
>>>> alerts. Should be okay then.
>>>>
>>>
>>> Alarm attributes are really neither about interrupts nor about alerts.
>>> Alarm attributes alert userspace that a limit has been exceeded.
>>> How and if the driver notices that a limit has been exceeded is
>>> an implementation detail. In a specific implementation, alerts
>>> or interrupts can be used to notify a driver that a notable event
>>> has occurred on a given device, but technically that is not
>>> necessary. Polling would do just as well.
>>
>> Datasheet refers to T_CRIT using the "alarm" term, this confused me a
>> tad.
>>
>> BTW, we don't have events wired for the temp_crit_alarm attribute.
>>
> And not for for emergency alarms either. I have a patch prepared to address
> this, as part of a larger patch series. Unlike the patches in this series,
> I considered adding events for those attributes an enhancement and not
> a bug fix.

Alright

