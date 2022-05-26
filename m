Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE9CC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 May 2022 02:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345875AbiEZCLi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 22:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiEZCLi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 22:11:38 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67534275EF;
        Wed, 25 May 2022 19:11:37 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-e93bbb54f9so667575fac.12;
        Wed, 25 May 2022 19:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qtx7KcuLWC0zkHaZsaUj7AAhwC/jqxQH75WLD1K3iQ4=;
        b=ExJofPp9BmHvkG7T2cKi3PYGjpYD67k/ac76tt2+1L9F7xz+KXBcj0y///GNB5Pilh
         cUZxQh14gxwt0nqVr57C7gGlAEhgjAc6Q3n72e814iy3W8CI6K16+GLvEJ1SdMBTKa3Q
         XoHaAID2Sybd9M96wIpNyegjMrkHMVhhrM9XiejI6yWeF8rSof8Ei19t+cYtYQfHwX3u
         lMvmZa649jV/MfQcM6E+EA6w2JajRZwq5pEd4MJtc/QrJZIUz02WnUGVhi2B1RmP2et4
         hQEmOi46CqnbaWTakUMu3R2Ls6w2hHYzmVCyzj4Hx0mohwyCGLWVLXTpFOYp7D2N6CAH
         JTTQ==
X-Gm-Message-State: AOAM533YCFpuxsS6t3hG0oln/4cJQa2p5eaUuvm0+U96sKz777AgvgLe
        NCIN4bkcrozqqZwJmV8rhw==
X-Google-Smtp-Source: ABdhPJyO9oNIjzbuaCIvCgpLhs07tKThTatJg8BtAxobORkc5NafjKDkAh1ZDhLKh4/mOs+PoYDyLA==
X-Received: by 2002:a05:6870:51cc:b0:e1:e6ee:448f with SMTP id b12-20020a05687051cc00b000e1e6ee448fmr48791oaj.136.1653531096677;
        Wed, 25 May 2022 19:11:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg19-20020a056820081300b0040e6e53f6bfsm170150oob.15.2022.05.25.19.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 19:11:35 -0700 (PDT)
Received: (nullmailer pid 2915521 invoked by uid 1000);
        Thu, 26 May 2022 02:11:34 -0000
Date:   Wed, 25 May 2022 21:11:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     michaelsh@nvidia.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH hwmon-next v2 2/3] dt-bindings: hwmon: add Microchip
 EMC2305 fan controller.
Message-ID: <20220526021134.GA2908133-robh@kernel.org>
References: <20220524161755.43833-1-michaelsh@nvidia.com>
 <20220524161755.43833-3-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524161755.43833-3-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 24, 2022 at 07:17:54PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add basic description of emc2305 driver device tree binding.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v1->v2
> - Fix dt binding check errors;
> - Add descriptions;
> - Add missing fields;
> - Change the patch subject name;
> - Separate pwm-min, pwm-max per PWM channel.
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml          | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..0aa65dcfd238
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
> +
> +maintainers:
> +  - Michael Shych <michaelsh@nvidia.com>
> +
> +description: |
> +  Microchip EMC2301/2/3/5 are RPM-based PWM Fan Controller.
> +  The Fan Controller supports up to 5 independently controlled PWM fan drives.
> +  Fan rotation speeds are reported in RPM.
> +
> +  Datasheet: https://www.microchip.com/en-us/product/EMC2305
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microcip,emc2305
> +      - microcip,emc2303
> +      - microcip,emc2302
> +      - microcip,emc2301

typo.

> +
> +  microchip,pwm-channel:
> +    description:
> +      Max number of pwm channels.
> +      Zero index is used in case of one common PWM setting.
> +      Number of used separted pwm channels can be less than
> +      maximum number of available pwm chnnels on this FAN controller.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    items:
> +      minimum: 0
> +      maximum: 5
> +      default: 0
> +    maxItems: 1
> +
> +  microchip,cooling-levels:
> +    description:
> +      Quantity of cooling level state.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    items:
> +      minimum: 0
> +      maximum: 10
> +      default: 10
> +    maxItems: 1
> +
> +  microchip,pwm-min:
> +    description:
> +      Min pwm of emc2305
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    default: 0
> +    maxItems: 1
> +
> +  microchip,pwm-max:
> +    description:
> +      Max pwm of emc2305
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    default: 255
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    fan {
> +        microchip,compatible = "microchip,emc2305";

microchip,compatible?? Again...

The bigger problem remains of this needing a common fan and fan 
controller bindings.

Rob

> +        microchip,pwm-channel = <5>;
> +        microchip,cooling-levels = <10>;
> +        microchip,pwms {
> +            pwm@0 {
> +                      pwm-min = <0>;
> +                      pwm-max = <255>;
> +            };
> +            pwm@1 {
> +                      pwm-min = <0>;
> +                      pwm-max = <255>;
> +            };
> +        };
> +    };
> +
> -- 
> 2.14.1
> 
> 
