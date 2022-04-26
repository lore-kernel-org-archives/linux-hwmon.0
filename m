Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62FCC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Apr 2022 10:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348398AbiDZKH6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Apr 2022 06:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345015AbiDZKHu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 06:07:50 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538961BB686
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650965394;
  x=1682501394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hKO8dR2R5DBHMpbAmT/hxFN5Jl6JGf1Mb1LUBAOTQVg=;
  b=SVHPiU9e3XqHX6e3r9PfOVhjYS3mpNEPehXFNhsuJGX6CK8K+xuEtrz2
   I8fiDmMdMicVnilPG5iorTeJruqzee7tJqTIz2gFuytqWC8I4qNJrDE6Y
   Xe1QxTRUSy2qh04ZPRLoybiuw1FxVMQtHkumWpZPqfOKYKugrk9vxLniR
   NMAiF5YczT7I4MednjCtucbIlYKsA9Fj8Bo301+FjbPF87awN3uidWE6G
   aDA7FyyYG5MO/doPzz4EZm8laF4PRsBCAQ292FtU8yBTKHrrWt83GcVQj
   QoJgCxN3Hm6DPXwuu3hlXOtB/W3eU0wslsppbLDHDsnlfkxvoHKLrWSWe
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 2/2] hwmon: (pmbus/ltc2978) Add get_voltage/set_voltage ops
Date:   Tue, 26 Apr 2022 11:29:36 +0200
Message-ID: <20220426092936.1127114-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426092936.1127114-1-marten.lindahl@axis.com>
References: <20220426092936.1127114-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver does not have regulator specific operations for getting or
setting voltage. Add functions get/set voltage for the dynamic regulator
framework.

In order to register the regulator operations together with the default
pmbus core functions enable/disable/is_enabled, the default core
functions need to be exported.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c    | 89 +++++++++++++++++++++++++++++---
 drivers/hwmon/pmbus/pmbus.h      |  3 ++
 drivers/hwmon/pmbus/pmbus_core.c |  9 ++--
 3 files changed, 90 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 531aa674a928..76f37de67602 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -562,15 +562,88 @@ static const struct i2c_device_id ltc2978_id[] = {
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
 
 #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
+static int ltc2978_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_read_word_data(client, page, 0xff, PMBUS_READ_VOUT);
+	if (ret < 0)
+		return ret;
+
+	ret *= 1000;
+
+	return ((ret >> 13) * 1000);
+}
+
+static int ltc2978_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
+					 int max_uV, unsigned int *selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	long tmp = DIV_ROUND_CLOSEST(min_uV, 1000);
+	u32 val = DIV_ROUND_CLOSEST(tmp << 13, 1000);
+	int ret;
+	*selector = 0;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
+	if (ret < 0)
+		return ret;
+
+	/* Select the voltage closest to min_uV */
+	if (ret > val)
+		val = ret;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	ret = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
+				    (u16)val);
+
+	return ret;
+}
+
+static const struct regulator_ops ltc2978_regulator_ops = {
+	.enable = pmbus_regulator_enable,
+	.disable = pmbus_regulator_disable,
+	.is_enabled = pmbus_regulator_is_enabled,
+	.get_voltage = ltc2978_regulator_get_voltage,
+	.set_voltage = ltc2978_regulator_set_voltage,
+};
+
+/* Macro for filling in array of struct regulator_desc */
+#define PMBUS_LTC2978_REGULATOR(_name, _id)			\
+	[_id] = {						\
+		.name = (_name # _id),				\
+		.id = (_id),					\
+		.of_match = of_match_ptr(_name # _id),		\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.ops = &ltc2978_regulator_ops,			\
+		.type = REGULATOR_VOLTAGE,			\
+		.owner = THIS_MODULE,				\
+	}
+
 static const struct regulator_desc ltc2978_reg_desc[] = {
-	PMBUS_REGULATOR("vout", 0),
-	PMBUS_REGULATOR("vout", 1),
-	PMBUS_REGULATOR("vout", 2),
-	PMBUS_REGULATOR("vout", 3),
-	PMBUS_REGULATOR("vout", 4),
-	PMBUS_REGULATOR("vout", 5),
-	PMBUS_REGULATOR("vout", 6),
-	PMBUS_REGULATOR("vout", 7),
+	PMBUS_LTC2978_REGULATOR("vout", 0),
+	PMBUS_LTC2978_REGULATOR("vout", 1),
+	PMBUS_LTC2978_REGULATOR("vout", 2),
+	PMBUS_LTC2978_REGULATOR("vout", 3),
+	PMBUS_LTC2978_REGULATOR("vout", 4),
+	PMBUS_LTC2978_REGULATOR("vout", 5),
+	PMBUS_LTC2978_REGULATOR("vout", 6),
+	PMBUS_LTC2978_REGULATOR("vout", 7),
 };
 #endif /* CONFIG_SENSORS_LTC2978_REGULATOR */
 
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index c031a9700ace..e504656ddd26 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -478,6 +478,9 @@ extern const struct regulator_ops pmbus_regulator_ops;
 
 /* Function declarations */
 
+int pmbus_regulator_enable(struct regulator_dev *rdev);
+int pmbus_regulator_disable(struct regulator_dev *rdev);
+int pmbus_regulator_is_enabled(struct regulator_dev *rdev);
 void pmbus_clear_cache(struct i2c_client *client);
 void pmbus_set_update(struct i2c_client *client, u8 reg, bool update);
 int pmbus_set_page(struct i2c_client *client, int page, int phase);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 1b0728c3c7d8..149282953734 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2405,7 +2405,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 }
 
 #if IS_ENABLED(CONFIG_REGULATOR)
-static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
+int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
@@ -2422,6 +2422,7 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
 
 	return !!(ret & PB_OPERATION_CONTROL_ON);
 }
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_is_enabled, PMBUS);
 
 static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
 {
@@ -2440,15 +2441,17 @@ static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
 	return ret;
 }
 
-static int pmbus_regulator_enable(struct regulator_dev *rdev)
+int pmbus_regulator_enable(struct regulator_dev *rdev)
 {
 	return _pmbus_regulator_on_off(rdev, 1);
 }
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_enable, PMBUS);
 
-static int pmbus_regulator_disable(struct regulator_dev *rdev)
+int pmbus_regulator_disable(struct regulator_dev *rdev)
 {
 	return _pmbus_regulator_on_off(rdev, 0);
 }
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_disable, PMBUS);
 
 /* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
 struct pmbus_regulator_status_assoc {
-- 
2.30.2

