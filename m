Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F149BC7EE29
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jun 2023 14:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbjFFOYA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jun 2023 10:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjFFOX7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jun 2023 10:23:59 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D669810CC
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jun 2023 07:23:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so8986160a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jun 2023 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686061435; x=1688653435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrVZ+SOBI/x4uatGRzhwg8fwXrewUsr2gOgY5H5Ft9g=;
        b=fjsh3FJuBj9U15nWQpVdEMJbpDHN4ljEkK9i2Vw7zwBuDx4W8rMjbHbsp9EmQtjyMn
         eJF3j78A6GgKT5UmL33X70+Hn7Vza2duvJhoTuMmw2WP9K0uDsTiDNGs9f79C6arQHPg
         9jVHZeruC6m8xpteMR0Dla+l2bhyabByCOIwilQYD4nT33q7Pbu31UeXpHuYVaaVGTBZ
         CC4NtSF+mfmdaB3EUVgPZWPkbVVb8i81qGDd4Gj//FwS3EtZ7pyGd9yqlQkcYI1T4rVB
         nGmGUBb9O5E9PZSf45Qkw5rPLiKqEavRcfFfNH7iu9n14Y5qV4u03o9Dy3NyKApuUmvb
         vduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061435; x=1688653435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrVZ+SOBI/x4uatGRzhwg8fwXrewUsr2gOgY5H5Ft9g=;
        b=kyXosHcB/MZnkmXmASg4BxFxspHTtUepUQeuq34B53bs0ibRyqcO9BxgQ51wGYWh77
         X+vuQvH4yj8liWc/44TytrNOQVqZFp3NAMbomX/rOquXKzsbb1ddLwmoRFhu2lslllCD
         RhuHPJI8HAulhaihqlF85RQdjxSoF1wwGF770wJHer9SMKbbd/2bmUD/Onlhy7OQX8Jn
         pwS33xUT5TNGDUomZliPUFB0Kmq8YYLC98XXBIZ5sxKRcdMLdgdR+KiXFLSsdZasTyma
         15eSSR4LYo2Pm5MZn/qxONlVUCKSoeRMge6iovEMjWDjEtLwJ4gyshqCtIMiGTxfQn0d
         UqYA==
X-Gm-Message-State: AC+VfDxdqZaeJ9z0pKAIOGRwtQSOBjguM+hjqzKbTZjj1fhHV6sFZpXp
        d1iVrcTX35/kIyL7XOM7lrosNA==
X-Google-Smtp-Source: ACHHUZ4tNfkNmafis8UY8kYNaoiMX1MZKlLqdyE0bOdqVbjV255h69EPHklsSAMRYGIU1YtOe+jhjQ==
X-Received: by 2002:a17:907:2da9:b0:966:5730:c3fe with SMTP id gt41-20020a1709072da900b009665730c3femr2925794ejc.52.1686061435313;
        Tue, 06 Jun 2023 07:23:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qc16-20020a170906d8b000b00965d294e633sm5624319ejb.58.2023.06.06.07.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 07:23:54 -0700 (PDT)
Message-ID: <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
Date:   Tue, 6 Jun 2023 16:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To:     Patrick Williams <patrick@stwcx.xyz>
Cc:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        lee@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, corbet@lwn.net,
        p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 06/06/2023 16:06, Patrick Williams wrote:
> On Tue, Jun 06, 2023 at 12:49:04PM +0200, Krzysztof Kozlowski wrote:
> 
> Hi Krzysztof,
> 
> Thank you for reviewing this from Billy.
> 
> The Aspeed chip is heavily used by the OpenBMC community and the 2600
> has been used in production systems for almost 2 years now.  Many
> companies are having to carry previous versions of these as patches, and
> some of the APIs changed since the last revision from Billy.  So, I had
> asked him to submit the latest patch set with as many revisions as he
> understood what to change, since the conversation seemed to have died
> since last time he submitted.  
> 
> I don't believe Billy is intentionally ignoring your feedback and he is
> motivated to get this patch set wrapped up into an acceptable state.
> 
>> On 06/06/2023 11:45, Billy Tsai wrote:
>  
>> NAK. You got here clear comment. You cannot have simple MFD with
>> resources. It is not simple anymore.
>>
> 
> In fairness, Billy asked for clarification from you on this point and didn't
> receive it.
> 
> https://lore.kernel.org/lkml/24DD1FEB-95F3-47BE-BE61-8B0E6FBDE20F@aspeedtech.com/

I gave the instruction what Billy should do:

https://lore.kernel.org/lkml/41500a04-b004-0e2c-20a1-3a3092b90e6d@linaro.org/

What about other ignored comments? About subject, quotes and more? Even
if this one was unclear, then why ignoring all the rest?

> 
> He felt what he was trying to accomplish met the documented
> expectations.  Are there some changes that need to be done in mfd.txt to
> further clarify when to use it and when not to?

I think mfd.txt clearly states:
"For more complex devices, when the nexus driver has to
probe registers to figure out what child devices exist etc, this should
not be used. In the latter case the child devices will be determined by
the operating system."

Also, repeated many times:
https://lore.kernel.org/all/YXhINE00HG6hbQI4@robh.at.kernel.org/
https://lore.kernel.org/all/20220701000959.GA3588170-robh@kernel.org/
https://osseu2022.sched.com/event/15z0W

Best regards,
Krzysztof

