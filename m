Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571325;
	b=4WB78IzWghTBls6LSfd9E+t61qv8MWH2zBDP/VAU3XFu6v3qwb/Wenh1rJiLb//0xrf9
	 iQ50lJ0bCeCryROTRabJT2uMEmfxUYO1jqbjn8cvOpcXhvFEIsMNJ7Z/JSn89MtkGslEN
	 gD5AWrCiU2jr+oQIEn7s/ivWiIJ1UeiyJwdSaOV6tocLugjq8t9lqQB3JdWBt1PIVJtxM
	 aPGE11BoxEIhI2eORj4X5sLwse1z8Qi2CM7+LhYLHJOtRkJNepQj8yghXI16mARagdKeQ
	 q82+RvSoAWzEktRVo0hx1nlAVfCB1/encf+ZPh2bSw6l2BAW+655lb7UGmit6dyz6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571325;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=S3lcyIX5M+D9oaMxMnqcLepq9hdIlj33lYjarpJr4ic=;
	b=uCTHT5LB2nRdQMSMxb9lZdlOvFmKZD+OV6FlG/2kGgi4+hNOM3bksYfcSCvt1UTUgXmC
	 9xSyFsRcTtN1kc57Q1XN4uG1hqdCjOBZMVgKPqgl0Yjt5y9q/Lg+zF3dYgaRklb6wBhrc
	 w/aB1JQBTMGzzL3SKuDFy+t6es78Uqzlee9KcjDgtKetihm7Hb5rUgi71NPqOzJzsnkpg
	 XcqfWi4yjCKXVMty3QZKZA68oG72iy0BrQ8pzNZpNgIfapUPjCo4wfvQqZsuiaU/NLOFW
	 0oEjd/gGrtkWNuyv48sWWZIubhAEYUq26K54KcjmApRnhHAHWKFu8z0ZOlb1raSncBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHaOgXuE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7B606A326;
	Sun,  1 Nov 2026 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHaOgXuE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780C31F000C1;
	Sun,  1 Nov 2026 22:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571324;
	bh=S3lcyIX5M+D9oaMxMnqcLepq9hdIlj33lYjarpJr4ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CHaOgXuEOszpcFCzgxWhOugudfo85K2qYm/UkvJds7hTV31/NTxkpEvX5k0lgLQlE
	 8IvflPjJkW7U6ZILo5XVKFue4NzP8sMsGDZgLmpYpPc1lUdZWRrxk6M6i+5slC1rck
	 EuteLDR0ogjJq+Zb4I1ODq1VKMZ/oQ1mq3KZb+kUNyh6J3BoR+UeUWUC5I4B5upvyl
	 YRAQzoDExynaG9vB9bfXdzNEjN8IfqH+sEwmcDXGFfbAutlrtkjSQT4eXa6WE0WYqj
	 P/P7vgeh2cGPCr+4UM45Sr7DGfq0sGnfy+uOBn4D60xD7f3tj3hGVHqS1zaKriBP1l
	 XFOoJuwtrAfXw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 01 Nov 2026 23:14:40 +0100
Subject: [PATCH v2 7/7] ARM: dts: broadcom: Add BCM6846 PMB clocks and
 hardware monitoring
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-7-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.16.0

Describe the PMC complex and its PMB interface, including clock, reset
and hwmon child nodes. Supply the PMB clock controller with
its 50 MHz reference and connect PVTMON to its clock and reset
resources. Add a SoC thermal zone referencing the sensor child with a
one-second polling interval.

Leave trip points and cooling maps unspecified because the available
BCM6846 documentation does not establish suitable temperature limits.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846.dtsi | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index 47f177323c18..e9775dfc5d1b 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -3,8 +3,10 @@
  * Copyright 2022 Broadcom Ltd.
  */
 
+#include <dt-bindings/clock/brcm,bcm6846-pmb.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/brcm,bcm6846-pmb.h>
 
 / {
 	compatible = "brcm,bcm6846", "brcm,bcmbca";
@@ -57,6 +59,12 @@ pmu: pmu {
 	};
 
 	clocks: clocks {
+		osc50m: clock-50mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+		};
+
 		periph_clk: periph-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -75,6 +83,14 @@ psci {
 		method = "smc";
 	};
 
+	thermal-zones {
+		soc_thermal: soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&pvtmon>;
+		};
+	};
+
 	axi@81000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -263,5 +279,36 @@ pl081_dma: dma-controller@59000 {
 			clock-names = "apb_pclk";
 			#dma-cells = <2>;
 		};
+
+		pmc: system-controller@300000 {
+			compatible = "brcm,bcm6846-pmc", "simple-mfd";
+			ranges = <0x0 0x300000 0x21000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pmb: bus@20100 {
+				compatible = "brcm,bcm6846-pmb";
+				reg = <0x20100 0x200>;
+
+				pmb_clk: clock-controller {
+					compatible = "brcm,bcm6846-pmb-clock";
+					clocks = <&osc50m>;
+					clock-names = "ref";
+					#clock-cells = <1>;
+				};
+
+				pmb_reset: reset-controller {
+					compatible = "brcm,bcm6846-pmb-reset";
+					#reset-cells = <1>;
+				};
+
+				pvtmon: hwmon {
+					compatible = "brcm,bcm6846-pmb-pvtmon";
+					clocks = <&pmb_clk BCM6846_CLK_PVTMON>;
+					resets = <&pmb_reset BCM6846_RESET_PVTMON>;
+					#thermal-sensor-cells = <0>;
+				};
+			};
+		};
 	};
 };

-- 
2.56.0

