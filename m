Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE93C43334
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 06:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiFFGui (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 02:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiFFGuL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 02:50:11 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C866227B;
        Sun,  5 Jun 2022 23:50:10 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id p129so13886090oig.3;
        Sun, 05 Jun 2022 23:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z7FzxKq1M/nqma0dG7FWeApB13OLQckSpXiSdQuTYI0=;
        b=VCwdXVEjShqScdvUyD6/GC7/+B3bEL0ooe0sIVOt4utVaslPbhe1Xlfv/zn0s6rI3E
         15C+ECjqVEmXTyKq1JTOVY3LDkZ4VHmao0o6f37CVip6xJMnTRSxY5xVZmLp+e3C9ze2
         gFJI1nMwaQV3aJYJwqdX3nWq6+QP9PN6/W4NGaupTaxZh0cByZId4ESuL6e2cPzdJkCi
         CufDPN+ssGiBD+/ZAr2veq7m9sW2sJHfqtqyqvyd42i+K98uavLBOEyhcFV7L6RPXJuY
         b5AdJVsBCWkRV0ccpNKXhU5yfDh6dgEWlRMvY3ruSPgcUPVvRvJV4uiIOIppSiWpzb33
         h06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z7FzxKq1M/nqma0dG7FWeApB13OLQckSpXiSdQuTYI0=;
        b=mvI1HSXA035woX1OjzB2MFH1rK0ndBVhfxhvliHgvjRn5S7vbRNg29Co22+z2aQGui
         LmLlgLlOxtNSZnOolrHuuvqELA5jiYGKhOHPnU9H9bhK6gxkPTWLFc6mrsYUYKV/qJgc
         qK/DgWjmAfbtNVbCNXOk6GS6T9deOBY+jVm9JT9AiDGF7VLbDbKej2xrX8jeYqmVQIdB
         66dSFTOoHEwRgea793I5cJQFvIgQrtzSUhIGgDkMGylUPFzIATg2eShCs5EjvPh7jOVz
         NE1Lvx5Kn+mvKjrYQL3UaqHL5iqkHgAEBrYY1+Gqn8o4cY9A5v7+1KXSPHk9Bz2/LcpE
         spcg==
X-Gm-Message-State: AOAM5323wiPxTCxLluLNRu3++Or1ao95AB3osuS+0qa1GOoSvrTX9rI0
        tzOijLJDYUSJCqta6VsHGNA=
X-Google-Smtp-Source: ABdhPJwIabeJtoJ95KvR+eK724lGGCASquB/R9+BMwObrl2xt06BFLOnMQ9O7CTv9iz5VMY4JqwoSQ==
X-Received: by 2002:a05:6808:2125:b0:32b:1ba0:8b05 with SMTP id r37-20020a056808212500b0032b1ba08b05mr13077490oiw.20.1654498210137;
        Sun, 05 Jun 2022 23:50:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b10-20020a9d5d0a000000b0060b069325f2sm7239338oti.63.2022.06.05.23.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 23:50:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5f471f82-83b1-aea4-ea25-e51c0672c8ff@roeck-us.net>
Date:   Sun, 5 Jun 2022 23:50:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-5-sst@poczta.fm>
 <20220605180310.GA3151289@roeck-us.net> <Yp2fCO84VrrSQHbL@t480s.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Yp2fCO84VrrSQHbL@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/5/22 23:30, Slawomir Stepien wrote:
> On cze 05, 2022 11:03, Guenter Roeck wrote:
>> On Wed, May 25, 2022 at 09:36:54AM +0200, Slawomir Stepien wrote:
>>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>>
>>> The ADT7461 supports offset register for both remote channels it has.
>>
>> ADT7481
> 
> Oops. I will fix that in new version.
> 
>>> Both registers have the same bit width (resolution).
>>>
>>> In the code, this device has LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags,
>>> but the support of second remote channel's offset is missing. Add that
>>> implementation.
>>>
>>> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
>>> ---
>>>   drivers/hwmon/lm90.c | 37 ++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 32 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>> index 02b211a4e571..d226f1dea2ba 100644
>>> --- a/drivers/hwmon/lm90.c
>>> +++ b/drivers/hwmon/lm90.c
>>> @@ -153,6 +153,8 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
>>>   #define LM90_REG_REMOTE_TEMPL		0x10
>>>   #define LM90_REG_REMOTE_OFFSH		0x11
>>>   #define LM90_REG_REMOTE_OFFSL		0x12
>>> +#define LM90_REG_REMOTE2_OFFSH		0x34
>>> +#define LM90_REG_REMOTE2_OFFSL		0x35
>>
>> I don't think those are needed.
> 
> In lm90_temp_write() (unlike in lm90_update_limits()) the remote channel is *not* set. I find

... unless lm90_set_temp() is used to write the values. If I recall correctly
I didn't do that because selecting the remote channel seemed unnecessary.

> setting it (the remote channel) in lm90_temp_write() a waste of xfers, if we can address the
> registers directly. But if you prefer to have just one set of register and setting the remote
> channel bit, then sure I can do it like that.
> 
It isn't as if setting the offset happens all the time, so I'd prefer
to use lm90_set_temp() if that is possible.

Thanks,
Guenter
