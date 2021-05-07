Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E600AC43462
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 17:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AED356147F
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 17:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbhEGRQj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 13:16:39 -0400
Received: from mail-mw2nam12on2084.outbound.protection.outlook.com ([40.107.244.84]:45024
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234482AbhEGRQh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 13:16:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMUtQClt/RQczaqvCgrLpdzS0OOrxT5+G+IyHWSmyusrIGPhjwwuddrA8/7M5BK77YHGZ2pbnFGIjmSYJx2jJ57PNcJnE9+AEYq7KcQwcRt5VYLKRwpSP28JJdGcXz2P9R9NjxCrBSyYrK6IFSZccNz+NKjV6fyD4RWq0evEo0GzxmGo415W2iFxr01QjUiZtYY3mdRgKo+gUDIFsxZP7umnyjiqbu7pcrxUCVD3N4F8q5Fm/UwK8E9hI+4t2jFTauSdB4IfV5kP5Zxy5JA/JMNQtF6R31sfQ2nYb+UBU8MgbokX33kESwOXMFg0c9biQvMVogGrM4Oo4c+6/RzqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=GFL73wVHXJeciYkrFX5eIKKwknE7wTxWUUARvUaw2KABP64VnRVuGN/Dn/b4Jn4WlABVKRiwyWLhtjoqjIlRb1/ZuA1YCBCHinqMPQmzdQDhHpQfd80upRRlvzoF9gx8cyNrSL+aUzBB84GSGUGh2O51oAPrMTA6xzPULpWLHM2V6VAtRb8Cgl7XsTCz7ZLN2FClwhnFyJ8DmDPZ8Hm8XQ6ATNK93Wo77ZZyC72b5na02DuauLOaK9bpv2rE97Yuwq33T87kxcC4KUTQeVQhxx+m+oJR5vUutuK3QYGU1845PTRnW3tlXn1CHXuLWng64CcOZ3dF4wY1ndZaFe2JUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU6UVHEHYZRlGqlh+ElCuuRETDxuoRxG4wlYtyGBn6w=;
 b=Zt9qawUFFdeLDADO0i7cCAU8OnB2yGPohNSgswMLLfGE6MMhESIqlXbiibYAkJRNrzjLXh7ZbvFLDTZDQXIK8VYtzVdng0uymlWV34XBi8vUB+gG649IN4VVll3gz32j7IIzgs+TV1V63gBS97+uyH8rwpnwo6XKqzBQn6SFNRAglTGkY4f2yzNUIXwKnE1/1lIwCuaBMREPnYPGu+5mpPABKR8lA4MlyyCN73cU9hSwYlgzAel7yN3vMqgn9U1m8RMt/ZkrKIrBg1omSilWVJtdz/iskvuv3qO+EOSM/SDnl1bqgLMdIElQ2S6dlCz6SrN8W1QtUzhBx89Xv1cjHA==
Received: from MW4PR03CA0119.namprd03.prod.outlook.com (2603:10b6:303:b7::34)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 17:15:36 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::1d) by MW4PR03CA0119.outlook.office365.com
 (2603:10b6:303:b7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 17:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 17:15:35 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 17:15:33 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v6 1/3] hwmon: (pmbus) Increase maximum number of phases per page
Date:   Fri, 7 May 2021 20:14:19 +0300
Message-ID: <20210507171421.425817-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210507171421.425817-1-vadimp@nvidia.com>
References: <20210507171421.425817-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23aaaf77-c009-4f99-eb10-08d9117bba7d
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386A099A29A197793804550AF579@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViJAZe0AlP3gxR0FJcnRfBCmto5PgCXsD4cOtaEYR/y9Efr9+4n4qKlQW0CfgU2Ex0+jXVFHVgwyM8KZcdpsypmxCWXc8h4mf5M0/RDm2xxvvUyKqd9X1kimBHl4yV470Jl2QZjuer1VGUFYZYivK5pOW5b4JsF8aWncJcJt23MZET0h1nln+N1aWgS5iUjem+E/dI/6XqIIDfsC0uDOIBdlnPz2AATaPUWJFU7k5MIQ8L1C5jn2SQTTiRTUrOTWOOy78NFjTmxawXq+G7FNmIQvpdrw2iNruqGehPuEkGvJtIwztBE6k62mKGbDNGV1BFqE/KIebwrD128VVhKlO1fFILsp36d/YHerVDenT2SFa0qKNnLqj4M7unIysgJzI7KprbXB973S5LScpeYY85WBrHfyW01ISu4g9VeAkVhLUvkbd8sd7Rwn+YpuVFSpMfqHxbrqysxRNqWAkMu0jZ2oD/aOwg68l9FxPIPe2RCqACazOUXgR3qo/wZwFNWUpLYWbMnRNovc+HniRiHUN7Sdajeh9m5mvfVWKybneywL7zpfMs82qP2p7JouLeR0f6gTq6xsQLoPs0uX62sISCoVoY9LW8LFSR/WNSfjlMWx/ZHpDeb7cLNvjS/TJKAWR0pd8Uaa4AxdiekQN83BWZnqjabnbsO1Fy4uzLJXZ2U=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(47076005)(82740400003)(186003)(110136005)(478600001)(336012)(36906005)(316002)(1076003)(86362001)(7636003)(82310400003)(26005)(36860700001)(5660300002)(16526019)(70586007)(2616005)(4744005)(8936002)(2906002)(36756003)(356005)(54906003)(6666004)(426003)(4326008)(83380400001)(8676002)(70206006)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 17:15:35.5880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23aaaf77-c009-4f99-eb10-08d9117bba7d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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

