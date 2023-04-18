Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C49C6FD18
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Apr 2023 17:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjDRR1h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Apr 2023 13:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjDRR1f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Apr 2023 13:27:35 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7649C176
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 10:27:08 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id fy21so32173920ejb.9
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681838827; x=1684430827;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYEHg2sosnOY0pAhC25Z66tH7y5mKmQfmFvbWvEdvY8=;
        b=jUWAYBzciOdxMLyBKAteFPWMBnIQ907UER8Br2Vyks/pQVV58YB/3Ls5C7XX2LI4U2
         jfNZziZrx0CA7NJJ38GSlS9SOx5z0Lyc+XfLua95FgQP+Jd1xUpnpxsz1MuqPw2AuZpz
         ouVZ4wjxyv80Be9cT5epF09Ijk/TyAbTP0U4+54XlyMp/D5R11CQmJYXI4EOneLwBagn
         PWwQ49zREJ+rtsUSQLihNcpEbLbhcvP5C9a44bagUbOn6BwCfBDmECMzIiKzk53D0LS2
         juTtN5FQ4ke7m49HEyIaAGsTHuqeC/x05yrMil1fHl4mm8Rmg9ft5Hq6a6dGm1voGx43
         VhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681838827; x=1684430827;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYEHg2sosnOY0pAhC25Z66tH7y5mKmQfmFvbWvEdvY8=;
        b=Yyw4uHlnz79g/h3Qx3GQY1D4h6gwBLg6uXG/UIljl2lnsbpQXncd1gNSv29tLYhuHz
         Kb4b4E2VJTGcTJjd9pzPQqXSkQEL9jPcEMaAT3z8K6MmUD2Zm/v7eW6cqxr2vrdwmTQR
         jGl+QURUS/aY7H9Fkv04HeEuC2CfTnhqBD7NKuXwruuDD6MSp/BKbwR9Xvnhm2xPzxGX
         oJJq/AHopi21DhCt5Rk5Jv8Hodm/s0+hsWKC28J1K0t9ojIZE+lPxkoMFzWHXRkNu4kn
         YAMzyLrzoRFzEWaqwZJlQ/nWBzBq/6Oo2Oio/f6gwMcHBAvMuCuULfYYO5Dz9emRBARM
         wg5g==
X-Gm-Message-State: AAQBX9cMg6DKmm3ycxNT+A6I5Pj2xiZ81nwWcRElYyy7J0BxrfSAP9zq
        j4zijtIjqMRbJ9LFtqEmE7A58g==
X-Google-Smtp-Source: AKy350ah1qKGBvGjkmYLETOZpHpiL7PCK1pVCgTZyqcOkD9XXhiJaftKDw0p33OVAjltW7b8DVz1pg==
X-Received: by 2002:a17:906:3e90:b0:94f:6316:ce8d with SMTP id a16-20020a1709063e9000b0094f6316ce8dmr6593515ejj.34.1681838827296;
        Tue, 18 Apr 2023 10:27:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id j25-20020a1709062a1900b0094f614e43d0sm3829592eje.8.2023.04.18.10.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 10:27:06 -0700 (PDT)
Message-ID: <79416f48-1c3d-6139-7c5f-de1907383a85@linaro.org>
Date:   Tue, 18 Apr 2023 19:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 9/9] MAINTAINERS: hpe: Add GPIO, PSU
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, linux@armlinux.org.uk,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230418152824.110823-1-nick.hawkins@hpe.com>
 <20230418152824.110823-10-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418152824.110823-10-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/04/2023 17:28, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> List the files added for GPIO and PSU support.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a3b14ec33830..6df959ebf523 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2239,7 +2239,9 @@ M:	Nick Hawkins <nick.hawkins@hpe.com>
>  S:	Maintained
>  F:	Documentation/hwmon/gxp-fan-ctrl.rst
>  F:	Documentation/devicetree/bindings/arm/hpe,gxp.yaml
> +F:	Documentation/devicetree/bindings/gpio/hpe,gxp-gpio.yaml

Since the drivers are going through subsystems, your patchset is not
bisectable.

Squash respective changes with respective patches.

I also suggest do not mix three different subsystems - GPIO, hwmon and
ARM SoC - in one patchset.

Best regards,
Krzysztof

