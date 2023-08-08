Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1F0C001E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Aug 2023 22:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjHHWHr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Aug 2023 18:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHHWHr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Aug 2023 18:07:47 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C219AE51
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Aug 2023 15:07:46 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-78666f06691so220149339f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Aug 2023 15:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691532466; x=1692137266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nAl9mXlCAoqJmbkSyh7LvdK1vER3jiX0bR73EtdOQiE=;
        b=JMT9fRCboNXWP/Hg6eDM5J9QJ5hZug2fXEbSJH5Fwwn+S99peoRNaGJ8zbioN5JWMo
         UaUBpnN7oTXWbOE6YfLLdMpS6I1un3X6qzcoxW7DaajbKbG0LELwAm6EcreOSQ8/YnuD
         bMHRTNJnVjVg0HJ4T3cCxG7FSImyLXwgAv5XNUlB2aYFFLD520RPcY31cqJ/4OU2o+i1
         FSitRHy28c3UXFu9P+woJYxpsDMN39gOli5lb7lEf2114tclurFNbjhUqm/sPe38Hm5W
         MFdDQPvjV648L3cFqDJm4E7vuOy28wYoiMkgQrZsMUreWjcbx03ENGDp/J45KQqu7Le2
         rtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691532466; x=1692137266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAl9mXlCAoqJmbkSyh7LvdK1vER3jiX0bR73EtdOQiE=;
        b=Tt71R1Gdtx0qaIBbs/VuhtS1BOfCUz5qY8Y68VfAVBQmpTcv0khdaEc055gXZCDBnb
         zy7AYraLL1lZOxXWqLs9AjmGlT3nu6esG5OKGit2862/IEANuDSrum4pzW3wed+8C9Wc
         NkgcwPK8z+daRVjwBkdymx9wYXXjwdrHeidbwHfWLnqigzT/ZtU7a2+kU3RAFgq/ML4W
         mNkxo7HywPVYd3wzqK83z9HCkCrvZBE0bifKGvIgUcCasy/9zb/1ilgtfiSRPMhuYwJT
         G1NWY+lw5W+M+1cy8p5qd5CiF20pwVSkBaF8g9yGt94aBep6PmlbkRV+fn7QpDOK2e24
         Y8hw==
X-Gm-Message-State: AOJu0YxzEprhaDburAWmDbe5MJUyXlqyhCC5dtNwyzklI2aWksuMo5AP
        3XwtyS1OrSU9vZ4g79keu619El9GuD4=
X-Google-Smtp-Source: AGHT+IGHv9R5kUFE+6e1/2lIdq35xjKyn2Re57/28+kYA7Ez1mJyEFP8S8naFFtoLYVLdXBvKjlMOg==
X-Received: by 2002:a05:6602:3358:b0:786:e612:72f8 with SMTP id c24-20020a056602335800b00786e61272f8mr900675ioz.21.1691532465969;
        Tue, 08 Aug 2023 15:07:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n12-20020a056638120c00b004302370a169sm3444261jas.157.2023.08.08.15.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 15:07:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a95b0703-b3cd-23ae-7ba7-40aab960320a@roeck-us.net>
Date:   Tue, 8 Aug 2023 15:07:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>,
        "Nilawar, Badal" <badal.nilawar@intel.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
 <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
 <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com> <ZNK0NzoBlGt6chs2@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZNK0NzoBlGt6chs2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/8/23 14:31, Rodrigo Vivi wrote:
> On Fri, Aug 04, 2023 at 08:06:22PM +0530, Nilawar, Badal wrote:
>>
>>
>> On 04-08-2023 19:56, Guenter Roeck wrote:
>>> On 8/4/23 06:19, Nilawar, Badal wrote:
>>>>
>>>> Hi Guenter,
>>>> On 03-08-2023 04:42, Guenter Roeck wrote:
>>>>> On 8/2/23 15:40, Andi Shyti wrote:
>>>>>> Hi Badal,
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +struct xe_hwmon_data {
>>>>>>> +    struct device *hwmon_dev;
>>>>>>> +    struct xe_gt *gt;
>>>>>>> +    char name[12];
>>>>>>> +};
>>>>>>> +
>>>>>>> +struct xe_hwmon {
>>>>>>> +    struct xe_hwmon_data ddat;
>>>>>>> +    struct mutex hwmon_lock;
>>>>>>> +};
>>>>>>
>>>>>> why do we need two structures here? Can we merge them?
>>>>>>
>>>>>
>>>>> A later patch adds multiple hwmon devices which makes use of it.
>>>>> I think that is flawed, and I am not inclined to accept it.
>>>> Is there any obvious reason that there shouldn't be multiple
>>>> devices? In i915 we are doing the same.
>>>> https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
>>>>
>>>
>>> Technically you can do whatever you like as long as the code doesn't reside
>>> in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
>>> either. i915 shouldn't do it, but I didn't realize what they are doing
>>> at the time. Other drivers doing it wrong is not an argument. You can't
>>> argue that you may drive faster than the speed limit because others do it
>>> or because police didn't stop you last time you did either.
>>>
>>> One chip, one hwmon device. Do you have separate parent devices for
>>> all your hwmon devices ? If yes, you can argue that having multiple hwmon
>>> devices make sense. If not, you can't.
>> Thanks for clarification. There is only one parent device. So will try to
>> accommodate single hwmon device.
> 
> Well, it is one PCI device, but under 1 pci device we can have multiple "tiles"
> that can duplicate many components. Inside each tile we can even have multiple
> "gt"s.
> 
> But back to the tile, each tile has its own metrics. It's own power delivery,
> own sensors and all. They can even be seen as independent devices from this
> angle.
> 
> I'm afraid that the attempt to put everything as one device, but all the
> entries duplicated per tile/gt we might end up with a messed api.
> 

Your argument does not make sense. I am not asking to duplicate anything.

Guenter

