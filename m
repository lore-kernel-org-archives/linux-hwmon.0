Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F52C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F3416145A
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237725AbhEGPAK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 11:00:10 -0400
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com ([40.107.236.46]:20321
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234601AbhEGPAJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 11:00:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYf476dPLfE+ch9E6SZdgr/sqdfHDpBBCKx93SKcFYcTIOKB0yQKPSzfk08v4plx6+aT21HPJYZrMnv/UAcin+yuT/UPlEGM0TB535LDy7YPVy/1eFCUZPElZcssBNBoJw3HBS3kdZH9ZeUviJb8bC7uXObGPZKSLn7eJ8gQSBuRtVBwYBOD3g2yx3Jo6rGaFGJru5SxkSbTKm57nhAG1h0XDhHk302UwIQEavk3/uq34RiEDF0J9QguWvo/4yPewD3aWn012hus1ecpQIwar+rFPCNpHz8LFlQhf5BeOmArV2cvs/C1ULIkNHb4DQiaOCoI/DMrw/2C6Z8LkGwglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ygzb4f5ozfFYQ5KccIjOqEjlq2ecr5N9Gmr57aBh2Zk=;
 b=KXgXx/ow1U2DwTDQyqwT5aDqhmVkG9Q+VS45a7K9U9ezQ3/C4/fl9CXrDKlDV797F3GNG0CHlTorxaYfwtf5OSfNlnynvDeewSy3cXK0sTqykDLOi/rRFAA7NURaJbPcibhOsey2nyFlYRpgFsfnir0+xjQ6oES4l8P805q9CdCdKQxdRk6Ncdf8Um/gQWhkGiviNdw1g1WeP5AdOGQKrXD6UP5yn4REoPKPK4U9qStgaWHqoTYGVORAcVIj/Cf4rK/YF7tNDKuZzavWHX37Jn+p9pMXYKCk1tFe4BQD7FXZFpBalDGgkHlJbnFa30y7bVinlehjM5lPpuItbItQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ygzb4f5ozfFYQ5KccIjOqEjlq2ecr5N9Gmr57aBh2Zk=;
 b=lXlqAJVyIvhdLH4+iYRI2QlVJNZ95OKflX95ttwahSjQ1R7/xZkfQonpv9BcjLHY3/eFxqPCu6CUXpsbXF0ChzNhsLAU5ZNPLII55Q3bBcyHfgh/iuuLIHM2JUneVtZWMvoF6yap4o9MWPF2vTojDiuQjGn6ciMTD3lhyyImim1SBIyql8lnjvzJxa6lv+a+kSEHb1GGaNoLSX2C+QWT6P0OjExQ/j3j+V/6o5P/aRCvg+3cCSpvUTWFvw5aTzdISHAaDeN1hUBjOSZUyNHKr4lp4mEw1VyZ080vNiupIpkFhYcxW3JojzTm5SUqQ/ec2DFAVcB0/1TJSrdikBbZ/g==
Received: from DM6PR02CA0168.namprd02.prod.outlook.com (2603:10b6:5:332::35)
 by BN6PR1201MB0179.namprd12.prod.outlook.com (2603:10b6:405:59::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 14:59:08 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::7e) by DM6PR02CA0168.outlook.office365.com
 (2603:10b6:5:332::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 14:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 14:59:08 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 14:59:06 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v5 0/3] Add support for MPS Multi-phase mp2888 controller
Date:   Fri, 7 May 2021 17:58:47 +0300
Message-ID: <20210507145850.420889-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 263c0031-fe3a-4832-e1d7-08d91168aaa9
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0179:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB017998362B95445317250C00AF579@BN6PR1201MB0179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnumasLda6ye7mL7LNLBybYuPJaTLUp9cRO1S0dgsPJBbdstaAm179dbrL4NC3Ioz5mOOf6/EdspASeMuhzf6xNwZJtXnPytIR4plxJG9yNtY0M8BT3vCOIAylBd1ImuyTWpp+yekx0+HP6GYdsb3GK4lAk3xBgylvMGanz85CqPX2zi3FFYlKiZ2iCJW7ww8tyISyHSb2KVwYqD82cDcn2Czmwt3Oj1CFPa98Tox4Dpm8PmS8YbseQ8rGSKNtEEn/gfPbxI38A7Gl8YGAAyQ9IiAYYi9CSyNsdv4z1dk8c3ClLHRFwxtRDqc6WFJczlzjRLAviokabItLzFhhMMtVEvHnRRTi/BRvwf27djpcBsgNS6/r3sTO0qLpToVRKVVrVPoylNXadzDLlE5FbnQyjNWWYZT6xHR3LY9eyiQfRof4PimOW8A/By66fy9L6eX8gvbsUAulWIa1G30bpfhmXqF3CDuXTFpnczawdWdyn61sAmHL68JP1g0j9QT/iGbc5P5rGzlYnwftLRo78rbPvxZsNzUQ7CIW+bgaKCVOL3VM05FuEjILuJMp4Op49tR6kuGutahSVRu8aTmPBqepxRhlOHWsa2ULmjQRQnd0n8fggCGjows4AK91InpqmHMY3WXRuEpfjP8Qwfj7/zBp5MuertG2HRZTwqSBlVlEk=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(478600001)(82310400003)(47076005)(83380400001)(336012)(186003)(36756003)(426003)(36906005)(1076003)(7636003)(8936002)(356005)(16526019)(6666004)(8676002)(4326008)(2616005)(26005)(110136005)(316002)(54906003)(107886003)(4744005)(36860700001)(5660300002)(82740400003)(70586007)(70206006)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 14:59:08.5287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 263c0031-fe3a-4832-e1d7-08d91168aaa9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0179
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
 Documentation/hwmon/mp2888.rst                     | 113 ++++++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2888.c                       | 411 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 6 files changed, 537 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

-- 
2.11.0

