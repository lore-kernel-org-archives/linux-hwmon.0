Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF46C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 17:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4325361B26
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 17:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347047AbhITRpE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 13:45:04 -0400
Received: from mail-co1nam11on2075.outbound.protection.outlook.com ([40.107.220.75]:13857
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1352991AbhITRnJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 13:43:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXDRn4JWvb+tDb6/3IEmSDD4HgmYmfjemJs3/VmdsuK42gvTBpwZYc3xuyl1iiot9QiCqjHifODYNPL8UPmi7QdNNZDhpTZ4b+0b8aZ1VLHWiFlLXRY5w8ZW5dYceVGA7pM0M8JWAqaspcsC/RKrKURnooIgS9pGUUGZuhktViCgTpcfJLxMX+70m/5JvqwrWx51bK5cQVRagTWkzFw2HMOzS1d7+rLmnDImy1AnqVuF9Nea9HnwOEtBlWldat0YnvrHt6mq1qkNikoBDFBMd9EnZtm2ky/s3ejZgDIPppCghnUIOxfiTEVpMj7DZ507Cn44Q3yfloWVRCwFehbVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AS736bP8LXZARr7YP9lSqenTq9n5SUOHRby4BDmaqUY=;
 b=l51m4xoodX0tk10awbYTQJeLoK1Bf6dBbzdZiLOkS2Kqftl7Za3ADirsyfpwhpur3B12kENH8Nob4EBsE5mzydkpJJq4nvs8ag+ZifDGX256WtlH2SCwuR+i7L5lhgm54EzSuOgSGIfSEPso/xnZbg8G4ZcRXRPxXiQ0rT9K2Dzh9mKXoaMdIdo1jXUJp/tF/twrcNFC+vXXw3lrFCyEnvowKFkCNEO6WG13uu0Pn5MZRuvES1WR9gbBfOyKk77ApPBU7OryO99xJrOJOb512N8zwIj57QrjXmqR4AfW3DP5X8Bo6AO5ZPiqAmPGdLxqTxnvNNb4zVxzXBM6DuR8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS736bP8LXZARr7YP9lSqenTq9n5SUOHRby4BDmaqUY=;
 b=TbvZ8LBUJwi51lwOggtM9Na8L7J9ztGa4VdFswpsfHn58QudSM0u7TO4SVWpYC0AfApXzlZI86S9FIkRZnwgp/ycxdMYj7/xn7E/2L36m14U2Tmh5XyiuDeq5ywNhqy1ejNGVJpJOflbHMqeEC50lwxIOHyE3avloi5iXMJ95aJNzTziOfk1GYHnCzEU11u5dzKnJNNfgzBHqvIyW9e25vSqjR/ouYOSimqgc5LzoAJkgcFqlV/fEPwFlb/24o5BDtBXBwbPNiYl1n45rZuXKDjQcXuuMyK84EWcbm+//Yr9lEDbof+0S6s0Yz+YKS+VqqL83BPT2syWg44h6p6pzQ==
Received: from BN6PR21CA0018.namprd21.prod.outlook.com (2603:10b6:404:8e::28)
 by MN2PR12MB3440.namprd12.prod.outlook.com (2603:10b6:208:d0::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 17:41:39 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::b4) by BN6PR21CA0018.outlook.office365.com
 (2603:10b6:404:8e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.4 via Frontend
 Transport; Mon, 20 Sep 2021 17:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 17:41:38 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 10:41:37 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 20 Sep 2021 17:41:36 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Fix defect reported by Coverity Scan for linux-next
Date:   Mon, 20 Sep 2021 20:41:18 +0300
Message-ID: <20210920174119.1080488-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d347c0b-9730-4186-345b-08d97c5de66f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3440:
X-Microsoft-Antispam-PRVS: <MN2PR12MB344059C70D6AF5E5B12BEFCAAFA09@MN2PR12MB3440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weeY39i7o7CbmP4K5zyDEHu01v5oZ9g0xlTGQ9A/1yuGGguRagVW1Q0WS46lffh7BINb9jcGi3KEbXucFBOnHqK5QUbGRWg5lCGgrDKbQ1b/XJS7VPXSlyhOraW3lW7/GbZ3TfnMupeKM6Wg7uNby6oOUL5gZM8i5z+ZDd74iuo/fnDudXl/777fW/kLNq8LA6tZ6+UwxNI8DhduV7/BLCrj6GeZrG25kGgTM0brVItYohrWqNXeJ/XnhkLX9lfY0rFINVadCQb/jUwowZt0UwRydnRd4bwIfJwXDPa5R7IuzTzrCls5ssskKL9VwW+J7Q0XBbIgsRrRDbbZtB5dSdamHP2RISY5wJMdvq8lbpBvK1zM9kn9SM3f+v7tisHoG5YpggX5bL1P0+HhEIbuXLpItSifr2ao0CZ91E4yS+fSyOSMAOxmJ6O1swlagjRe5xmeOyZI7tod9qkDx6r6H9bYku1bCF8JBIVW5JknibCepqUW7zxrwTBcLO5oA4tU7vxIYUilB1XPUyn1SjD/jhj1x5nAcWjrsjBP41jgcCvDNYmWGjAtW07fROmbFVzs2V87Bxm368JdtJ1qT+54Ezdmti6ldNq6CpTduCHpEwnQeC0WWtPjhouyn3wSVmitXU1Zq2gallKphC4zHsf4rIU/D3Nl1juDN83uJvsEGKUadX/Az6vRQed08+kS/bk0IhxHMPwR5FhjnLCO5KiwuA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(4326008)(8936002)(2616005)(356005)(47076005)(36860700001)(83380400001)(7636003)(1076003)(70206006)(4744005)(6666004)(316002)(54906003)(107886003)(82740400003)(6916009)(8676002)(186003)(16526019)(26005)(82310400003)(5660300002)(2906002)(36756003)(478600001)(70586007)(426003)(336012)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 17:41:38.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d347c0b-9730-4186-345b-08d97c5de66f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix counter limit in 'for' loop in mlxreg_fan_cooling_config().
The issue found in the report on new defect(s) introduced to linux-next
weekly scan found with Coverity Scan - memory access violation.

** CID 1507571:  Memory - illegal accesses  (OVERRUN)
/drivers/hwmon/mlxreg-fan.c: 560 in mlxreg_fan_cooling_config()

>>> Overrunning array of 160 bytes at byte offset 160 by dereferencing
	pointer "pwm".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 35228ed112d7..feab9ec6a6ca 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -554,7 +554,7 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 {
 	int i, j;
 
-	for (i = 0; i <= MLXREG_FAN_MAX_PWM; i++) {
+	for (i = 0; i < MLXREG_FAN_MAX_PWM; i++) {
 		struct mlxreg_fan_pwm *pwm = &fan->pwm[i];
 
 		if (!pwm->connected)
-- 
2.20.1

