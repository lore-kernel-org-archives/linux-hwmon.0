Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E86C71153
	for <linux-hwmon@archiver.kernel.org>; Sun,  3 Sep 2023 14:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjICOAx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 3 Sep 2023 10:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjICOAw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Sep 2023 10:00:52 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0CEE8
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Sep 2023 07:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q07P3Jqxsz/0ov099Hkf0iTElQ20jc5/F4826nbgVxSUpIpbbbRf59enipZTTxvPjTX71okccW8DsDqLCy2TVyX2xc8b6mHnGrl9f5xowS93fRv3ryd7rokcE/OiEKtqyfKFtuLlQq113L9vC4LPFTt+Z9FK6EZnRbb5pAtGkUhJoHYlGnzlZOBpgys57L1vEffBKUJhPuDh85eNG17hEF5zW8o+dD3tC642p8R3CwGPXmsOGzKMsO0gE44cchzagX+vy6AvAJtvLTQUocztwPxLD2y6dqRfrKnU9X1/bP645x1YonEfuuy4s3uPvRGs7s10zt44wOuDiVSApZtS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV8p19CRxKzOL9KYZGF69fiWPOzqFnoOR578N9FOKL8=;
 b=DKN//A9auX6Q3S81dRXbDsNI5MmWK2VMFZxQlM+1TocM4efKZQ8wpq3rlWJF4VUNfl3Jwe8dkSYzRYgVCG6XEAJJ3GbTlbp/ypp4HoM06NXVIlJ9gWM/77aAkPPlZ6jUbfceca/7IAJQmSh8qtfwR8iglHNJm8/QugadH88RKT+8maEKnH74yPQCfUkHwbGOMNkdZ48/cH9/jyz0un+0b3iywx8DSVRguV8bo/CrYkqkpRTS8jNpFIYxFv67B6O6Wwist0Ci0cgk5LxZX4hJZhPuL/ErfrzInl2enr4oLE6FRJNoqAh+mjJryx2AOfKYJmx09D7FsUtLCaeSajCskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV8p19CRxKzOL9KYZGF69fiWPOzqFnoOR578N9FOKL8=;
 b=Ko9c45+ofb74PhoZ562fvbER6RLAvY/HFx1gJ/eYUdJo7ckjp0jmwUCXMrBnKigEiVqICE4WWNkGK/vhVYQBxHImmbPkbQ0k1hxPndSGU1NhrL3CH9n4nwjgU67sULdsrb+72kpTiz9NxL0lVpjZ+XeIzsBTSaUTZ3EK6bbxHfrqsEk/amze3rWkDFpZaC6fRDiN1xuRRpZGPPs4f3OqjrlnLoMUIGxgaFR3lKXTLMMFdGCozaNcP8Al7wep6VL7MIhPZVjJhx5Vu00aKAy+Id8fTX9e3q8obADJx/Jmvz2KEAkTXGEbBTMjDrtYCCK5AEl4qlYKvJenlSa81Ury+Q==
Received: from MW2PR16CA0040.namprd16.prod.outlook.com (2603:10b6:907:1::17)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.30; Sun, 3 Sep 2023 14:00:45 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::a9) by MW2PR16CA0040.outlook.office365.com
 (2603:10b6:907:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Sun, 3 Sep 2023 14:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.17 via Frontend Transport; Sun, 3 Sep 2023 14:00:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 3 Sep 2023
 07:00:30 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Sun, 3 Sep 2023 07:00:28 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 1/1] hwmon: (mlxreg-fan) Separate methods of fan setting coming from different subsystems
Date:   Sun, 3 Sep 2023 14:00:13 +0000
Message-ID: <20230903140013.49030-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ceeb9d-1d44-4893-7af1-08dbac862ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pq1S08von1A9Pdp7jLVKL4QHMXZdl+jjy/l2IjpI6cQtKmm+uX1JJuuthf6R6kNOBfj5QLcBVKfKcU34frC5Dba6EQ8dGa4MtgEHqIZDDsYKAYSCpOiiohH3DlL39g8/vO/hZELRoepCSjES+Wj+jF8qHAzZXtbKOR/ZknQ6mkwGFuIQsa+815x5zuxW2UBtTQ5sYaZvg8E5DD3KExSro45wLMTMM+EutnuQ8PAIBBXOgNIvAR/Mlyq3jObijH+40ATLYn/5NllgkXSP9+/3F3UutGSQ2wKLeOP6mrbyWdp/wjAfaPKR8VyO5aEdvgJZ22/ft9m7uaJBaxHGPsDLsnVG4n9bSK+mIj+IsQJ5ajAZSLeyv706pKTZ8roAmpdk7/bx5rdpgMIwCojGKadyoTFhY+9QLQpeaF5xx1wdvVIZxZkpg7CwoTudU2Z4USrqImyrwQSrhCKc9GhDfR+RMFbqEPxlzAsOuLMLMelD3tyNecxDG3+k0tQhxGG2xmEAJJJvmewvGjjdp9ICAVtG9pvSmZyHCQgP3TUT2f7brGqweO36PkA62JiWogwgs5BAoI7MxcO5tZ59cT/YiJxPiH3CYfa+UeIkYbnE+hEfGhllmCzBXrl/QpslRkjUwNm7RU29emp7rbJ1/EoFPcYdwmZwfzRVVTCfUZBDC/RCjx38QFv4YIdNcn47/KtoSwzUbgdz3L1KwmfCGDptOMfb1s5BrzFaEE/DtfbvSNHotQWiloRiLyHdvMbbu8va+Hxd
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(356005)(7636003)(82740400003)(6666004)(86362001)(478600001)(2616005)(83380400001)(47076005)(336012)(426003)(26005)(16526019)(107886003)(1076003)(36860700001)(40480700001)(70586007)(70206006)(54906003)(36756003)(2906002)(6916009)(316002)(8936002)(8676002)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2023 14:00:44.4251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ceeb9d-1d44-4893-7af1-08dbac862ab5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Distinct between fan speed setting request coming for hwmon and
thermal subsystems.

There are fields 'last_hwmon_state' and 'last_thermal_state' in the
structure 'mlxreg_fan_pwm', which respectively store the cooling state
set by the 'hwmon' and 'thermal' subsystem.
The purpose is to make arbitration of fan speed setting. For example, if
fan speed required to be not lower than some limit, such setting is to
be performed through 'hwmon' subsystem, thus 'thermal' subsystem will
not set fan below this limit.

Currently, the 'last_thermal_state' is also be updated by 'hwmon' causing
cooling state to never be set to a lower value.

Eliminate update of 'last_thermal_state', when request is coming from
'hwmon' subsystem.

Fixes: da74944d3a46 ("hwmon: (mlxreg-fan) Use pwm attribute for setting fan speed low limit")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index c2a96468c9b4..9a84a41b158f 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -113,8 +113,8 @@ struct mlxreg_fan {
 	int divider;
 };
 
-static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
-				    unsigned long state);
+static int _mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				     unsigned long state, bool thermal);
 
 static int
 mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
@@ -224,8 +224,9 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 				 * last thermal state.
 				 */
 				if (pwm->last_hwmon_state >= pwm->last_thermal_state)
-					return mlxreg_fan_set_cur_state(pwm->cdev,
-									pwm->last_hwmon_state);
+					return _mlxreg_fan_set_cur_state(pwm->cdev,
+									 pwm->last_hwmon_state,
+									 false);
 				return 0;
 			}
 			return regmap_write(fan->regmap, pwm->reg, val);
@@ -347,9 +348,8 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
 	return 0;
 }
 
-static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
-				    unsigned long state)
-
+static int _mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				     unsigned long state, bool thermal)
 {
 	struct mlxreg_fan_pwm *pwm = cdev->devdata;
 	struct mlxreg_fan *fan = pwm->fan;
@@ -359,7 +359,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		return -EINVAL;
 
 	/* Save thermal state. */
-	pwm->last_thermal_state = state;
+	if (thermal)
+		pwm->last_thermal_state = state;
 
 	state = max_t(unsigned long, state, pwm->last_hwmon_state);
 	err = regmap_write(fan->regmap, pwm->reg,
@@ -371,6 +372,13 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 	return 0;
 }
 
+static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state)
+
+{
+	return _mlxreg_fan_set_cur_state(cdev, state, true);
+}
+
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
 	.get_max_state	= mlxreg_fan_get_max_state,
 	.get_cur_state	= mlxreg_fan_get_cur_state,
-- 
2.20.1

