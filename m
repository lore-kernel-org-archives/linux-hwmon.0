Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F452C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jan 2022 18:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235372AbiACSSi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Jan 2022 13:18:38 -0500
Received: from mail-bn7nam10on2064.outbound.protection.outlook.com ([40.107.92.64]:15716
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235437AbiACSSi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jan 2022 13:18:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk+Xb/f/Uxew7ri0+4x8ozFWepO9eQfXJfalWefD1bfu4QoQbHfrJuJauRoS9nJaKSHSUlWznxeUQHNN/9GpfDfZQ12epKW+YQnHWe+02nQXpxsek5miF7uscNfa7tEQ8JSiRa8gYJ0HlkurLLXG0RF2/0c/Nqe+heSXkn5HukPr8+Lm9S6llTQHaN/nJtqQR034hAjwoXvfZ5GBLvE2/mv1CM9ktX+G4gzHOrJroe+hHPXHJET0OiQErg/F2ll6aRvnRQDiJ2umcX/l9qwDCUuJzQupxXcU6Ne0RVXsjAcyZsN+rGB8iHmIZkzefoiE4k3gAGnrBuQQASJU+t5/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wavFwBeeA1hMkl8ZJBhLpn8Qk/J5k+TS2XIw50yhYNI=;
 b=QcnxeNTBcOWfax9ZXUmSrukkAZRYCre5UJoH+uWnco3vNcqZKok71KxOOOJvcYgmKTBiADlZxsUWH+8Kh2gpSNFAa/y6PxSrWxJuZJhKR4VeCATj0Y5y1Ll4624zZj6WOAFNbkJbsLE6yKrRlBhnpE3X6C67b/AWI3UEWrzUmJEoJthUYmUH4qpMUSYhlVBOY6fQrSska0hBK8XS7sIV7x6CmO6EqgHGwinpGn3yPCTTVPhlYJm38kS376BFr3MDLqrJApHDSZxZFRXPIyE7kRjEpAGAiTb9iiOX0Sk1rBbrPoO4LQ9J92e0FvSq2XXlS2H/OYRbOSD2pRiA93vtkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wavFwBeeA1hMkl8ZJBhLpn8Qk/J5k+TS2XIw50yhYNI=;
 b=SR/6mHFUvnE+GHAkhNvzXVUnK4CYvmWL+rOuy26DHpAgiq6GnLDGpxUZMxCc76tsAISyV2cniG/d6uBcXioxtcrBTYyvFQFMOuBgYIKuT07Yc6OFHviIvaSyTbKKCwU5F3t7qfWzwLCAdTM6IBqSWb+pVE7n1VuhUzjzjRhUmOb6i6aFOaczAzVpwBp7l0xt//F5RfjHzns5OumQmqcfDyTmwlu6LviJyI48EbxBNTquAE89enUq0jX+QdonEs1CMiZ8p1W51luuCMrBtaaUdm7p3U7HlfgX0XaaWUVbtR3HqUhWnaEbKl4zeVML6jCltSNKpTMTPxJDqBVktEDZnw==
Received: from DM5PR21CA0001.namprd21.prod.outlook.com (2603:10b6:3:ac::11) by
 CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Mon, 3 Jan 2022 18:18:36 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::70) by DM5PR21CA0001.outlook.office365.com
 (2603:10b6:3:ac::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.1 via Frontend
 Transport; Mon, 3 Jan 2022 18:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4844.14 via Frontend Transport; Mon, 3 Jan 2022 18:18:36 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 3 Jan
 2022 18:18:35 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 3 Jan
 2022 18:18:35 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 3 Jan 2022 18:18:34 +0000
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 0/2] hwmon: powr1220: add powr104 support
Date:   Mon, 3 Jan 2022 20:18:23 +0200
Message-ID: <20220103181825.313067-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.8.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6aa453f-830e-4c77-3b17-08d9cee57561
X-MS-TrafficTypeDiagnostic: CH2PR12MB4135:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4135D1B14BA2ED8DB8D73E26D4499@CH2PR12MB4135.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6FumkHmcQXK9O4oZTYLBvFhtW6rV6XHKdiTSgDdB6qeQZrrAYrPlbMXJJxEVsWa67iE1W79VuyctIHbC24hj11IBNp/otG2voqTpQb5gD52rvPGgTXYVhi6lRrT06IbnthuaucHc1OBafd5VJI0PB9ukAlW5x9Hmw/1riGyKlA8Y0zpv7RPzKdAKZ/L0sEU2ijU6o5M1UzwJqB2LcmwBDZPItm0yg0zUDi9T8qL4egNiZHGt0vvYJK+jzOB1yDW3iszx/OUh7SGpl8eXjVvwEZanYWT9GWv95ax//j4rG+BjLsxu981vK/tfF96N1mJt3MfFlFx0cLPSU6AYAP/ZxfZr7WyCrsHxgCwuJZxrWAkrgStigRzd4CWlURZ6wS0SSM3qTMqs+Sj0ILg8t9BjkdLAlR5BriRe+WO017RjqwA1NjS8HefCBlNWAJTWX1ZPO95IYuUo6UciIQa8vS94tibxk6PNp+itNqnNmid0jhK/ycn8dTRp++6YF2xQUacsQwcYSUCFLMAXPYswWYnPw2tkFgOivF1HNBj55Oin6YsW0SZOeXxOY3OEVTN6ATUV1hTMc3gpBUthOEbj/nrieg4sAEH37o9Gw9oAhGgrt0WWk8ZjOZ7mrhHwajS0j7ElEndsz1gPmoCWlbI4+oBSkMCg1K6FlTKkNtytXDFNxXilrIwmNaSFLXLt1H9zdg7lIdEV/8UK+fd8FmyzxpFSR2LFtsEy4jnd2esKVyS1B5wVAoGR+Ao7YHCrGKcf1s6ps7dIbfIeuQh4OHR88AO4FXreRan05WvIyO6s/fN7lQoA7NMAWnHlUvZO9PFszRz
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(110136005)(4326008)(8936002)(6666004)(107886003)(83380400001)(81166007)(36860700001)(36756003)(186003)(2906002)(82310400004)(2616005)(316002)(86362001)(26005)(47076005)(5660300002)(70206006)(40460700001)(4744005)(336012)(70586007)(1076003)(508600001)(6636002)(8676002)(2876002)(356005)(426003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 18:18:36.0212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6aa453f-830e-4c77-3b17-08d9cee57561
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

This patchset adds support for Lattice POWR1014 power management device

Michael Shych (2):
  hwmon: powr1220: Upgrade driver to support hwmon info infrastructure
  hwmon: powr1220: Add support for Lattice's POWR1014 power manager IC

 drivers/hwmon/powr1220.c | 239 ++++++++++++++++++++++-------------------------
 1 file changed, 114 insertions(+), 125 deletions(-)

-- 
2.14.1

