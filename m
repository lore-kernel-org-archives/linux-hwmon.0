Return-Path: <SRS0=f3EG=RV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7748C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 16:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1C4520863
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 16:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfCRQLy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Mar 2019 12:11:54 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50549 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726663AbfCRQLy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Mar 2019 12:11:54 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 18 Mar 2019 18:10:30 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x2IGAULp017069;
        Mon, 18 Mar 2019 18:10:30 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v2 hwmon-next] hwmon: (mlxreg-fan) Add support for fan capability registers
Date:   Mon, 18 Mar 2019 16:10:28 +0000
Message-Id: <20190318161028.29868-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for fan capability registers in order to distinct between
the systems which have minor fan configuration differences. This
reduces the amount of code used to describe such systems.
The capability registers provides system specific information about the
number of physically connected tachometers and system specific fan
speed scale parameter.
For example one system can be equipped with twelve fan tachometers,
while the other with for example, eight or six. Or one system should
use default fan speed divider value, while the other has a scale
parameter defined in hardware, which should be used for divider
setting.
Reading this information from the capability registers allows to use the
same fan structure for the systems with the such differences.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
 Comments pointed out by Guenter:
 - Make the defines names shorter to fit into 80 symbols.
 - Simplify mlxreg_fan_connect_verify().
 - Make more clear comment in mlxreg_fan_speed_divider_get().
---
 drivers/hwmon/mlxreg-fan.c | 73 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index db8c6de0b6a0..44d4b1af1550 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -27,7 +27,9 @@
 #define MLXREG_FAN_SPEED_MAX			(MLXREG_FAN_MAX_STATE * 2)
 #define MLXREG_FAN_SPEED_MIN_LEVEL		2	/* 20 percent */
 #define MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF	44
-#define MLXREG_FAN_TACHO_DIVIDER_DEF		1132
+#define MLXREG_FAN_TACHO_DIV_MIN		283
+#define MLXREG_FAN_TACHO_DIV_DEF		(MLXREG_FAN_TACHO_DIV_MIN * 4)
+#define MLXREG_FAN_TACHO_DIV_SCALE_MAX	64
 /*
  * FAN datasheet defines the formula for RPM calculations as RPM = 15/t-high.
  * The logic in a programmable device measures the time t-high by sampling the
@@ -360,15 +362,57 @@ static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
 	.set_cur_state	= mlxreg_fan_set_cur_state,
 };
 
+static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
+				     struct mlxreg_core_data *data)
+{
+	u32 regval;
+	int err;
+
+	err = regmap_read(fan->regmap, data->capability, &regval);
+	if (err) {
+		dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
+			data->capability);
+		return err;
+	}
+
+	return !!(regval & data->bit);
+}
+
+static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
+					struct mlxreg_core_data *data)
+{
+	u32 regval;
+	int err;
+
+	err = regmap_read(fan->regmap, data->capability, &regval);
+	if (err) {
+		dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
+			data->capability);
+		return err;
+	}
+
+	/*
+	 * Set divider value according to the capability register, in case it
+	 * contains valid value. Otherwise use default value. The purpose of
+	 * this validation is to protect against the old hardware, in which
+	 * this register can return zero.
+	 */
+	if (regval > 0 && regval <= MLXREG_FAN_TACHO_DIV_SCALE_MAX)
+		fan->divider = regval * MLXREG_FAN_TACHO_DIV_MIN;
+
+	return 0;
+}
+
 static int mlxreg_fan_config(struct mlxreg_fan *fan,
 			     struct mlxreg_core_platform_data *pdata)
 {
 	struct mlxreg_core_data *data = pdata->data;
 	bool configured = false;
 	int tacho_num = 0, i;
+	int err;
 
 	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
-	fan->divider = MLXREG_FAN_TACHO_DIVIDER_DEF;
+	fan->divider = MLXREG_FAN_TACHO_DIV_DEF;
 	for (i = 0; i < pdata->counter; i++, data++) {
 		if (strnstr(data->label, "tacho", sizeof(data->label))) {
 			if (tacho_num == MLXREG_FAN_MAX_TACHO) {
@@ -376,6 +420,17 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 					data->label);
 				return -EINVAL;
 			}
+
+			if (data->capability) {
+				err = mlxreg_fan_connect_verify(fan, data);
+				if (err < 0)
+					return err;
+				else if (!err) {
+					tacho_num++;
+					continue;
+				}
+			}
+
 			fan->tacho[tacho_num].reg = data->reg;
 			fan->tacho[tacho_num].mask = data->mask;
 			fan->tacho[tacho_num++].connected = true;
@@ -394,13 +449,21 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 				return -EINVAL;
 			}
 			/* Validate that conf parameters are not zeros. */
-			if (!data->mask || !data->bit) {
+			if (!data->mask && !data->bit && !data->capability) {
 				dev_err(fan->dev, "invalid conf entry params: %s\n",
 					data->label);
 				return -EINVAL;
 			}
-			fan->samples = data->mask;
-			fan->divider = data->bit;
+			if (data->capability) {
+				err = mlxreg_fan_speed_divider_get(fan, data);
+				if (err)
+					return err;
+			} else {
+				if (data->mask)
+					fan->samples = data->mask;
+				if (data->bit)
+					fan->divider = data->bit;
+			}
 			configured = true;
 		} else {
 			dev_err(fan->dev, "invalid label: %s\n", data->label);
-- 
2.11.0

