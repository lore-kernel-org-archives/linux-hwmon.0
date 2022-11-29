Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF35CC4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 16:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236158AbiK2QFM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 11:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbiK2QEs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 11:04:48 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411D369DD3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 08:03:12 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso17818172pjt.0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 08:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsITLE+ecJEDs+fMIMyIS1u642edYlb6N5jZ2J6E0Xo=;
        b=TT1ct+yusnHIyzhkoGHfVrA9karnrHsnV1WS8EgPmRgEtX+Z86/pIOh3aB1zaLkp7K
         yB9ACqAGtXjMoqh0bY6bnp8b/EW6SqH0JMdp6jP53dRaIISsl2gC2UiP6aK0jeSoRD28
         RQBSugLJi5kCDcNCXliErgSVSpCQCe0uwK+bpeX3jqBpHVjGM8787D1Pw6Zjn8jA3KnX
         lJwhqP4PfEFyOp6oVcydwocCb3vdtZryN7HFDMR86iYvJNVKCwvik75rAlZIPkuGSBVy
         1By2UgB5UrTJpY7bh84t3Syoe7HQ0ydX7DRWiUSOPax06utzIA1B+CluVBWrY5i+S/cu
         Am6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsITLE+ecJEDs+fMIMyIS1u642edYlb6N5jZ2J6E0Xo=;
        b=OUG4mWf4KTfnOSX2LW07jeaxtBhNQY1gX4SU3Z3nDDkDRzf5E1BOibFdf/owfbiHxo
         lkgCLehvVAwCxvawaF+EmbUSTYquEYGUGVuV96ihP51NylXmTaKzOrHJI44yBrI3n5xz
         uV7s9q64VfN7XA41YKBsq3OI6EBME7Jm1N7xXtniUnVugN5cznoPgv1g4+b69nRtm+t8
         UsqT1HaCmPRTXLAwjPBepJGhr71eBcP/QwvCx1N3bAV75CNyfqQW5XyGEdrwn4HXuPG6
         qL06wxW/BrhQq/4mwqkWEnxsev43U+Bz/D0w1UCBynrP6am+Caq45mbcJSCKUqB9kit/
         tUkw==
X-Gm-Message-State: ANoB5pmKHGXtxxe/67J4klh8a7a1U32+Nn8wmQ7zJRZ5FABsbSIC0A1/
        WMtT7G4bwvAqRGDe3n8SPFBdaw==
X-Google-Smtp-Source: AA0mqf4dNkeQ6AsDEfu9i04EvW/zAcxwq8dWCioxe1co0/ItsfGe96PZlSLREYLF1wdvQR1DoqHYbg==
X-Received: by 2002:a17:90a:d681:b0:213:d08f:a455 with SMTP id x1-20020a17090ad68100b00213d08fa455mr67354403pju.130.1669737792151;
        Tue, 29 Nov 2022 08:03:12 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902b78700b001782a6fbcacsm11056862pls.101.2022.11.29.08.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:03:11 -0800 (PST)
Message-ID: <120f9acb-ed28-52cc-2ca0-f434a6cf4afa@9elements.com>
Date:   Tue, 29 Nov 2022 21:33:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 1/4] dt-bindings: hwmon: fan: Add fan binding to schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
 <20221121122932.2493174-2-Naresh.Solanki@9elements.com>
 <c35917d1-dfbd-f7d9-5c94-a9f0ee3b7ed8@linaro.org>
 <2487f032-1261-be6e-2e2a-38ca0af7c83c@9elements.com>
 <a5e9ecca-b17e-3045-db37-e109ecca3235@linaro.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <a5e9ecca-b17e-3045-db37-e109ecca3235@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 29-11-2022 09:27 pm, Krzysztof Kozlowski wrote:
> On 29/11/2022 16:46, Naresh Solanki wrote:
>> Hi Krzysztof,
>>
>> On 29-11-2022 01:42 pm, Krzysztof Kozlowski wrote:
>>> On 21/11/2022 13:29, Naresh Solanki wrote:
>>>
>>>> +  pulses-per-revolution:
>>>> +    description:
>>>> +      The number of pulse from fan sensor per revolution.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
>>>> +  target-rpm:
>>>> +    description:
>>>> +      Target RPM the fan should be configured during driver probe.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
>>>> +  pwms:
>>>> +    description:
>>>> +      PWM provider.
>>>
>>> Ah, so it is not a PWM provider by this FAN controller? A bit confusing
>>> description. Instead maybe:
>>> 	PWM signal for the fan
>> Sure.
>>>
>>> and do you expect more than one PWM for one fan?
>> One pwm per fan
> 
> then:
>    maxItems: 1
> 
Sure
> Best regards,
> Krzysztof
> 
Regards,
Naresh
