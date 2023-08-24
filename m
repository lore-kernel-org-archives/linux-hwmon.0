Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF55C3DA6F
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Aug 2023 16:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbjHXQlQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 12:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242677AbjHXQkv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 12:40:51 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E1A198
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 09:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDab1/LprSkHOSpJBx08EXn49CvB5AUlIK1Wk9ZSZsw770pGuL2QDH3K5XfsRgFdVC+AyeQEvluFxQHx14Q/tcPxsrXp+upbsTfTYrYEzIOxPg/B9syMrzS7hDAuAd7DzgPtVTgR/nX2PDwzOnlRLB1BODIHfFO2vO1cuLBUwFj3eKybj10XxJv2isEGJAg3tp9ujUmgzK4EiGwzgzd/YJhaJlZR+cr6mR2iWHNstNONJxzQxdNxjXcXKtAkKSnYReqzrzJljfaNBltEXbnYua80UFFDcKSynWVp7iuJM68KmO+tyBZZoA3NMzJTBXgtqjm422Qs5kNwI0sCmHfbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Em9FPThvem+vVMARQRwYSCFDdHGw5nK9kSETX0XEmAw=;
 b=JGVvyPu7WFWvYa9QuaDx7L26eiJU2eiG/mUM+O/iZyDMXS3ggwEpmrNno1O6T2+pRFwFBTsmRHm0kfPmghBwLfesjyLjSDUNk/UViYYZ8hu8/+Cv5dKInJZ9pERb+zRCYBdd81OAw0lSg09wH83o3T9Nail1i+t47psW2/JEZV2UuDy+dCKXD2IapMNpiww0I2SI+DbZZOJw5UwUrgJGTncljcXsX1g2VYT38i+M8RGdvhN/uh7AreaKA9xbyBq7wbR2Xh4uveVpm/ianNRkvCYl8SvKcHmjVqdvE1JFEQPdYkh++rfdAAQ+yWvj+CcV/sSc5ytJSlXW1DMy0nR01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Em9FPThvem+vVMARQRwYSCFDdHGw5nK9kSETX0XEmAw=;
 b=INyyu2tfcP+Q7evaICZoGdwrBnljuq0LMkDqfjQ9kZ/lhDLWmRGYxFLo5TUQRte0WD147cLqkcUPknZQ7IS1Iic8Nw2Ood19tnfGzPh57z/nnxAc3K1E+GE1JhMhi3SmOIo9Wa1dGvdfw24wDMnKfzC1LSa1SgnjDXCPUN/c1SItRTSjhfISbFqW2eQngcRQQ2+hxMtWWJ9vbd1BU0OvWTIAnysm8BiZkv8Fd+BYVTbZR2P0A7iYrDAinKKb5f2JbjvPoc/Byyw0/UHPUY/hBxPDpCOjQ9N0lJPMTo8qL0BsAglSaM4mKKJvKELhI9d3iBLEzDUExWo662tXSr97Iw==
Received: from PH8PR02CA0008.namprd02.prod.outlook.com (2603:10b6:510:2d0::17)
 by CY5PR12MB6322.namprd12.prod.outlook.com (2603:10b6:930:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 16:40:38 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::cb) by PH8PR02CA0008.outlook.office365.com
 (2603:10b6:510:2d0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 16:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 16:40:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 24 Aug 2023
 09:40:25 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Thu, 24 Aug 2023 09:40:23 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Extend number of supporetd fans
Date:   Thu, 24 Aug 2023 16:40:06 +0000
Message-ID: <20230824164006.26868-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CY5PR12MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbe7e32-a698-4564-3d66-08dba4c0d8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pNxgky5MMP5lVBGwYR3M3ZPMmLBac36V96gwvHxFjkD62Ih5A/9YXKkMj437+JtWJe5bhUgdAlZ7wpIiXB/3ZZukv3NjZisuxAGpN1MJgb/z+ewFnlCIqVLGL2N0hMTnR3Mn+HgA+WM9NfiVpnmEZBObSDgfQ4/ta1obwQxEMu7jPRAFC3nPG8aTD3bBGOR5tbYst9nkZxF3uggWQdhy54HS5X8f/xwK+0JVjsn2Ymf4qzYiKOsMHMCZYGTi6vF0O8BrU/zDKXSSY+qbug72C4R73oW/tMIELm0E3GCL57ZcQqwM0giJHDxhy+8rFNB760GcL9NRxVrZHHwQSsTBGvdnR6zDpFgPrwcVKViweigK5xj3dezl3LIvLqllk/axN8uR2yyTISekvNYUZat9JrXItfQR9ih4M1hnjO0m5sZMb0Z81Uj84vV8RAKSoDDssvu8LxlDpsa3LpddJvenFVgxVyg8Z0fZDMk46r6Novu8gIyxEAxYbwB2kdC5hFVl4inZWFE9PqYnfZ0cWT+FkDCJTo1tYzofDL3PfXlEscGFq0J6hNDELlNrr/xmw/i6rc5JC+TIpB9ImZnlLU+hhORmqJUrRec8V+2H8J3yar3J3Nh8p2CFZclIKqjmH1ZJsQmxmWYuC0frJonyLyAVCXTiHH9ngGEpshm9I6z7pEzBFDWM9KoX934usHMBtLDV/26tTQzJnF3YIXdIFZpLt9rvpIpFLJ/zs3cwzzsqpCDW9k61aGx3M0nOqQ0LBGC
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(186009)(451199024)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(336012)(426003)(26005)(16526019)(83380400001)(2616005)(107886003)(1076003)(47076005)(36860700001)(41300700001)(70586007)(54906003)(2906002)(6916009)(316002)(5660300002)(4326008)(70206006)(8936002)(8676002)(478600001)(6666004)(40480700001)(86362001)(7636003)(356005)(82740400003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 16:40:37.9066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbe7e32-a698-4564-3d66-08dba4c0d8c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6322
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some new big modular systems can be equipped with up to 24 fans.
Extend maximum number of fans accordingly.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index c2a96468c9b4..a5f89aab3fb4 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -12,7 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/thermal.h>
 
-#define MLXREG_FAN_MAX_TACHO		14
+#define MLXREG_FAN_MAX_TACHO		24
 #define MLXREG_FAN_MAX_PWM		4
 #define MLXREG_FAN_PWM_NOT_CONNECTED	0xff
 #define MLXREG_FAN_MAX_STATE		10
@@ -300,6 +300,16 @@ static const struct hwmon_channel_info * const mlxreg_fan_hwmon_info[] = {
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT,
-- 
2.20.1

