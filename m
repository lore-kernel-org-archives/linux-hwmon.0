Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40032 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727288AbeKIGmy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Nov 2018 01:42:54 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA8L0R0R069553
        for <linux-hwmon@vger.kernel.org>; Thu, 8 Nov 2018 16:05:37 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nmv4nhhtj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Nov 2018 16:05:37 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.ibm.com>;
        Thu, 8 Nov 2018 21:05:37 -0000
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux@roeck-us.net, rdunlap@infradead.org,
        benh@kernel.crashing.org, Eddie James <eajames@linux.vnet.ibm.com>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v6 01/10] dt-bindings: fsi: Add P9 OCC device documentation
Date: Thu,  8 Nov 2018 15:05:20 -0600
In-Reply-To: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
References: <1541711129-26631-1-git-send-email-eajames@linux.ibm.com>
Message-Id: <1541711129-26631-2-git-send-email-eajames@linux.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Eddie James <eajames@linux.vnet.ibm.com>

Document the bindings for the FSI-attached POWER9 On-Chip Controller.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..99ca986
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,16 @@
+Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
+---------------------------------------------------------------------
+
+This is the binding for the P9 On-Chip Controller accessed over FSI from a
+service processor. See fsi.txt for details on bindings for FSI slave and CFAM
+nodes. The OCC is not an FSI slave device itself, rather it is accessed
+through the SBE fifo.
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
