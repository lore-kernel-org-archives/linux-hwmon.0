Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970F7C6FD1F
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Mar 2023 07:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjCVHm5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Mar 2023 03:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjCVHm4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2023 03:42:56 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21995A6E9
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2023 00:42:54 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ew6so6148192edb.7
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2023 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679470973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpO6nNgLNXXg/qI6ofUYW3qWPugMqrOA8y/Wn0MCQTk=;
        b=vEcYMbrG82Rcclx8sJs4dO3o19gAYUoqBIQD4m9SNmTnrpn/5xRNqslRExRsG9Dxid
         6iolGDu5ua++qw3MWKr4TXpRqyrI5eli3lNssyH9iTEXf468DLm2fjO1NGKRmv/XJ7ib
         +0aQNleqbtWY/k094YWT2Kc1R7vUrXM0TE30F8ig1uXcq/so6TJb6g1ZeGQgbmNS8P48
         MU1YycLGKjsCqgQ0ZyCIOfBl+c/W2/5/wIp/xxr8x0iHnPNo9REq1y4WGdwQJre5hTpy
         xN4uPS2CfLUX/y+uM+tPUloYuP03kh78jQUSJktcDdAxEjhlmQ+MgrjTREXang+eY0Mt
         2Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679470973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpO6nNgLNXXg/qI6ofUYW3qWPugMqrOA8y/Wn0MCQTk=;
        b=jXgDNEUxXGpwq3bvqHN7IchHsQqAstuYVhUaz0dCho3CzHawUh4xAfsHGm0723IGWK
         3uJDtkoUcicUfdDcC6fisWspO96T7IFlwGkVkjx3d5iQuhY/M7cWS7qWWbdOdA8809eO
         1o1JOG61dIvvr0rCicBaVoqLdOqlvW3XbaY4Nni5yQloF2MFDb9nCrzrjzno/68ZqZRm
         8eLL/RuPGEaiG7yMZkl6wsr/2nFCYfsr81LXkFx0y5dl4CL6Ieloz4DNbSBGRURV8cRA
         4JUB+sjFrOTG0vLn3yKXJMiFMJ4Pr3C8s0kVd2w+VaaEte1TS+zZtNDb7JhBIdx9jlVe
         /0hg==
X-Gm-Message-State: AO0yUKXHkFDg8CUnEXFLW+Mr0HZ11wlNR8gOyz2/Tg+tfexbK0OC7SqM
        DEHcnSm4i0L/fu3uj9AG9GaGzA==
X-Google-Smtp-Source: AK7set9/20qTWXfXUPdUzdez7x/H1H32b6vOzzlRWF9+rvKFKl/pHRXbIy5B17ybnCVOJtnvGkB4ow==
X-Received: by 2002:aa7:d419:0:b0:4fc:3cd1:37c8 with SMTP id z25-20020aa7d419000000b004fc3cd137c8mr6144173edq.22.1679470973200;
        Wed, 22 Mar 2023 00:42:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906079300b00932ed432475sm5597899ejc.124.2023.03.22.00.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 00:42:52 -0700 (PDT)
Message-ID: <7735c232-f1b3-dd5f-ca0b-be2078756d99@linaro.org>
Date:   Wed, 22 Mar 2023 08:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add prefix for acbel
Content-Language: en-US
To:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>, robh+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230321190914.2266216-1-lakshmiy@us.ibm.com>
 <20230321190914.2266216-2-lakshmiy@us.ibm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321190914.2266216-2-lakshmiy@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/03/2023 20:09, Lakshmi Yadlapati wrote:
> Add a vendor prefix entry for acbel (https://www.acbel.com)
> 
> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

