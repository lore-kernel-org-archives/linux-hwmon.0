Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C5FC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 13:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbiD0NFm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 09:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiD0NFk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 09:05:40 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB403E5C5
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651064549;
  x=1682600549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edAWDpBtkHrJwK7icns+Ej6ugXbdr7nW5JJbYm9GTkE=;
  b=kl8OYN2fmCXXyjeosNu8PKGrBk/QUelzbidmpKviGy21x4ut5mpKhnzY
   0hf7ZsonPm4UminLpG8PtiGMxqgu4VRSww4eONqVEWiiG3DjvDgxJ48R/
   IaMJKta4KREP8JvwHB7knLfRlSKdfalWiOVsbzwH7yVdZy327JEHM1m9H
   WrVKK6tPi9wriglyh6US+sGvATIUBpqAaOSU/2YoCc0eLvxBhcOpCoD/C
   mSeoceo56I+3w0gVjdzoeqfaxE9j6mx/CW/2IZHJlNuFuPH4VjKFMnoI3
   Rd56ugVMBvhKWMRFz3FOKuOPDzreKTCkZ7AxwjyzlV8DG+6NcD8Wybh3+
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v3 1/3] hwmon: (pmbus) Use driver specific ops if they exist
Date:   Wed, 27 Apr 2022 15:02:11 +0200
Message-ID: <20220427130213.1557793-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427130213.1557793-1-marten.lindahl@axis.com>
References: <20220427130213.1557793-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pmbus drivers using the default pmbus_regulator_ops for the enable/
disable/is_enabled functions will use the standard pmbus core functions
pmbus_read/write_byte_data. This could potentially influence some
specific regulator chips that for example need a time delay before each
data access.

Lets add support for drivers to use chip specific read/write operations
when using the standard pmbus_regulator_ops.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 58 +++++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 20 deletions(-)

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

