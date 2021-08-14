Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5508CC4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C23C60EB4
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238712AbhHNPdE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 11:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbhHNPdD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 11:33:03 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F1EC061764
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 08:32:35 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso15647813oth.12
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I78zOp5j5papwoW5nZcvdTEHWpspXX951olOx8ZEEBM=;
        b=i5LMsIP10/5m4ErLYMC+w5+lLO+2Byvzg0xOw1rQFRfvHeMEUrGzqYpqUV4bO9ISXO
         mm7zhuhJColmTBEvEjicLzUjLzCC7qcNuhZIMolrQTEcl4IXIYSmepd8jIVQHQ0jSSE7
         4jmEcPruMLz2/geQNoSTwq1DHqEsUKKXswMZaQ1bO9vc1Z/n83QreW8d02P0ImgaukyE
         F15rZkxMBQJ0w2z+x4hTq1k6jAA8eCwkZofDM2EHjI1yO83UvhtAt8nt1ktTXHpRDjpQ
         pL00zz3Y36RFNNKkoCI6t+gjgBhSgzKxCN88oyLuRKWvc/cYyx5B878tEIVC8sGPFhCl
         QB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I78zOp5j5papwoW5nZcvdTEHWpspXX951olOx8ZEEBM=;
        b=Sx7UWKIuelPAQku3y0/RbhK+yYJFH0/9Bngj2uSGNQoeYwvcW6BIqNSZeiUwk9S1cf
         opl1KwOO6w43P90MQyvYhDuqm89vISrzpHR9yD+XaVlHXnpowcoiFRplclxn4Kw94hCI
         evwtCY+a5yIOonUl5PgyYL8QHA0aJ80pQ2eZJDr54byrEXVL8OKzJbtMmIiYprvzq/DN
         WnGtywYIhYP5SuiSBIt/i6t6gKoh5Q/IAU0k9MUlSP7oJCnnCcsEFovOu+vZkiqV/yhM
         fOFrsifa1kIt8sMS/eQ8scFERntv+PAWRkFluaBXmL/XroBEK9MWfoe/rs8MadNZ1tlp
         f+vw==
X-Gm-Message-State: AOAM532BDLzuvBx2Mg25c+JOthalMsJBIm/7zC07E0/m4TZcRYu4on2b
        W549XWAh+2YCawEg7GPboLPEp1KztHc=
X-Google-Smtp-Source: ABdhPJzl9GJESr38Ji0waskPag9iLiDZXfL0Nqq3hn38yrxwNvdhCt24FR6Ym1c6t8mMv87xCIo6xw==
X-Received: by 2002:a9d:7189:: with SMTP id o9mr6255963otj.232.1628955154541;
        Sat, 14 Aug 2021 08:32:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m16sm942871oop.3.2021.08.14.08.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 08:32:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/4] hwmon: (dell-smm) Enable automatic fan speed control
 for all channels
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-4-W_Armin@gmx.de>
 <20210814151309.wyclfsylkvr2i6tm@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0d8c6cc6-f65c-e154-3672-016c6a79c4a0@roeck-us.net>
Date:   Sat, 14 Aug 2021 08:32:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814151309.wyclfsylkvr2i6tm@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/14/21 8:13 AM, Pali Rohár wrote:
> On Saturday 14 August 2021 16:36:36 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> Add automatic fan speed control for the remaining two pwm channels
>> since the pwmX_enable setting affects all pwm channels.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> 
> This behavior was already rejected by Guenter:
> https://lore.kernel.org/linux-hwmon/3a10f96a-06e1-39f4-74a6-908d25b1f496@roeck-us.net/
> 
> "Having three attributes do all the same is not very valuable.
> I would suggest to stick with pwm1_enable and document that it applies
> to all pwm channels."
> 

Yes. In situations like this I normally I suggest to have one read-write
attribute and have the others as read-only. However, that doesn't work here
because the attribute is write-only. Having more than one really doesn't
add value.

Guenter

>> ---
>>   Documentation/hwmon/dell-smm-hwmon.rst | 14 +++++++-------
>>   drivers/hwmon/dell-smm-hwmon.c         |  4 ++--
>>   2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
>> index 3bf77a5df995..57b30fc9d03a 100644
>> --- a/Documentation/hwmon/dell-smm-hwmon.rst
>> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
>> @@ -35,7 +35,7 @@ Name				Perm	Description
>>   fan[1-3]_input                  RO      Fan speed in RPM.
>>   fan[1-3]_label                  RO      Fan label.
>>   pwm[1-3]                        RW      Control the fan PWM duty-cycle.
>> -pwm1_enable                     WO      Enable or disable automatic BIOS fan
>> +pwm[1-3]_enable                 WO      Enable or disable automatic BIOS fan
>>                                           control (not supported on all laptops,
>>                                           see below for details).
>>   temp[1-10]_input                RO      Temperature reading in milli-degrees
>> @@ -52,13 +52,13 @@ overwritten.
>>
>>   There is experimental support for disabling automatic BIOS fan
>>   control, at least on laptops where the corresponding SMM command is
>> -known, by writing the value ``1`` in the attribute ``pwm1_enable``
>> -(writing ``2`` enables automatic BIOS control again). Even if you have
>> +known, by writing the value ``1`` in the attribute ``pwm[1-3]_enable``
>> +(writing ``2`` enables automatic BIOS control again). If you have
>>   more than one fan, all of them are set to either enabled or disabled
>> -automatic fan control at the same time and, notwithstanding the name,
>> -``pwm1_enable`` sets automatic control for all fans.
>> +automatic fan control at the same time so ``pwm[1-3]_enable``
>> +sets automatic fan control for **all** fans.
>>
>> -If ``pwm1_enable`` is not available, then it means that SMM codes for
>> +If ``pwm[1-3]_enable`` is not available, then it means that SMM codes for
>>   enabling and disabling automatic BIOS fan control are not whitelisted
>>   for your hardware. It is possible that codes that work for other
>>   laptops actually work for yours as well, or that you have to discover
>> @@ -67,7 +67,7 @@ new codes.
>>   Check the list ``i8k_whitelist_fan_control`` in file
>>   ``drivers/hwmon/dell-smm-hwmon.c`` in the kernel tree: as a first
>>   attempt you can try to add your machine and use an already-known code
>> -pair. If, after recompiling the kernel, you see that ``pwm1_enable``
>> +pair. If, after recompiling the kernel, you see that ``pwm[1-3]_enable``
>>   is present and works (i.e., you can manually control the fan speed),
>>   then please submit your finding as a kernel patch, so that other users
>>   can benefit from it. Please see
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 3aa09c1e4b1d..0e229e3dae33 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -898,8 +898,8 @@ static const struct hwmon_channel_info *dell_smm_info[] = {
>>   			   ),
>>   	HWMON_CHANNEL_INFO(pwm,
>>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> -			   HWMON_PWM_INPUT,
>> -			   HWMON_PWM_INPUT
>> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE
>>   			   ),
>>   	NULL
>>   };
>> --
>> 2.20.1
>>

