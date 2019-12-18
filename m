Return-Path: <SRS0=ADoj=2I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6E7C43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 14:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 016732176D
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576680130;
	bh=XAHtcB/xfSIUB2s3mlEQp7fM2NwWkhZ3oMuOgtCrr0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JIwGgg2h/2z1ZKDB69PC8yaO3GPj5A8NeKhPcGe1I4Qa1hXq9LReh8zX73apGsZbA
	 E1MMb4d3ymZcaE8CQ7B98I098hqnMmWpWJm8mM1E6X3n6ajyarwJdauGYSb8Bij/Zt
	 HdhJYSggGTG3wIeJ94x3HYjJ0rnIbuLZssJnzL2Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLROmJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 09:42:09 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37707 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfLROmJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 09:42:09 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so2771419otn.4;
        Wed, 18 Dec 2019 06:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gwW7OiM+WjSZ4UZ1VJQamoPYCMV0Usyl4Dcq40hWMN4=;
        b=Pe1ZcEUeuvNgRAlA/WFlAfSd99u7ucXPQwlHvGdsGoawzUtX7SIJ/ejhnlJcSXniNP
         TKhigv8eWzFRjm8QzKhsQEVGICW/N5MO6tj45Rg5EpIoA2oJLCM0SsR6BE9CVr2l4HWP
         4CFTr8y/jG2sC5q03tMFMZu3bwzUImIbSxH7EtQbexVBwBFGCB/BYUHAzljsqsB7/twP
         eECNnbTOdtfBkj+w7/xU/6AhUihbtMivaM0lbVLVQnkeWbuFpwFpNFcTm1XDwF+tRY96
         ABIR3C7oVr8/a3XMzh+cckh6S1plnLSNWAQCCLTXWZ9LQcRYpvqUBhNqkpXob/T4ewaz
         2IJA==
X-Gm-Message-State: APjAAAUtRdckG0pjaFDeR0o5bX0qmnExiGJYKO7tK8hrQrthEraZ6ZOJ
        WoInZUrj4sTyPyKfzcmLTQ==
X-Google-Smtp-Source: APXvYqwp0BEH7qea/GKGyW/LOejvqTbdWK+z/qoZkQL0jYWPDg6Ufh1KKYai1of0WRYU42rRzsqYxQ==
X-Received: by 2002:a05:6830:1d59:: with SMTP id p25mr3090159oth.308.1576680128293;
        Wed, 18 Dec 2019 06:42:08 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u18sm846613otq.26.2019.12.18.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:42:07 -0800 (PST)
Date:   Wed, 18 Dec 2019 08:42:06 -0600
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
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v11 07/14] dt-bindings: peci: add NPCM PECI documentation
Message-ID: <20191218144206.GA26118@bogus>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-8-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211194624.2872-8-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 11, 2019 at 11:46:17AM -0800, Jae Hyun Yoo wrote:
> From: Tomer Maimon <tmaimon77@gmail.com>
> 
> Added device tree binding documentation for Nuvoton BMC
> NPCM Platform Environment Control Interface(PECI).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v10:
> - Newly added in v11.
> 
>  .../devicetree/bindings/peci/peci-npcm.yaml   | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.yaml b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
> new file mode 100644
> index 000000000000..bcd5626e68e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-npcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM PECI Bus Device Tree Bindings
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: nuvoton,npcm750-peci # for the NPCM7XX BMC.
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
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    # PECI reference clock.
> +    maxItems: 1
> +
> +  cmd-timeout-ms:
> +    # Command timeout in units of ms.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

You can drop this as standard units already have a type.

> +      - minimum: 1
> +        maximum: 60000
> +        default: 1000
> +
> +  pull-down:
> +    description: |
> +      Defines the PECI I/O internal pull down operation.
> +        0: pull down always enable
> +        1: pull down only during transactions.
> +        2: pull down always disable.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 2
> +        default: 0
> +
> +  host-neg-bit-rate:
> +    description: |
> +      Define host negotiation bit rate divider.
> +      the host negotiation bit rate calculate with formula:
> +      clock frequency[Hz] / [4 x {host-neg-bit-rate + 1}]
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 7
> +        maximum: 31
> +        default: 15
> +
> +  high-volt-range:
> +    description: |
> +      Adapts PECI I/O interface to voltage range.
> +        0: PECI I/O interface voltage range of 0.8-1.06V (default)
> +        1: PECI I/O interface voltage range of 0.95-1.26V
> +    type: boolean

These last 4 properties are vendor specific or PECI common. For the 
former, needs a vendor prefix. For the latter, needs to be moved to 
common location.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    peci: bus@100000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x100000 0x200>;
> +
> +        peci0: peci-bus@0 {
> +            compatible = "nuvoton,npcm750-peci";
> +            reg = <0x0 0x200>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clk NPCM7XX_CLK_APB3>;
> +            cmd-timeout-ms = <1000>;
> +            pull-down = <0>;
> +            host-neg-bit-rate = <15>;
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
