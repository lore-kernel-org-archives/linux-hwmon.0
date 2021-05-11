Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A94C43603
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 05:56:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C86C261930
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 05:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhEKF5u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 01:57:50 -0400
Received: from mail-dm6nam12on2053.outbound.protection.outlook.com ([40.107.243.53]:23136
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229807AbhEKF5t (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 01:57:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ifl4Uj3Zrs/sCuXr/DoO53S2mrR/abuy5XWGmWrmohiMdjGT63ceSCr0vUzr1GBkhObBcSl3qiPr+lF+EebjMGj6l8VwU6/YfIN/TfgfrrwnvzQdRe0ZT+z71AtcuYic3GpP62nKZDRByzM0XdWPyUGzoK04yjAQTENOImmrCf36GPluRwP8MtwcRdm8Yg3Q7GQkCHSxCLCOUPuKzkwQb07KPRbhQom+V2YV0wORViNlla/MoZcS3dNEK/51vYAidxO/DUaEtGLFaxzCl9V8u2hj/hqNovhpHS87OaZ0vbM9ekZP0sM+hdd+rvXl4IyNeB41PPNLzoJRux28tkqdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=E9lt6IViPZEg3OfkZtqLcxyeXvolFORZC3g++uUBgLq88Rj+LVah/GmTinf+LtMNtdmCm1SjkUXNGWQftl1xMEE8Ms/5nRBIltBAwb3BsMQgPukl0GfVFczvzvlmIw9+Knyhd3jUnkmgD3mFxfwB0lkiltQpfdVrSQxOIjDjwrLCurJU7nOLE+n2/yd0gkKmnZy3NcAgVwYXJ50TMYDYc61WpaHxtOLOBDQQYoPDirFc+uTlLKeWk+3gQcp9zTy7/++AYwoWVSi5Kkkyt7gqMXp+DZZttDMoR7+bTXJfX+CY6gn3vlgaa2B1QG0SwEKZw986F/d36ji7gLypBBljIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=W7HRMwXXitCdHFsXmTj2FyUr/KGeEJrsrJVihY2zA8TC7XYVAF5FC08pKQfd8CkOOdtOqOGKbMUlwX/J+HvUavbrEbf2KaSZbsDF+0GKbG67bk8qQnO7UHACcvOkEMJzKsSwXj4mMoQ6g3WOzGpSLb3rK6PnAnLJQAjjBA7e3W46tgYQ9ZrjlNnRUFo73W7g9T+hk3pITpfCLwlZbJTbk3JZoAu/3Kj1dQu7cNHCGhGoCgWbW5oKdK8ASPgTBtJKB5LKv4kdXLGGr6/RtLkVLIembPl4ulUVS/q/E31EWgbbYiUdOKI/dkMFrtsFncyE4YNnCrMhzrup/hwYzelW0w==
Received: from DM6PR02CA0082.namprd02.prod.outlook.com (2603:10b6:5:1f4::23)
 by DM5PR12MB1612.namprd12.prod.outlook.com (2603:10b6:4:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30; Tue, 11 May 2021 05:56:42 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::f) by DM6PR02CA0082.outlook.office365.com
 (2603:10b6:5:1f4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 11 May 2021 05:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 05:56:41 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 05:56:40 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v7 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Tue, 11 May 2021 08:56:17 +0300
Message-ID: <20210511055619.118104-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511055619.118104-1-vadimp@nvidia.com>
References: <20210511055619.118104-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 199172f7-8621-4925-d5ef-08d914418d02
X-MS-TrafficTypeDiagnostic: DM5PR12MB1612:
X-Microsoft-Antispam-PRVS: <DM5PR12MB161257CC0FD34CC3C9965151AF539@DM5PR12MB1612.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3I33zWEZIBXWIJ2ao1yLLZRUoNy/5bfHRBPPy54JYRKbjBnZ8UQyYHRK54792oNVwxZHrt31GM37AivROYm+s8S5vNVzJT7i6qztdXnw9R+IYzhdXhFq3RjtEjlLXlOZiO8KaaTkdZj/lWlMukBSxWlJhtlAPJI9T/n6Jr7BxFut+5tTj0pMIMN2ZRc19epiMwHEcHz4wrIjHIMnss/6RCkVVpV8ZEqxOGyRVBAUKKRv/bJ39lzdycF3DetteNdkpY+chVjqKqSzc0jcVrs01PJrooJc5Pbroj7hs3z4BPDKC+99TcX+D9ZjyGoYkb82ZTXw3xtTWYy/bK6/ufh7vCeiovBCIHZTSGtVlvdEDEPXcfz+SlNN73p7QD6ntunD/OE6ZU6BwkRI+21PExeAplW4vX9Fhuaac6swrXRT5w0n38gxES4zkxitzFOSVo2m62Ke7w0nm8kF1tkdosqcVz80umlYNu9wHCutxTFyu3ydpNwpzMHt4pu66CkZt/032llm1NFaPngb+DSmbO0LzHOvleGSaLFYcXeQwTah+oNs8IjoNd63lroF+7IKsgw2ZD66pWTDDeBbBowUkWqBMoH8sjK2lU+x/KM2oTrnq2qRcQudyO8hKX0kGEAU9kVx7ZDJVw0moyy3C+v9VVpAfMLbVQmHGJgteHsb+WIxISM=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(36840700001)(2616005)(26005)(8936002)(8676002)(186003)(107886003)(7636003)(86362001)(478600001)(6666004)(16526019)(47076005)(356005)(336012)(426003)(4326008)(82740400003)(83380400001)(36906005)(4744005)(70206006)(70586007)(54906003)(110136005)(82310400003)(5660300002)(36860700001)(1076003)(2906002)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 05:56:41.9649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199172f7-8621-4925-d5ef-08d914418d02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1612
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

