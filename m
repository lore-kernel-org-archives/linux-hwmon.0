Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDA9C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 15:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbiBIPLC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 10:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiBIPLC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 10:11:02 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F8FC06157B
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 07:11:05 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id r15-20020a4ae5cf000000b002edba1d3349so2791612oov.3
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Feb 2022 07:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=Y4oAKzS+nqisr9v0aZaBHR4xrsL0haBdNkWZe/5qsLU=;
        b=b9hkpdBUvi5WbEsjXyTEIJ90bVKJmSfxI9WvY4Sk5KvkMK3i2ghYuyoHA7sM20tmzP
         8EK2UOzNTRvMQNJtzr+9ejbiUQBFHYb1AmVfcusmRZncbFSfBR7F1P3Fpt1JXSmmsrub
         HjZTru4umAhgWsCW7UVyzkwZijB84fdgGDxpg5KGWAYJeadgBs3rRaMXjrQxVfMIQNor
         E1u6b0MWVZc3TCBlj6iG4C2eW0Q/IttdN/pj4GvYnQHEx7nHiCVAykh6KbGcfbP+TSjQ
         pVE3o3a4+400fbqPlUqhKuKBHFEHm4r8MRpdqsi5P8bBIGzRv8jscmiP0t8rpuPmNlE8
         JFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=Y4oAKzS+nqisr9v0aZaBHR4xrsL0haBdNkWZe/5qsLU=;
        b=BjPrYIRqSzkLpFnKJpKJ8u7aIJTFLA5lwfDMkxoSnqe8pfvcCRdQCuN4dfYqRfsySJ
         m3NZIdkP80utISXRNXlBoPFxEvaAKFlJvHuZsyJcOsTZaIAVF0dRroSVmEi/JPyTCUAR
         xPai9lCuyb4jwXnSjgFPHTRfgDIoWAnFPCafvJ/PACBPPE89ufpZKd+e8NrTIAHBg1Vc
         RUsu6SE3Ef+qh8j6Np2p6Yy3W4ssuH0UcSoS6OwzM7cqlHb8n3kKmijx7kOe3WBldH+g
         kL/O/Ir9KYFasb3rdQbSn89WiJXh7mGsATVb3K9dvmu47jcWld0jJ2x6ghqeigKS2LkF
         1ydA==
X-Gm-Message-State: AOAM531racHAz7LsfxdJQRJwHQpoDxshaNF/FRfYIKYJsAAWYqfpQYQX
        AUqzZgLNxPpDZ31dAdbWSkbWX1NZGPti9Q==
X-Google-Smtp-Source: ABdhPJyuurcL3oHfR6eiLpWKvtH6DYq4o6X+eCrJlX/v88P7+NizfCEWsAc2umrhqDIRmlWPOqE4Uw==
X-Received: by 2002:a05:6870:7307:: with SMTP id q7mr1021214oal.3.1644419463031;
        Wed, 09 Feb 2022 07:11:03 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x31sm2405046oao.13.2022.02.09.07.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 07:11:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bb16fe88-3ccb-77c6-af13-db3526b617f7@roeck-us.net>
Date:   Wed, 9 Feb 2022 07:11:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Agathe Porte <agathe.porte@nokia.com>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add tmp464.yaml
In-Reply-To: <20220209133617.67297-1-agathe.porte@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/9/22 05:36, Agathe Porte wrote:
> Add basic description of the tmp464 driver DT bindings.
> 
> Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
> ---
>   .../devicetree/bindings/hwmon/ti,tmp464.yaml  | 106 ++++++++++++++++++
>   1 file changed, 106 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> new file mode 100644
> index 000000000000..aaee652c0067
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,tmp464.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMP464 temperature sensor
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +description: |
> +  ±0.0625°C Remote and Local temperature sensor
> +  https://www.ti.com/lit/ds/symlink/tmp464.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tmp464
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^channel@([0-3])$":
> +    type: object
> +    description: |
> +      Represents channels of the device and their specific configuration.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. 0 is local channel, 1-3 are remote channels
> +        items:
> +          minimum: 0
> +          maximum: 3

The chip has 1 local and 4 remote channels.

> +
> +      label:
> +        description: |
> +          A descriptive name for this channel, like "ambient" or "psu".
> +
> +      ti,n-factor:
> +        description: |
> +          The value (two's complement) to be programmed in the channel specific N correction register.
> +          For remote channels only.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        items:
> +          minimum: 0
> +          maximum: 255
> +

This does not seem to match the implementation, which calls
of_property_read_s32() and accepts values from -128 .. 127.
It seems unlikely that 255 is interpreted as -1.

Hmm, is that a bug in the tmp421 driver ? I wonder if anyone
checked that, and if there is an official means to express
negative numbers in devicetree. I see other drivers use
of_property_read_s32(), but I did not find a clear explanation
how to describe negative numbers in devicetree files.

Also, I think other chip configuration properties need to be
described here as well for completeness.

- temperature offsets
- hysteresis
- temperature limits
- conversion rate

> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      sensor@4b {
> +        compatible = "ti,tmp464";
> +        reg = <0x4b>;
> +      };
> +    };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      sensor@4b {
> +        compatible = "ti,tmp464";
> +        reg = <0x4b>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        channel@0 {
> +          reg = <0x0>;
> +          ti,n-factor = <0x1>;
> +          label = "local";
> +        };
> +
> +        channel@1 {
> +          reg = <0x1>;
> +          ti,n-factor = <0x0>;
> +          label = "somelabel";
> +        };
> +
> +        channel@2 {
> +          reg = <0x2>;
> +          status = "disabled";
> +        };
> +      };
> +    };

