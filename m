Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96175C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79C9F60F26
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhIPNYl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:24:41 -0400
Received: from mail-mw2nam08on2055.outbound.protection.outlook.com ([40.107.101.55]:52288
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240099AbhIPNYj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:24:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFDTN7l7xDw1zjwEIuiGs3fhB3masLqqSL79WXg059ZTlRpyP/6Cm7TKk8q+p2kSvss3LyTxGZ04lXDNU3zB8gEWJ8V7scZ+L5B7+plMidgL4sFFSd5qlDLa6kM/0HLe8Ns7FPII4cuLRsn6K+U9jP5UO7M6iVWd5r2AxpeVZi41YibRgurNuT0M7MLKVvhTX62Avxo6bS6blo10b/zdWiwr2Ef+Kdqvn1z4OHfVI0uBvEWjiQ11/vvCdiBjfw4iHMf4PLHq4666H4uyloGrZcaA8sqVRMygUNoDzkjqyo1C0yK6CeggnGB0QvFTLFL30IbEq0IuneVBPXzSV/vaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/1ttnibKv2qICmyHhtnScPLqWj3LnoLOuw4/gQhEoBY=;
 b=dYGUWNuveOyDjLp8rrbBtNqZvSuNdJ72MCUp+rohdR1lvE/C/2rhqQ/Lqsk7yr/yL266N9DIoWGmJ+7qfFLN2kAdBo70NuXlHZ7ZM4/bUB12Xh8eM7G+065qIlZGLerkCtZLLBu6rvGdkp1cyUffTNzPHb/xLxOVToH2cTr7DBV7EDDJi5Vp+P6dYoz5W+vM6etbctiiCO0cY8c0FpzHPJfUULsfKxu6wI7YVu29bUMjaA6GkbE0QfPoTgNLp6EnK2kn8fuSvBACr7XV7y0hAAZ/JNVP8zf3zEcbokRpdmmgLQKuVObjCgD1PCYTDLTW+iKg0bv838D3IfphAPKpiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1ttnibKv2qICmyHhtnScPLqWj3LnoLOuw4/gQhEoBY=;
 b=uB+CypoHejC5e2bSL9LWFNOkcUOJ7IjxM7bVX5wB8pM8BUfp3s8ueGUZXLmatRfpwDRXArnpUEl1fiy1AThlEKyQ/id8FuAPSJJAlgjPXqeTU2VPMko6EninS5qWAV2/D7kmqmJ1XjaY3dFSmpHeEvT2fvNL/Co4plZfTw1KNSFvKGsFH+PXWkwtCDSQCV7SIQQ4ziBViHFyuq0iYn8+560uEuareHvAIQ57WkwmUEZfFiph6cyiM79OTf8AOVek2rz+kz26O8TzYyssx2M3BmFTAyoQgYq52RRla/ksf2LYMF96ipkJXzb5C2ECV1hsoTSZ2CQX4OQDq0Yg8bXc9Q==
Received: from BN9PR03CA0601.namprd03.prod.outlook.com (2603:10b6:408:106::6)
 by DM6PR12MB2779.namprd12.prod.outlook.com (2603:10b6:5:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 13:23:17 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::e) by BN9PR03CA0601.outlook.office365.com
 (2603:10b6:408:106::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 13:23:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 13:23:16 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 13:23:16 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 13:23:14 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/3] hwmon: (mlxreg-fan) Extend the maximum number of tachometers
Date:   Thu, 16 Sep 2021 16:22:52 +0300
Message-ID: <20210916132254.831200-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916132254.831200-1-vadimp@nvidia.com>
References: <20210916132254.831200-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7b8137-0ff2-41be-7e4a-08d9791524f6
X-MS-TrafficTypeDiagnostic: DM6PR12MB2779:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27799CDC283126DB9536E1AFAFDC9@DM6PR12MB2779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K17m8blibVtehgJGZKvtR1/Ac2PdNilOgYv0eE35mGOC13YV69lH03E8NwhtygKmANRpsVF3SmO6tiSeRKdOe/LwiXBiCYYVkqk2ut/vc/Fg+7QiuH3rB8Q8YH7cJ+BDbdZK17rWc4FSpaFsvAO2LFV76lUiZVOJXr24oihlnVGidAbkjqK620+Rpv/BKfjJkxwDXa1IEVDxuMfENTZWXqgx1/m/xDVk3AmZ/6PPlujg9P+G/tHlMUbrjECz1aa0jop2mfSi4PKqsDo2NweNwX+nOtnVHhN6hxkc0YEmpacYIVYDCVlY2HZvQKXK3Wr8h5KTFIbIuvZeIfceDhjWjKK4sfAVwKweZApvNkJa1ntknDBkYwF1aWnsgbPXTjnYtesK58KaFESYLE/r/IEJFFYIeu7j5ixiiTIJkrgE7us1UNw1Y1561zpGrmvOZwBAtl1W7WCMEq1RjUi1Eiwv/y2Ozb6YYf2dQbj7LzIrIubM56IH81qJSD+DFNbJfpP1K/vxyLDL7MfyMZaCL9rk3rpRf6DQD4MwTdLmhG+cQG2WXbayPjpvaucREPiVv09Y4st6GwlUZPDYACdtM8ztkzRwIW3JVWgi4glfPn74NndYFF4BvnmFGIDRdIb//VR0CtkvAMuwVFcmdvp5aD5R+yOOK7P3QO2gWQU4k9vE/pfNwKC8jb+SAYixYLxAMcxcciXBPp7bQazjrE1MQWdTwA==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(2616005)(356005)(54906003)(1076003)(47076005)(2906002)(426003)(26005)(36860700001)(478600001)(8676002)(36756003)(5660300002)(8936002)(6666004)(82310400003)(186003)(336012)(16526019)(70206006)(316002)(70586007)(36906005)(82740400003)(86362001)(107886003)(83380400001)(6916009)(7636003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:23:16.9314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7b8137-0ff2-41be-7e4a-08d9791524f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2779
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
index 13e73f05b9cb..6e6c7437db94 100644
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

