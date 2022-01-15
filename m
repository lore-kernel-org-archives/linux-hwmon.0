Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7ECC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jan 2022 21:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiAOVLH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jan 2022 16:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiAOVLG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jan 2022 16:11:06 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD23CC061574
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 13:11:06 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id k15-20020a4a850f000000b002dc3cdb0256so3691146ooh.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 13:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ejWu0hOlH+AfNND0tYSB7YQqXx6EGRTardsTWi50TCs=;
        b=SgOxvv/ieUx1vyZNbFChji9CtP/aKItL4Bue916rUpx45D/AuocBMFG0GGJFXy3jwb
         ioHoHqjHCScp0PVAgh9Ig9oXz+xVMxfe3Y8cJonl5CprM9ULSBnC/Oi5YXDPkx7Kha0W
         G24giluQxE8VJleId93onSkNwSCQFbrUisAQjNeLhqchffntXyKSkFN74OWGPUeXQMIu
         /royWVdlfdOI61bRFsKKHd23INyNJm9++Ch/gw/GTgLX6N/wQKox8zVuVqMjOetyJy9G
         ytMtUBbP15cIoA3UqNU+I6/Ptp6fVnsYvD7WoMOaMdWIRFg3w2ChUaKSUwq72H6SV/Ap
         O1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ejWu0hOlH+AfNND0tYSB7YQqXx6EGRTardsTWi50TCs=;
        b=50GCp7BQWRrrEM1cbyEyuPY+rPLLgiBiq9D/uHkphbTkCG8sRfLBBeVhOSidu3hkn4
         oFsiuada8OEgRVIHQvhClCfboBmPvo6BY8wyrHI6XoOEYhl09XkAi6AVMSnoUzsZj6D6
         h5oP9tKyD1Ux6NypgN1ahu8CLBJMQRJCeAHSaCPYMmbsZ91CXZwtrLIoPsHJUpyhzQGY
         rg3jE9KHZ/72NDHGEoU23b+TXb+UWyeywd3x5bfyTQIpRphwA3wKbRZwfh2egmtb9kV0
         MHcLkyJLVhHrx9lfLTpbr+KavNk2gpaLTWgNSeeyGMZ0hNTIfvRyExno6wlC0RmO7Ecl
         ukDw==
X-Gm-Message-State: AOAM530kbqDGkkaehQpZTK6upC+JYXn9+9boTR2nVkOaol69zcyJYZLM
        ZjOFIOdS01eEl5/1vNgB5c6VsmWsjs0=
X-Google-Smtp-Source: ABdhPJzp5dnubnQVcpFts//+Xz4ZUAMgcehCytHG6/bXTKh6JL0kNmeHyanPPwbJ2T3l3XjdMpaQ1g==
X-Received: by 2002:a4a:270d:: with SMTP id l13mr10512511oof.5.1642281066047;
        Sat, 15 Jan 2022 13:11:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g7sm3470473oon.27.2022.01.15.13.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 13:11:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-7-linux@roeck-us.net>
 <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
 <0842cd57-9060-eb18-3ec5-c67542fdfa55@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
Message-ID: <93718b89-5b79-1d24-45ed-ada964429e2e@roeck-us.net>
Date:   Sat, 15 Jan 2022 13:11:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0842cd57-9060-eb18-3ec5-c67542fdfa55@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/15/22 12:41 PM, Dmitry Osipenko wrote:
> 15.01.2022 23:33, Dmitry Osipenko пишет:
>> 11.01.2022 19:51, Guenter Roeck пишет:
>>> sysfs and udev notifications need to be sent to the _alarm
>>> attributes, not to the value attributes.
>>>
>>> Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
>>> Cc: Dmitry Osipenko <digetx@gmail.com>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>   drivers/hwmon/lm90.c | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>> index ba01127c1deb..1c9493c70813 100644
>>> --- a/drivers/hwmon/lm90.c
>>> +++ b/drivers/hwmon/lm90.c
>>> @@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
>>>   
>>>   	if (st & LM90_STATUS_LLOW)
>>>   		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>> -				   hwmon_temp_min, 0);
>>> +				   hwmon_temp_min_alarm, 0);
>>>   	if (st & LM90_STATUS_RLOW)
>>>   		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>> -				   hwmon_temp_min, 1);
>>> +				   hwmon_temp_min_alarm, 1);
>>>   	if (st2 & MAX6696_STATUS2_R2LOW)
>>>   		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>> -				   hwmon_temp_min, 2);
>>> +				   hwmon_temp_min_alarm, 2);
>>>   	if (st & LM90_STATUS_LHIGH)
>>>   		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>> -				   hwmon_temp_max, 0);
>>> +				   hwmon_temp_max_alarm, 0);
>>>   	if (st & LM90_STATUS_RHIGH)
>>>   		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>> -				   hwmon_temp_max, 1);
>>> +				   hwmon_temp_max_alarm, 1);
>>>   	if (st2 & MAX6696_STATUS2_R2HIGH)
>>>   		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
>>> -				   hwmon_temp_max, 2);
>>> +				   hwmon_temp_max_alarm, 2);
>>
>>
>> IIUC, "alarm" is about the T_CRIT output line. While these attributes
>> are about the ALERT line. Hence why "alert" notifications need to be
>> sent to the unrelated "alarm" attributes? This change doesn't look right.
>>
> 
> Although, no. I see now that the "alarm_bits" in the code are about the
> alerts. Should be okay then.
> 

Alarm attributes are really neither about interrupts nor about alerts.
Alarm attributes alert userspace that a limit has been exceeded.
How and if the driver notices that a limit has been exceeded is
an implementation detail. In a specific implementation, alerts
or interrupts can be used to notify a driver that a notable event
has occurred on a given device, but technically that is not
necessary. Polling would do just as well.

Guenter
