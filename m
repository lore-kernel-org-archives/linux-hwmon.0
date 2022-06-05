Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F123BC43334
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 17:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351312AbiFERyD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 13:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348079AbiFERyA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 13:54:00 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D592340A35;
        Sun,  5 Jun 2022 10:53:59 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l81so1577611oif.9;
        Sun, 05 Jun 2022 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d7HvLpHLHITXUmcEJH3SSSAbrFQD9OMdkj4+yynZIvk=;
        b=lWbVmHtCcnZMoXv1x7iWaRVl2vGfwn8v0wWPwz/FuCCEFbaEIk83tlNxG1gysIg/2o
         Y6jWXf217+3fPD57dZl59CSOCBGW8CUe2iBJQtPX9Vbb15REP0mlEWVW1klGX9IJZ+Wn
         Hkfhay6IZ7ao6miBIUW+dhbmhEjgWsizCBuujQKUE3iZfoauhfXsaJX7672pj61ekk5w
         0ZtV5A6ymiLPshJ1+CJPo0ZL7pqf/ZqpAirLoHLe9miWTHAMIJvt6UOlofmzOHD9jAXH
         anLv3MpT6Z/nXqbIIS11ZumqpxdWhJfBL/egTwbJmQWvHjeVZfzUmnF6LDm2Xwg+GbDy
         hI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=d7HvLpHLHITXUmcEJH3SSSAbrFQD9OMdkj4+yynZIvk=;
        b=LszQIHDwUh2isewcPa9ouiJzMIClYXGz7eJ2pvkZilIgbHVRBwTFdqG6vg+sC3igSf
         Rivv9i/Dr5ES0C2Mzo7r0IEJ3G+i6s0mIByFfNQR9LJIJr6ITbYqEWvORZFwh8jFGptT
         ePzZTSPBgUEkeMSnNj+/iO2PqC4Xzh3UA/jJ2hJmTHc2zxwFsaR9QdnFwZsO17wtNlbM
         VvPP4aVnSJI7xu0xQddKUpnX8xUz4NOXR8F+HtSCub4d0sJr8P47Q8iHnG1DklmW/n11
         cluxA7J3dvwXzLOJKWhsP234XXyFwMOe0rqTr1JQHautjikD5XpbdzuPOohn8q3WZOdr
         9eXw==
X-Gm-Message-State: AOAM532msdZqJuyCeWGi1AkMGmV9+zz+j9uo5al4Os4Ny4U5FQdBuiWL
        AjTCI4d2aAfnhHuEDxLhhpJnzY0I8hM=
X-Google-Smtp-Source: ABdhPJwQdIIjhtQrrr43ZSvN1Nc+tBDklxNBPzI0iyaSt96YIVyNOeZPkmc6cK6fCJ4jIjCWgPusYQ==
X-Received: by 2002:a05:6808:bc7:b0:32b:1bd5:5cbe with SMTP id o7-20020a0568080bc700b0032b1bd55cbemr27863914oik.256.1654451639226;
        Sun, 05 Jun 2022 10:53:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v11-20020a056870310b00b000fb46b45b8csm897287oaa.23.2022.06.05.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 10:53:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 10:53:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 2/7] dt-bindings: hwmon: Allow specifying channels for
 lm90
Message-ID: <20220605175357.GA3150915@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-3-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-3-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:52AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Add binding description for temperature channels. Currently, support for
> label and temperature-offset-millicelsius is implemented.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/national,lm90.yaml         | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 82fce96498c7..e1719839faf0 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -51,6 +51,12 @@ properties:
>    "#thermal-sensor-cells":
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>    vcc-supply:
>      description: phandle to the regulator that provides the +VCC supply
>  
> @@ -62,6 +68,29 @@ required:
>    - compatible
>    - reg
>  
> +patternProperties:
> +  "^channel@([0-2])$":
> +    type: object
> +    description: Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: The channel number. 0 is local channel, 1-2 are remote channels.
> +        items:
> +          minimum: 0
> +          maximum: 2
> +
> +      label:
> +        description: A descriptive name for this channel, like "ambient" or "psu".
> +
> +      temperature-offset-millicelsius:
> +        description: Temperature offset to be added to or subtracted from remote temperature measurements.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>  allOf:
>    - if:
>        not:
> @@ -78,6 +107,77 @@ allOf:
>        properties:
>          ti,extended-range-enable: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - dallas,max6646
> +              - dallas,max6647
> +              - dallas,max6649
> +              - dallas,max6657
> +              - dallas,max6658
> +              - dallas,max6659
> +              - dallas,max6695
> +              - dallas,max6696
> +    then:
> +      patternProperties:
> +        "^channel@([0-2])$":
> +          properties:
> +            temperature-offset-millicelsius: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adt7461
> +              - adi,adt7461a
> +              - adi,adt7481
> +              - onnn,nct1008
> +    then:
> +      patternProperties:
> +        "^channel@([0-2])$":
> +          properties:
> +            temperature-offset-millicelsius:
> +              maximum: 127750
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adm1032
> +              - dallas,max6680
> +              - dallas,max6681
> +              - gmt,g781
> +              - national,lm86
> +              - national,lm89
> +              - national,lm90
> +              - national,lm99
> +              - nxp,sa56004
> +              - winbond,w83l771
> +    then:
> +      patternProperties:
> +        "^channel@([0-2])$":
> +          properties:
> +            temperature-offset-millicelsius:
> +              maximum: 127875
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,tmp451
> +              - ti,tmp461
> +    then:
> +      patternProperties:
> +        "^channel@([0-2])$":
> +          properties:
> +            temperature-offset-millicelsius:
> +              maximum: 127937
> +
>  additionalProperties: false
>  
>  examples:
> @@ -96,3 +196,32 @@ examples:
>              #thermal-sensor-cells = <1>;
>          };
>      };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      sensor@4c {
> +        compatible = "adi,adt7481";
> +        reg = <0x4c>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        channel@0 {
> +          reg = <0x0>;
> +          label = "local";
> +        };
> +
> +        channel@1 {
> +          reg = <0x1>;
> +          label = "front";
> +          temperature-offset-millicelsius = <4000>;
> +        };
> +
> +        channel@2 {
> +          reg = <0x2>;
> +          label = "back";
> +          temperature-offset-millicelsius = <750>;
> +        };
> +      };
> +    };
