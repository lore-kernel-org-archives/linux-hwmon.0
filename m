Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26A5C636D3
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Feb 2023 14:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjBLO6A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Feb 2023 09:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjBLO57 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Feb 2023 09:57:59 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BBBE074
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Feb 2023 06:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W74swI+fM4k+dzRoo9Qn+19lBP4yoQ9WyNQi2hFQHSeeGnaIvKE3FQtpZ10CjEKCf8HcNCqr5F6oXaTkY36Bc0HNHzFb9kOrwfxlRk8uN+JkD6NaHmaiZ4NjvsVnW6whwb8A0jhb3Z8+/WOWpuV7ujZG5RMe8ioZbqieDRBO2aHqyiDcvihGTWPf4Qv9mWtkmDCF8zfv9UrWaL7FQ9+8hxxqOrrC/uKPzIOifZRvwpNY4BDAoFCIQkZWJKWFy9el0/+nsikG6Nt8ZCkOsj5i7XoS0Ps2XAlZdKhAvoGH0e2UgKZFx/GhaH2/GdblgFfk069cIUu3egneOLZqe+0Y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIRbOP21M7q1PhOUtJgfOgldpreyc+OI/0Qe7GRaRLk=;
 b=Hf5UMGD1TEZhZWe980nBLvJFjd9zBYUbKvEodev2L3yDtadDtDpz4bWcYg+Ccl8itMcs/xldp4v04FkFAXTVYI3DojSM/VQRGSpjLoE27sJn1mFQPhj1rF586iP11LVKmtC/zWY9LbZPCVsahYaaO6PUeY3dOIxTzIAQyThAYj5DPtceyZYr2Ft1v4yJEhiOpnxbb7kAKbjVep1Sq47LXpYc8t+ToqQCgy56BdHVdvEjQfU7sutCzkhtiydpYNy92DEqjlNtsbpTM9yCUPnUz3G43x1FYnl7gV0LBdOxPjJRyBpAAVsM5Fc4OMDJjJfJDTeTrs1qV3DglEO/A2YMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIRbOP21M7q1PhOUtJgfOgldpreyc+OI/0Qe7GRaRLk=;
 b=UrGb03b5BN1YC47Er+7x3MCPSOloRSYrwnNErQYoMXh9RGW+Svr4QKY/vpJX/20aVKN8gPwLKsXkE29oJ4EmNy/XGEFw6yLPuccFN+bGwptm7F9n8vUzh1RTEdFwQX+UTlJy6Og90wYiTGkCqz4pGFtajgn5IvVbg+0SSxxcaAmMKeO6YZFJHLaT3zDGDOwreRRjyEeOefnw0m19bwfuw1IrL24aO7xT9u54UHfDIUTJG1W14dQwxi/oUIbJAUcGevOTNNT+YHKqXff3SeRB7VEPcOTrOUVyJajy0IoVrtjaRe2KaM5EHuQBwUJKKjPsIoYu3fspxqV3ZjzvczSj6w==
Received: from DS7PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:3b8::30)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 14:57:56 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::10) by DS7PR03CA0025.outlook.office365.com
 (2603:10b6:5:3b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23 via Frontend
 Transport; Sun, 12 Feb 2023 14:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.8 via Frontend Transport; Sun, 12 Feb 2023 14:57:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 12 Feb
 2023 06:57:49 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 12 Feb 2023 06:57:48 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 1/1] hwmon: (mlxreg-fan) Return zero speed for broken fan
Date:   Sun, 12 Feb 2023 16:57:30 +0200
Message-ID: <20230212145730.24247-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a80a49-6631-430c-bad3-08db0d098631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hep9bYwvMpnGp9XS+Xu5ojOFNCUbQlkQY7DBPJpcVgCXD4QaSSfvQXbIGRbtxTbJ/c279zkn6K5/wYJfT4TAoowNKOlEKmku31HJJUroNddvIOf3auRycl1sL0Iwewmv4v7oabd/RoLkj7WGfdlK24f57ltm1SkGX1zpX021yvr/F/lPFygUpeWC+5j+dwmWMAJMZHFQu9/LxUy8L+ArPVugKngGqiExBcuWwuC0UtBucyMuWI6R1Np+8nvLoUdLAD6mWd3ry859GJZ8atJaEQ9n+FYhYR5hjke+tgh6xgNfppLAjzHSXHnirBfLsGPpay5cMsI9BeffLBdmhwRhawgG8faUWTwttij20NlhTR6ObfICYdTVTNl4H4duQ3FiFmgQoJlrvfyzxBBuFNeLnVUugDgG9UwXGS8KO/7apguzrs918vp8EbzdSNJ/i0RDq/+1cn3ftf9vCjD9/IFhCNgtESLWTMj4B75cO2roMMBm+2DiQeoEt2bo75IRnbDEjFP2WhagESIT5PYACNKcfHpYKRNrAM2NODXyMyOnI9s+BX7jl1LEUAfH8INv/rBBzw8WUQ0IE5vMEJlegeeUtE3dZ9m8NFwiWhVhiig1gJfWA4i/eewH79zVpqFHi2R0Zhx40NhPeisTHU17UyBES6yM44Idh2U17xS/P1RsrAfFmlljzH3S8c1NWRVU4Bv+4amdr0xkfhcaXj+M4867yQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(107886003)(6666004)(8936002)(36860700001)(82310400005)(336012)(4326008)(6916009)(8676002)(70586007)(70206006)(426003)(47076005)(54906003)(83380400001)(36756003)(40480700001)(316002)(41300700001)(40460700003)(86362001)(478600001)(82740400003)(16526019)(26005)(186003)(2906002)(356005)(7636003)(4744005)(1076003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 14:57:55.8923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a80a49-6631-430c-bad3-08db0d098631
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Currently for broken fan driver returns value calculated based on error
code (0xFF) in related fan speed register.
Thus, for such fan user gets fan{n}_fault to 1 and fan{n}_input with
misleading value.

Add check for fan fault prior return speed value and return zero if
fault is detected.

Fixes: 65afb4c8e7e4 ("hwmon: (mlxreg-fan) Add support for Mellanox FAN driver")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index b48bd7c961d6..96017cc8da7e 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -155,6 +155,12 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (err)
 				return err;
 
+			if (MLXREG_FAN_GET_FAULT(regval, tacho->mask)) {
+				/* FAN is broken - return zero for FAN speed. */
+				*val = 0;
+				return 0;
+			}
+
 			*val = MLXREG_FAN_GET_RPM(regval, fan->divider,
 						  fan->samples);
 			break;
-- 
2.20.1

