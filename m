Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:32901 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754222AbcEPQSL (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 16 May 2016 12:18:11 -0400
Received: by mail-pa0-f49.google.com with SMTP id xk12so66663487pac.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2016 09:18:11 -0700 (PDT)
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
Subject: [PATCH 1/3] Documentation: dtb: xgene: Add hwmon dts binding documentation
Date: Mon, 16 May 2016 09:17:25 -0700
Message-Id: <1463415447-29903-2-git-send-email-hotran@apm.com>
In-Reply-To: <1463415447-29903-1-git-send-email-hotran@apm.com>
References: <1463415447-29903-1-git-send-email-hotran@apm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch adds the APM X-Gene hwmon device tree node documentation.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
 .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
new file mode 100644
index 0000000..49a482e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
@@ -0,0 +1,14 @@
+APM X-Gene hwmon driver
+
+Hwmon driver accesses sensors over the "SLIMpro" mailbox.
+
+Required properties :
+ - compatible : should be "apm,xgene-slimpro-hwmon"
+ - mboxes : use the label reference for the mailbox as the first parameter.
+	    The second parameter is the channel number.
+
+Example :
+	hwmonslimpro {
+		compatible = "apm,xgene-slimpro-hwmon";
+		mboxes = <&mailbox 7>;
+	};
-- 
1.9.1

