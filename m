Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA48C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 11:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237413AbiAXL2I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 06:28:08 -0500
Received: from mail-co1nam11on2041.outbound.protection.outlook.com ([40.107.220.41]:4832
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237337AbiAXL2H (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 06:28:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aic7XraPlkpkLFkWeKUotcE7RGuO5A2UmM78T3AB6tDu900ukF7G1wOOzhjZeuYHpFJftsYBVkNkcfbOKHXQA8OQqez0eYdws0kaFXfBL4tae1Xzr3koYc0l/hO2er7htEvHdSikna0AF6k3cIaX4O5rIcTJEzLreGr1NI94B52iSbG59q9hRNy9zxa1zjoJOHOKOZJ4TItFYRK/cuZKjJ38j1J4QCeWv5rrEze+iYXLoDDGQhvxs74nHJYfud5HnI6YGSXxbELeDzUQ5Zb4MZpgJKrzTLaMIcuYl+NxCdmhSjGopwMFlzayT0Y739fI4HFxDG4pgGHbW8lDEwXEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh1eTAAWb1bTu03LiY0KPvEMtJmrJqIi8qWtoufjwF0=;
 b=bz8A5OX97zOXkD8/8Vy7S92tzb+KuRuMjqWMfsOURsqaI0thDCNV0Sn5ONCT4lrBwv/fuRz4rgYytAh/lldsTeOaqdPNumCkhVW7wuI/0oYiyCYP3VIgIomSbk89N16vc92IDvTYOKHm2Ndyx5rs2X2fn11BL79lVQqDUq8A8w7L/4ebP4gNpMoRDrG8hmzmwYt2/AcAPqR+1BovT7MhuEm4vLs5c2rtTKoKhJIbu7x0cg3PwCFq2o+uM56l3TEH/ER7eDqXCrUJ7u0o/c31S0Nl/SEbn7kxtHVmVjDo7C0+cCtTNzW/TmHQeTWRplwhK6OJKE6rAkopL6v1xZdzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh1eTAAWb1bTu03LiY0KPvEMtJmrJqIi8qWtoufjwF0=;
 b=A+55WBsr1kjBMDeRIvC//VjdEKNwJzkjr39reW+hMkLqYuw7OR2gXgdEZ9bpj4M1296KIy1CZp9UG8qWVmRFbqPznA836/jhDaoJQiNJ/Y9SwmyAcJ32DfLeSdaUzI7fdhLgJfHFbFGNlVmYV12MUgQqevaVSB/zUmEgUyz9MIz9udsEbJcBTsnCDjw5nlnyZqMdHDITN40iUo1KiPYM/bIS3TkTVOAMCCKRWwgjn199SCjWRTyOKachwWMyRhylKFWbkcH1PgO+czWq0QTebfObkso9333Ipm7fsWE8zOhLOdlvPcH9fRADwWe2nP3IWS6wf0wAFah1xib2yUHEBA==
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by DM8PR12MB5479.namprd12.prod.outlook.com (2603:10b6:8:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 11:28:06 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::c1) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Mon, 24 Jan 2022 11:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 11:28:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 24 Jan
 2022 11:28:05 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 03:28:03 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Use pwm attribute for setting fan speed low limit
Date:   Mon, 24 Jan 2022 13:27:44 +0200
Message-ID: <20220124112744.27950-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: drhqmail202.nvidia.com (10.126.190.181) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cec296cf-b130-4633-cbf4-08d9df2c9765
X-MS-TrafficTypeDiagnostic: DM8PR12MB5479:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5479178BCE9F2B965E716885AF5E9@DM8PR12MB5479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3kDyMGEGS7Jq+GVtEy7bvLmLgiBve1BgeRxGT47t9F0CHKMojtxL0NC75PYBGI//hE9pfz06GAjKIFX6CJ0f9nAYKLoQMTXx5eMod/NTjZZMw1dIDql6Yl51u2C4PdARA3Mn6UQnDhZeN21CkfURYNQ2ZslkasAkfoArLSszIsOVSk5B26c0WoWFuoMp/2Bbjp4nyG6qAvIcRDGZbO1NM7+30MYoYBMjjIMGxVXo1GKKs1nL9Ee+qF3dQsepYqYxz0cEboCYVDXsNxZ1huvcWnX75RhUECWtBTC9faYP4h5a/+pbWutTi10vXMAgfTpAX5q6rDih/ftJXzAltzc5234EWvpnfOAHwGnWRj3lW0FYMl1TQYNgOjWhpMgZOj6ZFSlxaU4c4C+Y95mCw4epoouecAzA8D1bKOm/o3dJt/xwnijtJRCvRCVPnpttA7xt4khN0Bf2dZayT9DMJGQ/qIiol1tFZKdm7AaioQeBlgBSIUoD8sQ98aPKGw5BNL3WlFG9Ry9cqSr/NZqvrmlZQDcUemDxfgVLd1FuwzL2/n9n1Ce0a3qarJnYFaC68x1or6WBTP57ruUgNwbRkx0MGol5cCsoMEXoVzonUYuJJCSZVPvZPzdKge4tuUmVAlqxA4700zLkG/IoT7r20bSDuRdkcDwjmG8X/jVw1GFuIjwB//g/AZuBIr3R436D7F8sdcCgj2XXvlIbiceqamR7Gl9tGu3EEXOhCNi6KK1hgqwA8shtNzmgCDQzksi2CpTRKb3a6DbAZa+tBg1X6UtAAoMhT0G8RtXfTO7bwQnATk=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(1076003)(83380400001)(316002)(5660300002)(70206006)(356005)(70586007)(40460700003)(508600001)(2616005)(6666004)(8936002)(2906002)(336012)(86362001)(107886003)(82310400004)(36756003)(426003)(26005)(4326008)(47076005)(8676002)(36860700001)(16526019)(6916009)(81166007)(54906003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 11:28:05.9659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec296cf-b130-4633-cbf4-08d9df2c9765
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5479
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Currently driver uses 'thermal' attribute 'cur_state' to set low limit
for fan speed from user space. Such limit is set due to system wise
considerations, like absence of power supply unit, faults received for
transceivers, power supplies, or some other devices.

Recently 'cur_state' interface has been deprecated, while the speed
limit feature is required for Nvidia systems.

Use 'hwmon' 'pwm' attribute for setting low limit for fan speed in
case 'thermal' subsystem is configured in kernel. In this case setting
fan speed through 'hwmon' is used for setting fan low speed limit:
- Fan speed is to be updated in hardware in case the requested fan
  speed is above of the last cooling level, set by 'thermal' subsystem.
  Thermal cooling levels array is to be updated accordingly, thus
  if cooling state has been set to 'n', fan->cooling_levels[0..n] are
  to be converted to the same RPM value.
- Otherwise, the requested fan speed is only to be stored in thermal
  cooling levels array with no update in hardware.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 96 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 4a8becdb0d58..daae8741ff2b 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -18,15 +18,6 @@
 #define MLXREG_FAN_MAX_STATE		10
 #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
 #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
-/*
- * Minimum and maximum FAN allowed speed in percent: from 20% to 100%. Values
- * MLXREG_FAN_MAX_STATE + x, where x is between 2 and 10 are used for
- * setting FAN speed dynamic minimum. For example, if value is set to 14 (40%)
- * cooling levels vector will be set to 4, 4, 4, 4, 4, 5, 6, 7, 8, 9, 10 to
- * introduce PWM speed in percent: 40, 40, 40, 40, 40, 50, 60. 70, 80, 90, 100.
- */
-#define MLXREG_FAN_SPEED_MIN			(MLXREG_FAN_MAX_STATE + 2)
-#define MLXREG_FAN_SPEED_MAX			(MLXREG_FAN_MAX_STATE * 2)
 #define MLXREG_FAN_SPEED_MIN_LEVEL		2	/* 20 percent */
 #define MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF	44
 #define MLXREG_FAN_TACHO_DIV_MIN		283
@@ -87,6 +78,7 @@ struct mlxreg_fan_tacho {
  * @connected: indicates if PWM is connected;
  * @reg: register offset;
  * @cooling: cooling device levels;
+ * @last_thermal_state: last cooling state set by thermal subsystem;
  * @cdev: cooling device;
  */
 struct mlxreg_fan_pwm {
@@ -94,6 +86,7 @@ struct mlxreg_fan_pwm {
 	bool connected;
 	u32 reg;
 	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
+	unsigned long last_thermal_state;
 	struct thermal_cooling_device *cdev;
 };
 
@@ -107,6 +100,7 @@ struct mlxreg_fan_pwm {
  * @tachos_per_drwr - number of tachometers per drawer;
  * @samples: minimum allowed samples per pulse;
  * @divider: divider value for tachometer RPM calculation;
+ * @pwm_limit_set: callback to set minimum limit for PWM;
  */
 struct mlxreg_fan {
 	struct device *dev;
@@ -117,6 +111,7 @@ struct mlxreg_fan {
 	int tachos_per_drwr;
 	int samples;
 	int divider;
+	int (*pwm_limit_set)(struct mlxreg_fan *fan, struct mlxreg_fan_pwm *pwm, long val);
 };
 
 static int
@@ -204,6 +199,7 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct mlxreg_fan *fan = dev_get_drvdata(dev);
 	struct mlxreg_fan_pwm *pwm;
+	int err;
 
 	switch (type) {
 	case hwmon_pwm:
@@ -213,7 +209,11 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			    val > MLXREG_FAN_MAX_DUTY)
 				return -EINVAL;
 			pwm = &fan->pwm[channel];
-			return regmap_write(fan->regmap, pwm->reg, val);
+			/* If thermal is configured - handle PWM limit setting. */
+			if (!err && fan->pwm_limit_set)
+				return fan->pwm_limit_set(fan, pwm, val);
+			err = regmap_write(fan->regmap, pwm->reg, val);
+			return err;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -338,49 +338,13 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct mlxreg_fan_pwm *pwm = cdev->devdata;
 	struct mlxreg_fan *fan = pwm->fan;
-	unsigned long cur_state;
-	int i, config = 0;
-	u32 regval;
 	int err;
 
-	/*
-	 * Verify if this request is for changing allowed FAN dynamical
-	 * minimum. If it is - update cooling levels accordingly and update
-	 * state, if current state is below the newly requested minimum state.
-	 * For example, if current state is 5, and minimal state is to be
-	 * changed from 4 to 6, fan->cooling_levels[0 to 5] will be changed all
-	 * from 4 to 6. And state 5 (fan->cooling_levels[4]) should be
-	 * overwritten.
-	 */
-	if (state >= MLXREG_FAN_SPEED_MIN && state <= MLXREG_FAN_SPEED_MAX) {
-		/*
-		 * This is configuration change, which is only supported through sysfs.
-		 * For configuration non-zero value is to be returned to avoid thermal
-		 * statistics update.
-		 */
-		config = 1;
-		state -= MLXREG_FAN_MAX_STATE;
-		for (i = 0; i < state; i++)
-			pwm->cooling_levels[i] = state;
-		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
-			pwm->cooling_levels[i] = i;
-
-		err = regmap_read(fan->regmap, pwm->reg, &regval);
-		if (err) {
-			dev_err(fan->dev, "Failed to query PWM duty\n");
-			return err;
-		}
-
-		cur_state = MLXREG_FAN_PWM_DUTY2STATE(regval);
-		if (state < cur_state)
-			return config;
-
-		state = cur_state;
-	}
-
 	if (state > MLXREG_FAN_MAX_STATE)
 		return -EINVAL;
 
+	/* Save requested thermal state. */
+	pwm->last_thermal_state = state;
 	/* Normalize the state to the valid speed range. */
 	state = pwm->cooling_levels[state];
 	err = regmap_write(fan->regmap, pwm->reg,
@@ -389,7 +353,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		dev_err(fan->dev, "Failed to write PWM duty\n");
 		return err;
 	}
-	return config;
+	return 0;
 }
 
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
@@ -562,6 +526,38 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 	return 0;
 }
 
+static int mlxreg_pwm_limit_set(struct mlxreg_fan *fan, struct mlxreg_fan_pwm *pwm, long val)
+{
+	unsigned long new_state;
+	int i, err = 0;
+	u32 regval;
+
+	/*
+	 * In case thermal subsystem is configured, access for PWM setting through hwmon is used
+	 * for setting fan minimum speed limit. For such case update cooling levels accordingly,
+	 * thus if cooling state has been set to 'n', fan->cooling_levels[0..n] are to be
+	 * converted to the same RPM value. Update PWM in case requested speed is above cooling
+	 * state set by thermal driver.
+	 */
+	err = regmap_read(fan->regmap, pwm->reg, &regval);
+	if (err) {
+		dev_err(fan->dev, "Failed to query PWM duty\n");
+		return err;
+	}
+
+	new_state = MLXREG_FAN_PWM_DUTY2STATE(val);
+
+	for (i = 0; i < new_state; i++)
+		pwm->cooling_levels[i] = new_state;
+	for (i = new_state; i <= MLXREG_FAN_MAX_STATE; i++)
+		pwm->cooling_levels[i] = i;
+	/* Update PWM only in case requested state is above last thermal state. */
+	if (new_state >= pwm->last_thermal_state)
+		err = regmap_write(fan->regmap, pwm->reg, MLXREG_FAN_PWM_STATE2DUTY(new_state));
+
+	return err;
+}
+
 static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 {
 	int i, j;
@@ -586,6 +582,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 			pwm->cooling_levels[j] = j;
 	}
 
+	fan->pwm_limit_set = mlxreg_pwm_limit_set;
+
 	return 0;
 }
 
-- 
2.20.1

