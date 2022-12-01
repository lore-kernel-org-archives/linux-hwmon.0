Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCE6C43217
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 16:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiLAQRG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 11:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbiLAQQ7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 11:16:59 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0DA18E17
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 08:16:56 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b3so3251114lfv.2
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 08:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oTFc2dATfS9osXis9xvRsQEPe/ZtfQF84AfMRcTyJw=;
        b=W3E9HyIOcWSK38+gsC9ayGi8852SOgd2kmcoRgfY97I0IkRjY3jknE9upUK3uw7w6H
         fmzIsnwblDSBCn+BZjHI3VMOawteustNcZGIYZnLGPtixGg3gKVEzju/NUqvHPWCTkMh
         qLcgzn+v2a3iIV12gq0799sUWYk/WqMk1J/xkkS0DNrA/3GBhvoSAtJuewSM6/jeJxjT
         ZApBARwj0ADjZazjwQ/uhyYFFL+31pZ3qdY7TIL6Hk8nEbtHlGppqa8/YUnPVaVLNYZP
         zaZlyHTq56Ouu5a04ULGtD6qyFFQAnRqMHcO588Jc6GAZqMCK9rposhsYh6h1inT4Etp
         YOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oTFc2dATfS9osXis9xvRsQEPe/ZtfQF84AfMRcTyJw=;
        b=HXt4rW2c8LdgEmQtC210GEZrVkOXaUp8b8DU7dwoPsmQ5zYC7D82qvKVIpi+//dj81
         HCSq3JyfIyijxHiM4yz3buAQVm1Mi2aDV3gXI02hQk8BrlgKQZxrdJhcaLgRLdAMdj16
         gZ8RhXN/pZu2FBtL8mXYpxs+pMte0NiMTeHU8QS6lqoTRs5PMrWKrtCDrlK9VTzso9Lp
         2KFWEdZCpn4mypig8/ot3R8ZSOItW8pNtg9dLm3KECB14T5+cWzYPZvIu6Fg6Vzz1bH3
         a5lrX0eB/saw90uMOjoJonFszGVQ3cUjta5tzYgwEjEGJmAuKXhEGw2awvoVaJDomGVk
         g0TQ==
X-Gm-Message-State: ANoB5pl7gjtZJaeuJOq5GptBLVj1dlAEWKnz9ERnteykX95oRt/9921F
        BWclXyM+qOAhJ49FHrd0F047UA==
X-Google-Smtp-Source: AA0mqf5pH+x5zT3NaSsywf8/ZupOJED+U46KUk7f7c1W0olYbCt1BCmCjsra+fdMT0XTniKChdl8uA==
X-Received: by 2002:a05:6512:33ce:b0:4b5:ff:4050 with SMTP id d14-20020a05651233ce00b004b500ff4050mr11242043lfg.476.1669911415121;
        Thu, 01 Dec 2022 08:16:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s24-20020a056512203800b0049480c8e7bcsm691799lfs.176.2022.12.01.08.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:16:54 -0800 (PST)
Message-ID: <17ae860f-3fc2-1fec-df30-f23568656b9e@linaro.org>
Date:   Thu, 1 Dec 2022 17:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-3-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201044643.1150870-3-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/2022 05:46, Saravanan Sekar wrote:
> Document mpq7932 power-management IC
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  .../bindings/hwmon/pmbus/mps,mpq7932.yaml     | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
> new file mode 100644
> index 000000000000..5f20c59eb7ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq7932.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power System MPQ7932 PMIC
> +
> +maintainers:
> +  - Saravanan Sekar <saravanan@linumiz.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mps,mpq7932
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object

The comment was - drop regulators node if you have just one regulator...
but it turns out you have more regulators? Then you need to follow
regulator bindings. Open few and take a look.

> +
> +    description: |
> +      list of regulators provided by this controller, must be named
> +      after their hardware counterparts BUCK[1-6]
> +

This misses patternProperties.

> +      "^buck[1-6]$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false


Best regards,
Krzysztof

