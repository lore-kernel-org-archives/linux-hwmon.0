Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D1CC00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 17:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiHJRRh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 13:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233444AbiHJRRG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 13:17:06 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0937CB65
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 10:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMJTnB8WBbUC4LxNztQkuMfMsiiVuUmgQ99HpAO2/sNmgkgl7kcJ0evouY6sO0hi1Bls1vr8Gfx1T3jDAC+rwc4L9ck/M+BFigC2WUaKS/vMbbplaiZUHx3NGh+yxIt69ER+F+vE2FxVYYnCSlzAEg1x6pAd1m6M7gWMWhVQ6G4JxlRDlnHAidlrv30Yxbt3VH1JSmk/JDggFzASEz7lMBfNhz4Nl2YCh06vtRwL8gREddVxmCoRFZc3Ch5CJpv0Su7VpZ6Yvm14TCMAU5/z0ztHhtE3hc9HkfvReLGOaZgc2wiXYlwlNH9KVoNhYkCE4HqRxx1OLNfY5+zS56nCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkXvzgpj9E7kz/YhpR0nhPtHcC4y60tSoMNu3L4uW00=;
 b=KBYlb4h+LkxS5xTXF7xsiXxnOFpMhW09Yjez++xCys3rdUdz4V9n+/yneBZlR0BC6CerX3n4oA9BSLZOobiwHBwnQJMVzP/l3am31YvgY7R31Mb6A9qeDZcxMIlfQYpBGEO1CerB+i+JdeYaDvtxlPPDvablae8rAxg42n3H+NGYbbwqJgFGH+TXMA0jpihRUWUWsd+wUkIQuHK7vBgZwUbR9KegxgXKT/hHHTqRN/aqlO8D1mutqs32jj0WA3lUY5ZSbliCnNfZC8QHASPXc4EJ5OYMllmUi/mjXmLD4S7eIxXXEArZHhvQNxa2xXatV8RTsGd601B38Jf8BNL5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkXvzgpj9E7kz/YhpR0nhPtHcC4y60tSoMNu3L4uW00=;
 b=tYzElxQQTLwGdaGa0eDk3ozEZPSrEe/Xf4EYe7maTojInf8Z01ysLQUxnz/MCXS0eM+yAeuGqreyr4oKP2fwx5yeMlwxsg48KK3XBWTwuhdScZIfYLwS5eFjMxLlYN76kJ3VbWsuOYNDXcEkN8gxUzy4I0+SUPOjOT2fyFNnvZMsS8WOv3M7IP2RZg2xW31VwDv1QdzO82gQd7VCRiLHVyyw1msN810FFtVsexa0eu827xbcPmlYvghkb/N4LQDf5osiTsbnqKA/V4OtAbP4Md12oC4azoZ7CGlEUsrjWVjVjSBGzNImGhDUOuAQhJeqRKkePY6JzCXhcH49RdIMPw==
Received: from BN0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:408:141::35)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Wed, 10 Aug
 2022 17:16:15 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::f) by BN0PR07CA0008.outlook.office365.com
 (2603:10b6:408:141::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 10 Aug 2022 17:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 17:16:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 10 Aug 2022 17:16:02 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 10 Aug 2022 10:16:01 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 10 Aug 2022 10:16:00 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v5 3/3] docs: hwmon: add emc2305.rst to docs
Date:   Wed, 10 Aug 2022 20:15:52 +0300
Message-ID: <20220810171552.56417-4-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220810171552.56417-1-michaelsh@nvidia.com>
References: <20220810171552.56417-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fc9124b-6345-49cd-3e29-08da7af40837
X-MS-TrafficTypeDiagnostic: DM6PR12MB4372:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwAFpl3310eL2A09RR8en1EeCrJQZQtMG/TGcxiqr16k+HRSJW7yv0A9TyKkkFsmyX1t35PCqDTru8t1d0zB/RuB1NOxu3NBr4AoTnabzC5+zyYluNAIJCluLeHJgl2QL0jdA9whUmag5z6MLNd5eyrrV8WpbYJcYf8JEu+uQESCfrvmNu1oXKdn1l9qAE2MR7T4AKNZjZNwwdxPLgUkQzjfNkZwKW8/rdcH8J5t1u8AsEMjGScsLxcWrcF4E433xAov0jO1+OJ38UXiY0gqjCA7Ixbt0CU8PJkEX93x7wYzcxW6uqvCWs9ZsheqpnuDKdqAxhXx8u92Kb3m347Zvlq+wXgl9elQ5DiUvHh6pll1Px0k21aZUqZEHY4f4y5og08uwGaWBOlqmTO4tw9/pIH5dBotucf79wNNamQOhCL36vDB86Y8XAFkmLy+C8xEoQE0i0ObV3/mCYrDjMWST2HWOF+Dmb7t0z3WexmC51p8iZBEs4K19tzFjrCNGQO/wyWI/VOOBLbVlwC+5+6grrvroK0KRAl1y8Aj5sTpW+ADfAyMjoXxQDS6eaE2GNXuvcoVMwS9Y49MPLYRlE56XOJxogHIMvXRXGbAj5IDB8hIxCGnfWrw0id9er+nM/2t9Mfm9S5spDknWXDSNC0tlfdm1qqbJCxPyHWlr24f4iB6KYRDFTgSjLJrhnymiem0uFrMjIjCRPT8u0QGha+q6wp8V7waOAtYdyYZ5kAX1xAtiAVRm/xzkg7SWDs0u3YPq9qOw6snV3ztd6cSvMK4KakG7jwTlYuuD3pggJruiwKLQuOm1v7C0h+MhWCq7s5wMePxH636CIyOlXzzcvTVJTQ8fYEVRhSp5b2K84t7rQ1PQCyI7rAgqIGHY/+r7ETAkiRpfPScOjIlE8f8sLAki/V7fY9wdRkoeLckIxr53dc=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(40470700004)(36840700001)(46966006)(336012)(426003)(47076005)(186003)(1076003)(107886003)(2616005)(8936002)(26005)(5660300002)(6666004)(36756003)(82310400005)(966005)(41300700001)(478600001)(81166007)(40460700003)(36860700001)(82740400003)(356005)(86362001)(40480700001)(6916009)(54906003)(2906002)(2876002)(316002)(8676002)(70206006)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 17:16:15.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc9124b-6345-49cd-3e29-08da7af40837
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add description of emc2305 driver.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2
- Add document to index.rst
---
 Documentation/hwmon/emc2305.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/hwmon/emc2305.rst

diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
new file mode 100644
index 000000000000..258da49d18f9
--- /dev/null
+++ b/Documentation/hwmon/emc2305.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver emc2305
+=====================
+
+Supported chips:
+   Microchip EMC2305, EMC2303, EMC2302, EMC2301
+
+   Addresses scanned: I2C 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d
+   Prefixes: 'emc2305'
+
+   Datasheet: Publicly available at the Microchip website :
+      https://www.microchip.com/en-us/product/EMC2305
+
+Description:
+-----------
+This driver implements support for Microchip EMC2301/2/3/5 RPM-based PWM Fan Controller.
+The EMC2305 Fan Controller supports up to 5 independently controlled PWM fan drives.
+Fan rotation speeds are reported in RPM.
+The driver supports the RPM-based PWM control to keep a fan at the desired speed.
+The driver provides the possibility to have one common PWM interface for all FANs
+or up to the maximum available or configured independent PWMs.
+
+The driver provides the following sysfs interfaces in hwmon subsystem:
+
+================= == ===================================================
+fan[1-5]_fault    RO files for tachometers TACH1-TACH5 fault indication
+fan[1-5]_input    RO files for tachometers TACH1-TACH5 input (in RPM)
+pwm[1-5]          RW file for fan[1-5] target duty cycle (0..255)
+================= == ===================================================
+
+sysfs interfaces in thermal subsystem:
+
+================= == ========================================================================
+cur_state         RW file for the current cooling state of the cooling device (0..max_state)
+max_state         RO file for the maximum cooling state of the cooling device
+================= == ========================================================================
+
+Configuration is possible via device tree:
+Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f7113b0f8b2a..83b082d222af 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -63,6 +63,7 @@ Hardware Monitoring Kernel Drivers
    ds620
    emc1403
    emc2103
+   emc2305
    emc6w201
    f71805f
    f71882fg
-- 
2.14.1

