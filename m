Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A53EC6FD1F
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Mar 2023 11:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjCVLuF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Mar 2023 07:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjCVLtw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2023 07:49:52 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C542F5FE82
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2023 04:49:01 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b20so38747144edd.1
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2023 04:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679485732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xd/T7PlsTQGxJ/pA9S5ontWMrsJaVv78f9wRSX7J6g=;
        b=ZGFQrsaLPMhJOjvXz0W8Eg1ur3hNDW+dIck/vKgqYI7NP9ZJz4oB4T1RMU4w2zWPMv
         4vpJ1jSHfJowDgvPQFgPq4DGIL1o9O12FI+jNHLN0sc10Kc/6nCtWXYyB1a93IHXNTqT
         pmoEW+Fja0ftclFufmE65Q9NFKos5xkMGu3T36UygE1vdXWNEsNQHcSSSLSkCc3QNDg4
         0IYp8egAljwgesusQcweziGFrNWUQzDzLYUPgXvyWVhfUAf9/wYPsWShMI3KFA+pCgrD
         L1wPFU3/DGv7R0siSSyzrm+BrLEWVoF61ycM/EvnBP1DirUVCCp9mcclsOuXMjSvxAUt
         hQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xd/T7PlsTQGxJ/pA9S5ontWMrsJaVv78f9wRSX7J6g=;
        b=fUppDXKaIYFmND6k7/mu3A+BKR7m+ik0GkNw0dozC6O1iqGcNSxFBFLI331gyAd/wi
         sMqm4A8Gwik32Y1QbqO/DnauZtVyawVxDmfjM6OfY7dFhOFBGeELCS5CcYxHlnL1lprx
         F1CRj9x52+c0uBwoqh5MBmXPF5g2e3i9fScYl77E8/FRv69N8x7CjgJwz/9trxedTZsY
         /bORn+1ZPtVbnuiFg6KhfXwiLl94jvT8vEYMuSrXbSOf6tNZkkT0jr/yhZf1JA/FSGGz
         hycs64Uq3upQDx7wzJ1/dYatJfei4kJKxdOppaGy9rPylpZlLPF9kNKet8TiyAUl7laU
         rNdg==
X-Gm-Message-State: AO0yUKU/LfK8meTPkL1wFEefxgSuKb2kNE2slUkQQGxjOWU8EohPw2A8
        WpyDqsOkJN2pKhDKFQtUfxaQbg==
X-Google-Smtp-Source: AK7set92Q5QqXTxawLK9qp1REFZCelvDZ95ApS0pvLs4azXxqMObaPafam+EU6TSx5Dvf17pSEjVhw==
X-Received: by 2002:a05:6402:7c8:b0:4af:69b8:52af with SMTP id u8-20020a05640207c800b004af69b852afmr6158055edy.24.1679485732256;
        Wed, 22 Mar 2023 04:48:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id c21-20020a50f615000000b004fce9ff4830sm7636338edn.88.2023.03.22.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:48:51 -0700 (PDT)
Message-ID: <c750e047-b8df-685e-df0b-5212aaaea0f3@linaro.org>
Date:   Wed, 22 Mar 2023 12:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add prefix for acbel
To:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>, robh+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230322114623.2278920-1-lakshmiy@us.ibm.com>
 <20230322114623.2278920-2-lakshmiy@us.ibm.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322114623.2278920-2-lakshmiy@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 22/03/2023 12:46, Lakshmi Yadlapati wrote:
> Add a vendor prefix entry for acbel (https://www.acbel.com)
> 
> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof

