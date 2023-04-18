Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0661BC77B75
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Apr 2023 17:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjDRRLH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Apr 2023 13:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbjDRRLC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Apr 2023 13:11:02 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7A2F1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 10:11:00 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id xi5so75018981ejb.13
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681837859; x=1684429859;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFT9JV5GyQiNBSCe1AemNF0qZg+yfPpP2DZKZsBupIQ=;
        b=uTY1Ft02GOPK/nE7NmdYz03m5k1rE5T7q7DsFkj9wWIv9X5Nj829dMM7p3LYlSZhwp
         qoLK+zafpJgGnfuJUTYpoWjHkDgWqyg0OsCsc161Dbt60SRe3wskoW07Arxqvc+ACNPz
         qtCcgsgq/9sNPmToRVrCECVdvpLAMg7RI0mTF9M6TuXFgiYHFCpD8iekawiu1Kn5ZahR
         oaIiBKzB+TDnaeKkmlFI1w/l8qViMIwvHq1rcRDplYeOM+wqLQ/pbW9etV4Q7Pn/b+Ux
         DkATLzqkNCe1eyx8cGMDh2Rp4URG/R4AGMpb8+B5sJmsNGlXevWW3GI7O9XvTYrj8use
         zV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681837859; x=1684429859;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFT9JV5GyQiNBSCe1AemNF0qZg+yfPpP2DZKZsBupIQ=;
        b=ku4RtRs75ePfLODoUF+sDEmeSe2s82kvG8T3RY4Tt+8TFnNaKt5G0ya7rC7zA/j9Lp
         PrrmYP99CHqjv/XVaW9qv38fw4Ex13twyc2q0IV9NTEYuQOWQFuJ+3IuvNJCzuZVxsa1
         xG6D8a8+3dOxLkLGKTqXf2ZDsK6cpFyQYJeVVv5YY3DUBmMOHQlIABsYzR5T5kdQtG2p
         3OhsZKugvhi+YTU7xiKse8w2BVZ/AUrDq8ZMOme5BjHoMqG7o2Q9UyaglSM9YK5giE2O
         obB+6su2AB9qpsrgqYKypCVw4m6CgpmodwQhS8QCE1KETel7YbUKfjl7COHVVHKwmhhU
         Grqw==
X-Gm-Message-State: AAQBX9coq/8bxPsGLzzlEs1LmiygUsb0AG4VjSbLfGpvVI8n4g4mma3d
        bVbrX9V7KOytajhWx4XBQzGWJw==
X-Google-Smtp-Source: AKy350bQGNmAiNJ2cQ/83+69tDcOcUCNQ54RcQOnFePP1/Ykji8wIJQX7jULIVWk6a6vCFe34YIDKg==
X-Received: by 2002:a17:906:d8a9:b0:947:72bd:f72a with SMTP id qc9-20020a170906d8a900b0094772bdf72amr11334696ejb.72.1681837859058;
        Tue, 18 Apr 2023 10:10:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id s13-20020a1709060c0d00b0094e729d333fsm8221908ejf.222.2023.04.18.10.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 10:10:58 -0700 (PDT)
Message-ID: <30319890-353e-bf52-fa19-0cc7aeb41074@linaro.org>
Date:   Tue, 18 Apr 2023 19:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 8/9] ARM: multi_v7_defconfig: Add PSU, GPIO, and I2C
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, linux@armlinux.org.uk,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230418152824.110823-1-nick.hawkins@hpe.com>
 <20230418152824.110823-9-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418152824.110823-9-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/04/2023 17:28, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the CONFIG_I2C_GXP, CONFIG_GPIO_GXP, and CONFIG_SENSORS_GXP_PSU

Why?


> symbols. Make CONFIG_SENSORS_GXP_FAN_CTRL=y

Why?

Please briefly provide rationale in the commit msg.

> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 084cc612ea23..fcfbcd233fb8 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -405,6 +405,7 @@ CONFIG_I2C_DAVINCI=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_DIGICOLOR=m
>  CONFIG_I2C_EMEV2=m
> +CONFIG_I2C_GXP=m
>  CONFIG_I2C_IMX=y
>  CONFIG_I2C_MESON=y
>  CONFIG_I2C_MV64XXX=y
> @@ -478,6 +479,7 @@ CONFIG_GPIO_ASPEED_SGPIO=y
>  CONFIG_GPIO_DAVINCI=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_EM=y
> +CONFIG_GPIO_GXP=y
>  CONFIG_GPIO_MPC8XXX=y
>  CONFIG_GPIO_MXC=y
>  CONFIG_GPIO_RCAR=y
> @@ -527,7 +529,8 @@ CONFIG_SENSORS_NTC_THERMISTOR=m
>  CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_INA2XX=m
> -CONFIG_SENSORS_GXP_FAN_CTRL=m
> +CONFIG_SENSORS_GXP_FAN_CTRL=y

No, we want it to be module.

> +CONFIG_SENSORS_GXP_PSU=y

Same here.

>  CONFIG_CPU_THERMAL=y
>  CONFIG_DEVFREQ_THERMAL=y
>  CONFIG_IMX_THERMAL=y

Best regards,
Krzysztof

