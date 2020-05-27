Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9710C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 15:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5CF7208DB
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 15:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVVF756v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgE0PeC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 11:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgE0PeB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 11:34:01 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A5EC05BD1E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 08:34:01 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 23so11957724pfy.8
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ck/Ogqteywlz/IXzYraYFMsrnKFZKMcwRJ6vMoCFUgA=;
        b=nVVF756vd/5WfI92ZJBIqJ2FUn4q+GCXG8rJ0Yb8lpZyJV4c6AoehT2GolmTQT6VyY
         p3g2lWhP+vapN5oPQ+Cd18hTBSExaCTcHf48JenCgR3LHgHgjJjyj/Ms8YNkcoNaUxKL
         nLKKmASHZ7Bj4A7iBkousmI2aEmtkErCvMTcSx3xD3S2ca9MUbgvRP6OifEx8VrogHVP
         9b6lXpf3+zqHEWwvh+O180f4hpdaKx2rUBvOMD8a4IYUiXDK3d/wZ6yTjP3NLjQ+SLf7
         TZlK5mOzHWhoMLMVvV0N1iKQNz3uldrtb9Gz4AivHBkvJuybqUBT6KykMo/5Zry58Q40
         qV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ck/Ogqteywlz/IXzYraYFMsrnKFZKMcwRJ6vMoCFUgA=;
        b=rlhSFEKvRY7+zF2+18SFtV3von/iCq1ABxQMtFd37K6mO6frqAU/w9sjSliEPUlZtp
         BL2flaRoXWSBuoWVouMOmAQAm9ehTGByn8Q5IyDF73ZpA2RXeqS9fQzfo/aWpgPvY0iU
         TcjJm5LJUaVkBakB/6ogcT8IInIJmQVAIoezwrbmr2KV7oJ0PAOukK2eGuWs90uQ8BZG
         5N60UVL5jU9JxMfJgqc8Oe1ymD0fEbeUxKQYWy+cPfXs2+V+Bu1GmUfZug1mj/OnFoid
         rthmn1Qlk8/LMxoHPtSStlUTapks5DbNc89jx6HHHydTWI19tFWsiPr7KGq+hvyjNyAC
         xkWA==
X-Gm-Message-State: AOAM530vl4Df8NSwTSGcKZCbX05QLnRQFpt9y991LNhFlZsgMhCThyEX
        KzQjkMuxm2LjGR8y1MGEP9heeUm2
X-Google-Smtp-Source: ABdhPJwzNJXBeK8CPT3vGWlMZ7sighvaOy2pKQLNkN5IxZ+LEBPco6dSJXXp5Ck39W8h/Dp0xFBV4Q==
X-Received: by 2002:a63:541c:: with SMTP id i28mr4733787pgb.344.1590593640879;
        Wed, 27 May 2020 08:34:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cx11sm2984899pjb.36.2020.05.27.08.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 08:34:00 -0700 (PDT)
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
To:     Alexander Monakov <amonakov@ispras.ru>
Cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200519155011.56184-1-nchatrad@amd.com>
 <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
 <20200527144838.GA209591@roeck-us.net>
 <alpine.LNX.2.20.13.2005271755070.18802@monopod.intra.ispras.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <01990ace-a66a-2ada-5c97-a47a57bc90de@roeck-us.net>
Date:   Wed, 27 May 2020 08:33:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.20.13.2005271755070.18802@monopod.intra.ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/27/20 8:12 AM, Alexander Monakov wrote:
> On Wed, 27 May 2020, Guenter Roeck wrote:
> 
>>> I'm not exactly complaining, I'm proposing a solution: at probe time, populate
>>> prev_value members with MSR values instead of zeros. That way, the module will
>>> correctly count energy over the time it's been loaded. It can be unloaded and
>>> reloaded freely, and doing so would allow to easily measure energy across large
>>> spans of time, which sounds like an improvement.
>>>
>> That would ignore energy accumulated from before the driver was loaded, and
>> would thus trigger another set of complaints.
> 
> That doesn't sound right. There's no way for the driver to be sure that the
> counters did not wrap around before it was loaded. Here's a few scenarios
> how such wraparound is possible:
> 
> - while the user was messing in the bootloader for a few minutes
> - if the user kexec'd a new kernel
> - if the counters were not reset during a warm reboot
> 
> Ignoring initial values of the counters is generally the right thing to do.
> In the specific circumstances when the user wants to measure energy used
> since machine power-up, and they know the boot happened so quick the counters
> did not wrap around, they can easily script that with e.g. the rdmsr tool.
> Or perhaps the driver could pr_info the initial values at probe time.
> 
> Have such complaints already appeared in practice?
>
The main argument in the coretemp case, if I recall correctly, was that
the driver _doesn't_ provide valid data from the beginning of time, and
would thus be worthless. So, yes, such complaints have already appeared
in practice.

> Also note that documentation doesn't promise that counters start from zero
> at power-up time, although that's of course a natural assumption.
> 
> 
>> A slight improvement might be to add up core energy counters when loading
>> the driver, compare it against the package counter, and pick the larger
>> value for the initial package counter(s). This would at least ensure that
>> the package counter is never less than the sum of the core counters.
> 
> No, fudging the initial reading like this wouldn't help, because I was
> pointing out how core counters increment quicker than the package counter;
> i.e. even if the kernel fudged the initial values, they would still grow
> contradictory quick enough (on some workloads).
> 

This exchange is exactly what I was concerned about when this driver
was first submitted. I should have known better, and I should not
have accepted it. Right now I seriously wonder if I should revert/drop
it. Any arguments/thoughts why I _shouldn't_ do that ?

Guenter
