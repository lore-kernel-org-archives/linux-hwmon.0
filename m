Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5557AC433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Apr 2021 22:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26F0761159
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Apr 2021 22:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhDZWTK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Apr 2021 18:19:10 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com ([40.107.92.67]:63456
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237344AbhDZWTJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Apr 2021 18:19:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nah3urDaoehjpab7M97wPU5cQvPS+c2gc/XfLPQFSC5qGbG0oS5zVZ+bCb/IDy2XIFhpXEysxPGE0Plc/xkiuiict/+/vE6usumw4TEihc+UHB5YA8VBfSAD2LNpo9KFPBd/dGZQfoXCYB6GvgbmUfsF3Gebnrz2I/dZ82GHRE/vipKVbXR0q2cYedG1eFkMM2Hqsuf7KZ7NO29p+WuPksv60D8vzXchGT5WexzSRmf1RSCPDWNWRJO7x3o/D0DIISrNp2uTEk9YoQVBgiTOOj953RTZQDWqdrXPrO3lC2RXjQwF8u+EL5B5B7vo9z35CJI+iKlxu34UJCR1PtKhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=Jbm67LXYTqNGm9j7qzJs9ZyO7y1ZM4YcmJsT4dA9zT0Sf780beCqjzLck2vHZsKmrxCtim6h1DMHmQmn1jkFSxT0AyMXLi8QhfVP6q6S/WfP7FBh7rrQA/Plo9ftmeAaWNGFNLV3NGsCGZw1JelQh2dpTuGBzy+ETIwpYGf669PHTqkncENnOLidymYeUulRx9JsStA9gI+8Ehg4ayVogvluDLQga6zIdW4LD/pBMu6a9lA5VPT4HgqX/1s/tEwYKGlj7gwDZFMkkR7BnV7QQtPp+0k30tYNv9xIVNFfkaQoDyczZGJvjhdqkgosK2Z8xC9zP/1aRtmxffV4If8Cqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=ghxGZmp2XDlUiq2UT/iHBjsiqpiziJBxLA6ADQDApEhmw+/n3hNXWPYJnXO8xNPSmnP+cbtrrR60mMcxBBIdm1TmEt28CLy0LQvcIcXLeg1FxG4OxeDrd2K5dA7pbvI9nTAoJ/dyWQwdVHQC2DNep75ks2l6xu5kBIkSyyAQfxDFSmL7N6DBYViW0SC7fuUycV39wcymvyxt8uwlJI2xm39M/hqA1Klv7Oz+24MNA0ZRyPGSqstcRSu/AqPRowP3m60RGtD+qmcssLsbukrRAUNFagh2FQjyjN7g69FIwZnxDfyHP9wb/8EhBwBKs45PL1Rtr8VLQQDFEtVT7mSvfg==
Received: from DM5PR2001CA0020.namprd20.prod.outlook.com (2603:10b6:4:16::30)
 by DM6PR12MB4699.namprd12.prod.outlook.com (2603:10b6:5:36::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 22:18:26 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::f1) by DM5PR2001CA0020.outlook.office365.com
 (2603:10b6:4:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 22:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 22:18:26 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 22:18:24 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v3 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Tue, 27 Apr 2021 01:17:29 +0300
Message-ID: <20210426221731.1718613-2-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e7380c5-25e7-4750-35d9-08d909013698
X-MS-TrafficTypeDiagnostic: DM6PR12MB4699:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4699E0048F81EC91D33F72A9AF429@DM6PR12MB4699.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92Pcb++kf7Jb9+WyZMatudz7ayTGfrT9jLPFUra1RSZi+NSPw0cHlP9yoHqLJIrJF9Td82ey4mdtAh5v5UaDe+DkCOeUqVlx4RhBvX2Z3FlbSK4BJxxSY6vYnqIFuWUrsfjbHgp1McleGd8s1RZmrBi4G4/m1kqN+cmP5AfDMRIj0LeKaiZejm9Ym9U8NWBdo8ty9hZ0yquW9ShQ/J7xHODr8d34dfDqsAb4cmPUudqsWSDFZykxbgAdyO0c9xq8UpgvQXaMKNiYqP2tVwFfge+dne1nDuu9Hn+VNwuhLXyur0Cqf90rKAKgROg6WQ6NLCWT7HVsGwa+gdE3aAJ2lEHuDb+NJV6YSc3EvVeLaWrVWoWXeFU7CFPOEGEYQyy6k5mzhew9cm1eCY4Oqg8FxnAM1os+6tmzdzhvy+fuXHN9CCWtRVWoOX21WjS7w+VK+s1hnM5n5fxIsoXzOHHgJUikSuuy1SEaNSWvCXdLzb5lzGZZKh0QYDmjba18xrpjfMgskpZkDCOVw6jXaguOss1lotfugzdMvxxV4QGVU9KsPD0DdN5iUqWBblOaJhfLu7CT5SlfeaJfMVucoMpwArxJ97B5FeydhK+hWV3OTnl9FHfmGlwLwCxq0X4gcNhrUZSm/GUy5dIcqeOtap4m0dtEc/PQFa4AxYTAjAEAYXE=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(82740400003)(110136005)(47076005)(107886003)(54906003)(7636003)(4326008)(478600001)(1076003)(82310400003)(26005)(426003)(186003)(36860700001)(336012)(316002)(16526019)(36906005)(86362001)(2616005)(2906002)(70206006)(36756003)(70586007)(356005)(83380400001)(5660300002)(8936002)(4744005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 22:18:26.2789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7380c5-25e7-4750-35d9-08d909013698
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4699
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

