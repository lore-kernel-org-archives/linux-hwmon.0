Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2DEC7EE45
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 07:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbjFHHyL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 03:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbjFHHyK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 03:54:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E0E1BE8
        for <linux-hwmon@vger.kernel.org>; Thu,  8 Jun 2023 00:54:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-977d55ac17bso62215166b.3
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Jun 2023 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686210847; x=1688802847;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2Twlaiedobdlie44+yvfCt28qgI5GSJ8RzJigOLjck=;
        b=ZRSQm2SbKPvteuLLgPLe7nCK0DjGUrekqwVBx0rP+syuDvylnzfmb9qt24XNGZ6ulz
         na0MmTT2NJye+PzluJ6LcW3DhyGErcL2K9VGlFTfTw4FUZYh5x82Dg4HdlD8f8c9eAdK
         20FmAs+cjr+D0BAnTZeCULB9MfbUQI0aWqS9fK/2XrJ6CdTDXppj4kl8ief1NvuE9kvM
         YTX6BLXI/s9weYeS30cj8tfGn8Ib6uTXNqvKs7eSNgBq87jQ9lhpPelGD/cXeUU9G5kS
         mPtnmnk2vwG7uuLODA3vMWi+tzqEhTzBevkTldS6+gIxMEci+LsUfozVz4OAG1C1Hcee
         7peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210847; x=1688802847;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2Twlaiedobdlie44+yvfCt28qgI5GSJ8RzJigOLjck=;
        b=gDBV5yeabDumBhi0fa0VrhmhRe1oqeqp2bwsRlyfWPDfuuHOzTv2CtMaMFiWO9LYt0
         uxhUMJmDcOF29eW9v12+ThXFVXJATJsOwXwzHXcU0sw9sHP/mhvEUr0dEAuX7Jb4N2pI
         ymuWu+YE+ABVrvy21Amw9eU27AKNV0WLd+h+ABL4LnPSl64T+09iszg6plelZu72n5n4
         fQDOEf9q7ABjDl+tGryvGObNodsVQjYpPhpmmyvSvgKcHx4FZpJmj7kX5m1fWfnVTJcf
         TCyey6JGqrPFfgBSKKfSCPSZNWkC41pjsqxlxv+g6JLifyntKnvwM1GK4rprGN8i+tku
         QwJg==
X-Gm-Message-State: AC+VfDwrfOe+WT+gthDR+bWCnIZ62dLoysfmdV9wJSREYEpJ2kMlSqj5
        KeAZmP6zCBSgaHwx9LQTEdL5oA==
X-Google-Smtp-Source: ACHHUZ4fomm2ljY9Wjm1oqS8KoBZmj6ojHu+GGsGRunrLXkGdjHgEpVBmbct0AHYw4BdzlGEQgP2SQ==
X-Received: by 2002:a17:907:86ac:b0:977:d48f:97ad with SMTP id qa44-20020a17090786ac00b00977d48f97admr7723485ejc.75.1686210846735;
        Thu, 08 Jun 2023 00:54:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n27-20020a056402515b00b00502689a06b2sm235647edd.91.2023.06.08.00.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 00:54:06 -0700 (PDT)
Message-ID: <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
Date:   Thu, 8 Jun 2023 09:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
 <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/06/2023 09:47, Billy Tsai wrote:
> 
>   >> +
>   >> +allOf:
>   >> +  - $ref: pwm.yaml#
>   >> +
>   >> +properties:
>   >> +  compatible:
>   >> +    enum:
>   >> +      - aspeed,ast2600-pwm
>   >> +
>   >> +  "#pwm-cells":
>   >> +    const: 3
> 
>   > 3 cells? For one PWM? What are they?
> 
> channel, period and polarity.

Don't cut my responses. You wrote you have one PWM output, so only one
channel. What do you put then in the channel?

I will start NAKing such patches without DTS user. It's like reviewing
fake code for some unknown solution and trying to get from you piece of
answers one by one, because you do not want to share entire part.

Best regards,
Krzysztof

