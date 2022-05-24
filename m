Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16804C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 16:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbiEXQSN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 12:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239046AbiEXQSJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 12:18:09 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2049.outbound.protection.outlook.com [40.107.95.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4E36D4C1;
        Tue, 24 May 2022 09:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpeayUwrFm1HCHMwqloKCcUrpWHVXpTCzhvpa8mNo4MH+Stjsk43y6DHoTiiGDIPMJnFUSHKfXerb4vj4hRwfvKISZV7DqlidaOPYb6pA5gdHqaWPjGSu0A9qqCCeetVx2z/DwdaZ3hV7Algzb/8vswc9p6Q++Rz/N+hxznsVkNF5Sv1N5/JqVefZ4nn/2bKSrmBBM2AgFV4YnkiDn/VEc76gS8jBkL4l2yw9pyI9jfXMMZQ/5pSlkbgtVrjOhYGu8DU0ysRgcXGvs5Jh9MMbXPDdEt8Z0QikOt+wE4RGweQsfY1imO8SMJLmAI8BRADQIvsjDk56q98bZyTVm1GFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYZqyWO+MQCPB21k/Dt5DDj+yTY5WCL4UuEspA/K3Dc=;
 b=CogVFH5eCMMesaZsLU1Q2H5zqXMc/EF5ChFB1ZabqRIV3vHUm4JFS7+Svq5B4KA1dire41TRBnDN8VkoQUQJHiJfToUV8vGduaui9Gowmo53BSsbvh41s88SOA32BTYD80cJzROyLdEkVMOe1C6AoTwIqGxEkrODU6ZgbanYsbOn5jaut9FLGiIeDvGkDx8BPKfsE5jKgoEACN02lv3zVdMPc+2SHTXN1WHQ6VGaO4VEfSyL2VyB58HwSCreB1SHGpYCr4iCCHlvmIqreSvBTE5iiVuBuEkItMd8XsD8vHSPUTIetKJFqDIMDVp+0LCLRk7zb61m2x2Gt82KvquzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYZqyWO+MQCPB21k/Dt5DDj+yTY5WCL4UuEspA/K3Dc=;
 b=eyNbL+wA+GhnOaB6/mbwcSEzllimwzKbqnkdF240dUouzWFWV+f/cgj6ZA4YR9wenr7f+wTQx6S3d7c9flDuBF/RMsEAnJ+277uXfC/p5Hy67g+hjGJkKXpY1kh/OCAh42VcewCp0FaRtK4vkhORYFalf61cL6oshbS0bqGpIS5Mz52jx77/LYv336XRvRqQ+6P6IlOqBfmdfEjZvEy8BZ8ScGfw6C4NEPLt4ub3v5i59BGy6US/CeHsZ/+qtiyQqUwNYowy0ZNWzJES6I46jFFyKCkzKm6iVpMFchcpuoN+8DKX3WOE+UXAZjbAtsY8hvfhJvMfXknbER+Yd3K/1g==
Received: from DM6PR06CA0071.namprd06.prod.outlook.com (2603:10b6:5:54::48) by
 BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Tue, 24 May 2022 16:18:07 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::66) by DM6PR06CA0071.outlook.office365.com
 (2603:10b6:5:54::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.20 via Frontend
 Transport; Tue, 24 May 2022 16:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 16:18:06 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 24 May
 2022 16:18:05 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 09:18:04 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 24 May 2022 09:18:03 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v2 2/3] dt-bindings: hwmon: add Microchip EMC2305 fan controller.
Date:   Tue, 24 May 2022 19:17:54 +0300
Message-ID: <20220524161755.43833-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220524161755.43833-1-michaelsh@nvidia.com>
References: <20220524161755.43833-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb2470da-3643-49af-5471-08da3da0fcaa
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5221DF82E0CCD06013AC1527D4D79@BL1PR12MB5221.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6uR917PL16xdbftpEiD8bG13Gct8SOMO4siED/N2mnw4lXt3a5v6pwsIQscgdAIHwEFMmSQnzej5KhV8NNYnRzB1r5iHphErc8N8GMnblgyG7yofuyCtqH8YVj4zqQDvppQXc2juQMoP6Fc1kc/E2qSVjpVU7MzDUfELk9RPMsJk2JPlWCn772M4ZsWYB8RFn/KIia0yCFRyckFplwO8AfOKdEZfOYhGRKNmk3KlUuDOXjvxppWgSiY3k1keqJz3NgQ8JRsBk0ptNfNcAWsd4R8aKD5+VmsF2+kjwhVgqUFr89M+R/iQa+ULW3s5CgRK9icbqnrbg6yXLo2c2wIr38hUfR1IS1xLm3qMozzupyS5nmrF42qTtbTvebUeE0eo84ax2my5QR7jMQyMMfay2V/Y3hDq7zqeuEkRs2Wnuuzxl8+IX/T7RGsY5X0Zd6t9toN+3mgk64e9ktU/irUuIOrfoJmzRl2NTbXHMtCX5NKh1b4BbIFxlX1lV6FD4y9I6lr9b/vpp6opmvf3ZcCzJk+MzcbznusruUMLP6V3r7He13iHN81nyDnndiD8GnhmoZC2PS8jfxhQtfCwMxvaAtsjYi9N5lBYqBzLbgibYCghHPRC0Lj3kHeWVHSctJwVSRIhbK+V/ZvkBcx1rsRf0MNM8/zHYSI1kbrJBkcdHR/GK45vkwuvg/Zv3z/JJNyQILFQrK4nagAuge/6U2PhPAonApF1f64KsO/xfCCQ/+sVvks7g+56Yo4lWaEr9CKsNgKzE2yHzrirjq4X/xlkuyz5nHxcazwQgvYBABV+UHKx8+iJUtpvR9zO/OmpUZaD2UXdFMvlS39ML8e6mlZ4w==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(2876002)(2616005)(107886003)(1076003)(4326008)(186003)(70206006)(70586007)(6666004)(8676002)(508600001)(40460700003)(26005)(5660300002)(86362001)(8936002)(966005)(316002)(47076005)(356005)(36756003)(426003)(54906003)(82310400005)(336012)(81166007)(36860700001)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:18:06.8023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2470da-3643-49af-5471-08da3da0fcaa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add basic description of emc2305 driver device tree binding.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2
- Fix dt binding check errors;
- Add descriptions;
- Add missing fields;
- Change the patch subject name;
- Separate pwm-min, pwm-max per PWM channel.
---
 .../bindings/hwmon/microchip,emc2305.yaml          | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
new file mode 100644
index 000000000000..0aa65dcfd238
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -0,0 +1,87 @@
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
+properties:
+  compatible:
+    enum:
+      - microcip,emc2305
+      - microcip,emc2303
+      - microcip,emc2302
+      - microcip,emc2301
+
+  microchip,pwm-channel:
+    description:
+      Max number of pwm channels.
+      Zero index is used in case of one common PWM setting.
+      Number of used separted pwm channels can be less than
+      maximum number of available pwm chnnels on this FAN controller.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    items:
+      minimum: 0
+      maximum: 5
+      default: 0
+    maxItems: 1
+
+  microchip,cooling-levels:
+    description:
+      Quantity of cooling level state.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    items:
+      minimum: 0
+      maximum: 10
+      default: 10
+    maxItems: 1
+
+  microchip,pwm-min:
+    description:
+      Min pwm of emc2305
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 0
+    maxItems: 1
+
+  microchip,pwm-max:
+    description:
+      Max pwm of emc2305
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 255
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    fan {
+        microchip,compatible = "microchip,emc2305";
+        microchip,pwm-channel = <5>;
+        microchip,cooling-levels = <10>;
+        microchip,pwms {
+            pwm@0 {
+                      pwm-min = <0>;
+                      pwm-max = <255>;
+            };
+            pwm@1 {
+                      pwm-min = <0>;
+                      pwm-max = <255>;
+            };
+        };
+    };
+
-- 
2.14.1

