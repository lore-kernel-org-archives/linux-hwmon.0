Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F15C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Feb 2022 10:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiB0K7Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Feb 2022 05:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiB0K7Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Feb 2022 05:59:16 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5E64DF66
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Feb 2022 02:58:39 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D2FA3FCA7
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Feb 2022 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645959518;
        bh=2bOCiusGq2ul/MWsE8cSC2kGM7wquiIO9nYKtCZH63I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=bATA61xMq9rLGkt6t5BC9H4jpR6EW41nnCA5E1ZX4+Tck4E70nDedfeDVvq6Izoiq
         kc/Wl7VbUNH6FpGc24aO4SUfNaKVYRAsGwwhIAIPwsg1hV5nc33lAIKDD0ZOnd4Vc6
         c14Bp0VE5/wPE5lvRX/EWTBqynxB0ntgN1gMgOmb8eGyXCF1Yuijms4M64o9Dni8MB
         pNdkb2MdJwhjPMa+1DMNtOelJIjPpP5foMh5Otwg4GhxxwQ+rdw7b5e9pnm00Jv2ch
         tkjSMXQtUrBnopJbUfbVyytzVmyWMsMP91DgTxdAPDPMPNhG4pp4JubUSr+nEPQI2G
         t2AhGb9NRCeIA==
Received: by mail-ed1-f71.google.com with SMTP id r11-20020a508d8b000000b00410a4fa4768so4048413edh.9
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Feb 2022 02:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2bOCiusGq2ul/MWsE8cSC2kGM7wquiIO9nYKtCZH63I=;
        b=Fo/7AYZT2IlKCYEtEEMPk8YvaXugdTKmnrI8kdiNWblbrbwRzQGlECYRSOBuurpTxs
         kBFk/fc2RnxrF3RWEKGyOBB093rKb/N5mayCU/h+CNlYkJanBtP39T43Vixr6mLvhKSZ
         pk5bqj+IN5gfXNQCOznltbBWcz2p8V2T0VurBkbIq8zq+mHMXoQO83YQYbaoWeRy8P6F
         mr5bxXShr6YV0nw7IQ2GX+N22zXkmCH5/0QTIjCINlssfcP1eVwkK+YoD6c2vTUJRnHl
         zV2FrvNN4ESnbrvCd+2oXas5PTdKOljXKpM532DsgNBmEh+Y5HMtryhwp+dHfR56yWHA
         H+Qw==
X-Gm-Message-State: AOAM530m+dxxtRN9+hok2oHIGTBGhmsqCkWQcUsjZV9/4EKUFrBsi3eo
        Qfza3MeixWxDyzkqsKlT83M3Dr4qSXHuRYAddY/XGcYbsUUe2oqTILO4ZZt7OUE9Ck1Tzgf4FvR
        g7LA3kCOXbN9T443BEGKkHeXGRz6ou/ZLBPQLHh3P
X-Received: by 2002:a05:6402:350d:b0:410:b608:ff4f with SMTP id b13-20020a056402350d00b00410b608ff4fmr14922906edd.89.1645959518000;
        Sun, 27 Feb 2022 02:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoFbq1X2KP1qKbtNx82/SCmsEevJmYxZ2Bf2LLbkURS/vDpov5C3QYi0mxgeV/lId9Uap8Sg==
X-Received: by 2002:a05:6402:350d:b0:410:b608:ff4f with SMTP id b13-20020a056402350d00b00410b608ff4fmr14922898edd.89.1645959517865;
        Sun, 27 Feb 2022 02:58:37 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id t2-20020aa7db02000000b00412cd5d5148sm4403973eds.47.2022.02.27.02.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 02:58:37 -0800 (PST)
Message-ID: <e6f3ceb8-7b02-020a-7b2c-07520f6d9661@canonical.com>
Date:   Sun, 27 Feb 2022 11:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] dt-bindings: hwmon: Add nuvoton,nct6775
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Renze Nicolai <renze@rnplus.nl>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <20220226133047.6226-5-zev@bewilderbeest.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220226133047.6226-5-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/02/2022 14:30, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 

Bindings should be the first patch in a series.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
