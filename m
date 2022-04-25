Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA034C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Apr 2022 18:49:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240823AbiDYSxB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Apr 2022 14:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240136AbiDYSxA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Apr 2022 14:53:00 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2DE1299CA
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 11:49:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id i27so31380571ejd.9
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1hQTA1PGEYJsN4F8Y7LWNocY0SyIgUb8snsbrurEsxY=;
        b=kUe9aP3x6KEkRUZaYvCY++blrSutJseBMZRhCerxhLL1c9xR0GoAra5ZoTKKTrvF7k
         /qmV4Wkd74AywNlRdILJq17jgbxPmSyKaIlztwopoyTJas3OXUp9EVeJyPHO0AqA7tX+
         Df6G2gMcSCvgfIEVC5/9upKiSIpd4W0pqAQdjvKneSGWLIdEIQB7ablwhGsDWd4OcBrW
         Hnyni48nvIqifVqc0NtxS/J4h5kJkg0OK4ysSU+eLdHXHlDZcgMONGQXobfSDyeR13hV
         ZXq4P+Z/swEmHVMSfCUjIVa2UTfaqNU1E9ps0xWn3l2ZbAHeCzuxQMhzP8xrgp0jhOl7
         X7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1hQTA1PGEYJsN4F8Y7LWNocY0SyIgUb8snsbrurEsxY=;
        b=6DwehX8yBx4pkNEugHMusjmRbhUDD946DLvqK7qytfYepls+3DlMoRVhZtCV0z7ToX
         vEM0VbQUTXKt3oBkGcxqtHUnh3GMexx0ZQxZ33+iLcX0GgvFpAaL6whWYeDUbm74RSg4
         ObFx6F0KtZrC0wuBjzuKi9kZOQjd7h/cJgTkqQZllLmF4wZkUYOXIx5V0diO0ts2iE4U
         VfxFXVCNK4xNQRPv/yfy5a53a6gAo8Ya0/aDJYSf0ruAYU7RBGk1UlmB0j8jHVZ3bBTa
         2Jgr3KUW9+jSAfDbGPaAUDyeTrFWxa9lzNft0uks4l1qMcgRCH0GaUPwrdoihBd8PeSH
         lDxg==
X-Gm-Message-State: AOAM531QmyvDaS0dwV+Hk87glX8m/+2k0fA/DtfYJ6xBOAoro4Ab8sj0
        xfP8FbkgakA9vFXb8DkT/nwhoQ==
X-Google-Smtp-Source: ABdhPJzUt2DP4UQfV/ZTp6ZBoo8SY1ibuzP80xsKb9tbKknWYQr2g4Vfi4eM+BJ+L6AuN5QTPMVf8g==
X-Received: by 2002:a17:907:a40e:b0:6f3:998a:a082 with SMTP id sg14-20020a170907a40e00b006f3998aa082mr5103914ejc.229.1650912593827;
        Mon, 25 Apr 2022 11:49:53 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906709000b006f3a8aac0eesm278385ejk.0.2022.04.25.11.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:49:53 -0700 (PDT)
Message-ID: <de0b6b20-7b4d-64cb-0ae0-457bbc78cc59@linaro.org>
Date:   Mon, 25 Apr 2022 20:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Atmel AT30TS74
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <abe35ea9-1929-941a-6391-2ce1bc047161@axentia.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <abe35ea9-1929-941a-6391-2ce1bc047161@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 25/04/2022 07:59, Peter Rosin wrote:
> Document the Atmel (now Microchip) AT30TS74 which is an LM75 based
> temperature sensor.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>   Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> index 72980d083c21..8226e3b5d028 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -14,6 +14,7 @@ properties:
>     compatible:
>       enum:
>         - adi,adt75
> +      - atmel,at30ts74

Looks like wrong indentation.

Best regards,
Krzysztof
