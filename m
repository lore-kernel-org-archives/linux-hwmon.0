Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A37C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 May 2022 15:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240264AbiE3Pcd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 May 2022 11:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240384AbiE3PcZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 May 2022 11:32:25 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1463713AF1E
        for <linux-hwmon@vger.kernel.org>; Mon, 30 May 2022 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1653921313;
  x=1685457313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uVWVlUmZIp4aJDQV8Z2zFsWU0lT1H4YMnA3xlOlcyOE=;
  b=h3kdhy8C+upzy2M4JDZxYEq86z0sBpAOoU4Lu10QiSPanyQZorjtAf8o
   0MajlcIJiPDlVU5hhCCKh1kVBLfQ08++9bo6xSTHQ8+lQayT0uz4QpATn
   Ymaf7MoAdP7gtVzZ0A2kWW90cy9PFB3bJSNkCRswT3V6smr+eh++6+CI9
   z9Zj8+KzzwrpAV1zzbbcG57Ow37HabTWZcuC98caWaAwulkD0IX2ZYOBV
   uf6iwY/28KFkj2HSepbw7CZJ7OtLbSbWxaEz2LVikFaJlscH2wUh3+0+J
   nu6x/lPxWBAVnjnrocf62KZ2CIR8AhJSGVJAsZppOaNMP4KCX+decpRWg
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v1] hwmon: (pmbus/ltc2978) Set voltage resolution
Date:   Mon, 30 May 2022 16:34:46 +0200
Message-ID: <20220530143446.2649282-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When checking if a regulator supports a voltage range, the regulator
needs to have support for listing the range or else -EINVAL will be
returned.

This support does not exist for the LTC2977 regulator, so this patch
adds support for list voltage to the pmbus regulators by adding
regulator_list_voltage_linear to the pmbus_regulator_ops. It also
defines the voltage resolution for regulators ltc2972/LTC2974/LTC2975/
LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have the
same stepwise 122.07uV resolution.

Since 122.07uV resolution is very small the resolution is set to a 1mV
resolution to be easier to handle.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c    | 57 +++++++++++++++++++++++++++++---
 drivers/hwmon/pmbus/pmbus_core.c |  1 +
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 531aa674a928..cfb568c6c155 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -562,7 +562,37 @@ static const struct i2c_device_id ltc2978_id[] = {
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
 
 #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
+#define LTC2978_ADC_RES 0xFFFF
+#define LTC2978_N_ADC 122
+#define LTC2978_MAX_UV (LTC2978_ADC_RES * LTC2978_N_ADC)
+#define LTC2978_UV_STEP (1000)
+
+#define PMBUS_LTC2978_REGULATOR(_name, _id)               \
+	[_id] = {                                               \
+		.name = (_name # _id),                                \
+		.supply_name = "vin",                                 \
+		.id = (_id),                                          \
+		.of_match = of_match_ptr(_name # _id),                \
+		.regulators_node = of_match_ptr("regulators"),        \
+		.ops = &pmbus_regulator_ops,                          \
+		.type = REGULATOR_VOLTAGE,                            \
+		.owner = THIS_MODULE,                                 \
+		.n_voltages = (LTC2978_MAX_UV / LTC2978_UV_STEP) + 1, \
+		.uV_step = LTC2978_UV_STEP,                           \
+	}
+
 static const struct regulator_desc ltc2978_reg_desc[] = {
+	PMBUS_LTC2978_REGULATOR("vout", 0),
+	PMBUS_LTC2978_REGULATOR("vout", 1),
+	PMBUS_LTC2978_REGULATOR("vout", 2),
+	PMBUS_LTC2978_REGULATOR("vout", 3),
+	PMBUS_LTC2978_REGULATOR("vout", 4),
+	PMBUS_LTC2978_REGULATOR("vout", 5),
+	PMBUS_LTC2978_REGULATOR("vout", 6),
+	PMBUS_LTC2978_REGULATOR("vout", 7),
+};
+
+static const struct regulator_desc ltc2978_reg_desc_default[] = {
 	PMBUS_REGULATOR("vout", 0),
 	PMBUS_REGULATOR("vout", 1),
 	PMBUS_REGULATOR("vout", 2),
@@ -839,10 +869,29 @@ static int ltc2978_probe(struct i2c_client *client)
 
 #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
 	info->num_regulators = info->pages;
-	info->reg_desc = ltc2978_reg_desc;
-	if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
-		dev_err(&client->dev, "num_regulators too large!");
-		info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
+	switch (data->id) {
+	case ltc2972:
+	case ltc2974:
+	case ltc2975:
+	case ltc2977:
+	case ltc2978:
+	case ltc2979:
+	case ltc2980:
+	case ltm2987:
+		info->reg_desc = ltc2978_reg_desc;
+		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
+			dev_err(&client->dev, "num_regulators too large!");
+			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
+		}
+		break;
+	default:
+		info->reg_desc = ltc2978_reg_desc_default;
+		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
+			dev_err(&client->dev, "num_regulators too large!");
+			info->num_regulators =
+			    ARRAY_SIZE(ltc2978_reg_desc_default);
+		}
+		break;
 	}
 #endif
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f2cf0439da37..7d642b57c8b2 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2634,6 +2634,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.get_error_flags = pmbus_regulator_get_error_flags,
 	.get_voltage = pmbus_regulator_get_voltage,
 	.set_voltage = pmbus_regulator_set_voltage,
+	.list_voltage = regulator_list_voltage_linear,
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
-- 
2.30.2

