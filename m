Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C24EECAAD1
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 12:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiHaMwv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 08:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbiHaMws (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 08:52:48 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::605])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D323BA9F1
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 05:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoDkOEo2S2JDBJR41eRrtrPyoYn6jxk+8CYEauxhytGgdw/P0jR7UfOOREg/Q6AF65AdoCubd/AgtBfyMa7RdU5K7jMUiRqwPLMMeXgX4ZcXK1qE5iiO/JutwZA8kr806WQerJbtQ0RLrip2czmsGrWRbPGw0gEAqD9qnAx6BbD7Y/MMYRxiMzRHpb5XwR+fm86PlIYMZXwZlB2TYXG76v4pYoSMX0ocxEB3hhTT8HJfkv7dDrf5AO7KDhrd67z1IX8j7L7F6EnqMjVEqT/oPDasXdlXiks/OjvIu9ApMksABbIqrWCzIS3R5tE5mXDWj2Dx58a9dmxQACBBMpteEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7edhQti5J0OO0yD2gZpIixPvXneNXgRs3XhfRtDskOc=;
 b=UlcfBg8EMg+hcmoCZtLNkKEpwzMLA77eBlvTzTbxUCPg2tJz7RS+mtQEIvP83hN5SfiXv3O7uZSlM32Rc1T4dzqbQQ3AaGxYsChnTVCZFyd1hPe2MPuXqky+LF4AAZc0xyAVcbfmS7mXkz4AABsd2o8zNd4kSike9Wbo8dPL/o8jvc/2NKRgJn5t88qb73PwWXylneOye6Qho5UakGRytmaxBnRIu2m4+udnYJU+qI4XYU1Kzv8JbC0DXtErfDjC3HRicoKw7PJ/Hp50lqGQ8IXBvJLn+rQxjkHM2r6/UwDExllWtxUlKFFJbmEpx1Rkd0MR/sNhdpfjTu9n/1UxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7edhQti5J0OO0yD2gZpIixPvXneNXgRs3XhfRtDskOc=;
 b=NjLSRHsCJDJv1hnuZek80MgX08/kNh/nSi7XVeQMGeejvOZurnKO67E1nd4wV0xA4c5DP8DnpMy3PVzsGP/mxcnl2Bfp0ngd17TbE7y9KAehdQEchlFd7B/SuyV7DVmgJXDJ6LKolukb0gkE6apzzW8nC4xdHThdgFB1oPyv2xtvzJDRF0Xzr4f06mr7+cNC1g8VJY6TXvaw+EPXtygQ7mjlbnIiGsUi3nLH2oGBUPi8DmKLpbKixpFo+5YwutsXc4ud2if9Ca0vnuyLXZ7DLn+/c9uqD/J7c5uLcDSjV3gQjpljwJUC4YlLMAEGQOMm1AI98NSh61E3qK6JAGou2g==
Received: from MW2PR16CA0042.namprd16.prod.outlook.com (2603:10b6:907:1::19)
 by BN9PR12MB5339.namprd12.prod.outlook.com (2603:10b6:408:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 12:52:43 +0000
Received: from CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::43) by MW2PR16CA0042.outlook.office365.com
 (2603:10b6:907:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Wed, 31 Aug 2022 12:52:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT078.mail.protection.outlook.com (10.13.175.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5588.10 via Frontend Transport; Wed, 31 Aug 2022 12:52:42 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.38; Wed, 31 Aug 2022 12:52:42 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 31 Aug 2022 05:52:41 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Wed, 31 Aug 2022 05:52:40 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH 1/1] docs: hwmon: fix make htmldocs warning
Date:   Wed, 31 Aug 2022 15:52:37 +0300
Message-ID: <20220831125237.44142-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4bd3047-1fab-44aa-e44a-08da8b4fb197
X-MS-TrafficTypeDiagnostic: BN9PR12MB5339:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiYbUPzTyOC2zC/vtiS9i6iavtbX5/fxtLAtOUIYcoJjQi/wmrtz89uXDMxgfX0GzeRKuapdKVKq/WhcqHzmb+rz3TUOixfXxzaRQrpuB3VNlDAklXI6idb0oEsR+Gk3daF0tq6R6pz+miMc7aznLgKarNY8p32VQgqawB+ldI9fB4KtbWdtc6f5RyHMlJESwYh8JOLp++TGhinxTgWI4Cu/BtbufDjxxccLIUGaoIszi+/sOcKMDvFcuWRFSlUm0rx4gMCo1F/JJ00FOxQe8zcllczu4H2s4ry9FvT1wHYrRZ3siBBuBn/pZk98HSQ9jv5cXPQTFzHhLuuToho9guiwNPunjjTF/x/X/lgonRQ9eQyj43xRTeLjfFyKxpnNz/IqvF+YHQt98/tYrNF94GJKRor3r8Zcj74rx1mQQXn/DmZg6KnmsJvL9eugIlM9tbIyDdywTiXbdXr78kEvQc9yf04H3f/Fr9n5Zmnj00y1WMD+B1pf6Jcr4CybWV37KFCi595875dJ88vihNu79YPuiLDA183zWuDOwvfK4HcKcCEOAVEsrLur2jypSXS17ciY+WWwhQ/wN7kFNZQ6oxioxM4/veWJ8anm5yV3R8rRAei3v1L8LAw2TO8aRg3FyajC6rlPpQR8YYagBrRmefVNML08v88iobrgWnb/ChPF4CosyYowGjI9xGTMgKZYB9qTBddf9+ZlB6vZ4AFLi2GMZ0GGp22BJ02H4Noq9/jWR30TJuz2FwNW367VMH1/7b/dYPyj+aD0xV5pAtDtdaQ3uoXSPKKAIDCZR9/X1KX90xU9FbMrKI3MF89rOFWGnr5Gox1XhxYjC2fruAHGrVS2UEZOTpvZUGLYHUyIuZANupUG8e02dVzY17TDXOIX
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(478600001)(966005)(70586007)(4326008)(40460700003)(316002)(54906003)(6916009)(40480700001)(82310400005)(8676002)(2906002)(5660300002)(8936002)(2876002)(356005)(81166007)(4744005)(70206006)(82740400003)(86362001)(36756003)(336012)(1076003)(26005)(47076005)(107886003)(426003)(2616005)(186003)(6666004)(41300700001)(36860700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 12:52:42.3607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bd3047-1fab-44aa-e44a-08da8b4fb197
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5339
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Fix WARNING: Title underline too short.

Fixes: 25e11ea6ead1b ("docs: hwmon: add emc2305.rst to docs")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Shych <michaelsh@nvidia.com>
---
 Documentation/hwmon/emc2305.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
index 854edab99595..2403dbaf2728 100644
--- a/Documentation/hwmon/emc2305.rst
+++ b/Documentation/hwmon/emc2305.rst
@@ -13,7 +13,7 @@ Supported chips:
       https://www.microchip.com/en-us/product/EMC2305
 
 Description:
------------
+------------
 This driver implements support for Microchip EMC2301/2/3/5 RPM-based PWM Fan Controller.
 The EMC2305 Fan Controller supports up to 5 independently controlled PWM fan drives.
 Fan rotation speeds are reported in RPM.
-- 
2.14.1

