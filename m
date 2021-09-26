Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8716EC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 05:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 691356108E
	for <linux-hwmon@archiver.kernel.org>; Sun, 26 Sep 2021 05:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhIZFhl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 26 Sep 2021 01:37:41 -0400
Received: from mail-mw2nam10on2043.outbound.protection.outlook.com ([40.107.94.43]:29353
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229746AbhIZFhk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Sep 2021 01:37:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCSgI5OjM0kj82LIGuaDge+8YqyWQ10ItofmGYz7pLEyRiiFQOhFiX1rzA7APOBIOctu8X61QUKcNBtTqqEqWXD8IW8ThmkLsx5jYT8ylcdFAKnbP/x8fsF6/qgxbS2HI95pKYj1YOY0uCblQ6N5OciMj7Lh2ngPX6f8Kor45mGH6Xo6t8qNndI5/fJNc/4H4tq1iry1t5UMtoUqkznZQExPyidsbBNOIWSWBdijnCNEQPGnMQjSoRNvZIYIMG2mIO3BSEWAYQeksCWXNAPYld/qM6/ij1o3xLMTbQTlB4Ozgw7BhstY93SeFKTgJQleJvoRVohlq51CL18iye1jSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eei75g3Hr1vbnYNkqthWcsymfGe1U3K/9bBMQfYuX9Y=;
 b=FmwGvQ9aAHKmOP/9Pa4TzhKu9o9Ir2DyK2o4Y5s6/hEwtF3laMe0VmsMqZBzXsFEQNeAnqy0OMh151j/GHWoR3ih9DmyhPbfZU721L7O+VXgvkCeF7JyhKLm/fqjxNFtWnTWGpunYee0vefaJIVcNajN3fnhbjuilfQWk6i3rAAdpVE5UUxhsegwE/CTFO1eK1VPjGe732lIYFrOv1V6Nb5sCNNL/pAOLSr7TxfwkZLJXTu1TRcISzO7wmCXPGJYwmF7/jdil72YceN8ZYLrpIoHHQw6nhjt+84ffph+Ubu4eT1tLnfeK+tl38ukLVwobufU1CxylwxaYpYBc9q7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eei75g3Hr1vbnYNkqthWcsymfGe1U3K/9bBMQfYuX9Y=;
 b=V2Bs9mq8Lad5yp/f2yz3RonAuoMJWX0qvam60Oh+fwNfO7pV2So2yLzbcMZoRnl+fnVUy7ypJhlGcAmRJ+0L8YB2x3fzvMzh/9JJhZtKZAuoDlvnC9LTDTAi5IuvqZc3VlRNKBCV2OUgwtMJOvjfXmR+G61/fMIt/Z+7hPeJCsiVEuOKSZJgByzBA/UpYT4bL2wZ7Je7H/VipjmFcD1QB2fcS0oLDxI56Hfj62FL2cdxxJoF+Wc5AxwCBaMKyfEavgsl25JMzyZqm9qxr6PrNyo+xDjBy2hvrAOh6noW8891X4/nAb83HDW5EMeuEscw9KYHws8Rz2fGApli0r/Hhw==
Received: from BN9PR03CA0164.namprd03.prod.outlook.com (2603:10b6:408:f4::19)
 by DM6PR12MB4028.namprd12.prod.outlook.com (2603:10b6:5:1ce::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sun, 26 Sep
 2021 05:36:04 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::f7) by BN9PR03CA0164.outlook.office365.com
 (2603:10b6:408:f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Sun, 26 Sep 2021 05:36:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 05:36:03 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Sat, 25 Sep
 2021 22:36:03 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sun, 26 Sep 2021 05:36:01 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/2] hwmon: (mlxreg-fan) Modify PWM connectivity validation
Date:   Sun, 26 Sep 2021 08:35:40 +0300
Message-ID: <20210926053541.1806937-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926053541.1806937-1-vadimp@nvidia.com>
References: <20210926053541.1806937-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bacef92d-a4f0-4d41-7556-08d980af87fb
X-MS-TrafficTypeDiagnostic: DM6PR12MB4028:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4028E6711D180BF86D984D70AFA69@DM6PR12MB4028.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p977lgwfnvIsYSvG4QiV+diHQ0SJ+XyP93GoirWXQgE/11xc4ntis2/oxx26iAqqHgWx7NmSMMox3RP+qcjwatuzhEd0ZB2UsFJrDErEB43EAF0Z5XpCa2WcyujF+XW9Fwi7h2AnvAwVo2MRH0EnmKlk/sLQnaxEwFtwwx3G7vpoc5fyOXkyfyZTK9gCXFGC+/9ZDLUpdfhgaRmp4pFTciZC7xZ8q3ixuQ0lVvTTpXhG0rc0xBBmfsVOGoHCvWKGr9ijBwXU/lY0zfWMshf0n7RtPKQk42iVCQr+U+3/waHlOO0dnrpqoh5BSbsxhISJHv1qkbRp7mEehBJTXfMRydwcGSaGMretUHs9GmWlZXc2ejMVPM0/Q8NAGrfn7xaNCBeQTSdQnaPpeCQK+XpdAR1OVZ78qw9x81ARzKQhG5+rgCvGIsSU7WQO5uJ2dqTMRi79Jpylc7Nf1IA1OdlCBroS50dqBpw3WXXWtml4tQVQdWeCfi4Jg3MwU2+3+Pj8QePfRtpv6G3b1tr7Gho5Wf+gOUFgB9gvTYjfmD27KLv9td9Zb6aiYXC5LelLwRZBBYdKiVdTEFBMH/KxlFU+o5xrSMU1jqZmjEU50nvnP3YXBPsZDY+/sZlrguk3O+/ulSPoNvqAaTizLkNCYnErw7bb27t6CUysX0DI8+bRlVwdDvt04s+Nf8PqOKZTJtwK5UPiMQPVazTL2RhwPxlyJg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(356005)(316002)(86362001)(7636003)(107886003)(336012)(2906002)(26005)(1076003)(8676002)(36756003)(36860700001)(186003)(16526019)(54906003)(5660300002)(8936002)(4326008)(82310400003)(83380400001)(6916009)(2616005)(426003)(6666004)(70206006)(70586007)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 05:36:03.7052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bacef92d-a4f0-4d41-7556-08d980af87fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4028
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Validate PWM connectivity only for additional PWM - "pwm1" is connected
on all systems, while "pwm2" - "pwm4" are optional. Validate
connectivity only for optional attributes by reading of related "pwm{n}"
registers - in case "pwm{n}" is not connected, register value is
supposed to be 0xff.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index feab9ec6a6ca..8e5cd6991929 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -488,9 +488,14 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 				return -EINVAL;
 			}
 
-			err = mlxreg_pwm_connect_verify(fan, data);
-			if (err)
-				return err;
+			/* Validate if more then one PWM is connected. */
+			if (pwm_num) {
+				err = mlxreg_pwm_connect_verify(fan, data);
+				if (err < 0)
+					return err;
+				else if (!err)
+					continue;
+			}
 
 			fan->pwm[pwm_num].reg = data->reg;
 			fan->pwm[pwm_num].connected = true;
-- 
2.20.1

