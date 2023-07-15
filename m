Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F139AC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 18:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjGOSaQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 14:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGOSaP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 14:30:15 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CD01B6
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 11:30:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6831e80080dso2140037b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689445814; x=1692037814;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6pi2QUidkjhKR7u2ShHvvx8j/AfEv0jFu6Ke410YcA=;
        b=sZRg5xrssX2vpYcGKM0B9VAcdfoImHAPp3lSbY+QF/vG6GbhjPFV5DRheUEtcr9XZw
         DeEQDTe7W3EIeALxELhUq3Z6nkUvW2TsADpAc0zJRg2ILqQRXtrEQHwT9kZkiS7s9X3L
         E2+tGNyeIMopfu4yv7IdNqosImZ+wtWsziP8H08zQDAAxr8DxJzx0GBf+f8lISkidQ+f
         lz15e6KmtZg1OUR0yLCiY3TUK/B2JNhP0iHEDF8Zos5azUsrTRXOVVjS9R1GK0du2Ovd
         a3JwT5wBtH4zyzbfowR6IRAxXNrF2EH4J7bEyb1CtqW/LjUEVxP+HxnEaEaIqAnoEsJq
         NWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689445814; x=1692037814;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6pi2QUidkjhKR7u2ShHvvx8j/AfEv0jFu6Ke410YcA=;
        b=MXoGRgLNKN80t8Gp3QxULlwIeIR8KeLER1eshLkejxBHoAU3Kz730V9XyiSMkviaVo
         djcDjZtDLQTex0KHmAqr1Zw7eqDeFAO5i2oiN9OqkW8hjxnMFHF+LHaYjnJbHsQU7Qt+
         CUP4IcST2ZAtnoM/RBIrqw7Qnx0Ov+rCn8/j9gwxdDwJ8MLRjIFYAmnQz+Eyv0xMpVsg
         HzYRExdBt7XUcwNYsjaLxNrLQFSo7adawzrTz5xsg4DFpUW4pqED5GVYW0QVfpi2uN0X
         FXA0ntLRK1ExpYP/KuBBPZBXHqzET33jxP8nK00nfddhAmMtHC6sCWWisiu0TH8uAAeU
         RcGw==
X-Gm-Message-State: ABy/qLbc9nNi8A2vo2QSaP4boLyfyrWUTfU6oL4fxveWCPTz79rUAg6H
        ht+P61c46Z4/381HrW3JXiXDC8ESng4=
X-Google-Smtp-Source: APBJJlHKj61QIcoC3W+sq4/UAsEck04cGG4qChr4hiChwh7Zkdzgyjl1/MsAq63i22c/+vHPBXvK2w==
X-Received: by 2002:a17:903:495:b0:1b8:28f6:20e6 with SMTP id jj21-20020a170903049500b001b828f620e6mr6385878plb.34.1689445813857;
        Sat, 15 Jul 2023 11:30:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902758c00b001b9d9225b78sm9747252pll.102.2023.07.15.11.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 11:30:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f7fbd5a7-a56f-7fa0-6665-1fa054d37f90@roeck-us.net>
Date:   Sat, 15 Jul 2023 11:30:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20230715153113.1307220-1-ahmad@khalifa.ws>
 <9c4d7f9d-d417-077d-a709-d372214bf35c@roeck-us.net>
 <9271e276-7727-25ee-5c46-c25f479b73d7@khalifa.ws>
 <6012aa53-fa6c-103a-faf8-56ed8e990277@roeck-us.net>
 <2449f8b5-53ab-cbea-f1da-6c4b55c41ac8@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <2449f8b5-53ab-cbea-f1da-6c4b55c41ac8@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 11:12, Ahmad Khalifa wrote:
> On 15/07/2023 18:48, Guenter Roeck wrote:
>> On 7/15/23 10:03, Ahmad Khalifa wrote:
>>>> Why not use bit 31 ?
>>>
>>> Well, this is the part that made me say "driver supports up to 16".
>>> The ALARM bits have FAN_BASE starting at index 16, so the IN alarms
>>> can only take up 0-15, unless all alarm bits have extra padding
>>> added to push FAN_BASE/TEMP_BASE/INTRUSION_BASE up.
>>>
>>> I took the easy option here and left out the 16 IN alarm.
>>>
>>> Did I count this wrong?
>>> nct6775_fan_is_visible()
>>>      `data->ALARM_BITS[FAN_ALARM_BASE + fan]`
>>
>> The 16 was just for convenience when setting the alarm base values,
>> and to keep some space for voltages. That doesn't mean the driver as
>> a whole supports 16 voltage inputs (or 8 fan control inputs, for
>> that matter).
>>
>> We need to revisit the entire alarm handling at some point.
>> nct6798 and nct6799 support 8 sets of temperature limits and
>> alarms, and that isn't currently supported either. 'alarms'
>> is already 64 bits wide, so it should be possible to shift
>> the bits around and make space for more alarms (such as 24
>> voltages, 8 fans, and 8 or even 16 temperatures).
> 
> Good point, my next patch for temps was going to have this comment:
> 
> +/* 8 source readings available, but we keep to 6 to remain in bounds
> + * temp 7/8: 0x676, 0x678
> + * src 7/8:  0xc2a, 0xc2b
> + */
> 
> Might as well expand the Alarms first then add all 18 IN and 8 TEMPs
> (And with comments not in the style of the networking subsystem)
> 
> Should I update the ALARM bits first, then send in the the full IN
> and TEMP registers afterwards? Rather than add-expand-addmore
> 
> 
Yes, I would prefer that. Do you have the datasheet for NCT6798D ?
We should make sure that this chip is covered as well.

Thanks,
Guenter

