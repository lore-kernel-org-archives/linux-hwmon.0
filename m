Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3506C04A94
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Jul 2023 07:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbjG1HLq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Jul 2023 03:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbjG1HL2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Jul 2023 03:11:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164F13C26
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Jul 2023 00:11:02 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99b9421aaebso240997066b.2
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Jul 2023 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690528260; x=1691133060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6/65k5swW0BKp3wzBZg4774CGDmkxniUqOsEfQe6Uw=;
        b=bL0nctVDX3DnxRGMycIWRdVNkXQa5rwaM09e7gtVjJykGhMN19+Dp6H2Ee0AU5fzpi
         dGvQeRNQSNkiSNJv7jPZRu0i5SAM/75wj1BCZh1mZCjdrpnFTVRCtlUeNZNzfnVWpVfm
         htpYrN5HcVcnOcrVDM3yrBTXihWQ4skJD61GDH6xedOS7UEB+0+KmdTmE/UaEVZUejDA
         bLxyy2/BQn807HId7792L6+78qu1B8tigZvxA1TFcZaQi3GlE8p6OOsY9t/bxFNwhz5w
         FMZaUTkBR0fxpSRzTZ7QihjkEa3bI5VrbPv6bNbXLHjzlPTprrKA/paCB4Lquiai6UzE
         aVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690528260; x=1691133060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6/65k5swW0BKp3wzBZg4774CGDmkxniUqOsEfQe6Uw=;
        b=ZoRXzwzP3Yfvy4H5x4xQPBUEsZr+pZ6HmTgtm4ercyIA/2weP30mrNd/Ahc7VFVcqr
         zuIVnB7m+zyRTV2yPrPy4rw5mPMl9afzFJJYEkkAtjvJFBqfTYgIHgFDUr//F6NsrJ1V
         QHCPeNHkZv1v6dBtk5QZhPdiyitmbiPhKYG4b8IVURwpc8/0WddORBXHABocZTWtvsUG
         qh89pRR50f8ZbROaAyF9xHlOl5R/lxpLrKcXAzFPmiZWqCpzEj3mxKxf5LoyWcMH053O
         CkOs20ilwCkSb5EYbkzcVHh67ab9CdffELgRCLhHXpvP0CeSlr2Z9KVqJ64KO32Dve81
         y7cQ==
X-Gm-Message-State: ABy/qLbm/HdDC93vix9PNDmDvz+RgTlqMC/2mm4RIYULanhxMpey51Lp
        c3w++05+gN8MTWh5btb0zxaMUhP2ll7Y0lhYcFRsJg==
X-Google-Smtp-Source: APBJJlFNUDRbBrJQrURZlqPNy8h7vIf5frzfxBJOWvaZxlJEn+aYgzPtDvceQhB6M3RrzIY1XCOaLw==
X-Received: by 2002:a17:906:5a4b:b0:993:d920:87d3 with SMTP id my11-20020a1709065a4b00b00993d92087d3mr1028608ejc.25.1690528260498;
        Fri, 28 Jul 2023 00:11:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906408700b0098de7d28c34sm1678442ejj.193.2023.07.28.00.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:11:00 -0700 (PDT)
Message-ID: <26d662cc-30ce-ddd6-bfe7-d0e230fdd600@linaro.org>
Date:   Fri, 28 Jul 2023 09:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: add renesas,isl28022
Content-Language: en-US
To:     =?UTF-8?Q?Carsten_Spie=c3=9f?= <mail@carsten-spiess.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230727200234.2245395-1-mail@carsten-spiess.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727200234.2245395-1-mail@carsten-spiess.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 27/07/2023 22:02, Carsten Spieß wrote:
> Add dt-bindings for Renesas ISL28022 power monitor.
> 
> Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
> ---

This is v2, so what changed? Where is the changelog? Which changes did
you implement, or maybe nothing changed and there is no point to review?



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

