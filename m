Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F84BC7EE2C
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jun 2023 09:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237467AbjFFJaK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237390AbjFFJaJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jun 2023 05:30:09 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A42CE68
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jun 2023 02:30:07 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977cf86aae5so377776366b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jun 2023 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686043805; x=1688635805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C7J2EP7bxfF86Ze7Zs92uWFQqFnCC2m1aZWYmT84Zs=;
        b=tGkjbZYmLWSdkDcu75EdGvL7xeOarlbXiuCscDikNy5U1FH0hRKBdGbP1XrHQ6WjHp
         g9XGG856Zw0mWOjOYQq21uLPYNYsjWF5d5S3iYhYv6ykHF/1NsTy9y+L4DsUM5bnT2ak
         YfZdrqH0MzLXHEZeP7Di8s/7YGUccw0E/GLO0YBgRlH+yPw/VZWN6YUp0DgeUw2hKseX
         uq5KIpGq9uA4R9iuS4z1/DjJLzPjoSHpBCGLQZaZGCZVBnA0uaBUv1DpdoEaakjRYyGa
         0o1iSjadvh3YAiowFZMd4C+lY1qz0iizqD38HH+v2abcms4PeT9IDk6BqPKUK4xWxG8e
         wXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043805; x=1688635805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C7J2EP7bxfF86Ze7Zs92uWFQqFnCC2m1aZWYmT84Zs=;
        b=i6WiDgjOyB2KJmJ0L+57hr0rvju1uavNOCsLEubBQzeslRBWC0Ict+NAOYNZKXVzdE
         Z8WBOtcjXpDLcknooImR8Mk5ru3a+Yu30F6vwN9K42ULv66XAiDGuLbDTpDbOatbfrlS
         gE+LFybXJr91PycTDnm4HB5DrA3N9ikLydEZgbqBwzg4wXljgJqKT3R9Mg1bXFZyv8f6
         7//YeyZpMpbII+37fpxrwnNEX/6Q0yfIMBYIHG8upVOZl4SJkZ82rH0Z3Z8V/6YEycJI
         7ZadlZCkkLvZ0pz/dLWKqo6oTK6oNHyZbsWKzeKGSvGb5dc4Ej3lXCAN2G5tm1BwgTgp
         ZAcw==
X-Gm-Message-State: AC+VfDwe9hmO26uzf43P8tBuTdlyT1h0gP/OJwn+3193S4HWDf2RFCk+
        xq1bTgq2Op7Q/ZZD5bv98YwdAQ==
X-Google-Smtp-Source: ACHHUZ42UU5n5EGxsYZ22/AmAv6c1F/PV+SDPZXSYXRUB2KwsmObEJud9vcktGF2FEFkMg31pJIvOg==
X-Received: by 2002:a17:907:948c:b0:974:5487:6054 with SMTP id dm12-20020a170907948c00b0097454876054mr1575957ejc.71.1686043805717;
        Tue, 06 Jun 2023 02:30:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709063e9600b0096637a19dccsm5295726ejj.210.2023.06.06.02.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:30:05 -0700 (PDT)
Message-ID: <5101ce0a-277c-7104-145f-75543922fe0f@linaro.org>
Date:   Tue, 6 Jun 2023 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: Add HPE GXP GPIO
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20230606014234.29491-1-nick.hawkins@hpe.com>
 <20230606014234.29491-2-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606014234.29491-2-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 06/06/2023 03:42, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Provide access to the register regions and interrupt for GPIO. There
> will be two drivers available. The first driver under the hpe,gxp-gpio
> binding will provide GPIO information for the VUHC, CSM, and FN2
> host interfaces. The second driver under the hpe,gxp-gpio-pl will
> provide GPIO information from the CPLD interface. The main difference
> and need for two separate bindings is they have different interrupt
> parents. The other is hpe,gxp-gpio is a combination of physical
> and virtual GPIOs where as hpe,gxp-gpio-pl are all physical
> GPIOs from the CPLD.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - hpe,gxp-gpio
> +      - hpe,gxp-gpio-pl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 6

Why 6? You have 4 items in allOf:if:then.

> +
> +  reg-names:
> +    minItems: 2
> +    maxItems: 6
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 80
> +    maxItems: 300
> +
> +  interrupts:
> +    maxItems: 1
> +

Best regards,
Krzysztof

