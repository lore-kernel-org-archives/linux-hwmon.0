Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B980C433C1
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 17:24:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C349C6192D
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 17:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhCVRX2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Mar 2021 13:23:28 -0400
Received: from mail-bn8nam11on2062.outbound.protection.outlook.com ([40.107.236.62]:60000
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231234AbhCVRW4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Mar 2021 13:22:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoWcXwqM2bLNNbACzIdkM7VZ4TWlyeMDXJuuNbM10nyWhM8yD8SbjQYFBvjasU14cYSL8fYk8y2x3rFegWsjOtUoln1DSmeBc0QXXBjZ6K2O1zDawPu045DU6nZO8nqFHiIwWIlMcY7X6GMCQbaHRXnHifpfAwFtSxqg63aRCJgDuSEr5oWEz26UMc9C2wS5luyxzo5r8pkSZdcrPI5sai9ZTnNRVWbO+r2Ju3QaIzb45OTXUlkweItmVx9TtFLZcknjcZ/qpZDGZtTIwNaEdtQ2bD2bGmX2wQ5wzXemiuszTnS4Q42UNXJLfT56J9/6KvytMrbcUCMUPD6Udp3iNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OFy/PiWzpcV9gvxm4hyVKhqoPu/uRqirM4fvuwWSDI=;
 b=WOVtNq8QW/TqsO6DflEmM7qqqyaN0/50myn2MgCtYgo2KviaTHmbw8APPzxoOify31Aqn1Pp+YCK8zjHLV4mEhxBFE2R6InRK6vI43CsfFAE5qau3DHwZP+QMxt7UBX67wJVdsYZOnv6X09Pw9cMHbanyw2PDGABuqqO478nIoim2zsbypIq9GVKN862p6QXIcLQMdWEZTGZuue14dfXxmrxxmK0NVbICIxefedOkLPHzEXGHcBgPdc72l1gssRUGhOrj6AMa2stnfJZKgCWMd0TCFyR5YbwN/8IvkLQDEMh1Y+zwJ+L3BpqQ1Vyi39cL1bBsme+6vu6EiXfxvgMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OFy/PiWzpcV9gvxm4hyVKhqoPu/uRqirM4fvuwWSDI=;
 b=klh1cK12lpsuzSV9xQhn8fVk0txy6CqH9eh64pGPtDNCzWcloJMY7+hyHqkDhh5PevFvZ0cD8VcOhvurbC77QkW0V+ojR2pG1WnjYrMjvE67wG81GDA1zwAJQOc9naka9X0+6ASB3PCFTiAgaAo8gkx6YgXhWL5HkkbRf8zSceAqKbhvIpPGSVBWG58jOaOjddZWcCDR7VDITugyRpu2ga1XVkmWV8hzqpzrU6lniozEdAD7YTtsFR3wkTnPy9iDnL1f7wM+m8xTeHtas6WNSs5imDLX6yJdfuLLZnY+G7lXWqQrTzlkfFkGxywE3jKTJlxsfQVDQsPiLVhutnEhmw==
Received: from DM6PR08CA0028.namprd08.prod.outlook.com (2603:10b6:5:80::41) by
 MN2PR12MB3807.namprd12.prod.outlook.com (2603:10b6:208:16c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 17:22:55 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::2d) by DM6PR08CA0028.outlook.office365.com
 (2603:10b6:5:80::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 17:22:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 17:22:55 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 17:22:53 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v3 1/1] hwmon: (mlxreg-fan) Add support for fan drawers capability and present registers
Date:   Mon, 22 Mar 2021 19:22:37 +0200
Message-ID: <20210322172237.2213584-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16f880f4-9966-42e7-f7e3-08d8ed572179
X-MS-TrafficTypeDiagnostic: MN2PR12MB3807:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38070F30D1AEAF6C09F5D7BAAF659@MN2PR12MB3807.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZWCiw+hULbeIi0W+NzwNJUNrnt7KO4+fNhzVGfYY7t4PxNYYWhjulXtJeUmERd0A2Kair7E+XGdYC8qMhdr3aFrVogmaTdjr9IFICSLo/Ql7vNsjtjSQ0AXuV7/QsrOhhPR/BQG99ZrIskUMEgaCaDoVJtAIJhWpoWz0rzWIRX0kUg552ccrKcIl9knZdM0cDvTMK5+liOOqApFTUVZpOWU+NJFf0kHidsKQgJXMLf0RybMSCzL9vpmt3UmG/WjwssEY/jW4T2R5W66ytqrg8vMMPWQhgJzdbcxWSpfZtyRP49EhS5lEwTSYl3QYTgmfGHNXirSjUKXsYZJ2vnOuVNyOOi1b8Cxxzv05whU7qS92U0KxGQkB+hcxdXGCsU8rCqeZRqqeiXz5tR1/m7sOivEaaceyPj27KJpJvVwMwEIyi6M7f31+bbBwHS3cVuW/9cXt224fry4mc8X5FP0CaidQSi7S+WsXNP53eoli6y2Mnuk3ayBlT0TYM6UUYaHknvh3c+0QpZrNcZ0yNwppX0pwXnYa9CxN1bS4VMXcc/PD7rax5LudqZq6eqFax6M0CpZ2TVjX0Aezu5R70sOX/KiAXewXpoGo0J16m6clS2snHTMW4t+rN5qRyuGSH5zjp1llj4lMTPcur5pwdEK3dsVvrjmYWJrL2bUZokcHVk=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(8936002)(6666004)(7636003)(54906003)(16526019)(2616005)(336012)(6916009)(4326008)(8676002)(36906005)(36756003)(26005)(83380400001)(186003)(107886003)(70586007)(316002)(2906002)(82740400003)(426003)(5660300002)(70206006)(47076005)(82310400003)(86362001)(356005)(478600001)(1076003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 17:22:55.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f880f4-9966-42e7-f7e3-08d8ed572179
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3807
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
v2->v3:
 Comments pointed out by Guenter:
 - Remove unnecessary braces mlxreg_fan_read() (missed in v2).
 - In order to avoid divide by 0 error, validate 'tachos_per_drwr' is
   set prior mapping tachometer to drawer in mlxreg_fan_read().
 - Change 'regval' to unsigned integer in mlxreg_fan_config().
   Move it inside the 'if' statement, where it is used.
 - No need to initialize 'drwr_avail' in mlxreg_fan_config().
   Move it inside the 'if' statement, where it is used.
 - Return error in case number of fan drawers less the number of
   tachometers, since this is not valid.
 Added by Vadim:
 - Fix comment in mlxreg_fan_read().
v1->v2:
 Comments pointed out by Guenter:
 - Simplify drawers number calculation in mlxreg_fan_config().
 - Validate that the number of drawers and tachometers, supported on
   system, both are not zero. Otherwise return error.
 Added by Vadim:
 - Change comment in mlxreg_fan_read() regarding FAN presence - use
   "FAN is inserted" instead of "FAN is physically connected", to
   clarify that "FAN presence" can be changed dynamically.
---
 drivers/hwmon/mlxreg-fan.c | 51 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index ed8d59d4eecb..116681fde33d 100644
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
+			 * if FAN is physically connected, zero - otherwise.
+			 */
+			if (tacho->prsnt && fan->tachos_per_drwr) {
+				err = regmap_read(fan->regmap, tacho->prsnt, &regval);
+				if (err)
+					return err;
+
+				/*
+				 * Map channel to presence bit - drawer can be equipped with
+				 * one or few FANs, while presence is indicated per drawer.
+				 */
+				if (BIT(channel / fan->tachos_per_drwr) & regval) {
+					/* FAN is not connected - return zero for FAN speed. */
+					*val = 0;
+					return 0;
+				}
+			}
+
 			err = regmap_read(fan->regmap, tacho->reg, &regval);
 			if (err)
 				return err;
@@ -389,8 +413,8 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			     struct mlxreg_core_platform_data *pdata)
 {
 	struct mlxreg_core_data *data = pdata->data;
+	int tacho_num = 0, tacho_avail = 0, i;
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
@@ -453,6 +479,29 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 		}
 	}
 
+	if (pdata->capability) {
+		int drwr_avail;
+		u32 regval;
+
+		/* Obtain the number of FAN drawers, supported by system. */
+		err = regmap_read(fan->regmap, pdata->capability, &regval);
+		if (err) {
+			dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
+				pdata->capability);
+			return err;
+		}
+
+		drwr_avail = hweight32(regval);
+		if (!tacho_avail || !drwr_avail || tacho_avail < drwr_avail) {
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

