Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40444 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752890AbdHOUwq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Aug 2017 16:52:46 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7FKmZsQ071915
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Aug 2017 16:52:45 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2cc6f54xka-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Aug 2017 16:52:45 -0400
Received: from localhost
        by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 15 Aug 2017 14:52:44 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v4 1/3] dt-bindings: i2c: Document the IBM CCF power supply version 1
Date: Tue, 15 Aug 2017 15:52:33 -0500
In-Reply-To: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502830355-502-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1502830355-502-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/i2c/ibm,cffps1.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt

diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
new file mode 100644
index 0000000..f68a0a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
@@ -0,0 +1,21 @@
+Device-tree bindings for IBM Common Form Factor Power Supply Version 1
+----------------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,cffps1";
+ - reg = < I2C bus address >;		: Address of the power supply on the
+					  I2C bus.
+
+Example:
+
+    i2c-bus@100 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #interrupt-cells = <1>;
+        < more properties >
+
+        power-supply@68 {
+            compatible = "ibm,cffps1";
+            reg = <0x68>;
+        };
+    };
-- 
1.8.3.1

