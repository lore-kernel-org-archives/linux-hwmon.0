Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D83C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DABFC60F26
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 13:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240103AbhIPNYm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:24:42 -0400
Received: from mail-dm6nam10on2073.outbound.protection.outlook.com ([40.107.93.73]:45920
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240099AbhIPNYm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 09:24:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEtwH0s10F3h9sWvfg7i8rEjXDy+6VwbGExJtg84D9PHc0U6pK35ThYEhFDYvpQP834cwxqcr+doZFmXFv5kkzDmCFAJsE1aRLeaynZDWGQM0ro1NuiPwThMkCuw+W4hcdd3iObnr3fHiJ3J4OW+of6YQMEnY98Gm2y8XxWIVji2v007PoSqvlbjMko/7eWLY/PAOgpvEblWAJ0VHY9UGTnY7ndYd1Pem1jCuZr0snoPAPUwx8w3uOtMarBhZ94hiRUeKDiz7ZwGMOPCAFLRk7b0eIRKf5lj0EdFqEZ5waVrAmKqjBG2k39g2xlUqDcYc6OgcfWXTAs8BDbXfa5kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/22SkahqPV+un48E7MyrpwIinoY3ERT4ULlk+zJLYO4=;
 b=M35DYKLyHPgOTWGjrQwvGdKRuVSmgrAfgyLvwUv6tIcPVqitsBBJ/Q+lpodiDGBi9rWkUWn3sUoAd31K08vmuHee9KzW3RKHkuU6NzvGwvnrJe7Wz/NL3mEJQkQeV+6l/KoyKPXIKVSY7wF5h9MRe6HE16wnwlzfinMFXMDuxAfSNRtAK5Ez2VNLx5RfXEksmeeGJt/hlRZRywYGV8MlxE44+/mwXOPgN8mkswxTRogAvjKSBuvfEHjOfeVDYbxR7uXLrJTKjh0FE50vt2usgUIvujaxER4oO50olZjCSrAyG62kXWUbfsnivr/rBpuEgPkt6ZzKuZWzsUm8KApzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/22SkahqPV+un48E7MyrpwIinoY3ERT4ULlk+zJLYO4=;
 b=HKtBMtodzRajnmzn4KpsB5b6H6SHJjAiFKqZsjBmAICTReASN/d2s8kU6Rd0RIgvA1r6NdhNE/rl5eE3VpPNCmxuLyNDi3UwrK8T7HpGWrkR/0GugspMr23eN5jR0fXQkmK4aEncczFT66mfGdb/muWs0Q0CXTCLnWdIl5ne/TsRfhSELRxvyQ5xvvPWKM/w2wItYejbaVV62iYM9wvQ4ASOlQJpU9lGF2MARqNlI8/4NFcyPCT7zua3PkrNs5OpLKvpJinO4MEgbPA5eyZFqLmDkQNwZPCey/Ee6qv+ShcpBWMpyHLfQ3mVRDDeS3AxIod7MeD8yn3TDiFfd+ar+g==
Received: from CO1PR15CA0107.namprd15.prod.outlook.com (2603:10b6:101:21::27)
 by MN2PR12MB4063.namprd12.prod.outlook.com (2603:10b6:208:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:23:20 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::e6) by CO1PR15CA0107.outlook.office365.com
 (2603:10b6:101:21::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 13:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 13:23:20 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 13:23:19 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 13:23:17 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 2/3] hwmon: (mlxreg-fan) Extend driver to support multiply PWM
Date:   Thu, 16 Sep 2021 16:22:53 +0300
Message-ID: <20210916132254.831200-3-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4ca4b844-d641-4318-a8c4-08d9791526d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4063:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40634315BBD3AA6AEFF8126DAFDC9@MN2PR12MB4063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAJxVpHB0/p+qZsQEKf7kBGSN6mzlvFp/0lc35qjg9b+l95d+PYsXPcJQHQWBxyx0sX6g1p+8tStPKZGF7u9T0gRvPqt2z/GInMS3f7ZQffxbdD6xccNQTquYsgXoOWH7gpOgAxqyRtvHxw7GoI2CFaVgKLnE0T1N78lvdC+lZyNDjp65PNfHgwVST0Mz7F1ZG9Spza7Q/7C/3HIx7oibZ7MY0K0tPmsvEknN6pRQZAau4zzmFJlfHMb8CnoN3MklVBZRp2qBvkCaN16HAnTmKuc3JlqTQJsKqJs0eYG7Sg0I3r4u3V53c+rMFJTpVgtk8Mwuhb0j5CcGfjXphAeo4/uQcw8ttwYi8sCHjNwTNrMct3NV3+rDe8vHOy6zqEZ8EGtmAE63y0OKpqLSFMuNG2U0fjHiquJctaEwBY1ilps9GkSacqRNavb/v0NALO6hn9BO3flnQNeT0+xGpLaber5Ww3Kaa46tBD2SXTPLQ16G2/XUPWgl8xN4TRhtnUy/XYbhV5FolPUNZfhdQhrl82XMXVwCaAJ6FneCWwKIcDZwYyN4M0FQUu3LFxPJgUTIFb/BpuMLc1aCWgaM4KZ+hsNq/IRksQwLQAU/3rQbuQ9r5dskh7UZSexwc5MkKKVzyIVsMA157NZjhNhBVgL0Dqpzm6YbcAVeBk35UjsivV+WDrjeXGIi+ZnZAV/QibqlbytjkFruAsiIxpWwH81jg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(186003)(8676002)(2616005)(36756003)(16526019)(1076003)(6666004)(7636003)(2906002)(356005)(6916009)(36906005)(316002)(83380400001)(4326008)(5660300002)(86362001)(478600001)(8936002)(107886003)(82740400003)(54906003)(36860700001)(47076005)(336012)(82310400003)(26005)(70586007)(426003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:23:20.1428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca4b844-d641-4318-a8c4-08d9791526d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4063
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add additional PWM attributes in order to support the systems, which
can be equipped with up-to four PWM controllers. System capability of
additional PWM support is validated through the reading of relevant
registers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/hwmon/mlxreg-fan.c | 55 +++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 6e6c7437db94..930636868ef5 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -13,6 +13,8 @@
 #include <linux/thermal.h>
 
 #define MLXREG_FAN_MAX_TACHO		14
+#define MLXREG_FAN_MAX_PWM		4
+#define MLXREG_FAN_PWM_NOT_CONNECTED	0xff
 #define MLXREG_FAN_MAX_STATE		10
 #define MLXREG_FAN_MIN_DUTY		51	/* 20% */
 #define MLXREG_FAN_MAX_DUTY		255	/* 100% */
@@ -105,7 +107,7 @@ struct mlxreg_fan {
 	void *regmap;
 	struct mlxreg_core_platform_data *pdata;
 	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
-	struct mlxreg_fan_pwm pwm;
+	struct mlxreg_fan_pwm pwm[MLXREG_FAN_MAX_PWM];
 	int tachos_per_drwr;
 	int samples;
 	int divider;
@@ -119,6 +121,7 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct mlxreg_fan *fan = dev_get_drvdata(dev);
 	struct mlxreg_fan_tacho *tacho;
+	struct mlxreg_fan_pwm *pwm;
 	u32 regval;
 	int err;
 
@@ -169,9 +172,10 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 
 	case hwmon_pwm:
+		pwm = &fan->pwm[channel];
 		switch (attr) {
 		case hwmon_pwm_input:
-			err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
+			err = regmap_read(fan->regmap, pwm->reg, &regval);
 			if (err)
 				return err;
 
@@ -195,6 +199,7 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		 int channel, long val)
 {
 	struct mlxreg_fan *fan = dev_get_drvdata(dev);
+	struct mlxreg_fan_pwm *pwm;
 
 	switch (type) {
 	case hwmon_pwm:
@@ -203,7 +208,8 @@ mlxreg_fan_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (val < MLXREG_FAN_MIN_DUTY ||
 			    val > MLXREG_FAN_MAX_DUTY)
 				return -EINVAL;
-			return regmap_write(fan->regmap, fan->pwm.reg, val);
+			pwm = &fan->pwm[channel];
+			return regmap_write(fan->regmap, pwm->reg, val);
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -235,7 +241,7 @@ mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
 		break;
 
 	case hwmon_pwm:
-		if (!(((struct mlxreg_fan *)data)->pwm.connected))
+		if (!(((struct mlxreg_fan *)data)->pwm[channel].connected))
 			return 0;
 
 		switch (attr) {
@@ -270,6 +276,9 @@ static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT),
 	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
 			   HWMON_PWM_INPUT),
 	NULL
 };
@@ -300,7 +309,7 @@ static int mlxreg_fan_get_cur_state(struct thermal_cooling_device *cdev,
 	u32 regval;
 	int err;
 
-	err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
+	err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
 	if (err) {
 		dev_err(fan->dev, "Failed to query PWM duty\n");
 		return err;
@@ -339,7 +348,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
 			fan->cooling_levels[i] = i;
 
-		err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
+		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
 		if (err) {
 			dev_err(fan->dev, "Failed to query PWM duty\n");
 			return err;
@@ -358,7 +367,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 
 	/* Normalize the state to the valid speed range. */
 	state = fan->cooling_levels[state];
-	err = regmap_write(fan->regmap, fan->pwm.reg,
+	err = regmap_write(fan->regmap, fan->pwm[0].reg,
 			   MLXREG_FAN_PWM_STATE2DUTY(state));
 	if (err) {
 		dev_err(fan->dev, "Failed to write PWM duty\n");
@@ -390,6 +399,22 @@ static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
 	return !!(regval & data->bit);
 }
 
+static int mlxreg_pwm_connect_verify(struct mlxreg_fan *fan,
+				     struct mlxreg_core_data *data)
+{
+	u32 regval;
+	int err;
+
+	err = regmap_read(fan->regmap, data->reg, &regval);
+	if (err) {
+		dev_err(fan->dev, "Failed to query pwm register 0x%08x\n",
+			data->reg);
+		return err;
+	}
+
+	return regval != MLXREG_FAN_PWM_NOT_CONNECTED;
+}
+
 static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
 					struct mlxreg_core_data *data)
 {
@@ -418,8 +443,8 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
 static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			     struct mlxreg_core_platform_data *pdata)
 {
+	int tacho_num = 0, tacho_avail = 0, pwm_num = 0, pwm_avail = 0, i;
 	struct mlxreg_core_data *data = pdata->data;
-	int tacho_num = 0, tacho_avail = 0, i;
 	bool configured = false;
 	int err;
 
@@ -449,13 +474,19 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			fan->tacho[tacho_num++].connected = true;
 			tacho_avail++;
 		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
-			if (fan->pwm.connected) {
-				dev_err(fan->dev, "duplicate pwm entry: %s\n",
+			if (pwm_num == MLXREG_FAN_MAX_TACHO) {
+				dev_err(fan->dev, "too many pwm entries: %s\n",
 					data->label);
 				return -EINVAL;
 			}
-			fan->pwm.reg = data->reg;
-			fan->pwm.connected = true;
+
+			err = mlxreg_pwm_connect_verify(fan, data);
+			if (err)
+				return err;
+
+			fan->pwm[pwm_num].reg = data->reg;
+			fan->pwm[pwm_num].connected = true;
+			pwm_avail++;
 		} else if (strnstr(data->label, "conf", sizeof(data->label))) {
 			if (configured) {
 				dev_err(fan->dev, "duplicate conf entry: %s\n",
-- 
2.20.1

