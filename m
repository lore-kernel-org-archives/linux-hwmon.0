Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D4EC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 18:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbiBUS1h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 13:27:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbiBUS0N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 13:26:13 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8487C2A
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 10:23:52 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id v10so34139256qvk.7
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mJ/YjDAa9hpDyEnc606UsnNgs3l8AyyfLN0IHrmjo/k=;
        b=M2UFrPXznOvxuQzIYfrbTqgJcmEKuhun/XnDzX07lFGZ1CmlCwg88KbbamO37hgX7+
         16YuhZtddbRDywDjYKAI3HSgRCGhnqzugZFlnK7P/R/UxpBRdW92CRYVjWK9DruL3xOp
         8FfyE4hCTGE/Oxhn7L9A7JKOw0HxCxx/YDk+w6Tz8GpqRHRBGblCSLJNygfR8gL4j3wD
         TlLBq15Y+MCVCjdVtuUAGjF04PnKRlGTXqvSpuLvRhT1VGx/LTKua7m/17xbrgiOwd5K
         45ZRem9x0N50uGpwIDMLwwvX6wVe7CQVyoYp6zFcevBhjwcesPYAAhShg4MSVB6Ig72B
         Hbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mJ/YjDAa9hpDyEnc606UsnNgs3l8AyyfLN0IHrmjo/k=;
        b=aRcBrLEubTD3CKWGA0paivEjJslExJ1wehvfcl3eg5DaCB+cuiOA1Rptq3U9J7Rsl/
         c4Vfc4/KxnIshh+lsFPgXKbfah91msCKOg/GX3LW+LVC6XvhLXVvcG6XbtEx5D+PydaZ
         5BF5Q3ioJbyhPMPgbBhgsb+KmbcMAqyuJYd0lHWDlu+eQ8JnREEbjdWZHwDZGiCmsrot
         KIyjZfqPOVDE/BeTnHM+I7ajf/57G/y14HNUk5DrqCtvACSG9ty9RKjJwhHWgMk8j0GP
         6IRhPXtEIft7D6cE6l7th8KpyTFXLF45dG0CIKf9J4WXIei6rK2AYPIz069F2JkVZWC7
         RfdQ==
X-Gm-Message-State: AOAM532eaMjMHfn0hA0I55TZVa+YHTnJvdiW6igqRub48RMEW6kR96s8
        B4KenPosCVZxRWEthU4/WpY=
X-Google-Smtp-Source: ABdhPJxPpcEB+LRwY3A8mL5tBjzckY4iJockwzsHHj6yMCkSMYy8gqsFgRxKvcVjmByn2ZnXIptdYQ==
X-Received: by 2002:ac8:5ccf:0:b0:2dd:a371:68f4 with SMTP id s15-20020ac85ccf000000b002dda37168f4mr14521052qta.370.1645467832092;
        Mon, 21 Feb 2022 10:23:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id br30sm1417471qkb.35.2022.02.21.10.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 10:23:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7b06ddaf-d7dc-46ef-6fd0-a026f464f1bf@roeck-us.net>
Date:   Mon, 21 Feb 2022 10:23:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: Handle failure to register sensor with thermal
 zone correctly
Content-Language: en-US
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20220221164434.4169560-1-linux@roeck-us.net>
 <9ad46103-381b-ac0e-c263-cde0d26eab46@gmail.com>
 <e8c4f814-e017-26bf-501c-6ed1da0963e9@roeck-us.net>
 <af0576cb-96d6-266a-3fc3-5670d9cffd8d@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <af0576cb-96d6-266a-3fc3-5670d9cffd8d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/21/22 09:59, Dmitry Osipenko wrote:
> 21.02.2022 20:12, Guenter Roeck пишет:
>> On 2/21/22 08:56, Dmitry Osipenko wrote:
>>> 21.02.2022 19:44, Guenter Roeck пишет:
>>>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>>>> index 3501a3ead4ba..4bfe3791a5ba 100644
>>>> --- a/drivers/hwmon/hwmon.c
>>>> +++ b/drivers/hwmon/hwmon.c
>>>> @@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct
>>>> device *dev, int index)
>>>>          tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
>>>>                               &hwmon_thermal_ops);
>>>> -    /*
>>>> -     * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
>>>> -     * so ignore that error but forward any other error.
>>>> -     */
>>>> -    if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
>>>> -        return PTR_ERR(tzd);
>>>> +    if (IS_ERR(tzd)) {
>>>> +        if (PTR_ERR(tzd) != -ENODEV)
>>>> +            return PTR_ERR(tzd);
>>>> +        dev_warn(dev, "Failed to register temp%d_input with thermal
>>>> zone\n",
>>>> +             index + 1);
>>>
>>> Do we really need this warning? I suppose it should be okay if sensor
>>> isn't attached to any device in a device-tree and just reports
>>> temperature.
>>
>> I'd rather leave it there for the time being. It will only affect
>> devicetree
>> systems (turns out there is already a check for of_node elsewhere). Thermal
>> zone specification is not always easy and there may be a mismatch between
>> what is reported by the driver and what the user (programmer) expects to
>> see (which I think is what happens here). I don't want to silently
>> ignore such problems without any notification.
>>
>> We could make it dev_notice and/or change the message (instead of
>> "Failed to
>> ..." just say "temp%d_input not registered with thermal zone" , maybe ?).
> 
> I'd change it to:
> 
> dev_info(dev, "temp%d_input not attached to any thermal zone\n", index + 1);
> 

Makes sense. I just sent v2 with that change.

> I'd also add an info message to print out to which tzd attachment happened.

Oh, I don't know. Kernel logs are already way too noisy. Either case that would
not be a bug fix, so such a change should not be part of this patch.

Thanks,
Guenter
