Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3323 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751887AbeBUHBG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Feb 2018 02:01:06 -0500
From: Rajkumar Rampelli <rrajk@nvidia.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <kstewart@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
        <pombredanne@nexb.com>, <mmaddireddy@nvidia.com>,
        <mperttunen@nvidia.com>, <arnd@arndb.de>,
        <gregory.clement@free-electrons.com>, <timur@codeaurora.org>,
        <andy.gross@linaro.org>, <xuwei5@hisilicon.com>,
        <elder@linaro.org>, <heiko@sntech.de>, <krzk@kernel.org>,
        <ard.biesheuvel@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <ldewangan@nvidia.com>,
        <rrajk@nvidia.com>
Subject: [PATCH 10/10] arm64: tegra: Add PWM controller on Tegra186 soc
Date: Wed, 21 Feb 2018 12:28:59 +0530
Message-ID: <1519196339-9377-11-git-send-email-rrajk@nvidia.com>
In-Reply-To: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The NVIDIA Tegra186 SoC has a PWM controller which is
used in FAN control use case.

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 37149e9..c6f154e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1032,6 +1032,17 @@
 		interrupt-parent = <&gic>;
 	};
 
+	pwm@c340000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0xc340000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM4>;
+		clock-names = "pwm";
+		#pwm-cells = <2>;
+		resets = <&bpmp TEGRA186_RESET_PWM4>;
+		reset-names = "pwm";
+		status = "disabled";
+	};
+
 	tegra_tachometer: tachometer@39c0000 {
 		compatible = "nvidia,tegra186-pwm-tachometer";
 		reg = <0x0 0x039c0000 0x0 0x10>;
-- 
2.1.4

