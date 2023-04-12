Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532ACC77B6E
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Apr 2023 08:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjDLIMv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Apr 2023 04:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjDLIMt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2023 04:12:49 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CD74EF2;
        Wed, 12 Apr 2023 01:12:45 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n22so9303254ljq.8;
        Wed, 12 Apr 2023 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681287163;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPQHXAKd79acMXq7oMe6Ku28tp5iU6k2HgF0INSacjY=;
        b=kKSjTY1nclUZmKsP2H0K8d3ap/tyTRocwnNhePasUG4rozrtYj7wAUQdva4rEZyGAS
         tpqkyVgw0G3zySVKg2C7H4+LiWyC0FLlhU1x79vmjO7POAEjrJGOjTl0BoXivRczIRhg
         6D4zoLjFx8fQmvJ0n6EPz5qEb8h3xhSELkQGrhmT7U4kIScHCNqQQMCkXkuAz8kx8THZ
         4ruwiN+Eb4kmqdqPX/Ln51I9QGa3wTtCLEzeR9MSAogZP6G43QrqkLSYApr6m/qN9gEN
         qPgGzkEY8RZHNgj1xTnAF3zPiSkBZIcziZAvAPRvkUzppq75FH7lMgbv3yIKqNYPLLFn
         1m9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681287163;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPQHXAKd79acMXq7oMe6Ku28tp5iU6k2HgF0INSacjY=;
        b=wAM7lkFoJpX7dsc7BS0+23H6EdIf8MNyIjiGsaLlbE6yBP4b0RBOGqJY/GYFZtEoRN
         CBkc37XmO1TIzl3gjuRqPW7NYqQM+FFMNVvgkKYMzM2uJEk4mwbNvCy+4mZ4mCMNET5d
         px6FyEeT+Inc1c3ZCeidub0ABie3b1y0sf+3nZIM2aqJYaVfwgRsoV+T7a0GbsuW+hql
         qmgJG6qFEqnDJmyGZbmWuSEcp7lfBRrngJnYnH+QPteoSRsDxgJLRaQEYSn1Y7q74O7Q
         9eYH/CHoV4+zYo34i0iXJtP9dKw+3YxWtdAHkUBSQB+k2gzcmKmwX11Nt3APGx9Kl0ZQ
         HKig==
X-Gm-Message-State: AAQBX9fAz7Tr5t7d2mgX+cAWM2of6u8kPTBc5jvX42AG85IjJd03gqwH
        QCywHyj4h4rGT3OxZU+tIqP1PTkT+cg=
X-Google-Smtp-Source: AKy350ZKVDl7TGxeZfTj9lG1yZSumeAQO/Fn0JlSGzbkLgd/mjLYvyTECTT88c+UrfdowO7Y4tZmBg==
X-Received: by 2002:a2e:9c90:0:b0:298:aa96:55c2 with SMTP id x16-20020a2e9c90000000b00298aa9655c2mr5520123lji.44.1681287163357;
        Wed, 12 Apr 2023 01:12:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id v18-20020ac25612000000b004e9b4a8f738sm2894599lfd.152.2023.04.12.01.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:12:43 -0700 (PDT)
Message-ID: <f80f8929-c256-71b5-3a67-ad27800a40a9@gmail.com>
Date:   Wed, 12 Apr 2023 11:12:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US, en-GB
To:     Mark Brown <broonie@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org, Sascha Hauer <sha@pengutronix.de>,
        jerome Neanne <jneanne@baylibre.com>,
        "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>
References: <20230328150335.90238-1-Naresh.Solanki@9elements.com>
 <20230328150335.90238-2-Naresh.Solanki@9elements.com>
 <c88d3cdd-fb2f-c3ac-a9e8-e49f8e98b811@gmail.com>
 <17934bff-f728-d57a-c3c8-956634bd48c8@roeck-us.net>
 <3be67394-6082-1aeb-8a8d-90149217bdc7@gmail.com>
 <aea044ab-3a83-2369-aff7-5ef153618619@roeck-us.net>
 <0672fe4d-7293-4374-9186-29b008e5f8a2@sirena.org.uk>
 <CANhJrGO3X7pSsMBg6Gtf-q3=_JiCX4Qs=pGudL=etooM2F676g@mail.gmail.com>
 <d6a3ca82-7245-45e1-b8ff-a9970671b04f@sirena.org.uk>
 <CANhJrGMkwi1TVW_wGw=Boj1vRO_wGrd9=atOxKfbbdM4cwPGsw@mail.gmail.com>
 <74f9ebff-3e6f-496f-a776-5bd4650c566c@sirena.org.uk>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/core): Add regulator event support
In-Reply-To: <74f9ebff-3e6f-496f-a776-5bd4650c566c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/11/23 15:07, Mark Brown wrote:
> On Mon, Apr 10, 2023 at 11:19:41AM +0300, Matti Vaittinen wrote:
>> to 6. huhtik. 2023 klo 16.43 Mark Brown (broonie@kernel.org) kirjoitti:
> 
>>> I'm not sure what you're expecting there?  A device working with itself
>>> shouldn't disrupt any other users.
> 
>> I have no concrete idea, just a vague uneasy feeling knowing that
>> devices tend to interact with each other. I guess it is more about the
>> amount of uncertainty caused by my lack of knowledge regarding what
>> could be done by these handlers. So, as I already said - if no one
>> else is bothered by this then I definitely don't want to block the
>> series. Still, if the error handling should be kept internal to PMBus
>> - then we should probably either say that consumer drivers must not
>> (forcibly) turn off the supply when receiving these notifications - or
>> not send these notifications from PMBus and allow PMBus to decide
>> error handling internally. (Again, I don't know if any in-tree
>> consumer drivers do turn off the supply regulator in error handlers -
>> but I don't think it is actually forbidden). Or am I just making  a
>> problem that does not exist?
> 
> I think you are making a problem that doesn't exist.

In this case, sorry folks. I thought consumers could be more 'intrusive' 
with the handling of these notifications - which apparently is not true 
then. Guenter, I hope the statement from Mark cleared confusion I 
caused. I have no further questions about this series.

>>> Like I say I'm not sure how much practical difference it makes to think
>>> too hard about differentiating the errors.
> 
>> I would do at least two classes.
> 
>> 1) critical class - it is Ok for the consumer to forcibly shut down
>> the regulator, or maybe the whole system.
>> 2) warning class - it is not Ok to forcibly shut down the regulator.
> 
> How severe an issue bad power is will be partly determined by what the
> consumer is doing with the power, it's going to be in a fairly narrow
> range but there is a range.

No longer related to this patch series - I am still trying to gather 
information where the "detection" level PMIC warning IRQs are used in 
real-world systems. This might give me some insight how these 
notifications are (or could be) used.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

