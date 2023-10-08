Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E597E95A86
	for <linux-hwmon@archiver.kernel.org>; Sun,  8 Oct 2023 01:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbjJHBVC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Oct 2023 21:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234204AbjJHBVB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Oct 2023 21:21:01 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90C8C5;
        Sat,  7 Oct 2023 18:20:59 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-57bc2c2f13dso1841768eaf.2;
        Sat, 07 Oct 2023 18:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696728058; x=1697332858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWgVHcNRC0JxhBz17/KtrgsQGECNqtzTGRrjgDLed/g=;
        b=AQsAZLEvqQRCun3T6bX7HjpNAVhBaylAOxSS//m8T93bTR3Eack2YRvTY0UnBZWCJn
         EejxO1MDX+hfl3vzgoTt+X78Ic5yIVBzC17iPBky3qT4eP5Rv0GezflE9rQhcWqHGM0Y
         S5GeFnFNX6CoF/R/oNPK2nKvaxCBB+4SGK8F2pTpETZZ8kanxwvyiffSRL5qFgYobHW3
         TWzdg7xFeT3j/CB/tafpgidO1xQAguV6R0dJygBRJuAvm43+b1WKTEYsaC+zgcHNCaZK
         Kg7MmTyttOUcScILPrM9v1W55JYUSHvgXMZHpaE5h7ejxcuwzFPbyg2lQ/L6g5rc/f6v
         znMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696728058; x=1697332858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWgVHcNRC0JxhBz17/KtrgsQGECNqtzTGRrjgDLed/g=;
        b=D+lwRewcyUYhaf9muldZiaCqRTr9OW+RJOGCahXPbfWdXmyyOJpKkaya9jPc1he2DI
         VBHezq+KYroq4Ti2FAt04/+BsEtrab0UfFwpKca3k+bOH+JFmDEmm0xH7Pg28AxrRsC4
         ZkZF+7hrR9J3E+TDTD9Os4JZvsx289ec9edXIbjk9G2YjPvZL+Xt0KVWp/ev8b6iAJxt
         0ihHAZVTpUUAUzm/JQzkaFOzV/jwOut1rfKnRyGUTfteb19OSPKzGcBMR+Qft66R6VdP
         r18QZSJ9sBpTSv2GQ8WG/dgNGsfLFIv0MpGY8ZaFBh5wSF7wJMEh1xDOLG/id0gtesyt
         x/8Q==
X-Gm-Message-State: AOJu0Yzcc925ji88b2iNmI1Qy+5U/xqb2U3Wg/1c7iEUzvTuGnZXdsE+
        MTSXJuIOkEdwP56+SQnVAS0=
X-Google-Smtp-Source: AGHT+IFfdYRJEHhAlgzwgZ8M3LFWwOwHpmK6da0oqhjV2kkLznUJZq4uuvdF7cPIzrB8t5rs8Py5Gg==
X-Received: by 2002:a05:6358:9691:b0:164:8742:525 with SMTP id o17-20020a056358969100b0016487420525mr4776787rwa.17.1696728058287;
        Sat, 07 Oct 2023 18:20:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p26-20020a63951a000000b0058d26647e45sm1669606pgd.54.2023.10.07.18.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 18:20:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 7 Oct 2023 18:20:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Saravanan Sekar <saravanan@linumiz.com>
Cc:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/3] regulator: dt-bindings: Add mps,mpq2286
 power-management IC
Message-ID: <84f4692c-5fee-4d00-b537-570f90191d6e@roeck-us.net>
References: <20231007165803.239718-1-saravanan@linumiz.com>
 <20231007165803.239718-3-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007165803.239718-3-saravanan@linumiz.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Oct 07, 2023 at 10:28:02PM +0530, Saravanan Sekar wrote:
> Document mpq2286 power-management IC. Instead of simple 'buck', 'buck0' is
> used to keep the driver common which handles multiple regulators.

Sorry for the maybe dumb question, but where can I find the driver
depencency on buck naming ?

Thanks,
Guenter

> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  .../bindings/regulator/mps,mpq2286.yaml       | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
> new file mode 100644
> index 000000000000..594b929fe4b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mps,mpq2286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power System MPQ2286 PMIC
> +
> +maintainers:
> +  - Saravanan Sekar <saravanan@linumiz.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mps,mpq2286
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +
> +    properties:
> +      buck0:
> +        type: object
> +        $ref: regulator.yaml#
> +
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
> +        pmic@3 {
> +            compatible = "mps,mpq2286";
> +            reg = <0x3>;
> +
> +            regulators {
> +                buck0 {
> +                    regulator-name = "buck0";
> +                    regulator-min-microvolt = <1600000>;
> +                    regulator-max-microvolt = <1800000>;
> +                    regulator-boot-on;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.34.1
> 
