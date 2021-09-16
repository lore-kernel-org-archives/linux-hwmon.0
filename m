Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7615C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8817061212
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234490AbhIPTtA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 15:49:00 -0400
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com ([40.107.92.59]:8160
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234687AbhIPTtA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 15:49:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT+OdrmAvaTdFnsFOD6z8lef40BPF1acfnAlutMLuW9orzA+HAJj9TAyIHI8zctkKf+ZrmmrvqdHnj81jo1MbNrOdNHJ4YlLcY2EwPyaBk3yljsm0nc9dcFJ0xwb5alrRu2GKbHVrsuWpAiuHiR+tPO4PvK+B1Vl/CEOJBbR9AeAucBrLhePywJ2sTIV6VvxqXcxOP8EBdqqGPcK+OWb9f2+JxXRDzAP0VrKPgcZZAKwuPM4iRi5Aco9Nqcm6nM4+LOjjaUbrZjL3jb7g0IZ2AX4SxxxGE4e7diEdH/NiUwnTPUv6S16TmWMAZckUK/G4GpItx5ARxwSYz7SkF5ZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cGhk485O3glovL8ByCqvb+UXkA5qLtVz6is37Q1m5/w=;
 b=IYi4j2eQyYOAQUaWZr65F8YHcKhSNQcvsD2mpAt1r9vEUXiJxScIhEvb8cYn0bIZODDC+pJ/3hXF3CBH0t2WDSLmDamGxghFNOXFANkE04nUD4Zkt4QztmjRqZB0qbodqSB5rJ7erfHKK3DDELrwII2udtkH7uKp+kwGWO+6dgmOsJH5fEdp6rnSVGc1rhM5IMr70yO82hOWB1hxIaDJqFX/qtUn8VZ4uOD3es2USAYP3E420GmL7Q1myAFr/wk0yr1Xd/85kqrBKa5CrL85lbv1Kse6o7LxdVpfE6SsdwTRZv2yRxLyZApMdDoFgidR8BZfv6r+kaOThWwOYpyqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGhk485O3glovL8ByCqvb+UXkA5qLtVz6is37Q1m5/w=;
 b=MjGJbF+x7bix3qt0fjQTtRKtItrmUXnWZPppI1PH/qYFGi4jA0DW31shxCL1dlIqcN0K8+dPhp6cp4gGBXO/y0WfDpuQ5iFHGKUB3tjJ/OMcxmYOt93x2K/aDu2rxoOZ+06e3uBKjdv1d961tFnQnb0zsIKBjFROj7304Detuy1NgvAEJ4eJCW8+elfQiSV2kDrclRwKRglpjNw+ltEcJCzeQ3Tfe7br3MXe3tR1B3dF4rDDFjd1faiAKKxeE2XE2xOCx5r0456tjTRuZd0sn6gt7n2ab9hxGOxt/HAfLVkxrmbGJWJPdwAcmfsKNz8F24x2JcFSuyVd8xM5q9peqg==
Received: from MW4PR03CA0290.namprd03.prod.outlook.com (2603:10b6:303:b5::25)
 by MN2PR12MB3854.namprd12.prod.outlook.com (2603:10b6:208:16a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 19:47:38 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::e4) by MW4PR03CA0290.outlook.office365.com
 (2603:10b6:303:b5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 19:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 19:47:37 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 19:47:36 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 19:47:35 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 0/3] hwmon: (mlxreg-fan) Add support for multiply PWM and extend number of tachometers
Date:   Thu, 16 Sep 2021 22:47:16 +0300
Message-ID: <20210916194719.871413-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbc9acf4-a760-44c2-b417-08d9794ad5ed
X-MS-TrafficTypeDiagnostic: MN2PR12MB3854:
X-Microsoft-Antispam-PRVS: <MN2PR12MB385452AD0C94FF6FE5174552AFDC9@MN2PR12MB3854.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9Fr1aZymUCV6Y6TjplN5ii+S7uZTkiZp2qkO+EG4XqMOmPtYAEQWTWxxAWT1ChM3LFNf2kWBPoBULVAtPCTIRDGhsAKuzowsGwteocd930hnXm3v25/OVG1mXvKnPifDBVgDNr39KTU7aYkfhIAXVImg66IS7Lzve5URYQq5HU6cESNYpXVgG/64Xzi0nSBseKShlM6IbslQiUG4qqRNPSv0TMEKNZjZhczknEz+GSwSJGyWAIVWwpImGVY65eaqw/9/tWZGddofezS2FHJ1q5LWIvOtv8Xh/vn7ROK1F/zpoAijGX0a4ooUsW/+JZo3CbjkHVG3HPtYtWfm3a9oOx7HZpHYGijWZvSbWYAL7XbIFtLN9dIUg4ufO80waKM8vV3w0UYks9nns0XDnLnouB5tkewW31KTwS+NvEU0nJpSL+f/5lIsiSQWvZXy4oq9udkbqLiCKVMgINt/MrxyIQeVzVxMe93pnozS7QRIe6NPRyhd5IB9ZEZXKDin2EoYoo+TwdqMKz16jekDA29e2nZ6Kt2EeRiCMR5vPeNlilc5KK1YSk+G4TKnwxwf6d0AoDnLqLKGgd+u8mfgJlsQatKzAeqiL8DjVed4xj58rwwbWGSRR4BBNSahBje5abCswS1YPAT8nkW/8hEL+NoLUF+Ca14EHo1n/g119yveNcm985LlwEc7Y5T7ce50SAO16QI0GkMIwhjo7j5bVGj+Q==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(4744005)(2616005)(54906003)(316002)(7636003)(36756003)(356005)(70206006)(86362001)(82740400003)(82310400003)(47076005)(36860700001)(6916009)(478600001)(6666004)(1076003)(107886003)(8936002)(8676002)(26005)(5660300002)(16526019)(186003)(83380400001)(2906002)(336012)(4326008)(70586007)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 19:47:37.2182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc9acf4-a760-44c2-b417-08d9794ad5ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3854
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend the number of supported tachometers.
Add support for additional PWM and cooling devices.

Patch set contains:
Patch #1 - extends number of tachometers.
Patch #2 - extends number of PWM devices.
Patch #3 - extend number of cooling devices for thermal zone bindings.

Vadim Pasternak (3):
  hwmon: (mlxreg-fan) Extend the maximum number of tachometers
  hwmon: (mlxreg-fan) Extend driver to support multiply PWM
  hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices

 drivers/hwmon/mlxreg-fan.c | 129 ++++++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 36 deletions(-)

-- 
2.20.1

