Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.tdt.de ([195.243.126.94]:50305 "EHLO mail.dev.tdt.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751022AbdIAG6a (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 1 Sep 2017 02:58:30 -0400
From: Florian Eckert <fe@dev.tdt.de>
To: robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings documentation
Date: Fri,  1 Sep 2017 08:58:18 +0200
Message-Id: <20170901065818.2037-2-fe@dev.tdt.de>
In-Reply-To: <20170901065818.2037-1-fe@dev.tdt.de>
References: <20170901065818.2037-1-fe@dev.tdt.de>
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
index 000000000000..33fd00a987c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
@@ -0,0 +1,10 @@
+Lantiq cpu temperatur sensor
+
+Requires node properties:
+- compatible value :
+	"lantiq,cputemp"
+
+Example:
+	cputemp@0 {
+		compatible = "lantiq,cputemp";
+	};
-- 
2.11.0

