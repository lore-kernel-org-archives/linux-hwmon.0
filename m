Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF62C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 17:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239208AbiLNRCq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 12:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238879AbiLNRCo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 12:02:44 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6D027FDD
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 09:02:43 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id n1so7236275ljg.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 09:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oRZHjiGgdJt0T702JOAD3bybZtyoQnmzqZwZW3fut8=;
        b=ATRG7cWiFz/XrkcFItQzWg3lI5l3X2Rod19On+GGF9KogbvhdG5csn0uQWQmMyMR0N
         fGH44CbLTZNam+tPCaocQc2O5+59UJ8gYTiVrdNdfuuDolUmGsXFweCDO8DHb0Sp/qlk
         8b3aCwVmMGhc6+v0oPIVcQ8XC611BxL74nahgRiLSSmRqKmCTNXbm+2mK7aDzdNO2vLl
         z3c0TqgYFrX4ykRrJOz/MEb7yWwFTkxNcJFDAXRmAbt5GaKDstVKoBPB29cRiAhDaQf/
         BwohcpU0O4E4jwLweG6okUickdEUHI05De2kzePtHffDFOdy8VRMgC7sB1aWnoGJBFvM
         FrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oRZHjiGgdJt0T702JOAD3bybZtyoQnmzqZwZW3fut8=;
        b=ZYUZZ/xMFgdt9fYkoSDi5d9gbFGiHfmLBcGS01u2vs67ZC0gPVI0+EgB7kQdJ5LD/k
         Zv6Csc4VXRHK5vPKLd71fUk9V7a6eodnJqpP94tkG5osy55fGNg3SAzJdrwof7Vs3Lve
         Hc5CqgxmKJ2bLe32VeLmoMqZE1SmaA/erzqF62RFPkGivhKbBnvHjBIJS+6pYhOR2gKV
         ab3lURJFIYSrpStIoT+6hALd4wxeSiAP2jHyrf7NNJNaMPe4bLLdsX7W1oo3+Za0xcX4
         2b8bdzCXXB6LOYAjuy6UQLJLSTb9haLsbXCuR+zoNcKTrkB10y823RAxOPstQgi1bNDL
         W/Og==
X-Gm-Message-State: ANoB5pnQQlhrlBSTbuvp9LEVV2CqiXVimGJpz3hceJQNLMR4I7MI3x5H
        Diu3we2iwcpMjLhFbI0h4y3YtA==
X-Google-Smtp-Source: AA0mqf5MPi/D9ZHKNP3t+6+uB+nwhbrwqogdZiQkoXqbRhEC6+fK+/dNpJo1Uku035/inB1HJNnmNA==
X-Received: by 2002:a05:651c:10cc:b0:27b:620e:3dd with SMTP id l12-20020a05651c10cc00b0027b620e03ddmr2472538ljn.13.1671037361840;
        Wed, 14 Dec 2022 09:02:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e9ad2000000b00279f3c58278sm666684ljj.51.2022.12.14.09.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 09:02:41 -0800 (PST)
Message-ID: <1697ded6-f04c-183b-4f92-ea4d5eb1c187@linaro.org>
Date:   Wed, 14 Dec 2022 18:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/3] drivers: hwmon: Add max31732 quad remote
 temperature sensor driver
Content-Language: en-US
To:     Sinan Divarci <Sinan.Divarci@analog.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214142206.13288-1-Sinan.Divarci@analog.com>
 <20221214142206.13288-2-Sinan.Divarci@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214142206.13288-2-Sinan.Divarci@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 14/12/2022 15:22, Sinan Divarci wrote:
> The MAX31732 is a multi-channel temperature sensor that monitors its own
> temperature and the temperatures of up to four external diodeconnected
> transistors.

Use subject prefixes matching the subsystem (git log --oneline -- ...).
There is no such prefix as "drivers".

I did not review the code, but it is easily visible that it does not
conform to Linux coding style wrapping at 80. Wrap at 80.

Best regards,
Krzysztof

