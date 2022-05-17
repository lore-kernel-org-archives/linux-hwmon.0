Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6670FC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 08:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239176AbiEQIXs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 04:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbiEQIXs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 04:23:48 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930EC32062
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:23:46 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id kq17so33201948ejb.4
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NpWTW4gBbEyARw3G4XyJHpMfn3c5u70S31+sEo6u+2k=;
        b=WLcAEYmasw2mzvMgya8+gNMJPlSyiYeNPH/KuZF271hNtGg8FzOSGmbO5hvy14k+NR
         0KrW0lEVQ+oi/u8vbPb6xIXaoU7YHenA7Rl56yI2UB7VaLFkSB/rtqE3A/oZLO+nmYeS
         n6gWGg2/I09ynL5xk98BDy67LbAcECSqtRLHaXZTZaEpVGf635KBrsuUuJkXpCapZszZ
         +3rweJAqDmiM+0xu6GF0ypDHShQy4gSS3Qm3M+kygVLutGKqCopEA5k86b7fgnjn0GvG
         XLye5WiOfeYHJ/fr2pVLFiTguOAT+OYoC7fjdG48a1qfb0BtGByVqIH13b+1RZ4NPNEA
         G5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NpWTW4gBbEyARw3G4XyJHpMfn3c5u70S31+sEo6u+2k=;
        b=YqLsh1wQqfS5v67ve2IPQOhwACay9wys6P2EcIuepm/ray74M0943ufP6LPx7jNML7
         j718DIlJshCeabLsJia/RU+z5DrkeikYsyQriZTqjK4izRoez91vkKXaqD0Ppge3kqpV
         XGc2mDHd8YyyK5CM2lj4Nwf/QvkV+hoeRWwwB/ASmtPF3dIlO4QCo5WeKwQuqs56Q+jY
         8Rd33K3mWAPYuKt8X1a0hdw5a4+tU7XVjzmUrf8JZUAX/R5FFZ0+C7jL/jdrJOFWGHk+
         kPmv0XOavgr3CR21Zso25YgDvPIu+q49/TllJsk3rBPFS6yFZr0Io7mH2b20jDpCMMAi
         HQcw==
X-Gm-Message-State: AOAM532adGKzznnO6b1929KTncU0LojvI11eHz1Kw5Lxye2UBQ2BtIpo
        xn4mNu4PXi4FkIfSTjOAH3h6lg==
X-Google-Smtp-Source: ABdhPJy4wYoBokCYBBp/j2lYI4c6CrpzqLucCqW+xQFuH3Mf+2JADLB6nVs5xxs+kp3QKRVEq888pQ==
X-Received: by 2002:a17:906:9743:b0:6d8:632a:a42d with SMTP id o3-20020a170906974300b006d8632aa42dmr18592078ejy.157.1652775825150;
        Tue, 17 May 2022 01:23:45 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i6-20020a50c3c6000000b0042617ba63besm6646615edf.72.2022.05.17.01.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:23:44 -0700 (PDT)
Message-ID: <02062376-86cf-dcee-7560-2edd55ee16de@linaro.org>
Date:   Tue, 17 May 2022 10:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable
 property
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220517075703.16844-1-holger.brunck@hitachienergy.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517075703.16844-1-holger.brunck@hitachienergy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/05/2022 09:57, Holger Brunck wrote:
> Some devices can operate in an extended temperature mode.
> Therefore add a boolean ti,extended-range-enable to be able to
> select this feature in the device tree node. Also make sure that this
> feature can only be enabled for the devices supporting this feature.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> ---
> changes for v3:
>   - rename property to ti,extended-range-enable
>   - use allOf:if to check if the device supports this feature
>   - rephrase commit msg

Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch` helps here to create proper versioned patch.
Skipping it makes filtering of emails more difficult thus making the
review process less convenient.

Then use standard email-sending tools to properly thread your patchset.
git send-email for example. Kernel docs also explain this.

Currently, this patchset is not possible to apply due to missing threading.

> 
>  .../bindings/hwmon/national,lm90.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 48b7065798b0..1c39b1b4011b 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -53,10 +53,28 @@ properties:
>    vcc-supply:
>      description: phandle to the regulator that provides the +VCC supply
>  
> +  ti,extended-range-enable:
> +    description: Set to enable extended range temperature.
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - if:

not:
and then skip else

> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adt7461
> +              - adi,adt7461a
> +              - ti,tmp451
> +              - ti,tmp461
> +    else:
> +      properties:
> +        ti,extended-range-enable: false
> +
>  additionalProperties: false
>  
>  examples:


Best regards,
Krzysztof
