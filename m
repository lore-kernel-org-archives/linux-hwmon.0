Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4211C77B78
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Apr 2023 16:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjDRQRo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Apr 2023 12:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjDRQRl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Apr 2023 12:17:41 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC0D7D87
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 09:17:35 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id xi5so74602049ejb.13
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681834653; x=1684426653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42KJEhE8WliDXadlwGw31IE1RyZkhHqOOOmNpPRT+PM=;
        b=KCkD5CmQO+t1OWUIJ85aTWtdR5nQVPCXThrtU2ULddBE8e55fIcm8G/6X+Q4FKMe4y
         /Cbj5yfUWNiLTjsezRegm89xel2eo/Qp9prVAL9S6+iXiFCaiqaq23dK2zI3CAS/uVMN
         AbwJZVGYLN/41maNVhvHPyCHNstzksL12POramTmvIP1zGhW/86guIamUiGrprf3oKkC
         ywDIGZPVlnxcR1rHVbAmK1NmHdSWmUn/ENLvc6QRp1m+rKoEBlxYhr4O5adG2m+0oe9c
         fu641DM9rWcBHmsO+KaQxGyZuw21UKh/O/ihKVt2jSoD0/7Ff4nvgtSZeyCEz8av1dMi
         zstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681834653; x=1684426653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42KJEhE8WliDXadlwGw31IE1RyZkhHqOOOmNpPRT+PM=;
        b=kL77r7/tKk17Av/33JwsyWZl8r27/66R6bskbdbas4BbpWlMErhyIUjmZVI+qHCCVS
         iKSe/x+Lz7MrmT+HK32/Hanp7Bwq4/7sQYWUokEOy7tAnhML5zGib334QyiK6Zc12IHi
         khjBuitZWK6UfNqIkmwzCh3l6Kxr7WQMi378OVNJ2rgTDqxN6PWu048qtI9Rk7a658fE
         lV/JR3vF5tSH3pHB/P9m6cFD2o8/3KpnMcFozcw4Jw0Pltv1oaoUfmjxCfbTp0uEUSAT
         52LE3kQux9qd1EN0uoC0drmG8zfw+XgIxg9UZyhzgsmSwG2SJ2Eca+Wty/gbj9blreIv
         /gOg==
X-Gm-Message-State: AAQBX9fhQNxslO6Q3+tb3BwxjDDb/GyyfHTiMuDCF6/SovCROein/DGH
        544p/aAV4rXU+qaVD/sy3ACrnw==
X-Google-Smtp-Source: AKy350aBHyNXgj+nK+6tmXt0ir6hXeImF1Efi4IRwoEL7JHqQ/WlQDxsQIHb363ensKzw8OJfVFgWA==
X-Received: by 2002:a17:906:f14f:b0:94a:171:83b1 with SMTP id gw15-20020a170906f14f00b0094a017183b1mr11331041ejb.2.1681834653685;
        Tue, 18 Apr 2023 09:17:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7dbda000000b00506b0b80786sm2020992edt.36.2023.04.18.09.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 09:17:33 -0700 (PDT)
Message-ID: <742f546b-3952-32f4-9f20-3a355785d162@linaro.org>
Date:   Tue, 18 Apr 2023 18:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add binding for max6639
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230418113217.781524-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418113217.781524-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/04/2023 13:32, Naresh Solanki wrote:
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.

Subject: drop second/last, redundant "binding for". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  .../bindings/hwmon/maxim,max6639.yaml         | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> new file mode 100644
> index 000000000000..20b28cd36555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop blank line

This is v9. Where is the changelog? Where is previous authorship? At
least some parts of it? Why this has less properties than old one? Why
this has more mistakes than the old one? Go to previous patch... or fix
everything which was already fixed.

Best regards,
Krzysztof

