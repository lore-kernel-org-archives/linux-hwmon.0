Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24C8C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 May 2022 10:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbiECKvM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 May 2022 06:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbiECKuq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 06:50:46 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B402D1F1
        for <linux-hwmon@vger.kernel.org>; Tue,  3 May 2022 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651574803;
  x=1683110803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oxG0nj7wBjLD5tte31Ndw3paxaz9vJ9tvCOhJGiH67k=;
  b=mI7J2nZARFYyzlxBqpbDJDiaIEGtIWNH0S/pT51GkeaBpojjhXY53b4g
   qoxVvOFhPExL/FfXBdhhLY3EASiBtsBexBgf0iMKXwWuzR864G0WgkR1A
   dh9IcpErBcNz8FXoW1ighyScLCWGVKny36alNgVjilw80wzY23v1K02FC
   2d1zlwciE/jefs6gENf8+UOZzjs8mERewl7rnMhE0ByeugUPSbWQlbmAh
   63zLjkhrweco6EokEx3mSzt57qWSNEtH2POSZSqIkT1KUsBbdpaZHA5i9
   LZ3udI1BwaHoS+FgSEHNLCr6El/nrmoMVevHRatWsL3/DKWbPn7uqr5Ux
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v6 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
Date:   Tue, 3 May 2022 12:46:31 +0200
Message-ID: <20220503104631.3515715-5-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503104631.3515715-1-marten.lindahl@axis.com>
References: <20220503104631.3515715-1-marten.lindahl@axis.com>
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
 drivers/hwmon/pmbus/pmbus_core.c | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index bd143ca0c320..f2cf0439da37 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2563,11 +2563,77 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
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
+static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
+					 int max_uv, unsigned int *selector)
+{
+	struct device *dev = rdev_get_dev(rdev);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = rdev_get_id(rdev),
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = -1,
+	};
+	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
+	int low, high;
+	*selector = 0;
+
+	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
+		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
+	if (s.data < 0) {
+		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
+		if (s.data < 0)
+			return s.data;
+	}
+	low = pmbus_reg2data(data, &s);
+	s.data = -1;
+
+	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
+		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
+	if (s.data < 0) {
+		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
+		if (s.data < 0)
+			return s.data;
+	}
+	high = pmbus_reg2data(data, &s);
+
+	/* Make sure we are within margins */
+	if (low > val)
+		val = low;
+	if (high < val)
+		val = high;
+
+	val = pmbus_data2reg(data, &s, val);
+
+	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
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

