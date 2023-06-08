Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95138C7EE2E
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 06:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbjFHGj1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 02:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234815AbjFHGj0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 02:39:26 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCB92688
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jun 2023 23:39:24 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9788faaca2dso51546566b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jun 2023 23:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206363; x=1688798363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20VwnX/WoaRKV9arNTXMhn8ioZI7RTq9D1ov94KZAt0=;
        b=GBvMPK/cs2To8yEXE9SsipYC/K1njPu288BNro/g9k2fonTbbPNHjR6x/v6lQUDK1X
         BAS3uVWDIcWav1fDn/+ErtHtI7UEwBChae4r6rHEQMuY/PtUZrRTn4FVSI5aosRItmCw
         K/FePCj+GiqS7lxluja8iwNLBGIHNfZTg528SQ89huvg5dJ5iHnnbrCZEmf23JyU8lUe
         /SpaTtwUyRK8fgCmvhCmnzoZX3t2SRvOH6XyQ4bNSXGBXwKtRn31zQ/i8BijKOmZOV6C
         e8nS4f7O07aT7ZkG40L16LctrvwEkwkmMoKd31xIw3hk9r+D3QelJVr/FHc6AlSw5vb8
         LDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206363; x=1688798363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20VwnX/WoaRKV9arNTXMhn8ioZI7RTq9D1ov94KZAt0=;
        b=PUEGfFmxh/cATMGe1AijN4rK/uFbc/JlAKbDgBfxHfj6SEi8vBdSOuw6oxTWwpwrdz
         yjAIXx+7iAb4SMuyu0MxCkHSK/63KfE3wcnIuR0XcgPoqVxv1WZZAWEji+0S6b/E5hXq
         GBBFvex/m1Y+dbn3qbg1Pd8/21hYv/chRpQ4yj/nTiULLsUJD1Gpy3JU7Z8yV1DwRWeB
         kKZt5EdIRIXVsX02r3Y/YwYsv0PpzteeT3EZeINUTk95K+7XeemZKrA4EgJmbtJkG4sV
         cuyi+50YZ9CS/otzoRaAyshL0lrzZS9V1hs8mKU7mkgMg9/oEvOI0uTj5NaOVD76StLT
         kUKQ==
X-Gm-Message-State: AC+VfDx7q5fXM1LvfKp0Bvbx2ArFzNA2xL6zj/AVgYrze44trc36O3Sa
        My1UHtOrjWzxAeBWX+0Uw+ZyJA==
X-Google-Smtp-Source: ACHHUZ4hT0e0tzGvbuWncVx7177VvT2kgg6YTLUjvuP4pV7zePZzqsLUl/diPhvVAIOjdTJZ3WZG2A==
X-Received: by 2002:a17:907:1c0c:b0:973:d857:9a33 with SMTP id nc12-20020a1709071c0c00b00973d8579a33mr9347535ejc.11.1686206362925;
        Wed, 07 Jun 2023 23:39:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t4-20020a17090616c400b00977d7ccd9fdsm272257ejd.95.2023.06.07.23.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:39:22 -0700 (PDT)
Message-ID: <b0f5f061-60ce-815f-4228-2033335e562d@linaro.org>
Date:   Thu, 8 Jun 2023 08:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
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
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/06/2023 04:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm device.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

I don't understand why you make the same mistakes, even though I pointed
them out two times already.

I am not going to point third time. Sorry, it's a waste of my time.

NAK.


Best regards,
Krzysztof

