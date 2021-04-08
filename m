Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED55C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3257F6024A
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhDHOSv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:18:51 -0400
Received: from mail-mw2nam10on2043.outbound.protection.outlook.com ([40.107.94.43]:19297
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232095AbhDHOSF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Apr 2021 10:18:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeG+CdbhxQypvPZRwWTTqV4INrRc8zdn1tanUFGhXHGz5YTnl3bP01pB5vY8VCkRJ5pJQchAu3R6obeEVQx6GhGf4UbJpdQjd9QXDtP4m/uFYCPp9FqXN83F/BZ0fWDTf3Xd8a2U0WH77OFxKKKyUi4E1t2Wz0GvpaL1cJB7B0iUjvwljmcIn0GxQMda/CBCSvl12/1AJdDOffJcTVCaSx+EjdHNlBvefjdMj7H2QIDH7foo8joxymMcWKKvJPK2uoWwKwsXj9VNJYIs9VTWVhsxjmLP39m1RvGPGaKqO7UW8FSvlF5PsMso0J9d8qqbwfV7s1pPL7Od5SRqGht2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=kSpA+B4pz46D/xJ81TzA8NFVKbLibwcIiTS4hGYJgMqFux35U9sP1q2ji0Hc6e1aYJWcIQ77DZePI2/9btkHencJzqoULaww6N1qfnwj2qsEqWveSeMHQ++MTsEcnO3ZvaGV4bUfd/LE7gRprGGTHGWQLzGz4+AhJTnxxP40c0VlktiUp8um57aszfdo5IsMdLpDpra0fWwYDMMH+RBt353C7/hIY+ujzyoEJ65fB3vZrC1voqsX97nUl8H5FbD+fNFCzMIL8m1BXYFjPmUfzRDQVs3DHlGFqxXV4kMzz6ADo5RmUihhn6Twg26HEKqDouajyxz/9LqZBLj2SP53Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=HnJKdZ1xpqjsNVAAqPQoBzScaDoJtQMMWMeol2PWAs89w5yb5P9/M9+ihUwsHbX8vZHVlUAhwz/PvMKoOQRslo+yNi7ZB11+5x8xCp1T9qOkWj/BBjsDHMAk3fVVmA13C+1p+3fItrkifjakFy2Vnc4eDoZpg3dYVTv/xeKVLAljwouOXSf5nXXvlGI++SNCTGJTdIMGDh6enXhdfZggUHcHVGyV04x3c7VIB1K3sNRtFf5jWLIyI/SwkOZudNx54s47XnvfU50hFHvTP9MUt4eM5hwo7xhqn2jeOYwU4DO+r9dWMAoTT5JnmK1tl1iHgjJC1TKXzujJ4u0enUsA7g==
Received: from BN6PR14CA0014.namprd14.prod.outlook.com (2603:10b6:404:79::24)
 by MN2PR12MB2927.namprd12.prod.outlook.com (2603:10b6:208:103::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:17:50 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::25) by BN6PR14CA0014.outlook.office365.com
 (2603:10b6:404:79::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 14:17:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 14:17:50 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 14:17:48 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Thu, 8 Apr 2021 17:17:24 +0300
Message-ID: <20210408141726.2561683-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408141726.2561683-1-vadimp@nvidia.com>
References: <20210408141726.2561683-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9da2cf48-e738-47e0-29cc-08d8fa9917a5
X-MS-TrafficTypeDiagnostic: MN2PR12MB2927:
X-Microsoft-Antispam-PRVS: <MN2PR12MB29275F0F9D2D333494584D69AF749@MN2PR12MB2927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DuR9CTtdZsKJPwzeKVASmGL0C0XnLZrIwUDc0KhAd5JzwEcRwvPhYrOoO0sy2ExXDJaEY4eHw91aRx2F66CLD2Q8q5IfUaRgi/VCJJKItL8E6uPrNIuC3S8MoppdByNzoYbBYDKxP+JVqFQZvuiEezsiqqvXpelpfzYAGNkeVudFe9ZkxCycmQWluG0BABFVR3XsOg0M8QQ/SlgnPXn0iYQp4TPbg3pMpB9CC4EPyaSf3AP+P7UIGc/V4U0FuEk4E/QzCvYILLfHn/j2hXY1HqAEy2K34p1TtjqsTFnnd0Zi+avh21Kct/Rb2n6gzEB5OPeryPxlh00ZOecNLfuOCzfBgDvdDqQdY6+Iktb8pg7EW6LOwNN5rziN3RhDgvgC1k3o6m0ONC8UtsDjYccBn6pHQcEtU0TtZ/gtU3CZQLdUZJqT1DcHn1obryiccZ1YvYHsznIdrhmbaBEA8NmKTtW4X23NLgcVKr5ufXmWBQh2Aqj6TcobGYx4rJUsl7xDIONZP/Ele/+sYiPqXah+fPw4F/7eJGsZN2gq3IUhEDk8cu72l0kFEjnPLRFdVQ9IGlBh2Mk1aP75ojzGTqb+kbIJtanRbk799wDc1AC1iwIyoPhxSnbau8LzSmX2/DrcROvfeG6dPTdSWWFwcXaNBgH5FCJbkpa2JB/Gl9z38lI=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(426003)(336012)(2906002)(316002)(110136005)(8676002)(8936002)(26005)(4744005)(5660300002)(356005)(54906003)(82740400003)(2616005)(7636003)(36756003)(1076003)(36906005)(4326008)(83380400001)(47076005)(16526019)(36860700001)(186003)(478600001)(107886003)(70206006)(82310400003)(70586007)(6666004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:17:50.3207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da2cf48-e738-47e0-29cc-08d8fa9917a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2927
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Increase maximum number of phases from 8 to 10 to support multi-phase
devices allowing up to 10 phases.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/pmbus/pmbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 4c30ec89f5bf..fd43873011a4 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -375,7 +375,7 @@ enum pmbus_sensor_classes {
 };
 
 #define PMBUS_PAGES	32	/* Per PMBus specification */
-#define PMBUS_PHASES	8	/* Maximum number of phases per page */
+#define PMBUS_PHASES	10	/* Maximum number of phases per page */
 
 /* Functionality bit mask */
 #define PMBUS_HAVE_VIN		BIT(0)
-- 
2.11.0

