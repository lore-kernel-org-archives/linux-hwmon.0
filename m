Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F53AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jun 2022 10:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353186AbiFNKSp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 06:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353036AbiFNKSo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 06:18:44 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347934198C
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jun 2022 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655201923;
  x=1686737923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OQeZ7dROFN7mVX6ZstoLq0E0XmOkhQAcNUc6iU4t0y0=;
  b=FmYmKw7hsOCqeOZ9JnqzSh2sdulfrGkuMOe/X+KeCfRcbp79+O8XF3gK
   NvPtKnLqMIbTlQZCRobqzWpzMIsUOKM3vCBmCaD4ukQKS6WzCMYmVpPUc
   mx35q4JdTaeY/TzDNbxcm2FIxwHUn+sTsdR9wh/ElIgZteyDKqi6VkIjz
   RWuUKXYqQHnR7MrwRPg7kwO79hFguwziDHqBmlVWzqbK5a6AvdhTLw8Cw
   A+tKq4m6J5vdjgYr5XrGyoT8pwRQ/o3oBxRXtjxnYTkdkJk8lq0x0WxZK
   fu0uJP3lCS3MTsq+mdEakGrPGnlarhoqGGGkzrbB38TXSLfPN+MHPGV3g
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 3/3] hwmon: (pmbus/ltc2978) Set voltage resolution
Date:   Tue, 14 Jun 2022 11:38:56 +0200
Message-ID: <20220614093856.3470672-4-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614093856.3470672-1-marten.lindahl@axis.com>
References: <20220614093856.3470672-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The LTC2977 regulator does not set the regulator_desc .n_voltages value
which is needed in order to let the regulator core list the regulator
voltage range.

This patch defines a regulator_desc with a voltage range, and uses it
for defining voltage resolution for regulators LTC2972/LTC2974/LTC2975/
LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have a 16
bit ADC with the same stepwise 122.07uV resolution. It also scales the
resolution to a 1mV resolution which is easier to handle.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 44 +++++++++++++++++++++++++++++++----
 drivers/hwmon/pmbus/pmbus.h   |  8 +++++--
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 531aa674a928..6d2592731ba3 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -562,7 +562,24 @@ static const struct i2c_device_id ltc2978_id[] = {
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
 
 #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
+#define LTC2978_ADC_RES	0xFFFF
+#define LTC2978_N_ADC	122
+#define LTC2978_MAX_UV	(LTC2978_ADC_RES * LTC2978_N_ADC)
+#define LTC2978_UV_STEP	1000
+#define LTC2978_N_VOLTAGES	((LTC2978_MAX_UV / LTC2978_UV_STEP) + 1)
+
 static const struct regulator_desc ltc2978_reg_desc[] = {
+	PMBUS_REGULATOR_STEP("vout", 0, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 1, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 2, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 3, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 4, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 5, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 6, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+	PMBUS_REGULATOR_STEP("vout", 7, LTC2978_N_VOLTAGES, LTC2978_UV_STEP),
+};
+
+static const struct regulator_desc ltc2978_reg_desc_default[] = {
 	PMBUS_REGULATOR("vout", 0),
 	PMBUS_REGULATOR("vout", 1),
 	PMBUS_REGULATOR("vout", 2),
@@ -839,10 +856,29 @@ static int ltc2978_probe(struct i2c_client *client)
 
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
+			dev_warn(&client->dev, "num_regulators too large!");
+			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
+		}
+		break;
+	default:
+		info->reg_desc = ltc2978_reg_desc_default;
+		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
+			dev_warn(&client->dev, "num_regulators too large!");
+			info->num_regulators =
+			    ARRAY_SIZE(ltc2978_reg_desc_default);
+		}
+		break;
 	}
 #endif
 
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index c031a9700ace..4a4689c4ab7f 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -463,8 +463,8 @@ struct pmbus_driver_info {
 
 extern const struct regulator_ops pmbus_regulator_ops;
 
-/* Macro for filling in array of struct regulator_desc */
-#define PMBUS_REGULATOR(_name, _id)				\
+/* Macros for filling in array of struct regulator_desc */
+#define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step)  \
 	[_id] = {						\
 		.name = (_name # _id),				\
 		.supply_name = "vin",				\
@@ -474,8 +474,12 @@ extern const struct regulator_ops pmbus_regulator_ops;
 		.ops = &pmbus_regulator_ops,			\
 		.type = REGULATOR_VOLTAGE,			\
 		.owner = THIS_MODULE,				\
+		.n_voltages = _voltages,			\
+		.uV_step = _step,				\
 	}
 
+#define PMBUS_REGULATOR(_name, _id)	PMBUS_REGULATOR_STEP(_name, _id, 0, 0)
+
 /* Function declarations */
 
 void pmbus_clear_cache(struct i2c_client *client);
-- 
2.30.2

