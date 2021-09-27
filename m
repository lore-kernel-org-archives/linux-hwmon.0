Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1C7C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Sep 2021 07:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D27760F94
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Sep 2021 07:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbhI0HJm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Sep 2021 03:09:42 -0400
Received: from mail-bn8nam12on2057.outbound.protection.outlook.com ([40.107.237.57]:44001
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233035AbhI0HJm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Sep 2021 03:09:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkA1qNrbzXvzJfqLddhrosBv/czY8ljH649vc+qb44XX2T1FiWnX9n+kzr4Clp07DsFj8WQV3mwBXE2668jHrUg8oTj28pTNC1qwg+WmEcyaBP/BF1tFeaio47/UUOzWSWurbKGMe7gGzmtVFKVgLHzjMwxU6Qs/SoqdIG9KXbxSTW3qp/IW3r6zBU3jls/eEkrtd4sTHfminC7/S9lUZQB35eYQl6eA1hdg7iBq1TJomm+YpGIaxHJoINyB6+EQmn0CjxcGiT6S7dLze2QjncOP1EvGZa58Mx+C/Uiei2U2OV+/Ggd25QRsejTca3lCYGj3XQqR3lqagmxJDhY/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oB9iAIlgp7zwproKI4agx3hn06g4w+ZS6NLOIfE/Pb0=;
 b=iMR9ztMu5FX/oo2lCHIJm7jgVGCsdEk902TKldGnGSUeacffPxv843Dfgy0MeHmnOmNo+pcBRCf1MP5Hbgpexe0gBoe8RI1ofy5nXTkRJGQ2NIAoJG6t1ts4cQNNo9Lv4pszL+f3nKlX1K0yvQRiYlieU9QBSuYt0MOM7NnZtyCxNNvUH0Hna1Fiy2VtW+GK8/VZ62d5mbmu3mu/QQL6OQSd8k1Xb6Bov2h8EKELwf7PqN63LUrAr570doraTwHLf4MvFdoK05QUjE4mZgYbVAz0YywJhqzpv0MBzxvIBLWZNAWNKaCfuBOVGLjSFZOZKXsnu2O6yuA8m1v3Rebxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB9iAIlgp7zwproKI4agx3hn06g4w+ZS6NLOIfE/Pb0=;
 b=Z4sR0J9wrCf7tjkd9q5NZaAug05GeSrvRKcfGKhAYxVZDmQyM0tFaDPy9+vGLTuOW019z9697pEz3hF9N6lDkIx755KotUd90USh8zue1K0qFMHHtKKY2tqG+7CpQ2JK+7tAOnKVKpcIGBnUBv3aA/VcidY+93G8VbmQoY4dMcUsZagSWnnnCMY/BlDtb0qoLJjNkXL7fxxjXHAWzKR3v58pDzciOEM0ah33IlcLNh0+6lz7PyqcERpy5ziCtWJcYHwaZ7B6bwTAlsp5mWqTGfvexT7wabduh02SZWhUBBtM9YJGHCTXx1QLGfxqs1lOs5mlojUC4/AVvm+Shwtjag==
Received: from DM5PR15CA0035.namprd15.prod.outlook.com (2603:10b6:4:4b::21) by
 BN8PR12MB3201.namprd12.prod.outlook.com (2603:10b6:408:6c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Mon, 27 Sep 2021 07:08:03 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::77) by DM5PR15CA0035.outlook.office365.com
 (2603:10b6:4:4b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 07:08:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 07:08:02 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 07:08:01 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 27 Sep 2021 07:08:00 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 1/1] hwmon: (pmbus/mp2975) Add missed POUT attribute for page 1 mp2975 controller
Date:   Mon, 27 Sep 2021 10:07:40 +0300
Message-ID: <20210927070740.2149290-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a59a42-6658-44d4-0959-08d981858c0a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3201:
X-Microsoft-Antispam-PRVS: <BN8PR12MB320169EC345F0CFCCB67F2B5AFA79@BN8PR12MB3201.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ycuTZKeHWb8uYBAKW3T7+zJbgrcn0a76RGJyg/Q0nlM/D5qsAW4OFJS+hF/NCyuC8MCzwzDbLJglPXqHTiqtlla8+qV+0jH3hm1gpO8EWiSR/7PTrg2F/5ARgCg1b0RDdGYO0EaBuOtCvwm3Pq+VkA5f0CWwS09/xn0UpVUTSqgPNMDCNYhbwenj/+4GHLeq3N9qGmUQe7U+lQH3anj+QLZerQRV9UfsDNhvmplRN6pCAYtVB1XfiR/XVpixsGP1fF7gnW+cGac/vq7DQTfGtWTl/8gfnISpVTB9vAAiWRiSXaRsJMz2+I3D5WFJ8kijPiO375Gh2oK1UNyVt1Qy091cs07zIP6BXZ92bti/HrQgH2J2Z6CFa8+SwGQsonEez7gB4skTLZ+sNzlDjCYKsIFHfGXvKY+nrePIr/iHTYSmeZy85ym2+nTIl9H3LAhI+1WI6fRRl06ZolVjfIT93JpRhYb2KTx7RebVSun89GkHG22OBjv0nFe41eWEikEgxg3ffOAj30cPjeNkei9yFgcdRJYJqvt4OSNCQ7s5kNtxaTkcFGqqPiUK1KkibCnEFxZebiquL29dMG7s2Ti8mznPQjFILq9yokNNy67WtB4em+hS7zH2WftZSyiT4bwx2MTiHc6YDUm6a/vO/D+OBSCQkBMAPwuamXSAuNwSt3b09uHrXFGrJxjlnweIFACjU6X9nbaWr3bAJqbF7RD9/Q==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36906005)(4326008)(316002)(8676002)(356005)(6916009)(508600001)(36860700001)(1076003)(4744005)(47076005)(86362001)(54906003)(2906002)(426003)(336012)(26005)(2616005)(82310400003)(7636003)(6666004)(83380400001)(16526019)(186003)(70206006)(36756003)(70586007)(107886003)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:08:02.8617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a59a42-6658-44d4-0959-08d981858c0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3201
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add missed attribute for reading POUT from page 1.
It is supported by device, but has been missed in initial commit.

Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/pmbus/mp2975.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index eb94bd5f4e2a..51986adfbf47 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -54,7 +54,7 @@
 
 #define MP2975_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
 				 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
-				 PMBUS_PHASE_VIRTUAL)
+				 PMBUS_HAVE_POUT | PMBUS_PHASE_VIRTUAL)
 
 struct mp2975_data {
 	struct pmbus_driver_info info;
-- 
2.20.1

