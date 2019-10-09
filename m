Return-Path: <SRS0=qHdd=YC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B414C47404
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Oct 2019 10:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C664220659
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Oct 2019 10:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="j7NcAu73"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfJIK2R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Oct 2019 06:28:17 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:33904 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727035AbfJIK2R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Oct 2019 06:28:17 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x99AN1Js010197;
        Wed, 9 Oct 2019 06:27:50 -0400
Received: from nam02-bl2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2052.outbound.protection.outlook.com [104.47.38.52])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ven19wex2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Oct 2019 06:27:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQfU5AeOObfLoM9wKjoPKApzHGNA5cbn06kdeOKmPWSWLtJScWMdj7GL5IaXBQ0CSX1nBS3WSbLB423TaDNcabrI5CqeOP4whtvbLfwMo75FCzPKv1Ip2+DRCmYiPYYTm4mh0w17rTI09IKVo9qTTLD1hA9D9CcguzIwUnTNIcPdbvOs+wP+TzTv1Kv3gtS2G2XcCPWh4n0XcbR8Mjxqgy/Io/HWoTNDKzEmgXI7x30Ag4XmgwIQ1dGqz9He98/PewoUEjY52UEudSFStEPiKc/b4qKBEPmL6NVemUef53dGcdWSKNXqURctsD4dFQhWBEsWc+oaeHwD2uqB+LpRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4ApoNaQYSmKdwMP5XS1AMVARH/uiAnSDl6cNMUU2II=;
 b=UTADDXuO9LIofMHo0awoVOAxM+h9JRO5jRhDriT8po8hr8LP5IekrOwBsDqv2Mkm0r5+S36U5563c0ZeekVD/bQFa6BBwyOxEYaEuVDI3hLe4E4e8xOfmeumOf8KL4cTPL+glTi/ErWJFpF0X16LribHzGF8B/AMz4vIwGhHmrkLaCEVgM/WqZq+lYMmq2mBhAperDkhZ3zHHyRXTulyxjJzSrTVXTsMT/K7iowpQFnZsdawDNnqeTF2Tw0Ua5ao9cOYojnFfjnuGcvRnLREJne0M1Vq7h74m18/udAFbELKdZYcaLYlXYcwh+R3ZrFTC6hRDvh9l1POEMzZ9f14UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4ApoNaQYSmKdwMP5XS1AMVARH/uiAnSDl6cNMUU2II=;
 b=j7NcAu73gAhrKDmOkzT6uI8L1gw9CD/Ff9IhAuTFcSFLrUrG13g+mMzX0ou5Z08QiZccgj/IIB0BRJBzNdjVQZGVC9TyyBMHplTOK753EmkmOU+pSj61YEjQPKt9+yI88z1lNlJkNwBp79YPgFYydIb4t40L5iboBMKDACuxmY4=
Received: from CY4PR03CA0105.namprd03.prod.outlook.com (2603:10b6:910:4d::46)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 10:27:47 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::205) by CY4PR03CA0105.outlook.office365.com
 (2603:10b6:910:4d::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 10:27:47 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Wed, 9 Oct 2019 10:27:46 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x99ARewX003254
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 9 Oct 2019 03:27:40 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 9 Oct
 2019 06:27:46 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/2] dt-bindings: hwmon: Add AXI FAN Control documentation
Date:   Wed, 9 Oct 2019 12:28:06 +0200
Message-ID: <20191009102806.262241-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009102806.262241-1-nuno.sa@analog.com>
References: <20191009102806.262241-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(4326008)(2616005)(966005)(53416004)(6666004)(356004)(6116002)(86362001)(126002)(305945005)(11346002)(7636002)(7736002)(446003)(36756003)(476003)(426003)(336012)(3846002)(486006)(50466002)(54906003)(316002)(110136005)(2906002)(2870700001)(478600001)(47776003)(45776006)(246002)(70586007)(106002)(8676002)(23676004)(186003)(1076003)(6306002)(5820100001)(76176011)(16526019)(50226002)(70206006)(26005)(5660300002)(14444005)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB5306;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff53a16-7e1a-40d5-bb64-08d74ca35414
X-MS-TrafficTypeDiagnostic: DM6PR03MB5306:
X-MS-Exchange-PUrlCount: 4
X-Microsoft-Antispam-PRVS: <DM6PR03MB53069968D367039C4DA8E68F99950@DM6PR03MB5306.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jb9vmWZGWrRZZbt9GREOygq2WDSp3y8ZyQjZaAXgGFt7TOGyXgE3M1DFcTevrhjsvXN88UTMnh/Y/jSc8ljO/8QxG0UgxVfcYV3+kHIyL6F4q0VQRXMqwgR8thKJd588/rRShM9uw6Kqf5JjdAXb4pgrgfFt5+JPvTZGVDuM1b6GqvRqxZi6e4vFyLvBN1x2/2VOUy85LG6WzqTM3NX8ubbSQITrwvJvmxrw1HbvuZAxh5hzMJ6F/kqotPQcUH3mk2++3JCGJZusTOmzCOF6Q8LleNPVY24O/YpN0/91Jqxdf2u74IvlUGdD5tSEUNyQzsXTKGeq/yle7Mg8mAcT6+9pDtwXYJmYmlWISLn7/SpAnNjIQYyU+GiiNiGUxiqQqve1N4AIjTlpL/kz3caq2BrM+uJFwQj/i86WCDgALx86JjogqKnnHFncVA7PR1H/FKnY2G7a4tqs37sa98lblw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 10:27:46.9791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff53a16-7e1a-40d5-bb64-08d74ca35414
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_05:2019-10-08,2019-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910090098
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the AXI FAN Control IP core devicetree bindings.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Changes in v2:
 * Set the correct license for new bindings;
 * Fix wrong compatible in the example;
 * Wrap long line;
 * Update adi,pulses-per-revolution with accepted values.

 .../bindings/hwmon/adi,axi-fan-control.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
new file mode 100644
index 000000000000..dc82b9748c9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2019 Analog Devices Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/hwmon/adi,axi-fan-control.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AXI FAN Control Device Tree Bindings
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |+
+  Bindings for the Analog Devices AXI FAN Control driver. Spefications of the
+  core can be found in:
+
+  https://wiki.analog.com/resources/fpga/docs/axi_fan_control
+
+properties:
+  compatible:
+    enum:
+        - adi,axi-fan-control-1.00.a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  adi,pulses-per-revolution:
+    description:
+      Value specifying the number of pulses per revolution of the controlled
+      FAN.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - adi,pulses-per-revolution
+
+examples:
+  - |
+    fpga_axi: fpga-axi@0 {
+            #address-cells = <0x2>;
+            #size-cells = <0x1>;
+
+            axi_fan_control: axi-fan-control@80000000 {
+                    compatible = "adi,axi-fan-control-1.00.a";
+                    reg = <0x0 0x80000000 0x10000>;
+                    clocks = <&clk 71>;
+                    interrupts = <0 110 0>;
+                    adi,pulses-per-revolution = <2>;
+            };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index caa80ae1925e..74ddcb3e1fd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2879,6 +2879,7 @@ W:	http://ez.analog.com/community/linux-device-drivers
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	drivers/hwmon/axi-fan-control.c
+F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
 
 AXXIA I2C CONTROLLER
 M:	Krzysztof Adamski <krzysztof.adamski@nokia.com>
-- 
2.23.0

