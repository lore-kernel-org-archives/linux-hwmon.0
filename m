Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC3AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Apr 2022 12:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242786AbiDLMfn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345646AbiDLMf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Apr 2022 08:35:27 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF545DA7F
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Apr 2022 04:53:47 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id t11so9834033eju.13
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Apr 2022 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cwWMneWmYo0bsVQNTnfjzMcjYCr1j17IxDi8v2ddzV0=;
        b=pOPSFaKNtRrc6Xfd6Mgck9tiiSqlG/jRNHohJ6jbz469ZDQEJDVr5tBlX/x+HzYwET
         UazcNzCtzLdaFmC9tgK7KPUq7O+v+EG92zXkoHj1FlwX+809xEXwr5rOZJKRTlgzWRJb
         LfVUVGYh6ySPN0yaBiYZXDMMoGG5bWlAEOBfIMFCnuMm8eOS/PMXVrzTVblV5IhcGbI2
         ocGyzKdbCItAa649nhhKEpivREE2IGCbn0YXFUrMUthE1DrYQBA/g8MRXaF2P5ixtFOk
         fB/cBcJTrOJIU5kUorcq+6d7oZCRDkUB0tnNdsEDPtBYpA389yzBbduVHLPf+NYbvrmJ
         DFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cwWMneWmYo0bsVQNTnfjzMcjYCr1j17IxDi8v2ddzV0=;
        b=wNA41rSiuj6z+hTN9pZp5zVikkEPmJhxQoxDPozeS1ndWTdPEu6yZDv2S8rXFEv1K2
         X9s+u3f5DYcd9EGzTNDzSE4AOgwjme7GQLpY0cKWJpynXtH2uVk9K9k4G72d1L1lhp53
         T5vDgw8miBIh95DlIwQcbLo70TxFz6BoROlj2NZwjaMJepcqNiGTv3HulnF9yX+DFYPC
         i6kVIMI4y4pbVMYtK4JaW2ifcynToZZM0LbZPkssBeqJS5YYWDSQ7YEQ2HicPMWNOa6+
         3aTnMWI964E0mQR7C8YAQPKnp7xiDCbrjW3HTyI4XK2w+IwWXU9DvRQrRTn4O/7+FdYA
         Vh/Q==
X-Gm-Message-State: AOAM530d6aa1O5eQxBSZ3isnSDW0pmyQcD1ZOopYhihOf5rXRJY0PG1M
        0kK/evlNWQniPRbulHXp4yEvbC5dTMIn9yb7
X-Google-Smtp-Source: ABdhPJzjUIVyQeW3XuC0ld4eIJnrJZrmjsdr+XuecYgxxiG+iAXjBdVXzyJPY252GX4f3SnJi4TWGA==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id s5-20020a17090699c500b006df82154ccdmr34666885ejn.684.1649764426399;
        Tue, 12 Apr 2022 04:53:46 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id v21-20020a1709064e9500b006e8973a14d0sm2158703eju.174.2022.04.12.04.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:53:45 -0700 (PDT)
Message-ID: <c13a0f34-4938-3d56-43e0-5a9053e0bc25@linaro.org>
Date:   Tue, 12 Apr 2022 13:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x
Content-Language: en-US
To:     Camel Guo <camel.guo@axis.com>, linux@roeck-us.net,
        jdelvare@suse.com, robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     kernel@axis.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Camel Guo <camelg@axis.com>
References: <20220411100329.1783432-1-camel.guo@axis.com>
 <20220411100329.1783432-2-camel.guo@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411100329.1783432-2-camel.guo@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/04/2022 12:03, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
> 
> Document the TMP401, TMP411 and TMP43x device devicetree bindings
> 
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp401.yaml  | 111 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> 

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> new file mode 100644
> index 000000000000..28be5cbb009b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,tmp401.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMP401, TPM411 and TMP43x temperature sensor
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +description: |
> +  ±1°C Remote and Local temperature sensor
> +
> +  Datasheets:
> +  https://www.ti.com/lit/ds/symlink/tmp401.pdf
> +  https://www.ti.com/lit/ds/symlink/tmp411.pdf
> +  https://www.ti.com/lit/ds/symlink/tmp431.pdf
> +  https://www.ti.com/lit/ds/symlink/tmp435.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tmp401
> +      - ti,tmp411
> +      - ti,tmp431
> +      - ti,tmp432
> +      - ti,tmp435

Blank line, please.

> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  ti,extended-range-enable:
> +    description: |

No need for "|". Here and in most of other cases below.

> +      When set, this sensor measures over extended temperature range.
> +    type: boolean
> +
> +  ti,n-factor:
> +    description: |
> +      The value (two's complement) to be programmed in the n-factor correction
> +      register.

Do not describe the programming model (registers) but hardware property
instead.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    items:
> +      minimum: 0
> +      maximum: 255
> +
> +  ti,beta-compensation:
> +    description: |
> +      The value to be programmed in the beta range register.

The same, register values should not be stored in DT.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    items:
> +      minimum: 0
> +      maximum: 15
> +


Best regards,
Krzysztof
