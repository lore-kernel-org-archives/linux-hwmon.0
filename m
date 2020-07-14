Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D99AC433E1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 21:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EAFC20658
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 21:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tftDNSia"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgGNV3b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 17:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgGNV3b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 17:29:31 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D15C061755
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 14:29:31 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m16so6409727pls.5
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 14:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IXB7L4fIqx3iSxSr5ibLbMrK8BhmlklRoDv/5j4Mexw=;
        b=tftDNSiaVZrrui5ubU9idkCzgd5TMfA+j+loluWFrnyAx8CNdvbYwQdg8aef3eYqOV
         ZWGS/PkbPSXG44nz5fQ5CJ2VE+2DQYgNMVagpl2Wm6yg92EVATnYf3y0B1JojGAhVIFh
         sbN/WKiBkqqTmvD+H7i10kQT0gCXN2Bl9AVhgcNNhE3FtEbAtcgpmqlfF4UcQKkL5ZLg
         3Wp9umPBGxvMBvdLiEKQIWMIiNMlmxtF3HX4+/Dp+L5C22rAnpG1Kin7kQanwzRCttd4
         jFFeRrM6rM9bfyYxLrIHJGpE6KxFk/A3L+YLE3ujOQVD3iIYO6D/mKlNlrqri1vGOnqw
         buCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IXB7L4fIqx3iSxSr5ibLbMrK8BhmlklRoDv/5j4Mexw=;
        b=VXpsx0qwzLcAI96Z0/ZpFUg2fdZz1jfrQiX+1PWCPuqIyAL0GFx7XOTse+ssGxTnJ4
         oTMaDw7tvw5wWmumdiA+aKNb7wA5n3C7+AaC2aHyMc0Vyy5OONdfh+1rP9fj6d4xRWCa
         xdhl44WfH1O13yzFk2qGisd4hm0k8vbgt1FIdHArRhTePOqDeSKFjP94KKmv1tGvWDmL
         pF2pPnm/0dtIrIKNCIL6O4/rCtGiSFy1GgclT8qpoyWYtRQ79QysmsGH3y5foP4tHVDF
         eSs+sLQDcj99l3jt0PdA32H2DvZrN13Lq9jSIOxeMk2Lyn4romt8u4U0GJ1tKO0b6+Vj
         4l4Q==
X-Gm-Message-State: AOAM530iMC9eMtCLVvdemERtJEGrfUY/cWkHsBQTSrWDtiBEZOoXMYhE
        um2bww1+VNjR4vH473Ijb5vZ5JAGvpg=
X-Google-Smtp-Source: ABdhPJz5e5AWwS9XFHu4s4JlRs1RkN5WOglMt6SABBcExud71ZcTq0fbaRzYuix4h9uRvT/ZmcCLWQ==
X-Received: by 2002:a17:90b:188d:: with SMTP id mn13mr475474pjb.229.1594762170616;
        Tue, 14 Jul 2020 14:29:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g22sm65976pgb.82.2020.07.14.14.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 14:29:29 -0700 (PDT)
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error for
 NCT6798D
To:     Stefan Dietrich <roots@gmx.de>
Cc:     linux-hwmon@vger.kernel.org
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
 <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
 <48f415c34f4ca3f5239650711daaf1e11342da8e.camel@gmx.de>
 <d54732db-255c-54be-ab43-997369e0da87@roeck-us.net>
 <e02ef4f8633e035ecf6019abb72e3a22bfc29732.camel@gmx.de>
 <20200712224620.GA19097@roeck-us.net>
 <119b8c4d3791bafae015f1643b4fba9114d3eb65.camel@gmx.de>
 <2569643c-d050-1663-7da7-641211618aee@roeck-us.net>
 <52295e37be06909c6bfe22ba43e287a8a7764280.camel@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7998284b-39d6-102e-054d-1ba66155f162@roeck-us.net>
Date:   Tue, 14 Jul 2020 14:29:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <52295e37be06909c6bfe22ba43e287a8a7764280.camel@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/14/20 10:19 AM, Stefan Dietrich wrote:
> On Mon, 2020-07-13 at 22:18 -0700, Guenter Roeck wrote:
>> On 7/13/20 10:40 AM, Stefan Dietrich wrote:
>>> On Sun, 2020-07-12 at 15:46 -0700, Guenter Roeck wrote:
>>>> On Sun, Jul 12, 2020 at 09:51:42AM +0200, Stefan Dietrich wrote:
>>>>> On Sun, 2020-07-05 at 07:21 -0700, Guenter Roeck wrote:
>>>> [ ... ]
>>>>> Would you mind giving me a pointer on how this would be done? I
>>>>> assume
>>>>> for those familiar with the driver it will be less than a
>>>>> handful
>>>>> of
>>>>> lines of code?!
>>>>> I will certainly report back as soon as I have obtained any
>>>>> results.
>>>>
>>>> Something like the diffs below should do. Caution - this is cut-
>>>> and-
>>>> paste,
>>>> so you'll have to make the changes manually.
>>>>
>>>> Guenter
>>>>
>>>> ---
>>>> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>>>> index 7efa6bfef060..ec427ce503f0 100644
>>>> --- a/drivers/hwmon/nct6775.c
>>>> +++ b/drivers/hwmon/nct6775.c
>>>> @@ -786,9 +786,9 @@ static const char *const nct6798_temp_label[]
>>>> = {
>>>>         "Agent1 Dimm1",
>>>>         "BYTE_TEMP0",
>>>>         "BYTE_TEMP1",
>>>> -       "",
>>>> -       "",
>>>> -       "",
>>>> +       "Unknown28",
>>>> +       "Unknown29",
>>>> +       "Unknown30",
>>>>         "Virtual_TEMP"
>>>>  };
>>>
>>> Dankeschoen - I just tried that, but I'm still getting
>>>
>>> [  324.901595] nct6775 nct6775.656: Invalid temperature source 28
>>> at
>>> index 0, source register 0x100, temp register 0x73
>>> [  324.901637] nct6775 nct6775.656: Invalid temperature source 28
>>> at
>>> index 1, source register 0x200, temp register 0x75
>>> [  324.901679] nct6775 nct6775.656: Invalid temperature source 28
>>> at
>>> index 2, source register 0x300, temp register 0x77
>>> [  324.901722] nct6775 nct6775.656: Invalid temperature source 28
>>> at
>>> index 3, source register 0x800, temp register 0x79
>>> [  324.901765] nct6775 nct6775.656: Invalid temperature source 28
>>> at
>>> index 4, source register 0x900, temp register 0x7b
>>> [  324.901807] nct6775 nct6775.656: Invalid temperature source 28
>>> at
>>> index 5, source register 0xa00, temp register 0x7d
>>>
>>> I double checked that it really is the modified driver that is
>>> loaded.
>>> Now does that mean the diffs did not do the trick, or that there's
>>> really nothing to see here?
>>>
>>
>> I forgot: Also change NCT6798_TEMP_MASK to 0xffff0ffe.
> 
> The error messages are gone and sensors now shows a value for source
> Unknown28. However, I did not figure out which component's temperature
> it corresponds to. It is definitely not one of the three 2-pin
> temperature sensor headers on the mainboard, as I swapped external temp
> sensors on these without impact on the reported value. The shown value
> is in the range of the CPU core temperatures (that is, somewhere
> between roughly 30 and 80°C) and varies with 0.5°C resolution.

On NCT6797D, it is "PECI Agent 0 Calibration", or in other words the
CPU temperature. Presumably it is the same here, only undocumented.
I'll change the driver accordingly.

Thanks,
Guenter
