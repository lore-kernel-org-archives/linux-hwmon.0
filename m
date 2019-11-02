Return-Path: <SRS0=XbFJ=Y2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5504ECA9EC7
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Nov 2019 15:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D22021855
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Nov 2019 15:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdoGrgl4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKBPPk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Nov 2019 11:15:40 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36074 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKBPPk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Nov 2019 11:15:40 -0400
Received: by mail-pf1-f193.google.com with SMTP id v19so9014215pfm.3;
        Sat, 02 Nov 2019 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qAvZBK6DZqUp9iHt6R3a29zC4mhIYuBP32xhiYLg1b8=;
        b=WdoGrgl4QaxUrDwn1jlCwQc6eRKP+oDnmFXfcdeWb8qLYSr5+fJ9+klORmXH13D/r/
         VtaA/lHL2lvw+c01lsfeXlJQIAAlV9eoOiszPo55FdK/vOlkRrH79yr2MrceE1kpZMrc
         Pc4oSJKFqVhZ3WVZSx1rkAD8kVqB0z5xB8IUANQplSQq8Ax1bCW9RNqQoNbkevSC7tlg
         emW9R3k0lMulYzio7NSwBjCNz2Iry9JsYakRQ4piIDK67XBsd2c2YiOJZ8B6z+yr/FHJ
         V88/zrUYsqKkDG2ZP5B9Dki01BWa7d59ud+lmZGWLG1qi7Hsp675MC+6yiZkkuuAwwc1
         330g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qAvZBK6DZqUp9iHt6R3a29zC4mhIYuBP32xhiYLg1b8=;
        b=JozK5H0mcGMgGt8mfbHKaaK/nANHjCIVQaSroGOfdLO9nT44yf0ssyb3Q3VphaZk++
         YWg/p3XRzkQuTFPKLqu+kMSsO4ELJsbMsMyunvC4llAWg+upWXdZDyEp/uosKpjpfZIm
         gXTLGalJ6PN8WmHzxpBLjA5NM/E9Fc9zK9sgyDryo+TGtK1xOzSUksgqxBlN89WIrAhG
         kAPEYgfmgVVKs0QLeEN97Alz+wHBQm1SbInJ1AH8zNUeQa7Qa414VixP/XctelhBaNJ+
         1rBEY7ZTkw/VhSC0BPY2zIqs/ENNNu/8dm19o8tUH/rKXr2EaYF/X8idgDxo3vWdO0K8
         v7hQ==
X-Gm-Message-State: APjAAAUDpZ+GcbWqnAN/14i8Lr9SgknRJfPQNOSTW2AWgPKKLMT3/qqT
        5m8gXAZIUuEE5ZMwYGKNCXo=
X-Google-Smtp-Source: APXvYqxNSyl6X9QQi0QbkV1G0AHqIxam5bFBI8K9G7zWwZcfgVL/LNqmX341rL1Cm3/rzhYDltaF3g==
X-Received: by 2002:a17:90a:bb82:: with SMTP id v2mr1432453pjr.90.1572707739226;
        Sat, 02 Nov 2019 08:15:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9sm15545305pfb.114.2019.11.02.08.15.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2019 08:15:38 -0700 (PDT)
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
Message-ID: <1c265dad-d6c5-aba3-3344-58893b6d13f2@roeck-us.net>
Date:   Sat, 2 Nov 2019 08:15:37 -0700
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

The two patches LGTM. Waiting for Reviewed-by: tag from DT maintainer.

Thanks,
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

