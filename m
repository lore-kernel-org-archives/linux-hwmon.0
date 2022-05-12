Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050A8C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 14:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355338AbiELOe7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 10:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355370AbiELOe4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 10:34:56 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEEB2618CC
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 07:34:55 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h16so6863682wrb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LuprtpJ06dq5t/dfZsOwpuZXBtU4EbDymnv83y3Wy+s=;
        b=o/mDg4TjUzNPpNIW/8i9F6/aeJmH/CBJyZI9jwvp5rzSJMy4IPk3YDlBdnMQfS21yy
         LqVhrTq4dmpHvq/zPNXeEUbZnyVUGaOfPo9da8zFwvgVHQwgXBZUXSKAJknTlk1LcIo8
         +SrmkV6kbr6may6Jfa24nTw90FF4PlUVBhD+zcV2hrRJ0zhGgMVub235ZtUkO4BdWj2q
         N7DFl/wV8Vr9ESOeBDmVY8140P55Y7w+pjTB41mpgH03af/4BOTqKxgqbpzJhkCV9DUJ
         XeXD29JtimX8PzskSPpGszgLM0rFXcJ+q2Uz0+Vdk079By9MrnHAbxna1B0K3X+wC6v3
         7J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LuprtpJ06dq5t/dfZsOwpuZXBtU4EbDymnv83y3Wy+s=;
        b=kP4IXnHqWIUb4QN+DnUL8fvdwg+Vs5oVhQwOj6cRLcI/2hjSv17E8ZZtPcZ42k+s9Z
         Rn1eBtLzqkX/ynJ90Mmfsg0tGXkEb+xwrAS4AbVwx8yE7mcmEuZuclIesojVR0rn0iTK
         TpZC99bLs4LjUhCmoNHpnrz8R+hbcS7GMlsk/MM8Q8qITZB6pBBaHvFuGyoviBB/bkbF
         4gkBhtZueKYio8nFVfYNPp2767zpkguV7REWQAabZelEbKCa3i0rU5BGPRW/JebhAlN4
         aGOYcO5DxbJ8EUUErelJEFuUMPwkCIEeDFIPY/1MZzcpHGiB8dmr2c7lr/GuAcVpf7Xs
         9dog==
X-Gm-Message-State: AOAM5335KF4nQN2LJ0faBEHON1sqvxU1wZQ7D/X7bm457AWKxfJnpHih
        RBqmLxHwhU0U5jih13VEL+vl+Cudqeba+UNF
X-Google-Smtp-Source: ABdhPJz0TUjYL2u5t8YGvfqFdxtaBsYJSXvqDpz+JJ8NWZWCyrdVUzmQm59FGzp+9PHG1T652Q7LeQ==
X-Received: by 2002:adf:fd4a:0:b0:20a:cee3:5abf with SMTP id h10-20020adffd4a000000b0020acee35abfmr28103117wrs.522.1652366094139;
        Thu, 12 May 2022 07:34:54 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003942a244ec8sm3137387wmq.13.2022.05.12.07.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:34:53 -0700 (PDT)
Message-ID: <894e5093-4ad8-dffd-c6b6-6b0a5f90814f@linaro.org>
Date:   Thu, 12 May 2022 16:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/2] dt-bindings: trivial-devices: Add xdp152
Content-Language: en-US
To:     Greg.Schwendimann@infineon.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <052c9885e92243fb99ada46e6a263c09@infineon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <052c9885e92243fb99ada46e6a263c09@infineon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/05/2022 15:26, Greg.Schwendimann@infineon.com wrote:
> 
> Add Infineon Digital Multi-phase xdp152 family controllers.
> 
> Signed-off-by: Greg Schwendimann <Greg.Schwendimann@infineon.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 550a2e5c9e05..fc2164c4d108 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -143,6 +143,10 @@ properties:
>            - infineon,xdpe12254
>              # Infineon Multi-phase Digital VR Controller xdpe12284
>            - infineon,xdpe12284
> +            # Infineon Multi-phase Digital VR Controller xdpe152c4
> +          - infineon,xdpe152c4
> +            # Infineon Multi-phase Digital VR Controller xdpe15284
> +          - infineon,xdpe15284

I guess the order is rather '8' before 'c'.


Best regards,
Krzysztof
