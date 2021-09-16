Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C528C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 211D560F6C
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhIPTtD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 15:49:03 -0400
Received: from mail-mw2nam12on2043.outbound.protection.outlook.com ([40.107.244.43]:45696
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234580AbhIPTtC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 15:49:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/4v/sz+IWBxHyD/QjPkE4QnoqTIp7ktQ4CAFjpsiWOyyqFG4uBi2txW/YC8W3x/UFxi9G+evdqf3LURep78igXbwEKJASaDm1DGvvyLkHctL5JGmlpAnJ0f6TdeU0Z421naoZKp8lFzqgTKVP+BhlgqZO9LznH4VXmj/+0QNQd+qG4cP2HoAnPwVrs5S7ZktAVa4ze4PPEKVpbx1f+5hq+j0jb5VObm9WWF1rMD+bcn+iR51cI88eRJOSXkgCRmEDZSMGYZrxNS2Bo8tBOvL11VKHsxrX/K2t7sU5gjpVUX+y34dBLYsSn8PzpPGtNXMn1mNUNSRYkHyBFIJaU+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8uo5oAGHS9d4fOS7VOHb2w44s2nD59vFkPX5950sN3M=;
 b=aUNHgNU7mqcQ4Mq7jOZyQRvyQ7bMM1fU9D3EO0LWXujiN3bJYxt77OGHsyORySsBah030f8voz0C9dgbAN0hEWoxINbXPLbsyIeRjt8ZxHruTohFIv3a+jRviq++nlTTB/gHxet4zGxqUBjil3NR0XSTKSCe4xbe/CgweS+vH7Wg0c7hhp7vHyiOTZ65DCD4Sqr+fQMzkmPzz4UlnmNh/A2owCFLjgjL4hwThfoAVKEjcVqUNZuwtHhX7QLr+GVgAdnCXGe74i1tY3hoC9woK9ll8b07jRcSV97AWnkntmp9YQoHah98wRg1AOXfZwsIvi6LZpguADW+lPhuR/burA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uo5oAGHS9d4fOS7VOHb2w44s2nD59vFkPX5950sN3M=;
 b=r3P4d67kKQMCTzrBeNsauL/xJhw1jYijqsS6WeGxgUq9NmSmMYcVyh7CImWyjpQ68RTuFKMiX28QiJjNp08QJejXH5s9KNxUHlb1DtIeOdqMa1fd9LxfAizpUX103cKNWgaLA4Bq4MN46VaVjf0XJ1Ymu1o9OM/DpDrKjOLU8wTEgJqH+Nw/UTzAtTUX2HRxD5zdTh/yDmcHfBypviBCsf+OZ6W9vHlxADcVERbXhFp6dKE7ktXlGtwxIWaGBjiV1FHkdM5w6Fu37jKJ8nRbHvhDZ5H+nYz3Z6NmxAD/aHDo6PBeXvY6QlIqMzg3E2RVja8CcN+P2ucuOU1y/cZrig==
Received: from BN8PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:d4::37)
 by BN8PR12MB3268.namprd12.prod.outlook.com (2603:10b6:408:6c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 19:47:41 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::94) by BN8PR04CA0063.outlook.office365.com
 (2603:10b6:408:d4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 19:47:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 19:47:40 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 19:47:39 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 19:47:38 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 1/3] hwmon: (mlxreg-fan) Extend the maximum number of tachometers
Date:   Thu, 16 Sep 2021 22:47:17 +0300
Message-ID: <20210916194719.871413-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916194719.871413-1-vadimp@nvidia.com>
References: <20210916194719.871413-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3364b4a-e61d-41d7-ff6e-08d9794ad7f7
X-MS-TrafficTypeDiagnostic: BN8PR12MB3268:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3268DEAA1C7596261AD34D84AFDC9@BN8PR12MB3268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a58pXd3NkySILWRv7DKrNISafhIChK5pDl2xFLrrQ7idubLr4bdk5klLG8gVDWiI51PbP346J++adVHnrtbueOJJ0QV0OA+7DMKE+CiKb1aVyPS8T3nkxlMT4U5eYwOabAT0852I2caWvt8W/EOFQYpq7+vX9vnUVo5d3BcTx/XLwhaS2Uoh0pEc+eyEc/pdW44BEqEH9n8gQ7OiKfaAIUji8x93ikd0jhRgdDncFMOn2HLyheWXcmO7Rl/zJjNGQjMEWpiMVgDecQrI8a7xY9YCbHfRQIhAseTFIenoYbyRboT/Ti1Z42NmztvsjMUCLB/q07da9IWE7F79FEUTUzgvBLXZzt+TXdQ/P3DHrMqfaHl25HfQuQ/8hpMw/evdbRXfyUtcX4oYMo7xr9qQC1xRfmzk1sdBRcOh3tuCCnpDfX70fyX6OP2En8n47a1cHmD+eiSTfKn7KLsJfhvTP2tcq31POYkjaQEWl7y/1+1coDUgOHlLkjFS1Fu4LkO9Vc/HC1cAHYLdmnGfdyXeYrcBSXbdDgVdBZdFBK6GXl1gxo162ljtqaVwbF7X8k2glonNVwEW2cgnFqzUKUe18j5bIut9Qd8II1NGveLwAee778ybzZB5VNyRjAFfvI87un7dMTTG5nHcaU8IbkNGqbe3QF5lcxLYwM3kYhPNAaFyz33MckMnNm3o1waHszP/6fTpOLCzt/gex0G3o4K88A==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(8936002)(82310400003)(6666004)(86362001)(26005)(47076005)(478600001)(5660300002)(36860700001)(54906003)(4326008)(1076003)(2906002)(316002)(7636003)(107886003)(36756003)(16526019)(6916009)(356005)(336012)(186003)(70206006)(426003)(70586007)(83380400001)(8676002)(82740400003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 19:47:40.5988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3364b4a-e61d-41d7-ff6e-08d9794ad7f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3268
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend support of maximum tachometers from 12 to 14 in order to support
new systems, equipped with more fans.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 89fe7b9fe26b..0f5b109817a7 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -12,7 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/thermal.h>
 
-#define MLXREG_FAN_MAX_TACHO		12
+#define MLXREG_FAN_MAX_TACHO		14
 #define MLXREG_FAN_MAX_STATE		10
 #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
 #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
@@ -266,6 +266,8 @@ static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT),
-- 
2.20.1

