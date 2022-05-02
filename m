Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CCBC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 11:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384676AbiEBLRV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 07:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384678AbiEBLRU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 07:17:20 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2145EB1F6
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651490032;
  x=1683026032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MGqSKsspLACjE5LANc6kRbTEa7R5JgCSRXeuNkwFVYA=;
  b=Ic4J9/ueoTJaVSnCTMun+YY6nlDuNF/+/F9xIdgrUPriOiu8kFMH6pkC
   YILzkngm7Wdlqwu42gxMUD3G9dXjE6LV807i32rCIpqa5nnQ+QgPr+uM8
   8mX4nOhv7IqWaL490EIAjz8RdgVrVzBuplcuyhKnwgLIU6Hpg8KtNG/VX
   dL3cD9DKBQ0tPvqL5c/GUZqJwkiwQLUrPvVQ7UqHBkYmbEFD6CxxrlOXf
   aysMZd1q5oFAn+CmZNv0TGJdnw6NdK1Nwhzb/kn8mDgTC2PRRPDko8VFY
   Sq6Wa9LNnvzFV5HSUGB3Bfim7IJxk7ha0xKWwSxigZ1yVh22s0B2lzNM3
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v5 2/4] hwmon: (pmbus) Use _pmbus_read_byte_data with callback
Date:   Mon, 2 May 2022 13:13:43 +0200
Message-ID: <20220502111345.3100970-3-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502111345.3100970-1-marten.lindahl@axis.com>
References: <20220502111345.3100970-1-marten.lindahl@axis.com>
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

