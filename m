Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC14C77B7A
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jun 2023 10:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237391AbjFFKsb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jun 2023 06:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjFFKrp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jun 2023 06:47:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D891708
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jun 2023 03:46:34 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977cf86aae5so389947366b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jun 2023 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048392; x=1688640392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IwF81Uszex7htTNK3p1MH/L9IV1Rte84JPTknI851dg=;
        b=THdgqVu+vY8gBqOdTZMw0AmNc6mFnvwxj9ZJ7FmSN3G8T0riJ390M9/uFura4aNH6r
         ZLdDgY76ymTqBJSDQFGo3xI4kNU/Ow0jv5KJSZPb6p3pbJcMWfjIQDTPet+3z9z3jEKY
         /nPhNWfU8nZFTaDSzh/eBFw7QvBR1462yhwe+elTPkM6gImFCYhUaL4HD+/14Rb07pdk
         PzCnmoBLhaOdP4IyBH7fPzF50Lg2ZKEWf64s0a0aauQ3QHX0rBwmMA82MnVGl4zIetUA
         FIdayuGRLfrxEBBcEHyZGfUuOsrQsSKIj3/53Yp+sfYyRXXDpW6uoOeN/GkqJ9a90RAm
         ukVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048392; x=1688640392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwF81Uszex7htTNK3p1MH/L9IV1Rte84JPTknI851dg=;
        b=VfaicRnubVXV0PQ9rPOS+77Vwnvx/mVvdY6sz97hq09w4BTS7iV605nU28bm7SsvM/
         MKnGP81wXg43HmQDzBaB1KMqrT1V14Xw8N5Uye9IJU8Rz8hU8ZN33xbJ0cWmBehXb3Qm
         6ItjYGodspyCZyw+jDH4kCP5WDp7baymj4vo8MkPMVAgiri2bgGqT2SypgfyGyKrjArE
         2EEjn4+5TRt6l8nN5IhwF50L+DP8YOmeEvH5Cz2ibP7MwYYrCVHD3HQ1w7s5Ay2xvZy4
         CQCgUzE93CXQRyvXvRzjwmgALqOZb0M1ElZ2mn5T1xTdbZFbTDrQfV5c21koRsXXRaq1
         aTdg==
X-Gm-Message-State: AC+VfDy4FxQoPYLfLIBXCsWbp/G3WWF/LstgqxwLwRUCZf0W0VE6srVK
        8WvI1Yc5syb+NsEUeoIt966XWw==
X-Google-Smtp-Source: ACHHUZ4qdGWPGdQz77Iote61dJgae30lb2JlzA6V3oh4lZI/epujOFp9DJLcmngZs+OFwjsSZyiqMw==
X-Received: by 2002:a17:906:730c:b0:94f:956:b3f7 with SMTP id di12-20020a170906730c00b0094f0956b3f7mr1903651ejc.2.1686048392634;
        Tue, 06 Jun 2023 03:46:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709064f8900b0094e6a9c1d24sm5599121eju.12.2023.06.06.03.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:46:32 -0700 (PDT)
Message-ID: <d7d0d46f-853d-ca78-9e6c-8b05011f2f69@linaro.org>
Date:   Tue, 6 Jun 2023 12:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 2/5] dt-bindings: hwmon: Add bindings for aspeed tach
 controller
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        lee@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, corbet@lwn.net,
        p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-3-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 06/06/2023 11:45, Billy Tsai wrote:
> Add the aspeed tach device which should be the child-node of pwm-tach mfd.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> new file mode 100644
> index 000000000000..50b3d8c98d55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,ast2600-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Ast2600 Tach controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The Aspeed Tach controller can support upto 16 fan input.
> +  This module is part of the ast2600-pwm-tach multi-function device. For more
> +  details see ../mfd/aspeed,ast2600-pwm-tach.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-tach
> +
> +patternProperties:
> +  "^fan@[a-z0-9]+$":
> +    type: object

additionalProperties: false


> +    description:
> +      Child nodes used to enable the tach channel.

Anyway you did not respond to our concerns. Why do you need it at the
first place?

I clearly asked:
But more important - why do you have such child
nodes? Your example does not have them. What's the point? Do you expect
different number of fans per one device (one compatible)?

Where is the answer to these?

Sorry, but ignoring the feedback and resending same stuff will bring you
nowhere. Several comments in the patchset were ignored.


Best regards,
Krzysztof

