Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C51C43334
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jun 2022 09:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbiFNJjO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jun 2022 05:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiFNJjM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jun 2022 05:39:12 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320033D49D
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jun 2022 02:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655199547;
  x=1686735547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Ff7YyDHwSja239jInjAs1eHxqa/GuTYh33jIolSlN4=;
  b=hfRtoOk6Uxgwe8karzBeFHi9pEWFsC+jvFvCOc4wUMyNQLOZmm0DmyDy
   dtwOTyzK710LSbpDCoer4BlmT0oveJ+glkb/OQw923u1fa3PBsTflXUNz
   RggYO2m9munR2dsYCa/SFOJ48beZkaykeewphel/M9Jy6m52Py7EBiazy
   3vMUvz7VmqfECHjGKyuhsjXvIUFTKndMHzcFU2k9H5H8xEMlRwpvpTQIK
   ed+7c/HQNS+N+ClRYUMr1FAxsHMp2ROWSPqHrp8Liy/Fu/HAJU8UeOzRI
   K8l88OdIQwr7dheF6ZMybPa1toYrHqv2YifiKYdQww+S0y8qQiEOZXn0m
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 1/3] hwmon: (pmbus) Introduce and use cached vout margins
Date:   Tue, 14 Jun 2022 11:38:54 +0200
Message-ID: <20220614093856.3470672-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614093856.3470672-1-marten.lindahl@axis.com>
References: <20220614093856.3470672-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When setting a new voltage the voltage boundaries are read every time to
check that the new voltage is within the proper range. Checking these
voltage boundaries consists of reading one of PMBUS_MFR_VOUT_MIN/
PMBUS_VOUT_MARGIN_LOW registers and then PMBUS_MFR_VOUT_MAX/
PMBUS_VOUT_MARGIN_HIGH together with writing the PMBUS_CLEAR_FAULTS
register.

Since these boundaries are never being changed, it can be cached and
thus saving unnecessary smbus transmissions.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 78 +++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 02912022853d..5e0d16512fa6 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -104,6 +104,9 @@ struct pmbus_data {
 
 	s16 currpage;	/* current page, -1 for unknown/unset */
 	s16 currphase;	/* current phase, 0xff for all, -1 for unknown/unset */
+
+	int vout_low[PMBUS_PAGES];	/* voltage low margin */
+	int vout_high[PMBUS_PAGES];	/* voltage high margin */
 };
 
 struct pmbus_debugfs_entry {
@@ -2636,6 +2639,58 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 	return 0;
 }
 
+static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = page,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = -1,
+	};
+
+	if (!data->vout_low[page]) {
+		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MIN))
+			s.data = _pmbus_read_word_data(client, page, 0xff,
+						       PMBUS_MFR_VOUT_MIN);
+		if (s.data < 0) {
+			s.data = _pmbus_read_word_data(client, page, 0xff,
+						       PMBUS_VOUT_MARGIN_LOW);
+			if (s.data < 0)
+				return s.data;
+		}
+		data->vout_low[page] = pmbus_reg2data(data, &s);
+	}
+
+	return data->vout_low[page];
+}
+
+static int pmbus_regulator_get_high_margin(struct i2c_client *client, int page)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = page,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = -1,
+	};
+
+	if (!data->vout_high[page]) {
+		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MAX))
+			s.data = _pmbus_read_word_data(client, page, 0xff,
+						       PMBUS_MFR_VOUT_MAX);
+		if (s.data < 0) {
+			s.data = _pmbus_read_word_data(client, page, 0xff,
+						       PMBUS_VOUT_MARGIN_HIGH);
+			if (s.data < 0)
+				return s.data;
+		}
+		data->vout_high[page] = pmbus_reg2data(data, &s);
+	}
+
+	return data->vout_high[page];
+}
+
 static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
 {
 	struct device *dev = rdev_get_dev(rdev);
@@ -2671,24 +2726,13 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 
 	*selector = 0;
 
-	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
-	if (s.data < 0) {
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
-		if (s.data < 0)
-			return s.data;
-	}
-	low = pmbus_reg2data(data, &s);
+	low = pmbus_regulator_get_low_margin(client, s.page);
+	if (low < 0)
+		return low;
 
-	s.data = -1;
-	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
-	if (s.data < 0) {
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
-		if (s.data < 0)
-			return s.data;
-	}
-	high = pmbus_reg2data(data, &s);
+	high = pmbus_regulator_get_high_margin(client, s.page);
+	if (high < 0)
+		return high;
 
 	/* Make sure we are within margins */
 	if (low > val)
-- 
2.30.2

