Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9346AC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 17:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FA106108F
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 17:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241347AbhIPRxr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 13:53:47 -0400
Received: from mail-bn8nam12on2048.outbound.protection.outlook.com ([40.107.237.48]:45477
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345906AbhIPRr0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 13:47:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7+eE0DOVutFDqNnCeU5H4vYVjSQ9D9PK2XBZScX+viwrW85vkB1coflqW8WkvLilg75vDEbW+oqQuAc6bPevpINzIhDupuytBF1mlI2GF6XoydcqV4pWT3ZAca21Tet6/wi4zbSDDfjKNtRuVEQFxXqpbIkiatvmuBxaqWe0QjE/DR407/6RCrPexx3rzJoS2/MI0ZGMl8UAWPnilUH5ILH/3/4EpRrqSncGVfYEfkVFFdi4+ENtDx08B2n/AuPoi45TSZjZbnLpkT1vR9hrPK+LeCYxBqpO55hUOiBoDYI8Fis79df8X44T2rVsaqclUyiiUH/sZomnima/jErDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=a8c6uleDn4hiqOPVwSJBk4vaoQJnlcFPrzg04Uvf49U=;
 b=jjPUHUekucvDfrrKbbe/AUwMzIAoqaN9EdkCo3Cx/j/YlD7MTXbQNEEFMxAnRCWqFEKjh9lYKZGOOUCZI5TBHbl3rLgVbKnwLdJ2TNEg90SXVAUvMP5dWzwK9pjB/zt9gJGd9+uK6JwnfX1DMS9dhaVqygon+noOsM+OWgoBWECq0ku9VUMxwQfFoTi/VsYlM3CRMJgWQmHAkQj0Tz5pJ1YJYn/gD+03ITbAMo7mMKIZO+VG8+HXPi81x/sSDWoEKAJAtw5nVMjxJhJZf/zqK1NbpIOhQWV62vJQNZ/pZ6ePjhz4Ni6m0yZ/BcrUun5Vta+854TV00gL2VhiYoc+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8c6uleDn4hiqOPVwSJBk4vaoQJnlcFPrzg04Uvf49U=;
 b=Y6dUW81ckzJO7T7yUQkZNaE43eP7B5nYvZiscYjKiUNBJVqpTmkhC426YLd3DxHOtegJHBvAAv6fUAHfdImj/47uE6q6I6OueVFscp8I+Fz6r1tc8OK5XmOQBUPyCxKDWwZv5Bj7PgHALj4sAg/B0eUXxl/Og5QMCSP3NdMS0Q33gOxOz/pw6SY43GMySTmPSIXV5ra4ZOloge7qMgpjv54hpx6pzWkdj3TY3XUkMm6ZhImVr6dzSR46QNoEzjqkWj35LodRjqCRCyQChhNrKUvPV1T0BEf7xclIHffqtDKHs9WLTc0nkzHyxC62feZwfFjCyPUoOEhEK22+iLJ9gA==
Received: from BN0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:408:e6::21)
 by MWHPR1201MB0175.namprd12.prod.outlook.com (2603:10b6:301:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 17:46:04 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::d7) by BN0PR03CA0016.outlook.office365.com
 (2603:10b6:408:e6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 17:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:46:03 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 17:46:02 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 17:46:01 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon v2 1/1] hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs
Date:   Thu, 16 Sep 2021 20:44:45 +0300
Message-ID: <20210916174445.868196-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92db3d6a-bfe4-41c1-b19b-08d97939da70
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0175:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0175DC820D8905E2858DC53CAFDC9@MWHPR1201MB0175.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhW6syKo7P/cNUDPxMdev5jTdPA6s3RF/tTbf70FmOIeMp89hUzR8N7RxMFJbaDoocQe4u7e3s1CkHlcBNbyb/OznA+B9JU+Qsa5hQCmZxRQrnFPdYOuUXlrBRLFANEk/qJCOdgysLzL6AARo5UtDg+zuiJAIGsWe+1eoXFU4tPXexbCA93E7NGeICTEVqwhFfGkV3pyxLTTsDQkbm0fnmCIzdKs2/4v+R4E3llKGXvX5poGHzTf99zz9iDoo5eEXBuSZWYMuAXw8kUspCZhBg0hvJv6+DRRSHQgMAPYxey7mWaZULNJrUy37UFv9pq7boEKGD5gZwwynokxLOGqwjZQPyIKOJ2Fm/zOE+IaiiZd7bPQdeRm53WEw2I0Pr4EiEuJLpXBnhRqgTW9syP3+dnJ3GscrTv5dFCZAWBS1raOC9L1x2VcbKEwMLuCxdmKyGNhY1n9Vh13NSwDzpYT7v3EhI3lT6707S6RHwxmrUWWM5K/8zHjr+wAQqMiCuXFC3rD8CzPtKkHDNy6p+SnhS7Rx3M7KT63t2IfidrWWmSUtU7LiV8pnJpTMcfMsdpQNvuRgsd+M0VsbFxh0nQW/IhmoMAdlP88apVdedmMhpbwBPV9H+q5jFAmfuFMazktsN7MFWvejEiIgi8kAVAaOQyv3HvSeGgGEK5nQ6EemWO+4hkxK+0w1/bDyxsAeRi9CWm2ejyB+uRrUbUZMORGJw==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(54906003)(316002)(356005)(7636003)(36756003)(70206006)(86362001)(82310400003)(47076005)(36860700001)(6916009)(508600001)(1076003)(6666004)(107886003)(8936002)(8676002)(26005)(5660300002)(16526019)(186003)(83380400001)(4326008)(2906002)(336012)(70586007)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 17:46:03.2932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92db3d6a-bfe4-41c1-b19b-08d97939da70
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0175
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
v0->v2:
 Comments pointed out by Guenter:
 - Fix comment.
 - Drop boolean variable 'config'.
 - Drop conversion in 'return' in mlxreg_fan_set_cur_state().
---
 drivers/hwmon/mlxreg-fan.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 116681fde33d..adcf6cdbf53c 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -329,6 +329,12 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 	 * overwritten.
 	 */
 	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
+		/*
+		 * This is configuration change, which is only supported through sysfs.
+		 * For configuration non-zero value is to be returned to avoid thermal
+		 * statistics update.
+		 */
+		err = 1;
 		state -= MLXREG_FAN_MAX_STATE;
 		for (i = 0; i < state; i++)
 			fan->cooling_levels[i] = state;
@@ -343,7 +349,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 
 		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
 		if (state < cur_state)
-			return 0;
+			return err;
 
 		state = cur_state;
 	}
@@ -359,7 +365,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		dev_err(fan->dev, "Failed to write PWM duty\n");
 		return err;
 	}
-	return 0;
+	return err;
 }
 
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
-- 
2.20.1

