Return-Path: <SRS0=U1Yy=YE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F14ECE58C
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Oct 2019 16:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 171C421835
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Oct 2019 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570813147;
	bh=jVgbxAZJrS+JPzoO/ClfSlmT35NN5u9cSU2wOKs8WvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BTZ8kcNSfEP+1oukf9adc2QB7C4cMWSNCwDOxkt7HOxumtw2bqmBX0RILCJVz6bLt
	 eyii8IjZPDxy4oN+2ZwlzoilOZOo2D+HuJKON/VnWxJ3/k8ZMoKCqjP40Ugs5e6i4E
	 IDetK8ZEKU62dtXRS0WUcIx7FUtqhSakwWU77ZD8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbfJKQ7G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Oct 2019 12:59:06 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36602 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbfJKQ7G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Oct 2019 12:59:06 -0400
Received: by mail-oi1-f196.google.com with SMTP id k20so8589164oih.3;
        Fri, 11 Oct 2019 09:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=JhGLrgWEkIZakc7z6mle4kNOTxNYBaoXX/BZslqttWk=;
        b=aojDdPASNz95kegtJHyvmfEcCgEPv27qrFEl++bZAmxG9SG3Y+aj5SwVKj7t8bnKCo
         w96oFPK7h94bH5qSQy9YWbXvhGH671jpGH7BB+ZfCspcLkOoO7Rh/rcAYHy0b3EWXczj
         0G6xWEKVY51lrwDZTkrEvgoB7qzI/Fj1hLrSLHP41xBj6hng4dDellswOylD1IQzTg4r
         cw6t/a6T3TtuyPPbjxBp5GizMz79da1n0NjNGR1ayshPy0Sb7YnUKMgk8gygnRPILEn1
         2cQUXBDS8KwjHQljZFp7GLmQ1fiHLZANYXCA3DlbAW8oT2WeYAQQyUm3vWHXC5nlOXeW
         +Nzg==
X-Gm-Message-State: APjAAAXXaqL+P7C0cLoDcP5UiPiwWNGpf23k3vScmJRAIQ1GD1we3ehx
        FIlElzwMIchhndCPVK+C6nDC4Es=
X-Google-Smtp-Source: APXvYqwxcjSJi9AwqWEM2jNGmHb3KGiPT1EzGP91cj4AzMBS/YxflJoHUJTZKCDBYH/6CNQLXRdk4A==
X-Received: by 2002:aca:1b10:: with SMTP id b16mr13608317oib.110.1570813144498;
        Fri, 11 Oct 2019 09:59:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 100sm2809407otl.48.2019.10.11.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 09:59:03 -0700 (PDT)
Date:   Fri, 11 Oct 2019 11:59:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add AXI FAN Control
 documentation
Message-ID: <20191011165903.GA4337@bogus>
References: <20191009102806.262241-1-nuno.sa@analog.com>
 <20191009102806.262241-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191009102806.262241-2-nuno.sa@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 09, 2019 at 12:28:06PM +0200, Nuno Sá wrote:
> Document the AXI FAN Control IP core devicetree bindings.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
> Changes in v2:
>  * Set the correct license for new bindings;
>  * Fix wrong compatible in the example;
>  * Wrap long line;
>  * Update adi,pulses-per-revolution with accepted values.
> 
>  .../bindings/hwmon/adi,axi-fan-control.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
> new file mode 100644
> index 000000000000..dc82b9748c9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2019 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/hwmon/adi,axi-fan-control.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AXI FAN Control Device Tree Bindings
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |+
> +  Bindings for the Analog Devices AXI FAN Control driver. Spefications of the
> +  core can be found in:
> +
> +  https://wiki.analog.com/resources/fpga/docs/axi_fan_control
> +
> +properties:
> +  compatible:
> +    enum:
> +        - adi,axi-fan-control-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  adi,pulses-per-revolution:

We already have 'pulses-per-revolution' in pwm-fan binding, so use that.

With that changed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    description:
> +      Value specifying the number of pulses per revolution of the controlled
> +      FAN.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - adi,pulses-per-revolution
> +
> +examples:
> +  - |
> +    fpga_axi: fpga-axi@0 {
> +            #address-cells = <0x2>;
> +            #size-cells = <0x1>;
> +
> +            axi_fan_control: axi-fan-control@80000000 {
> +                    compatible = "adi,axi-fan-control-1.00.a";
> +                    reg = <0x0 0x80000000 0x10000>;
> +                    clocks = <&clk 71>;
> +                    interrupts = <0 110 0>;
> +                    adi,pulses-per-revolution = <2>;
> +            };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index caa80ae1925e..74ddcb3e1fd9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2879,6 +2879,7 @@ W:	http://ez.analog.com/community/linux-device-drivers
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	drivers/hwmon/axi-fan-control.c
> +F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
>  
>  AXXIA I2C CONTROLLER
>  M:	Krzysztof Adamski <krzysztof.adamski@nokia.com>
> -- 
> 2.23.0
> 
