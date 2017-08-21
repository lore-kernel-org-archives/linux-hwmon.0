Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.tdt.de ([195.243.126.94]:56704 "EHLO mail.dev.tdt.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753795AbdHUMlb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Aug 2017 08:41:31 -0400
From: Florian Eckert <fe@dev.tdt.de>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, dev@kresin.me
Subject: [PATCH v2 2/2] hwmon: (ltq-cputemp) add devicetree bindings documentation
Date: Mon, 21 Aug 2017 14:41:23 +0200
Message-Id: <20170821124123.17470-2-fe@dev.tdt.de>
In-Reply-To: <20170821124123.17470-1-fe@dev.tdt.de>
References: <20170821124123.17470-1-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Document the devicetree bindings for the ltq-cputemp

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
new file mode 100644
index 000000000000..991b05cbcb4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
@@ -0,0 +1,10 @@
+Lantiq cpu temperatur sensor driver
+
+Requires node properties:
+- "compatible" value :
+	"lantiq,cputemp"
+
+Example:
+	cputemp@0 {
+		compatible = "lantiq,cputemp";
+	};
-- 
2.11.0

