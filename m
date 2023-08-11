Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF18C001DB
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Aug 2023 13:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjHKNYN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Aug 2023 09:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjHKNYM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 09:24:12 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361D490
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 06:24:09 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1520927a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691760248; x=1692365048;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LhKiz/oikbJrhlhN4+ipzPBTngJVIbTDBAkdrgVl8Pc=;
        b=AE+9+kz4c5u5x5ORRE6aIbaxrtO/jKSTfRattsDQfMxTXG/3YBtloKllK7n3xhS1c4
         vQsa5sH0P53F5HE4iDvVBxt5H2GjoLKE//NxkzrbeMoisLDhkPSPVHtXYM4FQXlH0/jY
         fQ/BzQK2FqrEpPiYzNjF9ZFa4ZBFtJ0MkPgk3nHDBR/R90iIKE+shw6BczaN2oCzeBN+
         qHqW8r8ceoVulmYy8a9nKPzUXi4cNjJLYIQrDC2si1xKGDEUUV9AT7RA0j7Hcv6zwGI1
         Dkv7vdHHA3WUk8CrspqfZAQBchRGqEPqKfQ8L4Vf5dTFdlnNXyD2NaSW//bEGco60ne6
         csSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691760248; x=1692365048;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhKiz/oikbJrhlhN4+ipzPBTngJVIbTDBAkdrgVl8Pc=;
        b=BMssz9fsTCh+qsSiO21S4k7WGY70bH7H/AEBRU5r/P1kKpJT5bzrgBYyzWvaORJEEx
         9iHc2UO1gdyacvgLQn6zJvzDNvg1M2viI9DrpydC87k1Htoh6UlcqbLVyT7kDIKoBdwr
         t1MWYyrve10Onb+cGQzNdcjlweZmwe0LBnPiGMzZ9MMYBIFX0vbEZjb8l8i4TkaZ7tOt
         Z5jCVqmGOaRcvFkuIFXjixOAAo/ltmGKmXUQQIa7O3ZHhwmxRlSEQ+4dbbQoSXYe1Hwy
         uQwaKEPDb2mDJJ9LahrVShJ3C0+SzGezI50ADgPKBSlZg5UBrRiClXCjNMwfOJklUvub
         e92Q==
X-Gm-Message-State: AOJu0YyGRe3cplbgBR7HG2q3iAyW+BeYPiDF5ksWOlpTBS8gqPKFooId
        lL3tQZ1WhIrlkC2gOl56kpP+vKafES4=
X-Google-Smtp-Source: AGHT+IG8U/Z3AGVe+uIG+c6WiOKWIowDhd9VtfJeKAeU5YJPt5vYO9GICtlOLGZCL1Q9xy5BBlESQg==
X-Received: by 2002:a17:90a:ba84:b0:25f:20f:2f7d with SMTP id t4-20020a17090aba8400b0025f020f2f7dmr1461173pjr.2.1691760248527;
        Fri, 11 Aug 2023 06:24:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090abd1200b00268188ea4b9sm3354160pjr.19.2023.08.11.06.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 06:24:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <81ec50bf-236a-3010-95db-a7efac4b3570@roeck-us.net>
Date:   Fri, 11 Aug 2023 06:24:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Lothar Felten <lothar.felten@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jdelvare@suse.com
References: <20230811083222.15978-1-lothar.felten@gmail.com>
 <20230811083222.15978-2-lothar.felten@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 2/2] dt-bindings: hwmon: add adi,ltc4271
In-Reply-To: <20230811083222.15978-2-lothar.felten@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/11/23 01:32, Lothar Felten wrote:
> Add dt-bindings for Analog Devices LTC4271 PoE PSE.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>   .../bindings/hwmon/adi,ltc4271.example.dts    | 28 ++++++++++
>   .../bindings/hwmon/adi,ltc4271.yaml           | 51 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   3 files changed, 80 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
>   create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
> new file mode 100644
> index 000000000..829f7c5a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/dts-v1/;
> +/plugin/; // silence any missing phandle references
> +
> +/{
> +	compatible = "foo";
> +model = "foo";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	example-0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		i2c {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ltc4271@20 {
> +				compatible = "adi,ltc4271";
> +				reg = <0x20>;
> +				shunt-resistor-micro-ohms = <250000>;
> +			};
> +		};
> +
> +	};
> +};
> +

Is that something new ? I don't recall seeing similar .example files.

Note that this won't work well with the current driver implementation.
You would need two or three nodes to describe a single LTC4271
(at least according to comments in the driver).

Guenter

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
> new file mode 100644
> index 000000000..696e91a8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc4271.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC4271 PoE PSE
> +
> +maintainers:
> +  - Lothar Felten <lothar.felten@gmail.com>
> +
> +description: |
> +  The LTC4271 is a IEEE 802.3at Quad Port Power-over-Ethernet PSE Controller.
> +
> +  Datasheets:
> +  https://www.analog.com/en/products/ltc4271.html
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc4271
> +
> +  reg:
> +    maxItems: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description: The value of current sense resistor in microohms.
> +    default: 250000
> +    minimum: 250000
> +    maximum: 500000
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ltc4271@20 {
> +            compatible = "adi,ltc4271";
> +            reg = <0x20>;
> +            shunt-resistor-micro-ohms = <250000>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 789742390..483956f76 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12187,6 +12187,7 @@ LTC4271 ANALOG DEVICES PoE PSE DRIVER
>   M:	Lothar Felten <lothar.felten@gmail.com>
>   L:	linux-hwmon@vger.kernel.org
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/adi,ltc4271.yaml
>   F:	Documentation/hwmon/ltc4271.rst
>   F:	drivers/hwmon/ltc4271.c
>   

