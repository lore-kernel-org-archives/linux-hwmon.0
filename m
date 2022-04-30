Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080B2C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Apr 2022 12:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377377AbiD3NB6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Apr 2022 09:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiD3NB5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Apr 2022 09:01:57 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8BC74DCF;
        Sat, 30 Apr 2022 05:58:35 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id e189so11161477oia.8;
        Sat, 30 Apr 2022 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ciKZAgL4Y32fQDktpp8pgT/D9mFOYAbHr7EpiXlwflg=;
        b=DzZzEmyFRHYyDcTBj0CEp6Ote2vz0QXlAZsSgvWMwZT0wfFWRqDshURzXnHE6+Duyl
         tGJpoTaoSQBW4Q8SzDhUIAEL5K5AfxaHpVDPEmpHPCOCMaBtzOjsptIH9LPUWt2EJ/qS
         o6C9kIk3SWXPR1IovAi2Otnq7xK7CmU5G27POuQNgAC9jcfB4coUJa2+9TU32GsKIZvD
         UCFDKJthobxBw4WU6w+IFNb35Wh7pWTZq0PUNxOLoVI7Cfz3JAMhAr4iYc5kVUz3cCHZ
         mi6LJCBY166hjWHIvZc7ePz9q+w1fo8l1sYo7CgIdHfgjzQSb0vA/tGEhYhx/S94knFr
         sN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ciKZAgL4Y32fQDktpp8pgT/D9mFOYAbHr7EpiXlwflg=;
        b=OLjFIACQAxwOcSRr89WlTLgXf5w3IdCGyJzAae1/i1oLp3xkNZ7pQhS0RVxi4W8YMa
         g44jZm5Vbre8KuAICU18cY6bD2fuMxhd4bEJtSxMOsV4HTwieU+gLm4aL7I0C5EE4Y6X
         Iv/HGE4M/GwB18zSOnG8c6ouWcDHXHJlHC9sbOOSBexUqKBGaUgtJALua37pQ/o+h7hI
         gK89erqQUp8m+Z6S4upPuJrnBAjxnKJA2lMdJ8IQtVTHwkzTGAm6qB24XY8suC+e+/Nm
         IOnibWI/+7Q/hMCftkM86k6W5CVp28v2pHCjIgZOeaHI9KxJFLbZhkLOt83eiJbrucCE
         GBww==
X-Gm-Message-State: AOAM532jfihi2Y72RUlNJV/+wQ1/ZDS1fcH28wpsYlpSOEV6T/UH+ldu
        Z062HNy4C8/aBlktAjyLpSLkMasT0ofYzg==
X-Google-Smtp-Source: ABdhPJx+vtwyvt9yAgitgg+Ig7W3fz6/XYc//dfziW9VWg8P8Y9X/4PvCkw/xkuUg7eA3rq2K5jrew==
X-Received: by 2002:a05:6808:ec2:b0:2f7:34db:691e with SMTP id q2-20020a0568080ec200b002f734db691emr3660139oiv.252.1651323514636;
        Sat, 30 Apr 2022 05:58:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n44-20020a056870822c00b000e686d13894sm3991394oae.46.2022.04.30.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:58:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 30 Apr 2022 05:58:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt
 binding description.
Message-ID: <20220430125832.GC1888736@roeck-us.net>
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

I think this needs to be explained further.

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
