Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:32907 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754114AbcEPQSO (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 16 May 2016 12:18:14 -0400
Received: by mail-pa0-f44.google.com with SMTP id xk12so66663815pac.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2016 09:18:13 -0700 (PDT)
From: Hoan Tran <hotran@apm.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, lho@apm.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Hoan Tran <hotran@apm.com>
Subject: [PATCH 3/3] arm64: dts: apm: Add X-Gene SoC hwmon to device tree
Date: Mon, 16 May 2016 09:17:27 -0700
Message-Id: <1463415447-29903-4-git-send-email-hotran@apm.com>
In-Reply-To: <1463415447-29903-1-git-send-email-hotran@apm.com>
References: <1463415447-29903-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds DT node to enable hwmon driver for APM X-Gene SoC.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 5 +++++
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index a055a5d..672c0ce 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -472,6 +472,11 @@
 			mboxes = <&mailbox 0>;
 		};
 
+		hwmonslimpro {
+			compatible = "apm,xgene-slimpro-hwmon";
+			mboxes = <&mailbox 7>;
+		};
+
 		serial0: serial@10600000 {
 			device_type = "serial";
 			compatible = "ns16550";
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index ae4a173..7a59159 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -716,6 +716,11 @@
 			mboxes = <&mailbox 0>;
 		};
 
+		hwmonslimpro {
+			compatible = "apm,xgene-slimpro-hwmon";
+			mboxes = <&mailbox 7>;
+		};
+
 		serial0: serial@1c020000 {
 			status = "disabled";
 			device_type = "serial";
-- 
1.9.1

