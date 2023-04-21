Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1527C7618E
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Apr 2023 07:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjDUHiI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Apr 2023 03:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjDUHiD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2023 03:38:03 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5171A270B
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 00:37:56 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so9802632a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682062675; x=1684654675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dU/wzPur9jjATRLtk1fYjzdd6mnHYVT0LlPVIPw2/Ic=;
        b=sLBzuFEOxTlhEoJEoFQdavHHX30AWw6KYDP71wPBx0tb+rU492gxsWksT3Xp5eFfz9
         /qvnmMq2b9ByOgnobT7iCEcCSq7lLFqxnfjMggI+n1OqnPRCAP760pK7pEPx+6td3DAi
         pe8KqUVpRnMiZ/TKEqYLj7bJZnYkPtGOOUsmMHMH23cnx6fH4Ui2ipYC6xUqyzxDR9Bs
         78J3y10JNrDtt1v0tSNZhL008r05fOZ/gUatR2Riy+O6fQh9ZH3JLfR0QOH8xzFPmtUU
         eYNGVW/YlBy1AUI190AKrrMk8bsLm5cKIa4b5CtyhMWwJjeGxJo/7HwEc1CT8Qf7NUQZ
         nxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062675; x=1684654675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dU/wzPur9jjATRLtk1fYjzdd6mnHYVT0LlPVIPw2/Ic=;
        b=P/N3SCEFdM4ALlzLE8P9MO+DALe9ESTPKs4Zz217oZp9JUi4xtVJGIt1t+czFbvgM9
         A+ciaandOT/MVvjc/ouOTjeFRD/7vDcFibNKerYfByADzMxtHvZQAMc+PcLhmzKlj0r2
         lY1+3DttyNuHdxLzPpnepBVWYKZFlfCTrM6kimfkGyPjBIU2OLzm9Qm4W8HGsJ01FQj5
         P8aUYFjutCb341Ymd4pUkXJPVoKnGgluEghu85teISGAaRJERStPLc0z+NTI5yGQbYn2
         yUnFTf5hFxGY+IeGI4OmBP+kqNH5A0IBKSVdCRIAiPyDmq+BQVrEZB7801EN2SMiAeN6
         Aelw==
X-Gm-Message-State: AAQBX9fAKXijUEbRAGwDwyotc+7RRtDFbz07645zTuag6det8uDMGqm5
        w/5psTMfxfVz/GhtM9KFWPyNig==
X-Google-Smtp-Source: AKy350YEPrxwQ9Ho252JkN5olWUzdrxx8UtWLi0TO2wIuJp4nvNyytG8yqv4k+Nlp4cRefThVFsQNg==
X-Received: by 2002:a05:6402:254c:b0:4ea:a9b0:a518 with SMTP id l12-20020a056402254c00b004eaa9b0a518mr8130393edb.17.1682062674786;
        Fri, 21 Apr 2023 00:37:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:668b:1e57:3caa:4d06? ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7d394000000b00504803f4071sm1570543edq.44.2023.04.21.00.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 00:37:54 -0700 (PDT)
Message-ID: <76e57634-75dd-01e8-9c56-36ed7de17812@linaro.org>
Date:   Fri, 21 Apr 2023 09:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add max6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420111759.2687001-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420111759.2687001-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/04/2023 13:17, Naresh Solanki wrote:
> From: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ...

Wrong syntax. '...' do not mean anything, it's ---

> Changes in V2:
> - Update subject
> - Drop blank lines
> ---
>  .../bindings/hwmon/maxim,max6639.yaml         | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..1aaedfd7cee0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max6639

What is this device? fan controller?

> +
> +maintainers:
> +  - Naresh Solanki <Naresh.Solanki@9elements.com>
> +
> +description: |
> +  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
> +  fan-speed controller.  It monitors its own temperature and one external
> +  diode-connected transistor or the temperatures of two external diode-connected
> +  transistors, typically available in CPUs, FPGAs, or GPUs.
> +
> +  Datasheets:
> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max6639
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

Why do you need these two properties?

Anyway, the binding looks incomplete. Where are the supplies? Interrupts?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      fan-controller@10 {
> +        compatible = "maxim,max6639";
> +        reg = <0x10>;
> +      };
> +    };
> +...
> 
> base-commit: b8610e0fe08f1476895f141be60f8dd842f0adac

Best regards,
Krzysztof

