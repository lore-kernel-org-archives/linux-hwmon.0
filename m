Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBBDC43334
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 11:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242524AbiFGLI0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 07:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242566AbiFGLIG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 07:08:06 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56832106355
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 04:04:12 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id me5so33899934ejb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jun 2022 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NAmf2neLs629T/nRVHI5HTB+vyXOf7pJ9ZDi49K5nLk=;
        b=Tx+66JhhTLXXvhuPH12RU3NMi3AgYU5ZaOPXHcHcdla6Xbd5Je5c3tJ9+SeyASQMvR
         vA0GmpKS7lHvTjCEWSB4mBRxwm6TzSAZrqiAEsFfs9rwN6NS+3rpWew64daqsinSi4Yq
         yyeNVX6oztGraas+LdFFpiNKotXIVm+A/B845XuBnzM3uUXZgP0jrCjgxvZPfTg/C38q
         z4zSIM2H1x8mlYYuwSlOP8KcvnJ8wDdFvroD1YwQq2NLoBaNF92YAi8C0xn4nu1tnIb6
         rL8VuA+wp5p9fO0oaUf7eEUSWT2E+2zHxZ31BZYCteifXVmo4PP/8MIz/+CFUomC+0w9
         IAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NAmf2neLs629T/nRVHI5HTB+vyXOf7pJ9ZDi49K5nLk=;
        b=gK5I9ysGYltxO+b4r4qiS7oZYUfc6p5bSmCeeyfIplj42WxHMCCFOgRwTdGPyjiu4k
         6h1BUDTHS1JMGFBvXkdiwbWGn91bAOMsfgfFIbEAPeOK4gg7MwBTQsO3TPW/pxJJwAvj
         aVKbPG6cT99ocWvQHnt0Mq2yrY5G2eyD35F6vrPGu9sSZQXIfnAwtwqTqJKlCEedzRDC
         CwecIZK1opqwBB1rj653U65clUvH1YHNdEAydm6FVlX7qGiXVcGegWvimS+iIC/f3eVe
         dwE8spM3zx+2pIn1WYhg/tWwjhRRVonBeWZekm3/Qjz37KmpgMXLWwCxoGduHHlRm9nz
         0IJQ==
X-Gm-Message-State: AOAM532dtxJVDcAf1xbpm4EHy1ir5mUhE0rLSrIGwPeV0ItRyNlM/NIM
        5gMAjqkcj+afGqWDpMM0vSNxZwo6LokEZw==
X-Google-Smtp-Source: ABdhPJwXWruueK1xUb0aRbK5R62kfSgKnTpTuZZ4wIbzZM6H6YLqXFtaj8w8gIQEgBddbB1H0nvXug==
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id ne18-20020a1709077b9200b006db71f1fc20mr25416095ejc.343.1654599850725;
        Tue, 07 Jun 2022 04:04:10 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k6-20020a1709067ac600b006febce7081bsm7502059ejo.163.2022.06.07.04.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:04:10 -0700 (PDT)
Message-ID: <0b6fb309-ef83-8dbb-a31f-2397906e2042@linaro.org>
Date:   Tue, 7 Jun 2022 13:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: hwmon: ti,tmp401: Drop 'items' from
 'ti,n-factor' property
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Camel Guo <camel.guo@axis.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220606212223.1360395-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606212223.1360395-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 06/06/2022 23:22, Rob Herring wrote:
> 'ti,n-factor' is a scalar type, so 'items' should not be used as that is
> for arrays/matrix.
> 
> A pending meta-schema change will catch future cases.
> 
> Fixes: bd90c5b93950 ("dt-bindings: hwmon: Add TMP401, TMP411 and TMP43x")
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
