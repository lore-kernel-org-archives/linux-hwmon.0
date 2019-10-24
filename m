Return-Path: <SRS0=QYPh=YR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29D0CA9EAF
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Oct 2019 22:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94A7A21929
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Oct 2019 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571957989;
	bh=0hiuQZAUFn4VHc/cNvUFNzNRxS6jtcV0TPVqyUSB2Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1+4jyM3N/3Hd2s5pe5ELttbz+riqOUo+9df8rij5oNWSxaZZ5WSVAgpbIkkjh0YRI
	 1CDIvlUWCogjL7u+0oEblzF9m/DEYjy82ohm8uRiLrBYuMaHO/meqZHfgNVlM07mI0
	 RTUv/GKJwLXN0sGXjbCXGUPVz7qgveAsALIBqHro=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733181AbfJXW7t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Oct 2019 18:59:49 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43146 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733082AbfJXW7t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Oct 2019 18:59:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id z20so466407otk.10;
        Thu, 24 Oct 2019 15:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d5ia/RcICxC7N5c5fy67LHI4iPE4qUQXFzRMnfVjTUg=;
        b=bmvFHiHIdp0/p0xigKpHH0hhuVXkmVFX577m/Bm1pZSpNoMyH/U+0R20PgW/PE00Z5
         sC5OxmHlBvyXVKywqyf1LAKVHFA8e8VmdXQlS30G6Tou12YW+VG8Ts14pICKRt0Ebm3U
         VzFNeNxZTzUP51JF13tAUh1WDDhZeSydLJVFUx2nIoVUmeRtq/C8kt+KbcwtR+q5RV2p
         A5SCz1G4ecWWnXF7BpBFKj2O6TF64uCq+1X30iElGF1EWUkuVmzsGDl0WHpYFmsaIIUn
         fHdH38lhK2C+E9eOwLJUvPdUFirGcLyIfqYyGEXvOqnj8CiEsocl3zT4nS7/XekP4TFb
         9crA==
X-Gm-Message-State: APjAAAUXabeWqUEFsWsu69cFwhMeFfExvpu0nkHOL22Pcv3DNHf3nqbp
        Omccf45AWonVZOv2iyoY6JmVdQM=
X-Google-Smtp-Source: APXvYqyjwTqyJASuv9HlkgyIg+QbuTTUHc9AGq1e6ShZK2MI1MfBNScBpcyyvMB5zZDdKo5ZIGqAXA==
X-Received: by 2002:a9d:5605:: with SMTP id e5mr253762oti.150.1571957988235;
        Thu, 24 Oct 2019 15:59:48 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l4sm37067oia.51.2019.10.24.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 15:59:47 -0700 (PDT)
Date:   Thu, 24 Oct 2019 17:59:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191024225947.GA16810@bogus>
References: <BL0PR01MB483512FB70F44FE36766981F95680@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB483512FB70F44FE36766981F95680@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 22, 2019 at 01:33:19PM +0000, Tremblay, Eric wrote:
> dt-bindings: hwmon: Add TMP512/513
> 
> Add dt-binding for TMP512/513 sensor chips
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> new file mode 100644
> index 000000000000..33d880b2a887
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2018 Linaro Ltd.
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/tmp513.yaml#
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
> +    - enum:
> +      - ti,tmp512
> +      - ti,tmp513
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,shunt-resistor-micro-ohms:

We have a standard property for this.

> +    description: |
> +      The shunt resistor value in uOhm. If 0, the calibration process
> +      will be skiped and the current and power measurement engine will not work.
> +      Temperature and voltage measurement will continue to work. The shunt value also
> +      need to respect : rshunt <= pga-gain * 40 * 1000 * 1000. If not, it's not possible
> +      to compute a valid calibration value.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

Not necessary when standard units are used.

> +    default: 1000
> +
> +  ti,pga-gain:
> +    description: |
> +      The gain value for the PGA function. This is 8, 4, 2 or 1.
> +      The PGA gain affect the shunt voltage range.
> +      The range will be equal to: pga-gain * 40mV
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 2, 4, 8]
> +    default: 8

Should be under the enum (i.e. 4 more spaces).

Or the enum can be at this level.

> +
> +  ti,bus-voltage-range-volt:
> +    description: |
> +      This is the operating range of the bus voltage
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [16, 32]

Is this 16V or 32V?

> +    default: 32

Under the 'enum'...

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
> +    &i2c0 {
> +        tmp513@5c {
> +            compatible = "ti,tmp513";
> +            reg = <0x5C>;
> +            ti,shunt-resistor-micro-ohms = <330000>;
> +            ti,bus-voltage-range-volts = <32>;
> +            ti,pga-gain = <8>;
> +            ti,nfactor = [01 F3 00];
> +        };
> +    }
> -- 
> 2.17.1
> 
