Return-Path: <SRS0=5TON=Y4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C265BCA9EC9
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Nov 2019 21:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 923D720848
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Nov 2019 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572903936;
	bh=n1+r0MfkZBi9FsyNFE3/zaoEdvV85ZlEwWRDkStDTVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=P92R8JtDDXL49TZbl+fFHPcFdBzlSDO2kFYSwz6HaqoRp3ScVIjxjmERHdfre6VDI
	 U9zYcixMRBz2J/ZcJ6+Hs1OQYgFCBaju6eCPQBJyL5LyxnTeDV6qo1l/jndYHCJg95
	 Q74ouAy2SD+tAks8BIZ3ysLImH8rIZOCAH7u30CM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbfKDVpg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Nov 2019 16:45:36 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46877 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbfKDVpg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Nov 2019 16:45:36 -0500
Received: by mail-oi1-f196.google.com with SMTP id b19so6309698oib.13;
        Mon, 04 Nov 2019 13:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k3kVTa8vuar985g0sliaKOlVYTBSRVAYg3es2b2zUE0=;
        b=d9pNPH3a6h+suMfuQrAnLlOcwGaK4GASooQjdrguzAy4YjbZw+3zEDGDhe0hYgH9xb
         902v0VB241F1CkL2Wq5yb83rs8O4SV7N25gziYq5x7XY+N7n42rfmLCwGS1acjfyr4Z0
         GPJ3yMYP02M+qIvlE84zZUgWYIT8HrcIr3qla1GHvtLGue1VXrY7tDM4hkSSQ7jbZdh3
         WzRg4m226SpPhC1a9oAQCNetSDyyAX/n0+PSnVG+Hs5s18cejtD4RamyGA/lozIy4MP1
         KOeDR2/pmCJlZU6xxLSfCZjdcHicSpwmPbjFMUlBay8jdI2erP3y2i4VBdylVvx6zxhq
         SQJQ==
X-Gm-Message-State: APjAAAUYTr3OPwqyFGQYiSBbXi4WWhqo6vZ9QRXFNpwHm8agaHXvEdjQ
        UzlrHt5ORAnDZk4B6z/oIRHiW9c=
X-Google-Smtp-Source: APXvYqzcMSy4NfS/jdB6V7MhIEClzjRYDLfoJB6r2eHL1uzQtWKE5CiY5mwirVDJJAN/atsq5v5TyQ==
X-Received: by 2002:aca:f141:: with SMTP id p62mr968251oih.3.1572903934856;
        Mon, 04 Nov 2019 13:45:34 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c7sm5370133otr.32.2019.11.04.13.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:45:34 -0800 (PST)
Date:   Mon, 4 Nov 2019 15:45:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v6 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191104214533.GA9343@bogus>
References: <DM6PR01MB4844A7A2E7DCA9168D44F34195610@DM6PR01MB4844.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR01MB4844A7A2E7DCA9168D44F34195610@DM6PR01MB4844.prod.exchangelabs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 29, 2019 at 03:04:31PM +0000, Tremblay, Eric wrote:
> dt-bindings: hwmon: Add TMP512/513

Did you mean for this to be the subject. Otherwise you've got the same 
subject for both patches.

> 
> Add dt-binding for TMP512/513 sensor chips
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> new file mode 100644
> index 000000000000..e5f3c72ff548
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2018 Linaro Ltd.

Really? 

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

Wrap lines at <80 chars.

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

If this is in volts then it needs '-volt' defined in property-units.txt 
or just use microvolt. My preference is the latter as you have enough 
range.

Also, 'voltage' is kind of redundant if with the units.

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
> -- 
> 2.17.1
> 
