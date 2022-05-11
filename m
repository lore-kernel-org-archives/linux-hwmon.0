Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869BFC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 15:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343738AbiEKPcO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 11:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240224AbiEKPcO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 11:32:14 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E86B61621
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 08:32:12 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id kq17so4840298ejb.4
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=guHBaMI/9cS3cJJTwqoyTmxrJiB0eMmTvW+O9NRmqYk=;
        b=kVJmoqy/Y6r+0nyBQcoYitR/1IwlVd+KY3AQht9mDD+s6x08EFtjSl3wHJ9wjclcNE
         bauoDDDi1fPvrluiZN5z2013kBhL4F+geePzAq7VwK8kF86h6O8kNOjwu+GNeFT7Ro5u
         7/Euvaj/m137bnrdPw/U+s6OPao4C+X9KYT8XYeEafRTeUBjF7wilOC7oTTHt4NW0oan
         +whuLG0GU6LE4B3+oKRxThlyDtPPEDXJm25a3bkaRtUWpoPjWdNYcM5cJ4GsCa+50ES4
         qO15gXVvqSM024lcj8oz0cIkPDqBINpHt4FSyH6EfnRrFWsbfa8lMoLVNkVQxqhlIZRI
         VLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=guHBaMI/9cS3cJJTwqoyTmxrJiB0eMmTvW+O9NRmqYk=;
        b=P9BUUqG9PVU9ZQEJTkHFx9iWgT1egppO00PlbOU3vJUt1Sw98fcsBRxwSlK3HI+QK0
         lbvUBzVd6Y/r9DuPT0+eqiimeE2gg/oH9U3vnDWLREhP+CwvDS5AtdP1SWldPHrtm1BM
         AzXptvNAY+637zz+R93tBuPYr9TX9hwzBKNw/fItRnaOWlgW9Ke00QhoAgqru45O+HPG
         vwhKB8TN9m3Y1AAtVZETqD7ErT5V7liSFCTn7/T0k/B9SJEl6wxpKcHWDY9ApJcr7P5D
         e1wwFjlGfkwbBftJk0D8Y9n1/EzBh47H534uyNcB1W2M5C465uIgu8tpdrt0ZOYuoZs+
         5Ftg==
X-Gm-Message-State: AOAM5320EmlixZErycouSND3g8wkCCg86ElIoDUVFfhD2hVI6XCv/+b2
        BEYCxE5CAp7vli5hqmnlYjHurA==
X-Google-Smtp-Source: ABdhPJzkNbWNUIhOErzZBl4WD3CF0RBIWJfEoCZ3U9Agj26ULzVnlL7oeYB1URO7mkfQs8Z3kIa12A==
X-Received: by 2002:a17:906:b74b:b0:6f4:cd08:6fec with SMTP id fx11-20020a170906b74b00b006f4cd086fecmr26950313ejb.155.1652283129510;
        Wed, 11 May 2022 08:32:09 -0700 (PDT)
Received: from [192.168.0.154] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f8-20020a056402004800b0042617ba63aesm1359430edu.56.2022.05.11.08.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 08:32:09 -0700 (PDT)
Message-ID: <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
Date:   Wed, 11 May 2022 17:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/05/2022 10:08, Holger Brunck wrote:
> Some devices can operate in an extended temperature mode.
> Therefore add a boolean onsemi,extended-range-enable to be able to
> select this feature in the device tree node.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> cc: Jean Delvare <jdelvare@suse.com>
> cc: Guenter Roeck <linux@roeck-us.net>
> cc: Rob Herring <robh+dt@kernel.org>
> cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> ---
>  Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 30db92977937..92afa01380eb 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -52,6 +52,10 @@ properties:
>    vcc-supply:
>      description: phandle to the regulator that provides the +VCC supply
>  
> +  onsemi,extended-range-enable:
> +    description: Set to enable extended range temperature.
> +    type: boolean
>

There is no such vendor and it does not match the existing vendor for
these bindings (nor the current owner of National). Was there some
change? What is onsemi?

Best regards,
Krzysztof
