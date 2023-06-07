Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA407C7EE29
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jun 2023 08:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbjFGIec (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jun 2023 04:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbjFGIeb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jun 2023 04:34:31 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8A01988
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jun 2023 01:34:02 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso837893a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jun 2023 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686126840; x=1688718840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHYmPirAe/9yvPI0Un/v2zVHDoxK5QiPyOUyzdkadvI=;
        b=U2hVnnnQHDbTv1gfXtWS8Pqlo7XQNgezPdGgIOH15eBZc69fe4DzqxB+O0KT+AwOd0
         U/ONfqGQEzf+j24bGuDllsF83FLGhDWc19JJWKjOeDe4bNSvAtGmeBPYHdMjrZsakqcD
         NaiGPG6Ts0znHSVO4WYEQVESzMF8KM4qlRZPKL6QCxWPRecPCQsKEZJmLaHIs0QWtwv9
         XGOG4DtNMaj67xC4rdSipeUjR4h+PxN9m4SGyy9kc3xrSsLiR7l2EaHPO94FL2RT8xwf
         aTQMXrc1m90PqKIfLUJr3psB9ASdlkyuH2y+nqiyxMkhx1sgmXUBP5Sk8XiFZ/fbeGj8
         djDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686126840; x=1688718840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHYmPirAe/9yvPI0Un/v2zVHDoxK5QiPyOUyzdkadvI=;
        b=gMEadWhihro1Dr2gsLne9gBydmGhkXclcTxzZARGQLCNEVmwn5wCpe0B40d92Eeq42
         aQGSOFWBufXx6z0bj5giSa8ONJSdF2njo03jFhk6ozgkbqNP7lwFQTwV/XO7g+e3JH3V
         qNM+8qyvTO8xDfypRKxC0O0AI4eaoV2UP4QG0nz2RZZTkH/bwff5V/moxJ+1joYLinlZ
         1hgnTbDad17pgwigcOYj+GaO1MGWL9jKPn1RrCBwSEkuWxw5QNmxZZ4tcMktKe7FhRxe
         gd/YU0GfUwk3WOh1EbsiPhJo40jvxrQ3zxwamyKSXt7m8V5q9/Pkfrz/Q/fvDSeRGvNs
         T0SQ==
X-Gm-Message-State: AC+VfDyJccuxLckrY9Me2vzuUZWoeOCw1Hw4TerEgVWmDb2hH5vV3xic
        gW0efmi1w0+EjifYKVm9w24hhw==
X-Google-Smtp-Source: ACHHUZ6h6766vJMwn/tNHn3JSBfjpWgC88xarXppxRZ+ze1TywPShnS202vrMK1Xo6zB8ufvs3B7nw==
X-Received: by 2002:a17:907:e8f:b0:978:8925:7a00 with SMTP id ho15-20020a1709070e8f00b0097889257a00mr266294ejc.15.1686126840620;
        Wed, 07 Jun 2023 01:34:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ci17-20020a170906c35100b009787ad3157bsm823497ejb.39.2023.06.07.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:34:00 -0700 (PDT)
Message-ID: <2af1bc5b-0be6-46cc-3155-307f13fbba11@linaro.org>
Date:   Wed, 7 Jun 2023 10:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 3/5] dt-bindings: mfd: Add aspeed pwm-tach binding
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>,
        Patrick Williams <patrick@stwcx.xyz>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "lee@kernel.org" <lee@kernel.org>,
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
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-4-billy_tsai@aspeedtech.com>
 <35bf0a69-bcf6-ae35-eb3c-e74cfcf9c571@linaro.org>
 <ZH89fXknZlhGmM_H@heinlein.vulture-banana.ts.net>
 <c28f963e-d13c-6b5c-c389-996e986f81d5@linaro.org>
 <SG2PR06MB33652E18980E9CF8E4F0894D8B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <742d3161-3a4d-ea77-7bd4-85f6636bf400@linaro.org>
 <SG2PR06MB33657063A2E3239AD0A21F718B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB33657063A2E3239AD0A21F718B53A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 07/06/2023 10:32, Billy Tsai wrote:
> Ok, I got it. I will remove usage of the simple-mfd and parent node in next version of the patch.
> Thanks
> 

1. Whether parent node stays or not, depends on the hardware. Please do
not make random changes which do not correspond to the hardware.

2. Implement all, *all* the comments from previous discussions, not only
this one.

Best regards,
Krzysztof

