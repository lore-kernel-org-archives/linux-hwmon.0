Return-Path: <SRS0=U1Yy=YE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF41AECE58C
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Oct 2019 11:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 995CC21A4A
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Oct 2019 11:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="LUmic2Ik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfJKLtZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Oct 2019 07:49:25 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:10896 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727226AbfJKLtZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Oct 2019 07:49:25 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9BBiN85028521;
        Fri, 11 Oct 2019 07:48:35 -0400
Received: from nam03-dm3-obe.outbound.protection.outlook.com (mail-dm3nam03lp2057.outbound.protection.outlook.com [104.47.41.57])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ver39tu05-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 11 Oct 2019 07:48:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaFi85JfL2MOsWSGLp3w8MxNtiI9/nDjy64mgPZtLp7AnMtXftoG6I8F8ciM6ogpNuxGYEnxQ7Ch0m5gBgdpI2t37r6Y9L//B2MkgHK2IqgRAKMqh6VJ5Xig5/diiIIch278Smu2ir46Iu10a+WQAH7OifLUEX8O2PrwVsiSKGYqDCveBKnm5hEYapSKLU3+4uJXVcSxYfLVXVgDNSgBxhrKxUrAvrZhF+8Q9yHk3wnXU2nugHzV/5mOJ4Yf4svq3on9qDOZjG9lrh91rBNZ7q1qCKzdWqlY82JELyfE7TmkjWni8abaSBrV91s+5pTmKjxygn1eyXLygf2Mu4RUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptwhh1fdB9ltjmKoF0JwEnEGrKsQPEmzFRwtQghpgIk=;
 b=Ls5XJr7Vt0zW6Mure88vM/9NBED+jzxe9u4Xdph8YfUYPIsC76FkU4uXwX0Cvgf2oBXEESnGZC/n76gI/50wmmclhBpM71ZUk4MqVrirIgXtPsddmTZKZ8+vWFU/GZlzrFWaL7FwS/ZyLP/KVJtxVCxzd8zsvc20U11TRJy9zNAinm29V97udgVxDJp2ZUD9ixx8HUc9uCF/X06I9KyA3Bvt09bTs8EBWGPmKnn/OYrhesoIinRA60hMq7rjZbW+GM8M/R+qlqPkrJzM5DaJsuOfcgLnPBqIpBn9wFXXV0fCCHsAnwVmamtrluogo84cuaHgu5m9RoQITPVVLEbTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptwhh1fdB9ltjmKoF0JwEnEGrKsQPEmzFRwtQghpgIk=;
 b=LUmic2IkeR0njldM2ljwg/zoIp1G47Ql4e2CKRbxf0nT20GMRx1k1P/ORr1dz5ijgNuhVaDjjOrMF8Gz3sbJLG9Y1zIm2cKFdT0ii+RQvajO7CALVuTEXg3XDSQF2KsHabuXr2NH9wTYQ0L53j2+cj51GNDT2Qx3x8Py9MQMQMc=
Received: from BN8PR03CA0036.namprd03.prod.outlook.com (2603:10b6:408:94::49)
 by DM6PR03MB3417.namprd03.prod.outlook.com (2603:10b6:5:b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 11:48:32 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by BN8PR03CA0036.outlook.office365.com
 (2603:10b6:408:94::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 11 Oct 2019 11:48:32 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Fri, 11 Oct 2019 11:48:31 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9BBmPMN011930
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 11 Oct 2019 04:48:25 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 11 Oct
 2019 07:48:30 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Date:   Fri, 11 Oct 2019 13:48:53 +0200
Message-ID: <20191011114853.159327-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011114853.159327-1-nuno.sa@analog.com>
References: <20191011114853.159327-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(476003)(47776003)(8936002)(426003)(246002)(50226002)(7636002)(7736002)(305945005)(126002)(8676002)(2616005)(486006)(86362001)(36756003)(966005)(2201001)(6306002)(50466002)(11346002)(446003)(70206006)(70586007)(45776006)(5660300002)(53416004)(186003)(316002)(478600001)(16526019)(26005)(2870700001)(3846002)(6116002)(1076003)(336012)(5820100001)(4326008)(23676004)(76176011)(356004)(106002)(110136005)(6666004)(54906003)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB3417;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 473d8a6c-636c-4a4a-5110-08d74e40f0cb
X-MS-TrafficTypeDiagnostic: DM6PR03MB3417:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <DM6PR03MB34174B1B5BF42BA65A18346599970@DM6PR03MB3417.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzF+9AVi1sUGTeUyhYrmQ01Qv1PTuaLrJmNP36ILb/9D+iUJYeYf+sIMLWTK/arKlAQt+0HiAOwfhhT2f8Z5zX+3PoHhTYfmPWJHdkKMtHLpGGauFfp4uDyNAWVCAgja1h0XjzPB2vSy2VVZssG+ufCeizdkZ9lFQblHdjc/towNeGUEC9s+sqaX+FKtGOYTG3cvCEmpxcnDMknSOvATI9JHyqMJxijO3g/AmDsJ9VLTFrIwg0mgotc/lE+jJVXR8xcr7BMklXOPwF1FS7OIwIQSY3TuBjhSFU4XNyK7uhU3Ec5YfVD8xbaiUSh55xbLrkJjmWC7VfMJV5eCZHAk8qHJ+5ou3LuaI/aUE01NSLewfQVr4TkwXs2XzZyqS2UKzpvqDbRyF0IlBemMdYi2FzKUEYKlcqJ1FY9UojZhnyUXJyHsmWvG39CajukjpDiypUJ1Ae4Nn0hq8ta4uc/90Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 11:48:31.9783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 473d8a6c-636c-4a4a-5110-08d74e40f0cb
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3417
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910110112
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
index aed3d0de26cf..d6030fd9f887 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9637,6 +9637,7 @@ F:	drivers/hwmon/ltc2947-core.c
 F:	drivers/hwmon/ltc2947-spi.c
 F:	drivers/hwmon/ltc2947-i2c.c
 F:	drivers/hwmon/ltc2947.h
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
 
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
-- 
2.23.0

