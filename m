Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA9EC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 18:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237051AbiEBSUl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 14:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiEBSUl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 14:20:41 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B021EE1F;
        Mon,  2 May 2022 11:17:11 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-deb9295679so15037660fac.6;
        Mon, 02 May 2022 11:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YwwIk+jeAaCtKOZfDXfW8hJEALg69ntNpW8zDKAvctA=;
        b=cDGJv8Pg8U8BZohBIRLBY+DPelubVnUCJXzY6Qv/RLXRSGeA6VA0tSOcYYh2iK3Ag8
         HZsq0aI2o+9JvI+p9+y1J/M4Jp+YBRoUWkl/NAotkrkEF4dnB5DWTfP10Uus/awleA93
         nc5kDKUEYriNiNdkitxN3sBlnROYg+z1VMBwWNqS0CtppNWte/pIC20XJvnT1j5WZBwD
         J5TljidoHWXtG2B6K1KWXl4pRMYuyodizgKnIAW0jJlkSyrAH88Mkrf1EaFqDutusuKW
         Gv989wvaTfZK7qN7+gTQC0LgSmcsfrno5HvztMzz85gv2M1oVpFYoivouJ5fMn+wAgcm
         TO1w==
X-Gm-Message-State: AOAM531Mtr3gv4EXT9iH4c4oq9suDpXr21V6hMp97CfaSGn8vWCT4YSf
        3s6Ff/G0PwAXI+EpSUSe7fBWVzoOGA==
X-Google-Smtp-Source: ABdhPJzI3Z0eKgKtF2mg1GayMWBA7mY2NRPcUJpkfHS7aZLGR4hOV1rBUWLmkvR0bVE4IY6K2UY2ng==
X-Received: by 2002:a05:6870:3105:b0:da:c099:7942 with SMTP id v5-20020a056870310500b000dac0997942mr181531oaa.199.1651515430984;
        Mon, 02 May 2022 11:17:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 1-20020a9d0c01000000b006060322127fsm3089835otr.79.2022.05.02.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:17:10 -0700 (PDT)
Received: (nullmailer pid 1457143 invoked by uid 1000);
        Mon, 02 May 2022 18:17:09 -0000
Date:   Mon, 2 May 2022 13:17:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     michaelsh@nvidia.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt
 binding description.
Message-ID: <YnAgJVxh5fxijKQj@robh.at.kernel.org>
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

Err, what?

> +        emc2305,pwm-min = <0>;
> +        emc2305,pwm-max = <255>;
> +        emc2305,pwm-channel = <5>
> +        emc2305,cooling-levels = <10>;

All possible fans attached to this controller are the same and don't 
have anything that needs to be described? Based on other fan 
controllers, I don't think so. As I've said multiple times, there's a 
need for a common fan and fan-controller binding. Until that happens, 
I'm not inclined to accept fan controller bindings with custom 
properties.

Rob
