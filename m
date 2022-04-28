Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA647C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 14:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245313AbiD1OoL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 10:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348547AbiD1OoE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 10:44:04 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758EB222BB
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651156849;
  x=1682692849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZlVj8ie0LYvEGBIGn+eWLru3W3rHSVxuvgia5S2Qr+A=;
  b=glnWs7ak/c+9w0faMvidFehbhPaBARPjQi6aY76WZSYldPIl8KhgmYPr
   Fl5JN/BKUwqzWngg8nf76XJ6CZbAkJeh0tHUlPjZIvPdfVq80hO/8Ad/5
   HEh5tdY5h1+OuybKD1o/GGaAo2VAIkowBVD7vDeRYV2uPUso25DZYHhTu
   Rq5S3doJ/ZmlUDoHLnmT2ES9JnlE0q+2cq8gf7bTjcd66dUx36SQ+5Seq
   K9xXyaZL43ZOKaJpPLk7/j3Mjkpmz5flfHAPebZfZqmqxkwu9pL6/Wy2b
   BgBxY3BLwY622+PDUnBhGJfjAWfthyTCKfJ6xNJgZUO7ulxhSU73aHMt2
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
Date:   Thu, 28 Apr 2022 16:40:39 +0200
Message-ID: <20220428144039.2464667-5-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220428144039.2464667-1-marten.lindahl@axis.com>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pmbus core does not have operations for getting or setting voltage.
Add functions get/set voltage for the dynamic regulator framework.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index bd143ca0c320..fe7dbb496e3b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1531,6 +1531,11 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
 		.gbit = PB_STATUS_VOUT_OV,
 		.limit = vout_limit_attrs,
 		.nlimit = ARRAY_SIZE(vout_limit_attrs),
+	}, {
+		.reg = PMBUS_VOUT_COMMAND,
+		.class = PSC_VOLTAGE_OUT,
+		.paged = true,
+		.func = PMBUS_HAVE_VOUT,
 	}
 };
 
@@ -2563,11 +2568,69 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor *sensor;
+	u8 page = rdev_get_id(rdev);
+	int ret;
+
+	sensor = pmbus_find_sensor(data, page, PMBUS_READ_VOUT);
+	if (IS_ERR(sensor))
+		return -ENODATA;
+
+	mutex_lock(&data->update_lock);
+	pmbus_update_sensor_data(client, sensor);
+	if (sensor->data < 0)
+		ret = sensor->data;
+	else
+		ret = (int)pmbus_reg2data(data, sensor) * 1000; /* unit is uV */
+	mutex_unlock(&data->update_lock);
+
+	return ret;
+}
+
+static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
+					 int max_uV, unsigned int *selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor *sensor;
+	u8 page = rdev_get_id(rdev);
+	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */
+	u16 val;
+	int ret;
+	*selector = 0;
+
+	sensor = pmbus_find_sensor(data, page, PMBUS_VOUT_COMMAND);
+	if (IS_ERR(sensor))
+		return -ENODATA;
+
+	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
+	if (ret < 0)
+		return ret;
+
+	val = pmbus_data2reg(data, sensor, tmp);
+
+	/* Do not fall shorter than low margin */
+	if (ret > val)
+		val = ret;
+
+	ret = _pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND, val);
+
+	return ret;
+}
+
 const struct regulator_ops pmbus_regulator_ops = {
 	.enable = pmbus_regulator_enable,
 	.disable = pmbus_regulator_disable,
 	.is_enabled = pmbus_regulator_is_enabled,
 	.get_error_flags = pmbus_regulator_get_error_flags,
+	.get_voltage = pmbus_regulator_get_voltage,
+	.set_voltage = pmbus_regulator_set_voltage,
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
-- 
2.30.2

