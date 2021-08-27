Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E735C43214
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 20:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6941560F92
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 20:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhH0UQ0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Aug 2021 16:16:26 -0400
Received: from mail-bn8nam11on2045.outbound.protection.outlook.com ([40.107.236.45]:37345
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231488AbhH0UQ0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Aug 2021 16:16:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cloocTvLKLKKzLjXq/vM2sNwPp5YmV0xWlola5ozmaoMCuvXVcDehcTxJ5pFuKISDMjYoTuoEPSEuTE8KgLDMl6QXfE3vVQ63W8vRjJH7zbLJ/2SB/99d+UwgG+cR4NCJKVkqbk3lP/HUTxSH+7kp4Xaws0gFZvpwDP1vpbnusT+VWz8MMuti2VFQ34oOkWIsoSFOCA7erd0wgwKM8PpKTn+VjHmYhI/QBBTvVj5KNxD80SM/gJJzMkJbFZspanTZy+fpVI1jLCfjxYMVHak36L90OMQ6BzqoljDAvCYDhXe4FLp2B2AKIcyiTpqmFs3hXiSP5WVhSBZgWYQ8NyPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeyVEL6dyZztZYtlzTjIB0fZBVgf19mR1fXJCdjaYEo=;
 b=aWcjPW4Byi8YBqOEIBvMq2O5gKG0BfsIQHtsiMe9O0jrqj8Qu5SvXA4Rurnofc8WfkFe19MUQpXShoXTNnRYKEuS8IeGJRvgq3KfUG7mwSgaTIjNQu0QRpH+HCTGav5ZdJ/7svIOzrNxTMgYCxz6LNqp0mhvt5pfm9no0SWJvi5UyKyEniQ+/pF7VqaReHCDr/6Zu2jqu4VoCHEQwbyZfnb+15nWEFGGy3l/FIeLV1fGeIrItQrWWeqPEYCfjdvnzKuuhrO1A3fgmVCYV+BXtITYHThCKjvke4bEan6xslk2TbWfoUaoqEHaS33SUezXObyzz9C6eNIhKRsgg53HUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ladisch.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeyVEL6dyZztZYtlzTjIB0fZBVgf19mR1fXJCdjaYEo=;
 b=tx5TnuZmptfSc2c2ToKkDPTmIvgWjNp3Cu010alvPspDXUedefGSsU0rIpbGVAiCfMIqiHmvicls2eCv5ptgfvphh4VJ5L1pvwMJZY9NCCbUii1OHwGDxkVBIT0bt5JNMpk54KqSsIxg+gAJ1LXgyM1SCEGvvzX8GJs0rpeiHTA=
Received: from DM5PR20CA0025.namprd20.prod.outlook.com (2603:10b6:3:13d::11)
 by BYAPR12MB3430.namprd12.prod.outlook.com (2603:10b6:a03:ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 20:15:33 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::d1) by DM5PR20CA0025.outlook.office365.com
 (2603:10b6:3:13d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Fri, 27 Aug 2021 20:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ladisch.de; dkim=none (message not signed)
 header.d=none;ladisch.de; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:15:33 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 15:15:32 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Clemens Ladisch <clemens@ladisch.de>
CC:     <linux-hwmon@vger.kernel.org>,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wei Huang <wei.huang2@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 0/3] Extend k10temp support for more APUs
Date:   Fri, 27 Aug 2021 15:15:24 -0500
Message-ID: <20210827201527.24454-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8dc3484-15d1-48ac-8fe3-08d969976ca8
X-MS-TrafficTypeDiagnostic: BYAPR12MB3430:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3430EF30AC581B42D600A4BFE2C89@BYAPR12MB3430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqQmNPp6oYSmZPTBddY8i0yGsD9x4FMmiNXGwLlEH+nNE0SYb7MArUQOomRL4Zi1RAUnYIdde1KxlXBWpbr49qSOFjcL54DrbtAn8Lok7A8xNdP+3oqYb+Mu1r5KR/Z5zPoTYXL/UP0bHp0b4qnQ2rOVZzNuoKkk7vPkZGeimcc515JtRvgHJ9AVCg73gukY73qWbuDWiphDA4FySDhK7GpDmN7LerJ6nl5GTVrdkT3vKm8NL9g31BiZVzTBujATTPV/vjdoj3qgSvtoBE17SztpgsOzXN5eePimwSw3+roer6UbJIzgnjxnAT2Om+iZCdChtpmWb3mGWnf4YI25OrjTzW4FIgrG67HXvp5cDoTsQyyy4NigjlfGK0CmRvhu4xxSLZuwct0AK8SYEpADemidQpsCiW/4ko//o/KgxA0opyrfu5t+WPKckJObKH/z++1Y/DasdrYn76wRNZCsZE/YagX9eE2Uhz8YASNEbf1kYQBG2FUkTdrZfjqAtUL9+0xwPMnL7L4kLg7yOUeR0C2vOIvT0HZyo9+2vo5ZG6aVP9B7WFat/naF67Y2GEI6thaCKxTHFfK5aeiu9okv5Wd1It2FXKbm3ZjmlkCvnn0J0oiFHQrwUIiUXCxXRjGISwaIDnQ3E86yKF8Y0dtMd/TvxRE+yiqvHvWwH7jhcCopwLQCcD1ymKoeb2PSDn8aQ9REVFX1jwWpPOLjrdlGuImF0+nurDmonOvv3UpB50g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(36840700001)(46966006)(426003)(478600001)(336012)(6916009)(6666004)(83380400001)(82310400003)(47076005)(82740400003)(36860700001)(1076003)(36756003)(4744005)(5660300002)(86362001)(26005)(186003)(8676002)(16526019)(2616005)(356005)(54906003)(7696005)(4326008)(2906002)(44832011)(316002)(81166007)(70206006)(70586007)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:15:33.2570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dc3484-15d1-48ac-8fe3-08d969976ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3430
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend existing code to cover more missing client APUs.  Some logic changes
and failure handling will make this more scalable for other future APUs as
well.

Changes from v1->v2
 patch 1/6 (zen2/zen3 ID's)
    - drop from series, now queued upstream
 patch 2/6
  - drop, don't rename existing stuff for no reason
 patch 3/6
  - add parenthesis around offset
 patch 4/6 (error handling)
  - re-order, move last in the series
  - don't show kernel log warnings, move into errors passed to userspace
 patch 5/6 (don't show tdie)
    - drop from series, now queued upstream
 patch 6/6 (add Yellow carp)
    - no changes
Mario Limonciello (3):
  hwmon: (k10temp): Rework the temperature offset calculation
  hwmon: (k10temp): Add support for yellow carp
  hwmon: (k10temp): Show errors failing to read

 arch/x86/kernel/amd_nb.c |   5 ++
 drivers/hwmon/k10temp.c  | 108 ++++++++++++++++++++++++---------------
 include/linux/pci_ids.h  |   1 +
 3 files changed, 74 insertions(+), 40 deletions(-)

-- 
2.25.1

