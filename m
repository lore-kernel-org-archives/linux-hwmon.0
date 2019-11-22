Return-Path: <SRS0=jE+A=ZO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADCBC432C0
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Nov 2019 05:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 372F120707
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Nov 2019 05:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwM92wfC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfKVF1J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Nov 2019 00:27:09 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41051 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVF1J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Nov 2019 00:27:09 -0500
Received: by mail-pf1-f194.google.com with SMTP id p26so2914049pfq.8;
        Thu, 21 Nov 2019 21:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ng+pSGgG5AZ0E7r71mRkN5pqcWAjBVIoAMBtQbN/oL8=;
        b=CwM92wfC8hXbxxv9lcz1TKyE9gkr6pv4XjBGwR4KL9ZBbY+F1GC1rRvKRS2K4Bbq+d
         R7aaugL4yXJlDk5t8HdsYOLQq6VJUEGCJmbrs0K+wmiLvQsxJITjBsTnfqnXJZ09lqZ/
         AQEHFtesLSRi25upU+0g2CC2MjEEH7M7InI6nPvO2ef+9JgVtIULS3ouplUjkQzAw8Yl
         GY8wluNCcGdQJLq1LqnbaIcC0z6b2emChATPhlv1k/Y8i/Wceigp90x9f291M7YBgCYi
         162i2dZsD5d2kWBqXAnwaCeCBjfWMxfPvPB3qW4OQH5DNXV1aO5nOFDR+fNTBZSLYUqy
         yGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ng+pSGgG5AZ0E7r71mRkN5pqcWAjBVIoAMBtQbN/oL8=;
        b=Y+TSa1pnf9WuTPhS8rAL7fdMmP6i29yGGLNgENTaJurzwqadIBXbUIVgZ/M5Aafral
         8vPNl/TxAMDXxzjV5x0o7C/UAeo0012EOdlHldncaOb47am+LLshhbROpbb0q8wyP256
         pvibA5zjVZDIEOnQRjObhA5r2kzfhbKz5nsDuhB4ijf5LLCKAJkRaY72gvwlyOnMsKkW
         RO2ibeQKGhYcfbBqpZ87qQ/YL0UGian4ALYcdnjtgA1dnou6GaFYvPAQfk7zpx3OX20u
         /6ES9NVDtvk0LarP7k40njEKmLgzGadBdMRPMzh5hfSo1f2ulML9XKzw0U25bI72i/11
         0ClQ==
X-Gm-Message-State: APjAAAXvFscIaIMMm2RUwpDeQHFqwiPF3NhGoZsXr34VYu7a8rsxu0rk
        vPorQPT1/d68/lvriF5HS3I=
X-Google-Smtp-Source: APXvYqzbtB+r9K+tg7COyI/QtTZhEKrOxYCf0LkwRQrGZraf6mOSos3H2LZghXeg6d71jowhCPnULA==
X-Received: by 2002:aa7:9f86:: with SMTP id z6mr15590299pfr.102.1574400428774;
        Thu, 21 Nov 2019 21:27:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v14sm5421346pfe.94.2019.11.21.21.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 21:27:07 -0800 (PST)
Date:   Thu, 21 Nov 2019 21:27:06 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eric Tremblay <etremblay@distech-controls.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        mark.rutland@arm.com, corbet@lwn.net
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: Add TMP512/513
Message-ID: <20191122052706.GA21663@roeck-us.net>
References: <20191112223001.20844-1-etremblay@distech-controls.com>
 <20191112223001.20844-2-etremblay@distech-controls.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112223001.20844-2-etremblay@distech-controls.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 12, 2019 at 05:30:00PM -0500, Eric Tremblay wrote:
> Document the TMP513/512 device devicetree bindings
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> new file mode 100644
> index 000000000000..168235ad5d81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> @@ -0,0 +1,93 @@
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
> +      - $ref: /schemas/types.yaml#definitions/uint32-array
> +      - minItems: 2
> +        maxItems: 3
> +        items:
> +          default: 0x00
> +          minimum: 0x00
> +          maximum: 0xFF
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          tmp513@5c {
> +              compatible = "ti,tmp513";
> +              reg = <0x5C>;
> +              shunt-resistor-micro-ohms = <330000>;
> +              ti,bus-range-microvolt = <32000000>;
> +              ti,pga-gain = <8>;
> +              ti,nfactor = <0x1 0xF3 0x00>;
> +          };
> +    };
