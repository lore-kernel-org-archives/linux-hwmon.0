Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6752C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Jan 2022 07:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343728AbiARH4h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jan 2022 02:56:37 -0500
Received: from mail-bn8nam12on2060.outbound.protection.outlook.com ([40.107.237.60]:59700
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343740AbiARH4h (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jan 2022 02:56:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQjUr7sZ/OUxBRRzRjmMb1PhIADrfMt+oGUQf3t/w2yjodLthyqUhmU2nAcWg4LW0JMy40wxwpGR2DmatzK/k4xE2gSw+4YhP+JJtpzbYab+kp3kTwkLKSL/pKThuyKfNG9/Rm1WJ7ykT3j0ZT+kXYQokyzKiFdneak7DiraCdSLqW2R9KeS9apgTnLtQROqOqILbWxiv+CXO9FWPKwzA00x2SdzSzuA6jZ8G3GXK5shUcKqjXRAsRR0yBkIVBbLCGypVB8REfjchVPLJY7WvtHwevRORSEAlM2tIkC/R/G/Ud5FDvuwgoTFOIXb7X/As1z+yVHmjw6Jf6+U253i+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TADEX3R2XQCH0Fh1rzwgKsSwp4HkBeh9sW9fmXmckg=;
 b=GWFab7J2Ot4XWmcM3s2yiNNglj6cGD9x/uH4njDhPPomJiIqqCIEi/F2jY6HaIQzAwJcpX2qNNtBp8nPNvV34nd+hrX5ZFpjbghiHVvqEFPRg+7MkWQB1JShBqsSq0su5ahGZomemhe7xUL6uWqFaeLt4YHy2J2vani3MpGJpYRrt1gIvyD8cUhgzcv9HQBvG/r4rCA9kIVvdUBaicT5cfsC/jHOHzcm1wvv0MZvXrPFSn/xOQE7i7Z/lTKdRXoWuz8XXVhxTXqnMMR54k0RrWJBA8MDqV3VUjJ4mHFG1jDVs+oiS6bEtBRmw9LUx7gOSR9IIdJkfhznMOVJUvE7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TADEX3R2XQCH0Fh1rzwgKsSwp4HkBeh9sW9fmXmckg=;
 b=S5FAsn5MSN1AsYDKJLoL/AWootAs5vATWXcjzM1pqO/i2IcEJL5DwiggoFeoboomyLpKaJeUM7ZD3wOlR/y4yxm5nA6CHNDOvKB9xxnjRksWxK/GP0AxqY1ZkamTB4tJJ7GXn/cCrtI6JBi5N/x3vITY1XUAc98qrclQS/blVAc5Rx/Xyi3U92R79Ou9mH2CpEXKjof5FklqGqePkOHQaAltXSr164iC42VgeFXVk5BW599L2/CdjJKqC+E2E0q2UvAxlGabglJuXSxvzjD7KEfRx/zt0597qxgLCw+U1bcp4Xan8ViEb/iYfedkiGs//NqKEwJBvVmgPI66Ie/idA==
Received: from MWHPR18CA0031.namprd18.prod.outlook.com (2603:10b6:320:31::17)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 07:56:35 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::f9) by MWHPR18CA0031.outlook.office365.com
 (2603:10b6:320:31::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 07:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 07:56:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 18 Jan
 2022 07:56:33 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Mon, 17 Jan 2022 23:56:31 -0800
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
        <vadimp@nvidia.com>
CC:     Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v3 0/3] hwmon: powr1220: add powr104 support
Date:   Tue, 18 Jan 2022 09:56:08 +0200
Message-ID: <20220118075611.10665-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.127.8.9]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da1edbde-3982-4a50-b00b-08d9da580c44
X-MS-TrafficTypeDiagnostic: MN2PR12MB4359:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4359B4217F59ADB599E7DDC1D4589@MN2PR12MB4359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKgxYwO9SMKurfa4OZ1u4fYQz56K0aUcAYcyUwBcT8B/vSRFeN4b7gWttYDVhq/ndenO+sWMHGlXKpO8SPxWziyFFBhHdsUcBLsf01cBM50UWPXF4HxUEarwWuSego43lu8S7QzvMEzu0s9IVHD+dG/zAds9QU4AMVOBFKGQjipBGLSzRz6i94KBhU2Ggw9Z6abJ1G2akX5j2L8+bKIJbEju5BdZkcC6x4CmReqNihmsGwe4ZHRF2pn0xTgJXIavh0MpXUpfLdnGnnHgBNN33xAOin/mTslsFpby/ejL25lj9E0Qj8Eq2ux9Chx0+PYZ5BUBqsuOU1FuINQ8WPECWXbkg6qzgvsc/gZNEheMcEylLP8g0oWvrZvoq9DaJpOGpI8TZwrVhN8dmiWNV02ho7ZLK3krlZCJW5WYs9BQ1joh/TaeLi2CFBJm7WRrmM5zfgQejqFc8f/8LYZ3O4OTt0nsAvWOaqokTSSG9Zm+iOiUQ6AZ6jgyat4aNB5NhCcKBpGuqMLgSF3vD1OuSqUlogErURmTwxx3jIdYO+DT2HNTwXF/Ix0v1PF1POIDYNhoWOjWjauUJgUq/vTc1FWUV+/DdyoBJkZbdZ7V2HwB4OB5dSlMeWQQAqcdr1yUYTC9H0YzpHminMjtk6+zoACQowFEtpnTq+bBu/3LQtGrK0uUD3FW8vbnCWP1kWWkZW23bNIlgvLA3NStygISlp7xm2P47xVxHGvY/vCu8zDQtqUQ0dHxwm56JyHDanNGwIkQqwuTQC1dCLgnayFMqb4oAWGZv0bZClO0yT4it/XsOGsWRSKrs3CG/6ORxivQ+7Ga
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(186003)(83380400001)(47076005)(82310400004)(16526019)(8936002)(6666004)(316002)(336012)(107886003)(36756003)(2906002)(4744005)(36860700001)(4326008)(6636002)(8676002)(70586007)(110136005)(70206006)(2616005)(5660300002)(86362001)(81166007)(1076003)(356005)(26005)(2876002)(426003)(508600001)(40460700001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 07:56:34.6347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1edbde-3982-4a50-b00b-08d9da580c44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

This patchset adds support for Lattice POWR1014 power management device

Michael Shych (3):
  hwmon: powr1220: Cosmetic changes
  hwmon: powr1220: Upgrade driver to support hwmon info infrastructure
  hwmon: powr1220: Add support for Lattice's POWR1014 power manager IC

 drivers/hwmon/powr1220.c | 235 +++++++++++++++++++++++------------------------
 1 file changed, 116 insertions(+), 119 deletions(-)

-- 
2.14.1

