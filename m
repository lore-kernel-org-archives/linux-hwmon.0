Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51488C7EE2C
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jun 2023 09:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237482AbjFFJak (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237476AbjFFJai (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jun 2023 05:30:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33901E69
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jun 2023 02:30:36 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-973f78329e3so928217866b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jun 2023 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686043834; x=1688635834;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Viw2nnC3blVpFheYhKwW1SwUvlOAxxKbFIk15YR13+4=;
        b=iAvxqBnRDuRNkFhMY3ewJC9P2lhEKxRz324FjO6zeK/KY651tgVn7BoO5V5fwmFTtQ
         blC17RmSvJiHZVu3bXFMVYCNrh098iGaUS5YDKvi9CZtjGxYXo3Nd/5MW9zGXOl4asQi
         APZextAn486ja74pKSH5qzABJRa0auE+7DKNuGeoYA7l5PrG1VfRJ6d7XsmhVJRa7BFc
         2qP30/7kWN/L3/a4p68RQ0mNZXxEAnWyUlMYqru+IVMxdVSmFEOFJXE1Rz5Eoli99GDG
         LjseRROx4TAoAZIXIUK/q/sNnN9lOncYs07HTOQ82ODkbZSTItM7OvtKHMfeWS8Ef0oo
         xBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043834; x=1688635834;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Viw2nnC3blVpFheYhKwW1SwUvlOAxxKbFIk15YR13+4=;
        b=UM9a1FjaDcLH5NDj68THayJwO+qZ7T5Qk9zfFq2keQPZNtScGn2qircNUO8zrUtJJA
         xn/B3wZfYXCIkm7GUfXXAu4HtMpiO1jiNDuMCdvuGr66gtwQVPGrdJezQpPH+9QyRjhC
         Y8WiKSrtdn+BnJwH7Csczmbk/Z02Z6fFDKmp9Wg2PD5JFrTZSkj+yzmqGWyUEHQuwfIG
         6PHfnOT3u1sNR7uix77Iq80YP1W6OT324eZJJoWOwlEWNAVunXiekxRxVCsUOzZ+TtTE
         eK8C0GTF2SNslVPipXUjXF2d7XdR9c7AP4RRDjYvzxXYttZJUeUMoGPV5LYOnEt5NBVo
         U1lw==
X-Gm-Message-State: AC+VfDzLfsDYLn1c9ioUozQpdDfcooE9JEJ6eGXRTPZayVM+8cyLGVDj
        5TVqJE7rhzF4pB1DkirUPX2xIA==
X-Google-Smtp-Source: ACHHUZ4a+/ZNlYDmzxmu1Y0WAyG8+M0Hzk6ETn1y1AsC8i39wQZKOqxfBRxJU9LuTUQ/xoSd+mwu7w==
X-Received: by 2002:a17:907:3e9e:b0:974:1eb9:f74e with SMTP id hs30-20020a1709073e9e00b009741eb9f74emr2392102ejc.3.1686043834607;
        Tue, 06 Jun 2023 02:30:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gw14-20020a170906f14e00b00977d194bf42sm3015926ejb.161.2023.06.06.02.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:30:34 -0700 (PDT)
Message-ID: <f00f0d38-0685-f9d5-9537-4ea09aa170a0@linaro.org>
Date:   Tue, 6 Jun 2023 11:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/5] dt-bindings: hwmon: hpe,gxp-fan-ctrl: remove fn2
 and pl registers
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20230606014234.29491-1-nick.hawkins@hpe.com>
 <20230606014234.29491-4-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606014234.29491-4-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 06/06/2023 03:42, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Reduce the hpe,gxp-fan-ctrl register references from 3 to 1. The
> function2 (fn2) and programmable logic (pl) references are removed.
> The purpose of removal being their functionality will be consumed by a
> new GPIO driver.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

