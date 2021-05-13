Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2C5C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 18:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F329613DE
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 18:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhEMSty (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 14:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhEMStw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 14:49:52 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6230C06174A
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 11:48:41 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id v8so8545271qkv.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 11:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RukPXAbnuECAl0R4qIJh3Mrm0DcvjaTcHUUwv3VQLoE=;
        b=hGl/ajiddJ6JTI+9UXvQX4NN2m2BYFYwmUraFeKMM2WkEVvt6VOXOXSYz2C7aqkEVV
         pME/X77kJE5BGIhhQ6AWpjd9FdR/37s7kWRPu88f5S8Vyc2yz7rvil4s0DmYaKiheCXo
         Hvo3Mg5crDCiOT0BN8Ox6HRbHgPlvwdfdxbTJafeiwxjHmEMFukBDr5H7pGSqJ0y2kHB
         sJMKruG5X/Jv+YLIL1NRphjGxuoOMEUchDue87gf+8DfmtkPX9aUbt6Qw9f4EAw3+GnK
         VH4BR6YJ3m5upePMQ0GplaLYqmC3CHpnLSz0AAi1uCAqJ5NgA2vC/T+L6OWgY2e1IaPs
         fCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RukPXAbnuECAl0R4qIJh3Mrm0DcvjaTcHUUwv3VQLoE=;
        b=ssSTziaDEh1sWWUNSb+7lM4cInnW7AEasnMNg27oSlKA0FPW9D8Zjl/ZQv0Sx2VEb/
         pL8X4X0JV5T4Ae41T7+f81gGKi9FCRW02UAVdxwhAPcdejRx8cUfx7w0FNqz6fDnW8CX
         GmePODSQtfjhvW9f9lZECwKY5UaNuQ7I1zMEu2O/qeGTujVY3mPx1jiAerkAX3Zoa9sm
         c3IJv6QcvZzvg87t52zT+m0vVMMKWVn4ZnlVZzdu6N44uEV4Hxvqfcq03hPDXVhiMFYs
         D7qsSqvtxUKaQuPwWpQx1E12vVmkbC5czK5OszNsoACUVneKLAbIsPTmVpqRXhEDS+C6
         YZJQ==
X-Gm-Message-State: AOAM532W4EmOJFYl7BiJbnlU327sh2wFB3JMzliF40He8pTANg6RtqVS
        ckOF1mwRJw5URdSrV3lOAkE=
X-Google-Smtp-Source: ABdhPJyYAGif+x6M7Nzikh2SIUHVlEOc+elMaB793pBzSFo1TOQyXgZlrA5c45fc0jCjoS5kmcOR8g==
X-Received: by 2002:a05:620a:672:: with SMTP id a18mr40519045qkh.187.1620931720848;
        Thu, 13 May 2021 11:48:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r16sm2992647qtx.36.2021.05.13.11.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 11:48:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
To:     Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <20210513154546.12430-1-W_Armin@gmx.de>
 <20210513164838.eacakojhvtb2se2e@pali>
 <e333b7e2-4bb7-1be2-5d26-4b60e6463d7c@roeck-us.net>
 <60d82aa4-3f44-d10d-8db5-3d6a30f25945@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b2d8e0b1-0a82-9572-db46-acabc3676924@roeck-us.net>
Date:   Thu, 13 May 2021 11:48:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60d82aa4-3f44-d10d-8db5-3d6a30f25945@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/13/21 11:41 AM, Armin Wolf wrote:
> On 13.05.21 18:53 Guenter Roeck wrote:
>> On 5/13/21 9:48 AM, Pali Rohár wrote:
>>> On Thursday 13 May 2021 17:45:46 W_Armin@gmx.de wrote:
>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>
>>>> When support for up to 10 temp sensors and for disabling automatic BIOS
>>>> fan control was added, noone updated the index values used for
>>>> disallowing fan support and fan type calls.
>>>> Fix those values.
>>>
>>> Do you mean this change, right?
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1bb46a20e73b0bb3364cff3839c9f716ed327770
>>>
>>>
>>> Yes, it looks like that it should have been part of that change.
>>>
>>> Therefore I suggest to add Fixes tag:
>>>
>>> Fixes: 1bb46a20e73b ("hwmon: (dell-smm) Support up to 10 temp sensors")
>>>
>>> Otherwise looks good!
>>>
>>> Reviewed-by: Pali Rohár <pali@kernel.org>
>>>
>>> For future development I would suggest to rewrite/drop these magic
>>> numbers as same problem can be easily repeated in future.
>>>
>>
>> The best solution would be to rewrite the driver to use
>> hwmon_device_register_with_info(), but that should be done
>> by someone with access to the hardware.
>>
>> Guenter
> Im currently doing exactly that, since i have an old dell notebook. But
> that might take some time.

Excellent, thanks!

Guenter

>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>> Tested on a Dell Latitude C600.
>>>> ---
>>>>   drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>>> b/drivers/hwmon/dell-smm-hwmon.c
>>>> index 2970892bed82..f2221ca0aa7b 100644
>>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>>> @@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] = {
>>>>   static umode_t i8k_is_visible(struct kobject *kobj, struct
>>>> attribute *attr,
>>>>                     int index)
>>>>   {
>>>> -    if (disallow_fan_support && index >= 8)
>>>> +    if (disallow_fan_support && index >= 20)
>>>>           return 0;
>>>>       if (disallow_fan_type_call &&
>>>> -        (index == 9 || index == 12 || index == 15))
>>>> +        (index == 21 || index == 25 || index == 28))
>>>>           return 0;
>>>>       if (index >= 0 && index <= 1 &&
>>>>           !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
>>>> -- 
>>>> 2.20.1
>>>>
>>
> 

