Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02291ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Sep 2022 13:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiIKNfZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Sep 2022 09:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiIKNfQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Sep 2022 09:35:16 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456F426AE2
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Sep 2022 06:35:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq23so10669060lfb.7
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Sep 2022 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QlVRgO/cxLzkQMXlTq+j27uwBVDl70ffY/8cBjcxA7o=;
        b=J54BrCgxF4HVfOhDGi30ygpf0pUi3CG1IwNZTXXn7aL4skdmFnlp8WPUWiBNX0Fu2b
         0If6k6Q5p1FHayfINaA4DoshW4hQ7S6ynyXRP/R94I8BXnaIG87G1r9s14YQqJDr5Nf/
         NOIRRsP+KZ17cQ2cRfZ00X3AOO7JTysmll93g6i4a7u/Are18m+oPb+rpMdVYa/xh8Wi
         3aejEEUcLsO1Jkp9/N9okSom9cESnjsXgeXPxDZB/r453KAeo84AqBtKE0/snWa1R545
         LSrdUp1+rTJHnpr2OD6C/dEZcvhNma2gx9B+heDAMt/In5wIDFzYt+35ZS5wuT+eixFX
         Izyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QlVRgO/cxLzkQMXlTq+j27uwBVDl70ffY/8cBjcxA7o=;
        b=vnmItWuaOsoHI+sBmO4JNUwn0P3NzqWj2+rvWFhXga+uSUBYDy4LC+LsXTKyqBHN3L
         2v2OR0IWx+YNndaHrsfma7EB3kLMb8eIWBhl7KDJY06kqt+zY1viFJjS2mBny9GjSmS7
         zKaN1sNKvUlvSQ8GjiY/k5yYjWS74ZS0z7KzKeAnGZVL8jw3TilE5kqOhMvXVU3h6fNf
         8dagqnqZK9weuKXUwFT+fyxO/cznw/6npj1Viq1Jubuy6DkQwxnXUlPUpAOqHZUxNVh8
         2aU4jfh2Hn6EQ2+pviS8OlR3wV8Q6Z7ghuMa+VRDHnv8ZxqvfuV8Vyvffh/j/liGQTqI
         PSVA==
X-Gm-Message-State: ACgBeo2m7D3E1tpY1iMd35yKJtlQepO2x/Q+Y1S45xLm/6SzP+A7DjfJ
        GN7is5rXD7NWg3d23nHrvKFlnw==
X-Google-Smtp-Source: AA6agR61CK8CK9Swd5vV7gek3vz+DGp2FC0Jgm0BFfEyQtU9+TQN+EcHbpzoO7UZssxwhl2LR9uQfQ==
X-Received: by 2002:ac2:5107:0:b0:497:adac:7305 with SMTP id q7-20020ac25107000000b00497adac7305mr6451873lfb.32.1662903312669;
        Sun, 11 Sep 2022 06:35:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u13-20020a056512128d00b0048b256bb005sm618836lfs.49.2022.09.11.06.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:35:11 -0700 (PDT)
Message-ID: <9c7b977c-841b-68d1-505c-3dfaf86ad9bc@linaro.org>
Date:   Sun, 11 Sep 2022 15:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 3/4] dt-bindings: hwmon: Add bindings for max31760
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, jdelvare@suse.com,
        linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220910171945.48088-1-Ibrahim.Tilki@analog.com>
 <20220910171945.48088-4-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910171945.48088-4-Ibrahim.Tilki@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/09/2022 19:19, Ibrahim Tilki wrote:
> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---
>  .../bindings/hwmon/adi,max31760.yaml          | 42 +++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
