Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C02C64990
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Aug 2022 14:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242147AbiHYOtp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242072AbiHYOto (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Aug 2022 10:49:44 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6B6B284A
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 07:49:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id s1so25749733lfp.6
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 07:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=zQBjygS8SCHVF5NWTeRq0S8WBLCqlWIJPLS18A425Jo=;
        b=HLeBSz4kbNvFBK2P5M3BUEWz5YfE1cWTZpxBfcHVg0Xm22DwGf4nM4lNhaKlqKUtTY
         HCG9RVM+gXQMICAR0zuPCPaBxObGxiLDo7tW3/b8Z5aAGl03tj4gcK1awwCxqf98T2kP
         N7AWdUaPU0tpFqwfuiEeviuIA8S5Voofy58ouGqN6E9NFYDl6PO7K3Qhp2u4fPKVEUGz
         z9GNZNcE6iQK0Hjx/kKvJM1kP5/kmNcKVnWAzf7k4sboEACFOSLnB2Rw68p9/3RAwrLx
         6gcZiSpR/wljBf827mhfo9engPN0aQHEsBLwPADZmXOyiLSnS5XXjqEFw+JXRviBex5Y
         zEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=zQBjygS8SCHVF5NWTeRq0S8WBLCqlWIJPLS18A425Jo=;
        b=Bj/TnZr3pvNqGz6CRBYGlh9o1Q2YRBSTcAs88UYgPd76CaNp+HZbJwXp38uyq+MhvV
         X3WWqZtXLHbcL99j8vCeMHKgeSE3ASd7nL6MV98eGH5wzYv86ZTUKMCbYQjdgZzuMdDa
         2LaGd7Tt5V2bdIrNjJEey7dcRMOUP0ctCwnodcDb9byIvW4HZx0qDVS3nTkVu72PI0Ay
         E2qlWXiaZoW8XjHMSX+kKs9ucYRkEOv5MhMlg18hP/ViW/zFDs0cKxIyl0ULCdnr0Nfl
         Lz/l7b5KO5lXnx8BADNdpBJPP+AC3OrP5fBIsqrr9E3Kb6N9aXXkvPwiicNcmBwDXWV3
         +JWw==
X-Gm-Message-State: ACgBeo25eIBjBg6dVYI5j+fHh6LUHzD1Yg2Cb0QozwGCTPH9pQ/1LDPD
        KLF0yO38JlauGWVB9qiwvJAozL3qu1O6ao3C
X-Google-Smtp-Source: AA6agR4nHsUMcKPDNfT/Ev+u7ZNpF9ElXAOXYDZRDAdUrPqz6QvM9j3oewQPKa33v+Q+8QyiBiPSqw==
X-Received: by 2002:ac2:515c:0:b0:492:df83:8bc1 with SMTP id q28-20020ac2515c000000b00492df838bc1mr1167327lfd.620.1661438981469;
        Thu, 25 Aug 2022 07:49:41 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651210c400b0048d1101d0d6sm532399lfg.121.2022.08.25.07.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:49:40 -0700 (PDT)
Message-ID: <b731087b-a6f9-044a-783c-c78129474cd5@linaro.org>
Date:   Thu, 25 Aug 2022 17:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/2] Documentation: devicetree: update bindings for
 tps23861
Content-Language: en-US
To:     =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220825143737.77732-1-dev@aboehler.at>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825143737.77732-1-dev@aboehler.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 25/08/2022 17:37, Andreas Böhler wrote:
> The tps23861 driver does not initialize the chip and relies on it being
> in auto-mode by default. On some devices, these controllers default to
> OFF-Mode and hence cannot be used at all.
> 

Thank you for your patch. There is something to discuss/improve.

> This brings minimal support for initializing the controller in a user-
> defined mode.
> 
> Signed-off-by: Andreas Böhler <dev@aboehler.at>

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> ---
>  .../bindings/hwmon/ti,tps23861.yaml           | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> index 3bc8e73dfbf0..ed3a703478fb 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> @@ -35,6 +35,50 @@ required:
>    - compatible
>    - reg
>  
> +patternProperties:
> +  "^port@([0-3])$":

No need for ()

> +    type: object
> +    description: Represents ports of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: The port number
> +        items:
> +          minimum: 0
> +          maximum: 3
> +
> +      mode:
> +        description: The operating mode the device should be initialized with
> +        items:

If this is real array, you need maxItems, but it looks one item, so no
need for "items".

> +          - enum:
> +              - auto
> +              - semiauto
> +              - manual
> +              - off

And how "off" is different from disabled or powered off?

> +
> +      enable:
> +        description: Whether the port should be enabled

This looks confusing... Looks like boolean property, but instead you
define some numbers. What are the values for these numbers? Why these
are numbers not booleans?

Second - what does it mean "enable"? We have a generic "status" property
for it - isn't this the same?

Third, all these properties (especially PoE) look like you keep
describing here network device but this is HWMON part.

> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +      power:
> +        description: Whether the port should be powered on
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +      poe_plus:

No underscores in property names.

> +        description: Whether the port should support PoE+
> +        items:
> +          minimum: 0
> +          maximum: 1
> +


Best regards,
Krzysztof
