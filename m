Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C89C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 14:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348384AbiD1OoL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 10:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348532AbiD1OoB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 10:44:01 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6353121E38
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651156846;
  x=1682692846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PBT+qAMxdn8tI5YS0sTH/jXaSyAnUSMwjNgYkCTovPM=;
  b=HLbM5FbUL6oW+pBqEcN6qxHXcogpjavo1JK3MjiK2o4WvSmp85tILJtY
   saZiC8Ds4gubOPpPg2FN9m5RFIc1xxajjdtsTm6cppU6FubWgAq81yp6N
   njsnQhlasc1JrDz4/5FCsokgzvpJDd0fc5oH5CQq/Omd7Q2d8J+HnGwcy
   REnzoL/1+TAGyrPKU0pmh2V3sp6MDnAqzN+nzkwUlCEEMVJqTgXAV7uPh
   vozyV4tkEq+2SHaXV4RC4c4sojBvmN0pV0wZyRPq6De1pmZIU4WJ5dF79
   rXqEiliXYUfj9b/eBADCgoduboXSa+aJD7ridjkEIK7SPSH9nsxS5iZzW
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 1/4] hwmon: (pmbus) Introduce and use write_byte_data callback
Date:   Thu, 28 Apr 2022 16:40:36 +0200
Message-ID: <20220428144039.2464667-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220428144039.2464667-1-marten.lindahl@axis.com>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some of the pmbus core functions uses pmbus_write_byte_data, which does
not support driver callbacks for chip specific write operations. This
could potentially influence some specific regulator chips that for
example need a time delay before each data access.

Lets add support for driver callback with _pmbus_write_byte_data.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 24 +++++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

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
index b2618b1d529e..98da2db3f831 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -276,6 +276,24 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
 	return pmbus_write_word_data(client, page, reg, word);
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
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command)
 {
@@ -290,7 +308,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 
 	to = (from & ~mask) | (config & mask);
 	if (to != from) {
-		rv = pmbus_write_byte_data(client, page,
+		rv = _pmbus_write_byte_data(client, page,
 					   pmbus_fan_config_registers[id], to);
 		if (rv < 0)
 			return rv;
@@ -397,7 +415,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 	tmp = (rv & ~mask) | (value & mask);
 
 	if (tmp != rv)
-		rv = pmbus_write_byte_data(client, page, reg, tmp);
+		rv = _pmbus_write_byte_data(client, page, reg, tmp);
 
 	return rv;
 }
@@ -912,7 +930,7 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 
 	regval = status & mask;
 	if (regval) {
-		ret = pmbus_write_byte_data(client, page, reg, regval);
+		ret = _pmbus_write_byte_data(client, page, reg, regval);
 		if (ret)
 			goto unlock;
 	}
-- 
2.30.2

