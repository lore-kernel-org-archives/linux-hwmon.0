Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE653C6FD1C
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Mar 2023 07:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCVHnn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Mar 2023 03:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCVHnm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2023 03:43:42 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4130974D
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2023 00:43:40 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cy23so69029304edb.12
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2023 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679471019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lA/e5G4rNQAHj7RMOPW1MBRBFjvSz849rKiCbqJsGfE=;
        b=EwFlWF2cjR6CZPirutu+NzIF17PyFWTqM0QmVqPa21qP4fNUtatuFNMLOIFmv8cEHv
         wonTIvW5UkPfbnb3zBKJJTDTn6Sc+8ot6BaQLeDsJcxxA7A/0pWtelw1mRlSba4SCRXj
         MWlmeLXdHWINvkBcmLJ/qnqQZ1slXM/M7aXnQTXzIX33NZ9SOeEKZN/3X6XQEgitSPnT
         GcRcTqCWKS3vEBwuU4dgO4T42HGxYu9tlQ2KyQpXowX0K86VakA1HIVyBMQqKvrsy94I
         5VLpP5E6B86NaJ/c7pHRX+5vNKfsdup4v4UDwq9+RWMgnkDlqIPVCR9gCdkU8Rp0iESf
         iJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679471019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lA/e5G4rNQAHj7RMOPW1MBRBFjvSz849rKiCbqJsGfE=;
        b=k3pAvAcYREBBsm83O3Y+WFyOJs3XwO6/NM+R0U7WV/ZglHVSz4EMzA7T67a9mjm836
         3NfTpmV0c1JxgHWIuT2TH55vC3KJGOYKqsq26E7rNbQVAzkyokVltRN5nvl18nBCJlX3
         pGx5LpZmrtziucOWXu59gQPTcONnBgPoo0Yh76tzQxrhGSq/LQm/ihVAdYUAQU0Zqega
         lvyn7rKn7L+g/xQptv9iF83Bz/56plEw/eo9XYVPQaEuGAHc4BGpHsEwQRUSXjC6tTdx
         kcDFS9EDHa/fYm3wEJIOXkCFVz7YXg4wy8BHSu4wkiBUcSiSyWRdwvVa4Ozh3gJgYqX5
         zbUQ==
X-Gm-Message-State: AO0yUKVEqMNOw1WR0yxYDySLMMl0MVsGLIAMslDzlMkQk9pJ3CgFdMeR
        MRW6G8QLXnq95boL/jCldPAwIQ==
X-Google-Smtp-Source: AK7set+KqGAe4h2S0x3hml78os967F/lJ7W/0E6k2aOGzB+GYvorVjsRALdeum2WSRMclS9WBLJIcg==
X-Received: by 2002:a17:906:3389:b0:8eb:d3a5:b9f0 with SMTP id v9-20020a170906338900b008ebd3a5b9f0mr5450530eja.67.1679471019394;
        Wed, 22 Mar 2023 00:43:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709064f0700b008cda6560404sm6761659eju.193.2023.03.22.00.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 00:43:39 -0700 (PDT)
Message-ID: <6e4b135b-8cfe-f77c-1fe3-3dc62704f851@linaro.org>
Date:   Wed, 22 Mar 2023 08:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/5] dt-bindings: trivial-devices: Add acbel,fsg032
Content-Language: en-US
To:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>, robh+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230321190914.2266216-1-lakshmiy@us.ibm.com>
 <20230321190914.2266216-3-lakshmiy@us.ibm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321190914.2266216-3-lakshmiy@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/03/2023 20:09, Lakshmi Yadlapati wrote:
> Add new Acbel FSG032 power supply to trivial devices.
> 
> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 6f482a254a1d..6fbfa79de343 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -30,6 +30,8 @@ properties:
>      items:
>        - enum:
>              # SMBus/I2C Digital Temperature Sensor in 6-Pin SOT with SMBus Alert and Over Temperature Pin
> +            # Acbel fsg032 power supply
> +          - acbel,fsg032

No, still wrong. Open the file and look at the lines where you put the
code. It seems you add it in random places.

Best regards,
Krzysztof

