Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E266C7EE45
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 06:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbjFHGiH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 02:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234444AbjFHGiE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 02:38:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D222120
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jun 2023 23:38:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so320811a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jun 2023 23:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206281; x=1688798281;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqo0A7BM5THz83RAtHMEkVHjNz7WCnOgKYrgDzsaaU4=;
        b=CUbo1fahuMwU8hQpPyLHBQTQNthgS0+azjXEB5AuMpivBaAN7sKBcqOMHCbudzENfS
         E2sZnGqcbYx2nNJ0yBKlteFKjUuDqif5VYX9YDV94/AGcAdw+KtmKakYxEmVd724gm4D
         cgg6z7n3Hn31+jor2LbZSAW6BjWkrJIirz5GlLUhGi1HX7d8qocpZ6PC2QHc5U8lL5Sm
         Mixy66cV0bGiUy/Q5e5jVgtKz1exAoXZFKX4pvxrlUOrC+w+rqPSUHlRk3q2Y9UaSL6/
         /KuNUsRD5M0DtbjpW3yM9eCYmIcUSlviUeNpmY1YHxxcAc+4XrL/W+Y6dMQhcCAeYlde
         5I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206281; x=1688798281;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqo0A7BM5THz83RAtHMEkVHjNz7WCnOgKYrgDzsaaU4=;
        b=G21mVGES+htSF3CjdkZW9bddBtmjwfiNtnm3I8teAUX3m1LH0cF5ve0EeMSZN1r895
         edlHr62EVBXNS0GjmowwrWYQT0xGsJcLHUx1FVoJt9RXRA/M7k6soxMmRIOa8phRalEl
         7wgagH3asCZItEaSHcFgHz136DhDimbVGAEXwmhXkNZiD+l9absuDyc3ja8WCbNSGRmw
         valVChrk5btKZoN6rA2ZC7DMMa+RJyXynd28LprpT+TRP53aoIFXs5PQT+huADJ9eaNT
         p3KR+PkNJHnyTaa8l+UEotObM1A73mgUmEJ3hxqmKbOb9hYP3vrV2pJkVWltgbQ8Catg
         ZwEw==
X-Gm-Message-State: AC+VfDxNdn0W1C/7d9UEiSWjE90Hn4o2w4x4Gr6nxSKxZURubmy7AZm/
        DbzzmEiqGFCFl71UVjW+7TVatQ==
X-Google-Smtp-Source: ACHHUZ4KhhXuTCYSDPgoRLBB4u32f/WMlazF4shqwwkZ3icYzTu7KI3MJObyFYaJY0xBRdj6ON+xew==
X-Received: by 2002:aa7:cc98:0:b0:50d:88f3:2e30 with SMTP id p24-20020aa7cc98000000b0050d88f32e30mr7084851edt.13.1686206281341;
        Wed, 07 Jun 2023 23:38:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n27-20020a056402515b00b00502689a06b2sm168728edd.91.2023.06.07.23.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:38:00 -0700 (PDT)
Message-ID: <797c61d2-b8f1-e80e-24b9-4c7a7d266080@linaro.org>
Date:   Thu, 8 Jun 2023 08:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 0/4] Support pwm/tach driver for aspeed ast26xx
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        corbet@lwn.net, p.zabel@pengutronix.de,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/06/2023 04:18, Billy Tsai wrote:
> Unlike the old design that the register setting of the TACH should based
> on the configure of the PWM. In ast26xx, the dependency between pwm and
> tach controller is eliminated and becomes a separate hardware block. One
> is used to provide pwm output and another is used to monitor the frequency
> of the input. Therefore, this patch serials implements them by writing the
> two driver "pwm-aspeed-ast2600.c" and "tach-aspeed-ast2600.c". The former
> is following the pwm subsystem which can apply the existed driver to
> controller the fan(pwm-fan.c), beeper(pwm-beeper.c) and so on. The latter
> is following the sysfs interface of hwmon to creat the node for fan
> monitor.

You like to ignore my comments... How did you implement them? Go one by
one - answer to v4 emails.

Best regards,
Krzysztof

