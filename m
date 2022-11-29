Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4669EC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 08:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiK2IMO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 03:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiK2IMN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 03:12:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D23C56D6A
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 00:12:11 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id r12so21326668lfp.1
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 00:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeIAyDjEJnBvYeV0qZkCC/xSer38lroB7hlZ6Bpy9D8=;
        b=QIhiG3sxHhzx3SogiNBl8JXjMovrhbAelVJRtEYkDjciVO5+Y+halevHvlFz3SP3AQ
         k4WOmqGDcE8tUCfJgvn74q0LFazOCrO2/F1rMFVMboV0AuMipElzYiLats/ZLjbPP9SB
         MRlGal7BnqUNwfOuy31YiAQhOqSBMpxdWPBuPJ0cDIetN1bBHnHsCtNiHR8vzimHtEPj
         fPCKcUoTVV5qLChVPy5hn4PpGi/KcCGTkcl6xjyYI0h7cCUaVJqJh7o9C/12gTo28ILm
         +eHlihvdmth1z4gbqoJ+zO3aY5TiLJHTafDEiSF97LPtgAnkWGD/iG0hm5FQXE56HX8w
         rCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeIAyDjEJnBvYeV0qZkCC/xSer38lroB7hlZ6Bpy9D8=;
        b=T9YcwvDKWvcgQ3ku1W5lHbhenKI6VXhBAZmz+sQsncjxvCbkXvVAbOwe2vnKAarFdj
         Mx9uy6ut07q6yFLvUi0mndM/7/em4BBw1tk4NkrxdXQSL0YO6CQqQH+AcS/DpICPD/cS
         6tAAcxsNxLtIqvsauuQBHjPagoZ52sQq+UhW5t1SfVOR+RipPXAfuSBp6KA14FX4KmCQ
         5oLkFL/criZvMve/kCSGsvcvJVDqcDjRk1KgIwT6vLMqyZCMzQj4osWfSobOg6UORw1m
         pnNDF/hg1D+tcGBka/dmEHnnh3wPUzCZ9OemqC3a4bPcDQj5InOigjbFJqHD14La1v0v
         b2Bg==
X-Gm-Message-State: ANoB5pkUlWKMD12cdWs0g7zZ0KmPgrj7dgReTr42jxSzw4zWMB7T7qL7
        yNTkHQmHHuIN02aVSIqkvsrWTw==
X-Google-Smtp-Source: AA0mqf4ZPxfn3ozzitVTWganzHU9BGjc12nkj8QPpZrZKKpwCWI++8cY5zxKNGNb2k+k/MzbDo8NzQ==
X-Received: by 2002:ac2:58d7:0:b0:4b4:fbce:606b with SMTP id u23-20020ac258d7000000b004b4fbce606bmr7107136lfo.27.1669709529913;
        Tue, 29 Nov 2022 00:12:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s5-20020a05651c200500b00279aca77a54sm216811ljo.60.2022.11.29.00.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:12:09 -0800 (PST)
Message-ID: <c35917d1-dfbd-f7d9-5c94-a9f0ee3b7ed8@linaro.org>
Date:   Tue, 29 Nov 2022 09:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v7 1/4] dt-bindings: hwmon: fan: Add fan binding to schema
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
 <20221121122932.2493174-2-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121122932.2493174-2-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/11/2022 13:29, Naresh Solanki wrote:

> +  pulses-per-revolution:
> +    description:
> +      The number of pulse from fan sensor per revolution.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  target-rpm:
> +    description:
> +      Target RPM the fan should be configured during driver probe.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pwms:
> +    description:
> +      PWM provider.

Ah, so it is not a PWM provider by this FAN controller? A bit confusing
description. Instead maybe:
	PWM signal for the fan

and do you expect more than one PWM for one fan?

Best regards,
Krzysztof

