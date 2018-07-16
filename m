Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49311 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727374AbeGPDQE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Jul 2018 23:16:04 -0400
Message-Id: <1531709452.1037890.1441737864.7E216D02@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Rob Herring <robh@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, arnd@arnd.de, gregkh@linuxfoundation.org,
        avifishman70@gmail.com, yuenn@google.com,
        brendanhiggins@google.com, venture@google.com, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <20180711202107.GA29980@rob-hp-laptop>
Subject: Re: [PATCH v1 1/2] dt-binding: bmc: Add NPCM7xx LPC BPC documentation
Date: Mon, 16 Jul 2018 12:20:52 +0930
References: <20180704091427.409971-1-tmaimon77@gmail.com>
 <20180704091427.409971-2-tmaimon77@gmail.com>
 <20180711202107.GA29980@rob-hp-laptop>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 12 Jul 2018, at 05:51, Rob Herring wrote:
> On Wed, Jul 04, 2018 at 12:14:26PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM7xx BIOS Post Code (BPC).
> > The NPCM7xx BPC monitoring two configurable I/O addresses
> > written by the host on Low Pin Count (LPC) bus.
> > 
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    | 26 ++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> > new file mode 100644
> > index 000000000000..0832c9cbea32
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> > @@ -0,0 +1,26 @@
> > +Nuvoton NPCM7xx LPC BPC interface
> > +
> > +Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
> > +configurable I/O addresses written by the host on the
> > +Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.
> 
> s/capure/capture/
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

So uncovering a bit of a dirty secret here, we should probably consider this in the context of the ASPEED snoop function. A driver snuck into the misc tree without an associated bindings document:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/misc/aspeed-lpc-snoop.c

(it wasn't me, I'm happy to discuss my proposed bindings, please don't shoot the messenger :))

The devicetree node looks something like:

					lpc_snoop: lpc-snoop@0 {
						compatible = "aspeed,ast2500-lpc-snoop";
						reg = <0x0 0x80>;
						interrupts = <8>;
						status = "disabled";
					};

and also has a required "snoop-ports" property with at least one and up to two cells that describe the channels to snoop. Channel values are either 0 or 1. It's feasible that the double-word capture could also be supported as both supported channels have their data captured in different fields of the same register.

Do we go with what's already in the tree in supporting 'snoop-ports' or keep 'monitor-ports' as proposed by Tomer?

Andrew

> 
> 
> > +
> > +NPCM7xx BPC supports capture double words, when using capture
> > +double word only I/O address 1 is monitored.
> > +
> > +Required properties for lpc_bpc node
> > +- compatible	: "nuvoton,npcm750-lpc-bpc" for Poleg NPCM7XX.
> > +- reg 			: specifies physical base address and size of the registers.
> > +- interrupts	: contain the LPC BPC with flags for falling edge.
> > +- monitor-ports : contain monitor I/O addresses, at least one monitor I/O
> > +				  address required
> > +
> > +Optional property for lpc_bpc node
> > +- bpc-en-dwcapture : enable capture double words support.
> > +
> > +Example:
> > +	lpc_bpc: lpc-bpc@f0007040 {
> > +		compatible = "nuvoton,npcm7xx-lpc-bpc";
> > +		reg = <0xf0007040 0x14>;
> > +		monitor-ports = <0x80>;
> > +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > -- 
> > 2.14.1
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
