Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76755C77B73
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Apr 2023 09:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjDSJEY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Apr 2023 05:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbjDSJEW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Apr 2023 05:04:22 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F3EA5D5
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 02:04:20 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5067736607fso4612495a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681895058; x=1684487058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHMn+/z+AhV+laISEPmRX5KlY1p5dWrPe6LZ6z4zmBE=;
        b=kHviwiRwM+zy4FbjNNsi5t9H6dXOCPOoA70lvTQTfyvhXoSNmpZU+gyZpohV9iPDO/
         unLuYmCvBT1oTE8k3bFKBrKozkb1a5rcWO/O2Ykted9Rex8IZvEJHSYSdik53OmfXwgq
         O3utDEHxXNH6UNpOK2fcMT1HNSBGiiTzeNTSTgXME75qhMYPR4YthMc8tsrxbt1wxrt7
         9a0yZutjku858hHuyb3EEFSUuT1UzacBHTx88Nel5CoB93ftqXfJ/zsJyfkbBQr/zM74
         OdqrFpSKdLxE82C3eAJcAbNtQKCw1itYoT2Qyu4wnq6EVVFmqe9Zm7xzi7f00SQMuhWF
         Mqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681895058; x=1684487058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHMn+/z+AhV+laISEPmRX5KlY1p5dWrPe6LZ6z4zmBE=;
        b=gww7rJ5VbiAK0T+QmhYrzOljx09F2bpXtEIksVi95cSpNYvA0uY3XJluOq1lCuh01W
         WYvN8OuHIvRiURGizfNRX3jcnpgzYl8IClksE0bFlWnevZAZbvrrvAZjoAlJJEISJvAD
         71QWq3seuUebGQTPskES4DdoVyp9kLfvqV+4CadUVezyme9FUI6M3d4WR64SPQUNRK2B
         28F2xg1aV6Nv8x6yZjB2CZazRQpewL+o/2gCdbxkXHSe7c3MAayVH/qIbqCLL7l1CBwI
         BLinoY3z69H+4Nkd8J11F8K4rznjyfM/ig0p5pFZlMBqvD3JfbU/iGjf32ApNJWK+IW+
         TSpA==
X-Gm-Message-State: AAQBX9fckg4qVjeC94uh1i7E7SLv3sQ3PFmTvE/RqKBw23KzgnEnNoFx
        ouPQxZDTBg4Sj3rAeIGdJIIAxg==
X-Google-Smtp-Source: AKy350a9He6Zfm/MZjkCRgYyCS4s49N0SlPDzPuTyEUy5jWTvl10BvyWyhoWoZCCbJmVoLPS64hM4g==
X-Received: by 2002:aa7:d508:0:b0:504:77ed:ac87 with SMTP id y8-20020aa7d508000000b0050477edac87mr5905269edq.5.1681895058667;
        Wed, 19 Apr 2023 02:04:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:62f5:eb43:f726:5fee? ([2a02:810d:15c0:828:62f5:eb43:f726:5fee])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d98b000000b004ad601533a3sm7848956eds.55.2023.04.19.02.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 02:04:18 -0700 (PDT)
Message-ID: <84e1428b-a50e-92c4-9c8b-74e2a8034e64@linaro.org>
Date:   Wed, 19 Apr 2023 11:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230418113217.781524-1-Naresh.Solanki@9elements.com>
 <742f546b-3952-32f4-9f20-3a355785d162@linaro.org>
 <e63bba13-05f0-7d1b-bf11-04ef5eda3afd@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e63bba13-05f0-7d1b-bf11-04ef5eda3afd@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 19/04/2023 11:00, Naresh Solanki wrote:
> Hi Krysztof,
> 
> On 18-04-2023 09:47 pm, Krzysztof Kozlowski wrote:
>> On 18/04/2023 13:32, Naresh Solanki wrote:
>>> Add Devicetree binding documentation for Maxim MAX6639 temperature
>>> monitor with PWM fan-speed controller.
>>
>> Subject: drop second/last, redundant "binding for". The "dt-bindings"
>> prefix is already stating that these are bindings.
> Ack
>>
>>>
>>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>>> ---
>>>   .../bindings/hwmon/maxim,max6639.yaml         | 55 +++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>> new file mode 100644
>>> index 000000000000..20b28cd36555
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>> @@ -0,0 +1,55 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +
>>
>> Drop blank line
> Ack
>>
>> This is v9. Where is the changelog? Where is previous authorship? At
>> least some parts of it? Why this has less properties than old one? Why
>> this has more mistakes than the old one? Go to previous patch... or fix
>> everything which was already fixed.
> This patch is to add basic dt support only hence no additional properties.

How does that answer my questions?

Best regards,
Krzysztof

