Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1E4C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 15:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 229002084C
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 15:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY6XRMNC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389415AbgE0PPs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 11:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388922AbgE0PPr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 11:15:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6A2C05BD1E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 08:15:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u5so11894677pgn.5
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 08:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FSWyCMOHIuib4UH4gwcmYaYCT0xCECVjXeQ3ABzK46Y=;
        b=gY6XRMNCLSjU/vpS6D6nRDzJQ/MREIlQFFEMVmy70qkOQ2i5ysWQ7Ts2TYvY/DdoHQ
         azADARGHDjz5z3AnPnN4parXg5eTHp/0qSLuLUjbojHLSpll4ddWmJqfaV9WGwAxlP4D
         PUHB5T0aTPsf6JEi49C0g0YjCHQFe4iErpC4VINZfZihrki7OHYmq3hPLiaVvk/2SRac
         eNrcMX8tw3Me6v9ErDd1GnbCd8a1qzkCTPNkvkgyeU1hjyhAIS3sOmTi22+aV0cPDVCl
         oRk4yOtzVy8vrvVcIKqn59z+j624JF33WeX+B/eNGd7pF2Sswh4wiAd4hoQPR2Zsdn0J
         mCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FSWyCMOHIuib4UH4gwcmYaYCT0xCECVjXeQ3ABzK46Y=;
        b=LxljV4ovzkVvY1o9IQZNgNoIOB7Fi64nNabEMQUwscTBKRYlHUQiQIL+AzLzsTnSSl
         X9hw+hgXmr7g06d2egdynN2U2sU1BZTukdErFrOj7eu2YfHlyA4Jzy6YWlcJjF/HeLIk
         C4MX6PREbgScNC1vrdQkEC0s5HhEzwUo3RdLtYhOOiOXWXyUSGHJafHeDqvYVhsS8iiS
         2nR+1BqZ4hSmfdvsEZwjoo7c7zNWc4CiI46rkKKcpLnJOThyifo513GLiutUEETSE10p
         4od86J8BHZJNJhlS3rHGT/D7yv7j761qOqrWSKc4yhDbRZPu/v2vrNnU9QiLiBy66Fxe
         4XLw==
X-Gm-Message-State: AOAM531UbUMl7093wKP/e6vmWqhCEM88JfLKh/QFOQsw3ZAOqTiVwqSW
        WD8Pik4NcFszejk2Ii3nlgEww7Si
X-Google-Smtp-Source: ABdhPJytm3bUb+g5PsKzbCDpb1nS4mxsQuB5xMQqz9zwz+O+m2sBHm35ZpEpGqo2Y1e+/BKN795oZA==
X-Received: by 2002:aa7:9543:: with SMTP id w3mr4435731pfq.191.1590592545384;
        Wed, 27 May 2020 08:15:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v197sm2475633pfc.4.2020.05.27.08.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 08:15:43 -0700 (PDT)
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Alexander Monakov <amonakov@ispras.ru>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
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
 <CAHfPSqA_0NhpEvn+jAGb3O7uc+EbZDKWajdR_A=RK9Y_-QgKnQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <10e43329-7822-83fb-ab58-c82c4a28373a@roeck-us.net>
Date:   Wed, 27 May 2020 08:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHfPSqA_0NhpEvn+jAGb3O7uc+EbZDKWajdR_A=RK9Y_-QgKnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/27/20 7:42 AM, Naveen Krishna Ch wrote:
> Hi Alexander
> 
> On Wed, 27 May 2020 at 19:38, Alexander Monakov <amonakov@ispras.ru> wrote:
>>
>> On Wed, 27 May 2020, Guenter Roeck wrote:
>>
>>>>> I understand that. If you anticipate that the module may be inserted after a
>>>>> wraparound, the driver should populate 'prev_value' with actual counter
>>>>> values instead of zeros. That way the driver will properly accumulate
>>>>> energy over time it's been inserted. As implemented, the driver counts
>>>>> energy since boot time, minus unknown amount lost to wraparounds if the
>>>>> driver was loaded too late.
>>>> No problem if this module is built into the kernel.
>>>> If this module is inserted at later point, unless the user keeps the
>>>> counters since
>>>> the boot and provide it as an input during the module insert (we can
>>>> implement this).
>>>
>>> I won't accept such a parameter. If you may recall, I did bring this up as
>>> reason why I abandoned the matching change for the coretemp driver, predicting
>>> that people would complain about it. Now they do. Not surprising. We (and you)
>>> will have to live with it.
> Yes agree, letting user provide initial values is not appropriate. My bad.
> 
>>
>> I'm not exactly complaining, I'm proposing a solution: at probe time, populate
>> prev_value members with MSR values instead of zeros. That way, the module will
>> correctly count energy over the time it's been loaded. It can be unloaded and
>> reloaded freely, and doing so would allow to easily measure energy across large
>> spans of time, which sounds like an improvement.
> 
> In the current driver, the accumulation thread starts during the probe and the
> prev_value of sockets and the core0 is updated with the current MSR value.
> It takes (nr_cpus - 1) iterations of the thread to populate the prev_value for
> the other cores.
> 
> By populating prev_value of all the cores during probe, we can
> certainly save some
> information (values with in one wrap-around at the best). If this
> information is
> useful, i can submit a patch to do so. Guenter, could you suggest us on this.
> 

As long as you don't ignore counter values from before loading the driver,
sure, go ahead.

Guenter

>>
>> I can try to cook a corresponding patch if that sounds alright.
>>
>> Cheers.
>> Alexander
> 
> 
> 

