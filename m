Return-Path: <SRS0=fVv9=YW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37091CA9EAE
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 12:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F379920874
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Oct 2019 12:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCntg8s8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfJ2MaW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Oct 2019 08:30:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35657 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfJ2MaW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Oct 2019 08:30:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id x6so3487959pln.2;
        Tue, 29 Oct 2019 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TnIIVg05ZQznxZVyJvpqkHUYES2HWSY4HpSOpQH7xP8=;
        b=bCntg8s8+8VbVwrL2WAhxsBY6HcP8tnGHeXfbm1eICUR5fpEV1/HK+AyJGcelBpdPM
         UuYk6ePNZIfSa7otwUZgtZppX5UBmp/U0xzPoxPAO1PQdMe5QnymEjLNAQtN/qelQ+w4
         wsAv+h7o2+ayy1CefeZngPr5eFus4ruVn3JwdL+IerNfiwVJMGTt793ko+YyjpxitKVO
         KqDMnOqFHpbyy7qypi9YJcYx2CnMvAoPcaOaa7msx8lBo49vKaVF9GuWqjgHKT/XI00+
         Tya+/QPo81DY1gX35EdbvT2tXsxlHkSLwpIoR3+M1NHe1JzqjmNSwpfqWquM0zxvKdCE
         NWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=TnIIVg05ZQznxZVyJvpqkHUYES2HWSY4HpSOpQH7xP8=;
        b=muhRpV221LQP+c/tosCiKpMUq/BtengVdV5dxyBTTYPJm2VhEiKQOlPHMipDIG3WWs
         ELbaDOBQm4oU0a1SQ/8m12L29tqBd3minvgYLL0TOnNDd7Zfpy6vGKHyVhUYUylLTl7U
         DWa/2eDs4bj4Xs/1CR01XnOvZeHXcXVkUpymvGnzkluSy0cjeavjtfqf5vp3rByupgmi
         qFNNimYyd4ZRXcn8Nyt/dBr8pC2oT/DwpGNgQNXXNvzLwLgzbGjTNUXrOHT0M0T3sdV2
         mkaUFfaCIQX11ZYXlplncQCoJ10YjK3sUiZJN8FbocCo1/NCKzfFrZqzi7/9eSdLft+u
         y07Q==
X-Gm-Message-State: APjAAAW6XqRZJbrjgjjp3OStfbmPobxpYSYBEQsznzJ5QTGgF8WYG/Hg
        8/CZ/G0obUkIhYk9Z8aNRMA=
X-Google-Smtp-Source: APXvYqwgbe10R5Ax/5cUo2cOTQWdQR1Z3fEr8rMvQ9tChVUegPRzARP4iUmJ1OsRn7rc9s92NGR/3g==
X-Received: by 2002:a17:902:7b98:: with SMTP id w24mr3644248pll.299.1572352221293;
        Tue, 29 Oct 2019 05:30:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l3sm15394656pgo.74.2019.10.29.05.30.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 05:30:20 -0700 (PDT)
Date:   Tue, 29 Oct 2019 05:30:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Message-ID: <20191029123019.GA20038@roeck-us.net>
References: <20191021154115.319073-1-nuno.sa@analog.com>
 <20191021154115.319073-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021154115.319073-2-nuno.sa@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 21, 2019 at 05:41:15PM +0200, Nuno Sá wrote:
> Document the LTC2947 device devicetree bindings.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied with Rob's Reviewed-by:.

Guenter

> ---
> Changes in v2:
>  * Add license identifier;
>  * Fix the uint32-array properties;
>  * Set maximum at the same indent as allOf in adi,accumulation-deadband-microamp;
>  * Set enum at the same indent as allOf in adi,gpio-out-pol;
>  * Use spi instead of spi0 on the example;
> 
> Changes in v3:
>  * Nothing changed.
> 
>  .../bindings/hwmon/adi,ltc2947.yaml           | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> new file mode 100644
> index 000000000000..ae04903f34bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/hwmon/adi,ltc2947.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC2947 high precision power and energy monitor
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices LTC2947 high precision power and energy monitor over SPI or I2C.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2947.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc2947
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      The LTC2947 uses either a trimmed internal oscillator or an external clock
> +      as the time base for determining the integration period to represent time,
> +      charge and energy. When an external clock is used, this property must be
> +      set accordingly.
> +    maxItems: 1
> +
> +  adi,accumulator-ctl-pol:
> +    description:
> +      This property controls the polarity of current that is accumulated to
> +      calculate charge and energy so that, they can be only accumulated for
> +      positive current for example. Since there are two sets of registers for
> +      the accumulated values, this entry can also have two items which sets
> +      energy1/charge1 and energy2/charger2 respectively. Check table 12 of the
> +      datasheet for more information on the supported options.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - minItems: 2
> +        maxItems: 2
> +        items:
> +          enum: [0, 1, 2, 3]
> +          default: 0
> +
> +  adi,accumulation-deadband-microamp:
> +    description:
> +      This property controls the Accumulation Dead band which allows to set the
> +      level of current below which no accumulation takes place.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 255
> +    default: 0
> +
> +  adi,gpio-out-pol:
> +    description:
> +      This property controls the GPIO polarity. Setting it to one makes the GPIO
> +      active high, setting it to zero makets it active low. When this property
> +      is present, the GPIO is automatically configured as output and set to
> +      control a fan as a function of measured temperature.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +
> +  adi,gpio-in-accum:
> +    description:
> +      When set, this property sets the GPIO as input. It is then used to control
> +      the accumulation of charge, energy and time. This function can be
> +      enabled/configured separately for each of the two sets of accumulation
> +      registers. Check table 13 of the datasheet for more information on the
> +      supported options. This property cannot be used together with
> +      adi,gpio-out-pol.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - minItems: 2
> +        maxItems: 2
> +        items:
> +          enum: [0, 1, 2]
> +          default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +
> +examples:
> +  - |
> +    spi {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           ltc2947_spi: ltc2947@0 {
> +                   compatible = "adi,ltc2947";
> +                   reg = <0>;
> +                   /* accumulation takes place always for energ1/charge1. */
> +                   /* accumulation only on positive current for energy2/charge2. */
> +                   adi,accumulator-ctl-pol = <0 1>;
> +           };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 318332b6a411..e2ba1a182052 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9638,6 +9638,7 @@ F:	drivers/hwmon/ltc2947-core.c
>  F:	drivers/hwmon/ltc2947-spi.c
>  F:	drivers/hwmon/ltc2947-i2c.c
>  F:	drivers/hwmon/ltc2947.h
> +F:	Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
>  
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
