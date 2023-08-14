Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A98C04A94
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Aug 2023 19:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjHNTd1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Aug 2023 15:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjHNTdB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Aug 2023 15:33:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15073C3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Aug 2023 12:32:59 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-525656acf4bso1871075a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Aug 2023 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692041577; x=1692646377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PPyRkE8QNcnw8n4URXIBMydlUyue4gEnUO37VgDlOA=;
        b=uZ42I4tK6dm+P+AF/H5MI2p0bu0VHhQ7yPZs/u6FYyCso2ccRZgNK6eZBMNd3rmvFo
         sLXx4suRvyn6HQYLfroPz4RL43N7kgktorfctw5SfYFMrhK3qCBbcWgm0rh1R0eSDX6s
         kZ6dHLa3Hes0qOybeWm0EAXeb+7QMheSjTumDW4XQJPTpXMINE5Lv0ogrgL7ssFYqUbY
         90BM7ESD8Y3MuQBzRaiUrDFp4xKx44Coo4evx2Y9K8KK614ipaXzIkPxvQQvKL1HY/kt
         /N1bdIYgFb5wyqnMDqdCf44YbHhHkHUGlT48j5CZlGww6W2fDaceH9UP8GCDz46y01ci
         RXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692041577; x=1692646377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PPyRkE8QNcnw8n4URXIBMydlUyue4gEnUO37VgDlOA=;
        b=kttGkEV+PRpxwHw6XM5fXsNHucIsBv8NqlM8oSIm24N+aIUAUPoXsv23F26rkeCVqY
         3iZXbGSsxTjxDyxANs03ditDiNbIlelS3wMJ/fI0DGjIFjIa4IWEdxXk504drgJq4cXT
         iWOkwHeLmtq4u46co44rD9GGGEYmUFiZwdgS9ZiMpLDtaSjOlKYKufvoV6h+gD9ok+0Y
         2hwz0CZ8YQEQiwMenNgOizY8VGusL+Dx4iwex3kb/KT/3mnuvbiPV4xGyLZB9YArLlos
         y+l/6NHp6OKMmJnTkGaYxFQK8RCRIQAA+1sRo6a+C/WLgmX2QQEhWWNNTWVZJ7wqytZ3
         vV9w==
X-Gm-Message-State: AOJu0YwHRX24XAevYpc9Es3bGRH80P3WdrbVt3ckC+3RWaHHUfNULQ2q
        o9jl7y+uWfr0dUIX90DMtD4ECw==
X-Google-Smtp-Source: AGHT+IHCJObag9Dyk19qMlfSCfz6Iy2moD47tbSnD7NtULAtaT+peJh+ZdxunQCt9JIIgTgjSOmhoQ==
X-Received: by 2002:aa7:d8d8:0:b0:525:46b7:40f2 with SMTP id k24-20020aa7d8d8000000b0052546b740f2mr5057909eds.21.1692041577535;
        Mon, 14 Aug 2023 12:32:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7cf19000000b0051e1660a34esm5930702edy.51.2023.08.14.12.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 12:32:57 -0700 (PDT)
Message-ID: <b3eebd2b-c73b-fdc7-2b2b-07e97db26d92@linaro.org>
Date:   Mon, 14 Aug 2023 21:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Add Infineon TDA38640
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Conor Dooley <conor@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230802193155.2170935-1-Naresh.Solanki@9elements.com>
 <20230808-stand-cheddar-b76b0b7509a0@spud>
 <eced746a-1181-bd8f-6828-4a4eeb79727c@roeck-us.net>
 <20230808-esquire-epidemic-f9bd74ffde25@spud>
 <CABqG17jm938MaEeqS03WeryVWSRBS7Bqq2Vwq9SL4QOGqXU43A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABqG17jm938MaEeqS03WeryVWSRBS7Bqq2Vwq9SL4QOGqXU43A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/08/2023 18:00, Naresh Solanki wrote:
> Hi,
> 
> On Tue, 8 Aug 2023 at 19:58, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Tue, Aug 08, 2023 at 07:10:08AM -0700, Guenter Roeck wrote:
>>> On 8/8/23 04:46, Conor Dooley wrote:
>>>> On Wed, Aug 02, 2023 at 09:31:51PM +0200, Naresh Solanki wrote:
>>>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>>>
>>>>> The TDA38640 chip has different output control mechanisms depending on
>>>>> its mode of operation. When the chip is in SVID mode, only
>>>>> hardware-based output control is supported via ENABLE pin. However, when
>>>>> it operates in PMBus mode, software control works perfectly.
>>>>>
>>>>> To enable software control as a workaround in SVID mode, add the DT
>>>>> property 'infineon,en-svid-control'. This property will enable the
>>>>> workaround, which utilizes ENABLE pin polarity flipping for output when
>>>>> the chip is in SVID mode.
>>>>
>>>> Why do you need a custom property for this? How come it is not possible
>>>> to determine what bus you are on?
>>>>
>>>
>>> That is not the point. Yes, it can be detected if the control method is
>>> PMBus or SVID. However, in SVID mode, SVID is supposed to control the
>>> output, not PMBUs. This is bypassed by controlling the polarity of the
>>> (physical) output enable signal. We do _not_ want this enabled automatically
>>> in SVID mode. Its side effects on random boards using this chip are unknown.
>>> Thus, this needs a property which specifically enables this functionality
>>> for users who _really_ need to use it and (hopefully) know what they are
>>> doing.
>>
>> Hmm, reading this it makes a lot more sense why this is a property - I
>> guess I just struggled to understand the commit message here,
>> particularly what the benefit of using the workaround is. I'm still
>> having difficulty parsing the commit & property text though - its
>> unclear to me when you would need to use it - so I will stay out
>> of the way & let Rob or Krzysztof handle things.
> 
> To provide context, my system employs a unique power sequence
> strategy utilizing a BMC (Baseboard Management Controller),
> rendering the reliance on the ENABLE pin unnecessary.
> In this configuration, the ENABLE pin is grounded in the hardware.
> While most regulators facilitate PMBus Operation for output control,
> the TDA38640 chip, when in SVID mode, is constrained by the
> ENABLE pin to align with Intel specifications.
> My communication with Infineon confirmed that the recommended
> approach is to invert the Enable Pin for my use case.
> 
> Since this is not typically the use case for most setup & hence DT property
> is must for enabling the special case.
> 
> For further insight into my setup's power sequence strategy, you can
> refer to the following link: https://github.com/9elements/pwrseqd
> 

This justifies to me the property, but still you described desired
driver behavior, not the hardware characteristic. Don't describe what
you want to control, but describe the entire system.

Best regards,
Krzysztof

