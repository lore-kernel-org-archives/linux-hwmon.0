Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4FBC43334
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Jun 2022 22:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiF3WMv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Jun 2022 18:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiF3WMk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Jun 2022 18:12:40 -0400
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D611E58FD9;
        Thu, 30 Jun 2022 15:12:37 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id p9so283535ilj.7;
        Thu, 30 Jun 2022 15:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uEYiALVVqC9pNT2EOGV6KbYNg7mGQno5eraMM95U0FI=;
        b=kbETdLcuC7+9IJAuWotKmrqwsvDITyjk18F+VRlNfWbvO5hDIv9JePYlY8LLOztPE8
         MdczSkFm2WBmPFOKfsQnRffD4LjqiYRVZT6PShPuBzriVqR/ftbiqnvVqHKyQuuxUk4k
         uwuvb3+qEYs5GxRkmPBfLqX7Gr2bz49cjx5gHm/8DvTB7XQK451wvcYcORGQZwAZmj5n
         ixs+THVbacHc04D4Jtpirly/N6OLYPRX3qYRaOobs4TbLdPJYLZ+oyLDSvuvhPhEF5k7
         vTVjEF6cZs6mp7BxKFbci7yD8Rr1ef5y4GiX/sPxWvIDY3+XNrdsWnlf7RhW9QYXQ30t
         dQmQ==
X-Gm-Message-State: AJIora+429FSsBOYsRaMDaeyoC5tKGhUUTgZOik94ppTviV74tnqZlsu
        ha3C5gAOW/I7HEJyArLLDdl02mOdbA==
X-Google-Smtp-Source: AGRyM1vDkToWbOoz2ljzZuj2fVl5AP8zEWgeQwQYd85sxaQlj7ewiUDOGUK4ons2Pcz/r4M4ZeDetA==
X-Received: by 2002:a05:6e02:1c01:b0:2d9:a3ae:16be with SMTP id l1-20020a056e021c0100b002d9a3ae16bemr6624007ilh.68.1656627156993;
        Thu, 30 Jun 2022 15:12:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r19-20020a02c853000000b00339dfb793aesm9153635jao.86.2022.06.30.15.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 15:12:06 -0700 (PDT)
Received: (nullmailer pid 3411989 invoked by uid 1000);
        Thu, 30 Jun 2022 22:11:57 -0000
Date:   Thu, 30 Jun 2022 16:11:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     michaelsh@nvidia.com
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip
 EMC2305 fan controller.
Message-ID: <20220630221157.GA3402568-robh@kernel.org>
References: <20220623165217.59252-1-michaelsh@nvidia.com>
 <20220623165217.59252-3-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623165217.59252-3-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 23, 2022 at 07:52:16PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add basic description of emc2305 driver device tree binding.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v2->v3
> Changes pointed out by Rob Herring and Guenter Roeck:
> - Describe separate channels of fan-controller;
> - Remove pwm_max property;
> - Fix compatible property.
> Changes added by Michael Shych:
> - Fix dt binding check warnings.
> v1->v2
> - Fix dt binding check errors;
> - Add descriptions;
> - Add missing fields;
> - Change the patch subject name;
> - Separate pwm-min, pwm-max per PWM channel.
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml          | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..d054ba46ae23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2305 RPM-based PWM Fan Speed Controller

RPM-based? So there is a tach signal too? Don't those need the number of 
pulses per revolution that the fan provides.

To repeat what I say for every fan controller binding now, until there's 
a common binding to describe fan controllers, fans and their 
relationship to each other, I'm not signing off on any fan binding 
doing its own thing.

Rob
