Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE7C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 May 2022 17:05:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiE2RFw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 May 2022 13:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiE2RFu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 May 2022 13:05:50 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2069.outbound.protection.outlook.com [40.107.100.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C685C87A31;
        Sun, 29 May 2022 10:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU4ve0y3nWpWe2TzyTs/ZyQsFrV5OuqyF4mFpGzfijz56uO8ddQGw9ND/z/dl3265K6T/azugT+Kf9knHt8e6CO64p15shxW04I+V85f+w/r2npZow70zFz8NuLgHnreH8ZJdkzkUXuU9qxNuJS3LGRZpRqC8uN5zZpZGOXYtqhOZKSMf2dr9WnIpdvwc3IXNW6o8KIqijrSUBOGARBCdj8jFzoY1tkNe9q3hnPxA77zXy5veU46u4f3mXM3X+2boXXuQ0L6yxr3JoCnSIi2XACPv/+oxVIDiUBSw5HB9kWXCXKnQOfQtzvusRFKdlluMxsAroearPOpqLUk0u4mGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWFp8Y8E137ojxGaPPH6m0beGhyonHW+pi5ZQxTnn/Y=;
 b=M0X5KL915G1KC6CbLem3KUr4D3Etvt2BTC/M8YFO1DQSold1CiCnRt7ox9W8dLN3ipz2faTsVzhlxDdUTEOt8+k82n6J2kAWFqIJrMYDIrKwgnFzoGovcnirlUYpulJiiFY3wrHIbuISZFpTvNkJACPXXp9MXNV2kTpWwwawUSf+rWjFrGafafGzVhxkgJI0r7kn40HfpB7HKoIxnasnw3W039v5ULR9JMeauk7/r3FwunMwFbp2Rwo7yMOBQ4c8XAe3ynneRynieNSfSx2g6vLyHO9xZeuU4rZKuwMc8QXhRTv5y12VW8IKTWbWO/81OKhCAyb4hxBgR95/AJ3NOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWFp8Y8E137ojxGaPPH6m0beGhyonHW+pi5ZQxTnn/Y=;
 b=A/kMZR/WBTz5gr2XlHRY4DnWYbXUOL0hQ5te83SUrraqipxuR9cj6O38jr/yI12gBcTNrt0hV93DblVdSS4r2BW7FcWN241JZrRbsyZLkA4uhdflvLUkXjvr4IDZmt0xEAeMrzU80VDkCWJtGbBaiCUrTGi36aaEmikk31rTy7XCHBCf7C1de15obtxlLbijaViz/ZiZicln1KNy2Az09ZUgf3qYUqJIh/IJ3A2TWySzysq2FEiDJUzEpgPT6FyegGr/kEj2wZpugc3cUPti/T4WfdeMJQ97+2domfTLkSEYJgCm+6YpFpLdQSXQjfNmavH9wPxyRp09Sw8QdZQUCQ==
Received: from DM5PR10CA0007.namprd10.prod.outlook.com (2603:10b6:4:2::17) by
 CY4PR1201MB0214.namprd12.prod.outlook.com (2603:10b6:910:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Sun, 29 May
 2022 17:05:48 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::10) by DM5PR10CA0007.outlook.office365.com
 (2603:10b6:4:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Sun, 29 May 2022 17:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Sun, 29 May 2022 17:05:47 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sun, 29 May
 2022 17:05:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 29 May
 2022 10:05:46 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sun, 29 May 2022 10:05:44 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v3 2/3] dt-bindings: hwmon: add Microchip EMC2305 fan controller.
Date:   Sun, 29 May 2022 20:05:35 +0300
Message-ID: <20220529170536.10043-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220529170536.10043-1-michaelsh@nvidia.com>
References: <20220529170536.10043-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c07a80aa-c066-4371-53da-08da41957a11
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0214:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0214032106E53AB1CE470FDFD4DA9@CY4PR1201MB0214.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlo0DXYl3IhlP3MzDWtm/RSZqMPVZqOiiG2muqR3MwC7pYvQreJEQ99HbZk9oMDJ6B8VbHjlgWQnU0ZnDA7HFvtlRbUpdG7iia8Fr7ZDUKc8wdpisY3dI5DlYhnW8mSiQ/P2hKSdpUg1qSA5jKeosT5Du6ujgCXseJsJFi/K948xdaG3AabnEZMIzJKPvY77v8sDgALywhhKTTbV3gTvurTcmnbXX4uHnOHHQNFwPvldIvzODWbaLL83H9nbO1oWLkOrO7DxqSKew0zojHpLqfOCD3drYXUj2lp2V0MB0J7vRH0fdTrNAYLwDC8GaeQfxLEYepZ3UytB9CoTgGnf2+JjcpMjAmDMLS11hVCvXBqGlWCjzaX+uUTh1ZkcMezuF9sFMP9OD0zdlokRPXZ52z3Ki96j7kCe5cRK7EnIKWiC8JWCR1QMJQpD8/iiYVP0pvc34QIDFA9AoueIZpKF7OYcIkiKBYYKwXZ3TzTyOXyYC10Gi8Yc5hlF2R0aISPIsCDLKgbXUJ/T8e5F7VN51o0CiscXnl7PCie5icWCQgMqNJBCNWkS1Z131MaXmfW/g42LU0qe8Y2hNErPO9Et7k4Ct3W4D72Cp3+ZpTw2gNy/3IG5+9Hkeh7sM+LbiDX/uWgY+15mDye4tVmmlgavlGYdfoGqYSs1Pgf/BwgxyYQEmm4ZY7ZOVdDM6YFsSJaE0+mgqc42qlwZdqPJsf/GhwT0BcuqIMgmzHECKSLLgum87j65OFFHe32sjr3enEauRrZ7ikhJVoJA2UQXG3g5aOgY6d6vncKXjhhmLzx/Nq9ZTK1WB9hY5RFDpVDbDBA3Ew6+L7VKHbdzUknIrB7oxg==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(2616005)(81166007)(70206006)(966005)(40460700003)(36756003)(70586007)(107886003)(356005)(336012)(186003)(426003)(36860700001)(508600001)(8936002)(83380400001)(1076003)(26005)(8676002)(4326008)(6666004)(86362001)(2876002)(47076005)(2906002)(54906003)(110136005)(5660300002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2022 17:05:47.8985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c07a80aa-c066-4371-53da-08da41957a11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add basic description of emc2305 driver device tree binding.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3
Changes pointed out by Rob Herring and Guenter Roeck:
- Describe separate channels of fan-controller;
- Remove pwm_max property;
- Fix compatible property.
Changes added by Michael Shych:
- Fix dt binding check warnings.
v1->v2
- Fix dt binding check errors;
- Add descriptions;
- Add missing fields;
- Change the patch subject name;
- Separate pwm-min, pwm-max per PWM channel.
---
 .../bindings/hwmon/microchip,emc2305.yaml          | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
new file mode 100644
index 000000000000..d054ba46ae23
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
+
+maintainers:
+  - Michael Shych <michaelsh@nvidia.com>
+
+description: |
+  Microchip EMC2301/2/3/5 are RPM-based PWM Fan Controller.
+  The Fan Controller supports up to 5 independently controlled PWM fan drives.
+  Fan rotation speeds are reported in RPM.
+
+  Datasheet: https://www.microchip.com/en-us/product/EMC2305
+
+additionalProperties: false
+
+properties:
+  compatible:
+    enum:
+      - microchip,emc2305
+      - microchip,emc2303
+      - microchip,emc2302
+      - microchip,emc2301
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  microchip,cooling-levels:
+    description:
+      Quantity of cooling level state.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 0
+    maximum: 255
+
+  microchip,pwm-separate:
+    description:
+      This flag indicates that separate PWM setting will be used
+      for different channels.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+patternProperties:
+  "^channel@[0-4]$":
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        items:
+          - enum:
+              - 0
+              - 1
+              - 2
+              - 3
+              - 4
+
+      pwm-min:
+        description:
+          Min pwm of emc2305 channel
+        $ref: /schemas/types.yaml#/definitions/uint8
+        minimum: 0
+        maximum: 255
+
+    required:
+      - reg
+
+required:
+  - compatible
+
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan-controller@4d {
+            compatible = "microchip,emc2305";
+            reg = <0x4d>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            microchip,pwm-separate;
+            microchip,cooling-levels = /bits/ 8 <10>;
+
+            channel@0 {
+                reg = <0>;
+                pwm-min = /bits/ 8 <0>;
+            };
+            channel@1 {
+                reg = <1>;
+                pwm-min = /bits/ 8 <0>;
+            };
+        };
+    };
+
-- 
2.14.1

