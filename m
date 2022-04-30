Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC7FC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Apr 2022 11:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241528AbiD3Lwg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Apr 2022 07:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241588AbiD3Lwf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Apr 2022 07:52:35 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4A075E72;
        Sat, 30 Apr 2022 04:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WW97UiZCcvwDzr2nqTjgkuaiVwsy8GKfLscfhgbzrNZODPCXSpM4z6CfI4WU1iEbD34Fqlkb+Mvi+yxCcEru05nuX73gXh+vg/sqXcHcu9/jZJj90mxs5R0qtEF+q+gFFOI6370xZSSPGAzuon1dZ9cFZ+sWobOxdXKQ32sskBYtYQ+tyAYrC7FxW0wVeHyh/PrepY1FRtzadpsAKg9o6AnbBiGBcKqMF8/HyN5hpljyTQ9diIszGTQf5pLZMR+m95rqr3Xpmk9a642NM0UfMXUV3bzcrRZTo1ge7IG9kFi384G7UwpHl8ZcK9CpWQx9+QfqeuzaRORIba4J26PXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRkiW34dIJK7H2kNz6yya5kOmmEs2h6vi3USxXyhDvY=;
 b=gpZ6EADddLtCgfLdBikopYqS1k5+YBB18S9s5P5nDLPZqqPiex98NLCrI1baia7kZ9yHf9etyr4zkxb8nzZAXT9v8klHMGO13d/bTMsEdxDKKw48XorbQh026OoAMXf8s+8BGnB3Mwei/yBNbLfP4R5U0yhQzvnEc56K9jvMhqX9HCtklJfSrNUkwo8tmuFzbatsrOP7lO/gzWQHDSdPQDhfL8CD25ctWcKtppBwEEPtzvvYtSunkD0g6R8s7YUiXzcrvwxTunkQA7LWGmboMjHxey03fxuOBqC54tG44GmER66DzFIc92npI7Haud165N18O9YElmafDDgC8fx4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRkiW34dIJK7H2kNz6yya5kOmmEs2h6vi3USxXyhDvY=;
 b=B9pm9Pei2XjqAtQS/92Cc1F0EM+OCs7OzkwYOo/eysW2XK3wOT9Us//MOrDBkjxwWIlVXm/NGSXoRfkaYyQd7rXx0caTU8mspSR81mrQrMo6WKv+KDwLoesXq2u3zY1jp8uXgkNCt60yFKtnSWvJV5+TwM+eDYACB7SujfUC7YrC7/Cz/Mftiq54wHI/tsCyR361UdGehrjhIQjvifUqGZRK/sjtyIGokqY5NzW3TI3eQKMn5VorphdNyUDFI9TffxBo9AeFqVDjSiYrBrWvoCejHUofajDUkul/AXMmWvPdmPXuxVV5oS0vJ7wzXFOqGhz/wp/FSIgl6tT9xdEq5Q==
Received: from MW4PR03CA0264.namprd03.prod.outlook.com (2603:10b6:303:b4::29)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sat, 30 Apr
 2022 11:49:12 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::b) by MW4PR03CA0264.outlook.office365.com
 (2603:10b6:303:b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Sat, 30 Apr 2022 11:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5206.12 via Frontend Transport; Sat, 30 Apr 2022 11:49:11 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sat, 30 Apr
 2022 11:49:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 30 Apr
 2022 04:49:10 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sat, 30 Apr 2022 04:49:08 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 0/3] Add support for EMC2305 Fan Speed Controller.
Date:   Sat, 30 Apr 2022 14:49:02 +0300
Message-ID: <20220430114905.53448-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a78b14e-5183-49e1-8d50-08da2a9f714e
X-MS-TrafficTypeDiagnostic: MN0PR12MB5929:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB592922D070CD815B09758B49D4FF9@MN0PR12MB5929.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +tnqe1TdhW4cnyZvW0Guv6ol5LQhfMfzlU2jcqhmvlNotvuZxWxFvEUMZXMh2K00fIbF93vEv29nnmk6z/O6gH7NsF/+J8hp8had6ySm2v2N0PbNFNvTIGGMiR6ug3h0AecketMHEQyvVq72ksQJG9nRSm6Ts9SjufIAxEm3QG1sjkqc4lFXsQswCAehJoJGI+aIOY5ptYnxZqASt/H4JoTbKt7YNx3hh5mThg8Q1nA/+nDe//cdzSsPLvVkup0OqUgzeiqk8R0WlWSUQnTViziqmUf7P7rpB+ln8x5KEbLim/Oth3qb6vkhtXWrv6YBZ1uuvQZSWw5CCy7bkzKrq99kMTtRwXIUmlM14jJm82FE0AmBAUOkekz8D3Sd2VH9tUAS8og0l/oM/qwI9LC4wyC8jCHvmAnJxspyvvhNPnGcdMl2TFRYzSFptcRrjEiUXJusX/v+BpsI14BlY8AbhPTpJJ3hJI1pAlL8hZpeVGiDYZt28uOPtGg4FeXm51eyN4iefa3Bjz2qgrmEy7T9Kp7DpayXaBi+6VXbQBBCS0j4VwnalpX/7S/TpGpvRKkhb0WB02A11qnriEw6iKhhYMbD8jya6b5zLxenqNeEudA9uQsShNbThC+bipeVtOKgz00w9ZDmkeWjpRfY+nNWOstEIKzQmgrRJwaTUO3xmjSCs6PHyl7vrTMP/2EVNk4FiYZUaeKH5tMUX//KUaCw/Q==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(110136005)(6666004)(508600001)(86362001)(40460700003)(83380400001)(5660300002)(82310400005)(4326008)(8676002)(36756003)(70586007)(70206006)(1076003)(107886003)(26005)(81166007)(186003)(316002)(426003)(47076005)(2616005)(336012)(8936002)(36860700001)(54906003)(2906002)(2876002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 11:49:11.4392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a78b14e-5183-49e1-8d50-08da2a9f714e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Introduce EMC2305 RPM-based PWM Fan Speed Controller
The EMC2305 is an SMBus compliant fan controller with up to five
controlled PWM fan drivers. All fan drivers are
controlled by a programmable frequency PWM driver and Fan Speed
Control algorithm that operates as a directly PWM-controlled device.

The closed-loop Fan Speed Control algorithm (FSC) has the capability to
detect aging fans and alert the system. It will likewise detect stalled
or locked fans and trigger an interrupt.

EMC2305 offers a clock output so that multiple devices may be chained
and slaved to the same clock source for optimal performance in large
distributed systems.

Patch set includes:
Patch#1 - add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Patch#2 - add microchip,emc2306.yaml
Patch#3 - add emc2305.rst into docs.

Michael Shych (3):
  hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed
    Controller.
  dt-bindings: hwmon: add microchip,emc2306.yaml dt binding description.
  docs: hwmon: add emc2305.rst to docs

 .../bindings/hwmon/microchip,emc2305.yaml          |  55 ++
 Documentation/hwmon/emc2305.rst                    |  40 ++
 drivers/hwmon/Kconfig                              |  13 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc2305.c                            | 629 +++++++++++++++++++++
 5 files changed, 738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
 create mode 100644 Documentation/hwmon/emc2305.rst
 create mode 100644 drivers/hwmon/emc2305.c

-- 
2.14.1

