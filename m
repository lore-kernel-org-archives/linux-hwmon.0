Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CC8ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Sep 2022 14:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiIIOtt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Sep 2022 10:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbiIIOts (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2022 10:49:48 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D766D40BDF
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Sep 2022 07:49:45 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z20so2135569ljq.3
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Sep 2022 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1lT/OwCHyhNISvxKwmUNe1P3eQPE7RJKCQSdPy50UzE=;
        b=LL8KHI64pzX+EE+m7YrSqXVqEbWe/evZYmgB5IlX6OiViKPmZOtVFFvuvP+ONGMtF/
         yeD4apJmT7LrdXVpyGooMqigYr899ECX0cV4ExBCwYjQe7K/QKUoBkO8cWzeU87cEIWB
         NhkmQkBPwMw/viVVfWGEchCfnRfIjqv8ldB1nuAZTjGY70XAyxX/CafPnd2u8+PaVdbh
         YU17kw8XGn8KSbsjIiR0/vjJ+TiltDHa/aA8JvjlmW0KLMHjjgl1RMKGwHTXWRkrzh+0
         MqQkfLRmc6CGY5s4aXzNjFTNwLvblH+vWnPm9CZxLsn9cvc49dLvkMQLCMDfGVCJkG83
         ICQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1lT/OwCHyhNISvxKwmUNe1P3eQPE7RJKCQSdPy50UzE=;
        b=xDZqOfQnGauoJYVBULzOnkiuoBdGLEb2onoBlww/SfJtXbrkEq2oMjbeG+tmRSH3EP
         I2GW+0jY3uB03+WO/WXZ+6VCFZrNqAsjcqJaCrbnDJABxxwFKD9qbfQqR5ey8h5F0f1J
         fprnOuoC3nF5txkNUBvH9zONNLHFS7c80PY0Q9Bo0Jdil37fMaE2pB4YcIjmTPeUDugx
         aQGqNsgsXkbUijgUI1/461zaftA1un3Zsl5OUKmrrQmBcKRnAVERdmgBhv9kM0qGLXny
         lfHa452Y57/g7Uww0vTJgYjG20+PyCHqISrv9XE3lm49XUp9NIfd8xZkM4+V4NL7ZhbI
         zE3Q==
X-Gm-Message-State: ACgBeo2yjVuEtoA25HXRk5m2haMjKLHcjJARUpr0zeP4AMPr/Ry4fZm8
        7S3gzDNZu+I5sxHzrUeY6H69BA==
X-Google-Smtp-Source: AA6agR6u+KSVbD526kUEJ8cIa10gmU57gO5jd+ec5TAeVHwqSwIieJ7/F+zqOx4AfuvkxZpRX7a1Ow==
X-Received: by 2002:a2e:a551:0:b0:25f:eb63:2588 with SMTP id e17-20020a2ea551000000b0025feb632588mr4168453ljn.9.1662734983596;
        Fri, 09 Sep 2022 07:49:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020a2eb170000000b0026be76327f2sm114241ljm.13.2022.09.09.07.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 07:49:42 -0700 (PDT)
Message-ID: <9d5e8a41-8e0a-c67a-1b68-f743b4680510@linaro.org>
Date:   Fri, 9 Sep 2022 16:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 3/4] dt-bindings: hwmon: Add bindings for max31760
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, jdelvare@suse.com,
        linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220909133718.388213-1-Ibrahim.Tilki@analog.com>
 <20220909133718.388213-4-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909133718.388213-4-Ibrahim.Tilki@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09/09/2022 15:37, Ibrahim Tilki wrote:
> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Please wait with applying for Rob's bot to check it.

Best regards,
Krzysztof
