Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B67C4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 15:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbiK2Pql (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 10:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiK2Pqk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 10:46:40 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E4A42F52
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 07:46:39 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so9520192pjm.2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlITRNlSvIRfx/v3kRPBsYLpShexTyED9akuGBOKj48=;
        b=WHAJKEmiS4xc1GRyJzYfwdJN/UC9HCyYTADcdVJBkbbREzqr0iZ2Rk+OJSvU5Nfxd+
         dLWeG9iWm7/dFIOtSFBxsgtWDujpxcbA+a85GS/0HSpmslxmg7qaYA50Tlc8Xakm4o6y
         khW2VDldpgmcmh+wI0kPpfdjT2yMPoBovjsuito0mp5pP20BwpcCnQHmGrYjtLmO1RxS
         91YwMYC/HY4SOyrOugNHq/sWsAh9imcoziwwGOu6wc5QjGQtU9Dj9iQc9NGVzXZ5/p/u
         VUm5khJm8F6Ou/en3zLOHhLOa+On90StzKvd5jXIwYlhIFGdMDP1sI36H635OvEzmd73
         qu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlITRNlSvIRfx/v3kRPBsYLpShexTyED9akuGBOKj48=;
        b=xVhuN7UPqmF+njPNJcfY79LI3Q5oJd1B/HkfpkzZHgTv9FkeSneoVPnE3D6hVzII3g
         YCQLJGP6ORZFWOSw20cBbk3mfokGnfrU82MBc4jpYwflGEe2w14WCaumefiHx1LKKL9/
         bVjgXL8AJYYNmBs5WgRN7KgF4xGyDxGDyp62iD+aw4/ZI3K1zfkF95AdCnNC2amwbFMd
         SFvRZhSv/NmHwnXVxj5yBSYuvsyX0fIUQu93CvZUol6+m7b+zULRzkjNHNn14xG158NV
         pDaf5VzXmeqnMdKTnAxqRpoguqXYPXRsBvT+3Rx8egz6LC2kU1LxFCpbQ05p8jhOOatZ
         sbvg==
X-Gm-Message-State: ANoB5pm4caSlLVKXlKd3C26stzi7ULXDbc8AnIsKKz/LY06et1j0kGab
        p3IIgClfeMmtKUmjA8WLyhtNWg==
X-Google-Smtp-Source: AA0mqf6B9BzEYfnIu/cqQ3h07jq5XYScwVBdcUkDYQSRSM11MyrdtlrFdURcKUsedAOQ3vdXvT3/MQ==
X-Received: by 2002:a17:90a:5787:b0:218:8398:5846 with SMTP id g7-20020a17090a578700b0021883985846mr57130609pji.241.1669736798826;
        Tue, 29 Nov 2022 07:46:38 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id h23-20020a63e157000000b00434272fe870sm8562138pgk.88.2022.11.29.07.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 07:46:38 -0800 (PST)
Message-ID: <2487f032-1261-be6e-2e2a-38ca0af7c83c@9elements.com>
Date:   Tue, 29 Nov 2022 21:16:34 +0530
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
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <c35917d1-dfbd-f7d9-5c94-a9f0ee3b7ed8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Krzysztof,

On 29-11-2022 01:42 pm, Krzysztof Kozlowski wrote:
> On 21/11/2022 13:29, Naresh Solanki wrote:
> 
>> +  pulses-per-revolution:
>> +    description:
>> +      The number of pulse from fan sensor per revolution.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  target-rpm:
>> +    description:
>> +      Target RPM the fan should be configured during driver probe.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  pwms:
>> +    description:
>> +      PWM provider.
> 
> Ah, so it is not a PWM provider by this FAN controller? A bit confusing
> description. Instead maybe:
> 	PWM signal for the fan
Sure.
> 
> and do you expect more than one PWM for one fan?
One pwm per fan
> 
> Best regards,
> Krzysztof
> 

Regards,
Naresh
