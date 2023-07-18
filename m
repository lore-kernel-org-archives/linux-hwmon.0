Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C1BEB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 07:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjGRHWB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjGRHV7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 03:21:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B6910C4
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 00:21:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so742585066b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689664913; x=1692256913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4n4qqgB+2hjrsOUL30ez1Ai+t/nxxoWxeb0EXPeYD3U=;
        b=es1bxeLfaO0xY+BuGQ4kbRDr+cUVqBg0CW/7pnqWC5hYPhAuLqZ9tvVecxsqADBy/f
         OtRsfX+WHQVbkcqdQzYmznL/LliMQFYqThwOlYsj0eeO+sGktPsawONakijDItPqHBdE
         JRin/J42CfUzbHg4OQzKvvmsRdDZ+ai3U7u4Lu48pUcadEsgjlJsLu3mZjRqllItIaJO
         n3fhwoXIf7Bzt6u0cE2zpyXUwS78Efty+mYquLY7nASpnKPwGwfQhN/KfhYjlwpvvnME
         pwcqz3Wx7QIZfGGoOrNW6lgB3R02af3IUEGfwuQJPbmph/pHYIBSxD9WjptKLDuR6BEA
         4n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689664913; x=1692256913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4n4qqgB+2hjrsOUL30ez1Ai+t/nxxoWxeb0EXPeYD3U=;
        b=j6PKWAXTxx7WtP7s0HWCug+RUa8vsO062JknR8ZQdE8uFXo1VCJpadvbH2ZjaiotAZ
         yEZ0wphV3lA3kGv6XPR3R20gT1fUGVXgEehft3P5keAif9ael+k06Gk59wySaLWo/paJ
         8ACXuBWHqS89jYSuV/Ft2rdkRxgSK/QeBpjs+eEj5BuOVFeM3PqCKVNNA65L3t1cWD2L
         jRhFaO6gbeOOlLOBaOcyK+5r3PbL0UXWrZXjnqLnfOm1BO5c47XZpJAY+IDdz+BnvDg6
         +bwyzXKvaM2gBmSoPYNXF4gg3INhxJ+CgRi74kG3VS36NQBN12Fs64WZOdAwlg2YdYg/
         +GXA==
X-Gm-Message-State: ABy/qLa69hKdnsnBB5h9bPJbSzdbyWhdVGZ+zepDxHIdrZnMilaZlcaP
        L8ONNVsNUY4EuvxcycnYXJYzTA==
X-Google-Smtp-Source: APBJJlEPoEma6epYYKdKLymUlkCZUVI81YFqxVkZojmkdpGMGOEf3L+HYHZiUca0m/klUjEdyT2CrA==
X-Received: by 2002:a17:906:2308:b0:98d:e7e3:5ab7 with SMTP id l8-20020a170906230800b0098de7e35ab7mr11265940eja.11.1689664913098;
        Tue, 18 Jul 2023 00:21:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f18-20020a1709062c5200b0098d2f703408sm631266ejh.118.2023.07.18.00.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:21:52 -0700 (PDT)
Message-ID: <ef46f22a-4556-34b8-101a-ff913b42bb45@linaro.org>
Date:   Tue, 18 Jul 2023 09:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs3001
Content-Language: en-US
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230718070114.3871-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718070114.3871-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/07/2023 09:01, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> 
> v1: Using separate dt-binding hs300x.yaml
> v2: Reviewer recommends documentation of driver dt-binding in
> trivial-devices.yaml because the driver has no special properties
> to describe.

Changelog goes after ---. Even if you intended to keep it in commit msg,
definitely not after SoB. Does this even pass checkpatch?

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index ba2bfb547909..a4f4701337cf 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -315,6 +315,8 @@ properties:
>            - plx,pex8648
>              # Pulsedlight LIDAR range-finding sensor
>            - pulsedlight,lidar-lite-v2
> +            # Renesas HS300[1,2,3,4] Temperature and Relative Humidity Sensors
> +          - renesas,hs3001

What about the rest of the devices - hs300[234]? Usually we ask for
specific compatibles, that's why separate binding made some sense.


Best regards,
Krzysztof

