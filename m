Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEA9C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 18:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69B3561108
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 18:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbhIPSeI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 14:34:08 -0400
Received: from mail-co1nam11on2086.outbound.protection.outlook.com ([40.107.220.86]:54784
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240656AbhIPSdi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 14:33:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNrF7l4G8PbfAOLtBITqc4NB9hALlFREQNkc6W25n86k+nccnJ/0Yp7ab6Y7RuORr/Pimn58ULS5F9/8i64qEnqiPVBN2JP+2vmkZjoiCsM7EaNNXdqRYTZnea/oNrPs86fIxz+0V17j7droiAlN+eaxWVSo1s2olcMXJNXigVcRRTiSPTMRFM4ZxU97u9cWpjmyNdJUD5zGB7ejLQaAnMYO0wBE2XT5ylNRxeIFQJqRwvlTuBl5xsd5JxMhCe/T+nYjJ13+xHkMZ2NK35+zHpN8pNlBoLvSBqOBEPqcoCTH/jOTJciBMP/PncGCpVOMUkdie2b4PSb3MwaX8zReMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sEfAbn0gfPyyNIY+emBW+AFLZ8pGw8om4gnA/utAIjo=;
 b=mm+N7iglrGbK0K7uZbvSknV+gwr6H5cZVlHGf2FrvtD4hzAehx9L1j1I9SvZ++aQSRrB8ushs11k9B2LG6CQhmBxTuvIkauhsxseXR4XCO+O8NOHhOZ68ee8i30q5FZES43utudgowVfazu12fCslWZDaOHMKoLhTG6QITfVFaPUvCShVv5RAWOhpN/nxZH3tFWYQV9zc6cvGuhYzGDWLe5ac6XODZsvFTl8MwkJWb0YFX7Gy0E85vledP6bVmPdUqApxll/Vq789n9NFJhE7Qg+tDXCw0CaI7K+keIbX5K5Oh90SKkH3fkjTb6+DkpoJ51lo8c8ght3EgRK8tUF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEfAbn0gfPyyNIY+emBW+AFLZ8pGw8om4gnA/utAIjo=;
 b=NpuTWgnniEWBB7QgCbmsGySkl2Tb5kvaoc+WHut0ArTo3BkR4jiaLNFXqW9uqFnv92NhUIaimS2bAt9428JDQ4voI1Mdy0g/MUSNjLuqCvtIuCwHOWEfPHF1E+L82ZNaWXCxCynxrYZufj3yYz3NBdsXBs0ddgl/+b4GezMjQjURtZIMoBlws1TpO8ocwVFJfFIYyv1zPN1WqaKd1it3FOXPO+nZaE9R8I75KqOr6wJWjmph6yFJYN4Ui7YAOi0CkpsQaG1ar92i1BIKpCtUCDx9EyKkc48b1mvGKRtCHvBSgz/UxC8FHOQjNRwzYktKAlNJGHxzVFVWclsUfmEw9w==
Received: from BN9PR03CA0653.namprd03.prod.outlook.com (2603:10b6:408:13b::28)
 by DM6PR12MB3561.namprd12.prod.outlook.com (2603:10b6:5:3e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 18:32:16 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::f2) by BN9PR03CA0653.outlook.office365.com
 (2603:10b6:408:13b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 18:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 18:32:16 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 18:32:15 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 18:32:13 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon v3 1/1] hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs
Date:   Thu, 16 Sep 2021 21:31:51 +0300
Message-ID: <20210916183151.869427-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6ea1d6-bb0f-4fdf-47dd-08d979404f26
X-MS-TrafficTypeDiagnostic: DM6PR12MB3561:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3561663F7E0D0573C6AE360FAFDC9@DM6PR12MB3561.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAvHmXpdQRSBiVmOW29wAY7pRCTSVC8p77U1v8hCHB8qRBT/MIA+sy/UiLwXoDgjL1iyTuimoO3TeJNJhWMCu985iAj9UMhDyUne0g7XI+Nlo8x3xXzl6aLcrzTiUruG7xCBbNZ9aS7MfaATTWx3kzo/agVWIgCgMZPcm1c7K78y+L37COtVvDStIwIKsVbpkYNzB2ve8KKyKJwyMEaheE8JI/kiZ3YuXCTeglzr728xKnAdNsImp8dxguGtkbXa5Jc6j9xGjEXGm+mM8XElT4LOkOFH3dDGw9Q/kzsEemXPzhJkE7fzlikhXMszIuONTwFht42aLY3hxHkbUHkogUu8yAH2nqw8s2tEyvHgLtM6bRxim60rzJ9wbBqe5Bx7dnjh1N1JmZbdwn2xAi9aGr2ors8cn454tFoJozt1U7I76neSSO9mrQPrbmEEKKZP+575zauVXDtUttFLSy148ia8ss00UklFasQasYqm7zjuIWjXD7mGmw7mZ5g7f2q+TaVG6/++iQqMLTwBtyDuVJolLHoZeQDEroAnlxMNa3nxq4UaPsidoX305bING+DqFG89gUx0yNawg8yWiwNJS+8r5a3brNlSWTwqnkDrjTuEHpyZjvi9uY7UGlp33H3vwoqAie3qRhHaM+WRqqrKjINOnHrEe1Cnkj18W0996ItO8syTqDFw/g440N9+gwQhruyIGwvfynG3drMbz3Or5Q==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(47076005)(316002)(6916009)(16526019)(186003)(8676002)(107886003)(508600001)(2906002)(70206006)(70586007)(36756003)(426003)(7636003)(86362001)(356005)(54906003)(82310400003)(8936002)(4326008)(83380400001)(2616005)(36860700001)(1076003)(6666004)(26005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 18:32:16.0813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6ea1d6-bb0f-4fdf-47dd-08d979404f26
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3561
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fan speed minimum can be enforced from sysfs. For example, setting
current fan speed to 20 is used to enforce fan speed to be at 100%
speed, 19 - to be not below 90% speed, etcetera. This feature provides
ability to limit fan speed according to some system wise
considerations, like absence of some replaceable units or high system
ambient temperature.

Request for changing fan minimum speed is configuration request and can
be set only through 'sysfs' write procedure. In this situation value of
argument 'state' is above nominal fan speed maximum.

Return non-zero code in this case to avoid
thermal_cooling_device_stats_update() call, because in this case
statistics update violates thermal statistics table range.
The issues is observed in case kernel is configured with option
CONFIG_THERMAL_STATISTICS.

Here is the trace from KASAN:
[  159.506659] BUG: KASAN: slab-out-of-bounds in thermal_cooling_device_stats_update+0x7d/0xb0
[  159.516016] Read of size 4 at addr ffff888116163840 by task hw-management.s/7444
[  159.545625] Call Trace:
[  159.548366]  dump_stack+0x92/0xc1
[  159.552084]  ? thermal_cooling_device_stats_update+0x7d/0xb0
[  159.635869]  thermal_zone_device_update+0x345/0x780
[  159.688711]  thermal_zone_device_set_mode+0x7d/0xc0
[  159.694174]  mlxsw_thermal_modules_init+0x48f/0x590 [mlxsw_core]
[  159.700972]  ? mlxsw_thermal_set_cur_state+0x5a0/0x5a0 [mlxsw_core]
[  159.731827]  mlxsw_thermal_init+0x763/0x880 [mlxsw_core]
[  160.070233] RIP: 0033:0x7fd995909970
[  160.074239] Code: 73 01 c3 48 8b 0d 28 d5 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 99 2d 2c 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ..
[  160.095242] RSP: 002b:00007fff54f5d938 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  160.103722] RAX: ffffffffffffffda RBX: 0000000000000013 RCX: 00007fd995909970
[  160.111710] RDX: 0000000000000013 RSI: 0000000001906008 RDI: 0000000000000001
[  160.119699] RBP: 0000000001906008 R08: 00007fd995bc9760 R09: 00007fd996210700
[  160.127687] R10: 0000000000000073 R11: 0000000000000246 R12: 0000000000000013
[  160.135673] R13: 0000000000000001 R14: 00007fd995bc8600 R15: 0000000000000013
[  160.143671]
[  160.145338] Allocated by task 2924:
[  160.149242]  kasan_save_stack+0x19/0x40
[  160.153541]  __kasan_kmalloc+0x7f/0xa0
[  160.157743]  __kmalloc+0x1a2/0x2b0
[  160.161552]  thermal_cooling_device_setup_sysfs+0xf9/0x1a0
[  160.167687]  __thermal_cooling_device_register+0x1b5/0x500
[  160.173833]  devm_thermal_of_cooling_device_register+0x60/0xa0
[  160.180356]  mlxreg_fan_probe+0x474/0x5e0 [mlxreg_fan]
[  160.248140]
[  160.249807] The buggy address belongs to the object at ffff888116163400
[  160.249807]  which belongs to the cache kmalloc-1k of size 1024
[  160.263814] The buggy address is located 64 bytes to the right of
[  160.263814]  1024-byte region [ffff888116163400, ffff888116163800)
[  160.277536] The buggy address belongs to the page:
[  160.282898] page:0000000012275840 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888116167000 pfn:0x116160
[  160.294872] head:0000000012275840 order:3 compound_mapcount:0 compound_pincount:0
[  160.303251] flags: 0x200000000010200(slab|head|node=0|zone=2)
[  160.309694] raw: 0200000000010200 ffffea00046f7208 ffffea0004928208 ffff88810004dbc0
[  160.318367] raw: ffff888116167000 00000000000a0006 00000001ffffffff 0000000000000000
[  160.327033] page dumped because: kasan: bad access detected
[  160.333270]
[  160.334937] Memory state around the buggy address:
[  160.356469] >ffff888116163800: fc ..

Fixes: 65afb4c8e7e4: (hwmon: (mlxreg-fan) Add support for Mellanox FAN driver)
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3:
 Comments pointed out by Guenter:
 - Fix error code handling.
v0->v2:
 Comments pointed out by Guenter:
 - Fix comment.
 - Drop boolean variable 'config'.
 - Drop conversion in 'return' in mlxreg_fan_set_cur_state().
---
 drivers/hwmon/mlxreg-fan.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 116681fde33d..89fe7b9fe26b 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -315,8 +315,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct mlxreg_fan *fan = cdev->devdata;
 	unsigned long cur_state;
+	int i, config = 0;
 	u32 regval;
-	int i;
 	int err;
 
 	/*
@@ -329,6 +329,12 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 	 * overwritten.
 	 */
 	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
+		/*
+		 * This is configuration change, which is only supported through sysfs.
+		 * For configuration non-zero value is to be returned to avoid thermal
+		 * statistics update.
+		 */
+		config = 1;
 		state -= MLXREG_FAN_MAX_STATE;
 		for (i = 0; i < state; i++)
 			fan->cooling_levels[i] = state;
@@ -343,7 +349,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 
 		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
 		if (state < cur_state)
-			return 0;
+			return config;
 
 		state = cur_state;
 	}
@@ -359,7 +365,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		dev_err(fan->dev, "Failed to write PWM duty\n");
 		return err;
 	}
-	return 0;
+	return config;
 }
 
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
-- 
2.20.1

