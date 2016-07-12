Return-path: <hotran@apm.com>
From: Hoan Tran <hotran@apm.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Duc Dang <dhdang@apm.com>,
	lho@apm.com,
	Hoan Tran <hotran@apm.com>
Subject: [PATCH v2 3/3] arm64: dts: apm: Add X-Gene SoC hwmon to device tree
Date: Mon, 11 Jul 2016 17:30:16 -0700
Message-Id: <1468283416-12780-4-git-send-email-hotran@apm.com>
In-Reply-To: <1468283416-12780-1-git-send-email-hotran@apm.com>
References: <1468283416-12780-1-git-send-email-hotran@apm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch adds DT node to enable hwmon driver for APM X-Gene SoC.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 5 +++++
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index c569f76..a5935f5 100644
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
index 5147d76..f8ea5b5 100644
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
