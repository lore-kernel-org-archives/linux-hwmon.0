Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780E7C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Apr 2022 11:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241620AbiD3Lwk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Apr 2022 07:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241588AbiD3Lwj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Apr 2022 07:52:39 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDD775E6A;
        Sat, 30 Apr 2022 04:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5kBkeJnBra3Wv/b0eW0K06L9qjVCEd8Qudwy4rObFnW7xnYg9LDQYq9fIPIwydSVNhjtUbwhRwgGLvSWqlIZoyGwKdacVxN8qOtvJ9VJzqAxoVKFI2vRhx3SCRIT+oB6bcLeK5fIbKr98sJf7FRRhQgZ3cxwGEJIZbEt/hFzlMo7D9Vs0Xr06ENcDmEMzDX69gYOuSlZJcLVMpddY1Zc2JLhJmC8LBpG9kilCCMQArK1UnF08D5tx7OJvQ6nnceI4yp7WJ5t3DKf2+Cqg22HtUYueNOvUvJYaPWmA5VA3DXQ61hr9kt0qA26AufmVtgewGYAFcXrDNS7XoXubIpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9jdKxtx8WcJr4yZEaNDT5nym8djHvwy9vhJuKmrz6Q=;
 b=mAyu6mhELKxm3uMdsdPA35YZLUXKj6tWFc+XgQFBk2TidCUHUlw/SezB0P0cmncB90yEDPW3K86ej+Htr/6cZae3XUqiIip2OAwBBgO92ddU+euaO5n2EHSgTHgntSwVJ1d6+iQpAOlj2WmdWNvWlkywFQaYvRr8rcdHJ+oTb5bngCD3mKCQvNvHyCW/VNJBhvjv3g2PSkWwcLhNltHenY997P3bSUKVjLr6cGH4bCErruuRERFZl165FQ/PT6V94iDFp3LoIa0tpPJeBytqT8ssRsGHVv2bBqXUfOVyB+MFXaf1ZOEYRAsbkHCd5ezi5M4xD51FCqAM86ddDOkEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9jdKxtx8WcJr4yZEaNDT5nym8djHvwy9vhJuKmrz6Q=;
 b=UxOSQz7/zs4AbRLKuNqjSUWH08R1X3BLmibeOw6P/CXDUxW9TS9DKQUoB3YAl3a9y94Y6fKHu6Po1fVbEhQfrAPj3tI0vmHlNpq7dkOA/Hn56CZLZN3w4XoZohDbQ/iiJOr8Rho69tygoOcbsnBpe9Io69ZmCkOIp+ZiuGqh/zO/jcct9bGuBfYN0JuT8LyLGTwKDefgn/J2CJo7kJ1xQZKXYeVgdwntvoPOp8i94+lmO0RIhVFTcTOYiDmCVpOdvYJlDumZxyVq8xKta9si2xpD568vbc3pSIzdo0N4HGEto0nwwt+nxY0JBfK77wxdU5YQ0mw7UJw/ApW8kwGKoQ==
Received: from DM6PR03CA0052.namprd03.prod.outlook.com (2603:10b6:5:100::29)
 by BN8PR12MB3603.namprd12.prod.outlook.com (2603:10b6:408:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 30 Apr
 2022 11:49:15 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::2d) by DM6PR03CA0052.outlook.office365.com
 (2603:10b6:5:100::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Sat, 30 Apr 2022 11:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5206.12 via Frontend Transport; Sat, 30 Apr 2022 11:49:15 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sat, 30 Apr
 2022 11:49:15 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 30 Apr
 2022 04:49:14 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sat, 30 Apr 2022 04:49:12 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 2/3] dt-bindings: hwmon: add microchip,emc2306.yaml dt binding description.
Date:   Sat, 30 Apr 2022 14:49:04 +0300
Message-ID: <20220430114905.53448-3-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220430114905.53448-1-michaelsh@nvidia.com>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c53762d2-66d3-456f-2e86-08da2a9f73be
X-MS-TrafficTypeDiagnostic: BN8PR12MB3603:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB36036FB828A3532A8859439AD4FF9@BN8PR12MB3603.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bl7fkUl4Cun/4jZMUCnPxwkwJ1mVCvKS2jKfW0Ehu+5qYaB+MWGBvtxmloYx0R4Aw3UWEU69OmEbgmvNCQlk7FIf8hbb7WG3gVt+/8zz5OtX2zFLVji/BGbjvf7FTwq0vVBG8ihaphas3pGmP/sYXfK7Ry/5fOnmF9Ne5zSLQgzT2rb/58T9DA7RzOiJdzJLAVUZstieP7AQmTUknzuOywJNKfa23Pkm7GdP+bNfqt7JMMi8b+Sp209qjhAh9MkwNNJyHYHI49DAobIGP36qJGFhyOVyMOLuKyg6jgVCoYTJ3JtsIIFZgJE+5FUNOn+sz6emQ/xehgZW3T7iLMPoPidoOvyzx3auSi43xu0U6EjwHKe+4rUfWhSz/h6hb/lE1Haiv+i2+fIFp/HFTBehE+uql8eCgOB7N8s8REsXSkEFZKuA8jSBKNEA3akJ0aIBLodA0DQH4ATPrlWz7NaapmGuE5SOyVRgvcEccILnJWfYF8XQyiqDqkjIf+px47zsrcp3zpl7YQGjmQk3H7en2udHWTtuO6bQEMWd99bfHe1Q9HZJnEoQOkzTndwTQkipw69/4Yhjxdj5d4zN7pS+XzieuXrfTdtMNl3prZqH1GyywuZi6hQOKbQJ68JvIi0qn5KpwlSTvUj6dqDBM1k2U/DFqQs8SKwt4M1LRqIhgS/Fr5digZqvChlt8hhM2sS41esT0E1qf7yfN6VWC4jnvTBU+tdH1Ve2uP0xcy1Ql30hWMJq2RBW1NQWoS2igOUebVCVwZCG/zUeH7BXrmfgJwfAP4f3cS/LB2WhkyfZ1fq2/nP2bPJ9oPLn9QT8F9LOS3qwMTk/FBPfeo/WHVHwUA==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(36860700001)(966005)(40460700003)(8936002)(110136005)(8676002)(4326008)(86362001)(81166007)(70206006)(70586007)(316002)(2906002)(26005)(2876002)(54906003)(5660300002)(6666004)(336012)(47076005)(2616005)(1076003)(107886003)(426003)(82310400005)(186003)(36756003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 11:49:15.4950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c53762d2-66d3-456f-2e86-08da2a9f73be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3603
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add basic description of emc2305 driver device tree binding.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 .../bindings/hwmon/microchip,emc2305.yaml          | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
new file mode 100644
index 000000000000..c873172b7268
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/emc2305.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC2305 RPM-based PWM Fan Speed Controller
+
+properties:
+  compatible:
+    enum:
+      - microcip,emc2305
+
+  emc2305,pwm-min:
+    description:
+      Min pwm of emc2305
+    maxItems: 1
+  emc2305,pwm-max:
+    description:
+      Max pwm of emc2305
+    maxItems: 1
+  emc2305,pwm-channel:
+    description:
+      Max number of pwm channels
+    maxItems: 1
+  emcs205,max-state:
+    description:
+    maxItems: 1
+  emc2305,cooling-levels:
+    description:
+      Quantity of cooling level state.
+    maxItems: 1
+
+required:
+  - compatible
+
+optional:
+  - emc2305,min-pwm
+  - emc2305,max-pwm
+  - emc2305,pwm-channels
+  - emc2305,cooling-levels
+
+additionalProperties: false
+
+examples:
+  - |
+    fan {
+        emc2305,compatible = "microchip,emc2305";
+        emc2305,pwm-min = <0>;
+        emc2305,pwm-max = <255>;
+        emc2305,pwm-channel = <5>
+        emc2305,cooling-levels = <10>;
+    };
+
-- 
2.14.1

