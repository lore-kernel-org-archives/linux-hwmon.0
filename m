Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC99C7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 21:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 376E421955
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 21:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0f/9h5u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbfGVVJX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 17:09:23 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44452 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfGVVJW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 17:09:22 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so10712841lfm.11
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m0M7o4x94NP0B9I0damndrL3Vb9rKV9V5EZtEO00rHU=;
        b=B0f/9h5uI5vDGTIlOKSoNwwMpau4XVI/reXUsaO1wRPKb1+EmJiE/y2C9tkt+FQcUK
         GiJQV9r3QM62e2AFHOiC0LVa5F8HkIF0WZQXNuzdDpoAC3u1laA3pW9PrBG74y4jA6j9
         DrwLmALNj9Sjy228EQYJ0UgCmQxAmXrtvgXx9gkgtYTZNuqYnTMqyTSwmog+n7WB7/OE
         rLwmKmPjti90FfQFq8mqyTDTAdas/tsodhRhNTCLBk7btlp4jSjMxF/i9JdnLtOGB15e
         uhO83QxfEofEW09+pwSiCHybSanlbbkxubpjwhfUebWOXljSTLZ4fIH1eAsJSv8NGIfW
         KXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m0M7o4x94NP0B9I0damndrL3Vb9rKV9V5EZtEO00rHU=;
        b=c5OwD0nRZWsIO4iDknKVUalfHzTf0nKZ4OTinzg15ZkGUZmn4XpcB8Oknf2nwxrG4o
         IotYTATG3JtQv87nXLc6IgJigk98OjHLMh30592/+I7Y4rh34V433TmQl/5U8YTIh8xo
         vJlH5lhAawIDEKaxz0uSXcVMzLE3SXKPLuPNg29KBMzWiifaSf++XeF6RdDlEeqdq6SW
         WLPsjcGRg7vD598Duyz3Jp6XqIs1bKdUxA7glamq6rtazAs6ACJR3arL2Shi1NLP/nOA
         goUzXWDY5dZtmq9ZOsvE6zcGTzIu5rTDLzqTmlbo2pervFKt72v2KzvibGlMwlkVoBtu
         f5tQ==
X-Gm-Message-State: APjAAAUdwJbkKLsuTMJqX2yzY7coNhseP4cmV6I+e3qb8MT0G10kMQPS
        cz+TL3liFDrUdQBDv6Ug3ZuvPGRZbOg=
X-Google-Smtp-Source: APXvYqxJfR+EeG8dsGG4PlCuGcEjqsQmtSr/nSSZrgKgxxrFG7gh4IvtJT+AZrDwJYQfDfd3u6+MRQ==
X-Received: by 2002:a05:6512:70:: with SMTP id i16mr32252040lfo.26.1563829760194;
        Mon, 22 Jul 2019 14:09:20 -0700 (PDT)
Received: from [192.168.0.100] (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id u18sm6113577lfe.65.2019.07.22.14.09.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 14:09:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
To:     Vicki Pfau <vi@endrift.com>
Cc:     "Woods, Brian" <Brian.Woods@amd.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
 <20190722091245.GA23240@nazgul.tnic> <20190722160420.GA16162@amd.com>
 <20190722165105.GA9336@roeck-us.net> <20190722173928.GA16597@amd.com>
 <5be62ebf-0930-3ea5-6e0c-936e21450725@gmail.com>
 <9E38F05F-8906-42F8-AB63-EEF2F2DBAD57@endrift.com>
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Message-ID: <5da85f6d-e886-6af8-527c-e5edd9420825@gmail.com>
Date:   Tue, 23 Jul 2019 00:09:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9E38F05F-8906-42F8-AB63-EEF2F2DBAD57@endrift.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 22/07/2019 21:11, Vicki Pfau wrote:
> I'm getting similar variance. Compiling Linux seems to spike the temperature above 70, even with a new CPU cooler, so I'm wondering if there might be an offset I'm missing. It may just be the fan being too slow (going to be reconfiguring the BIOS settings today).

Thanks for the information! Compiling the kernel gets me to 83°C with
the stock fan (Ryzen 3700X), and I think I get thermally throttled at
this point.

> 
> The reason I haven't replied sooner is because I've been busy with a new job, and I wasn't sure if my phone would send a properly (un)formatted email. 

I see! No worries, and good luck with your new job!

> I'm fine with whosever patch gets in, so long as temperature reading works on my machine.

Given that our patches were looking exactly the same, it's safe to
assume it will be fine.

> 
> Also, for what it's worth, I'm not a "he". Vicki is generally a female name.

I did not know this. Sorry for assuming your gender, and thanks for
correcting me!

Marcel

> 
> Vicki
> 
>>> On Jul 22, 2019, at 11:04 AM, Marcel Bocu <marcel.p.bocu@gmail.com> wrote:
>>>
>>>> On 22/07/2019 20:39, Woods, Brian wrote:
>>>> On Mon, Jul 22, 2019 at 09:51:05AM -0700, Guenter Roeck wrote:
>>>>
>>>> With 3900X, and the series applied, I get:
>>>>
>>>> k10temp-pci-00c3
>>>> Adapter: PCI adapter
>>>> Tdie:         +45.1°C  (high = +70.0°C)
>>>> Tctl:         +45.1°C  
>>>>
>>>> which looks about right.
>>>>
>>>> Interesting, though. I thought there are two CPU dies on this chip.
>>>> I guess the temperature sensor is on the IO block ? If so, are there
>>>> additional sensors on the CPU dies ?
>>>>
>>>> Guenter
>>>
>>> That's good to know.  Thanks for testing it.
>>>
>>> What happens is the IOD takes the max temperature of the chiplets in the
>>> package and presents that as the temperature of the package.  It works
>>> the same way as it does in Rome (server parts).  For better or worse,
>>> you just get the max temperature of the chiplets rather than the
>>> temperatures of the individual chiplets.
>>
>> Out of curiosity, is it the maximum temperature of all chiplets, or just
>> the non-powergated ones? Because this might explain why I get so much
>> variance in the idle temperature (40 <-> 50°C in a matter of a second
>> with a mostly-idle processor). This variance is visible on linux, but
>> not at all on the firmware's configuration interface.
>>
>> One other option would be the stock fan not being tight-enough... but
>> apparently quite a few people have the issue. I'll try tightening it!
>>
>> Marcel
> 

