Return-Path: <SRS0=fi2j=XT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E569DC432C2
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Sep 2019 12:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE3B12146E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Sep 2019 12:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="nucroLOG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504992AbfIXMuL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Sep 2019 08:50:11 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:25506 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2395292AbfIXMuL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Sep 2019 08:50:11 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8OCbxi1007711;
        Tue, 24 Sep 2019 08:49:39 -0400
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2056.outbound.protection.outlook.com [104.47.45.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 2v6hjwt1sj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Sep 2019 08:49:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+F5ZtymKt1zC9HdqersA9NjDAYD6bTIn3QHPXVFuOPJ9+vWVZuChwtdNarcMdJeCcYsNMjxlZ70mcxm+GdTyyM3mMPfAV/g8fMEu7qZWqgqy8eAf+2vVvgIj51YrFLtHRAUzOH9GlKO0cwG+MSj2NAr3rGLC4Qc5I7ea+Th3lOx75dsfEDVZUiiyTnLu6xxb4Ek653ZE7R/Qk2iaaODlcahU71sgdLA4Zx1j/q2HiHfadwfxgMEwaN2Qo6phnZOcGFRhtW6BkHeTbhdB2eYx8ScGmL6m3YFWFoncYheLMFjN8gREJAnI72MxRoIi0X0qL5u+VogAgAMzDj6w2MEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD/HYvjMLqTULRzet0QLr1WpmTJVrnqTe8tIs2oHSCw=;
 b=Uvom1rc4pNI66KyDX/gj5e73tuxL1pWxaer+71nClCIh4pI/XLpWyj71doaVz02ByWLU+GOGvTm/HwajpsUxFp1N6ce2l2UuUOrsUydnEVxFKupl85lbcdtVtx2qI6p3SbX0ukZs8JvtiTkcf+hmUcT5ca0170IwGPfGNEFVRBpP5V910GA7sjSCAALeuBaiw0ASGww49sLgAZOOUlajRNZYh6YheSsBYT20XmZngnNybM2HSGkx0V/rXHmxLLZAZoESnx9mRpQbk5MSbUvVdsh1SvI+B7H7zXyXLDE4wfPWs6ux0ILM9LaIZbBds6llhchllHdCp6FargLi+3+KHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD/HYvjMLqTULRzet0QLr1WpmTJVrnqTe8tIs2oHSCw=;
 b=nucroLOGMSqbTZFznUe0hwxH588RuBR8ILE+L0rSoNC5alwOXRJ14D0RPkKsRpG+xB6ni1YacJju7K0R82KTnvaiR+6pJJ2AffiAnGU0SQx/D4uQEFvBmYjKWyed5D/2YrO7MhukEX4saaEC5sUyMsxrl3Tl2KG6furjfoPkBWY=
Received: from CY4PR03CA0084.namprd03.prod.outlook.com (2603:10b6:910:4d::25)
 by DM6PR03MB4537.namprd03.prod.outlook.com (2603:10b6:5:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Tue, 24 Sep
 2019 12:49:37 +0000
Received: from SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by CY4PR03CA0084.outlook.office365.com
 (2603:10b6:910:4d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19 via Frontend
 Transport; Tue, 24 Sep 2019 12:49:37 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT061.mail.protection.outlook.com (10.152.72.196) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2284.25
 via Frontend Transport; Tue, 24 Sep 2019 12:49:36 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x8OCnUkn020613
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 24 Sep 2019 05:49:30 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 24 Sep
 2019 08:49:36 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Date:   Tue, 24 Sep 2019 14:49:45 +0200
Message-ID: <20190924124945.491326-4-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924124945.491326-1-nuno.sa@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(39860400002)(346002)(376002)(136003)(189003)(199004)(7736002)(45776006)(53416004)(1076003)(5660300002)(106002)(47776003)(6306002)(2201001)(426003)(11346002)(8676002)(6666004)(4326008)(2870700001)(16526019)(2906002)(186003)(336012)(305945005)(50226002)(126002)(2616005)(476003)(54906003)(110136005)(486006)(7636002)(70206006)(316002)(966005)(356004)(8936002)(86362001)(26005)(3846002)(478600001)(76176011)(36756003)(246002)(6116002)(70586007)(5820100001)(446003)(50466002)(23676004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB4537;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb3a1bf-b31b-4b20-e63f-08d740eda82c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM6PR03MB4537;
X-MS-TrafficTypeDiagnostic: DM6PR03MB4537:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <DM6PR03MB4537FD7D63CC447A7D37E23699840@DM6PR03MB4537.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0170DAF08C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T+efjJ/Bw9K+l9PYb9es243oKg8ldPh1IgvylHIZCYmrVTW5TfB2Kzn+cvvbxnU/xShRaTi5H22PgNbKwq73+59I9Oem+j2tv+jYhTvC7JJ3WhEc6YUt9zsGZqYCObSe7kZFbHsp2ry3Njqbh2C5ql3ECrtbxxhPxUNsCcrUNuklDEe/EmP15f2NerSv6BdV+JBGO8GHHD9H2Shj+OCY0lAgwbtlnQbijTtzCPc/NT6BAKGy0FN74uuhnTumoZJkMgdCX6cH/CKw3G4fH7qIy+ShTt26+IXXJCtrjzAunJYyxMBY0WLwqpHLKUy/Nq4mY8fKWHdczZG2C0rG5wBnu9qDFWRXMWn/+259imvF1rtgQUlJGCZXQ/yt9zjdcZhTWzUrHxoUC8D2HwZrZqtNBn5fd7cKHdWS8HRbF25wG4E=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 12:49:36.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb3a1bf-b31b-4b20-e63f-08d740eda82c
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4537
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-24_05:2019-09-23,2019-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909240127
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the LTC2947 device devicetree bindings.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../bindings/hwmon/adi,ltc2947.yaml           | 101 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
new file mode 100644
index 000000000000..2ea0187421d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
@@ -0,0 +1,101 @@
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
+      - enum: [0, 1, 2, 3]
+      - minItems: 2
+      - maxItems: 2
+    default: [0, 0]
+
+  adi,accumulation-deadband-microamp:
+    description:
+      This property controls the Accumulation Dead band which allows to set the
+      level of current below which no accumulation takes place.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 255
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
+      - enum: [0, 1]
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
+      - enum: [0, 1, 2]
+      - minItems: 2
+      - maxItems: 2
+    default: [0, 0]
+
+required:
+  - compatible
+  - reg
+
+
+examples:
+  - |
+    spi0 {
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
index 889f38c1c930..820bdde2044b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9505,6 +9505,7 @@ F:	drivers/hwmon/ltc2947-core.c
 F:	drivers/hwmon/ltc2947-spi.c
 F:	drivers/hwmon/ltc2947-i2c.c
 F:	drivers/hwmon/ltc2947.h
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
 
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
-- 
2.23.0

