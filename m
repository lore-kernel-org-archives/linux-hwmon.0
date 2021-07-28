Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5452C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B19A66101B
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbhG1Wgk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbhG1Wgj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:36:39 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B66C061757
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 15:36:36 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id m11so2561658qtx.7
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QnTd1s62MJgZqXXulrG8ZlZCHV/x77b9k0gFHvSAOaQ=;
        b=KjJoQPXKCpuyvVAXoWj4kLz60qFUqkINeuED78ALhOKFrwj0JEKOvUVWm+rDzlDTFu
         A4+5+uEorlElSU3P1/pM/wRS3vrMVDRgBY2LKaqgqDFpRe51hgLqzghq1YEqCc3fFdtX
         HgwYVI0Fg2vdvYRADvDt1aiqSoQLQhAVmUTUZ9zWyjxTPawmgSZZ2OMO9wjxek55g7Gs
         SwEi9D1XNVKFTY+m1Y5VNQm8YSKTE72ZLu4RIcvWwCzVQHDSOUpliH8xhJuEt05wo8l8
         3YGzzn/PmS86mVEWYFKxoyUB+c5pX+0vzc0KPQxR57eb+isSdiKoeDH1enqM+VbI8UgI
         wKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QnTd1s62MJgZqXXulrG8ZlZCHV/x77b9k0gFHvSAOaQ=;
        b=FOVZxZbFjjybwDRkloeuXZs9dG2OO5PP8PP8nqt7E3rZHVjZSoUOVkOaJSHw247LqK
         AZCx/qvtrCnuESqcwGZPY6j4UfFzLYMhi8H2XiKaRtOJBp1hULdbMXYr/8Dd7xFlO8XA
         801hICAWxQ5tIMfMmtAqvV8cRWDCC362cvsc+L2StUZOvrE4nuQ3EnDBhahCn1b3VLBP
         0DUU7iJ1X/0FfAJQdtOWPMvmJBrdn6eZ1TVLqXECr1LISjP6uEkDhO+otDx13/4aeySL
         4If5J9RDXx9SRj/IUeMHXyorDOmJj6/KREY5jlEsk13RDTxR91xPR7VCW0oAafqp5Ve0
         2Z+Q==
X-Gm-Message-State: AOAM533WczV/bWFVrye17Pt2CYZZFY6jDakjOaRi0WHTcKpsFm80A0ok
        9T5LcBg7aXBx9zeuwV+oUl1UNlzQinQ=
X-Google-Smtp-Source: ABdhPJxGLYyxUUt5w0JRkL6PR4X397EBl+yfbTO5fr+YWwXuSKpWP8HZSNJiTq4UZDADwIweoszMsA==
X-Received: by 2002:ac8:72d2:: with SMTP id o18mr1725964qtp.170.1627511795777;
        Wed, 28 Jul 2021 15:36:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m80sm712938qke.98.2021.07.28.15.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 15:36:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Armin Wolf <W_Armin@gmx.de>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
 <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
 <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
 <cac1b3ef-b51c-4514-cc7b-000b0d48ac8e@gmx.de>
 <938db8a5-3199-d468-5979-9978171bb138@roeck-us.net>
 <db21294b-48cf-65ad-77dd-494a779650dc@gmx.de>
 <20210728215433.yelg3y2ll7evnxba@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6c5b3e7f-777e-3e0b-67d7-f98171f96e3e@roeck-us.net>
Date:   Wed, 28 Jul 2021 15:36:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728215433.yelg3y2ll7evnxba@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/28/21 2:54 PM, Pali Rohár wrote:
> On Wednesday 28 July 2021 23:40:21 Armin Wolf wrote:
>> Am 28.07.21 um 23:37 schrieb Guenter Roeck:
>>> On 7/28/21 2:34 PM, Armin Wolf wrote:
>>>> Am 28.07.21 um 23:28 schrieb Guenter Roeck:
>>>>> On 7/28/21 2:19 PM, Armin Wolf wrote:
>>>>>> On 28.07.21 23:07 Guenter Roeck wrote:
>>>>>>> On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
>>>>>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>>>>>
>>>>>>>> This patch series is converting the dell-smm-hwmon driver
>>>>>>>> to the new hwmon registration API. In order to do so,
>>>>>>>> it introduces a platform device in the first patch, and
>>>>>>>> applies some optimisations in the next three patches.
>>>>>>>> The switch to the new hwmon registration API is done in
>>>>>>>> the next patch. The last patch is fixing a small bug.
>>>>>>>>
>>>>>>>> The caching of the fan/temp values was modified to better fit
>>>>>>>> the new hwmon API.
>>>>>>>>
>>>>>>>> The patches work fine for my Dell Latitude C600, but i whould
>>>>>>>> appreciate someone testing the code on another model too.
>>>>>>>>
>>>>>>>> Changes in v6:
>>>>>>>> - Make pwm1_enable permissions write-only
>>>>>>>
>>>>>>> Sorry, guess I am missing something. Why ?
>>>>>>>
>>>>>>> Guenter
>>>>>>>
>>>>>> pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
>>>>>> permissions where 0200.
>>>>>> In the v5 patch series however, the file permission where not 0200,
>>>>>> so i
>>>>>> changed that.
>>>>>>
>>>>>
>>>>> Is there a _reason_ for declaring this attribute write only, other than
>>>>> "it used to be that way" ?
>>>>>
>>>>> Guenter
>>>>
>>>> I dont think so, dell_smm_read will just return -EOPNOTSUPP if
>>>> someone tries to read pwm1_enable.
>>>>
>>>> Armin
>>>>
>>> That is not what I meant. Is there a reason to not report
>>> the current status of pwm1_enable to the user ? In other
>>> words, does the firmware not report its current status ?
>>>
>>> Guenter
>>
>> Pali said the driver cannot query the state of pwm1_enable from the BIOS, and with userspace tools being able to change
>> the state of BIOS fan control behind our back, we cannot simply return the last set value.
> 
> We have already discussed this problem years ago, see:
> https://lore.kernel.org/linux-hwmon/20160522152823.GA18331@roeck-us.net/
> 
> And also again this year:
> https://lore.kernel.org/linux-hwmon/20210528211037.2tnblovgb3rkcwnq@pali/
> 
> Basically there is no known firmware command to retrieve current status
> yet. And both userspace and SMM/firmware itself can change state. So
> kernel has no way how to retrieve current status and caching last value
> cannot be used (due to userspace and firmware can change it).
> 
> Whole SMM API is undocumented and seems that Dell does not want to
> provide any documentation for it.
> 
> I know that it is pity that we have no read functionality, but we have
> to deal with it...
> 
> Maybe it would make sense to add comment into driver code, why attribute
> is write-only...
> 
Yes, please.

Thanks,
Guenter
