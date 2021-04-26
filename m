Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4395C43460
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Apr 2021 22:18:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B2D16135D
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Apr 2021 22:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhDZWTR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Apr 2021 18:19:17 -0400
Received: from mail-dm6nam12on2048.outbound.protection.outlook.com ([40.107.243.48]:28603
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237304AbhDZWTQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Apr 2021 18:19:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVEGIMmZ61ZVjcNFuDE55+5N3oJoyWRQ4SyXpEuO2osyUK5fKHh++5tC+xqzaNRlviDUAMmOdnauscshskWtJr226gXOS76AK4YD0ZbMIyybmebDmwJ2IMcilb6yoR9DP17quM6vdh61KdI/alc4okZKUrZ6wX6kP8+tlbeH4wqDPst2/8TxrlwUUmTLVejKijkAmmeOd8IuRhY3aMy8Xza8UAT6MsPco5US2uh9ytdi/6R58F6w2fvt4vXzvMYNUHM4Pa6vFYamFfrWPHXShS6d9Zkenk3+vzscnColsjVyDGacCrsXvH5vyIz7SThGzp9OjC3ddDcwDZ0Xyir72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=Of8LDbfmOKMO+IMwt+XeHs43re40oP1XfemkOtEfRSg2wPWwWDYVAAqtRcXbX5gIaGMrQacz4uafSYn3xYbD8QykYqMLJZdYabI+gITh/2/uypD9r+keURa7psTuXlXF3ovHKaWHjQYVF1+u79r3rHiScv+3PojbOnsm25mQKlPjKB221nwhz+kDoUoRpZSmL9iuzi4OInzjca9+4xIxbF9s8Wc1RlkzPXbR/zw0WFfx6ntIZ13Qtaxk624CDLmFrgypTFgBZL8alNnt7f+vOvP49KnvZ1ZsFPeEeHXqRVZ3bxc41nsch40fLjyP7NGaPedTXcSzucqccvta8aLrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aE7IM7iYKt/W+SKrgxBrHNiE4sXG7cvlarVT7b+AP8=;
 b=q6d7Bf87wdJAmyu7MjW5crDg9fOSCbnRsHBvjx2vvLMkreflVLg27o+SLoa0XYgzvhoJO2ncELhPA8lQaqc4/MLp0y8dW9EnZdxh/WdSQDQa1kxxgQ66m3FoS6tAOKhKOQruRwf+lV53xoelP/c7NitInAVjfDm7i5hDHhYIqtV8nycdzH9GopeoTZ0KnZQMoOcUfrw0126lo656TVs6JfvjwZ8Toeh/UgVTQKg5m3BrVoIzSzqiFdXW9dz57aZx4bEQSJv2invqjBivPfyMFt5BKYYRUZNeKA3fOfj/KHkVIIl9hotXuvs1IvwwKWi1f/0Ggi3490U3+eTYLt5H1w==
Received: from DM6PR13CA0036.namprd13.prod.outlook.com (2603:10b6:5:bc::49) by
 MN2PR12MB3054.namprd12.prod.outlook.com (2603:10b6:208:d1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24; Mon, 26 Apr 2021 22:18:32 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::84) by DM6PR13CA0036.outlook.office365.com
 (2603:10b6:5:bc::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend
 Transport; Mon, 26 Apr 2021 22:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 22:18:32 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 22:18:29 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v3 3/3] dt-bindings: Add MP2888 voltage regulator device
Date:   Tue, 27 Apr 2021 01:17:31 +0300
Message-ID: <20210426221731.1718613-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210426221731.1718613-1-vadimp@nvidia.com>
References: <20210426221731.1718613-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9935b18-0857-4147-60e0-08d9090139fe
X-MS-TrafficTypeDiagnostic: MN2PR12MB3054:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3054C783D0FE2D342E92E637AF429@MN2PR12MB3054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixyOtFiFBXFv4pnUVvmfftWsiApMPNPaOg3u/1F4BER7O5AfvkCjzWeJFr5pz4II1wco8zk1Bv00MxIfktcyrqA1gWf/8Ad2BcCwvQJwINGRmwNC3kMNfo+QD19mCBOUXRuYWBpvKpYT70gmJn18v/f0koKLwCzoNMI+rkdorRZC1beiZnTPoLxqZBA7O79pkoWIItmNicpGxG2glzi8FXi7mjC2YtUzIjx7Cbx348VRnbJzU1JFGliz0SgDgVOVvS7PwdE5SdqyvuHXfjeO6D/nAcrSYkgBFKtswAmb0SW4D3seHm3pHMLEBTuBh3Hwlk/9VK04c2r2JDE/j04ZhDx4pWewcVKN2guc8kek9kVSjcVI0Ad690LBVT05YrbsJz/IGYpi6A1Dzm2grOmV+xNXB23ZFDOkG8GsIqK911gAFx3gp6/Fr0/nO3mBVv7lL+kDkRBndGNuJyV0AFttrt7cKBV4qd2PV977ff+X92D67egxNOMzXKwBZypFGhuPSKYr6h94T9uMCb2eMDY51RIyoEKIgxoaxyaxEdMjJ1A7KhNR3NGQHErRdj3icD1pbvB+Wpr7cASk4CW3AaeyuyH8BA8A/EraMaNTvpE7dGh92sB2Q3QXkCTNAuyW0KNLT9ocA3FiHWqFP67m3HF64tLhpX214SIU9oSnkjgSP6k=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(7636003)(2906002)(478600001)(70586007)(4744005)(356005)(1076003)(16526019)(186003)(26005)(107886003)(426003)(110136005)(54906003)(36756003)(6666004)(36906005)(82740400003)(316002)(336012)(5660300002)(2616005)(8936002)(8676002)(70206006)(47076005)(82310400003)(86362001)(36860700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 22:18:32.1066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9935b18-0857-4147-60e0-08d9090139fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
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

