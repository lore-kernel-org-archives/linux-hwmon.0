Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F20C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Apr 2022 10:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348339AbiDZKHy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Apr 2022 06:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348375AbiDZKHs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 06:07:48 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDA21B9FBC
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650965392;
  x=1682501392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/GFAkktAUKsGFymzHy0H16xCWc9nk80meKTtOqFBu8=;
  b=K8yqVtzqQ2CVtQzSqOiq/IMvfM1zvX4QOdCNc7c+4p+DfHA/pCjwmWep
   QWnZQJZ5M7iWMlMcDFDgPz+wbSpDctcXwTpNSvNELi8S/ONkw/bRtNODH
   rZK56ns2nEhQAbr3sNqqo1bgICc/r/ONPI5RrdmBtg/CYV4K2rLW0tbGw
   +IWPPRZpeX9L03w1dBuAy54K+jO4GnkeurfztslFnHTuvQTOWwshSMb0Q
   XLXdts086KoGWpS4nfTFiYp188Efb41+oJbtTCjI07is7KlvYWoz9Ndb+
   ihCaLtU7D9AE5fivzbIghFf3Y20pJkUbyr06Rri2g+etAHnDov+bDYlFw
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 1/2] hwmon: (pmbus/ltc2978) Use driver specific ops if they exist
Date:   Tue, 26 Apr 2022 11:29:35 +0200
Message-ID: <20220426092936.1127114-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426092936.1127114-1-marten.lindahl@axis.com>
References: <20220426092936.1127114-1-marten.lindahl@axis.com>
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

Since this driver uses the default pmbus_regulator_ops for the enable/
disable/is_enabled functions and these functions do not check for driver
specific read/write ops, the wait time recommendations are bypassed for
several of the devices managed by this driver (ltc3880/ltc3882/ltc3883/
ltc3884/ltc3886/ltc3887/ltc3889/ltm4664/ltm4675/ltm4676/ltm4677/ltm4678/
ltm4680/ltm4686/ltm4700/ltc7880).

Lets add support for driver specific callbacks in pmbus core which takes
the wait time into consideration for the specified devices.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/ltc2978.c    | 12 +++++++
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 58 +++++++++++++++++++++-----------
 3 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 0127273883f0..531aa674a928 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -196,6 +196,17 @@ static int ltc_read_byte_data(struct i2c_client *client, int page, int reg)
 	return pmbus_read_byte_data(client, page, reg);
 }
 
+static int ltc_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
+{
+	int ret;
+
+	ret = ltc_wait_ready(client);
+	if (ret < 0)
+		return ret;
+
+	return pmbus_write_byte_data(client, page, reg, value);
+}
+
 static int ltc_write_byte(struct i2c_client *client, int page, u8 byte)
 {
 	int ret;
@@ -681,6 +692,7 @@ static int ltc2978_probe(struct i2c_client *client)
 	info = &data->info;
 	info->write_word_data = ltc2978_write_word_data;
 	info->write_byte = ltc_write_byte;
+	info->write_byte_data = ltc_write_byte_data;
 	info->read_word_data = ltc_read_word_data;
 	info->read_byte_data = ltc_read_byte_data;
 
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index e74b6ef070f3..c031a9700ace 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -438,6 +438,8 @@ struct pmbus_driver_info {
 	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
 	int (*read_word_data)(struct i2c_client *client, int page, int phase,
 			      int reg);
+	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
+			      u8 byte);
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
 			       u16 word);
 	int (*write_byte)(struct i2c_client *client, int page, u8 value);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index b2618b1d529e..1b0728c3c7d8 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -384,25 +384,6 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
 
-int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
-			   u8 mask, u8 value)
-{
-	unsigned int tmp;
-	int rv;
-
-	rv = pmbus_read_byte_data(client, page, reg);
-	if (rv < 0)
-		return rv;
-
-	tmp = (rv & ~mask) | (value & mask);
-
-	if (tmp != rv)
-		rv = pmbus_write_byte_data(client, page, reg, tmp);
-
-	return rv;
-}
-EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
-
 /*
  * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
  * a device specific mapping function exists and calls it if necessary.
@@ -421,6 +402,43 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
 	return pmbus_read_byte_data(client, page, reg);
 }
 
+/*
+ * _pmbus_write_byte_data() is similar to pmbus_write_byte_data(), but checks if
+ * a device specific mapping function exists and calls it if necessary.
+ */
+static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	int status;
+
+	if (info->write_byte_data) {
+		status = info->write_byte_data(client, page, reg, value);
+		if (status != -ENODATA)
+			return status;
+	}
+	return pmbus_write_byte_data(client, page, reg, value);
+}
+
+int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
+			   u8 mask, u8 value)
+{
+	unsigned int tmp;
+	int rv;
+
+	rv = _pmbus_read_byte_data(client, page, reg);
+	if (rv < 0)
+		return rv;
+
+	tmp = (rv & ~mask) | (value & mask);
+
+	if (tmp != rv)
+		rv = _pmbus_write_byte_data(client, page, reg, tmp);
+
+	return rv;
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
+
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
 					      int reg)
 {
@@ -2396,7 +2414,7 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
 	int ret;
 
 	mutex_lock(&data->update_lock);
-	ret = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
 	mutex_unlock(&data->update_lock);
 
 	if (ret < 0)
-- 
2.30.2

