Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E145C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 17:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F282D6145E
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 17:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237161AbhEGRQo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 13:16:44 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com ([40.107.223.41]:27616
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234482AbhEGRQm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 13:16:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7UTFOZfdMw7xhVXGML4dRSJ5BM2xCSjkG/MCLdTJ++nfN9yh7X7RjTdDzZV5Ls27BsoJEw8fcz5jyuwRhcesxy/172e6YLVls/l/ILq/BoRzqZTSLLc/YJNcjTzerrIIKGaDR0Mo9gJHFdrnMmsihawIAyj1UU5wYCiCprXG3g8x4WoLRcF7yh8mbaOt2oNqKkKnVYZNQ3j1vs/6kTr1ybEAec4SPasfbAWmZ8hQx/oM80CcTHclA4mn595e2PG5/wztowIZN9f9IiJLYZ08ZSRos6y6W2jddKXBh9I3kpIyWJe1AIdH812d5lKyY/CsXXcr0wqR1PiWw0c5epHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=Tr0Efr9EbQPZYlNdJw9tNEuhpX+qL9RQEUpK/I1XYTKPF/eX0/QmIloJSYSvAQDFOJKKdBp0Kp57guTJBam0Q1r+CQSOFnc8hCG8AVmf5vaNJj6F8a8/uHK5isR11jPOv0LRD+V0L96wiCIRhqBtHsKrZTmMg8F83H/6YlF/lfZ4fyzdx7OTtbG7LDIofECKviwg3r+Y+c+iCLYaMZvl1y7vdxv0Gx5UTvFsUlQtwpjpy6rzZE7zAjVmWkXPpfbR2KsFsVz1xpqP/2vzdd2W6NOWAzPysTsMhXKhh8vFRSxJ2w2MBB8WM6QPq/BoeQ788Teyfrzxq05Cubxf/acZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=pYq2mw8uOxjWq1qgcifaeBNqrNNVpNXx3BLIN8YJ5g7dDafItFFHNf8P2BKyZRle3qeCvNysH2yhW+JgUG8zxYf+0GehB4EocCqbVboO8k+NghqoECoLszJXz1l3Gl6kJTsTKznKFCdz1AyErDUKIP/yDdNXheda3vWx2uWgEERf+Gkfp3Q2XSHmyGY9/yQrtEvdZFLhBrpz8FrT9rwY54519xBEMuwEVj3M8VqSjiN9f7g7jI3w5yFxLobChcJdQ9PyAKfTiOzvZ+1N6W2rk/bsOz5pR+d9rQklbnE/YUzeQ311H4j/RVMCDrkOcu2LxZOTs3hj/PngL2beH3AZdQ==
Received: from MWHPR19CA0070.namprd19.prod.outlook.com (2603:10b6:300:94::32)
 by BL0PR12MB2564.namprd12.prod.outlook.com (2603:10b6:207:49::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 17:15:41 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::91) by MWHPR19CA0070.outlook.office365.com
 (2603:10b6:300:94::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Fri, 7 May 2021 17:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 17:15:41 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 17:15:39 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v6 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Fri, 7 May 2021 20:14:21 +0300
Message-ID: <20210507171421.425817-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210507171421.425817-1-vadimp@nvidia.com>
References: <20210507171421.425817-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08508781-01ea-46ae-d2df-08d9117bbdbf
X-MS-TrafficTypeDiagnostic: BL0PR12MB2564:
X-Microsoft-Antispam-PRVS: <BL0PR12MB256490FBA3246BCA0D56FFA4AF579@BL0PR12MB2564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3zzegUaYkAezrSkdR1zNEdWBvMnoKGqR0OcS9iNHL651tOBfmklpw0zlHG7yGi25uSK20UIxHjY6KqTHW14hyU0qnBSjAG3qz7zy6BGUtJkE0qXKv152hOTp+KzzfVMdKyhAkkF2ySqw0XEw/w1AgXCm+Kl4prIDXBK10wawukiFH4UKz0sbyckpDtux/LSGia2FzBajcHvLQ/uaUB1DYSEW1fKoA5dG51V1UWRXuwoTrcuFbdxdMIWELAuRlfLi4G4aLbsA7nraWWb7ssyGXirQdEiwPUX2iNsz20UAw4aKIT7qC4AXRTFei6hZZ6JT8o/obVSTsW8kupTpSfiSRrjCF5txwsL1CQmzn9I94CSRSFSrjrgV/sVfYFhA7sUGAO9u+GP6qtpwFXl4H/Mynu4aq4G8eu1aa65HXREHAV/1Vgm7+74B7BzbtIo5agyy924vWjeqF345N/raVM4GgM1owKokAh3HwpSt1kb405v4mUgY7Xoo0jYpC5tkoSGVKilF2NuNJ2iEMjEMBG92l4G4eh5G/0khNnjRF+ZmxTao4lTIIg6pVeongEJFXBvsypgyGffEYE4aNcLse0ptSM4qQ1nt5nVfYHdXfO7tg94s6CKkwEfemQnYAxm0/uWzYQRAC+K+Lh9djox6JtSUOaSoKbaB9/6VCJpSv3Jiqyw=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(5660300002)(8676002)(36860700001)(36906005)(47076005)(2906002)(70586007)(336012)(2616005)(54906003)(110136005)(6666004)(426003)(316002)(8936002)(70206006)(4744005)(36756003)(82310400003)(478600001)(86362001)(82740400003)(7636003)(356005)(107886003)(26005)(1076003)(186003)(16526019)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 17:15:41.0611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08508781-01ea-46ae-d2df-08d9117bbdbf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2564
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
controller.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..4f6d149bfb3f 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -98,6 +98,8 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2888
+          - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
             # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
-- 
2.11.0

