Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99FBEB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jul 2023 11:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjGRLhC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 07:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjGRLhB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 07:37:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC47EE75
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 04:36:59 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992acf67388so692664666b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689680218; x=1692272218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jO6ua4X85rMtlHrlvOM6ZeaIO7a3UQyMeLyISBdalqs=;
        b=oTYrcQsJJlBwD++7RreKiH6HawYxf7leUPok+WCk+33/y20iHM9fw/mPZzfDxIqJey
         GeRNpq8xBoIAjvJs1JTAEL0VhEb+a/H1Zx5zutNH5kZwqS4dY0KXgoa9sjYDe96vstek
         lVNKkoUi4vHJpf2UEl1AkxNgFgaBoQS+T52hklsmX6Moc+v9eJXSChNQNnCIWs4xhyaG
         NM9TKfnsoYmkT/wJnDrquwyLAxO3OdiJCocHuD/DgcWoZ7hfJWuj9d4H8IWmTGBhWdW5
         x6k1TUKv5KY7zHHASpvhi1T5hrnO23g2kWgSv8usUWJGi+oymQfRCS/6501R8VHagKQB
         7xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689680218; x=1692272218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jO6ua4X85rMtlHrlvOM6ZeaIO7a3UQyMeLyISBdalqs=;
        b=bUF/0q+yJNAezQQjSQW5WwtDxDz6DXKFQDpGC8xykVd+QxJZOys0LoNljcZdCmmdbk
         0NsYKT9kiLszihyzb9uQy8kR3i/H9SJXaLPFzXgCZvOOqJKx4CkXqemTFE9lpvcUXaxw
         oTNWR+paPV8Kb5Ke7YbYSLYYhqJlxEUjyz/OCt2ApIdKhWIpQOi6c9oC8T9g7ddjt+F/
         UsXKIgZ1zNYYvpW4uIl9ASztwT1IwquMilbXDv/Qg//fHNNR3TlDGyXl+bWFGu71VgQY
         SabfNARdsVjncxuL9KQu0bQs/sKprwUUg/VF8q5OsK1ozsxxkMVlJptIX2NJuZ9aBVnJ
         AGYw==
X-Gm-Message-State: ABy/qLa9QCTZ3Mhk5ODXQCDV1ZVpiVOolFLv9r9AiO12jXUa85Cgwrmv
        AXzrSndiMpUNpWm936GsnoXkbGkezwrkhqprqGEQcA==
X-Google-Smtp-Source: APBJJlFRd9RW4wntElyN0a/crvWTBHVAFZQOzsVP9TrDjczxK2gO/Q3rrQiKZgwATBugMDmHS3+VDg==
X-Received: by 2002:a17:907:9143:b0:992:47d7:35d7 with SMTP id l3-20020a170907914300b0099247d735d7mr11386417ejs.14.1689680218174;
        Tue, 18 Jul 2023 04:36:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dx14-20020a170906a84e00b0098884f86e41sm893296ejb.123.2023.07.18.04.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:36:57 -0700 (PDT)
Message-ID: <ba7af1a4-155f-cab0-4fd6-1f998ceb4936@linaro.org>
Date:   Tue, 18 Jul 2023 13:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs3001
Content-Language: en-US
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230718112810.21322-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718112810.21322-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/07/2023 13:28, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

