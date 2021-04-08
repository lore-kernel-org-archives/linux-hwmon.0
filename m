Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A148CC433ED
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7034F611C1
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhDHOSd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:18:33 -0400
Received: from mail-bn8nam12on2042.outbound.protection.outlook.com ([40.107.237.42]:53089
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231921AbhDHOR6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Apr 2021 10:17:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcA9DensdNgXa4RRsCsmiJDp3iSEwo1wpYGqKMnjBGRbIMbxkNtPmvvqdIzkAJS9eH/3SEhH0OoaE+tESFf85rgQVVPG96QC34sRlq2IrvmySrD599QGqhWMX75KH21OiFzWjaVUflUDm/R+5NdPIOLoYZKC1On4UPLhCpuG/843enl9uy0aulYqP9TZRVvPDXNly86ECdLEurhWvGrq1HpmrfaubVDdTz0toYpVVOawSjTz3yGbTumUfWk0q5tQskNy4q8jj0pVxgu1BvxEIqs6bNV2nmG78tyCVqsqQdbx7i5rHNuCKHwoKGMwKcDeMnaZ9gTRU2R2HyC7gpxXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PvKtvMzN0vfj9EScw6kTuMudN1eHYNRX4/Da1Re/Ns=;
 b=lTLtxO5Bkiy2dEpXE5msAlngy2gYn6x1k0fEPF9ajKtc6CFvDTNwYzXrUqCEyaJfKOd82qLpSLxzupHhalqnpN7pvutmh+zUTZxGKi6e1Lp9STR7vb75H1WVsk9VRD17Y6hvZcf8t+X9qQllfPuXGmQzeyEuajqAO948sFU5FiVCkaxzW3FUiKMbDRjz01FLqSvcOKXu7e/lTFYtAl0c7advMkNT7bfdrRvl4ubXlQ+p/4HbUzSYK8ST7pQy5gsKTJcSZD8oGWgDXbk+UgXVOeobqBnSDpd8qB4xzs1XZVHuE22pQeZ0ajHZM8HCUE0AEIP+KAcKwfaPTZcmyjz04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PvKtvMzN0vfj9EScw6kTuMudN1eHYNRX4/Da1Re/Ns=;
 b=D3svgWefDAgwwAU/HjYneDgc2qyvP073+wYr5ZuS2SkFfaUZwr97oCJJUC9StbcLHqtdBokCJYSTWUpXrf3dBowXG4+Nxs97DoLohLyPX9FAC31Rs6otuQiT2387h+vbwb0HQmsdG1nqsyCATJQsrPBpH/cz/w+inn9si4gNi45y0uw9D3IRdh7N+nkBzxb8R/DhzwJCh8Wc4ZhT/7pP9ob66Z2jR5TMRbL/sUolkHNPtAUZOfq7K0BxL/YWDID0ooLPiyM16vjNEKR5++abErIxENQkkjR81PvDQFmkiy3JYmpkDVKHQ3yEHAiVJKibKn2+pYUhkO3PqZhXwHxiYw==
Received: from BN9PR03CA0018.namprd03.prod.outlook.com (2603:10b6:408:fa::23)
 by BN6PR1201MB0259.namprd12.prod.outlook.com (2603:10b6:405:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 14:17:46 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fa:cafe::f8) by BN9PR03CA0018.outlook.office365.com
 (2603:10b6:408:fa::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 14:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 14:17:46 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 14:17:44 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 0/3] dd support for MPS Multi-phase mp2888 controller
Date:   Thu, 8 Apr 2021 17:17:23 +0300
Message-ID: <20210408141726.2561683-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9a3ac71-fb83-4309-a930-08d8fa99151b
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0259:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB02593CDE9A016E904FC5C33EAF749@BN6PR1201MB0259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUFn0nKnA2zXXLkJfKTii+LQsb12vsCq5QzENV3D2V68qmmxSOpfDdfzUl+khvadLUmmGBYjl5gWLliTIPy9MYcZByjc5bm4LHtCpqqamL/tvKwcQU/LcW4OiShH86hg7Apb9/cqpCmR3h/YG7N89Q3B0TNLJS7aUIBwvT1bVeOfmwYj8x8A9Gw/V/Hd/0aafufzG6hmby2ULOpIOnpgEL2p+xX0V0xCwdTG3enYpcOqnpaWPPKxi9l0v2ti2T7N1QRL7zZ84XtPv2lUab3LZY4gUsGulvn336gXhMSA7HvH4PmNVoj4xiL8lxm+bo5sSX20Danb6EVEBTLxFJrLgqE2OHuU5fPMtNwU/nwZfLEQZKQhM/FTIBPJ27fkxzRsFrOmpMDfxxaIbefi7oQchYPH6/P0KA0S3KSFsT7rvxhTbAzDiiKhYN0DZr747SeRKKzMTN40i8ksXPLVSbHwWeOtbP5O+PopE9th4AmvI+rstbc3/DcYbKKFQiV4Uhbly2EDhzJr4+AZuY48GN5EdY/uCsY99AAbhFFYQHWOBi5V7OP3bDBBF06FAeaSSwVtA/Wi4hal/vd5WnVxv9vHETLqRgd6427ssfS2RSIvUIZcraDNfOBIpIW2alqjq1A9AUNsSlj+h9DY8CDCI4KuZkYbuBMwm3VVFkqNX3f6w5c=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(36840700001)(46966006)(316002)(7636003)(356005)(8676002)(47076005)(86362001)(1076003)(36906005)(5660300002)(16526019)(110136005)(426003)(82310400003)(36860700001)(6666004)(336012)(26005)(54906003)(478600001)(70206006)(8936002)(4744005)(2906002)(107886003)(83380400001)(4326008)(36756003)(2616005)(82740400003)(186003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:17:46.2150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a3ac71-fb83-4309-a930-08d8fa99151b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0259
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
 Documentation/hwmon/mp2888.rst                     | 111 +++++++++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2888.c                       | 256 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |   2 +-
 6 files changed, 380 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

-- 
2.11.0

