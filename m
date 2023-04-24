Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E3EC7618E
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Apr 2023 14:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjDXOhi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Apr 2023 10:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjDXOhi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Apr 2023 10:37:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB9C61AB
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Apr 2023 07:37:35 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94f6c285d92so824857966b.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Apr 2023 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682347054; x=1684939054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKF0Q2cCHsYATyTnjEGCFebP5yuIhL32CPd8lwpuJSs=;
        b=vhi4CLtiTD+Xbkr2y/t/18rdTuCOkl/jSE+P9W7hMLsnmWULhH3CFBmxskufvA1qPN
         9uI80bLXCszZ3i7j6f8v8knHXwvSI+EOQx5t9Kqiz5bXQCELgt/kT7qXalwJNTki0SMy
         n8pbiXoATiPSXNpYt/0J58tjJBEGF09o2m84Ga0+mqdtbo8a++zMQZCphUE/+uL3gv/Q
         UoyYki5+pqsrLmd2ZPBpyt+TCQOBt8cMZCxrSuLaLkK+jhCnd4luS6MDZE1QqH7a/6Wn
         ZLvaz0DmgwcvABYm0iMgYLr93ZDEafKT3ugWap2QfPU8C+BRKjXljihPGpDAsCELUYgh
         CKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682347054; x=1684939054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKF0Q2cCHsYATyTnjEGCFebP5yuIhL32CPd8lwpuJSs=;
        b=C5VzI75SkBYVRWK43IQgiMd+kCkl6fSnkWWS2b3ZlbOiijeBqshPzcgmOFWHppJj77
         1+Rs1VCG9s4/flITWjjGmMMmosDOwGfKqPJ0FDeEE69FzjHUk/T9yXVbr38EsQ4yiwrJ
         Q39JflONV0F9SDG3G4OVK1npatUn6IhL7h4NqJewS/unlYwSzjxINC+SBjiGA9+2HCzv
         M8qDa+E80G5pw83OUezJm4yGk1BDmvTlvdVpxFy4Iui0GPNpRs0vGcgPf406UhwP8qTe
         qG/HC1Bcc2s0HkYi94/FV/RQu484cY+U1UwJXy4j+aOqK5YFt4lDNg7ENxn6jhLfKmbe
         kyeQ==
X-Gm-Message-State: AAQBX9fzd1Sl+HjM51qaXPElGwFyGCcTNrK3jZP6a0eJRXL8RmxiUOkZ
        BuZ97iRwASn1gmqUx8WLBtp9UA==
X-Google-Smtp-Source: AKy350b5Vvu3r4BolsJSQlKVvbia6hcsiR/aOZX/ur298uTB2CJnH168NiqJrn9YFBzu5hZCe1RViA==
X-Received: by 2002:a17:906:1345:b0:94e:61d3:d13b with SMTP id x5-20020a170906134500b0094e61d3d13bmr10027267ejb.75.1682347054153;
        Mon, 24 Apr 2023 07:37:34 -0700 (PDT)
Received: from [10.105.146.163] ([88.128.92.195])
        by smtp.gmail.com with ESMTPSA id bh20-20020a170906a0d400b0094fbb76f49esm5685415ejb.17.2023.04.24.07.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 07:37:33 -0700 (PDT)
Message-ID: <bc6c0012-d7f0-c8f5-bafb-71b05db7a501@linaro.org>
Date:   Mon, 24 Apr 2023 16:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 0/3] Add support for ESM
Content-Language: en-US
To:     Neha Malcom Francis <n-francis@ti.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc:     nm@ti.com, vigneshr@ti.com, u-kumar1@ti.com, kristo@kernel.org
References: <20230424105011.70674-1-n-francis@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230424105011.70674-1-n-francis@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 24/04/2023 12:50, Neha Malcom Francis wrote:
> Resending as no major changes, commit subject change only.

That's a new version. Keep changelog - for some reason it disappeared.
> 

Best regards,
Krzysztof

