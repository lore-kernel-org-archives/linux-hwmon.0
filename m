Return-Path: <SRS0=JtC8=YN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DD6CA9EAD
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3F53222BD
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Oct 2019 16:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU5tY7lG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfJTQM6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Oct 2019 12:12:58 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33511 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfJTQM6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Oct 2019 12:12:58 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so5331806pls.0;
        Sun, 20 Oct 2019 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=G7GH/Fr1VtW0x9oefdslfAtstSVZemrJEPTpx5QT2SE=;
        b=DU5tY7lGN0k+TixjDriSStSiSq+AMtilJLZw5nlT8sLuOANzsV5P1x11NMk7+kEtVl
         OCudTPAcRLKdpSA9BJ8D4RsqFOcpGxFtkzbSfmfdWzAbgxdi9Zeb9Fzzbd+c1TwJlZyt
         AXHPCwVjyfAcIF5/1kFoA8M7QFYkLDPW/MEVX29G3BcCWPxLjCzTDZnuUqsomFUTe8qt
         zPpzgQQlmzc6aEq7CgPtyEBL+iQOufVSFGeQE6Gj/WWGrKv5zrSY+GT5g/JaNMhNJfas
         wzd/Viuu++Ug5u1ElrqwRjKiMmBqjUBtddo2LDBq4K6qKgOWb/l4C6NSxJ+uks9zg4MG
         ujyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=G7GH/Fr1VtW0x9oefdslfAtstSVZemrJEPTpx5QT2SE=;
        b=oTZYKPeTcbGbfm6OiSyPq8Nw22P6n8dGYEp/0D7Ko/LZGQrW0ejyQVR88UDzxJHQWt
         zSJOIsBy0NSURWyZnfSyIfljoPcj+d7DHv8xr0nAMLZ4eHZmIFQQwOMM/brXvOIjVPkm
         M0IUSB1wKi1LLV1PMG1VO4Da58XwPuUsJwf1x2feUmjoaekcQeeeP3Emb1LFwczYEf9H
         Kcv/uD6Y9Z4aDfJkiawSR2+Ja33TxuM5eCw5hSpidUmvE2CnroL4aHi68Bh8JmYYCkpd
         pk8CBlHzIKB+vv88RMXYRkUH1PqEZGiREmmxvzLdHhRns8Yr3OGXVUbL7TBm7egrQP+c
         oq2g==
X-Gm-Message-State: APjAAAU3BbpYQQm5zC7OdwHn23wE7qgk64YzL1MBVkSay75juYyVcWMt
        YuoZ0WPR7VsyrEDy7SnqqqXbU1OF
X-Google-Smtp-Source: APXvYqzSrWaij0BFfj0yJVXTjDQemWChTSnQ8QH1PwvTUcUCgZEMn7Yw4JVeqT21XGY7Vv6Y1HFjMQ==
X-Received: by 2002:a17:902:8c98:: with SMTP id t24mr20031443plo.334.1571587977628;
        Sun, 20 Oct 2019 09:12:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a20sm10032167pjs.30.2019.10.20.09.12.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 09:12:57 -0700 (PDT)
Date:   Sun, 20 Oct 2019 09:12:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add AXI FAN Control
 documentation
Message-ID: <20191020161256.GA27823@roeck-us.net>
References: <20191009102806.262241-1-nuno.sa@analog.com>
 <20191009102806.262241-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191009102806.262241-2-nuno.sa@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 09, 2019 at 12:28:06PM +0200, Nuno Sá wrote:
> Document the AXI FAN Control IP core devicetree bindings.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

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
