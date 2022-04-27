Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA8CC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 06:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357973AbiD0GHq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 02:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241556AbiD0GHo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 02:07:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7459F58384
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 23:04:33 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l7so1310541ejn.2
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=27SXQOPVAdANNQCQJ4C3V7A5t8g68xh0r46tyDVmRxQ=;
        b=Y+ClKEHd1wAog5IoYY3pf0agZCvamFvLJJRWh+63FD3Va4L/gV5bKPrXggA6CVBuc0
         CUQpuZ36BefavI40ZgfscqtRl/Os2+FhhjeQVYA7NnKj5xae7sGtbcehw/F6Tw8T4lL6
         6CBOoOB+cjLA8LFuMLUB+jhkY9WedHACo5PHIo71xio/tehD9/sqYoT+SlSgHkPGoNo0
         gAhj4jX0hbwalsFgWOtuyo3tMCG9qAqZ/BDKH2bWApnpvHMqShdaET0Pa91yiPbIGEQQ
         J95OijOLMO/iV+v1ne9spHnUForaXEpWnY/U6XoLH3DV1IYtXkJClbCiYZS9NHVt+sbK
         STww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=27SXQOPVAdANNQCQJ4C3V7A5t8g68xh0r46tyDVmRxQ=;
        b=Mn5VcvSVu89CFsu6VDLV1RN4q5NFI2QpzVSje279k2ziuGxdhJYX++YQG95VgkY/JB
         yqMAwy9v404KFZSQJEzdyQebzqsVovu2yEejOOjjQppSO6R2aLU9t6td04G0XEQOsCa8
         /n/kSjTQxXKN+AwNd0mon73SoqRDPccZSXhs0YLg+MgebocnV4BbeTVD2OnUnnUXrPOn
         qFqFWTPXi1BkX1ifxrEPzL6i1v36SFTjoJvmw9xjQohFMh5Al4RVdSfjA2LqRm8s67tg
         ovTSF/tdypQtSSxWOjGN9wBwTZNqsvpyezWj8LvFNTLF3qBy99sgJ618m7eb2hRLR1R0
         yncA==
X-Gm-Message-State: AOAM532Xi9nF5pZCs3UvQ+yOoHzDjgC64rsIihzJ033HzjZcNdE0F13d
        h8H2ilwVB75T7j6n0ilySJINRaFOSE2Arg==
X-Google-Smtp-Source: ABdhPJwWDR9IhrmVQfKp1JkwSdivR59TpiJ9LC3ukLWrvDIX/tdF3PY94O0nR9+ygi9bDJsFjar41A==
X-Received: by 2002:a17:907:8a0b:b0:6f3:bbab:4ad1 with SMTP id sc11-20020a1709078a0b00b006f3bbab4ad1mr4453194ejc.135.1651039471996;
        Tue, 26 Apr 2022 23:04:31 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l3-20020aa7cac3000000b00422c961c8c9sm7564792edt.78.2022.04.26.23.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 23:04:31 -0700 (PDT)
Message-ID: <178b9310-a854-dfa6-a4f3-f971b608abe3@linaro.org>
Date:   Wed, 27 Apr 2022 08:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/7] dt-bindings: hwmon: Add nuvoton,nct6775
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Renze Nicolai <renze@rnplus.nl>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <20220427010154.29749-2-zev@bewilderbeest.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427010154.29749-2-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 27/04/2022 03:01, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I already reviewed it so I guess you did not include the tag because of
significant changes?

> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> new file mode 100644
> index 000000000000..418477374fdb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct6775.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NCT6775 and compatible Super I/O chips
> +
> +maintainers:
> +  - Zev Weiss <zev@bewilderbeest.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct6106
> +      - nuvoton,nct6116
> +      - nuvoton,nct6775
> +      - nuvoton,nct6776
> +      - nuvoton,nct6779
> +      - nuvoton,nct6791
> +      - nuvoton,nct6792
> +      - nuvoton,nct6793
> +      - nuvoton,nct6795
> +      - nuvoton,nct6796
> +      - nuvoton,nct6797
> +      - nuvoton,nct6798
> +
> +  reg:
> +    maxItems: 1
> +
> +  nuvoton,tsi-channel-mask:
> +    description:
> +      Bitmask indicating which TSI temperature sensor channels are
> +      active.  LSB is TSI0, bit 1 is TSI1, etc.

Need a type/ref.

> +    maximum: 0xff
> +    default: 0

Since by default it is disabled, doesn't it make a required property?
IOW, if you add a node without this mask, will the device operate
properly and usefully?




Best regards,
Krzysztof
