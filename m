Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7160CC17441
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 01:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ECBA21D7F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 01:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/g5clmT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKLBpO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Nov 2019 20:45:14 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37356 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfKLBpO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 20:45:14 -0500
Received: by mail-pf1-f196.google.com with SMTP id p24so12137525pfn.4;
        Mon, 11 Nov 2019 17:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Q1IDX7UPknLrgHeuiVp588K5CPt9mOKefQMmHNob6c=;
        b=f/g5clmTm2nQOrMTH2tmY9S1+p5/LZtmXAUbV+GHeJ1uzv0mnQWt2QgyoEzuaQVmzG
         P19G19nl2PRSrN5qYV4X0uHqzyOq80NQzcD1gdXeFxrrwtrboThRgd9mPLkcmDTQIpjl
         wYecEx2YSkEmdQfzvhpLX1VRrd2gPTBx8AMb7sHt+nttlLIuQbSFPKHfakITQzpiWAd4
         lotf1wr/WkO3HvWs8a/6h0oUef6A+mu2/AxRMqWnHLQdo7LuTqCTSatC5DPi6F+T05v7
         +HPP0cpiqW9Z9/WfPNqzVrQSzgNvo3lkf8uYCkf9eUT5pR5sYEXI5+TxEHQvWNIkJPk6
         y/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8Q1IDX7UPknLrgHeuiVp588K5CPt9mOKefQMmHNob6c=;
        b=faLxhJjCIiWQHH0BKGVKH0Xwz35QGBWXDE8T/RkwSoWFrWCfhH0NNTEiI0hFT65pfK
         A2yVs/FTTdi3Ac2pERPeTYjcv8VrcHWhajHh5k8Ln78E3JkP/VVHEu2/dZB5PsDZ+B04
         yc+frWEo9A4/Vce6TdEUhOtZElqING8c4JzYFe0pFWWrg7m9HuSMyC0YPSVzPSsNs8yl
         DxCw6cr422O7vpQP7NTn4MfNlX5pCw3yIQF2Ka669U56FkR3Krnum4FtfTftpZD/hfWs
         77vOQfslc0sEMULuSCX0iR+cardJOUoLjnMR2WX/PMzT0iAoItOUtLdwiEhgXDyijfH5
         rsXQ==
X-Gm-Message-State: APjAAAWa0jqZWpE+SOO3oSsvfK7RSPHGFQgaDsUe/cUMGyMUy7U/9U+8
        ivj8L356N/T32TXjfqkZ0VqaaQrt
X-Google-Smtp-Source: APXvYqzV37GF5zgt0qySWjES7juIpRjJDZeOaNODrEG1t9ezZA3ZPrkK9ULxwAD6oCDzTY1HEXYPWg==
X-Received: by 2002:a62:2bc1:: with SMTP id r184mr5960751pfr.88.1573523113263;
        Mon, 11 Nov 2019 17:45:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s202sm17007903pfs.24.2019.11.11.17.45.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 17:45:12 -0800 (PST)
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
To:     etremblay@distech-controls.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
References: <20191111203445.27130-1-etremblay@distech-controls.com>
 <20191111203445.27130-2-etremblay@distech-controls.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <88a90ad1-cb97-b425-5fea-6580e9d8657b@roeck-us.net>
Date:   Mon, 11 Nov 2019 17:45:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111203445.27130-2-etremblay@distech-controls.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/11/19 12:34 PM, etremblay@distech-controls.com wrote:
> From: Eric Tremblay <etremblay@distech-controls.com>
> 
> Document the TMP513/512 device devicetree bindings
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>   .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> new file mode 100644
> index 000000000000..de4ed3645e0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
> +  This driver implements support for Texas Instruments TMP512, and TMP513.

I think this needs some rewording. This is not a driver description, but
a system description.

> +  The TMP512 (dual-channel) and TMP513 (triple-channel) are system monitors
> +  that include remote sensors, a local temperature sensor, and a high-side
> +  current shunt monitor. These system monitors have the capability of measuring
> +  remote temperatures, on-chip temperatures, and system voltage/power/current
> +  consumption.
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
> +      will continue to work. The shunt value also need to respect:
> +      rshunt <= pga-gain * 40 * 1000 * 1000.
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
> +  ti,bus-range-microvolt:
> +    description: |
> +      This is the operating range of the bus voltage in microvolt
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [16000000, 32000000]
> +    default: 32000000
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
> +            ti,bus-range-microvolt = <32000000>;
> +            ti,pga-gain = <8>;
> +            ti,nfactor = [01 F3 00];
> +        };
> +    };
> 

