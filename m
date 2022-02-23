Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B45BC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242413AbiBWRP0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Feb 2022 12:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbiBWRPZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Feb 2022 12:15:25 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C78E69
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Feb 2022 09:14:58 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E932F3F1D9
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Feb 2022 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645636496;
        bh=5kSScfu1ynBQhlMwgNQcTZQZ+l099L/p5FFilnRHLoA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=vEEJQHgl9VuyfIQWWkxGrN2ATXB0sW6jpoQ03Dg+usAj0suC/bCu+L10Jwhd+PUXJ
         IbyicTNQrBvjjaDsyr/+1OJvFCcE+hJmKnJ29ZFMLMohs0RQxAQIoOy0Y4Gxt/fATF
         +lzGDsRBADzKiVwuEXju1e7Xb3jSvkyv+K4gkFh12RJgalLYKnmdJzMmDI9aV9+44h
         EFCsfMclyKf8fkhrlLRrxezm19DT+eajYLFwVqzK7uKORX5HGZx5+WLIO7oG220WhO
         y41VfqirPSAlcG6tqymsI3z8AKDigFhfcZ+J8lJBqRP4xvn+9Zz5dXNVH1uBQ/nZ61
         clPKHLZLH0ZVQ==
Received: by mail-ej1-f70.google.com with SMTP id sa22-20020a1709076d1600b006ce78cacb85so7395248ejc.2
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Feb 2022 09:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5kSScfu1ynBQhlMwgNQcTZQZ+l099L/p5FFilnRHLoA=;
        b=5bUpgU+gZmjL/db4KkVUXrozxDAoeEj4/Mm6hln3sa90qtD+cuzNyaaoLWTjv0jlbb
         MPZxlfug410Cd6JDvUoMjLQ8J8VRoDnfSvCZxjsByeVbLY0OYUtoqkfysNRUeppHW7KU
         3YoekZ3N33te1njKMGDCmK4jSuWqGi44/GQkSpnAI2MKniyeerOskzW97fHbYiligZ9v
         vQkO7fPdeiSo6xp+yIeU7WyolasEkjfOMljvOCe1YZcqgwGcZBos2rLgjq3e2L6S+jku
         09dTelRE8tt+p3k6toO1+LOdZmysXP4N/o6xnwiE3Zooz9XAZLjlqqGPqPe229j2+Y7v
         w1CA==
X-Gm-Message-State: AOAM533zDj8bABB8sQ2GSF2bMyirmyjAUeQb904TUWuCREXy/00b9g5S
        KO55L/9h4yRcZ1rBUCUM3xZ5qAv/PRcNQb+hjSltBGVxXHhJa1j2eO6cl5Czg6PJ8maql8aeGyJ
        jtRXKqezLzsLcEagQ+poT+Kzc2y53qFVjokcmc6rc
X-Received: by 2002:a05:6402:2801:b0:410:a592:a5d0 with SMTP id h1-20020a056402280100b00410a592a5d0mr377403ede.253.1645636496646;
        Wed, 23 Feb 2022 09:14:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8C6Speh5imj9uL4wV+FW7pUUwz5jAm+B3l/R97H1WjbJ/dMmrgtO2TdF852Q8eYfTqYzdmQ==
X-Received: by 2002:a05:6402:2801:b0:410:a592:a5d0 with SMTP id h1-20020a056402280100b00410a592a5d0mr377389ede.253.1645636496477;
        Wed, 23 Feb 2022 09:14:56 -0800 (PST)
Received: from [192.168.0.126] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w14sm98641eji.125.2022.02.23.09.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 09:14:55 -0800 (PST)
Message-ID: <4896ee6e-3395-8d67-8926-4a09f02d7cdd@canonical.com>
Date:   Wed, 23 Feb 2022 18:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add sample averaging property for
 ADM1275
Content-Language: en-US
To:     Potin Lai <potin.lai@quantatw.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Patrick Williams <patrick@stwcx.xyz>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220223163817.30583-1-potin.lai@quantatw.com>
 <20220223163817.30583-3-potin.lai@quantatw.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223163817.30583-3-potin.lai@quantatw.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 23/02/2022 17:38, Potin Lai wrote:
> Add binding information for "pwr-avg" and "vi-avg" properties
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  .../devicetree/bindings/hwmon/adi,adm1275.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> index 223393d7cafd..2525a67a880e 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
> @@ -37,6 +37,14 @@ properties:
>      description:
>        Shunt resistor value in micro-Ohm.
>  
> +  vi-avg:
> +    description:
> +      Sample averaging for current and voltage.

Both do not look like generic properties, so you need:
 - type
 - vendor prefix ("adi,")
 - maximum value?

It would be nice to actually explain what this value means - number of
readings for each averaging (unless it is obvious in the domain...)?

Does the hardware have default value?

> +
> +  pwr-avg:
> +    description:
> +      Sample averaging for power.
> +
>  required:
>    - compatible
>    - reg
> @@ -53,5 +61,7 @@ examples:
>              compatible = "adi,adm1272";
>              reg = <0x10>;
>              shunt-resistor-micro-ohms = <500>;
> +            vi-avg = <128>;
> +            pwr-avg = <128>;
>          };
>      };


Best regards,
Krzysztof
