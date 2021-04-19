Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E18DC433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 13:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61AD66113C
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 13:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhDSNDP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:03:15 -0400
Received: from mail-dm6nam10on2062.outbound.protection.outlook.com ([40.107.93.62]:42368
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232125AbhDSNDO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 09:03:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5qNhyPAB7erhS1q2DRRrCCBhTdX7x/WdC1QolVq5t+wuRc8cSDFaI3u+VnHEDmhWKgDh9KHrbl1J/nDXTdN6tXmY2vdWYy4e1uV/QZQBR7kEiOzTQSL0VNW3J7QtWOdhFv9ssYM5d9nO4SQU5GFOjBAk/0eDv2fEoCfCrJF0APt3d/hCN49g6e/JnfEWy9fomwFp9icVQ/ujMTRe2YZqXoBHy42JYmIlYLULZX8QspJnVT5qwwcqvk6rxP6wH5TP1HKMAFkeXwLDhMXIEdZVHz7bEsmn6cJzXMrjhHaa1WDAz2Z1TVvs1wZnjoslx/7Cmqr+Wpt2Sn/h3XU6HbJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W71eNPJ+fxD6+j2rLA4PGRdQAhjTuwP2wqDpYlZhBoE=;
 b=M1ySDun2W31diqQvQz56ullv5uBYAZAvHnJZFR5wonJ7oORmToTclHQvs7+2vwpWWXTuahtvNpb36yan51WzaggUrj2P54tjrgsOLIb2BxI5lKCojq97vL59MPsRuplaPx/uaCqX0p6d/1j2jkwy5wlUZso7qrsClaJXhOrTp7ZkLCcmGsi2KjhBrxX2wqLJ7Q9JEOfzkO+BrC7z/L3371o7MY0Fp+blNl7xO0E2i9oQD+I43K85EXR/I0z3LN27yu7QyM8vJmpKMf/67YQgRPDPgEoiOgPS02ufIoqUhAgS8tTLDHH1UL/cQPBLWdlyRrsko8l+5cbR6+KUXRYkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W71eNPJ+fxD6+j2rLA4PGRdQAhjTuwP2wqDpYlZhBoE=;
 b=dNdt3Q4SD9fwcwISHjQ5o4fHcuJuIK4IFqrvDXMEaoB0i1JfJ4quI7u8kTYYkmkcNCga6jEiivKFaG50zWxdYA5o6cfEss7YpBo03+3XJk3zeu2+XSXomKu3WQrmSg26JomZpojhMkcqQb3j92rPMKn4c+QmF8OoBebsQ9KYIfBNnLqtUBI8beHePOiDz7EaVLgR90c8UwLDb5GjHi++B5uE99UTPxIG+j9wnAUbaVBiHnd2zkp93AZyZmLuDh+2UfK+/BUQYeloB1vSz7pNF32uPRIcSkeCXDJyoLKXudBSHB1W5adM/JvG0q980xCO7grqARmCGuvAJj5ell8cYw==
Received: from MW4PR03CA0331.namprd03.prod.outlook.com (2603:10b6:303:dc::6)
 by DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Mon, 19 Apr 2021 13:02:44 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::90) by MW4PR03CA0331.outlook.office365.com
 (2603:10b6:303:dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.17 via Frontend
 Transport; Mon, 19 Apr 2021 13:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 13:02:43 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 13:02:40 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 0/3] Add support for MPS Multi-phase mp2888 controller
Date:   Mon, 19 Apr 2021 16:02:18 +0300
Message-ID: <20210419130221.3878289-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ebc284f-3881-4465-15ec-08d903336c08
X-MS-TrafficTypeDiagnostic: DM8PR12MB5430:
X-Microsoft-Antispam-PRVS: <DM8PR12MB543091170E3C9CB50C4C6DFFAF499@DM8PR12MB5430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7273jacISULqr0aRT1zy2RYz258feyRLbtWt/uKOjXqF+2qc2YnFUTOq5iakFfvm9GYjAFRTkVtifaafzcSmTwzkdX6DaAtz5Q1hP/OW24zhQnKjkRJ+Edl8PznkV6NWBYgNrtVliHh+oSvh0l2JYacjJ9YcDUtw70OOGet7NijX7EbKtN5hD4RJxO5DSohPFjDqyNj6rVZrA8ZUQ9N0NoMRum5XsjX8Sjj1AQLdz019kEZNVbBk6HVO1CWRdgbVygrOProdWXdzlWUWOf42cjBMtSFiBlTd8YXQiI2hCJksH7uCBoOe9vs9e7BRZ7xgNQXjCLhYUTJ94vkngXfl+1Xira3PkdmT6Xlwefrc+5MfMl45RrpTNjv+CemRY8M96TabdCLz1CDdJzLbxC1XmrkN9cI45Vro0+QBiPJU6obcsQNFcLqeOw6ZUaL1+7HGwUivxOAtvgerbXKFQoNOlmM7DTt9c9hzkUDsFj4RuJKMtdrCgOJbhJZ7dkMgbme7Oy8X0fdoZJn600gN3lFNDuFbT89ZJYxR8WOZCmC7UG2zxeJpAiLn6j1a21ESY+siaUT0LgL3rG9QjDfsgp3bhvpJnceWBOOmOj2a0PUkIco98soIjVLOXOkE6ZPu/4AAk8ZyzPs2u5+UXxbzVIbelzcBCJD/eFIfY5vnkn1D5s=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(46966006)(36840700001)(83380400001)(186003)(2616005)(36860700001)(36906005)(47076005)(426003)(316002)(478600001)(16526019)(4326008)(8676002)(107886003)(4744005)(82740400003)(82310400003)(7636003)(36756003)(54906003)(336012)(110136005)(356005)(1076003)(5660300002)(70586007)(6666004)(26005)(86362001)(8936002)(2906002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 13:02:43.9271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebc284f-3881-4465-15ec-08d903336c08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5430
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add driver and documentation for mp2888 device from Monolithic Power
Systems, Inc. (MPS) vendor. This is a digital, multi-phase, pulse-width
modulation controller.

Patch set includes:
Patch #1 - increases maximum number of phases.
Patch #2 - provides mp2888 driver and documentation.
Patch #3 - providesy binding documentation.

Vadim Pasternak (3):
  hwmon: (pmbus) Increase maximum number of phases per page
  hwmon: (pmbus) Add support for MPS Multi-phase mp2888 controller
  dt-bindings: Add MP2888 voltage regulator device

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/mp2888.rst                     | 111 ++++++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2888.c                       | 373 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 6 files changed, 497 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

-- 
2.11.0

