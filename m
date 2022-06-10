Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D83CCA47D
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jun 2022 11:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240337AbiFJLry (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Jun 2022 07:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbiFJLrw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jun 2022 07:47:52 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DE5972AB
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 04:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654861671;
  x=1686397671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NIb/ukpGACS/17FlffMqUSn0XJ/8oV9mFBTyTUCmWRs=;
  b=l7aYAdEl7Dsg0SvqToWIy/0b+ZzggEbN4unvS3QrkDXxzJKB5QYGVaf3
   K7PBYXD+juPA1VbIgszmxr8G4WsPEzN9rueK1zEHWL0brPlGhrkCie5Mf
   Ja9WCo4Kvrp1RCVEj7mwITwun1IJk/2WdFjD0nfSay2T7iYheLcq5WTf6
   a3YzA1dMXTtXD5ftcO2H3ejab2PBfdRuiuCqgyIjt8FwOfvhYoTV4dwaL
   l2bwmybT6p6oeIZTrYIweQH4weHwWVGZAkSka3G0AMmpCniLDNxb8sOsk
   1wXC7DvreZ1CU2CCfS5joIow4Iau+cIMWJN3KvCfgREkzg8NNub2c0TTh
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 3/3] hwmon: (pmbus/ltc2978) Set voltage resolution
Date:   Fri, 10 Jun 2022 13:47:32 +0200
Message-ID: <20220610114732.2370242-4-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220610114732.2370242-1-marten.lindahl@axis.com>
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
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
 drivers/hwmon/pmbus/ltc2978.c | 56 ++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 531aa674a928..7d44e64c61c1 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -562,7 +562,36 @@ static const struct i2c_device_id ltc2978_id[] = {
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
 
 #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
+#define LTC2978_ADC_RES	0xFFFF
+#define LTC2978_N_ADC	122
+#define LTC2978_MAX_UV	(LTC2978_ADC_RES * LTC2978_N_ADC)
+#define LTC2978_UV_STEP	1000
+
+#define PMBUS_LTC2978_REGULATOR(_name, _id)               \
+	[_id] = {                                               \
+		.name = (_name # _id),                                \
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
@@ -839,10 +868,29 @@ static int ltc2978_probe(struct i2c_client *client)
 
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
 
-- 
2.30.2

