Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DBFC6377D
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 15:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 777E960FDA
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 15:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhGVOnN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jul 2021 10:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhGVOnN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jul 2021 10:43:13 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA65C061575;
        Thu, 22 Jul 2021 08:23:47 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so5616454otl.3;
        Thu, 22 Jul 2021 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjDFVWnWZGwAPp5mYeDY59rKcHCbMnB/gaOYrNkkrOo=;
        b=Cs/Jm0ZTUrYXVK5Q4b+KL2f6PPqFyu5+sarSkKjrTS/GimZpd+ejKOLk1feLGocL6B
         5NPmz5oYZKs2WvOQA1Y3WKbyWPoYt1305+uodRVtUZL554CF5K7/5xkhxUZEo4JTCzkr
         8arKLXRtB2asdE5xGfxEHBB99ZefbwKAOmF7ZsdxtT5zBnuarvwDdbsbbzNZK6lcPkwB
         WKiCOUFbOugqAmFE2LJ17k0T5z8bicF7nPD8pymb14XtnNzoOf7XBTgU8w9PusE1bczb
         6x5MkHy4glYccvUpFBocGFW5M2vkYj0DxmvN9taMDhXHSEPGIXi8OSTaCKPFwNjPOqsN
         q0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjDFVWnWZGwAPp5mYeDY59rKcHCbMnB/gaOYrNkkrOo=;
        b=A5h9uxOp3bMTAh1+/tu08X9rc/Y30LKdgIJ2+0YehGj6epK4UgwIdyhhL0HciZBFrA
         qwWYdrx4bd9x3fRpZfVozNbSOfqBv6Ye9SjlumK61xLkTysyDjlx9CBPVqZUgiUPvvTc
         0fGr5zwtgiy0svxaBxGU03ApXptTkbSTicMQ5XA0l2dIIFbp0u1bZs+drBTJ3Dcp9iEn
         javkbfcnO5vVRSGjrwSyEnXY7iDcZ9gmQ9GOr8yRslz5GF6rTud9oQODORx6c2V9xNkd
         2ZuDjrIPkEzkaCIH2CroErSL5L+zB9/8vYc2RhXQW2QxMe38f4hX+x0p1k680IzDM3oU
         Rv2w==
X-Gm-Message-State: AOAM530AJ03ndbu2lp+vjoIpizOnlGzvU/NHNPKrAY8BCNdBxzDM314q
        vCfkEmm9sBIvmzuz4Hup0uc=
X-Google-Smtp-Source: ABdhPJzDeC1gJXoQBSPiWEsH1M88gJkB38QePxLorLOQ1aVtqgj0pzexQldiNeNmISoejwSC5o2Q4Q==
X-Received: by 2002:a05:6830:1f19:: with SMTP id u25mr215019otg.60.1626967426918;
        Thu, 22 Jul 2021 08:23:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm4962812ooj.46.2021.07.22.08.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 08:23:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210715203937.GA3182741@roeck-us.net>
 <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
 <f6d415a7-e113-1dda-727e-0d645c8114cb@roeck-us.net>
 <PH0PR03MB636618FE5E821669E224960199E19@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210721150018.GA3446170@roeck-us.net>
 <PH0PR03MB6366BFF27EB69694904C226B99E49@PH0PR03MB6366.namprd03.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <eb0096d9-59a2-cd26-5fd1-24f9763b2643@roeck-us.net>
Date:   Thu, 22 Jul 2021 08:23:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <PH0PR03MB6366BFF27EB69694904C226B99E49@PH0PR03MB6366.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/22/21 6:00 AM, Sa, Nuno wrote:
[ ... ]

>> I don't really know what to say or recommend here. Personally I think
>> any
>> attempt to tie PWM values to RPM are doomed to fail. Here are a
>> couple of
>> examples:
>>
>> Take your test system and move the fan to a restricted place (eg close
>> to a
>> wall). You'll see the fan RPM change, potentially significantly. Put it into
>> some place with airflow towards or away from the system (eg blow air
>> into
>> the system from another place, which may happen if the system is
>> installed
>> in a lab), and again you'll see fan speed changes. Open the chassis, and
>> the fan speed will change. I have seen fan speeds vary by up to 50%
>> when
>> changing airflow.
> 
> Here we can at least control the tolerance for each PWM vs RPM point but
> I can image this as a very painful process to get these values right and no
> one will think in setting tolerances of 50%...
> 
>> That doesn't even take into account that replacing a fan even with a
>> similar
>> model (eg after a fan failed) will likely result in potentially significant
>> rpm changes.
>>
>> Ultimately, anything that does more than determine if a fan is still
>> running
>> is potentially unstable.
> 
> Yeah, I understand your points. The HW does the evaluation and of
> course it also looks for the presence of a signal... So, in your opinion,
> not even setting a minimum fan speed is likely to be stable?
> 
Using the minimum fan speed as detection mechanism for fan failures is ok
and widely used. My concern is the desire to associate it with pwm values.

>> Having said all that, it is really your call to decide how you want to
>> detect
>> fan failures.
>>
> 
> Well, my hands are also tied here. The core is supposed to work without
> any SW interaction in which case the tacho evaluation is always done. The
> only thing I could do is to completely ignore fan faults which is also bad...
> 
As I said above, it would be perfectly fine to have a parameter that reflects
minimum fan speed (or, translated into chip speak, minimum number of pulses
per minute).

> I can try to persuade the HW guy to completely remove the evaluation and
> just give fan fauts in case there's no signal but I'm not really sure he will go
> for it. In that case, I'm tempted to just leave this as-is (with the extra bindings
> for the tolerance and turn these bindings into a map) if you're willing to take it...
> The reason is that, as you said, this is likely to be unstable any ways so that the
> added complexity in the SW does not really pay off (better keep at least the SW
> simple)...
> 
Sure, I'll take it, as long as you find a binding that is acceptable for Rob.
It is your funeral, after all :-).

Thanks,
Guenter
