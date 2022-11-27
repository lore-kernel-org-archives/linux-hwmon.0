Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D46C4321E
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 12:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiK0Mih (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 07:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiK0Mih (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 07:38:37 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCB665AC
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:38:35 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j4so13538979lfk.0
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBYdKxe0fmj3GYvnK6083FyLsclZUBjVeAFBdHHjr7U=;
        b=zj3vhgANfVLhP+cRiM7TDfYTgIdshQz3+IsvrW62lQPptAXM2sO4Xd9k0e03WqKmxL
         7hE/jHiFZDAtlKXe10T7K2Yw8/Yi+9byIkvvm4T6bmT5i/bgg/e/FASaAEDJyXSW4nLf
         2FcNLl4yTM8feEryTVZAEROtn1glqSuBsxJf3Amnem08hZNi6xOpjjRetOV949IA6F+l
         xE4C73sJxkG/ICbr+TS7zgtJ05g0GzG9/T1IgeVPxoiD7TmIznOCmqla32HkqmiIwTRA
         HkUbvwWWUJLtXESHdJXGOgceCXR0+dLkNFMFaaazBt4iTLUV0er9yJYemugi825v8Csk
         /SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBYdKxe0fmj3GYvnK6083FyLsclZUBjVeAFBdHHjr7U=;
        b=QRyundE4yp1YB7Q4g4549Z6YqJzSCBMN2vrvXvYbTVly67T2oFT6WQ6shEkNzyvdkz
         H2VnfHmPWF+Pfn446nSo/zXBRKcra8nLLgboXUSt1BHpvNByWJLkmNjIYpzM1FkBYk/A
         VfsQ/ycFRuMt1w0/DOYb/LafyX3kgKoAhZvEuP2TXmgV3ta12cGKQ8jSxxFJ5XnA1hOG
         c/dAhoN5Ifb9Why/BNX9V3f+RFI3mmRofMRckiF5TUg7ZEK2IL8k1U+Vd7bzMcrwjOER
         tcT54lOqnZLEeVcy6RZS+2Sl9MhUrQW+q5RIAqerqcC9IIZ4tDFLoH5JjRFWCZPQV7Bi
         uadA==
X-Gm-Message-State: ANoB5pk78Aivw9ma1F66WHxxWqZuKKnIHIlhxKNlNBzC+JJ0vV9EMNXE
        BmmJFSNEfrHy7BwXq0rD/YQ3fA==
X-Google-Smtp-Source: AA0mqf4WOjqLhNtzlou/cpdnavpf46Ln3i2RKJW67n+dkq6PHFCbnFZfg06g2gXgQrUMoPC9OA/8Ww==
X-Received: by 2002:ac2:52ad:0:b0:4a2:23b0:b850 with SMTP id r13-20020ac252ad000000b004a223b0b850mr14871334lfm.60.1669552714191;
        Sun, 27 Nov 2022 04:38:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020ac258c4000000b00492e5d31201sm1282356lfo.7.2022.11.27.04.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:38:33 -0800 (PST)
Message-ID: <de6c0cd6-d926-9a46-149d-1ab03ab82606@linaro.org>
Date:   Sun, 27 Nov 2022 13:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221126171711.1078309-1-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 18:17, Saravanan Sekar wrote:
> Add bindings for mps,mpq7932 power-management IC
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  .../bindings/hwmon/pmbus/mps,mpq7932.yaml     | 69 +++++++++++++++++++

Use subject prefixes matching the subsystem (git log --oneline -- ...).

>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
> new file mode 100644
> index 000000000000..6ec072c287a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq7932.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mps,mpq7932.yaml#

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power System MPQ7932 PMIC
> +
> +maintainers:
> +  - Saravanan Sekar <saravanan@linumiz.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "pmic@[0-9a-f]{1,2}"

Why requiring nodename? Device schemas usually don't do that.

> +  compatible:
> +    enum:
> +      - mps,mpq7932
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    $ref: regulator.yaml#

regulators node is a regulator with one more regulator? Drop.

> +
> +    description: |
> +      list of regulators provided by this controller, must be named
> +      after their hardware counterparts BUCK[1-6]
> +
> +      "^buck[1-6]$":
> +        type: object
> +        $ref: regulator.yaml#
> +

Drop blank line.

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
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@69 {
> +          compatible = "mps,mpq7932";

Messed indentation. Use same for entire example, e.g. 4-spaces.

> +          reg = <0x69>;
> +
> +          regulators {
> +

Drop blank line.

> +            buck1 {
> +             regulator-name = "buck1";
> +             regulator-min-microvolt = <400000>;
> +             regulator-max-microvolt = <3587500>;
> +             regulator-min-microamp  = <460000>;
> +             regulator-max-microamp  = <7600000>;
> +             regulator-boot-on;
> +            };
> +

Why blank line here? Drop it.

> +         };
> +       };
> +     };
> +...

Best regards,
Krzysztof

