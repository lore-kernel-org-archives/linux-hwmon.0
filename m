Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E6BC7EE37
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jun 2023 06:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbjFHGkR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 02:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbjFHGkO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 02:40:14 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637452688
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jun 2023 23:40:08 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-974638ed5c5so62133566b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jun 2023 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206407; x=1688798407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVRZfjPusUlMd2YSAWkUFw8x4CXFJxYh+aCGHiCjN5A=;
        b=xqI+reGDDN9cNUgG8bBTYU3s/nwG1PuvXOzHTpns4U2llK/sWtFsXu4o2iTRqW4nko
         2cdhmsc4/LtNfg3u/NU3tA7N3vf3bh8GCoYVjdffQjmRW4hV5zq41p2HxgflyOADfA5H
         ndTJJnG1CHYwzWyDHOG3XSqa0VoUJYcOls4so/APVmpetMjI5U1Sc+iAd9HK14dtEMZF
         4JcJy4NSNowUarzzT65nN0OytYabtvVXzMcvm5WKRYrR9iV+zJomX4j9SQ20L0d0l+07
         Sk1hhQslbx6Bpfd62KwUXXE7GSNs6cBTl38hGJJXWtJy+mRXCImcErhmqxG3SIwESpee
         uMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206407; x=1688798407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVRZfjPusUlMd2YSAWkUFw8x4CXFJxYh+aCGHiCjN5A=;
        b=Kq1p9neahW7rJxywNKdQkBJIlTjtUo1ZOow5DmpKXflwTdpXdBJ6DfWGDVwldMgjYs
         pxD9wQ2UYkdJw+CNlfkD/ZrJgQOrId690+efrHnJZFcrcuK9jdIg4vVRxbqXdiVZQWKr
         /lzr5m4dPwtxPx8T624c/aVu5YRFg3TWgrjUE9ij8vCJ4ehrPw3mexuog2xAEaa8kno9
         zmw48qbpZdK10m+jTuiigy67anpc9VbLtMKQbf5ooemXO5OG0p3smjBSGzOOB3CIPAau
         iifoY2hkZNonoRhYlo9qky4pIXwdZHYEsetX8EknTsrL66T42w+Dn7Qlw4yD6QTy1Zps
         LNFw==
X-Gm-Message-State: AC+VfDzDGyMrFVx8csLiobD0v24/ml5hAZRUZ8dBVf1zDa3eN+GrFXzm
        KaLDqqmGACML3MIUqwbKxHqxxA==
X-Google-Smtp-Source: ACHHUZ7Y49qxpbARq0/PESo5rGH/0TBRzIPZEdIk349An/yWXAvAuSNvyKVBJn4VTWgCDaiQFX9UyA==
X-Received: by 2002:a17:907:9404:b0:977:e8ca:ab34 with SMTP id dk4-20020a170907940400b00977e8caab34mr1008654ejc.22.1686206406850;
        Wed, 07 Jun 2023 23:40:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906249a00b009662c57b4ffsm273586ejb.96.2023.06.07.23.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:40:06 -0700 (PDT)
Message-ID: <becd5ac7-a9ea-c63e-5716-316a8e705104@linaro.org>
Date:   Thu, 8 Jun 2023 08:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
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
 <20230608021839.12769-3-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/06/2023 04:18, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-tach device.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> new file mode 100644
> index 000000000000..627aa00f2e92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,ast2600-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Ast2600 Tach controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The Aspeed Tach controller can support upto 1 fan input.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-tach
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1

NAK, not true based on previous discussions. Device does not come with
resets and clocks.


Best regards,
Krzysztof

