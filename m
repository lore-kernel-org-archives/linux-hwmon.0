Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DB0C432BE
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F255C60F11
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Aug 2021 18:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhHPSRW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:17:22 -0400
Received: from mail-dm6nam08on2052.outbound.protection.outlook.com ([40.107.102.52]:54163
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229959AbhHPSRV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Aug 2021 14:17:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SboMDRdbs1myAafDszyllYM00FIJk4Uouy3mABL+DRHUgV1VddXlG9OjwoH7rhBN8/cKil3j3BmwVNU63yZAlOQ3EVr58uvVS6+9ICnSnLi/DZGgCvEJ3mZjPR+2nSBtnrXAlzmg2RuqKKeeF+yGXG33yfsiFKrd9H7OuX/GVbMRvM0nTLpBzhzer6ZxdkNzXBVxnwyPveQ4HlPl8ujsv55G2A6P5cF7JyUjJAn/wOJrQ7RinBxh317zxh3ccuOJruVtLNkVz5gAKtsh1KbID6rwOzbW4l+l2c25EWLXaA+FYyu+NAvKT37tQGnoykihO+3CWqjAo7mk3VOrBb9IzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/fofUa81Qq+ZSwd4Jv2n5dNPZC1KIm88eNRKKMsnhw=;
 b=epANa2qpvZHs1gx7Md7H9tLvdoMBEZ+slslCJG6wHTrf/05sXMwZyKBrVhTDsBF5e5EjOHfqQIHYXgA3yTlIASlQ5seYXP+mdO2M1Jkn/gzeOhENzTe0gdBlZlsbMhUYFCmF0KvhaFSgi4SJ9oxxNefwcnoWu9985ac8tGBUd7e5KvLwyitVcwW5sd8eO/p3nSoThgESxTk6YwDVMlb53I+5b6/ygULlYSFBS/Togat/4lonle+YAaX9DOXu3rISzHDI3Z8wMGamlW+T+9bAeW6X8kPlcka8Mmw/sohoeVreKLziNHNjGn4O4ghWh/Mqaix5HBzb0eLVEF0YfIXlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/fofUa81Qq+ZSwd4Jv2n5dNPZC1KIm88eNRKKMsnhw=;
 b=C4xAkpWVD17bNZ9WkIYcw+xWDg4wkyIPPWRMmEfkNrzN2nhPHv3vHcem9Y0nKL7OlVCdefoAFbxceXEl/8gixL9Kuy2jRshxn741ktsWYOo0aAqwLpBrXh9NwrXc6zutkyMbBMOFqdF5V0Oe6AO+Xkk3XFOu9UG9xepv7ko+zFeJGT3iB4arvMVdmUCSZtvXskcr5Ap6QHs/mYF5IismR8surq3nL3e0jfyfO8mOvfXx8vgL2pJ2RYnTbOHj0nkT7vwL0uuVLYqus7akciYrMXfexptZC9qhAdB4laiYgzmdkmdrkcKly9GLzg7PCu8KgU4lg1D6GnaTBBncgnXVOw==
Received: from BN9PR03CA0190.namprd03.prod.outlook.com (2603:10b6:408:f9::15)
 by MN2PR12MB4782.namprd12.prod.outlook.com (2603:10b6:208:a3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Mon, 16 Aug
 2021 18:16:48 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::ed) by BN9PR03CA0190.outlook.office365.com
 (2603:10b6:408:f9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 18:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 18:16:48 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 18:16:47 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 18:16:45 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-hwmon@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 3/4] i2c: mlxcpld: Reduce polling time for performance improvement
Date:   Mon, 16 Aug 2021 21:16:14 +0300
Message-ID: <20210816181615.2625662-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816181615.2625662-1-vadimp@nvidia.com>
References: <20210816181615.2625662-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eee4bae3-0cb4-4f95-ee2f-08d960e20332
X-MS-TrafficTypeDiagnostic: MN2PR12MB4782:
X-Microsoft-Antispam-PRVS: <MN2PR12MB478218D936441A69D07FEE26AFFD9@MN2PR12MB4782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H9UySd+R/CBWFX1P0p/ULn9z2LNi1zvTcykN8Fb2wORT5v40Wo+IHyG/VXLaqNK3x6wz4F+JnXS9NSfG5p48WSQfqCn7jXR0pKQ5BAQOo1K9ifNwCY5j7RloVDsADGzfJCfKXJ214b5P4WFDPop7kikYoC/6HnBMgTgQckgawwOlYqrRnTJSRpMrG6WctwJWZcgKCY8PVsz+q88JktCqOtJnNE+d49Bj8XAurjOcPHrxeYmoU8ZGP/DYInvYGyCVQwsl1BntRWrHZHzwZWWpir2medLSpIfa1pqNQbvN8FPTwq7//MWZfFVOrXt/QgVEQjMKtmjSGv1xa2z9kYWXPJoNLeouTu4TfXj6EksWKIcoE1hVvDOeBnz+pQaLsDniiGyIQDROnTJz5Ec2GF74bAEnPfsOu5i1psb/fYrFXoYVi5uHcFQtcL8jamp3mq7CY37Nt7LeJGiWT8LKcLsLzyWLkRTOrPGvhUm63pSoQ3JeDh+Uv+++Yx6aQDYGYebAM61Pkpi5EGT35uUVknWx1nESBrEQZ8yZJZNxE44nO6Hr2yMX533mu2FThG5qHwcoDBsp13NbuSXQFgP8s9mHITzw1Ab2NgZ5id69Jv8+tzwFJ+8xadiXP6HCte3XX2SdzMDehaooblXgWqo137hryT7A9/VkzD77+PE3E6m78wWlX0Ic9W4chOeRv7kRsuVM0GOjf0Ra8jFgHS1SDpk+7ssOFzW04+NXu2dvvufS/wU=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(70586007)(82740400003)(36906005)(16526019)(186003)(70206006)(316002)(8936002)(107886003)(26005)(426003)(36756003)(356005)(5660300002)(8676002)(336012)(4326008)(2616005)(54906003)(82310400003)(7636003)(478600001)(86362001)(6666004)(83380400001)(47076005)(1076003)(36860700001)(4744005)(2906002)(6916009)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:16:48.0401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eee4bae3-0cb4-4f95-ee2f-08d960e20332
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4782
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Decrease polling time 'MLXCPLD_I2C_POLL_TIME' from 400 usec to 200
usec. It improves performance of I2C transactions.

Reliability of setting polling time to 200 usec has been validated
across all the supported systems.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 015e11c4663f..615f0a98640e 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -27,7 +27,7 @@
 #define MLXCPLD_I2C_MAX_ADDR_LEN	4
 #define MLXCPLD_I2C_RETR_NUM		2
 #define MLXCPLD_I2C_XFER_TO		500000 /* usec */
-#define MLXCPLD_I2C_POLL_TIME		400   /* usec */
+#define MLXCPLD_I2C_POLL_TIME		200   /* usec */
 
 /* LPC I2C registers */
 #define MLXCPLD_LPCI2C_CPBLTY_REG	0x0
-- 
2.20.1

