Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BB0C4321E
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 10:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiLAK1D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiLAK03 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 05:26:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A627999517
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 02:26:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bp15so1751161lfb.13
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 02:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNNXd8RhvGAVfJwcSOjgVLTgCJ6FFMxxxXCnulCllW8=;
        b=yCl85oAUo62EuenpGLijwM8k3SFHmatquoQ6zoy0tu0RYxpf6cGw/QNHny+IZwlN4Z
         LoNiU0dFpnd74XPVPdVsnh0a9T6BZDFf7uxG5J9UP7umoJQDgLgo+qIuZv6vevGl1PuF
         O4HUVvw6JaDxxDIRRmoifcAlCkmfiVkbnuVFV9imcr5TW6a/hLl40YleC634Qyuj8cTX
         U/zebsmnUem4BJcBtqkcwhIT1K8tc9G62fD6rmjXyRTSrQo8NqaQOaca+BwUU8gBXMjb
         Hcw+FCluix/T45thvsjqhC2gIIk5FmGmud+bRq9xgtogUAhgbraK+mgXS9wvdP1OQjWq
         qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNNXd8RhvGAVfJwcSOjgVLTgCJ6FFMxxxXCnulCllW8=;
        b=qQf+guUZrWK/g1XBhEAZqBhTuTNvMRQYUbW0bsGQds8G0t1g8yW4XHyoPxXNUMRCis
         GTD1FFRXwqPlhM01SJ8RdXcmauG58aZVVVjqXPLUfhgw/a03U0dBLA7the33wwlJSl/p
         AojBcWHrZ54WZO/c3FGUe1BVO6CNEKh53JE8PtsuHXxolG37viKWO20BrmG1mbHuwwFs
         Q0ppw1d2m43hVG5sdE2ENmsGUJ6rdgMOfQk/gGSpV/ZgY2PlrMCVPYLd4hWbJL5uwdT3
         sXOl8wd1sImR53jyLoTP7ur6+3jKhnqq2tPiqueQTmXCJYz07Ltg/ipP3GAnrbPb+QaX
         DgQw==
X-Gm-Message-State: ANoB5pl6/r6G09o/k0YhA3GTt09Sp52TbNvWqRbNxx8WvkNHiV2zJ1qe
        aEaBzhacOQ59PiBuSotYl+dwuw==
X-Google-Smtp-Source: AA0mqf4CJCIyV+cfwj/kAMm4a4SMm4rBn3dM19tFz8JfQ4X5Zmfof8gfIrFYzOO5zMCFWnX0wnw9wA==
X-Received: by 2002:a05:6512:e9d:b0:4b1:8698:9f3e with SMTP id bi29-20020a0565120e9d00b004b186989f3emr20903264lfb.421.1669890387041;
        Thu, 01 Dec 2022 02:26:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id br33-20020a056512402100b004b1756a0ae9sm603072lfb.55.2022.12.01.02.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:26:25 -0800 (PST)
Message-ID: <f28da7ab-920d-a534-9f5d-e8407d0487a9@linaro.org>
Date:   Thu, 1 Dec 2022 11:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus/mpq7932) Add a support for mpq7932
 Power Management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marten.lindahl@axis.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-4-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201044643.1150870-4-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/2022 05:46, Saravanan Sekar wrote:
> The MPQ7932 is a power management IC designed to operate from 5V buses to
> power a variety of Advanced driver-assistance system SOCs. Six integrated
> buck converters with hardware monitoring capability powers a variety of
> target rails configurable over PMBus interface.
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---
>  drivers/hwmon/pmbus/Kconfig   |  10 +++
>  drivers/hwmon/pmbus/Makefile  |   1 +
>  drivers/hwmon/pmbus/mpq7932.c | 144 ++++++++++++++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/mpq7932.c

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

