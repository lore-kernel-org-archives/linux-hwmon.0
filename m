Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1ABC433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24CF861400
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237726AbhEGPAO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 11:00:14 -0400
Received: from mail-dm6nam11on2042.outbound.protection.outlook.com ([40.107.223.42]:65420
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234601AbhEGPAO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 11:00:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCDyXXuny3VKVY/v0BzluZ9r0lctKV8gGDL89dNc44MheQX96Uw1jKVDwVk0wCHXuh64cfwpgIhUU6wAjzvbJ1XVwMo97Ud2N6iUCT6CTLBbao1UcpRqZF5phuMZimHrWNxfagej0nuHnWzBvO1uuGmmspS20OKWuT1RvIoQN7c2XmgxutL8kzK8YM5ia7EHyekuVG/ucrK4BCSMEo1nUO85wYYGpX5Npa2H9+NBZ93LhGf9sPumR2Ckg85y6JaVRpZxwGIwaVkT+UgZ/YxRCxKnoIPZSFm9gmAvjzIZ05jcz+N6S5P3/fxdFhE6b8oFsxEHxklOHWgCNSjmUI/Hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=GiHRPqzLESY/khUP4s0xH9kit/0ZswplHOatgKW3tjJ1E2bzlphxH6wrVZIsp6JgnYCKVUgA2GD9ZT0yNYlePKZcWA6OBCyVSVlHWIE1NBXzwdmR0ZyO0ufWowsTw5sAIJmVhLuaF3vV+f0pP0HBCZDzMhl8hzXtHKPQsxeAQAKr/NHtc7bPur7gr6q94rmPXNwEiVmyGVMrLlkcuFm2dL5+ePJEEMTLwXpBC8snLJ22xeZwKuv9WlyWv/hhLs/WUWqu89XYgbNb/aiWNs0K7Eemg6hEFlV0IaFI5HBx9YRT6G2ONsATQOJ/CReGF2v3G7/EYL+xz+HIYQclrvBI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=F6bkfcoSyWqqsrH2BKvkFqhswkesoDWuqXQcICmBacbQoyYveWoNjmZWsH6+Z+HItXBlc40jCRQOxeHZtS3Yg3nJLh34pSajYBJEL5/RuOaAG2UPgO3Ak6YTDOad+KHNPJk7zo2rhDdDerczq8Sgn52OMUFSu7GhnYLZSXSqOkRbiUh0i8Gkk3r5Fu7tdIrOuzt4rEzC0YuD+xVrLtIcOCiTXqPjIltAv4z2Trc38pqvR7XOSq15gjwT+B9XmWfEIT3ivUffKACAVfZQRhmz7MQYDLcKcru6kfmxXqRe2+Y7FhoblkFn5Hdq7xSA6/jOhzxdeBuPJzwAoRH2ixMt7w==
Received: from DM6PR02CA0075.namprd02.prod.outlook.com (2603:10b6:5:1f4::16)
 by BL0PR12MB2355.namprd12.prod.outlook.com (2603:10b6:207:3f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 14:59:13 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::fc) by DM6PR02CA0075.outlook.office365.com
 (2603:10b6:5:1f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Fri, 7 May 2021 14:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 14:59:12 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 14:59:10 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v5 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Fri, 7 May 2021 17:58:48 +0300
Message-ID: <20210507145850.420889-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210507145850.420889-1-vadimp@nvidia.com>
References: <20210507145850.420889-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd5db60-bbea-4efc-1a75-08d91168ad31
X-MS-TrafficTypeDiagnostic: BL0PR12MB2355:
X-Microsoft-Antispam-PRVS: <BL0PR12MB235596BE4487D2BE99F2F200AF579@BL0PR12MB2355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: auS/s6aiUOvycbYziUSI511y/bMkfwy+kH69bX/+Z45VbHcnUN1WwZGXV8Wx9ahrvUT7Xx2um6w5lEy3iS1V1R5HYtD+EoDYIPqGsAVpYAV/kkGM9fiemQGFb3OqBA7krxL0s1advJsU4JB8h66zNBLrjRLVR/C6sqrvRXHQRhf1Qr60tuFGuBhT5FWJNaMdC4LXZoBCkH7V3WEvwVJRRj+FpKC8XKKiSiZAHmmbBRyxeoaEGyVxZ9G50ToxhqXeh3JliC0PaaL46pMfp2Ko2I/t6UTFuAsGPGKtzc1q3J/+l2z1vjr+JkDt5/n6uBVbvp+w5kaISg92TqJ2ubh4zYKRKJSvIBGc2PC/dQYDIpx7y7Nn9XBOl/Npm4TDHyNNcWT+/JqyuWZl8iSN2j+j3AqKUIgUJeVQTn5QPGQuZd4fLybK5KOEmy+9nd+ok0Mjc7MkX6v99Zho87PYvkzaTN/X1UIH8ftXArYXRBTMYOPBMNUcmQEaAPaEjm4kciA4rIZX/aWNCBxqE9YrjchSz64WGwpf7aZ5Ds691St+bR3ny9tA03dwsD/ArPW6x66+BMECXb9ld+vSp1WGUWsBUu4vib6bibg4FWCCuQCD0sFnhKSFux5rQ/H3UZXLhmH9I5IcymN4SSD7tJgiH+vECbkzcg1QXMUgFmt32tjRo5k=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(478600001)(110136005)(54906003)(4744005)(186003)(16526019)(1076003)(47076005)(36906005)(82740400003)(8936002)(86362001)(316002)(82310400003)(2906002)(4326008)(7636003)(2616005)(336012)(26005)(426003)(36860700001)(36756003)(107886003)(70586007)(5660300002)(70206006)(83380400001)(356005)(8676002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 14:59:12.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd5db60-bbea-4efc-1a75-08d91168ad31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2355
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

