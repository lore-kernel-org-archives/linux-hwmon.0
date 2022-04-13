Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC5FC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Apr 2022 14:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236079AbiDMOIv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Apr 2022 10:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236093AbiDMOIs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Apr 2022 10:08:48 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F7860DA9
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Apr 2022 07:06:25 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id s18so4282710ejr.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Apr 2022 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xclQowK5QbwCO5KzYmDKXFep6DHLbWkFBjvXdbQJZDc=;
        b=luU37E/8JMHNl4VHIi5MneOzNwctGyKeslQDkG2RJbONP2cISPuohPncjJCMISpSLd
         JE3lw44w2pubOWRq01DpTW7/WUf4ORBprY9WXREI+Zpr245SkV+0ZNn3PCyCbsLHC7d0
         s/2eltfPiTse6V0nmcMriwjg+HJ4L6u73/D4uQDNJf30JY0vLCKkZIyhI+rf/5qVE68z
         KaH6hUAP390HKfdQNawuQeDGju8SxI6imDRDEm4rwN+4bP3ubagIQZjrK93/24UoNF7t
         Kpfsbvy03tUbdmpahzFBQD292jb53r5SIVjUB2XvsKg7sQfZr3UAwNR4nx5huS2NyDxf
         R8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xclQowK5QbwCO5KzYmDKXFep6DHLbWkFBjvXdbQJZDc=;
        b=JXyko4hKXLqIFubWjIktszPrIFFUNKeZoG9eQfT4YcFyLQat9+2noa9R+zYpvwfion
         LVR0J+n7zNzGJCgsh5n+JVWhtE6qP7s71+KtpE+j6xkOzfFQaQnMFAcfia+CVmQxHH2n
         xCTRmqU/ftKIxf5/u99SMBN51Qu/MC7LQO5n0dvUeaCj1B6oXHg9LD2rGlkTd0ndnHhX
         9tru9L+EO6IhN2FZFsWxjgoIe9wy9hAN7kgaKWFcl8yD74mti/Do1IbCS/LsbEdu2zwy
         WN0duOKCPe2gkTlZb9WTsKhjwnj9J3WNAPJcw5wovAS5PswxlJs3PSCkHh9Cm9iyeZTR
         LguA==
X-Gm-Message-State: AOAM532FKz4G6BPROqYhvIUfu/Uz6jm4gR5Qywy9bGix3R+8Jt1dWHyv
        4YbS4XONHSS+6n9H03hUe3MHkA==
X-Google-Smtp-Source: ABdhPJzjr+0cuBz3KT6Z5/dHflarKqX3dFwJjKeJYoA6U7QJ3txgow0qPdJbiQNrXxDeHEiDBBlb1w==
X-Received: by 2002:a17:907:16a2:b0:6e8:d283:17d0 with SMTP id hc34-20020a17090716a200b006e8d28317d0mr1658785ejc.445.1649858784172;
        Wed, 13 Apr 2022 07:06:24 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id d13-20020a50c88d000000b0041d8c0440ebsm1208244edh.95.2022.04.13.07.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 07:06:23 -0700 (PDT)
Message-ID: <ebfe563c-5c3f-d69f-39a3-c8c79616f060@linaro.org>
Date:   Wed, 13 Apr 2022 16:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: hwmon: ti,tmp421: Fix type for 'ti,n-factor'
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220413134729.3112190-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413134729.3112190-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 13/04/2022 15:47, Rob Herring wrote:
> 'ti,n-factor' is read as a 32-bit signed value, so the type and constraints
> are wrong. The same property is also defined for ti,tmp464 and is correct.
> 
> The constraints should also not be under 'items' as this property is not an
> array.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
