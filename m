Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F42BC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 11:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379775AbiEBLRY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 07:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384673AbiEBLRW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 07:17:22 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9054663AD
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651490034;
  x=1683026034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LJrl1pexJe6jGBDfQXZQwWWGKO8zit+CGnzAc+AF8FQ=;
  b=pBmGY4xKazTuSdS1/YOQ7RI6O5sNx7I8dUHLC57tbc7xudQs7feWzFJD
   XeK11c2cYNYtFF+tHHx3FsjhVOZb3RFHzzpXadjQJbPavpada2VoRwWFW
   749vZb55YoNc88JO3GQQ83B6uG1EUvGKB+bxlZg1g9+vOEDZA4kcUlVb6
   yupE83URalnT/1p4TGziE6hNfB8BPND7Y2EMB6+XgB+PSpwSR3cXhwdWE
   v0oeF++TeidTjKbiR5nUWA9PHQtuw2ag4qAvx9tRhNkPBRfO5pnnBlcQk
   wzxd5y03IRGxcv7ibQ5NkaAbWTPwQYFkFW17h3Xa/Wp0Mk1jeu4lVSnou
   w==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v5 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
Date:   Mon, 2 May 2022 13:13:45 +0200
Message-ID: <20220502111345.3100970-5-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502111345.3100970-1-marten.lindahl@axis.com>
References: <20220502111345.3100970-1-marten.lindahl@axis.com>
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
index bd143ca0c320..455d06ba5fdf 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2563,11 +2563,74 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = rdev_get_id(rdev),
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+	};
+
+	s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);
+	if (s.data < 0)
+		return s.data;
+
+	return (int)pmbus_reg2data(data, &s) * 1000; /* unit is uV */
+}
+
+static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
+					 int max_uV, unsigned int *selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = rdev_get_id(rdev),
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+	};
+	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */
+	int low = -1, high = -1;
+	u16 val;
+	*selector = 0;
+
+	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
+		low = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
+	if (low < 0) {
+		low = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
+		if (low < 0)
+			return low;
+	}
+
+	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
+		high = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
+	if (high < 0) {
+		high = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
+		if (high < 0)
+			return high;
+	}
+
+	val = pmbus_data2reg(data, &s, tmp);
+
+	/* Make sure we are within margins */
+	if (low > val)
+		val = low;
+	if (high < val)
+		val = high;
+
+	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, val);
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

