Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879C1C28CF5
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jan 2022 14:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbiAZOSs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jan 2022 09:18:48 -0500
Received: from mail-bn1nam07on2086.outbound.protection.outlook.com ([40.107.212.86]:26601
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229649AbiAZOSq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jan 2022 09:18:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIDUpWZhJQ8nAjDmiIjvPHMI1Y2Nd4ItH4oPLviB7009sziNnyjJVD1p1BDzEqPjdjLV09l9Z/OHGfY2A1ID7XG665tXPGpK5aUNjqJ69Dyl6GLiydPqbF8a87SFd2yxTIUSt+2kso8cB0PMA1dHhR4viaPkOFF+565WRTGeK1ZJVE71hn2dnu49OJfRfiqh5IwM7KRAxbFSorFDUqaXUOOV8asi94+xVFNlvXdLiJDAaQ2tiN4omD2F3I5w7SHMgiXLpaNVyEj8Ls93z3CygVAAhPdtIOVYY6v+aW1WWlQ4IGmegrMGDOL7/JVZHUnTDkb2rdqbkdhGoJe4KR6Jyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVqy5aVEGyF/k19L3pob0KkO9X4TjnjpLn4cqmpEcp4=;
 b=Ue9/XfUn5QQC6upRK+10iPQl7sPeTFczKKSO1mmnBkLWAsnv43k+QbnG2MexLRAeq0zexYZoX+4aDXWXjzcePSkAYqb7Shktri9Rq72LE6tTxcNWxoRHqSOw4/BZi1oNsbOI0ePFbJwiYsTCBCvs7oMbtRL5jBNUKd9/1xrEHD+Z60CJCxPFEXuShjtiihrUQTLNELwQs93i7vn0rsNmJ0Iza0Q9Y5eHOzXRYyM6Lo9NPkwixFrWgV1nDsJRVbnsy2xDtuCV3RGp2VJ/Wm0uy6vFVZ1d6Aa0s5SPft0LjZIklhVcwlr1tpp1jvl2egKsPQDVrhIXX15dbaSiRdsc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVqy5aVEGyF/k19L3pob0KkO9X4TjnjpLn4cqmpEcp4=;
 b=NVNjFLsnN1vsQCt7Ziubfm/Ytl6DxnyqWzUC7u9BRKaafFdEp2ZKG3F9N2yvFKvtfyzxJHy/iiEnl6669Bc/krq2sU1l3kpd1Y9mqbjZ1Fj2g9uoI6XGCRg3Q4Y3IFArg6HQ0n+hPnpCfQWLUD2fNuNiU0Btl1At5Sj1lA3gE27H/jtSGv4lCU0vZj8yHza4DjBR5+2ufMsf+A46E5X1hbodWSMz0Zm6/J1MyY/4mwrwoH4I4kmfTcUtHfnOf7ulvjyWXk4XF8R0EYI7JTmYhGfB4BeleGfX0nMGom/6q9CIb34+s8YteVoEHdaZr40RAxooenFTRac2m4NllPLJXg==
Received: from BN9PR03CA0748.namprd03.prod.outlook.com (2603:10b6:408:110::33)
 by DM5PR12MB1324.namprd12.prod.outlook.com (2603:10b6:3:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 14:18:44 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::85) by BN9PR03CA0748.outlook.office365.com
 (2603:10b6:408:110::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 14:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 14:18:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 26 Jan
 2022 14:18:42 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Wed, 26 Jan 2022 06:18:41 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Use pwm attribute for setting fan speed low limit
Date:   Wed, 26 Jan 2022 16:18:25 +0200
Message-ID: <20220126141825.13545-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: drhqmail201.nvidia.com (10.126.190.180) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99af127c-4693-409a-162e-08d9e0d6c25d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1324:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB13249188FBC804C4ABD81D99AF209@DM5PR12MB1324.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7g6u0aQ5eiwFBGe8esi8ajnZ+umUyCBW64W1FBu2brDipS6pNWLBolBalxmparyigUzw1o64vuwoGQ/Em/q1WxMXTAQFWY5yvpTRBB47qXUqEnIA3ORYfB6JxRct3pMhZzDRa3Gw/JIkgIzfPXRyXA6O5DkCO4FomwYkk4Yn4R11saRWlDd2W92HK/xEArW2Wk+Ah78tmNU8PLTO/FwBW1bZV+2pCUWlk3JDI/d3+v03PR80HKKTsiV6Z0kEFazjvAvm2PxK2LJfkN09vKhZmX5rcl7dCmJzZ7E4/M4CfL3vf3eAH72YhZbl6Wo+1d/uxTPuUVgZWJYC3XLndETufhhgjZG5WPpY1aqti187X/5FHB3Lwp3FZZ1jjr2lXnpLS+79xaZRHMwvOgv3dSbKqs8h14MGfdwWML4I+AbJzp0VYDwlMqOnmp+jp+KikFAlxGi7B6UxYrtbhzB8vdK94kUtNFj61CK+2khdKqvme7Ox0za+HySHJ9jwnoJhdq3EW5uUvWXy63Bo0kfWmCbc5dMgyA7lFhQBCwf1slxRc1mQ1JokY1XRltl1w+oEIVbrFJk4MbwhR9u5ZOOPCdkPTtv2zUy5fEos2lQzL4vTj1iABO81rd3k5A81mGvQzfQdyzwGJ9KkoTDhEHQCBxKKlgqiRFij1rqDe8fYU7pKiC7M8SQ9Qna1Hc8NKliVMoi0eb3jGw5+w1MYi0WtskzcaretnYRUIrqbUE01TWraZUs5kOSSdwlnBXzD7DsRVNfSQRT6TCsS4B2BqWPwlg/oO33k3gd/OZl6xzOEaHuqaFQ=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700004)(46966006)(107886003)(82310400004)(1076003)(2616005)(70206006)(5660300002)(36860700001)(16526019)(316002)(336012)(508600001)(8676002)(2906002)(54906003)(356005)(86362001)(83380400001)(4326008)(426003)(36756003)(186003)(8936002)(47076005)(6666004)(70586007)(81166007)(26005)(6916009)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:18:43.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99af127c-4693-409a-162e-08d9e0d6c25d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1324
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Recently 'cur_state' user space 'sysfs' interface 'sysfs' has been
deprecated. This interface is used in Nvidia systems for setting fan
speed limit. Currently fan speed limit is set from the user space by
setting 'sysfs' 'cur_state' attribute to 'max_state + n', where 'n' is
required limit, for example: 15 for 50% speed limit, 20 for full fan
speed enforcement.
The purpose of this feature is to provides ability to limit fan speed
according to some system wise considerations, like absence of some
replaceable units (PSU or line cards), high system ambient temperature,
unreliable transceivers temperature sensing or some other factors which
indirectly impacts system's airflow.

The motivation is to support fan low limit feature through 'hwmon'
interface.

Use 'hwmon' 'pwm' attribute for setting low limit for fan speed in
case 'thermal' subsystem is configured in kernel. In this case setting
fan speed through 'hwmon' will never let the 'thermal' subsystem to
select a lower duty cycle than the duty cycle selected with the 'pwm'
attribute.
From other side, fan speed is to be updated in hardware through 'pwm'
only in case the requested fan speed is above last speed set by
'thermal' subsystem, otherwise requested fan speed will be just stored
with no PWM update.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v0->v2:
 Comments pointed out by Guenter:
 - Modify commit text. Add more explanation.
 - Drop 'cooling_levels' array.
 - Remove fan limit callback, use (IS_REACHABLE(CONFIG_THERMAL))
   instead.
 - Keep original code for 'return' in mlxreg_fan_write().
 - Call mlxreg_fan_set_cur_state() from mlxreg_fan_write().
---
 drivers/hwmon/mlxreg-fan.c | 84 ++++++++++++--------------------------
 1 file changed, 27 insertions(+), 57 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 4a8becdb0d58..d33e180ce2dd 100644
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
@@ -87,13 +78,16 @@ struct mlxreg_fan_tacho {
  * @connected: indicates if PWM is connected;
  * @reg: register offset;
  * @cooling: cooling device levels;
+ * @last_hwmon_state: last cooling state set by hwmon subsystem;
+ * @last_thermal_state: last cooling state set by thermal subsystem;
  * @cdev: cooling device;
  */
 struct mlxreg_fan_pwm {
 	struct mlxreg_fan *fan;
 	bool connected;
 	u32 reg;
-	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
+	unsigned long last_hwmon_state;
+	unsigned long last_thermal_state;
 	struct thermal_cooling_device *cdev;
 };
 
@@ -119,6 +113,9 @@ struct mlxreg_fan {
 	int divider;
 };
 
+static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state);
+
 static int
 mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		int channel, long *val)
@@ -213,6 +210,18 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			    val > MLXREG_FAN_MAX_DUTY)
 				return -EINVAL;
 			pwm = &fan->pwm[channel];
+			/* If thermal is configured - handle PWM limit setting. */
+			if (IS_REACHABLE(CONFIG_THERMAL)) {
+				pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(val);
+				/*
+				 * Update PWM only in case requested state is not less than the
+				 * last thermal state.
+				 */
+				if (pwm->last_hwmon_state >= pwm->last_thermal_state)
+					return mlxreg_fan_set_cur_state(pwm->cdev,
+									pwm->last_hwmon_state);
+				return 0;
+			}
 			return regmap_write(fan->regmap, pwm->reg, val);
 		default:
 			return -EOPNOTSUPP;
@@ -338,58 +347,22 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
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
 
-	/* Normalize the state to the valid speed range. */
-	state = pwm->cooling_levels[state];
+	/* Save thermal state. */
+	pwm->last_thermal_state = state;
+
+	state = max_t(unsigned long, state, pwm->last_hwmon_state);
 	err = regmap_write(fan->regmap, pwm->reg,
 			   MLXREG_FAN_PWM_STATE2DUTY(state));
 	if (err) {
 		dev_err(fan->dev, "Failed to write PWM duty\n");
 		return err;
 	}
-	return config;
+	return 0;
 }
 
 static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
@@ -564,7 +537,7 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 
 static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 {
-	int i, j;
+	int i;
 
 	for (i = 0; i < MLXREG_FAN_MAX_PWM; i++) {
 		struct mlxreg_fan_pwm *pwm = &fan->pwm[i];
@@ -579,11 +552,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 			return PTR_ERR(pwm->cdev);
 		}
 
-		/* Init cooling levels per PWM state. */
-		for (j = 0; j < MLXREG_FAN_SPEED_MIN_LEVEL; j++)
-			pwm->cooling_levels[j] = MLXREG_FAN_SPEED_MIN_LEVEL;
-		for (j = MLXREG_FAN_SPEED_MIN_LEVEL; j <= MLXREG_FAN_MAX_STATE; j++)
-			pwm->cooling_levels[j] = j;
+		/* Sit minimal PWM speed. */
+		pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
 	}
 
 	return 0;
-- 
2.20.1

