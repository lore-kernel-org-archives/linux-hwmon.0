Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:36192 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753793AbeAIWb3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Jan 2018 17:31:29 -0500
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.10 1/6] Documentation: dt-bindings: Add Aspeed PECI
Date: Tue,  9 Jan 2018 14:31:21 -0800
Message-Id: <20180109223126.13093-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This commit adds a dt-bindings document for Aspeed PECI.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/misc/aspeed-peci.txt       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-peci.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-peci.txt b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
new file mode 100644
index 0000000..d277c73
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
@@ -0,0 +1,55 @@
+* ASPEED PECI (Platform Environment Control Interface) misc driver.
+
+Hardware Interfaces:
+- This driver implements support for the ASPEED AST2400/2500 PECI which has the
+  following features:
+	- Directly connected to APB bus
+	- Intel PECI 3.1 compliant (PECI 3.0 for AST2400)
+	- Maximum packet length is 256 bytes (Baseline transmission unit)
+	- Support up to 8 CPUs and 2 domains per CPU
+	- Integrate PECI compliant I/O buffers, can connect to PECI bus directly
+	- Transmit buffer 32 bytes and receive buffer 32 bytes
+
+Required properties:
+- compatible: "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
+	- aspeed,ast2400-peci: Aspeed AST2400 family PECI control interface
+	- aspeed,ast2500-peci: Aspeed AST2500 family PECI control interface
+- reg: Should contain PECI registers location and length
+- interrupts: Should contain PECI interrupt
+- clocks: Should contain clock source. = <&clk_clkin>;
+- clock_frequency: Should contain the operation frequency of PECI controller.
+	187500 ~ 24000000
+
+Optional properties:
+- msg-timing-nego: Message timing negotiation period.
+	This value will determine the period of message timing negotiation to be
+	issued by PECI controller. The unit of the programmed value is four
+	times of PECI clock period.
+	0 ~ 255 (default: 1)
+- addr-timing-nego: Address timing negotiation period.
+	This value will determine the period of address timing negotiation to be
+	issued by PECI controller. The unit of the programmed value is four
+	times of PECI clock period.
+	0 ~ 255 (default: 1)
+- rd-sampling-point: Read sampling point selection.
+	The whole period of a bit time will be divided into 16 time frames.
+	This value will determine which time frame this controller will sample
+	PECI signal for data read back. Usually in the middle of a bit time is
+	the best.
+	0 ~ 15 (default: 8)
+- cmd_timeout_ms: Command timeout in units of ms
+	1 ~ 60000 (default: 1000)
+
+Example:
+	peci: peci@1e78b000 {
+		compatible = "aspeed,ast2500-peci";
+		reg = <0x1e78b000 0x60>;
+		interrupt-controller;
+		interrupts = <15>;
+		clocks = <&clk_clkin>;
+		clock-frequency = <24000000>;
+		msg-timing-nego = <1>;
+		addr-timing-nego = <1>;
+		rd-sampling-point = <8>;
+		cmd-timeout-ms = <1000>;
+	};
-- 
2.7.4

