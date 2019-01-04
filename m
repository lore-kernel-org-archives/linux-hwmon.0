Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx01.hxt-semitech.com ([223.203.96.7]:46780 "EHLO
        barracuda.hxt-semitech.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726169AbfADJAm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Jan 2019 04:00:42 -0500
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC: <openbmc@lists.ozlabs.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <shunyong.yang@hxt-semitech.com>,
        <dongsheng.wang@hxt-semitech.com>,
        Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Date: Fri, 4 Jan 2019 17:00:30 +0800
Message-ID: <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Bindings for DPS650AB power, voltage, temperature, and fan monitering.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
 Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
new file mode 100644
index 000000000000..bbd601100e66
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
@@ -0,0 +1,11 @@
+Bindings for DPS650AB power, voltage, temperature, and fan monitering
+
+Required properties:
+- compatible : "dps650ab"
+- reg        : I2C address, one of 0x58, 0x59.
+
+Example:
+       dps650ab@58 {
+                   compatible = "dps650ab";
+                   reg = <0x58>;
+       };
--
1.8.3.1




This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
