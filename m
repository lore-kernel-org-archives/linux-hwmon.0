Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7306C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Apr 2022 16:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357678AbiDLQdG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Apr 2022 12:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348428AbiDLQc4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Apr 2022 12:32:56 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B415DE5F
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Apr 2022 09:30:38 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bv19so15391842ejb.6
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Apr 2022 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gAj5xfHelclFReLdPPkYeZY0lE/SV5SVwgS8pMhTnxw=;
        b=ooxwf1D2Mzc648NR6tfapMy+bq0FJ8IPXHeL8J/mpMDNxQfZMAVKr+BY3nD70ynTzl
         Zlt/s+voJVfTfwCV02Z25lSnfoaakmM2M5z0gyggFHXn9kAeQcXW0ECD8fj7tGWr2nq1
         NDcgWq2ShvCntNE4hjUh//ji69yh6AE/leeBXQ5IAtQ1//dIR6MSL3g0kuoAlA4IkR4V
         qLNhlgx/zisOQbb6Ig3EH3SGK+gC6/fNAr75elsMtsg+BjCzLjRPU/L7y4VVitNYhtKi
         HqbFuMrLHZU3sW3jrHPdLCbCRRUySxiGI2DKQHijVJE3UBrcBLlgnwaHaf0xik/AtBOm
         i8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gAj5xfHelclFReLdPPkYeZY0lE/SV5SVwgS8pMhTnxw=;
        b=3qDV0yt4aD2OaAQyK7cD2VYCLnPOLloDOX9OTU0WThFA3pCMnYbwixvahAQ2c/gktu
         1y/XyzlU3a1IPHkO/Y99eAO8FnIaK9vMt2srxG42CuU7MWmKE+URXnX1lscYgJ4FRAbw
         wINe1epwzVIJYHFCBV0KA6bYiK3gUOxQLZ2OxB6CT+wf9mDPVwdwTtDo0CXR0Rjd4/qr
         Xgm2AMD7dQlkO+VNtwKuGMoP3mxAmku7a+U0kz+uNeyCR9EeygYck5ux3RAgVk25Uekb
         46b2EZ1hTsi1210/y/8ndhBXPJrFQp/E64pSQadQHMsGnAh3nw6+kIMrHZ6S1OrYuxIx
         gwEQ==
X-Gm-Message-State: AOAM532nYWruZ4kzE9JOoRCwxgJPatHywNYGUdQi6q9MuXY1wO1SnLTd
        yQ+DlA31X8MI/o6RW0oL6Bi20Q==
X-Google-Smtp-Source: ABdhPJwK8gR7AiQ34rV2PoWL7kth4RYbKFkRLOIq1Ammnm02jL+1fJVqgJdWykKP2fbJd9VqevTEYw==
X-Received: by 2002:a17:907:3f18:b0:6e8:9332:542e with SMTP id hq24-20020a1709073f1800b006e89332542emr9689224ejc.633.1649781036722;
        Tue, 12 Apr 2022 09:30:36 -0700 (PDT)
Received: from [192.168.0.197] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id z21-20020a05640240d500b0041d7f66a9cesm3375964edb.41.2022.04.12.09.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 09:30:36 -0700 (PDT)
Message-ID: <11a0ac1f-31a4-841b-6050-7876b784b960@linaro.org>
Date:   Tue, 12 Apr 2022 18:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x
Content-Language: en-US
To:     Camel Guo <camel.guo@axis.com>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@axis.com
References: <20220412135232.1943677-1-camel.guo@axis.com>
 <20220412135232.1943677-2-camel.guo@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220412135232.1943677-2-camel.guo@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/04/2022 15:52, Camel Guo wrote:
> Document the TMP401, TMP411 and TMP43x device devicetree bindings
> 
> Signed-off-by: Camel Guo <camel.guo@axis.com>
> ---
> 
> Notes:
>  v2:
>  - Fix format and describe hardware properties instead of programming
>    models
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
