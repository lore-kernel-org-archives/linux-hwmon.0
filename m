Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:34960 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932548AbeGDJPF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jul 2018 05:15:05 -0400
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arnd.de,
        gregkh@linuxfoundation.org, avifishman70@gmail.com,
        yuenn@google.com, brendanhiggins@google.com, venture@google.com,
        joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] misc: Add NPCM7xx LPC BPC driver support
Date: Wed,  4 Jul 2018 12:14:25 +0300
Message-Id: <20180704091427.409971-1-tmaimon77@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch set adds BIOS Post code (BPC) support for the
Nuvoton NPCM7xx Baseboard Management Controller (BMC).

Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
configurable I/O addresses written by the host on the
Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.

NPCM7xx BPC can support capture double words.

I have created new folder (bmc) in the documentation/devicetree/binding
for BMC miscellaneous modules that are not represented in the
binding folder.

The NPCM7xx BPC driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: bmc: Add NPCM7xx LPC BPC documentation
  misc: npcm7xx: add NPCM7xx LPC BPC driver

 .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    |  26 ++
 drivers/misc/Kconfig                               |   8 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/npcm7xx-lpc-bpc.c                     | 348 +++++++++++++++++++++
 4 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
 create mode 100644 drivers/misc/npcm7xx-lpc-bpc.c

-- 
2.14.1

