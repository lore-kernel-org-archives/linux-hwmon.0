Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600CCC07E9C
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 15:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48CED610A7
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 15:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239602AbhGNP3i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jul 2021 11:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239558AbhGNP3i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jul 2021 11:29:38 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE89DC06175F
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 08:26:46 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id b14-20020a056830310eb02904c7e78705f4so2821366ots.13
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T3EqQss4/1Wr4aw3kZxnQEiSREFlp7dHTkHg7o2TNU4=;
        b=TyU/kSRuT5Cl1FGOtXZQCaXBkKxU/rctYUWp4N5VuYga+DuOwkl8vF0Mmg47eO1E9b
         6AQg290D9rq0ZYlx4zj0WDYaJVSyOuxavpJK2MEFbu8a1cKsp0XXkJCb3kjs+KkBZn2o
         uktcLao2YebI9M4x2gcbvH/Yqd81IJsh3pC0Oo/S1gU2VsdLqsmsBvUXKrcjE6KCc0W/
         6v7gZvQ4UCle2cI9y0EixjXrBISJQb1YJcWoYACIX42bNyn1+XkxH6j9fUblIPJDvUoz
         hDeIouD2A0Ey5t2FE7YPX7Rcojq75zUmXuoEh2+UduDnG3c6H67bwJlQMqx0NkYoUALq
         QQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T3EqQss4/1Wr4aw3kZxnQEiSREFlp7dHTkHg7o2TNU4=;
        b=bhqx5cD5WDaN8EJivrpyTgmKFwn/4U17j90ViJ3/iah7sEoSIjzjxC0lCZVdMVnQqa
         P2K++QdLmhmqgp5stVAKdSEEpYpvMY17d0hDxUJMTvFidDumqGKPBATR7iffiiI63j7C
         aOxlhJMTfqP2U55MPMk0wzX6AL9hDj49Pu/KTEJXoVm9Lik2f2qjgeAGUooSPcH+RWls
         Sj0PTaqJjU4O5BtfMcnYfr0roizreX/d71IsvWKDXhHd+UPe98xGEqS1Rts3HG04yjXS
         EqwBORVy81tFFdkyolr6sVqM5S/5rWrAnqaLmeWjKQjKXS2q7pFayV/SHV8wLg/iP9FN
         YQ5g==
X-Gm-Message-State: AOAM531+Uph+KHHpZfuNXnMQObE3xZG4b0wlDsmgvFmtH6IFADcqSqpR
        4xJBy1CNv00H28NoxPHfP6DmUQPRS8Y=
X-Google-Smtp-Source: ABdhPJxfyXnPFug2H9gi34/TsAgH1KO8YEDx14SGg4eu8+JtkBodLWp4q3QrWfh5bGLaAiI51Vx3mw==
X-Received: by 2002:a9d:d04:: with SMTP id 4mr8980332oti.251.1626276405778;
        Wed, 14 Jul 2021 08:26:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v3sm479047ood.16.2021.07.14.08.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 08:26:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Henk <henk.vergonet@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <202107080039.1680d7Eo018443@systol.god.lan>
 <CAMFK4TPNYJeEJdfu5Wti7G34m+-tcZvA2wv0N87aPsGq2eygvw@mail.gmail.com>
 <CAMFK4TM0MCEGWs=zCJZLsdnUJKqvM+-0fxZTDhJd864SAG8=ng@mail.gmail.com>
 <545ad722-d2de-21bb-21c5-7104097c76c4@roeck-us.net>
 <CAMFK4TMKt3myPKrLYU_vvC=PxxbdohyePZA9Qy0ygdtTmAZU6w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage reading NCT6796D
Message-ID: <497f1c35-6334-7bf3-d72c-6f0db16bad4e@roeck-us.net>
Date:   Wed, 14 Jul 2021 08:26:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMFK4TMKt3myPKrLYU_vvC=PxxbdohyePZA9Qy0ygdtTmAZU6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/14/21 7:28 AM, Henk wrote:
> Can you be more specific?
> 

Not a single one of your patch submissions followed the guidelines in
Documentation/process/submitting-patches.rst. Most common violations are:

- No or insufficient patch description
   See 'Describe your changes'
- Patch sent as attachment
   See 'No MIME, no links, no compression, no attachments.  Just plain text'
- Instead of sending a patch, sent pointer to github location

You could just set up git send-email and use it to send your patches,
as suggested in submitting-patches.rst. Not doing that has cost both
of us a lot of time, for no good reason. I don't know about your time,
but I am not getting paid for my work as Linux kernel maintainer,
and my time is limited.

You for sure have accomplished one thing: A new formletter.

<Formletter>
Please follow the guidelines in
     Documentation/hwmon/submitting-patches.rst
     Documentation/process/submitting-patches.rst
when submitting patches into the hardware monitoring subsystem.
Patches not following those guidelines will be ignored.
</Formletter>

Guenter

> Op wo 14 jul. 2021 om 13:00 schreef Guenter Roeck <linux@roeck-us.net>:
>>
>> On 7/14/21 2:48 AM, Henk wrote:
>>> The nuvoton driver has quite some longstanding issues, as far as I can
>>> tell the alarm bits and input registers are not properly configured
>>> for a bunch of the chips.
>>> And this patch only addresses a tiny proportion of the issues.
>>>
>>> It would be helpful to get some meaningful feedback.
>>>
>>> Is there at least any interest in solving this issue?
>>>
>>
>> There is a lot of interest, but you'll have to do your part and send
>> patches in an acceptable form. So far you have not done that.
>>
>> Guenter

