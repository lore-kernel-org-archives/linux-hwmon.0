Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3232 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751760AbeBUHAX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Feb 2018 02:00:23 -0500
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
Subject: [PATCH 06/10] arm64: tegra: Add Tachometer Controller on Tegra186
Date: Wed, 21 Feb 2018 12:28:55 +0530
Message-ID: <1519196339-9377-7-git-send-email-rrajk@nvidia.com>
In-Reply-To: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The NVIDIA Tegra186 SoC has a Tachometer Controller that analyzes the
PWM signal of a Fan and reports the period value through pwm interface.

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  5 +++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index bd5305a..13c3e59 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -172,4 +172,9 @@
 			vin-supply = <&vdd_5v0_sys>;
 		};
 	};
+
+	tachometer@39c0000 {
+		nvidia,pulse-per-rev = <2>;
+		nvidia,capture-window-len = <2>;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index b762227..8f2d598 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1031,4 +1031,15 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	tegra_tachometer: tachometer@39c0000 {
+		compatible = "nvidia,tegra186-pwm-tachometer";
+		reg = <0x0 0x039c0000 0x0 0x10>;
+		#pwm-cells = <2>;
+		clocks = <&bpmp TEGRA186_CLK_TACH>;
+		clock-names = "tachometer";
+		resets = <&bpmp TEGRA186_RESET_TACH>;
+		reset-names = "tachometer";
+		status = "disabled";
+	};
 };
-- 
2.1.4

