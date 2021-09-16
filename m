Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A50C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D7CC60F26
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240033AbhIPNXl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:23:41 -0400
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com ([40.107.93.52]:34529
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240125AbhIPNXh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:23:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0xClPvrxPeTOOFY0IVA+BCm07+Wg9iEfrYJZrI2gUVVHzAPBWy/68mjSpbrtZvouL6X+wMFndG3U8+fMeVPHCXCkHspHsUcNikzz9J5gXuh/FEKd27ynn4d9GVjfzItH4A30E/mQTEVbGRVlOpd2Oy1mSZiCeXMeOkiSo87kBTEEaCGO4mTAfYzNSO855xA0yl60eRviySeJH3T3KoJEk1izDlcr7nGy+0Ty9RCcVNQNgZ3yc42q1gBJwusKfYuMOhEiPddvYWy0nMofuNTnR7XUTNdR+Z7gBm1uzSycoDRtHMfRtQkJnQrR6bXWRifIO5MBJaFWEzyiGOV4bUljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AvXs8cW9R5vMrFyCNLfElOqx3uPmzhvwxpuEVKrZYQ0=;
 b=ROm0fUCAJ1v6Sxdb/9UQBp4dmpwedHV3IgGJ6Syqu4LBUuz688od3fruXrN5bOtWSvApXJ9mOGzG/rpUHRbmX0SpFmQLxOgw3XyXqgryA10iHhXzi10PXsO+cCDgVsasapkyYu7VKPm8hs61ttCPNr5Ti9Gb00A4B40lVehPG2qzjJivVgGzcXjJlXM2PZ/xzcWOLcB1TTsVA3mr9Xx9b6r5DMPyULd95Rotjyt6y59ywpsZ1Otg8Be+MFM3/HyeRzaQ2fSBYNdkySGAi36p0obr6x7sfTGY0QW+uFMl5TKjRcKqkjssMo/qe2J+k64Iu38+hr2x3EZibZ+apdiaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvXs8cW9R5vMrFyCNLfElOqx3uPmzhvwxpuEVKrZYQ0=;
 b=EdGbynvyXMlk4z7ZKFyBH4ykyGEaYvE0JPASjY57W8KmROuwIeYTT9EdKCNALqt1EeWmLq3PrjoYWSyUe8EAwsOTlABIKfDSJnJ7YrJWdgNfXzTo4pxgPDHMFrzEu+wzbej4dh6zO/4NvYZhoF9Lvf/N3YDLEZytFsrxu/7yFyONqMGnvc6w6XFMi42+ReFhpLmqP17gxII5MSodtILrxfr5JtktFEc7oyXc0+4QQn4ZOzOv+ChDsgKJ+66sTJ5E13EEdDAZS54AKt+MOuWiqb4wNaMUMxCHMomDy+ETYxvH5CHKqWhPdlixLYeBnFP4OSsfnSHudEqVM8TEpbKJIw==
Received: from MW4PR04CA0092.namprd04.prod.outlook.com (2603:10b6:303:83::7)
 by BN6PR1201MB0243.namprd12.prod.outlook.com (2603:10b6:405:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 13:22:14 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::b7) by MW4PR04CA0092.outlook.office365.com
 (2603:10b6:303:83::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 13:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 13:22:14 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 06:22:13 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 13:22:12 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 1/1] hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs
Date:   Thu, 16 Sep 2021 16:21:53 +0300
Message-ID: <20210916132153.831099-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f5b704-2530-4025-eefc-08d97914ffa5
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0243:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB024391228C7DA44E8F16EDB5AFDC9@BN6PR1201MB0243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwRJOjYNvSUkoT4tPFTPaKur+QRqBCuYEFhsBzLPDQOwYOVAjzi/zgzBsTCMWFSsVZWsksBoAxQO88E4YXasnVjw9CCw7zsFOwnOXYZBZEroxRhnEqNOTTzrnwTlHYjd42vGsa4KiiktKF6QgJST+5mCpx4z19/+MzLEoK2wMedZwFAfyt692iIa9VVgA+Adrr5Cd0lboc0RnIiR3j3aRb9xRxMlNcEwAlTqUKA4wZyG5Azki257BieDWqj30lPwqa3R9RNzZQPHUGmJfKecVOkUsm07Cb7Q5Nar59wG3IgqCP/t6EbsnKj5N4gRQTeOOE+4CTiMToSWuBZUPN8I7k2eVRyXgQZtSVeF9ju+/8h4wcXMQtDPJ84KTyS2BMnFX1S/REYtJ9U+tQXYSlkSM8Wo5kgERT+N2efWqLpeMauetDKrboLMkAn4psbNnZuxdfvTc7IwAYdPaNhNZbbhPJA7YyL5aMleUGNmcq8ieR1C8WGRR0xc9hXK8o1+3MQbPPvSkNPRIhBne9E123QWKQzfNpk4kvHNu4QIHpqOtDEp5fqiq3cpUtTdOLIh9zoG5Ifhf2D5EHcjm4+GjcNTpwLMGu8VsdoBZeTezBh0eY8faVYfpaSEPF8ngRb2xPZmEKfArw1ZGqMX9yy8OEi0C3b1luxOSOGC++O8IfP1zgvxoNTW46ATN6K19rLiArmFC/2BrYNitB/q1JJYdT5gxw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(82740400003)(86362001)(6666004)(8936002)(16526019)(107886003)(5660300002)(1076003)(356005)(186003)(54906003)(478600001)(6916009)(36860700001)(82310400003)(316002)(2616005)(70206006)(47076005)(70586007)(83380400001)(7636003)(336012)(36756003)(8676002)(4326008)(426003)(26005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:22:14.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f5b704-2530-4025-eefc-08d97914ffa5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0243
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
 drivers/hwmon/mlxreg-fan.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 116681fde33d..13e73f05b9cb 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -315,6 +315,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct mlxreg_fan *fan = cdev->devdata;
 	unsigned long cur_state;
+	bool config = false;
 	u32 regval;
 	int i;
 	int err;
@@ -329,6 +330,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 	 * overwritten.
 	 */
 	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
+		config = true;
 		state -= MLXREG_FAN_MAX_STATE;
 		for (i = 0; i < state; i++)
 			fan->cooling_levels[i] = state;
@@ -342,8 +344,9 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		}
 
 		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
+		/* Return non-zero value in case only configuration is perfromed through sysfs. */
 		if (state < cur_state)
-			return 0;
+			return 1;
 
 		state = cur_state;
 	}
@@ -359,7 +362,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		dev_err(fan->dev, "Failed to write PWM duty\n");
 		return err;
 	}
-	return 0;
+	/* Return non-zero value if current state has been enforced through sysfs. */
+	return (config) ? 1 : 0;
 }
 
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
-- 
2.20.1

