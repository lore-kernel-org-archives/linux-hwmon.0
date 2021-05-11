Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AA4C43600
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 05:56:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63FEF61930
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 05:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhEKF5p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 01:57:45 -0400
Received: from mail-eopbgr760073.outbound.protection.outlook.com ([40.107.76.73]:17401
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229807AbhEKF5p (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 01:57:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCW+Z5Y+JD6Os9kWCAdC70NMycAx/UTTeZtnEryNtW7Ok0tcLAEflwmzHaRbMfmhnqCKj4YKh0dV2KKQXD+YdjZrHkAGjaD4TlNGTWh3mgBA+K/xyU3Z8V3bFx63GzPSddWLjzslFMMfoG6oYA6HezysbdUWbN7P4Sr6nxtcOhT6BQ0e+9np36REyg4YqhV9MYeKszWXYTbLud+eAdN13+/+hjKUFZL9IiYmjt7CGXwKgAt5JHbFz8MRsFb/YzWxBgRz40aafMqOciR0rHYXGwdCyFNIPY9Ml/n3uLTcE+eEfZuVxiqNMt6JgrgAiHHA6qEw8WiMRjf23KgWfibHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llONgBL47qPNce6jjE2BK2KZELQSIwnMIg+v8DVWmfA=;
 b=H5ddMyI6VY77eYvjeqryJZx1siBOrWxE+jMjI5zD8yk5PEyMSWK2yKhGtCKkY3MgOGin4D8ajwqVRi72WJBRfUFEean3de21hoZBcLSm2ztvl/HAJSgS62puUQy5Jj2FnsOOUCyJ423TBPn+BEUlEbnVqtpMeVn5emQdpaBX2LmoFJ/l91XgAYnyRp5zLghe0YZbFskZN4xAgIFCRcxRwrv3CiVpNs+4xfyFQiksMqh/vWvPswdcMb8DF6fpiNsMATwDW693m9hdNKvMvm08g7k+Wc9zL7ghZ2OqWPJ4OMCXYF5ACJJx7SzxIX8IyHAuyb50H0+tnVHLWclJBVyaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llONgBL47qPNce6jjE2BK2KZELQSIwnMIg+v8DVWmfA=;
 b=qRlA0UhSHuhbGRTwDsIdOYJtYN7Oif/YP0SZP9Zqm6M32yAqWHLmsB4pgr/KuhbHh8KrWkIsQ46TDrwPPQ1ku0BEFBJy6dUpYNF9CAVJmd8ZXBYgLy/ON4KFzwwf5D26kqvmQ5JH0gOHrkXGbnxL0MEElfq5TvwKpB8EoWuQdW7Ua1fGjynTHjS6oAROGJp4s/n1WHQszbI0l6BdU7zBjlHJykquF6l7idkbxheaS0BTvMDJe0oMM6ZNkvEbh1k07ltsKG8MLWAxkGyyfbISnskqCYxA/UrFmePvBduagStx//m+ZD8KONh+i0Tfqg9balMvI+PmtUtMyUZ5MTL07w==
Received: from DM5PR07CA0168.namprd07.prod.outlook.com (2603:10b6:3:ee::34) by
 MN2PR12MB4815.namprd12.prod.outlook.com (2603:10b6:208:1bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Tue, 11 May
 2021 05:56:38 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::7f) by DM5PR07CA0168.outlook.office365.com
 (2603:10b6:3:ee::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 11 May 2021 05:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 05:56:38 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 05:56:36 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v7 0/3] Add support for MPS Multi-phase mp2888 controller
Date:   Tue, 11 May 2021 08:56:16 +0300
Message-ID: <20210511055619.118104-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d872acf-8f9b-47da-1c19-08d914418af8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4815:
X-Microsoft-Antispam-PRVS: <MN2PR12MB48151CBE38F22510E05A46D8AF539@MN2PR12MB4815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H5QXS+NBkcgTREyWHK6+18+tR4OY4jAcNeo37UGxgchNloY4FF57BgS2E0vxUlf7vpenD+O8EBN8PBXPQBBo/hDYyIjWjKtq4Gb2Fp7ztEp9+ALssLeQbTGstRemWG0x2kMxpGGOtn6v07x5p1eF/p1+5gydOZmoiWLF68gQRbO3R2oLN/ddKyeGXEctp+p275gsnmVY+naEWuMlIaVxujzISqzFDRtfXE2F3+Qno0j2qU7ykgOqR1HZUiJiKpXAdsWJPl4kgXZJ+MLSDVT+XmWUqpXNIoJeKNUUnTQCRWjR49erlIDmDGQ1oc5zQs1Sq4x0KaQOl8wl/r3pp3cnpwbH2BfvTMAnym0Vtk5p0SI3dV6Z/lkH9vfeX2KTxnXhi7TJCUPRb0Q1DnftjhP1JwoDosBOEnt0eaj30Iv+d1jxOmx1UiPKFeG90fSj+1whroAM7xrVQc5RqNiPkDnpq+kspyHxOQye5P9Pznld4cYnj4Ivt8XIw2A2kExLDEIDOupYYf+xsAuAIYgs//NyjOzvm3H1xElNoCfUN1oj2YIuTxIHH/N+neM+zeahJSvCGnXcnnA8bY/ETFNehehxFq2I7275nijwg7SAYqpWqU2w/rTFLuxlWUuM3wl59MPIxyz7kS9CstX/DFftkjN44G9RSAoQDASkSqA5AZRnj1c=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(16526019)(70586007)(186003)(26005)(2906002)(6666004)(83380400001)(47076005)(8936002)(70206006)(82310400003)(36906005)(316002)(86362001)(426003)(107886003)(4326008)(5660300002)(2616005)(336012)(8676002)(110136005)(4744005)(478600001)(54906003)(82740400003)(7636003)(36860700001)(36756003)(356005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 05:56:38.5492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d872acf-8f9b-47da-1c19-08d914418af8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4815
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
 drivers/hwmon/pmbus/mp2888.c                       | 407 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 6 files changed, 533 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

-- 
2.11.0

