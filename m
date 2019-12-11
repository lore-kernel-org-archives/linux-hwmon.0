Return-Path: <SRS0=nqTs=2B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8932FC3F68F
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 19:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54D462467D
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 19:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfLKTqj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Dec 2019 14:46:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:17648 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728005AbfLKTqj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 14:46:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 11:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; 
   d="scan'208";a="216033844"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com) ([10.7.153.143])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:38 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Tomer Maimon <tmaimon77@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v11 07/14] dt-bindings: peci: add NPCM PECI documentation
Date:   Wed, 11 Dec 2019 11:46:17 -0800
Message-Id: <20191211194624.2872-8-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Tomer Maimon <tmaimon77@gmail.com>

Added device tree binding documentation for Nuvoton BMC
NPCM Platform Environment Control Interface(PECI).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v10:
- Newly added in v11.

 .../devicetree/bindings/peci/peci-npcm.yaml   | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.yaml b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
new file mode 100644
index 000000000000..bcd5626e68e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-npcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM PECI Bus Device Tree Bindings
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+properties:
+  compatible:
+    const: nuvoton,npcm750-peci # for the NPCM7XX BMC.
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    # Required to define a client address.
+    const: 1
+
+  "#size-cells":
+    # Required to define a client address.
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    # PECI reference clock.
+    maxItems: 1
+
+  cmd-timeout-ms:
+    # Command timeout in units of ms.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1
+        maximum: 60000
+        default: 1000
+
+  pull-down:
+    description: |
+      Defines the PECI I/O internal pull down operation.
+        0: pull down always enable
+        1: pull down only during transactions.
+        2: pull down always disable.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 2
+        default: 0
+
+  host-neg-bit-rate:
+    description: |
+      Define host negotiation bit rate divider.
+      the host negotiation bit rate calculate with formula:
+      clock frequency[Hz] / [4 x {host-neg-bit-rate + 1}]
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 7
+        maximum: 31
+        default: 15
+
+  high-volt-range:
+    description: |
+      Adapts PECI I/O interface to voltage range.
+        0: PECI I/O interface voltage range of 0.8-1.06V (default)
+        1: PECI I/O interface voltage range of 0.95-1.26V
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    peci: bus@100000 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x100000 0x200>;
+
+        peci0: peci-bus@0 {
+            compatible = "nuvoton,npcm750-peci";
+            reg = <0x0 0x200>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk NPCM7XX_CLK_APB3>;
+            cmd-timeout-ms = <1000>;
+            pull-down = <0>;
+            host-neg-bit-rate = <15>;
+        };
+    };
+...
-- 
2.17.1

