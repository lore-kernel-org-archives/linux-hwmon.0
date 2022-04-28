Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFE7C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 14:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348515AbiD1OoM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 10:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348541AbiD1OoD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 10:44:03 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90209222A6
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651156847;
  x=1682692847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MGqSKsspLACjE5LANc6kRbTEa7R5JgCSRXeuNkwFVYA=;
  b=NaIeTjWSJzUCYz27lcGHk5v7TsBPvalmVJ001Fx2QPnjd+GQqVkKb3Wl
   xslOiPjO7AwejfgyIcViBDQtZ/nGOih68VaTCVh9Q6tAlLqtb4VM/88XT
   NbunkFpG3+89lRiPJ9IR92KA2G+LMx4DgyXUI/qwRjuYUfxCA149RG0Kd
   x8VGn1HEcwIfBTN0tKpfqeYXRkyzZxeLI8F/QUQQL6MR7+TYhXamHMyr6
   n1C4og/Yes/zUvYLuSw5WvoXAj/VjMF6idz6DLKSQtULGM0Gy1lbE5OFm
   OOHh7wX4d9RHOKjgAaV5W51X8y4aaq5m9APWS/g0uPp56y26X8m22Gwec
   w==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 2/4] hwmon: (pmbus) Use _pmbus_read_byte_data with callback
Date:   Thu, 28 Apr 2022 16:40:37 +0200
Message-ID: <20220428144039.2464667-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220428144039.2464667-1-marten.lindahl@axis.com>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some of the pmbus core functions uses pmbus_read_byte_data, which does
not support driver callbacks for chip specific write operations. This
could potentially influence some specific regulator chips that for
example need a time delay before each data access.

Lets use _pmbus_read_byte_data with callback check.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 46 ++++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 98da2db3f831..bd143ca0c320 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -294,6 +294,24 @@ static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg,
 	return pmbus_write_byte_data(client, page, reg, value);
 }
 
+/*
+ * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
+ * a device specific mapping function exists and calls it if necessary.
+ */
+static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	int status;
+
+	if (info->read_byte_data) {
+		status = info->read_byte_data(client, page, reg);
+		if (status != -ENODATA)
+			return status;
+	}
+	return pmbus_read_byte_data(client, page, reg);
+}
+
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command)
 {
@@ -301,7 +319,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 	int rv;
 	u8 to;
 
-	from = pmbus_read_byte_data(client, page,
+	from = _pmbus_read_byte_data(client, page,
 				    pmbus_fan_config_registers[id]);
 	if (from < 0)
 		return from;
@@ -408,7 +426,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 	unsigned int tmp;
 	int rv;
 
-	rv = pmbus_read_byte_data(client, page, reg);
+	rv = _pmbus_read_byte_data(client, page, reg);
 	if (rv < 0)
 		return rv;
 
@@ -421,24 +439,6 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
 
-/*
- * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
- * a device specific mapping function exists and calls it if necessary.
- */
-static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
-{
-	struct pmbus_data *data = i2c_get_clientdata(client);
-	const struct pmbus_driver_info *info = data->info;
-	int status;
-
-	if (info->read_byte_data) {
-		status = info->read_byte_data(client, page, reg);
-		if (status != -ENODATA)
-			return status;
-	}
-	return pmbus_read_byte_data(client, page, reg);
-}
-
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
 					      int reg)
 {
@@ -473,7 +473,7 @@ static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
 		return s->data;
 	}
 
-	config = pmbus_read_byte_data(client, page,
+	config = _pmbus_read_byte_data(client, page,
 				      pmbus_fan_config_registers[id]);
 	if (config < 0)
 		return config;
@@ -2414,7 +2414,7 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
 	int ret;
 
 	mutex_lock(&data->update_lock);
-	ret = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
 	mutex_unlock(&data->update_lock);
 
 	if (ret < 0)
@@ -2513,7 +2513,7 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
 		if (!(func & cat->func))
 			continue;
 
-		status = pmbus_read_byte_data(client, page, cat->reg);
+		status = _pmbus_read_byte_data(client, page, cat->reg);
 		if (status < 0) {
 			mutex_unlock(&data->update_lock);
 			return status;
-- 
2.30.2

