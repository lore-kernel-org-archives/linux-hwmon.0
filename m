Return-Path: <SRS0=nqTs=2B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C818C2D0CB
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 19:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56C0624654
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 19:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbfLKTqk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Dec 2019 14:46:40 -0500
Received: from mga06.intel.com ([134.134.136.31]:17648 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbfLKTqj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 14:46:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 11:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; 
   d="scan'208";a="216033852"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com) ([10.7.153.143])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:39 -0800
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
Subject: [PATCH v11 08/14] ARM: dts: npcm7xx: Add PECI node
Date:   Wed, 11 Dec 2019 11:46:18 -0800
Message-Id: <20191211194624.2872-9-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Tomer Maimon <tmaimon77@gmail.com>

This commit adds PECI node for npcm7xx.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v10:
- Newly added in v11.

 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index d2d0761295a4..526c56770388 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -116,6 +116,13 @@
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0xf0000000 0x00300000>;
 
+			peci: bus@100000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x100000 0x200>;
+			};
+
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm750-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -185,3 +192,15 @@
 		};
 	};
 };
+
+&peci {
+	peci0: peci-bus@0 {
+		compatible = "nuvoton,npcm750-peci";
+		reg = <0x0 0x200>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk NPCM7XX_CLK_APB3>;
+		status = "disabled";
+	};
+};
-- 
2.17.1

