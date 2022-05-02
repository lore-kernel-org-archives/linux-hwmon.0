Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F646C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 18:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355147AbiEBSWj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 14:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238642AbiEBSWi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 14:22:38 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE1421B3;
        Mon,  2 May 2022 11:19:08 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id q8so15574061oif.13;
        Mon, 02 May 2022 11:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sCS8AdoJhLm6rltPCRkjueSbUN6CmYrKvYL7nJFeMvs=;
        b=aXxk3N8+/8QZUbg5hS9VfotLfiYVJD56+DzssFyoeQkeFVNW2PzLSrsjge2ckfTZcA
         y5L0iG7rb90gnWsH7FP9ERx2PtzQ/pFtqDjO9zOJYfmBLwiRN6k1BNqGA8PkTQupe9HU
         Z6mtOTnlR6jw73AcLzuA9ZpWdDyVmTsAeB+BOHAmE8SBNFrP/1a0a7IJW0uopZevHhNJ
         TntLpja8dJioKPsptEkNvsBF+Lq7LYWJdZQjls+wRo2mUtvWp3L+RLZSxnejsWa6WJlG
         +OQSnx32ug6H0JW5fR/4/Ol+GMpFZrIiQC1AGCIxWugbSTWvGmp6hGwT9J3zxlYHq4pY
         M9Pg==
X-Gm-Message-State: AOAM531AlYaTAu4xtxWGpheGy67iYJHTTQ4vHAPgTBjnc5YSGkVKcxxa
        A2EQVMlghdDB9dkJTRjqmVoT8+VSJQ==
X-Google-Smtp-Source: ABdhPJxE5pVVevyygfIrw3FW8svlbrFKlAEVKUg6hXpJ1By2eG2ZPN5o7ADHGS1hOvUc29e2vuEqtg==
X-Received: by 2002:a05:6808:1413:b0:322:ac62:f01b with SMTP id w19-20020a056808141300b00322ac62f01bmr201259oiv.85.1651515548092;
        Mon, 02 May 2022 11:19:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v4-20020a9d4e84000000b006060322124bsm3156314otk.27.2022.05.02.11.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:19:07 -0700 (PDT)
Received: (nullmailer pid 1460304 invoked by uid 1000);
        Mon, 02 May 2022 18:19:07 -0000
Date:   Mon, 2 May 2022 13:19:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     michaelsh@nvidia.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt
 binding description.
Message-ID: <YnAgmywao0qSNZQ9@robh.at.kernel.org>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
 <20220430114905.53448-3-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220430114905.53448-3-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Apr 30, 2022 at 02:49:04PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>

Also, for the subject no need for 'dt binding description.', you 
already said that with 'dt-bindings'. So:

dt-bindings: hwmon: Add Microchip EMC2305 fan controller

> 
> Add basic description of emc2305 driver device tree binding.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml          | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..c873172b7268
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microcip,emc2305
> +
> +  emc2305,pwm-min:
> +    description:
> +      Min pwm of emc2305
> +    maxItems: 1
> +  emc2305,pwm-max:
> +    description:
> +      Max pwm of emc2305
> +    maxItems: 1
> +  emc2305,pwm-channel:
> +    description:
> +      Max number of pwm channels
> +    maxItems: 1
> +  emcs205,max-state:
> +    description:
> +    maxItems: 1
> +  emc2305,cooling-levels:
> +    description:
> +      Quantity of cooling level state.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +optional:
> +  - emc2305,min-pwm
> +  - emc2305,max-pwm
> +  - emc2305,pwm-channels
> +  - emc2305,cooling-levels
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    fan {
> +        emc2305,compatible = "microchip,emc2305";
> +        emc2305,pwm-min = <0>;
> +        emc2305,pwm-max = <255>;
> +        emc2305,pwm-channel = <5>
> +        emc2305,cooling-levels = <10>;
> +    };
> +
> -- 
> 2.14.1
> 
> 
