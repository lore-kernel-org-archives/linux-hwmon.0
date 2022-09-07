Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256D5C38145
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Sep 2022 10:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbiIGKXR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiIGKXA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2022 06:23:00 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F022B9FA8
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Sep 2022 03:20:33 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2876nUYh022560;
        Wed, 7 Sep 2022 06:20:17 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3jc3u6bmut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 06:20:16 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 287AKF4t063867
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Sep 2022 06:20:15 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 7 Sep 2022
 06:20:14 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 7 Sep 2022 06:20:14 -0400
Received: from ibrahim-vm.ad.analog.com (IST-LT-39247.ad.analog.com [10.25.16.132])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 287AJl24009387;
        Wed, 7 Sep 2022 06:20:05 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-hwmon@vger.kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 3/4] dt-bindings: hwmon: Add bindings for max31760
Date:   Wed, 7 Sep 2022 13:19:07 +0300
Message-ID: <20220907101908.184819-4-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220907101908.184819-1-Ibrahim.Tilki@analog.com>
References: <20220907101908.184819-1-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: nl5fpfTUFlWRRMiqaMIrrXH7rRGl1NpA
X-Proofpoint-ORIG-GUID: nl5fpfTUFlWRRMiqaMIrrXH7rRGl1NpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_06,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=949
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070040
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding bindings for Analog Devices MAX31760 Fan-Speed Controller

Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
---
 .../bindings/hwmon/adi,max31760.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31760.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
new file mode 100644
index 000000000..003ec1317
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,max31760.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX31760 Fan-Speed Controller
+
+maintainers:
+  - Ibrahim Tilki <Ibrahim.Tilki@analog.com>
+
+description: |
+  Analog Devices MAX31760 Fan-Speed Controller
+  https://datasheets.maximintegrated.com/en/ds/MAX31760.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,max31760
+
+  reg:
+    description: |
+      I2C address of slave device.
+    items:
+      minimum: 0x50
+      maximum: 0x57
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        max31760@50 {
+                reg = <0x50>;
+                compatible = "adi,max31760";
+        };
+    };
-- 
2.36.1

