Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6230C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Apr 2022 15:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbiDFPhY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Apr 2022 11:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbiDFPgw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Apr 2022 11:36:52 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBDC8C7E6
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Apr 2022 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649249445;
  x=1680785445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Slkc9LV6/4/+9KbpiR7hN5qGi4R02HlEGdB5Rk6h1jA=;
  b=C4qA6HQu1bycbStEgo7ZZW4XEpnziHcwH1Ho3LK4XlMcJ7ky08MvpkTE
   1s+/tI0VjskMVHUsEADJiBu426XjW4+/4NmY2NCbZLaOhuAtNK/gxpRHQ
   JNohEzFplrfmj6LSP11VdVufqyshTn1NC6Xj6q4WJcSOI4lD4Luk5O9Tg
   wQB1c3tYPg6BgmhHwBcuQPAIc2U6/t4fkp4qy20/CO6e++ywaFHsYznna
   U5NK61nkAcvwW4plh43dYrf/gXaZZtxlk+ZFUGBsLyEUpxDx+m7T5IY9P
   U3n/VTwMQAwZa0bC4vP+u2U/7cv8qMh5j9QjgEHHnVD0eHphBU9KoYgNQ
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH 1/2] hwmon: (pmbus/ltc2978) Add driver specific regulator ops
Date:   Wed, 6 Apr 2022 14:43:20 +0200
Message-ID: <20220406124321.1184133-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406124321.1184133-1-marten.lindahl@axis.com>
References: <20220406124321.1184133-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Several of the manuals for devices supported by this driver describes
the need for a minimum wait time before the chip is ready to receive
next command.

This wait time is already implemented in the driver as a ltc_wait_ready
function with a driver defined wait time of 100 ms, and is considered
for specific devices before reading/writing data on the pmbus.

But this driver uses the default pmbus_regulator_ops for the enable/
disable/is_enabled functions. By using these functions it bypasses the
wait time recommendations for several of the devices managed by the
driver (ltc3880/ltc3882/ltc3883/ltc3884/ltc3886/ltc3887/ltc3889/ltm4664/
ltm4675/ltm4676/ltm4677/ltm4678/ltm4680/ltm4686/ltm4700/ltc7880).

Lets add driver specific regulator enable/disable/is_enabled ops which
takes the wait time into consideration for the specified devices, by
overriding pmbus_read_byte_data with internal ltc_read_byte_data.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 79 +++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 0127273883f0..822edec33ba7 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -551,15 +551,78 @@ static const struct i2c_device_id ltc2978_id[] = {
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
 
 #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
+static int ltc2978_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	ret = ltc_read_byte_data(client, page, PMBUS_OPERATION);
+	if (ret < 0)
+		return ret;
+
+	return !!(ret & PB_OPERATION_CONTROL_ON);
+}
+
+static int ltc2978_regulator_on_off(struct regulator_dev *rdev, bool enable)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	u8 page = rdev_get_id(rdev);
+	unsigned int tmp;
+	int rv;
+
+	rv = ltc_read_byte_data(client, page, PMBUS_OPERATION);
+	if (rv < 0)
+		return rv;
+
+	tmp = (rv & ~PB_OPERATION_CONTROL_ON) |
+	    (enable ? PB_OPERATION_CONTROL_ON : 0);
+
+	if (tmp != rv)
+		rv = pmbus_write_byte_data(client, page, PMBUS_OPERATION, tmp);
+
+	return rv;
+}
+
+static int ltc2978_regulator_enable(struct regulator_dev *rdev)
+{
+	return ltc2978_regulator_on_off(rdev, 1);
+}
+
+static int ltc2978_regulator_disable(struct regulator_dev *rdev)
+{
+	return ltc2978_regulator_on_off(rdev, 0);
+}
+
+static const struct regulator_ops ltc2978_regulator_ops = {
+	.enable = ltc2978_regulator_enable,
+	.disable = ltc2978_regulator_disable,
+	.is_enabled = ltc2978_regulator_is_enabled,
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
 
-- 
2.30.2

