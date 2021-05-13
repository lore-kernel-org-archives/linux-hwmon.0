Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64F3C43460
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 16:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBB426143C
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 16:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhEMQyu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 12:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhEMQyr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 12:54:47 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE1BC061756
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 09:53:31 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id f18so4273135qko.7
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 09:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F7qPnOQyhVAUhlQXgdrcGjLbelQBJb394nj+qWeAX7M=;
        b=mKC3jtpXF0W/9LrZlbNkxT7SDJiduWmlhotVkWvbjI8Awj+2EhLPL37mGdRS00Ssk2
         UsrmVy9iU5e/fpU1/Ox6QbpMFBBgDoNt0+iG+7emeZBlY0iZ1JyUR0+RYk+yoZigH2GQ
         2dccxV1oDiuHfTPCgFXZE1o9qFxh8rjppWTJcFbYjBoMeyFa9gjwBMCbA/bmhX8xEjg/
         PLO8W//yw6WBF/4REU+XwjcGntD/S6VURHAcSYNMJa0/Xlm7JdSL0M1WQ4FOtlba6CS2
         Vgq+xY4mXn5107Gfn+eJ7uympHdMOl4WkamGZFCKm/ugPPc0U1uR9/0bFeYdraaPOWTv
         gEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F7qPnOQyhVAUhlQXgdrcGjLbelQBJb394nj+qWeAX7M=;
        b=O3StMwcjlcm3oX+qwQ2RWPBNQSVQATXV6aQRaJf1Ob43/DInFlqRfCCr0gKvmhsGai
         6pgXIBarWXhUj14Pa31rCPh5rrupkVySuS6F3/R4KRDo6e51HnPKixa6yAiavtE4lYj0
         CxYUFt1wXVvclFPegNyy6wT/o1xU0mPW3Ko69lsrApLdFuZf7ulIJTnY3H2m8Ts5shxs
         eo3INc7g6mH3DLDVL38Bwi53UPn9FnGl24X2IW0JmQtYomOF4Po2c8JjMakDyM6Se1Wg
         BqPmr68psa8ynQ+pp3yhyi6pBlhrKfwJ7bHTGriU6672tVGe4Vw9iLPacV1dt6XfiHJF
         TPJA==
X-Gm-Message-State: AOAM531lrvnyMZyvMpcJzwAwkIKA/OSJr3SSHEC3OPteSHGNCSV3T7vA
        nft0hvRLy0KdecPFcFjpd/8=
X-Google-Smtp-Source: ABdhPJypyiEHwg+kwPVlF4bdtoPmpFQL6uO9orZ0p8ijLWoNSdeq69xnc8sxigRTpWKrS0i8DUEjiw==
X-Received: by 2002:a37:2cc3:: with SMTP id s186mr20443556qkh.500.1620924810298;
        Thu, 13 May 2021 09:53:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f132sm2916498qke.104.2021.05.13.09.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 09:53:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, W_Armin@gmx.de
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <20210513154546.12430-1-W_Armin@gmx.de>
 <20210513164838.eacakojhvtb2se2e@pali>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e333b7e2-4bb7-1be2-5d26-4b60e6463d7c@roeck-us.net>
Date:   Thu, 13 May 2021 09:53:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513164838.eacakojhvtb2se2e@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/13/21 9:48 AM, Pali Rohár wrote:
> On Thursday 13 May 2021 17:45:46 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> When support for up to 10 temp sensors and for disabling automatic BIOS
>> fan control was added, noone updated the index values used for
>> disallowing fan support and fan type calls.
>> Fix those values.
> 
> Do you mean this change, right?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1bb46a20e73b0bb3364cff3839c9f716ed327770
> 
> Yes, it looks like that it should have been part of that change.
> 
> Therefore I suggest to add Fixes tag:
> 
> Fixes: 1bb46a20e73b ("hwmon: (dell-smm) Support up to 10 temp sensors")
> 
> Otherwise looks good!
> 
> Reviewed-by: Pali Rohár <pali@kernel.org>
> 
> For future development I would suggest to rewrite/drop these magic
> numbers as same problem can be easily repeated in future.
> 

The best solution would be to rewrite the driver to use
hwmon_device_register_with_info(), but that should be done
by someone with access to the hardware.

Guenter

>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> Tested on a Dell Latitude C600.
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
>> index 2970892bed82..f2221ca0aa7b 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] = {
>>   static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>>   			      int index)
>>   {
>> -	if (disallow_fan_support && index >= 8)
>> +	if (disallow_fan_support && index >= 20)
>>   		return 0;
>>   	if (disallow_fan_type_call &&
>> -	    (index == 9 || index == 12 || index == 15))
>> +	    (index == 21 || index == 25 || index == 28))
>>   		return 0;
>>   	if (index >= 0 && index <= 1 &&
>>   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
>> --
>> 2.20.1
>>

