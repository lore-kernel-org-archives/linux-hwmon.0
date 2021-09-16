Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34321C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 195B860F26
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240107AbhIPNYp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:24:45 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:59615
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240099AbhIPNYo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:24:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsvZkcoQxE9QORgWjCsJNqisoc72AoV6hFndK0xhqpJnoLxyispnRXtfTAbS78kvZLkF2ZbAHYBRZW72L0mpZCqTtQ7+Y21525irU1/PrGCwOLvKJj9IOkJTOwLHdgdsB5qQMTfifgIFU8OJdtSurosdL60HU3cNUB+cLZNj5wlvvEcSG43B7lT3KWDaULrgzxXz4cMOmVh82SkIyMZDx+6xqt6pmP4DbFnuGc/atsTQYwS6IQeAbsBdtllMVDOOCRkn5bBog05DubNyI50G5VY/k1GRmoxi0VDXQs5vo7ocn+yaGNp7K12rnGFHBj4rcmKZ6i7d8/o+KlzCT+CeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4Fa3eKDZvECyzzatGmcJJI1y+W6H4udXWBYgoDgvSFM=;
 b=Q8tOKMDNBjv/O6QEVQ/vtcjDwb94Cmf4qqXTg+w2YO4Ncnr/RCBGovyoPa8Jque8VShLbshbklpQt7TDm4BjULFNjyALhX37ccuYN7yFMRyLqLp74yxQL0pW7YgLCsbDYbXmg//BT0+2tMvtGSgBuqOuDcVL8Av58UmIiB+W76dmKmnQsuQRygjx9qyKQNuY9SEGvig/a9WN3K+ND5MRLm8L97cZ06V3ukS6mkYqJ8nOEKRZ7ZJ9nE/XMGPSDFBLwofdX6YwtItGtQNcMw1wZJpJW6f/25Azm7Xw1hRVkkmih3fXyiB5lQRy7RVybhQZae+Y5uhQn9Xc+YdQgh2PLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Fa3eKDZvECyzzatGmcJJI1y+W6H4udXWBYgoDgvSFM=;
 b=hLNWGCH/VTbCIpoqMX54o9d3BxrJF1aoB68FC0mutaRvUgNJD+lhx8gg4fAeONvn0GOgdVgSEjso+jIf0CP0VzrDj5tpsvzciavORccQ4nWnwBoqsrIpJd4ncrRmV3NLlYjJCsTFuFzv+BSWLsyx7l6rTh49Iz8yk938shOQRToUCLhfEbxK1sHkuywQfxfPBxHA0tsHBXImdlaPMFOEMO7LUl2ODvdQ8Ry2XnrY/tfwegU+2Jp6bXnDdjt/lZuX8vHDiHPIRQr+EEiG14S5dBT1SAQi9A3miv8+FE//IwafRg7f9j6B00Ogt+o2+KoBQRwRB7dK2daXSHka1102Dg==
Received: from MWHPR14CA0050.namprd14.prod.outlook.com (2603:10b6:300:81::12)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:23:22 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::db) by MWHPR14CA0050.outlook.office365.com
 (2603:10b6:300:81::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 13:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 13:23:21 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 06:23:21 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 13:23:19 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 3/3] hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices
Date:   Thu, 16 Sep 2021 16:22:54 +0300
Message-ID: <20210916132254.831200-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916132254.831200-1-vadimp@nvidia.com>
References: <20210916132254.831200-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2100c05d-ecfc-47fb-d504-08d9791527a7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39010FC4863ADFB576C4CA16AFDC9@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sgOo+5l8l0W8ozIfXlWJ+P8gV9H8dj9EMzKWM/K2twQok09TNU0Xvzr/5GjjoiSP8Fdqj1bTMfHLgjTupm2YxKvU0mj1ghWWH+Cv7sqh/ioEORFj9NO08nYjjiNa/ZIM8RKdqxv5MzzMwiH4iJVionP+nuDHPv2veSwTbPPSPWWX5IM8rXkpnQTcT72Bn9Z/L8DJk6yiPKXdsS4Vrz68C0tnuLyjS4q+1aSJDLRuS11r6L76NW6GqXh1K3bOsyRLiDFSN7rfjIu4VkKiYaCdEiQdTPeaUBL/ugszqeDEvVcTXfcChpMOuwoTIk7POZ6Vy1Er+kLHv4DjtTxAPxyVXFSW2QPAPRr7EpWiIYCT1eqjB+bmeLOky/xDzmBN1D9QvcMxTwn459w34PtgHwJG354lwCCG0UlliawA96gC49oh+pHYDe5LxHsFilGDJnv79dE5VNSwGY2N0B6xmAsWX861sW49F7Tb/CRsCeTkZq68noSU9p71PK4YFF5zOwFkt3iLcoJGtJ9x37IPNuVX6M2sqhsJHqWRb482wq2iyAuA9AGxYHg+3QJ/lnXLccUEqdwmiBtlaCQjFARcTsFQ5hKsGThfL5hatxI7m0L+EycwnNCMIVLlMu7hAaMzmVcvlcBaDldpwX1v/FWvq+ZXpUG9KJ+qdMjAeAv9ut6i0XK/1q73jJ/AwK6PCmeQcEXxkkpwFDi0LWvj9sTJvUzyuQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(6916009)(7636003)(1076003)(356005)(107886003)(2906002)(4326008)(82740400003)(336012)(186003)(47076005)(36756003)(8936002)(86362001)(16526019)(5660300002)(70206006)(2616005)(70586007)(478600001)(316002)(36860700001)(83380400001)(426003)(26005)(6666004)(8676002)(54906003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:23:21.5221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2100c05d-ecfc-47fb-d504-08d9791527a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for additional cooling devices in order to support the
systems, which can be equipped with up-to four PWM controllers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 80 +++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 930636868ef5..f5968eb4ab78 100644
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
 	bool config = false;
 	u32 regval;
@@ -344,11 +350,11 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		config = true;
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
@@ -366,8 +372,8 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		return -EINVAL;
 
 	/* Normalize the state to the valid speed range. */
-	state = fan->cooling_levels[state];
-	err = regmap_write(fan->regmap, fan->pwm[0].reg,
+	state = pwm->cooling_levels[state];
+	err = regmap_write(fan->regmap, pwm->reg,
 			   MLXREG_FAN_PWM_STATE2DUTY(state));
 	if (err) {
 		dev_err(fan->dev, "Failed to write PWM duty\n");
@@ -539,13 +545,41 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
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
+	int i, j, err;
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
+			err = PTR_ERR(pwm->cdev);
+			goto devm_thermal_of_cooling_device_register_fail;
+		}
+
+		/* Init cooling levels per PWM state. */
+		for (j = 0; j < MLXREG_FAN_SPEED_MIN_LEVEL; j++)
+			pwm->cooling_levels[j] = MLXREG_FAN_SPEED_MIN_LEVEL;
+		for (j = MLXREG_FAN_SPEED_MIN_LEVEL; j <= MLXREG_FAN_MAX_STATE; j++)
+			pwm->cooling_levels[j] = j;
+	}
 
 	return 0;
+devm_thermal_of_cooling_device_register_fail:
+	for (i = i - 1; i >= 0; i--) {
+		if (fan->pwm[i].cdev)
+			thermal_cooling_device_unregister(fan->pwm[i].cdev);
+	}
+	return err;
 }
 
 static int mlxreg_fan_probe(struct platform_device *pdev)
@@ -582,16 +616,10 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
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

