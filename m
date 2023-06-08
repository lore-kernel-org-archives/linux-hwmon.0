Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5720BC7EE37
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 06:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbjFHGqj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 02:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234951AbjFHGqi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 02:46:38 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDE32132
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jun 2023 23:46:36 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-973f78329e3so51067866b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jun 2023 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206795; x=1688798795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZgN/pq4zJXDMGVU52SbNy/IfFWaN7LSvJZjeMzXd3A=;
        b=iGdtH8Yqn6jyihGPQrVSC70sM4ACObapuBk2v11OGmQBItBAukIcUpZpLTmfOoBuMH
         MHMA687Xp4MEV2oWdJP/Wn/K3E5glM6aPgQL+wxe5WGRKiOHlCEefmESBl0dNa7Y1BSI
         J3bKeUuKfB2HIqfxCO/S/dQUt2PdVGLQmRA+DX2hVHY43g0SQfyYlk26IAh8GMiPJAAK
         k8oZ27dbhxkySftlDFX9G7fu82nMV96SdFjcG1j/pvBA6anzLU9pO1YuQUUebDzPcmol
         +y4mxiKfkVli1IYAh7BCSbrk1hcSw5wlO0WwSjUWivy5UYahTuamqSnpcWSrg+dTFkQ5
         eG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206795; x=1688798795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZgN/pq4zJXDMGVU52SbNy/IfFWaN7LSvJZjeMzXd3A=;
        b=kyfk4qcpdvEiJGX1LkxttteqonvAqO2FrE1gQjki19mchFSgi4c+Ydp8HgxJu7qxBr
         NCw0o2LxRLFjhxV6RTD5UzGLK6CLqCCMtAdS4eYuc63mhTUT0N/t/EgFCl877yuHEcYq
         JtbGE2AYbQkZLQrNPCMsLFSeaHSe834AitfbFQg0lQ6JmXsviQSYohzLau64oH6uTskv
         PBIoXSXLMw+ikNR+zIu0oAU+xbFMFdJ2CV1gRNNGX51QQakiFqr13j1jjcJ/41XES5Fe
         qCOhwE0PajYzbwMmiqCx6q9Vzx1kZr92xQLSZRwZQz4z5kwVvJE30J4Uv0e2O5rC2oNU
         K8KA==
X-Gm-Message-State: AC+VfDwGxsUssV+GuLqikydKfCHZA/tO1O9iDPYivejxC1BBLsB+hHGK
        gUvCcWy+XfYYOJ9YxLHyACOWuQ==
X-Google-Smtp-Source: ACHHUZ5p6fnCJHV5uldMrLu0wmGEQEGXksmv6Ojnv/qWf/9hyk16AeQy+XeNgmX+HuGIJCAn8kxjXg==
X-Received: by 2002:a17:907:72d0:b0:974:5ece:19a6 with SMTP id du16-20020a17090772d000b009745ece19a6mr9808402ejc.54.1686206794751;
        Wed, 07 Jun 2023 23:46:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z18-20020a170906945200b00978874d1083sm273646ejx.135.2023.06.07.23.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:46:34 -0700 (PDT)
Message-ID: <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
Date:   Thu, 8 Jun 2023 08:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        corbet@lwn.net, p.zabel@pengutronix.de,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/06/2023 04:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> new file mode 100644
> index 000000000000..a9e040263578
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/aspeed,ast2600-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Ast2600 PWM controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The Aspeed PWM controller supports up to 1 PWM outputs.

This does not look right.

> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pwm
> +
> +  "#pwm-cells":
> +    const: 3

3 cells? For one PWM? What are they?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - resets
> +
> +additionalProperties: false

Missing examples. All bindings need examples.

Best regards,
Krzysztof

