Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F67C43460
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 20:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFA8661041
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 May 2021 20:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhECUsK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 May 2021 16:48:10 -0400
Received: from mail-mw2nam12on2078.outbound.protection.outlook.com ([40.107.244.78]:17472
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229723AbhECUsK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 May 2021 16:48:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHKQ99+VPoH9RXxX76quceA8nHrQaObYgqj7Bz7SKYlWhaIbvnNoAWxQJoNw0URqWOjIsWze1p2I3k8g69Y7Qs33OPIVUqW3W65e+/6/8/c/wbwEQ/d4Bpo1EuS6ckU4yqdooKwEYwxPIOknkwbGDLbp3rygTVxlClcBi+oirDmRIrBr9DDaKvr/+DWG4wEuX85Jz45CQRbio+Ki/iAbXlyyCuENRqtS19bz17a8v8Bn9uofD8tztLE6ptO0mNWAY5UgPrga8JiqJY1L7aUKpzf6u5nepW3liUTmB1Z6mAL0QK8nX3uFLJpFWtrhhw+5iRbC2fblsgnAJ5iS/+tj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=bx2anCPkJoxKkn+aEldfi1ZR9W33tghAtEXGq5wauwb6Jww1WE9C6OtZAD3tyNK5RKvnIbnNe9l2T3IS5Uf+liSM99X8LcowaatYEfRRYQ/UYsnhAF6ZI7NYQtop34lIervLOsXg7cttFLT0O8KzAHsTuTyyjmr3PENsZdPx0EraWG2Yq6xHMtv+vYHhpPDtnMFuZ8GvgVkA0xhqVGDPmj0jQ+kjM5zwFrAsjajup3St3UbpJqlw461efPcVLHUz5Y/p+68tTeAiJN373aSmiBXJAQsuvNt6QCLF2RYRBIbV3vV08dj2y/56Ipqxh5iJlKyYhwAD7FrmRnS3UJ0AXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=eKFUormAB/hvko6qceD5FWNihJyrKSVx6csywhA60xZsDJpsHuJVDi82jBMraBzrdpynrDTpXB2+eDgA121NfAQp4r8/QtpoLQMqcq9BVl/bXpx8sEWnlG/SpYELb972frPrcIAXd+cY1m5/w/ltyA03H8rWqcdaY5diOM8k77yycCJT2zdYXB3f1fnvFkf+9RxhSS1syOsQwopC0rE8677OgrUa/W+BqITdJH8OcIyTQCJ0YZzXr8mUEujxIWS5j7IKa3YLhKH3z2WfBfYMtK0Z4+GSqVnUidba0SE0xNTiBP84gkUyGhVYxPIISGXFRZyxalqQRb/ICdJ+SGmjRA==
Received: from MW4PR03CA0295.namprd03.prod.outlook.com (2603:10b6:303:b5::30)
 by MN2PR12MB2973.namprd12.prod.outlook.com (2603:10b6:208:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Mon, 3 May
 2021 20:47:15 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::5e) by MW4PR03CA0295.outlook.office365.com
 (2603:10b6:303:b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 20:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 20:47:14 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 May 2021 20:47:13 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v4 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Mon, 3 May 2021 23:46:44 +0300
Message-ID: <20210503204646.2742486-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210503204646.2742486-1-vadimp@nvidia.com>
References: <20210503204646.2742486-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 424343fd-44cf-4c80-5aae-08d90e74a231
X-MS-TrafficTypeDiagnostic: MN2PR12MB2973:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2973F831454A6F9AEFE8CA9FAF5B9@MN2PR12MB2973.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INJVtOyWM2x7TeAnh5ibAzRL5KKH+ZhN+NyxgKeBaEb1gEd/LsUP1voxXfuj7sDkfY5ZU9noM/mxoljKUDjgutWSizCcM+Bjb2f7Yd2lZCYjUx9Yl22zuaE5JO6FtahafkTrEE6//K15qBN34SvWJd/Vw2mgQGXkdHN8o+/5RxCuOfhCDn27ijIOFj9XexyCchL5hjZkt+J4OFyi69vgiwdXJ05XfbXy1vv4Y0n9cqNscTIRIReitgWzWtlKa2M9LaMKfX8Ebdtl/cR8b29CpHkvJZMpkKRDYmrUYCqMpoTLRUl2mAEUL2+Xw1fnnOzifwEwRVkukBCaHTlFGSzO2x1WvvCT/oH35U8cfbmNOVDJng0F8h2sYIMuWYvg6pj6+Wbwxcf+dZGl1Mc9j6i6pQGQxNRov0WTz85KhmdIUW4wpupGwK5PbToj5CmioGM4vgONkovvpV40N07xhhm779b49c4i0gV73fbN47pb1wmGvNEsmtdfDI6oNQ1p5wIBpF+R1nQj8GcFqLoaA9OswsAvZi+/yoVmI5gfdxOqWFo+5GnH3cOPomyQ8UNVdPnEHfm2D7JX/5Yh+evamJJtZ5mNFs3Ixq+FpJIhd/X1Wqc+GlKO0GVzduvP3KSpcQGhL/wOf0lRhlO0H4VXtVqPfkTuYyPUM0t3aOBbct22ews=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(316002)(36906005)(6666004)(7636003)(26005)(4744005)(36756003)(1076003)(8936002)(8676002)(83380400001)(82740400003)(86362001)(356005)(5660300002)(110136005)(107886003)(2906002)(426003)(16526019)(2616005)(4326008)(47076005)(36860700001)(478600001)(186003)(70586007)(336012)(70206006)(82310400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 20:47:14.8675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424343fd-44cf-4c80-5aae-08d90e74a231
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2973
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

