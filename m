Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:34963 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932479AbeGDJPI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jul 2018 05:15:08 -0400
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arnd.de,
        gregkh@linuxfoundation.org, avifishman70@gmail.com,
        yuenn@google.com, brendanhiggins@google.com, venture@google.com,
        joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] dt-binding: bmc: Add NPCM7xx LPC BPC documentation
Date: Wed,  4 Jul 2018 12:14:26 +0300
Message-Id: <20180704091427.409971-2-tmaimon77@gmail.com>
In-Reply-To: <20180704091427.409971-1-tmaimon77@gmail.com>
References: <20180704091427.409971-1-tmaimon77@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Added device tree binding documentation for Nuvoton BMC
NPCM7xx BIOS Post Code (BPC).
The NPCM7xx BPC monitoring two configurable I/O addresses
written by the host on Low Pin Count (LPC) bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
new file mode 100644
index 000000000000..0832c9cbea32
--- /dev/null
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
@@ -0,0 +1,26 @@
+Nuvoton NPCM7xx LPC BPC interface
+
+Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
+configurable I/O addresses written by the host on the
+Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.
+
+NPCM7xx BPC supports capture double words, when using capture
+double word only I/O address 1 is monitored.
+
+Required properties for lpc_bpc node
+- compatible	: "nuvoton,npcm750-lpc-bpc" for Poleg NPCM7XX.
+- reg 			: specifies physical base address and size of the registers.
+- interrupts	: contain the LPC BPC with flags for falling edge.
+- monitor-ports : contain monitor I/O addresses, at least one monitor I/O
+				  address required
+
+Optional property for lpc_bpc node
+- bpc-en-dwcapture : enable capture double words support.
+
+Example:
+	lpc_bpc: lpc-bpc@f0007040 {
+		compatible = "nuvoton,npcm7xx-lpc-bpc";
+		reg = <0xf0007040 0x14>;
+		monitor-ports = <0x80>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.14.1

