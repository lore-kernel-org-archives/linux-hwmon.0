Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A576CC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Jun 2022 16:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbiFWQwr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbiFWQwg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Jun 2022 12:52:36 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2071.outbound.protection.outlook.com [40.107.96.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDD52BE3;
        Thu, 23 Jun 2022 09:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUjncUAMflZeq+o5jOy6krCaKsk+0am9hTAGBGTEVZEAbj7YONIjCDMhk5Dp/UWjZFDn3VoE3G2TJyBAG18jL2OhccM4NGfxzoo51VGVhk7V3nREWzkH1ba/g8a6wDxqyIJUhsmqPgNuEgeLRBxdVmFjpUrJpR6u0ZlzNFvqVuF2w0paVOJdq7KjzPYmkN6pUOUbP6Fc0wNXPjA2cQcUbAGkCvud8ZNAKX9TqvOsb8GvAIAU83Jx2qPFXi0polm6BBcC9/Q6KJVqPKS524qegyK685gYqxTNGYSOC/ilUMJYKvcolPMPsoCiy27O2mAntbw53crMQwKxz7ZIjWfWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWFp8Y8E137ojxGaPPH6m0beGhyonHW+pi5ZQxTnn/Y=;
 b=NEwz2EUi674Ku4ZtaoQHTWi6ikMaU1hnZCKEQZAWt7SvSDiJAK6tgkviEZvaQhhZsK5TsA4iLD3qPY1Bl0FHlDdhvslrqhpE1GfIVGqx0wLIEXhdicESZsGMFqtQ/jvb3EfsYzFgG2T/4/KVZk9eP8L28ZUSyq3KBRRWSzxyf3+bA1JSHAOyR9wvQ6f5OqVVJp4CnbBJ/4beL0PBPkUROHzoTPXSx3iPJrkV06cli1vBivjJmLqJDWS+8/XR/vOZuoBFojvIZ44hjpHPOshG/Ejir/ssFQ0iFZjBi/2TaujRtu0WrHF9Yn0fLFbgJ1jWB2qfnV/fqiAo3P2knEplTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWFp8Y8E137ojxGaPPH6m0beGhyonHW+pi5ZQxTnn/Y=;
 b=GAzd5E+ZUDjyCqNOV9dCJ9MAtVmXJmrpD3FJOm07THY3ih3CRSTUthtQZsxJHvu+pKNRUkN+wriB3dS2V/Z9GQYkAyOFy3SJaXMOmRs2EJhOo5ztGMHK+CzfTufmZCq6MyVg1X+Z42w+k9QO3KQc5UdPEomLq/poDhS4EFxBeaLs4xx0rtB9PbxxXR8jsZSe78TalrPvmyTMUtD33zZgZHZT6Fd8KbkEfq7xmvf+qUxc1mJInzN1GEC76AL/AuwnQHmwuxqigcyJu4mMga57+Z2aAQ4HwUFcedL8lj3MHXwA8XP0l0tUPQJ5/CDbsr5SH3Bk2KqzADwjSu+tCPNVnQ==
Received: from MWHPR19CA0052.namprd19.prod.outlook.com (2603:10b6:300:94::14)
 by MW2PR12MB4668.namprd12.prod.outlook.com (2603:10b6:302:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 16:52:29 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::c4) by MWHPR19CA0052.outlook.office365.com
 (2603:10b6:300:94::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Thu, 23 Jun 2022 16:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 16:52:28 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 23 Jun 2022 16:52:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 23 Jun 2022 09:52:27 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 23 Jun 2022 09:52:26 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v4 2/3] dt-bindings: hwmon: add Microchip EMC2305 fan controller.
Date:   Thu, 23 Jun 2022 19:52:16 +0300
Message-ID: <20220623165217.59252-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220623165217.59252-1-michaelsh@nvidia.com>
References: <20220623165217.59252-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2204efc1-bc24-4c71-235e-08da5538c207
X-MS-TrafficTypeDiagnostic: MW2PR12MB4668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kAD1E5jIm3wb6ticpxVQLB79nG+n6zjorz29RpnrNImUQ97Y4e76vDpMTROT?=
 =?us-ascii?Q?MmZS3ZszujgxSKgAyv8Q+RJGQ1bs7MiUL94OnugUE2c8q5rHm8SKTWG66Zz/?=
 =?us-ascii?Q?1i1IdnZnJaKDLEedV2uART53HIaZ6tZIEvS/3jhxL3+oLUsu2n+U1A+zVAJj?=
 =?us-ascii?Q?zP9l+xz3vQMorI3brJnfl9Ye5KbL3SKFU153/XmZTskCOR7RdeYS04Xdmfx/?=
 =?us-ascii?Q?tYVH6ikJSnl64dDS/rp/5JFGv6wQq0XkhRdSKrVmVR5jB5c3pgxxzSRXqGlp?=
 =?us-ascii?Q?HO/Vz40W0xCXaVUTHZFjf2iBZoJCLlQc8kgR4phVUmxHOk5SFMPzPIL90Bep?=
 =?us-ascii?Q?z3yrcUDgZORbQTqNUH04nd/Ow6R99htBLO8I6Uinnfhxxvh19UBz8uHAGpyQ?=
 =?us-ascii?Q?+wf1EBUuYR0HSZwD8T4t3dDOyCLvTBwFP9fbKQbpa2Oodu92HDvLGg+sEHkm?=
 =?us-ascii?Q?UxMQnQ/Cz5cW1CQBaLedWGyL8BUW2/mCyNztQ1Au13ID3POX5fXFLasItYLM?=
 =?us-ascii?Q?3OFbGBd/p0zGq/8SvcIpK3TCjJFP7WbGpXBdrmh5NFj2oqhkgpkLJbaIjVEr?=
 =?us-ascii?Q?RVAJ/nsxWY060AAqBAPTGqbfEBDup5M07gZmlDC9uEYzYyGq3QIUDf5wAJd/?=
 =?us-ascii?Q?EkdaCeC0fFFC5xjQbTkKENYIG7agPweBDn5T46eHCgdMjAUrsjDzyRhxzvVJ?=
 =?us-ascii?Q?rjRlW6+610TPaKiEo0J0P9j/DzFNGxWP8cSXkxTCqLZjVsEmRrkNcSCao4ag?=
 =?us-ascii?Q?B6SZOYMftxkU760w46kqL8gR+jmG0tI2OplTSFL5h0mXQ5tPqa8M182klp4f?=
 =?us-ascii?Q?gKsoliKCz3+2bNoySjARW4ePxpNML6/m7Cf9mlWp5Y6huyBzEcq0y3JulsXZ?=
 =?us-ascii?Q?ZFCmCoXo6wq7jnuPdCI2LW4IjVfJIJ2cvSup487kq0l9V+vQBwwkj1+BCkOU?=
 =?us-ascii?Q?GL9wktYX4ot+6dJ5Nu9FjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(36840700001)(46966006)(40470700004)(86362001)(26005)(966005)(2906002)(478600001)(2876002)(6666004)(83380400001)(40460700003)(41300700001)(36860700001)(2616005)(47076005)(81166007)(426003)(82310400005)(336012)(186003)(8676002)(316002)(110136005)(356005)(8936002)(36756003)(4326008)(1076003)(40480700001)(82740400003)(107886003)(5660300002)(54906003)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:52:28.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2204efc1-bc24-4c71-235e-08da5538c207
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB4668
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

