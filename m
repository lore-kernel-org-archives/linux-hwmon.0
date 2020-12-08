Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF78C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 09:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D44223A84
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 09:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgLHJa1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Dec 2020 04:30:27 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60156 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728192AbgLHJa1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Dec 2020 04:30:27 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 8 Dec 2020 11:29:36 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0B89Ta3F026351;
        Tue, 8 Dec 2020 11:29:36 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Add support for fan drawers capability and present registers
Date:   Tue,  8 Dec 2020 11:29:31 +0200
Message-Id: <20201208092931.1074-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
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
 drivers/hwmon/mlxreg-fan.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index ed8d59d4eecb..ab743929a6cd 100644
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
@@ -388,9 +412,11 @@ static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
 static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			     struct mlxreg_core_platform_data *pdata)
 {
+	int tacho_num = 0, regval, regsize, drwr_avail = 0, tacho_avail = 0, i;
 	struct mlxreg_core_data *data = pdata->data;
 	bool configured = false;
-	int tacho_num = 0, i;
+	unsigned long drwrs;
+	u32 bit;
 	int err;
 
 	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
@@ -415,7 +441,9 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 
 			fan->tacho[tacho_num].reg = data->reg;
 			fan->tacho[tacho_num].mask = data->mask;
+			fan->tacho[tacho_num].prsnt = data->reg_prsnt;
 			fan->tacho[tacho_num++].connected = true;
+			tacho_avail++;
 		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
 			if (fan->pwm.connected) {
 				dev_err(fan->dev, "duplicate pwm entry: %s\n",
@@ -453,6 +481,22 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
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
+		regsize = regmap_get_val_bytes(fan->regmap);
+		drwrs = regval;
+		for_each_set_bit(bit, &drwrs, 8 * regsize)
+			drwr_avail++;
+		/* Set the number of tachometers per one drawer. */
+		fan->tachos_per_drwr = tacho_avail / drwr_avail;
+	}
+
 	/* Init cooling levels per PWM state. */
 	for (i = 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
 		fan->cooling_levels[i] = MLXREG_FAN_SPEED_MIN_LEVEL;
-- 
2.11.0

