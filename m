Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A14C7EE29
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 08:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbjFHIkP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbjFHIjr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 04:39:47 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BF9272E
        for <linux-hwmon@vger.kernel.org>; Thu,  8 Jun 2023 01:39:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977cc662f62so52905166b.3
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Jun 2023 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686213584; x=1688805584;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T60h+W0DC18nxsqz7trELMiyE2WR3VGoPPEa5hHXx+Q=;
        b=iyAq0hoQryh8EvDralt4E7z318BYMnia1f7pBiPyvP4AF+SIcXMPpSRzvhVbxF1JUH
         zLxoD7Z/W1y3YSrJ3d8QsupMO4uBHea6A3IJoYsc1TCmiMPwTTn9EcowtqzR5BS3t8+X
         PtHWFRxR2ljn4Qh94PXTURZW7oabLNX41piHq2O4284la+7jYsDq6S/ll0SKqrA7Ook3
         rqMg7w4WzEZZI3KX2DPDiQEPiFrvs09O7xsWFP+sbYSa7nLnusOd7HJyMkwBhxDOhCxz
         aQu1jVMiUskjy5c60nGo5TNqaNmBBd0NgP96Vm7fk4KFb0HAndFnWgmuYef6ZTMOPHS2
         3wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686213584; x=1688805584;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T60h+W0DC18nxsqz7trELMiyE2WR3VGoPPEa5hHXx+Q=;
        b=aD1cSpcUv9zD0CJQU4HGyIiBr9Qu/XXeYFqfAQQHcuYCMifWzoR9kci1pzVCjjGfVs
         6GvskmZ/H2jGaFXI9sqiQCZheLrKndTScN4aWN1GI8kGjbPXjX5QypoeuGMRPznZYwfM
         aU9kRxvapofH4C9cFayMJtFxlDcEmbIn0Le++VWF1TMA56V2WSB9xi3sWVP6+A/5tqFU
         Ip6XlMvoutbuhfYqv6Gwg3M1Isk8MefEKp9urcOua7692qM8+H96Q7ZeEonUJCgFeFt6
         W+YpdlnPgWLmkIm2nINfDvHPyxpoS8Oq7ci/7RtBUg/amiK0nlvrd2BVZ5HnrlDPLWGQ
         Pz/A==
X-Gm-Message-State: AC+VfDzfVY2BfHlvrg+W36icvsB+CRdD3eawdEOuprvmo8iVdf84vt1a
        YhlLUM3vNjSpR0QeJY7DOMrG4w==
X-Google-Smtp-Source: ACHHUZ6+DFaOWxwBnwwn5BBCqCuWBnfpxcMfTyfrJlrYZN4vwswZ9T70B750ae6ffwKKz5XAccdyTg==
X-Received: by 2002:a17:907:7e84:b0:978:6489:f9f with SMTP id qb4-20020a1709077e8400b0097864890f9fmr9130565ejc.52.1686213584247;
        Thu, 08 Jun 2023 01:39:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709065fd600b0096f830337e3sm384465ejv.129.2023.06.08.01.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 01:39:43 -0700 (PDT)
Message-ID: <fb3cb26b-61d7-5f57-41de-f419aa50ac0b@linaro.org>
Date:   Thu, 8 Jun 2023 10:39:41 +0200
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
 <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
 <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/06/2023 10:21, Billy Tsai wrote:
>         On 08/06/2023 09:47, Billy Tsai wrote:
>         >>
>         >>   >> +
>         >>   >> +allOf:
>         >>   >> +  - $ref: pwm.yaml#
>         >>   >> +
>         >>   >> +properties:
>         >>   >> +  compatible:
>         >>   >> +    enum:
>         >>   >> +      - aspeed,ast2600-pwm
>         >>   >> +
>         >>   >> +  "#pwm-cells":
>         >>   >> +    const: 3
>         >>
>         >>   > 3 cells? For one PWM? What are they?
>         >>
>         >> channel, period and polarity.
> 
>         > Don't cut my responses. You wrote you have one PWM output, so only one
>         > channel. What do you put then in the channel?
> 
> You need to put 0 in the cell of the channel, the example of the dts usage will like following:
> 
> pwm0: pwm0@1e610000 {
>         compatible = "aspeed,ast2600-pwm";
>         reg = <0x1e610000 0x8>;
>         #pwm-cells = <3>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_pwm0_default>;
>         clocks = <&syscon ASPEED_CLK_AHB>;
>         resets = <&syscon ASPEED_RESET_PWM>;
>         status = "okay";
> };
> 
> pwm1: pwm1@1e610010 {
>         compatible = "aspeed,ast2600-pwm";
>         reg = <0x1e610010 0x8>;
>         #pwm-cells = <3>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_pwm1_default>;
>         clocks = <&syscon ASPEED_CLK_AHB>;
>         resets = <&syscon ASPEED_RESET_PWM>;
>         status = "okay";

BTW, these are not two PWM devices but one. I don't understand why you
changed previous design into something like this, but this is not
representing your hardware.

Best regards,
Krzysztof

