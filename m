Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FFCC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 May 2022 17:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiE2RFs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 May 2022 13:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiE2RFr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 May 2022 13:05:47 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A444587A1D;
        Sun, 29 May 2022 10:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrcXrrFrzhMQDzWv4e564har8sl47RZbWPWqbiYYjgSTVgmTmTV1mnIR92gjTUVa6fwtXOS5GeHeJbEO5SyJTnyJESEgEqEekIuCAUmWk7Ld8uDmAxEaRow7pmD3LabjKOyWkyGsPagaA4Y/j8I0WrQSZDTcSx7QPAp/M/a1edapFyCQ5PWbIutdFw1mZ6Wh+FvYtiNOJuqFUE44B1y8rpWdr/RLfm6KrC2Lja6rjyfNYHmbV46I1fmqby+CQUmpT0yrRy9xh8hfWfmsPpph1sZ7Q2CXVzjZqenxs9tMA0LrVpO0TyZQmAi9tEejv+lL42QRAb9HbLSAoEVNYorvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSjKMO0SiV81XSRaX5sqA9oWJBZwnvM5GwFmiKlFFV0=;
 b=j/r4LP3hAx6Pxf+XsRL8p94wCGDLCt3L3IRmL2ZT6T162NzsjdAIlT8ySv7nDl+WVYj48IL9uLU2jhVGEWnzPFCdM2lzhVI7SmO2+r4CDyb9mznh0KqG3Z4djd43NzRJzI2OW65kdE+9epbJsaan7zUcgUAfczdZvJYmxo3OpadPj+XhTWeuma4fJNs9V3DG21KcjzBfNOlxKURgRaXK+ysbJljSbBbGJxAYDupivj1yBuiiQ9UEcb9CQE31xud8y2drTckBfG9tiwZ06ih6zIyXbaPbTSwf3Ln4sznnO+nV0UkS2IvYmycggav3RSqqWC/W+4K2lpM2oyY1/gNHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSjKMO0SiV81XSRaX5sqA9oWJBZwnvM5GwFmiKlFFV0=;
 b=a1nyFAZAl7Xx5mzmCw4Bf7EfSERI3o4sLQsRD/4MiSXsZgEA0I9bm0wUoNYbtFcE1W8EGJ2o4Wi3qVrx30u8d4mD5LfHBTKCXKUVGUxf9Q3GmNUWp2kjl1eg2sBpBkwvjeFm2bX+e+4Yo4ZfX1cc024vMPec0wcdmq7z356fnmMjoiSPm9aHjauDI5yxuCDPS9zMcFc9rRHTNnuc+CuQ+T3HiTw0dp59ToMhFG4VsOxtQ88NbMmVQRi4ONXdMQRq5a4g2lh7ML3FBDPLxIdWUCRawzp3B/JbUR2YBAVkYlkAMmiEITmoDS/bouJq7CvZ0vstijE0FLtI05IqSQhKrw==
Received: from DM5PR10CA0013.namprd10.prod.outlook.com (2603:10b6:4:2::23) by
 DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Sun, 29 May 2022 17:05:43 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::7d) by DM5PR10CA0013.outlook.office365.com
 (2603:10b6:4:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Sun, 29 May 2022 17:05:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Sun, 29 May 2022 17:05:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sun, 29 May
 2022 17:05:42 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 29 May
 2022 10:05:41 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sun, 29 May 2022 10:05:40 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v3 0/3] Add support for EMC2305 Fan Speed Controller.
Date:   Sun, 29 May 2022 20:05:33 +0300
Message-ID: <20220529170536.10043-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8ec97ed-18ee-4710-acdf-08da41957711
X-MS-TrafficTypeDiagnostic: DM5PR12MB1835:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB183559A6F08F9A69DBE708D7D4DA9@DM5PR12MB1835.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBC885A+DMWxbR4Smz9v70mmK09bbArT+/UYOebp5vgOrOc9QhlblqXB6+ZrlVSCRJ1MO5nK6rGh8YZMdflhmxhU5Gkeywl1CwQGjXQMejcc0KRM9hTxUQ8L9sq4YZbjw/E/uZojrpMP10RUxVbXDB64LGD/oMvCGeZazT1IE16PtRnppX6REXerk7H5pH8e+d0iT6AF/BsN/QLQ/72rOrChRPlgySeyg3SqT+rSqGw55xgg6xEhEu7J3jCf48Mz2+quDKTb2LkEr0qTLRqdS+toaq7Nak4btWUUFcaRYt9SylEJcewhEXgk2k9skMT2uz6t7KwR67dLTLKfnurJGZQY7Xq6L5JzE8WLB5kLGM8qEUiQwWUVgTLgSOlLltGwockznaFukQcyx7Ki+yNstsqPoHo+Bu/OEdPXLkO1rg87kvsD7Bid8cGqIq1R62XH6P/U0YcwGrOXeTCxLmRz3u80QWRDuR5ZLhVrfH7LmtYL+IUYW0MhFd0zvaUUJMXgkQh/Lfppfd/magOZ4A6t24WAw0OwHXpNKpkT7P26sTyEuIwoX5vFxFzFW7PMBVdkHRhv6KX08Bbq9NXo+g+L+wyO0V8nbEXh4AKf3cke6QK2DHuvOhkV0QyYMGdDHyXXkRF4ikJTSlS7PUHjJZ1QXu607awzJu/piGgXpTpdz39eWaSX7K7YFDAHaC2m4wQIgmAXmp+E+/cDHGWKHZahcg==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(83380400001)(2906002)(2876002)(6666004)(508600001)(81166007)(82310400005)(26005)(47076005)(356005)(40460700003)(86362001)(316002)(110136005)(54906003)(70586007)(70206006)(36756003)(5660300002)(107886003)(2616005)(8936002)(1076003)(336012)(186003)(426003)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2022 17:05:42.8832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ec97ed-18ee-4710-acdf-08da41957711
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1835
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
  dt-bindings: hwmon: add Microchip EMC2305 fan controller.
  docs: hwmon: add emc2305.rst to docs

 .../bindings/hwmon/microchip,emc2305.yaml          | 106 ++++
 Documentation/hwmon/emc2305.rst                    |  40 ++
 Documentation/hwmon/index.rst                      |   1 +
 drivers/hwmon/Kconfig                              |  13 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/emc2305.c                            | 654 +++++++++++++++++++++
 6 files changed, 815 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
 create mode 100644 Documentation/hwmon/emc2305.rst
 create mode 100644 drivers/hwmon/emc2305.c

-- 
2.14.1

