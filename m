Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A875C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 545CB60F6C
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 19:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbhIPTtG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 15:49:06 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com ([40.107.236.40]:15072
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234616AbhIPTtF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 15:49:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RElUaLr1JFUkYbB3IRuZ2dGYekzPetPOUV9yUAUmo0c+olViqVijEQ2sCLlYEuIaEQDSVKl98HFOwCvvaA7Zkl1fbTokWVF6Zsq5grEiPTAJF49Xb5V4qMVgwHDli2GjJ9S0Tpgjc4S3WD573dIc4tAQgkDl2Y+Y9mQJJzOgoMg1gfj7nx9EXbREukCJiSsn7z5R19gcsj5koSXTOoMzMvUZyFkb8XXL+fArBwkEySyDLUZpGGvUg/yM95dUt4dQLuP+tbVnmfV5weVrDfUIDfv4mniTUGFikILtBQ+BtnOu4Wibicu7Y3MG8xNexRvdN/5RSLQKdLs2EkZJwz6QHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CrUwt4baDZoKgOyC3vYhLkxIyiqJSpoDgMzpNhoxPaM=;
 b=ElYNqmDjmhHkG2eP78323t3+sDlHS4D21qGhCubOmIAO9RafiNWI9UlN87MdGRKeR7QYuDciHdA7D1vDjgL9CXVmojdnhc13u+9SlQ/ppZrIC0TSUk0NUn3T06gwcuftzonOylq3t2aes8DtYAIOYsTbYRqjhQXa4y7Icl4VaUBfQ3DGXmej226McLWMyBmUoYGMyMl/aUC5Od4i/ENhO9xMtXLpZWbU+Z04lWAJhL9+j9i7iwpYWzDUX26KYGMwimmrevHoJbM2N+2+mN83RslMxOy9wsht6AlLwE+8wkeBkQl9pdUSvnHHRVk468B0Yk1cBJ9kyKVD41uym9SxmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrUwt4baDZoKgOyC3vYhLkxIyiqJSpoDgMzpNhoxPaM=;
 b=mk11Ln4kCUc6a3mnc7DlaJUNAcI6nc22eXUUNi9x/UdUfZZjHgDGUi6Ml1PA88T/DJ4aD3TmagkChEN+PsdVWUBGLKJGjlPB9dN9ydLd3Z+UjqWQ02uQlgsxFZUxD4H8qB6cEgypH5bIN7Pi5nt7iKqV1/j2ooIoYh+999L/iyWZtca+lRf9zwlLa6ptrfQKnC4ZoNj0NTosIyNax+IztRkWcq4G3XBFIXHrdwGpQ2d4kxIZQKAWBM76zqUeV29xYKC98+tiit8iyGPg1zc2Yv/fEFgtJYXihiBRMnCNir468Wht3qDsnOSu6kzd0v5C6qiu5rXrbcbUGrmX7JME+w==
Received: from BN9P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::12)
 by BY5PR12MB4917.namprd12.prod.outlook.com (2603:10b6:a03:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 19:47:43 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::bf) by BN9P222CA0007.outlook.office365.com
 (2603:10b6:408:10c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 19:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 19:47:42 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep
 2021 12:47:41 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Thu, 16 Sep 2021 19:47:40 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 2/3] hwmon: (mlxreg-fan) Extend driver to support multiply PWM
Date:   Thu, 16 Sep 2021 22:47:18 +0300
Message-ID: <20210916194719.871413-3-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: a717cc9a-482c-431a-b252-08d9794ad955
X-MS-TrafficTypeDiagnostic: BY5PR12MB4917:
X-Microsoft-Antispam-PRVS: <BY5PR12MB491778DE034CE931F36CFB83AFDC9@BY5PR12MB4917.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1vASturAcvPOECgFusFJwAEPUQey/bFISr+9ROHXdywOe5fE9tU/711mJl6J7RqoyIAfC38sTR1upM6GuWWORTgH3VZ7eNvkb1EOVRPkI5ffEUEw0FNExz+sOSRTWiwYsz/n1BTz3sskb7GIvNBFuRw/NlpbFeupQxcC2RBi4EP0u5HHjm2X0Prl7054iEaDyVkuIdjHKEe3qocPxDFl88nVTSRNIYC9XVSAUDoB+hHgKC+9KSFksa+OtJKlFTD9GYJpzPl9lRvsUsDv7WOFQRmu0hBxAdjPaKAAxP0SJFHz714GRY5+HhU9i6ZU2771H5+CLAp3vIS7+97mmnZ6lz8CjEjQuVAoVFzWgSS2gFbxQZChgQnFdY5CxTsDywPMbr2eyyUGpUCx5hEDR4H3nk/6PXe1qPEghoBclU89mnqqPGbBHALQ1Ukrvv1vwIyUWOTpqjKXbc3n+gA97eSv5zaZ4oOEmhm0RhfM94ROCRKc3lgO7ng1vNohpkW2f5GJyozVaER/2ZTLsW6PEhC3vkygMghPr4ln9hFSkEU6wBT61sHcok+rXVlAq0TkaA6318ndb2qOkgIdh4IaGZaWB6PS8BPHQdB+fa2215loO1ELE78B6MS57Nx7hC0dO1Uk3BRQEnsPk3EDTe8BNyntOArwhKbzp9iWYx6GghOi0GIvbmNRAkAa1J6W2v184fmhIREIWqLifYxOgI5/mYWXQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(46966006)(8936002)(6666004)(2906002)(6916009)(70586007)(70206006)(83380400001)(1076003)(356005)(82740400003)(26005)(16526019)(186003)(7636003)(36756003)(47076005)(316002)(36860700001)(478600001)(86362001)(4326008)(8676002)(336012)(5660300002)(2616005)(426003)(54906003)(82310400003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 19:47:42.8799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a717cc9a-482c-431a-b252-08d9794ad955
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4917
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add additional PWM attributes in order to support the systems, which
can be equipped with up-to four PWM controllers. System capability of
additional PWM support is validated through the reading of relevant
registers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v0->v2:
 Comments pointed out by Guenter:
 - Fix handling of PWM counter, increment 'pwm_num', drop 'pwm_avail'.
---
 drivers/hwmon/mlxreg-fan.c | 55 +++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 0f5b109817a7..1a146cc4b0fd 100644
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
@@ -343,7 +352,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 		for (i = state; i <= MLXREG_FAN_MAX_STATE; i++)
 			fan->cooling_levels[i] = i;
 
-		err = regmap_read(fan->regmap, fan->pwm.reg, &regval);
+		err = regmap_read(fan->regmap, fan->pwm[0].reg, &regval);
 		if (err) {
 			dev_err(fan->dev, "Failed to query PWM duty\n");
 			return err;
@@ -361,7 +370,7 @@ static int mlxreg_fan_set_cur_state(struct thermal_cooling_device *cdev,
 
 	/* Normalize the state to the valid speed range. */
 	state = fan->cooling_levels[state];
-	err = regmap_write(fan->regmap, fan->pwm.reg,
+	err = regmap_write(fan->regmap, fan->pwm[0].reg,
 			   MLXREG_FAN_PWM_STATE2DUTY(state));
 	if (err) {
 		dev_err(fan->dev, "Failed to write PWM duty\n");
@@ -392,6 +401,22 @@ static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
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
@@ -420,8 +445,8 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
 static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			     struct mlxreg_core_platform_data *pdata)
 {
+	int tacho_num = 0, tacho_avail = 0, pwm_num = 0, i;
 	struct mlxreg_core_data *data = pdata->data;
-	int tacho_num = 0, tacho_avail = 0, i;
 	bool configured = false;
 	int err;
 
@@ -451,13 +476,19 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
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
+			pwm_num++;
 		} else if (strnstr(data->label, "conf", sizeof(data->label))) {
 			if (configured) {
 				dev_err(fan->dev, "duplicate conf entry: %s\n",
-- 
2.20.1

