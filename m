Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAF0C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Apr 2021 01:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AD3E613B0
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Apr 2021 01:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhDVBbU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Apr 2021 21:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbhDVBbT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 21:31:19 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2ABC06174A
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 18:30:45 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so40705844otn.1
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fezQiwi18LsJ+L5WFAFeHlkRXvDMnzcmVPf/Lqg4oao=;
        b=e6Iwfd36fHtgsi/3GCcv4Xgkssdo0jbXA4Xh8EpF44tWr/TSMU3wHxBe6dN0bsomXG
         16AQR170M89pwSImGDWeXazueiaqCgCC8kLdY5Jwmag67+ThhKxRtyLf6XR8IBG3gVcE
         KKEILbWNrHPzXXJHh/O/5cV3T9Wb3CsRtW8InHKT4RNek5kmqpW4nhr8WwO1c2hr/7+X
         pOcSZ/NhfbMbfuGmnQfSKeXyGBt0zBXRP85u+nGy6j4T+oecZvdUTUWzBdkcc7qBBqe9
         vFcbGlZvSEqvuNjYyHy33xVmAHuwRBLtR0PINewD+pPYlwx5fW089sHxDgO2QQYlLjSL
         jESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fezQiwi18LsJ+L5WFAFeHlkRXvDMnzcmVPf/Lqg4oao=;
        b=H4GvjIaaDtjs0TtUBY/Oi8Oo4+g4dcustm+/pX4eDZ9HAfWLlfuMAiCMaNVCE8wHbM
         RYajqkJOy20DeVoSUbc2r4eiovbdwVknQB6iiuHS/yqCePXpyfqxMeOyp0B6vOoirg7s
         rMiaqgOFJ2nrRK6e2y5zLh9ezhGAuKNbHmxh8VY4njKPXr1HNTzvNxLKNBSY8L+lxICu
         QnYJKgVObUyYiWjcxlqOBuGuVMtPsm2L1vee4i3woaWBPb0OCDRBhQQzzYbKqcKDGgSM
         lcnmeJdOIIL1phBtkB9EtrJjBdfmKOhpBPvp8I4xPLWEDut2838cLnRnvIUIhIS1wAAS
         tpOg==
X-Gm-Message-State: AOAM530WW9aStoyozfh6uXNxsp+GC7It54CPVDFo6V44gDHAYwVIFCDV
        78bwb0jhf4x8o7RoSFsTPN0ni/Yx7tA=
X-Google-Smtp-Source: ABdhPJwLi+/qPh3ETzx2ErqpuRqau2RuEKWJQfQiYiDSoJwUyy8g76G22jTeNjKs5QmHVXpcvSNoEA==
X-Received: by 2002:a9d:750a:: with SMTP id r10mr782113otk.221.1619055044434;
        Wed, 21 Apr 2021 18:30:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 10sm238416oiq.48.2021.04.21.18.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 18:30:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: PWM control in NZXT Grid+ V3 and Smart Device
To:     Jonas Malaco <jonas@protocubo.io>
Cc:     linux-hwmon@vger.kernel.org
References: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
 <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
 <20210421172136.GD110463@roeck-us.net>
 <20210421233127.3zriqcf22yw5lvxs@calvin.localdomain>
 <20210422001537.GA134898@roeck-us.net>
 <20210422011526.a6lbzsougxozsfwo@calvin.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <520e6d96-9062-56d1-29a1-b7635b3310ca@roeck-us.net>
Date:   Wed, 21 Apr 2021 18:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210422011526.a6lbzsougxozsfwo@calvin.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/21/21 6:15 PM, Jonas Malaco wrote:
> On Wed, Apr 21, 2021 at 05:15:37PM -0700, Guenter Roeck wrote:
>> On Wed, Apr 21, 2021 at 08:31:27PM -0300, Jonas Malaco wrote:
>>> On Wed, Apr 21, 2021 at 10:21:36AM -0700, Guenter Roeck wrote:
>>>> On Wed, Apr 21, 2021 at 01:48:03PM -0300, Jonas Malaco wrote:
>>>>> On Tue, Apr 13, 2021 at 09:45:29AM -0300, Jonas Malaco wrote:
>>>>>> Guenter (and others on this list),
>>>>>
>>>>> Very gentle ping.
>>>>>
>>>>> I also thought posting these questions first would be less disruptive
>>>>> than a RFC patch, but please let me know if you prefer the latter.
>>>>>
>>>>
>>>> It is a difficult subject, and I am struggling myself with the situations
>>>> you are presenting.
>>>
>>> I am somewhat relieved that these issues are not so silly.  And I really
>>> appropriate your comments.
>>>
>>> Please take a look at a few more comments bellow.
>>>
>>>>
>>>>> Thanks again,
>>>>> Jonas
>>>>>
>>>>>>
>>>>>> I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
>>>>>> (V1) fan controllers, but I am having trouble deciding how to expose
>>>>>> their PWM control due to some device limitations.
>>>>>>
>>>>>> Before getting into those, let me first give some very basic context...
>>>>>>
>>>>>> These devices are USB HIDs, and asynchronously send "status" reports
>>>>>> every 200 ms to communicate speed, current, voltage and control mode for
>>>>>> their channels (one channel per report).
>>>>>>
>>>>>> Fans can be controlled by sending HID output reports to the device, and
>>>>>> both DC and PWM modes are supported.  The device features a special
>>>>>> initialization routine (that must be requested during probe) which
>>>>>> automatically detects the appropriate control mode for each channel.
>>>>>>
>>>>>> Back to the device limitations...
>>>>>>
>>>>>> The first is that PWM values can be set, but not read back.  And neither
>>>>>> hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
>>>>>> be WO.  One solution is to have the driver track the PWM values that are
>>>>>> set through it and return those, but is this acceptable?
>>>>
>>>> I have seen a couple of those recently. I think returning -ENODATA
>>>> if the value isn't known (yet) is the best possible solution. I thought
>>>> about adding that to the ABI, actually.
>>>
>>> We can never read the pwm[1-*] attributes, not even for detected and
>>> controllable fans after the initialization procedure.
>>>
>>> And returning -ENODATA for pwm[1-*] reads makes pwmconfig/fancontrol
>>> unhappy:
>>>
>>
>> Seems to me that pwmconfig is then maybe not appropriate to use,
>> and maybe there should be no driver for this device in the kernel
>> in the first place.
> 
> I see your point.  Although, apart from this rather serious quirk, these
> devices work really well with pwmconfig/fancontrol.
> 
>>
>> Returning a random value after setting the pwm value to 255, removing,
>> and re-inserting the driver is, in my opinion, even worse than
>> returning -ENODATA. After all, the driver doesn't know the pwm value,
>> and it is really a bad idea to report data which doesn't reflect
>> reality.
> 
> Well, in this particular case, the driver must reinitialize the device
> anyway, since it cannot know whether the device was already initialized.
> Maybe the driver was removed because the device itself was disconnected
> and powered off (it's a USB device, not a chip on a board).
> 
> So in the work-in-progress driver I take this opportunity to also make
> sure that its state matches the device's, and force all fans to their
> default PWM values after powering on.
> 
> Specifically, besides requesting the device to initialize itself, I also
> (re)set all fans to 40% PWM.  (This does not require waiting for the
> initialization to be complete).
> 
> Is this egregious?
> 
SGTM, just make sure this is well documented, and make sure that the initial
pwm value is reported as 40%, ie 102.

Thanks,
Guenter
