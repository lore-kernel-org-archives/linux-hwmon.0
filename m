Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36532 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732855AbeGKU1J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 16:27:09 -0400
Date: Wed, 11 Jul 2018 14:21:07 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, arnd@arnd.de, gregkh@linuxfoundation.org,
        avifishman70@gmail.com, yuenn@google.com,
        brendanhiggins@google.com, venture@google.com, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 1/2] dt-binding: bmc: Add NPCM7xx LPC BPC documentation
Message-ID: <20180711202107.GA29980@rob-hp-laptop>
References: <20180704091427.409971-1-tmaimon77@gmail.com>
 <20180704091427.409971-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180704091427.409971-2-tmaimon77@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 04, 2018 at 12:14:26PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM7xx BIOS Post Code (BPC).
> The NPCM7xx BPC monitoring two configurable I/O addresses
> written by the host on Low Pin Count (LPC) bus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> new file mode 100644
> index 000000000000..0832c9cbea32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> @@ -0,0 +1,26 @@
> +Nuvoton NPCM7xx LPC BPC interface
> +
> +Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
> +configurable I/O addresses written by the host on the
> +Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.

s/capure/capture/

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>


> +
> +NPCM7xx BPC supports capture double words, when using capture
> +double word only I/O address 1 is monitored.
> +
> +Required properties for lpc_bpc node
> +- compatible	: "nuvoton,npcm750-lpc-bpc" for Poleg NPCM7XX.
> +- reg 			: specifies physical base address and size of the registers.
> +- interrupts	: contain the LPC BPC with flags for falling edge.
> +- monitor-ports : contain monitor I/O addresses, at least one monitor I/O
> +				  address required
> +
> +Optional property for lpc_bpc node
> +- bpc-en-dwcapture : enable capture double words support.
> +
> +Example:
> +	lpc_bpc: lpc-bpc@f0007040 {
> +		compatible = "nuvoton,npcm7xx-lpc-bpc";
> +		reg = <0xf0007040 0x14>;
> +		monitor-ports = <0x80>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> -- 
> 2.14.1
> 
