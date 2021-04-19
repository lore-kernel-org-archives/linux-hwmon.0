Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338B8C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 13:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C5FB61107
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 13:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbhDSNDU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:03:20 -0400
Received: from mail-dm6nam12on2088.outbound.protection.outlook.com ([40.107.243.88]:4448
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237778AbhDSNDS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 09:03:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvL3Bf3rqNAfzuW9qFdHtbm3IykgffRpNoSkQ2RQLmNOyhfPAJjaZcauzq2cDKrnqc9HGPbNrDkR6JsdCov6F/I3tRmzGzs0Tgzw4NFsrrB3olP/LbbPe33Ey0hp429+a3g8TyXsm4YwzpuAF02P9/0oJucvBW7y873aRsSR2v947BHd7wo6mJHNUdJba2L9+GGP0qTf9VcERJ62+ZRp7y3mUW8Ry4lEq9uOnluH7fiFJsz/urg1az/hq8htJfJrnvugUKiuqe9HM+ph+HnA1RlGw8wG/VuEXnZpOtMzMrVrHAX98OKHSb/tKUFztMubAMLIhI1J/iyi9CJphjLdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=AU564mkBt55mJDvqV5UTrPV4wEn+/f9mURTtx+pDPWMmu1pCkPgqoho9WamOsep6xpB0ZnFzhtZZz5PnIjq2IwP8lVQRPu5myQsEoWsSfAYNnTFsOBY61pUuCAKdm8mdl/I+/CGN0l/s7mGjTng+5FJb+QIcL3ZJLFPi+XxSFkShvrOoqKg751sQXXrYeocfSYyfSIWxfilU9wQNJrgs/WvfzudMU6ubcaAXsqK/KC4p90J6Luaw6s3Ep1Xy+QJO1YZV4PMWvdA6NiQuifmocsgmLR8S/X5mshzUk3VGhhhXOUeltL9Us6/ANpcUtpsKG9kNq2c4Uxdai+nCBdZ9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=bzXHWBlR2JhLAE69n9q09Dpvx1+eS/B61Vb77ZJSU6JPmQmVfoaMylJDsjNRVcb62yb9h1BtMd4IotPiHuuESSHUfC4Tqm+N83H/mwaxpZHZ9Va151vgA3zO3e6S3eahiV5wKBIyj55yNmMqe4E7L+3nxdM35hsxka/rHONU8z5ooe3UN7Yu2o4LgyMVk0xVcH2d+BjwVFHfKYFGULYKVuUdyhhTPnjSusE5tU1mA6raD2tl075WN/moroQJ//XQWlAjLEJgDX5V5JYzTvFt9sH50DWpcWDjUEKNloRLZXB6CQsY8OvUjdH4EauXUSZgr9PSadFBlxGt11FDdj0xUA==
Received: from MW4PR03CA0356.namprd03.prod.outlook.com (2603:10b6:303:dc::31)
 by DM6PR12MB3820.namprd12.prod.outlook.com (2603:10b6:5:1c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 13:02:47 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::4c) by MW4PR03CA0356.outlook.office365.com
 (2603:10b6:303:dc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 13:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 13:02:47 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 13:02:44 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Mon, 19 Apr 2021 16:02:19 +0300
Message-ID: <20210419130221.3878289-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210419130221.3878289-1-vadimp@nvidia.com>
References: <20210419130221.3878289-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 988de9fe-4c0e-4c88-b642-08d903336e14
X-MS-TrafficTypeDiagnostic: DM6PR12MB3820:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3820FF36B29FB651186103E0AF499@DM6PR12MB3820.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1Jo1fE9RfyyT4s9m2/gzTuFA4IN5eYLxd4wMwj8n+ooVj8aYMhJYx68r2hoOYkaV0BRYiKtWIvn7lbya18kcPKYsHc2+sz6L9/PipHEUHNKYBxOF5hCjuDYs3erFoEpfCHt/Fy09PJ5XasavNXaiFbDRS/ApeYyM5flZUwL/umNxBhQY52O/75kvaB3QVm/1T9ScMRoN3vwtrBJNLLM8YKctHVUeJ0UY+hPIkfE8K1lZLNliHKGWNeyQsY3JxyDg6A6195gcde4+0MXWarUdJK8e8gYYDpbiVu+L9fudOaUggonJ+88FKy1lPXLg/oh/G+W6iMbIhZZlsEgHPVXWUqgPaw8mRypZ7rnfHjwx1YRvkSQT0aEQP2xGsjgHu2T6I61/t6p4Z8pzqF7Yd1zN+4Ik5QFKHhSrz+MBgaLDX2XAjF1vpaKxohc3sYswlMpaX8y87Es5Sgqfu43Pl/0c/MaYcKPL7XAad6a89RPZzstIkwue69cQk+GFYIJ0aNgY1Pas4NluTpyj8a5eQuV58uEX+4/guInxUoPD/jTJs/7eWLYTBsRw0u1boYlLvReLqgbrOcE2kjh3kg8qBM0GtpooC6hG0rzwWdftf/OOpguRHEkbgym7gy7VJlpUNPoaiNwhQ2qHTBj1wiSmlu720W9V+PAEfd/LKkHMg0JFjo=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(36840700001)(46966006)(426003)(478600001)(83380400001)(6666004)(36860700001)(336012)(1076003)(36906005)(4326008)(47076005)(26005)(7636003)(107886003)(36756003)(5660300002)(316002)(70206006)(86362001)(2616005)(82740400003)(356005)(70586007)(8676002)(186003)(8936002)(4744005)(82310400003)(16526019)(110136005)(54906003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 13:02:47.3533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 988de9fe-4c0e-4c88-b642-08d903336e14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3820
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

