Return-Path: <SRS0=Rliy=AT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AE7C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jul 2020 13:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BC7D20774
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jul 2020 13:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tbByARK6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgGHNdG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jul 2020 09:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729323AbgGHNdG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jul 2020 09:33:06 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECF0C061A0B
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2020 06:33:06 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gc9so1224060pjb.2
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2020 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UBrIH7k8Xe4j7IWdb2NXlTP016tiT62j76Ih+pU8f70=;
        b=tbByARK6wPSAN6lGWGkTeG+n5IeV+8R8WqpKC2LHOlDbpCEVvIQYPMWp0Pce8swFM0
         O/YIIS5x7ra+7KdpUrBm8ZPA/mOLh3U1KoIC58GRneX4lLD5tIUIQAAaX+yi9xVQSUAj
         xaPdE1lnoG01xZSAjA2EgXO2qsaYUjTN+dammb6DPoqpw4fCVozT7pcpYsUf/tf3ZimB
         EsG4CQJXknERIJWRUtho4Fyqz5iql/W8DZZrywRubC2cY7peabAjf1zY7sjRtA7YaKv2
         EInfVJTsOjMLJDv4OcjAjQFK8Cz5o8xONvYy12enMSM18ArO3jBEW9swKxXdkofqfuqD
         nguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UBrIH7k8Xe4j7IWdb2NXlTP016tiT62j76Ih+pU8f70=;
        b=SiLWFMDT4+Omo+5eH7gid/LdbxNdt5VnHeMWbjI04v3Ll5cTZXkxiFyCg5dAIApCqY
         XzGcIKhp3fLRgqUZxzF0yOigujSZD22nNbP4oaBD+z41FsuWNt+0G6il+u3BlSvxXTI4
         Iw/aEmiYxqiikQk5oUyuvKPoLMyPU6DEwXyQ9mz3ErYEsmVpmLJH7frE+6V0OFL3BoOD
         x1ySxnfMgpWy8Kpy0hGdiGzk4S00diZefv6tQW5e6GLHCYdFpp3A9M/6HiXr7Fg466Fx
         JfHGfl9DW/nBkP6vX5VyZ2L9tVZ5VIy71f16OvEoqvxgYkFJspqKqT+EBnr4TVy9i3XQ
         qrpA==
X-Gm-Message-State: AOAM532O4j32r5Nu8Vbgr1MD2mFDZzbHsiNzkcbWiuFeE6+pIDmzbx5s
        2qaLHk5K+UZZ3/DKGheC6fzp/2G1Jkg=
X-Google-Smtp-Source: ABdhPJz7nJv8otzwA46paQSduHLZsrwMOl6NNkTiq6aLKoggwLiaTKMScjNM/dKdjS0/e3WqyPY0AQ==
X-Received: by 2002:a17:90a:1a42:: with SMTP id 2mr9454402pjl.186.1594215185556;
        Wed, 08 Jul 2020 06:33:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e8sm25211886pff.185.2020.07.08.06.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 06:33:04 -0700 (PDT)
Subject: Re: Maximum rate value of input power for pmbus device
To:     zlukwins <zbigniew.lukwinski@linux.intel.com>
Cc:     jae.hyun.yoo@linux.intel.com, lukasz.tuz@intel.com,
        linux-hwmon@vger.kernel.org
References: <ddcb240a-5444-ba46-ecdf-70350d27125f@linux.intel.com>
 <20200629165950.GB113813@roeck-us.net>
 <808c2d5c-e0d9-572c-a002-2a87430702c7@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <0e806aa6-657d-e09b-6444-4ba430dc041f@roeck-us.net>
Date:   Wed, 8 Jul 2020 06:33:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <808c2d5c-e0d9-572c-a002-2a87430702c7@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/8/20 3:50 AM, zlukwins wrote:
> 
> On 6/29/20 6:59 PM, Guenter Roeck wrote:
>> +linux-hwmon@vger.kernel.org
>>
>> On Mon, Jun 29, 2020 at 08:31:11AM +0200, zlukwins wrote:
>>> Hi,
>>>
>>>
>>> I am OpenBMC FW developer working currently on some power measurement stuff.
>>>
>>> I would like to have maximum rated input power for pmubus device available
>>> in hwmon sysfs. This value is read by MFR_PIN_MAX command:
>>>
>>> /MFR_PIN_MAX//
>>> //The MFR_PIN_MIN command sets or retrieves the maximum rated value, in
>>> watts, of//
>>> //the input power./
>> Interesting typo in the PMBus specification. Yes, it really does associate
>> MFR_PIN_MIN - which doesn't seem to exist - with the maximum rated output
>> power.
>>> And I wondering which attribute shell be used to expose that value in sysfs.
>>> I went through documentation
>>> (https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface) and found
>>> the following:
>>>
>>> power[1-*]_max            Maximum power.
>>>                 Unit: microWatt
>>>                 RW
>>>
>>> But it looks like it is already occupied by PIN_OP_WARN_LIMIT.
>>>
>>> Maybe new attribute shall be used? If so how to call that?
>>>
>> None of the standard attributes reports (or is supposed to report) rated
>> values, so we can not just use any of those.
>>
>> Also, we can not just add a single attribute to handle this situation,
>> for the simple reason that there are many more similar attributes.
>> PMBus specifies (this is from version 1.3.1):
>>
>> MFR_VIN_MIN
>> MFR_VIN_MAX
>> MFR_IIN_MAX
>> MFR_PIN_MAX
>> MFR_VOUT_MIN
>> MFR_VOUT_MAX
>> MFR_IOUT_MAX
>> MFR_POUT_MAX
>> MFR_TAMBIENT_MAX
>> MFR_TAMBIENT_MIN
>> MFR_MAX_TEMP_{1,2.3}
>>
>> All those report rated values. I do see the need/desire for reporting such
>> information. The only real solution I can see is to add a new set of
>> attributes to the hwmon ABI. Something like:
>>
>>     currentX_rated_min    # for consistency
>>     currentX_rated_max
>>     inX_rated_min
>>     inX_rated_max
>>     powerX_rated_min    # for consistency
>>     powerX_rated_max
>>     tempX_rated_min
>>     tempX_rated_max
>> plus maybe, for consistency:
>>     humidityX_rated_min
>>     humidityX_rated_max
>>
>> Those would be read-only attributes.
>>
>> Thoughts, comments, feedback anyone ?
>>
>> Thanks,
>> Guenter
> 
> 
> I really like your proposition but I guess we need to wait few more days for the feedback.
> 
> But have some questions here.
> 
> What about potential next steps when we all agreed to follow that approach. Should documentation modification reach upstream repository first and then e.g. pmbus hwmon module implementation?
> 
We'll need a series of patches. One to amend the documentation, one to add
the necessary code to the hwmon core (so that the core supports it with
the _with_info API), one to add support to the PMBus core, and one each
to add support to affected drivers.

Once this is all complete, the lm-sensors package should be updated
as well.

Guenter
