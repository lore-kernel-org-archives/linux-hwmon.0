Return-Path: <SRS0=ADoj=2I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3D9C2D0CD
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 02:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDADD206D8
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 02:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576637825;
	bh=e0LQF0690GEbbzak/OIhEet/HIbXA9Glfc3oGPIlvrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HSebHL6OrbHYBOnFdn9IZmOgDG+CqmjoEuhIgizHcknbKTNGXksbYOiur9TSewj9F
	 5Ny8B1qLnzoPptZeyLGHMovVn3pyMqP/4K/FyPBWbBuo9mgzWX39Hz55XTfyLYDn/F
	 r84tKFgg5khAmYDArQhKWr7dulD1EuWiLVE8Mu+I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfLRC5E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Dec 2019 21:57:04 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46948 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfLRC5E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Dec 2019 21:57:04 -0500
Received: by mail-ot1-f65.google.com with SMTP id c22so476586otj.13;
        Tue, 17 Dec 2019 18:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HnATBlbL+eZiW12mo0hwrch2CUsppmWX32lWHiTL+YQ=;
        b=Jgo1huTigPUR1AY/o/D0YacwMxw9gZ3Xjv7awgDj+C1WK3QqalQcyN89hZaeOuhwcG
         xYG2UBlu6FwAtxf9PKJYodGyVFKfebHLpkXXNV64eoumg/Av3gcq2DBc6Apdc3quSAfp
         dp38X0iYGS+b/7jUzDQkwHmFmEuKWKomdfF2msQnflJE75QVpxu6lHoiYm30hJeOYW0O
         c9XCQccYUmkDNEcdQma4WfI55doAYIgwQeLPi31PEYbQLp2kGb07TJz411065evzNR2P
         8jh2gZlxtVH5cbDh5gU5H/AgPgtrbYD48VxD60MOzH9bcMPvC7Qsqce0lvq4ogTb7rs3
         idlg==
X-Gm-Message-State: APjAAAX8wXm8nI2rOgxMJQFoDl98QjbPtv2tN/eKO6tStvZ3rbNpz57v
        IqqgKQs3UKNgHeX+iMrtqA==
X-Google-Smtp-Source: APXvYqyihxi8JukdWSv/sqB94AVfuF+A3sZ6QOp7w2twJ4p+CCqPcHedgqwNmZ40BJJHYASG2nIe0Q==
X-Received: by 2002:a05:6830:20c6:: with SMTP id z6mr43585otq.272.1576637823440;
        Tue, 17 Dec 2019 18:57:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z21sm288506oto.52.2019.12.17.18.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 18:57:02 -0800 (PST)
Date:   Tue, 17 Dec 2019 20:57:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Robin Murphy <robin.murphy@arm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v11 04/14] dt-bindings: Add bindings document of Aspeed
 PECI adapter
Message-ID: <20191218025702.GA18998@bogus>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-5-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211194624.2872-5-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 11, 2019 at 11:46:14AM -0800, Jae Hyun Yoo wrote:
> This commit adds bindings document of Aspeed PECI adapter for ASPEED
> AST24xx/25xx/26xx SoCs.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v10:
> - Changed documents format to DT schema format so I dropped all review tags.
>   Please review it again.
> 
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> new file mode 100644
> index 000000000000..0f5c2993fe9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed PECI Bus Device Tree Bindings
> +
> +maintainers:
> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-peci
> +      - aspeed,ast2500-peci
> +      - aspeed,ast2600-peci
> +
> +  reg:
> +    maxItems: 1
> +

> +  "#address-cells":
> +    # Required to define a client address.
> +    const: 1
> +
> +  "#size-cells":
> +    # Required to define a client address.
> +    const: 0

These 2 can be defined by the bus schema.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |

You can drop the '|' if there's no formatting to preserve.

> +      Clock source for PECI controller. Should reference the external
> +      oscillator clock.
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    # Operation frequency of PECI controller in units of Hz.
> +    minimum: 187500
> +    maximum: 24000000
> +
> +  msg-timing:
> +    description: |
> +      Message timing negotiation period. This value will determine the period
> +      of message timing negotiation to be issued by PECI controller. The unit
> +      of the programmed value is four times of PECI clock period.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 255
> +        default: 1
> +
> +  addr-timing:
> +    description: |
> +      Address timing negotiation period. This value will determine the period
> +      of address timing negotiation to be issued by PECI controller. The unit
> +      of the programmed value is four times of PECI clock period.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 255
> +        default: 1
> +
> +  rd-sampling-point:
> +    description: |
> +      Read sampling point selection. The whole period of a bit time will be
> +      divided into 16 time frames. This value will determine the time frame
> +      in which the controller will sample PECI signal for data read back.
> +      Usually in the middle of a bit time is the best.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 15
> +        default: 8
> +
> +  cmd-timeout-ms:
> +    # Command timeout in units of ms.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 1
> +        maximum: 60000
> +        default: 1000
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - interrupts
> +  - clocks
> +  - resets
> +  - clock-frequency
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    peci: bus@1e78b000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x1e78b000 0x60>;

You can drop this node in the examples.

> +
> +        peci0: peci-bus@0 {
> +            compatible = "aspeed,ast2600-peci";
> +            reg = <0x0 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
> +            resets = <&syscon ASPEED_RESET_PECI>;
> +            clock-frequency = <24000000>;
> +            msg-timing = <1>;
> +            addr-timing = <1>;
> +            rd-sampling-point = <8>;
> +            cmd-timeout-ms = <1000>;
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
