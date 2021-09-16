Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A12BC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E319560F6C
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234616AbhIPTtI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 15:49:08 -0400
Received: from mail-mw2nam10on2057.outbound.protection.outlook.com ([40.107.94.57]:3553
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234580AbhIPTtI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 15:49:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyckDZhIY3WVrm1ilhbb0sVR8UpQoGHP9ffnonpD+C/kQYKROa1Byad9TRVU39KyPZ/4amB3347AhsFUyr4E4CvA/VignuhWFzLp1fLRQ3iolq7Qu2XRSxkwkbNQRwcVt9GTMspUz7zfFyr3kOltFU4vGYHotL+8/ZXedqk3Aq+oFc6iFVOTxYMeEHmBN/aOHUS1Uct1kC8wSI+QI7pKM0kuItzKuaSoAyjL4ranj8pHQhB1/6icDcZ6qx3C+tdksYDh8TQv140eZgVgYPWg3S6g5aMQpLmujfgzWqX2Lr7vN1/2Z/Tq//lJ8ZCoM0B7ieiZRO0VLDzUQKZdN105ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZBd14Nb0+qO8oshTNkjvLOZYT+IyjcnywDXaIDlP05k=;
 b=EZrN5bMIWVN0t2tyf7mUL08yABCY+cJbh7VaP7EloPM3eeQRgShDatReTwMLk/L2/OK96iFH43sK9yO8G/tQZYLOcyGZzwXtXU+L7v5BhzbkajE060jnibY2G4anxZCs3M35Jm5sR++L9Ta77qJZeHUse29LNK9J6AOJ1oJ5VVPgW/hqBcp3KweliFB13DLitaMESZxqDvt8+KUerFozfXvRWNoc9VELCmZVgOxbp1OjVxHrmkrvPYZ6doXuOOcwVKrPFM+w9nm/7K/fAcd0XgBsPFdB9HWmrxUkc0c8PPw/4NIsZuZ5SCnNQxw8JGNNOiXfA/DSaPGF3BlLxUPNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBd14Nb0+qO8oshTNkjvLOZYT+IyjcnywDXaIDlP05k=;
 b=j8LEpOjVKmqP7lmXbQ4Kn/v9OUcsiVdW9hpQWdGlzW1dUS3bOaU9e+NF+vWQKE5ASoitAX7uGjnBwpvtUvlv7YNJ6Mmb0AyOitBzlnd45bAiHkD4Nernn0AQVG9ckHjRBqK76JgBsnsTNREKaUREF2aWJeZ5tXDqthgBzGbeQI+IhC0CVZ1fBrpoZT+tw3GsHJatkN8VWsvDhqa3vSUPQp9MGddgXUnw0Z2FiFWFddCRYva1YYFkOCQ6rAnNXk5WLulLvZKRChMoDGTivqfkWi5Nv7vcwBeJgEumXLRSLxlS0x04rEr2SYzSlK61Q+AjV7JXBLmUn2b/sxf1yDrA0Q==
Received: from BN6PR11CA0001.namprd11.prod.outlook.com (2603:10b6:405:2::11)
 by SN6PR12MB2669.namprd12.prod.outlook.com (2603:10b6:805:70::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 19:47:45 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::21) by BN6PR11CA0001.outlook.office365.com
 (2603:10b6:405:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 19:47:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 19:47:45 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 19:47:44 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 19:47:42 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 3/3] hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices
Date:   Thu, 16 Sep 2021 22:47:19 +0300
Message-ID: <20210916194719.871413-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916194719.871413-1-vadimp@nvidia.com>
References: <20210916194719.871413-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e6cdb92-b78a-459c-9f63-08d9794adac0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2669:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26691421C67F85A7AD11205EAFDC9@SN6PR12MB2669.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0U+/M+4Q6rMSe61qCXPOkRXKbpzE+ahVP3rDp+Vq3cJnJ9FDKjZ9hcoUnV7BsC4mhJslPjd7W9qQSu4hw1p4R4EBRW5DDOLVoMuS78wClNwdkX33cb2N6zAnaK2cMxBRAbJ694/l0LJ+IurqIgikfNtq5SSguV7tEmbgZL4eix4bbEOu/wKRPxSfuloSOx2L8pOZtB9soBuCNowqDj1cBXIl0yEq5yQKjcoUy5hff81rzWWBYCAfp0HtrBdeVgrInmMXhpATxOcdac0keRMAOsDtx8D6lnlRgbbEKe0TmWWznDuJtb9TJTpLoZbZK1HvEvyFUs9L0cbrQcnMBB5sNfQfhVrS7qU22JErG6iS0O2NQ+J15BA5f1s4BTWyqmYGpT1xU3ouDQRcmm3I81kFQPjQh0fqD6ZlQZ9eaBijGBPepG7qlzD8wfixJiiV+5qltyhSdqTorfPdkeBV6NmM9rq6A56E5tbiTajvlhlQsb5EfPUCf9NkpKkARJ1hBJqTL6yU4zZjSSDnAAYJauM0PYP/wNYyEosXCf6ei0jupCJAf0RWwsUhgjYv/xzogvaThicbEAXWdRxiJbAI8/LPqy6GY3itpzYP+/qB0SPV0Vs3wV90s6MNMB1oxR66YDCseCSMBNkpQakl4QUUOdh8TuqESAkIVGLDJ18cFKJ3/vRiS752OPxDoTYozEpNAIfnm4jxyFlm/WY3287//ftEA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(82310400003)(6666004)(86362001)(47076005)(26005)(5660300002)(36860700001)(54906003)(4326008)(1076003)(2906002)(316002)(107886003)(7636003)(6916009)(36756003)(16526019)(186003)(336012)(356005)(70206006)(426003)(70586007)(83380400001)(8676002)(2616005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 19:47:45.2584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6cdb92-b78a-459c-9f63-08d9794adac0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2669
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for additional cooling devices in order to support the
systems, which can be equipped with up-to four PWM controllers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v0->v2:
 Comments pointed out by Guenter:
 - Drop call to thermal_cooling_device_unregister() in error flow,
   devices registered by devm_thermal_of_cooling_device_register()
   should be cleaned automatically.
---
 drivers/hwmon/mlxreg-fan.c | 76 +++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 1a146cc4b0fd..566bee333c3c 100644
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
@@ -541,13 +547,37 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
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
+	return err;
 }
 
 static int mlxreg_fan_probe(struct platform_device *pdev)
@@ -584,16 +614,10 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
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

