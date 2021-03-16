Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4942AC433DB
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 12:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B33865048
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 12:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237566AbhCPMDV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Mar 2021 08:03:21 -0400
Received: from mail-dm6nam12on2055.outbound.protection.outlook.com ([40.107.243.55]:27448
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232328AbhCPMC7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Mar 2021 08:02:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crwhOtbirzih1SxDhMfGLyPRsf3D0QtVBxcmxvWbpG7ry5OjL1tkbnuFkkfUI1oAPC5RAEykdE6Kyx4x3OBjGqyk2ftDuVlhqM59S+IwPpyt0O0Y331JUW1EdazZ2NwUGtysVWPyStbO2uqeJxgIXuQUvBv2pxv70EJAR0h7O9uA4moiSSzTPfQ+3syA5dZo7oe8HTTVuj8619/wSyBV39PWuUrdikeiRyktmqjfiJdStBkZFIkG67pHCp9/R82cIHMby4/Pk6kHqpoAkeMxdyqtTF4lONCDyXeVveTzW+XFuBG1zqkr7EftOjys1MyE4mVN5EGQOuGdgQoa3yJB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZOsSF7CQmoWn2XWJZQi6wkMB9dejZdN08BK46KA8+c=;
 b=ZUGh4/ZCBPu1Sbld+DJ9S5ULqGSSKXWK65udNXIwFYpHxiFU0COda/QPxawvgBKnjYBcj+kcs7DWx0gKWcaNigcM85+xZU/NIiTRP7gcvFr4t/3xTQN99kHaI6G/H2C1k/d8bKFyFw4jVc3L9nrzLsTlUZOTJC0CDtMinesicFRPt4rUJsFXQszKz4Bartq3vN1PdYSMIj5FmGWHaCJlCGaLUg3e5cgXVl2qDaIObDrkgDPVCx0wFCieSZqro0MF6UE+ALFutRypugATCpcGAf2f50JJdp+EBsKLs3gOVO7s5i9q42bUzPVM0E5rx8NgKb9Yn8n2H/b9J3tIgmWz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZOsSF7CQmoWn2XWJZQi6wkMB9dejZdN08BK46KA8+c=;
 b=jGIK6tAlsxHl76YEJeTxtuil/zuNPoPb/GUGQkzUZIKe0nWoAkaGDyjsUGjU0li2pY9odBYMlj4+cNdyhYQ9Yu+h4TyTEg1wj2owe8NH1x5blBZ+Q5j58ibhN1GUKssBCvQa+mlAZkLm+2vDcMFQHVsLioH11Vo8pDJbLcffFpaeFzzh7nJkYUG/5K2VQCw2Bye3+C3VISDzfWeYlL9Z+4oeDKiX7+Bq7eXhL2yQML7BxHA0OxVKP+K81RSdrtHgKm3zUEl4fqOwU34V7xYq5+TI4DNLyoeMJ3hgEUQLOV1AWYpEU0jJBLBhtFiVd0aGRNPAAc30Ogb73ySt+vYwBQ==
Received: from MWHPR1401CA0013.namprd14.prod.outlook.com
 (2603:10b6:301:4b::23) by BL1PR12MB5111.namprd12.prod.outlook.com
 (2603:10b6:208:31b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 12:02:57 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::7e) by MWHPR1401CA0013.outlook.office365.com
 (2603:10b6:301:4b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Tue, 16 Mar 2021 12:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 12:02:56 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 12:02:55 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add support for fan drawers capability and present registers
Date:   Tue, 16 Mar 2021 14:02:39 +0200
Message-ID: <20210316120239.1834485-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d446ba-9411-4627-5bbe-08d8e8736fed
X-MS-TrafficTypeDiagnostic: BL1PR12MB5111:
X-Microsoft-Antispam-PRVS: <BL1PR12MB511149B16E581A26E5BAFCEAAF6B9@BL1PR12MB5111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrbCi2V9qYjNZeBwuKkICZMCZMhqI3OJSSpd3bmXAGM7uM14ru4Yobc6+9rerZN4IqxzwekbGRG2TVBMRtN9qwAedu08UxHszkQj+/SZKwXsDJzipAMcWjqmiqqSYEQl5uw/uc8tVKzeC+5nUKkppU5J+U+VtCbj4XeVWmuLbDY9Fi2KPo0xPjbJOhTGtzu5pybBEJezZD18XhvRGAtE6q6MzUiNUy6YM3sBlDQxQVZJ7VjIN9OsbcTsC7m7OSkoSlSpIvpcZSDYDiyL3BztoFz78fghsYGrokBDIpzQ86LGP0AdcZFlr5IqOT68V1CQnFP11oEvx4BaFaIK/xTs5vbQflV5Y44l7Jcft5nLQRccttYjhj5skBKgw8XuRnfQFVGzBerZUv25+PcIktnf/stQGTWYPhKoSuxo1WxFpikqj7Pqrdz/ymbsx1t08k1U8Ma800Y+YGOiJ1+SU6prHcEhzUmVfZXW0d/9IBQ9hy85nPWSMtijg2UwkvMwY1M4+8NYq7hGNM3W0FDl2PWqw66SYbDuPMskp8p3qgayVVpa2hI4+mUe66mUCSiMWXtypvjoQnfJC98iACZ8OvaJ65B53emZUU4VqGhr9BqS6qFEMe31nHlzRVZ7R74qus6YuVeD4+J9iaUtTUVVfDyFLXWcFZMUnKkCaGu224Qw7k29c6WmJvTtSy6mjX1Ivlea
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(6916009)(478600001)(16526019)(26005)(6666004)(1076003)(426003)(2616005)(36756003)(186003)(54906003)(82740400003)(70586007)(107886003)(336012)(36860700001)(316002)(4326008)(5660300002)(356005)(8676002)(7636003)(34020700004)(2906002)(70206006)(47076005)(82310400003)(8936002)(36906005)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 12:02:56.6966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d446ba-9411-4627-5bbe-08d8e8736fed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5111
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for fan drawer's capability and present registers in order
to set mapping between the fan drawers and tachometers. Some systems
are equipped with fan drawers with one tachometer inside. Others with
fan drawers with several tachometers inside. Using present register
along with tachometer-to-drawer mapping allows to skip reading missed
tachometers and expose input for them as zero, instead of exposing
fault code returned by hardware.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2:
 Comments pointed out by Guenter:
 - Simplify drawers number calculation in mlxreg_fan_config().
 - Validate that the number of drawers and tachometers, supported on
   system, both are not zero. Otherwise return error.
 Added by Vadim:
 - Change comment in mlxreg_fan_read() regarding FAN presence - use
   "FAN is inserted" instead of "FAN is physically connected", t
   clarify that "FAN presence" can be changed dynamically.
---
 drivers/hwmon/mlxreg-fan.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index ed8d59d4eecb..8a69044140a6 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -67,11 +67,13 @@
  * @connected: indicates if tachometer is connected;
  * @reg: register offset;
  * @mask: fault mask;
+ * @prsnt: present register offset;
  */
 struct mlxreg_fan_tacho {
 	bool connected;
 	u32 reg;
 	u32 mask;
+	u32 prsnt;
 };
 
 /*
@@ -92,6 +94,7 @@ struct mlxreg_fan_pwm {
  * @regmap: register map of parent device;
  * @tacho: tachometer data;
  * @pwm: PWM data;
+ * @tachos_per_drwr - number of tachometers per drawer;
  * @samples: minimum allowed samples per pulse;
  * @divider: divider value for tachometer RPM calculation;
  * @cooling: cooling device levels;
@@ -103,6 +106,7 @@ struct mlxreg_fan {
 	struct mlxreg_core_platform_data *pdata;
 	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
 	struct mlxreg_fan_pwm pwm;
+	int tachos_per_drwr;
 	int samples;
 	int divider;
 	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1];
@@ -123,6 +127,26 @@ mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		tacho = &fan->tacho[channel];
 		switch (attr) {
 		case hwmon_fan_input:
+			/*
+			 * Check FAN presence: FAN related bit in presence register is one,
+			 * if FAN is not physically connected, zero - otherwise.
+			 */
+			if (tacho->prsnt) {
+				err = regmap_read(fan->regmap, tacho->prsnt, &regval);
+				if (err)
+					return err;
+
+				/*
+				 * Map channel to presence bit - drawer can be equipped with
+				 * one or few FANs, while presence is indicated per drawer.
+				 */
+				if ((BIT(channel / fan->tachos_per_drwr) & regval)) {
+					/* FAN is not connected - return zero for FAN speed. */
+					*val = 0;
+					return 0;
+				}
+			}
+
 			err = regmap_read(fan->regmap, tacho->reg, &regval);
 			if (err)
 				return err;
@@ -388,9 +412,9 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
 static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			     struct mlxreg_core_platform_data *pdata)
 {
+	int tacho_num = 0, regval, drwr_avail = 0, tacho_avail = 0, i;
 	struct mlxreg_core_data *data = pdata->data;
 	bool configured = false;
-	int tacho_num = 0, i;
 	int err;
 
 	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
@@ -415,7 +439,9 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 
 			fan->tacho[tacho_num].reg = data->reg;
 			fan->tacho[tacho_num].mask = data->mask;
+			fan->tacho[tacho_num].prsnt = data->reg_prsnt;
 			fan->tacho[tacho_num++].connected = true;
+			tacho_avail++;
 		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
 			if (fan->pwm.connected) {
 				dev_err(fan->dev, "duplicate pwm entry: %s\n",
@@ -453,6 +479,26 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 		}
 	}
 
+	if (pdata->capability) {
+		/* Obtain the number of FAN drawers, supported by system. */
+		err = regmap_read(fan->regmap, pdata->capability, &regval);
+		if (err) {
+			dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
+				pdata->capability);
+			return err;
+		}
+
+		drwr_avail = hweight32(regval);
+		if (!tacho_avail || !drwr_avail) {
+			dev_err(fan->dev, "Configuration is invalid: drawers num %d tachos num %d\n",
+				drwr_avail, tacho_avail);
+			return -EINVAL;
+		}
+
+		/* Set the number of tachometers per one drawer. */
+		fan->tachos_per_drwr = tacho_avail / drwr_avail;
+	}
+
 	/* Init cooling levels per PWM state. */
 	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
 		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
-- 
2.11.0

