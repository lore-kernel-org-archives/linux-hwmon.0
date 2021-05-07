Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE1AC433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 17:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DDFB610CD
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 17:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234906AbhEGRQi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 13:16:38 -0400
Received: from mail-mw2nam12on2054.outbound.protection.outlook.com ([40.107.244.54]:32993
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230499AbhEGRQf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 13:16:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWjIn01Fq95du4P1gk0uzBprQsiOvmfvC2akpi11rFdN+Rp3nTvqM+xJBgIhWUgf9uMn9nIqA+vB8IHr6By27G0uYRlFdYPWSxchLHHTMxZ4svFRNzNjTLFT5+CVRzXNYYsyhFCw3miSGN1N2WGURJnodjvA55Sxyjo3C3aVDOf5ofXOfHMiy31rcLRPiwLNROlbN1UiTgGo19pg1YassVWxnq/2iwt1BzNDpj7IDn/Bej+6Oiv8/KNHduWEIw3L4U0GzRw7YccLi2imDOmqgvzsBKA53euinnFfevFjEJ40/BLF9+aBiX2EqAVjbrJ0VaO0aWxiuzaEteEBcR1Ong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ygzb4f5ozfFYQ5KccIjOqEjlq2ecr5N9Gmr57aBh2Zk=;
 b=VTV0aFkHMtbC0VTa7mwlY+o1zox29KGkB32mQ0cH8+1t2vt/bJb0Ton/sm9mNSKGGvjoYzk6cIna2o9gMhz6SqLYyrnp9+qrM0gvkuQUa0l8zORewHzwvXNLS6mGHirZ6TNgjTJrkdDIOuAIMkCSTnTyNpJ/VRAi0NRAYdi9Nrpeju34A0V7NyJ7iksSiCwFcWXLcWDJetavrJEQlX3kpZwM86DMRHDYlTwZQgOIOzJsLlS3yEQ+N/WF26FNociM6e2BwXZGgNHMcIN7flzfAsrHe9oD2uHWczlMw42zQ/aMF7jIfg6PDy5M7/VNCfGkqm+C+z8q4oDVZsVPoQOC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ygzb4f5ozfFYQ5KccIjOqEjlq2ecr5N9Gmr57aBh2Zk=;
 b=ZO2VgNWwd2yPK41Lsz3CXSYRlF9MxGTIhVfn5KNV4wRaHVq7ZnZ6L0v4HfvGUlP0kt65tD7vJizs8W52BDSGPB6Ow0N6IUaPRXKuM+p/lIJfkfuhzGRW1YtSXa6HRYRIVepieF+KfzGocaAv/fgsdqbtoLEPVWJoOwrSgyowjqttRfC/DZ+knhmMoDZAY0CuN+XDQW3f05UyP9c+zVM3rfmU99DKC6Vlst8BwiDXg5iMPPr7SmYcxFdqkHe1lLwgso2cTdCF0nw+y6l6s0n2vBqP69wfm+wBlQm2Eprd9nvfM+x1p8gmGbijQF8yRy/ng2bMZNr0LGH5V3NVq+Zkgg==
Received: from MWHPR13CA0013.namprd13.prod.outlook.com (2603:10b6:300:16::23)
 by BYAPR12MB2838.namprd12.prod.outlook.com (2603:10b6:a03:6f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Fri, 7 May
 2021 17:15:32 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:16:cafe::eb) by MWHPR13CA0013.outlook.office365.com
 (2603:10b6:300:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.12 via Frontend
 Transport; Fri, 7 May 2021 17:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 17:15:32 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 17:15:30 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v6 0/3] Add support for MPS Multi-phase mp2888 controller
Date:   Fri, 7 May 2021 20:14:18 +0300
Message-ID: <20210507171421.425817-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eda839ca-31b3-454e-23fd-08d9117bb86c
X-MS-TrafficTypeDiagnostic: BYAPR12MB2838:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2838DC409CBD415703319C34AF579@BYAPR12MB2838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CN4nSuCVL2DR+qmNV+2CvHnE/+1uBh6bXQAm8OF+i8EvZo8f0/zCyuYoniF5yWs5B/vDyCmBHknLCVw1NYysAMB8Uxb8lSuVwvzjAijpAsK5ujomJ4UvA8w06guNwf/U8CMED5I9m1bGhvKCmbRWqqYVGjLwldyXmRdcY9NNPwPv4FOEUheQTWO6+RNpBSE8RpvnZfJ35aLSkPyWmWamjeU6ViN3B7q6ygLAkmhoBhch7hhzlpngh+bOMSm9Ca9w4m+fBinhJ/vVH0CMImdKu3BelSQlde+qHaAr7dCgBbsP8J4JcacnwySDuEIzYU9wMnXMwWNLObfVJmKA8jt9RG4npoLYGtKizj8I1t090L9MAz6kCJPHzAecD0sw4PSIVsvxCStIIZ11SrGFBnHGrZN5lFxWwosFMvAYgKOgi3pgWR5ZhDt3YN+N5TtqZ7GauX8yQK+i2L+BpgneMJGwtzHpoxmv/pv2A5cm9o9rFMz0qAXHd1oJihFpfCN30TaJFDpjRpYG+UxBwNvwEfzIP+m9SkSfXM74qLdhzsjt3jooG0xoNLIkzZX4IqZ/1RWgVHhDE9pfI2udY7IpV/cyzG6R/RbTNA+mxB57+O4fidbh2U2zm1cPza3ePBMre+FjmRZrE+ib52RrAuWOUhO/q9ryPMQwtTmPba9ct3NW6DE=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(7636003)(47076005)(336012)(2906002)(4326008)(26005)(36860700001)(82740400003)(6666004)(83380400001)(8676002)(107886003)(356005)(36756003)(2616005)(426003)(82310400003)(1076003)(316002)(36906005)(110136005)(8936002)(86362001)(5660300002)(70206006)(70586007)(478600001)(4744005)(16526019)(186003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 17:15:32.1291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda839ca-31b3-454e-23fd-08d9117bb86c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2838
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

