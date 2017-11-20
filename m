Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47940 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751980AbdKTXx4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Nov 2017 18:53:56 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAKNnO7m056263
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:53:55 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ec5ue8atp-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Nov 2017 18:53:55 -0500
Received: from localhost
        by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 20 Nov 2017 16:53:54 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 04/12] dt-bindings: fsi: Add P9 OCC hwmon device documentation
Date: Mon, 20 Nov 2017 17:53:33 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Document the bindings for the FSI-based OCC hwmon device.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
new file mode 100644
index 0000000..086b1eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
@@ -0,0 +1,16 @@
+Device-tree bindings for FSI-based On-Chip Controller hwmon device
+------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p9-occ-hwmon";
+
+Examples:
+
+    occ@1 {
+        compatible = "ibm,p9-occ";
+        reg = <1>;
+
+        occ-hwmon@1 {
+            compatible = "ibm,p9-occ-hmwon";
+        }
+    };
-- 
1.8.3.1

