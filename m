Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171EEC1B0D9
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 08:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAEE723B97
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Dec 2020 08:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgLIIJe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Dec 2020 03:09:34 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46460 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728438AbgLIICc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Dec 2020 03:02:32 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0B97uWqI009073;
        Wed, 9 Dec 2020 15:56:32 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Dec
 2020 15:59:28 +0800
From:   Troy Lee <troy_lee@aspeedtech.com>
To:     <openbmc@lists.ozlabs.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
CC:     <leetroy@gmail.com>, <troy_lee@aspeedtech.com>,
        <ryan_chen@aspeedtech.com>, <chiawei_wang@aspeedtech.com>,
        <billy_tsai@aspeedtech.com>
Subject: [PATCH 2/4] ARM: dts: aspeed: Add Aspeed AST2600 PWM/Fan node in devicetree
Date:   Wed, 9 Dec 2020 15:59:18 +0800
Message-ID: <20201209075921.26689-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209075921.26689-1-troy_lee@aspeedtech.com>
References: <20201209075921.26689-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0B97uWqI009073
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Create a common node in aspeed-g6.dtsi and add fan nodes for ast2600-evb
dts file.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 149 +++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi         |  10 ++
 2 files changed, 159 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 89be13197780..51e00cf60749 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -23,6 +23,155 @@
 	};
 };
 
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_tach0_default
+			&pinctrl_pwm1_default &pinctrl_tach1_default
+			&pinctrl_pwm2_default &pinctrl_tach2_default
+			&pinctrl_pwm3_default &pinctrl_tach3_default
+			&pinctrl_pwm4_default &pinctrl_tach4_default
+			&pinctrl_pwm5_default &pinctrl_tach5_default
+			&pinctrl_pwm6_default &pinctrl_tach6_default
+			&pinctrl_pwm7_default &pinctrl_tach7_default
+			&pinctrl_pwm8g1_default &pinctrl_tach8_default
+			&pinctrl_pwm9g1_default &pinctrl_tach9_default
+			&pinctrl_pwm10g1_default &pinctrl_tach10_default
+			&pinctrl_pwm11g1_default &pinctrl_tach11_default
+			&pinctrl_pwm12g1_default &pinctrl_tach12_default
+			&pinctrl_pwm13g1_default &pinctrl_tach13_default
+			&pinctrl_pwm14g1_default &pinctrl_tach14_default
+			&pinctrl_pwm15g1_default &pinctrl_tach15_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@8 {
+		reg = <0x08>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@9 {
+		reg = <0x09>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@10 {
+		reg = <0x0a>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@11 {
+		reg = <0x0b>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@12 {
+		reg = <0x0c>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@13 {
+		reg = <0x0d>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@14 {
+		reg = <0x0e>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
+		aspeed,pulse-pr = <2>;
+	};
+
+	fan@15 {
+		reg = <0x0f>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
+		aspeed,pulse-pr = <2>;
+	};
+};
+
 &mdio0 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 97ca743363d7..7687d37bba26 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -298,6 +298,16 @@
 			#size-cells = <1>;
 			ranges;
 
+			pwm_tacho: pwm-tacho-controller@1e610000 {
+				compatible = "aspeed,ast2600-pwm-tachometer";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e610000 0x100>;
+				clocks = <&syscon ASPEED_CLK_AHB>;
+				resets = <&syscon ASPEED_RESET_PWM>;
+				status = "disabled";
+			};
+
 			syscon: syscon@1e6e2000 {
 				compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
 				reg = <0x1e6e2000 0x1000>;
-- 
2.17.1

