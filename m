Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device documentation
Date: Thu, 30 Aug 2018 16:32:32 -0500
In-Reply-To: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Document the bindings for the FSI-attached POWER9 On-Chip Controller.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..46372f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,15 @@
+Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
+---------------------------------------------------------------------
+
+This is the binding for the P9 On-Chip Controller accessed over FSI from a
+service processor. See fsi.txt for details on bindings for FSI slave and CFAM
+nodes.
+
+Required properties:
+ - compatible = "ibm,p9-occ"
+
+Examples:
+
+    occ {
+        compatible = "ibm,p9-occ";
+    };
-- 
1.8.3.1
