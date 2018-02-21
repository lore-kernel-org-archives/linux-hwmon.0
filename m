Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3255 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751760AbeBUHAc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Feb 2018 02:00:32 -0500
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
Subject: [PATCH 07/10] arm64: tegra: Add PWM based Tachometer support on Tegra186
Date: Wed, 21 Feb 2018 12:28:56 +0530
Message-ID: <1519196339-9377-8-git-send-email-rrajk@nvidia.com>
In-Reply-To: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add PWM based Tachometer support on Tegra186 to measure
number of rotations of a Fan per minute by using PWM
capture interface

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 8f2d598..37149e9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1042,4 +1042,10 @@
 		reset-names = "tachometer";
 		status = "disabled";
 	};
+
+	generic_pwm_tachometer {
+		compatible = "generic-pwm-tachometer";
+		pwms = <&tegra_tachometer 0 1000000>;
+		status = "disabled";
+	};
 };
-- 
2.1.4

