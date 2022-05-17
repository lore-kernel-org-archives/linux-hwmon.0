Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EE0C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 09:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240247AbiEQJPE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 05:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243864AbiEQJOq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 05:14:46 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2B935843
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 02:14:13 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id z2so33423929ejj.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uzbrvO21UceULT+n5MFskyGm8lwNsVBJgpQqNCNVgr8=;
        b=d/5fBGDl4VD9kmenjR3XuiSq4Y8Bi5tdMfEPsa+RDxu+1VrpGrE1H2/JuqoFoJbmCp
         gYLoy63urmNNcgKBWIvr/hc2lf0Xu14Ypjklisn2i3cU2Ou0iiERq4uB5LMCppb/MXuN
         eM8MfPmthjzXgvOWMdkPacjH5z5jM0GCs0fWeERxTgO2xo4uaYN0Ebdc5Ty/RvI/4WTw
         UGy4asyOs6vukPSU1wjAqsx0jwQeRYqsJeyHqjDrpJnHICil9C4xYtjNay2hYvjzQOOl
         mvxzGdpmYHA3T2c09q1kOXRiK4TvIGsdlyiL2jSftLKWmieGpoWPU2jYwgVaVWzK8bKg
         6e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uzbrvO21UceULT+n5MFskyGm8lwNsVBJgpQqNCNVgr8=;
        b=2ZoEtGuxtZwn2mNEQtMT54NjZbNypP2VF3N+fmoKGhCfuYW5Ix4SpW0ZB+nWCDIshP
         pEzxnUlknE7HhaI9FCmStuMosIRHP11IV/KBaX7XKP4Cu5JJTz6MWiG48bJ7mPYa93j5
         s1znvB75puhCsKd/woz9SW1h5KvIDvOYeJbfIdsNW3efv329i/ZgGcBMU0MYZVl/Wd8H
         6adSy9bcDgzlnqEQ0zkekDWhJq+2jPNBd8fdXoPj+gN6MzZBKvn7YU/SSTFuKPw/IdeQ
         nqU2WQ6u2oRWSrrE9MrlHmuMAHIR9t14MQMo6U+R9XFV3cO/H8ZkO+fTYGcZAAi+mybH
         HEYw==
X-Gm-Message-State: AOAM5312hCENuMqj3rbHPWlSVZJesEr6qiNdJ42YAM7laQqO3KLnL7Pi
        N46EjoitpumtFNSBYITQRPcD5g==
X-Google-Smtp-Source: ABdhPJxCBKEyJKDU1ubbqhVVSdcfKG3t3Vlgdl5iGFF1Ybar3ybuDxiwsbQ2BStu2vvBLnHlUBaEAg==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id fj2-20020a1709069c8200b006dfbaa29f75mr18383958ejc.762.1652778851749;
        Tue, 17 May 2022 02:14:11 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7dd57000000b0042abfe32ac8sm1439288edw.30.2022.05.17.02.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 02:14:11 -0700 (PDT)
Message-ID: <2668e283-42ae-d786-4dca-63526d549f54@linaro.org>
Date:   Tue, 17 May 2022 11:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/2] dt-bindings: trivial-devices: Add xdp152
Content-Language: en-US
To:     Greg.Schwendimann@infineon.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <1a600fd51db942389a5078a72c3bf411@infineon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1a600fd51db942389a5078a72c3bf411@infineon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 16/05/2022 16:03, Greg.Schwendimann@infineon.com wrote:
> 
> Add Infineon Digital Multi-phase xdp152 family controllers.
> 
> Signed-off-by: Greg Schwendimann <Greg.Schwendimann@infineon.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
