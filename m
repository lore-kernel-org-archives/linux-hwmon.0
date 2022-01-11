Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D42C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 17:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344581AbiAKRdk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:33:40 -0500
Received: from mail-bn8nam08on2057.outbound.protection.outlook.com ([40.107.100.57]:25824
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344782AbiAKRdF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 12:33:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c87sxIKOihSK/ag+1G4RrI7wYK2P3MQosggQV0i9WpDVrRqNk9xVje/5h0tESdasxxskjiSqza/lxnzmAiPT7L3LAXQHVNFbJe0bVUhVSML5s0nfe22UCsey3AoBoqSsuVGlVFXH588DlxlQGSFcH0eX7OgZPnRZDfKgwbQnb7x2aUGgU1XYySxFnZXk8SGGKFCHQ3B+J3a/ViAD5SHh7opFgpIoxjxYgoIl7UNilRH5EsMM+fJ6jQw20zgGzhK+sfbPWghJO4IvDnBZ9lo5iP/mtW5fzKCA87X9cGzPeSmn9YssXCqft5Prhjh3ZEKqYSzhxtMqgEqn24770v3g6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6udO8GKj10Z8PRfTbcj4+kClCZFcoWY2q8DLKbb9Lks=;
 b=Rryqbuem/yW4eC6lSskuFr/QOjvP77mC+zDHEcB589INutIE5rfxPOfHe3b0FpHiOyZ12z1XK+yDlS6pSKjtk5dprGy9pdQ1MrvCSf7hiYDLbaxjhlbDmykpjrVd3Q4cEUZCXPYrZp9AA+VqRLx8gsdD0lWGtnLEtHCV+A6PxB01NzSCTYJiG3kb0AY1TvnTt90x2LVRB0hijcpOyJ9qRXcqkZ5vwus9KVhrtZRYQJtEw+n0jq8PBZO/2OPKi/SqgJm6yk9wDW7DlLNpxzm3mREEVIHPHZ18CPtJB1jo4jIsKnMP48GnZk4HQVoSvmWuhy6i/WqdPWVBbZ6uq+WeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6udO8GKj10Z8PRfTbcj4+kClCZFcoWY2q8DLKbb9Lks=;
 b=lGLU+uqDV8YYfUKZl/bd5yWhsnUjD7kE+aCBQXoImdnm9vBHAultTjijF3tdptsPfzXuYjiHurjSy826Z/a9IQP/Bouj+OQlSbZglniNhaXyaUrTpN9aTYPnHzjAzEOB1ud8SAqW8VudTY2ooPvRH0oy04NpksJv2735wctGkPjXJwChO/12VWpeaGjhZAEL6iQ2jvluvqGu7DiuIHGzsfuiYlpT8eGgu12n96Gq8Op+c4WTCNsmXa931jjGHzthQu5LOCXBO+ItLCsYfN4DqeCmopdwQQNGKUPgTVbjfzx+qK1xhsDE8UjAn/oOjMu05EzzTrgbyalJZWPpEbP3jA==
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by CH2PR12MB4969.namprd12.prod.outlook.com (2603:10b6:610:68::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 17:33:03 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::8c) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Tue, 11 Jan 2022 17:33:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 17:33:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 11 Jan
 2022 17:33:03 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Tue, 11 Jan 2022 09:33:00 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v2 0/2] hwmon: powr1220: add powr104 support
Date:   Tue, 11 Jan 2022 19:32:37 +0200
Message-ID: <20220111173239.21006-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d861b147-f305-4ab7-4420-08d9d5286bf3
X-MS-TrafficTypeDiagnostic: CH2PR12MB4969:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB49692E2741BD8B79D8F2DF07D4519@CH2PR12MB4969.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxcS3NRYmEkMnZSg5mXVHEtjP/DV7L+YS6+u5BLnCbWr+LQQwIMZ1oioIZUi9e5Yj84SEkRMOYs1ZF9PC+Mcet2bWgn4NXqcKRbwgAeL6vyD+dlwSuUyqlVwjdD7MwqQLdw9Nvt88/2SwqbEcd2Ct/TwcSKC03EqNTnyse3fpqn36bRRPtxq7PmKPr+cZfuFHZml1FkvDYhdcYpMV0gi7pmioynlKA5z0XNGvS+CHL/L5JGI7sZjN5lBo9SlN1g+F4NEvviH1fEq+bkCMrPtD27vEGkIVcdUQNYvdBpNgt/62PBmREjpALXhyNU+8M8kfkonGpH5Tsc76DcYQ0iZfjkfqfFyLJ/cF9iBQ+Q7sB2bu8lJJusIfVKDvwrO/S1vsQBqT7TrcS5RmeE8foJiOdjafdKuzKKVSbYa13eY9Ow0RDLZleQXwoPT88R4ys7IFewp+TP51jIImrOGBIhob4OXyBAbKg2FWDP7Ge7UJ9RMuLOBQmdE50pDnEqlTZzxI/zm6sqKbTkAi4zPrqGU3gDskkKYtf17MZoa8uR1EO+VNBcoB1uQo8bXeBxFKeIly4Zh1NA81olX0l5wqpiGqn8L8nnGOXlNO78lFntnfGcjmhcVpxoatuXZXQHw5LPcTuxabzzjBgcFK0J72MvuJFitxI91DSf3e4JuhoFEpPhvkp34lxJ4Y2oDQ2GS7WpnUI4GnZdHnhWx3QigQERq2Z8XB+H1CpeAgNyQJdu1NFqmNMEmJFZ2COs9ocSbytzcq99kpFit7bYA1pXbqgq5q7Tze8EuoBa+0qIOo6e8m1yGYtseQI/JJizbkJKjwCU7
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(26005)(8936002)(8676002)(6666004)(107886003)(16526019)(47076005)(83380400001)(356005)(70206006)(70586007)(186003)(40460700001)(82310400004)(316002)(426003)(2616005)(2876002)(2906002)(110136005)(508600001)(5660300002)(81166007)(6636002)(86362001)(4326008)(36860700001)(4744005)(36756003)(336012)(1076003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 17:33:03.5055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d861b147-f305-4ab7-4420-08d9d5286bf3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4969
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

This patchset adds support for Lattice POWR1014 power management device

Michael Shych (2):
  hwmon: powr1220: Upgrade driver to support hwmon info infrastructure
  hwmon: powr1220: Add support for Lattice's POWR1014 power manager IC

 drivers/hwmon/powr1220.c | 241 ++++++++++++++++++++++-------------------------
 1 file changed, 115 insertions(+), 126 deletions(-)

-- 
2.14.1

