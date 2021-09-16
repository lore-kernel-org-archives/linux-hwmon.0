Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7C9C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 21:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 836F861209
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 21:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhIPVdN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 17:33:13 -0400
Received: from mail-bn8nam11on2044.outbound.protection.outlook.com ([40.107.236.44]:57274
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240560AbhIPVdN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 17:33:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLQJEsKvmF5Lz+uxlj8wssDWQdEs9LxW9Q64Pbx7pj3IK6hQF6MRmFmBqy7FGONcHzF/uMrseKu1VTV+Ovnlg9HBhi7ji5yboXEn8WL2BUKdgd41qIjkYpFoxdgEzl7aNu8kLk1NQK8HsbpqNTRdnk58sL8KqcC7rmo079VJQz7fiN3TE/uqlQjTDrZGt20Wztzrl+mlem/6e76NSwcReRnrhQWGWdgWh1nmYG5560xpf2r2ZK0aSCEQpuQU3qAa3qapXtsOFTL60C+rvW/lOfY4B9ygywvL4xGFKY3h9TovNyuXCnYLL+xu6cg7HWa7X/onZ+OzSq6KvEg386aVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=scl83DYKJYn6LgicXNoaXlTqSPQY7wxAnOMqaZtkxH4=;
 b=Bdi3Z7L6vVshC8/E7jSDBL99VT4id/aABBR+bAaoQUBwUxZUsHWzVa5gohKXQXZsHlb0RyP7G4JturWfVQqP9x6yEZiOcwWPdau06Pw6vYs2LQ4e6bWxohpGhsgcfqD6sxunBwSl/AyYWDsDEetX70cdM0iUnelG7YkZLy6MtlS35cjgDpNutIcxdjPote3AAj25IT+0etptngHSyjILWUbcXeW8MeWhiRb2h/lqstj4ipZCdDarlSyA3IF1ISwgnIy4ndBtAICvkNism2ztIIE9RGAibDlmi529tUVcFsO5x69JDVudQMAs/+Hea7g8XRHCoNf/dnYXHAstVaVaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scl83DYKJYn6LgicXNoaXlTqSPQY7wxAnOMqaZtkxH4=;
 b=p6/pzEQ4acQ1EetydWnNZh7gGD316tUbJQHCj3zaqCL+pntFN1zJ0p94LJs+9v1tHVKSnEpGqplQPMbJqLie3SPO5Dwh/BDVYdeMnuR8ZqZoo98IkRuFZTbkkN9xll9TKOgunmxiDeLxmwhxIuJzHbIOOlI7QqFjlrKUh5+aiF5oJo4AGPDwg7hNhC0u7i5Y3Ao82d34Ymj7gYrE4Txx20QoR3euHtWYD9WeO/TvWpq0cj21Zm6xAP/wTQ/HX8f/J/SY83SWRn/JPmlUSGiCvEjuRATVCz6T6idFzOXwOmN5RBOZsnURGXScFmqtXxYB4EnV1O6IsoSQiTAyamyVIw==
Received: from DM5PR2001CA0003.namprd20.prod.outlook.com (2603:10b6:4:16::13)
 by CY4PR12MB1654.namprd12.prod.outlook.com (2603:10b6:910:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 16 Sep
 2021 21:31:50 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::7a) by DM5PR2001CA0003.outlook.office365.com
 (2603:10b6:4:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 21:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 21:31:50 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 21:31:49 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 21:31:47 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v3 1/1] hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices
Date:   Fri, 17 Sep 2021 00:31:28 +0300
Message-ID: <20210916213128.874990-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4171c15-ef65-4043-9ba5-08d979596513
X-MS-TrafficTypeDiagnostic: CY4PR12MB1654:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1654F4AE4390D632087D3CC6AFDC9@CY4PR12MB1654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gy1LliEtDCJcUF7LfSRWnVPVDBpiVyRgZab553buqgIvt8CNUU30g2YLVvgsE+SN8ge0eJF/vjWiZRl56suU7+J8g/nM4Crym6Bzd2Dad0KbgCrb/Zc0gy69wGewi9s3PoSkNq0AoPPc/y1uzYtM//88POFkLrQRK8tqTdyD0OPiCfI+SuoPHjCMcctTjr9D0ZhcgYyT+8NyHGQq4597GWqBsDsCrupk5u1b9lAvab7u/DotkhlrjQnw7M0ncYZh5Hc4cGF+FkYQ93/szEctj43NKZU4FnTI801jfyYaLAEr4vDDmfOvlTIpcjBn41+hKI8ZT/IeHMsjy2EhvU3AaPS+PHi+8ObhJjxBn16MJQM44iZ82P9B6mh8JqRZN7znZJo6lELaf8zRboSAUyEMw7RMh+QYCh4rQQGZewxV5X19MmddWvYd69+z6li6truY3QtqnpVpIZdtfuPYvw5mERyu9GZ4a5YfNjsyd73bfMmpPpzGU2CHsOAQ2NNSvzfPtyGECxgvon5betyzo6JJdn55SSIiKtenqb3VBCAVRtGZy0i8Vl5U13bxn+oDiAPPgJ9r7nVqBmi506EOUHxAJLljELDYwBXijoYbyiPoQoFlrGuWGxM+YTcPGtP+3yIs59KATPS0S8Noe/0w1JKdfGqVyDtk3kDJKsP4XfE87qNA/3N4NBABVraw5I/vHmZ7D9+0wGHpI74ZGEN66erfzg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(336012)(8676002)(83380400001)(70206006)(6666004)(6916009)(54906003)(4326008)(26005)(86362001)(70586007)(186003)(82740400003)(426003)(478600001)(5660300002)(36860700001)(356005)(1076003)(16526019)(107886003)(7636003)(47076005)(2616005)(8936002)(316002)(36756003)(2906002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 21:31:50.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4171c15-ef65-4043-9ba5-08d979596513
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1654
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for additional cooling devices in order to support the
systems, which can be equipped with up-to four PWM controllers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3:
 Comments pointed out by Guenter:
 - Drop label "devm_thermal_of_cooling_device_register_fail".
v0->v2:
 Comments pointed out by Guenter:
 - Drop call to thermal_cooling_device_unregister() in error flow,
   devices registered by devm_thermal_of_cooling_device_register()
   should be cleaned automatically.
---
 drivers/hwmon/mlxreg-fan.c | 73 ++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 1a146cc4b0fd..35228ed112d7 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -63,6 +63,8 @@
 					 MLXREG_FAN_MAX_DUTY,		\
 					 MLXREG_FAN_MAX_STATE))
 
+struct mlxreg_fan;
+
 /*
  * struct mlxreg_fan_tacho - tachometer data (internal use):
  *
@@ -81,12 +83,18 @@ struct mlxreg_fan_tacho {
 /*
  * struct mlxreg_fan_pwm - PWM data (internal use):
  *
+ * @fan: private data;
  * @connected: indicates if PWM is connected;
  * @reg: register offset;
+ * @cooling: cooling device levels;
+ * @cdev: cooling device;
  */
 struct mlxreg_fan_pwm {
+	struct mlxreg_fan *fan;
 	bool connected;
 	u32 reg;
+	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
+	struct thermal_cooling_device *cdev;
 };
 
 /*
@@ -99,8 +107,6 @@ struct mlxreg_fan_pwm {
  * @tachos_per_drwr - number of tachometers per drawer;
  * @samples: minimum allowed samples per pulse;
  * @divider: divider value for tachometer RPM calculation;
- * @cooling: cooling device levels;
- * @cdev: cooling device;
  */
 struct mlxreg_fan {
 	struct device *dev;
@@ -111,8 +117,6 @@ struct mlxreg_fan {
 	int tachos_per_drwr;
 	int samples;
 	int divider;
-	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
-	struct thermal_cooling_device *cdev;
 };
 
 static int
@@ -305,11 +309,12 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
 				    unsigned long *state)
 
 {
-	struct mlxreg_fan *fan = cdev->devdata;
+	struct mlxreg_fan_pwm *pwm = cdev->devdata;
+	struct mlxreg_fan *fan = pwm->fan;
 	u32 regval;
 	int err;
 
-	err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
+	err = regmap_read(fan->regmap, pwm->reg, &regval);
 	if (err) {
 		dev_err(fan->dev, "Failed to query PWM duty\n");
 		return err;
@@ -324,7 +329,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 				    unsigned long state)
 
 {
-	struct mlxreg_fan *fan = cdev->devdata;
+	struct mlxreg_fan_pwm *pwm = cdev->devdata;
+	struct mlxreg_fan *fan = pwm->fan;
 	unsigned long cur_state;
 	int i, config = 0;
 	u32 regval;
@@ -348,11 +354,11 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		config = 1;
 		state -= MLXREG_FAN_MAX_STATE;
 		for (i = 0; i < state; i++)
-			fan->cooling_levels[i] = state;
+			pwm->cooling_levels[i] = state;
 		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
-			fan->cooling_levels[i] = i;
+			pwm->cooling_levels[i] = i;
 
-		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
+		err = regmap_read(fan->regmap, pwm->reg, &regval);
 		if (err) {
 			dev_err(fan->dev, "Failed to query PWM duty\n");
 			return err;
@@ -369,8 +375,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		return -EINVAL;
 
 	/* Normalize the state to the valid speed range. */
-	state = fan->cooling_levels[state];
-	err = regmap_write(fan->regmap, fan->pwm[0].reg,
+	state = pwm->cooling_levels[state];
+	err = regmap_write(fan->regmap, pwm->reg,
 			   MLXREG_FAN_PWM_STATE2DUTY(state));
 	if (err) {
 		dev_err(fan->dev, "Failed to write PWM duty\n");
@@ -541,11 +547,32 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 		fan->tachos_per_drwr = tacho_avail / drwr_avail;
 	}
 
-	/* Init cooling levels per PWM state. */
-	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
-		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
-	for (i = MLXREG_FAN_SPEED_MIN_LEVEL; i <= MLXREG_FAN_MAX_STATE; i++)
-		fan->cooling_levels[i] = i;
+	return 0;
+}
+
+static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
+{
+	int i, j;
+
+	for (i = 0; i <= MLXREG_FAN_MAX_PWM; i++) {
+		struct mlxreg_fan_pwm *pwm = &fan->pwm[i];
+
+		if (!pwm->connected)
+			continue;
+		pwm->fan = fan;
+		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, "mlxreg_fan", pwm,
+								    &mlxreg_fan_cooling_ops);
+		if (IS_ERR(pwm->cdev)) {
+			dev_err(dev, "Failed to register cooling device\n");
+			return PTR_ERR(pwm->cdev);
+		}
+
+		/* Init cooling levels per PWM state. */
+		for (j = 0; j < MLXREG_FAN_SPEED_MIN_LEVEL; j++)
+			pwm->cooling_levels[j] = MLXREG_FAN_SPEED_MIN_LEVEL;
+		for (j = MLXREG_FAN_SPEED_MIN_LEVEL; j <= MLXREG_FAN_MAX_STATE; j++)
+			pwm->cooling_levels[j] = j;
+	}
 
 	return 0;
 }
@@ -584,16 +611,10 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
 		return PTR_ERR(hwm);
 	}
 
-	if (IS_REACHABLE(CONFIG_THERMAL)) {
-		fan->cdev = devm_thermal_of_cooling_device_register(dev,
-			NULL, "mlxreg_fan", fan, &mlxreg_fan_cooling_ops);
-		if (IS_ERR(fan->cdev)) {
-			dev_err(dev, "Failed to register cooling device\n");
-			return PTR_ERR(fan->cdev);
-		}
-	}
+	if (IS_REACHABLE(CONFIG_THERMAL))
+		err = mlxreg_fan_cooling_config(dev, fan);
 
-	return 0;
+	return err;
 }
 
 static struct platform_driver mlxreg_fan_driver = {
-- 
2.20.1

