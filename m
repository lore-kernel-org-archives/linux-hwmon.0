Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D8FC3F6B0
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 11:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238977AbiHILbg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241882AbiHILbc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 07:31:32 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC97095B2
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 04:31:30 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id w15so12704007ljw.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xb312PhkB7YHxkGgBMD9Hd3iz4ffA4SEHUAo6HB/S+U=;
        b=dIq5ojBaaimvdme0pZvsU8xPrCKLNL0+SW3jmtRxipsdVvPR5tNbP3tJnqK5opmM9S
         6piOkZ5syV68RtIQlm1MgDu4GT33R4rEu15XjzD+XTI7M8LgI08gFgU6uvirdfUSvYkG
         0nibekfBzqTCU65K96/U1Hbgz0yPkB8VLqvp8RLnKN6NJ6XGLuvniIXLxrv5DC9L+amH
         USMgw8X3h0179ir2scyKCTvPiuqZTzUZ+Lzn+iWHpWNYf9yooLb/yDq+L8Zc2YG5rRz+
         vi917ZEL5c3B/EurcAgj6Q/BxAgM56ANSllJ0kVhQ4TPLD4+S7jIcpVXi3v8YkohCxsa
         A3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xb312PhkB7YHxkGgBMD9Hd3iz4ffA4SEHUAo6HB/S+U=;
        b=nH4CNivg0GzwO1VAKQN8LU2m9CQOypZGUdenobyGe/I8hr/FmbnX4EN2RaRw/3J47p
         39Ma0Oo1UZ93ZJOWyBgR/Lan75zR2Q9S2ZjgROzpHJFllMTz1ZH78LEeLWJF6qYCqA+R
         NLXS+P/dRlFkn5H/OGB9NUT3NCEJEnyC1e2LikPNYuX8efy6ih9S6cIZmUxyFuQhWD2L
         +1zJR9vGFPqxUa975PRoh1QP28/ysOA7rEDWv/c/rPN3E6kPq/5rRdI7zll6IYQCWV1h
         69dI1PHPq6t7UOGbLL2FdJtX6NegmIC0sI5DTwn/KTzogUJcmx0XeRWSdm353iQYveDe
         fcLg==
X-Gm-Message-State: ACgBeo2rLR+pjjvHBkiLEObqCmqxmtgjkSzxogCUOEVK5wm+gyTg3RmZ
        hxzKH77v3QjXDmqYDo0JJas2MQ==
X-Google-Smtp-Source: AA6agR5gwuiC/4kIkC3bJMYhMSbSSdvyfE+myCW+6MmOnCCX1bW7ArSs7UKo3B+1+qDdKjhdMj5KBA==
X-Received: by 2002:a2e:bf01:0:b0:25f:df1a:f39d with SMTP id c1-20020a2ebf01000000b0025fdf1af39dmr2845463ljr.365.1660044689140;
        Tue, 09 Aug 2022 04:31:29 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id f3-20020a05651232c300b0048af464559esm1724043lfg.293.2022.08.09.04.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 04:31:28 -0700 (PDT)
Message-ID: <1585ea75-9454-acdc-6232-25c951563107@linaro.org>
Date:   Tue, 9 Aug 2022 14:31:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: sparx5: use correct clock
Content-Language: en-US
To:     Robert Marko <robert.marko@sartura.hr>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lars.povlsen@microchip.com,
        Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr
References: <20220809112209.241045-1-robert.marko@sartura.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809112209.241045-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09/08/2022 14:22, Robert Marko wrote:
> SparX-5 temperature sensor uses system reference clock and not the AHB bus
> clock as indicated by the register information [1].
> 
> So, correct the clock description as well the included example.
> 
> [1] https://microchip-ung.github.io/sparx-5_reginfo/reginfo_sparx-5.html?select=hsiowrap,temp_sensor,temp_sensor_cfg,clk_cycles_1us
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
