Return-Path: <SRS0=XbFJ=Y2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C517CA9EC7
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Nov 2019 15:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FB9221726
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Nov 2019 15:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/bYtkNv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfKBPaK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Nov 2019 11:30:10 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40299 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKBPaK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Nov 2019 11:30:10 -0400
Received: by mail-pg1-f193.google.com with SMTP id 15so8322425pgt.7;
        Sat, 02 Nov 2019 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WtEi0obkqA+hOpVZZmPJeUDuP8bZ60Q2HPO76+/ywVM=;
        b=h/bYtkNvK8uXqY6YoPo3nsgiH0Dnh5jmcvkkzyQKaGSvALwUmSVXpxwTpLvx/yipEe
         mcplOG4RilvyKV/aeYMQLq0lQQ6MmhQu+crKAbvS029uuHQ0mdW8ZPEoaxHh9aTqO93c
         7PnC/Ejz/SoIHxAUhORpx4rjUcA1qPRx5I4kRsK9MHTr3SN6okoYiSwbPILrTotMSlAv
         6/B2tqMJY9Sj6h/63ZegU7yMQy/aMfPH8t5hg0p8H5Dnn16E1lJkkwRGExrOuAJ0I/fk
         r8Ap3wwDUMeOc1/FiZPNNV7NQtqS4YU8IrdydzQ83FUjoIE8qNjPYsQ/ig3ODUhJHOGq
         FntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WtEi0obkqA+hOpVZZmPJeUDuP8bZ60Q2HPO76+/ywVM=;
        b=Ak000uX33QLsHJkiUXqGpPPGEU8wI5CSwyunC8u3BL6uh5sOXSGhr0rb5WgJDEyfpT
         6EgnQA62G2m1Dp7uwpOzAzc40u8Ko5iSaTa2cRgyhggH4RHClalJSDiCk0EdczE0Q/Ty
         LCbKYRDbB0QvsAtLEPnR9RPKykLfqZO6q34eVsMZcB2vEMxYYypt+BXtndBZhvPs7QQU
         Vj/Ymx9wpssMigGi4nOJMldVwrQ2dyLh4ECMHpa3zR+bePHMQl5j6FBO0dmU/Z0iwfUb
         FHjXQG572BSmr6Z4rePVEbf3LzR2B3EF6JDVmLJnTVuk6bZm/W6pp+bCm/93CdFTPYpK
         PWtw==
X-Gm-Message-State: APjAAAVYZsKgkGeVgNNKe6L1CSVhVnLqzRmi3VrHYWNtLMh7Q9+72lUl
        ojWSLXstG7vcogQZmSXnMn4AqR1E
X-Google-Smtp-Source: APXvYqyh0X6GxkFdYz3p2ytoUR/9WSztyuB/fJohGxmi7p5m2J9MXjahus5+3o9BA0IZBgjP2wU2Sg==
X-Received: by 2002:a17:90a:2326:: with SMTP id f35mr23633482pje.134.1572708608092;
        Sat, 02 Nov 2019 08:30:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e59sm9843979pjk.28.2019.11.02.08.30.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2019 08:30:07 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
To:     "Tremblay, Eric" <etremblay@distech-controls.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <DM6PR01MB4844A7A2E7DCA9168D44F34195610@DM6PR01MB4844.prod.exchangelabs.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <32a41dac-9648-0d7f-afd9-79af0c3eed65@roeck-us.net>
Date:   Sat, 2 Nov 2019 08:30:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM6PR01MB4844A7A2E7DCA9168D44F34195610@DM6PR01MB4844.prod.exchangelabs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/29/19 8:04 AM, Tremblay, Eric wrote:
> dt-bindings: hwmon: Add TMP512/513
> 
> Add dt-binding for TMP512/513 sensor chips
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
I do get the following warnings:

Documentation/hwmon/tmp513.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
Documentation/hwmon/tmp513.rst: WARNING: document isn't included in any toctree

The .rst file needs to be added to Documentation/hwmon/index.rst. No idea what
the first problem is.

Guenter

> ---
>   .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 88 +++++++++++++++++++
>   1 file changed, 88 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> new file mode 100644
> index 000000000000..e5f3c72ff548
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2018 Linaro Ltd.
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/ti,tmp513.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMP513/512 system monitor sensor
> +
> +maintainers:
> +  - Eric Tremblay <etremblay@distech-controls.com>
> +
> +description: |
> +  The TMP512 (dual-channel) and TMP513 (triple-channel) are system monitors that include
> +  remote sensors, a local temperature sensor, and a high-side current shunt monitor.
> +  These system monitors have the capability of measuring remote temperatures,
> +  on-chip temperatures, and system voltage/power/current consumption.
> +
> +  Datasheets:
> +  http://www.ti.com/lit/gpn/tmp513
> +  http://www.ti.com/lit/gpn/tmp512
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tmp512
> +      - ti,tmp513
> +
> +  reg:
> +    maxItems: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description: |
> +      If 0, the calibration process will be skiped and the current and power
> +      measurement engine will not work. Temperature and voltage measurement
> +      will continue to work.
> +      The shunt value also need to respect : rshunt <= pga-gain * 40 * 1000 * 1000.
> +      If not, it's not possible to compute a valid calibration value.
> +    default: 1000
> +
> +  ti,pga-gain:
> +    description: |
> +      The gain value for the PGA function. This is 8, 4, 2 or 1.
> +      The PGA gain affect the shunt voltage range.
> +      The range will be equal to: pga-gain * 40mV
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]
> +    default: 8
> +
> +  ti,bus-voltage-range-volt:
> +    description: |
> +      This is the operating range of the bus voltage
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [16, 32]
> +    default: 32
> +
> +  ti,nfactor:
> +    description: |
> +      Array of three(TMP513) or two(TMP512) n-Factor value for each remote
> +      temperature channel.
> +      See datasheet Table 11 for n-Factor range list and value interpretation.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/uint8-array
> +      - minItems: 2
> +        maxItems: 3
> +        items:
> +          default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +        tmp513@5c {
> +            compatible = "ti,tmp513";
> +            reg = <0x5C>;
> +            shunt-resistor-micro-ohms = <330000>;
> +            ti,bus-voltage-range-volts = <32>;
> +            ti,pga-gain = <8>;
> +            ti,nfactor = [01 F3 00];
> +        };
> +    };
> 

