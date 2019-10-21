Return-Path: <SRS0=zu4t=YO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E76ACA9EAF
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Oct 2019 15:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2DE2214AE
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Oct 2019 15:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="ynArVqbI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbfJUPlW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Oct 2019 11:41:22 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:23980 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726289AbfJUPlW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Oct 2019 11:41:22 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9LFXXGt003599;
        Mon, 21 Oct 2019 11:40:54 -0400
Received: from nam05-co1-obe.outbound.protection.outlook.com (mail-co1nam05lp2059.outbound.protection.outlook.com [104.47.48.59])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vqy46bw0h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 21 Oct 2019 11:40:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3Kv+D+zn2/ISQgRg5uQNAuWBTLzRiMJQLbRZHVIj/fhcms0a1tWjOaDlfHMCYXQ3ll5zMm6ooz2WrE3TDmKaOz4zkbM051wuMbsWFgLp3ZpbMmVS0WNvaUwUNcW8PNd4lLgzxVxBt/M2jdxw/b/fzMY+xTETJ6q9p4ybHG/GDRmcWn7rkIxr6ku3ARygX/I9Liv+kGsz7GAAueyXqAVhlgTcoiC2un0ccsoVCJh0mL+80lFvebQtwmNIip/Clhmd/VdunrzIgNYCT+yVlZesfMZ2VYN8tIEGajkegCjtCHXU34w5XPC3UO59nO2xQ1Zt+MhuO8Xg8rNRICYsLd/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jpS+gCEUevYtrwJ2pR1CTP9IKd1jYmFKaMtnaJ1e0U=;
 b=f5oz1Acg5RvdBaBAdBZI2k0q5aeDq/zyMbHwIq1bfE0BDhz4ns7W9aNS2z2ymBDoxSrFqcffE+yEUq0b03n6kpUqGe/J+2lRGRh7vpw9vAiHC68e52RPz/rxFCiEFshcOMdt44P9YfxjL63rjJoUHO88PwKiNEfCcNCwhsIfdzWr0xexubJrOb7Y12ukOXqIEcB+plZCnuTk+ykr2zJKrbwAwJfszRCkg72TcTE2BxDSjbEdixCGgHapS63Yz0Kdvy1kBihOid8rwYEHh9ofAXt2tzgTtZUyT/s/hMDYVmDR3tBD3QkehfEugBEV7YamI9x/zkcM9xKR8tZjP1L2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jpS+gCEUevYtrwJ2pR1CTP9IKd1jYmFKaMtnaJ1e0U=;
 b=ynArVqbItCwMFzuXskxrLSxiXYWDeoGpF6VDFA5pDVM8f3J8LmXDf7jd/BcOM+hP3rI/tgJP6kHYO7Mzmyr9t9zmHItGXnmszmX6ZJJInXjxZYCwMeHyqEw+dKTAM+aBIm4BrJ8DpOZBTK/TtHb27myV2OPVwz/x0Q38ADudKn8=
Received: from CY1PR03CA0004.namprd03.prod.outlook.com (2603:10b6:600::14) by
 BYAPR03MB3462.namprd03.prod.outlook.com (2603:10b6:a02:a9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 15:40:52 +0000
Received: from CY1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by CY1PR03CA0004.outlook.office365.com
 (2603:10b6:600::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 15:40:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT011.mail.protection.outlook.com (10.152.75.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Mon, 21 Oct 2019 15:40:51 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9LFepQZ006667
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 21 Oct 2019 08:40:51 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 21 Oct
 2019 11:40:50 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Date:   Mon, 21 Oct 2019 17:41:15 +0200
Message-ID: <20191021154115.319073-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021154115.319073-1-nuno.sa@analog.com>
References: <20191021154115.319073-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(189003)(199004)(110136005)(54906003)(305945005)(23676004)(5820100001)(53416004)(7636002)(966005)(7736002)(70206006)(70586007)(6306002)(4326008)(8936002)(50466002)(26005)(8676002)(106002)(316002)(76176011)(50226002)(45776006)(186003)(6666004)(356004)(16526019)(246002)(2870700001)(1076003)(486006)(36756003)(5660300002)(3846002)(446003)(11346002)(2906002)(2616005)(2201001)(86362001)(6116002)(47776003)(478600001)(426003)(336012)(476003)(126002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB3462;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2003a0ba-1deb-4445-c3c2-08d7563d0dd3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3462:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <BYAPR03MB346234A7F412C9D9DBE3503E99690@BYAPR03MB3462.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sL1CJStpItdmYVTbCjjUH95aFkFGRnEU49TtsAMSdslkZvWxyBy+9kzrdTrPojx6LFZoV6thpTENlIIL6o8T+f06cx7hLkDA/c0L8mFIRFuoW2tuflzT/7XEvMpLoUu0L/yTf/rt/YgPNMNy83pPOwK7Zz5IsLg8WCuAPcMxw+y4FgKjecjQswuvesmiCJntHWDjoICJrysKTpJ1g5yRCDLQNJygOO1SjVwsoWKLuYDxaFyb/quEZGSB7jfPkDX3+0BvplBH2mxkiq1zBlEPcHD4LyI9lh8pMDbwu2QidTmZcZReAy8eokxqCMqrD5r7hdu+4c5KRL8KaGD2rgOpQlKKVvIPEXPD/+ZZRBq/FhRoIeISDG3EHXj66w2ws9/hVyA9ay+nf7ek3EGrbqJX+uZDsD2qVBptY2JImZA63SrgeOsVXoyfgcQd6mwsY5DNBJEn36B8t6kdfMirlc6kxWnD9rVKfsYJJAvlsqLvQSs=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 15:40:51.9949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2003a0ba-1deb-4445-c3c2-08d7563d0dd3
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3462
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210147
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the LTC2947 device devicetree bindings.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Changes in v2:
 * Add license identifier;
 * Fix the uint32-array properties;
 * Set maximum at the same indent as allOf in adi,accumulation-deadband-microamp;
 * Set enum at the same indent as allOf in adi,gpio-out-pol;
 * Use spi instead of spi0 on the example;

Changes in v3:
 * Nothing changed.

 .../bindings/hwmon/adi,ltc2947.yaml           | 104 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
new file mode 100644
index 000000000000..ae04903f34bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/hwmon/adi,ltc2947.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC2947 high precision power and energy monitor
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  Analog Devices LTC2947 high precision power and energy monitor over SPI or I2C.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2947.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc2947
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      The LTC2947 uses either a trimmed internal oscillator or an external clock
+      as the time base for determining the integration period to represent time,
+      charge and energy. When an external clock is used, this property must be
+      set accordingly.
+    maxItems: 1
+
+  adi,accumulator-ctl-pol:
+    description:
+      This property controls the polarity of current that is accumulated to
+      calculate charge and energy so that, they can be only accumulated for
+      positive current for example. Since there are two sets of registers for
+      the accumulated values, this entry can also have two items which sets
+      energy1/charge1 and energy2/charger2 respectively. Check table 12 of the
+      datasheet for more information on the supported options.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 2
+        maxItems: 2
+        items:
+          enum: [0, 1, 2, 3]
+          default: 0
+
+  adi,accumulation-deadband-microamp:
+    description:
+      This property controls the Accumulation Dead band which allows to set the
+      level of current below which no accumulation takes place.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    default: 0
+
+  adi,gpio-out-pol:
+    description:
+      This property controls the GPIO polarity. Setting it to one makes the GPIO
+      active high, setting it to zero makets it active low. When this property
+      is present, the GPIO is automatically configured as output and set to
+      control a fan as a function of measured temperature.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  adi,gpio-in-accum:
+    description:
+      When set, this property sets the GPIO as input. It is then used to control
+      the accumulation of charge, energy and time. This function can be
+      enabled/configured separately for each of the two sets of accumulation
+      registers. Check table 13 of the datasheet for more information on the
+      supported options. This property cannot be used together with
+      adi,gpio-out-pol.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 2
+        maxItems: 2
+        items:
+          enum: [0, 1, 2]
+          default: 0
+
+required:
+  - compatible
+  - reg
+
+
+examples:
+  - |
+    spi {
+           #address-cells = <1>;
+           #size-cells = <0>;
+
+           ltc2947_spi: ltc2947@0 {
+                   compatible = "adi,ltc2947";
+                   reg = <0>;
+                   /* accumulation takes place always for energ1/charge1. */
+                   /* accumulation only on positive current for energy2/charge2. */
+                   adi,accumulator-ctl-pol = <0 1>;
+           };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 318332b6a411..e2ba1a182052 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9638,6 +9638,7 @@ F:	drivers/hwmon/ltc2947-core.c
 F:	drivers/hwmon/ltc2947-spi.c
 F:	drivers/hwmon/ltc2947-i2c.c
 F:	drivers/hwmon/ltc2947.h
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
 
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
-- 
2.23.0

