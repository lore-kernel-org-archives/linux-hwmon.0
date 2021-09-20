Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195CCC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 22:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E67DD60200
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 22:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239186AbhITW1u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 18:27:50 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]:39497 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhITWZu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 18:25:50 -0400
Received: by mail-qk1-f172.google.com with SMTP id f130so8650432qke.6;
        Mon, 20 Sep 2021 15:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SzIMlYqBjun6gtLsSbuF7zkwt5EYh9ulvxLWweyQE3g=;
        b=Q4joWmCsGHpdgBmmoHYeDM9XZQ+u7+BTEyEtOaHBKqUY3dpvR8ub/bH+BGWaFG6an3
         ba0+RZUwh11nR0sQgCSkBOJjNdxhlL4XAJjMVcZXkW0TEv6dQJYSur07Vq5Q1J6nEE5e
         r+Fk57mfy+QgzJS7vngxi9wzI25u1oZb0i05o0ICbQ8upu8JC6D5aY9CWuZoSEMfjr1R
         ZLJnIZT/4T3EoqrRhoKy4HsZHSvBbmc4OqcXzenTOSyw/NiW/8hl3llE2lCzUjPrvmlz
         OywAfsEt0CZBFlvDkK0r0rDVuLpyOyO28dPlRfNxieIiu0Nu6l2fUzdMUr11DQHrQ+ZM
         CG8Q==
X-Gm-Message-State: AOAM531Oe1Ed/oqei4TEloawOLYAKWHhl1Dffgg8kdOwaEsQBpDlbqnQ
        KpV6ESjtNgjAf5hBOlNb64mdXUU32A==
X-Google-Smtp-Source: ABdhPJxpyI1w7UWhxnc2l2g0LS5lAH27m2FLxUJE2flMpWMW7kZP76Jo104q3SKyDDWjPZje6119og==
X-Received: by 2002:a05:6830:1056:: with SMTP id b22mr23596210otp.325.1632176651773;
        Mon, 20 Sep 2021 15:24:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i12sm338237oik.50.2021.09.20.15.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:24:10 -0700 (PDT)
Received: (nullmailer pid 906141 invoked by uid 1000);
        Mon, 20 Sep 2021 22:24:09 -0000
Date:   Mon, 20 Sep 2021 17:24:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for
 tmp421
Message-ID: <YUkKCe7845uCqoy5@robh.at.kernel.org>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 07, 2021 at 03:46:14PM +0200, Krzysztof Adamski wrote:
> Add binding description for the per temperature channel configuration
> like labels and n-factor.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  .../devicetree/bindings/hwmon/tmp421.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)

I'd keep this separate...

> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp421.yaml b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> index 53940e146ee6..56085fdf1b57 100644
> --- a/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/tmp421.yaml
> @@ -24,12 +24,49 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
>  
>  additionalProperties: false
>  
> +patternProperties:
> +  "^input@([0-4])$":
> +    type: object
> +    description: |
> +      Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. 0 is local channel, 1-4 are remote channels
> +        items:
> +          minimum: 0
> +          maximum: 4
> +
> +      label:
> +        description: |
> +          A descriptive name for this channel, like "ambient" or "psu".
> +
> +      n-factor:

ti,n-factor

Needs a type reference too.

> +        description: |
> +          The value (two's complement) to be programmed in the channel specific N correction register.
> +          For remote channels only.
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>  examples:
>    - |
>      i2c {
> @@ -41,3 +78,32 @@ examples:
>          reg = <0x4c>;
>        };
>      };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      sensor@4c {
> +        compatible = "ti,tmp422";
> +        reg = <0x4c>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        input@0 {
> +          reg = <0x0>;
> +          n-factor = <0x1>;
> +          label = "local";
> +        };
> +
> +        input@1 {
> +          reg = <0x1>;
> +          n-factor = <0x0>;
> +          label = "somelabel";
> +        };
> +
> +        input@2 {
> +          reg = <0x2>;
> +          status = "disabled";
> +        };
> +      };
> +    };
> -- 
> 2.31.1
> 
> 
