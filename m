Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C800BC606B0
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB314214AF
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfGIJvH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 05:51:07 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:53286 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGIJvH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 05:51:07 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkmm5-00066h-FC; Tue, 09 Jul 2019 10:51:01 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hkmm5-00025W-2d; Tue, 09 Jul 2019 10:51:01 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH v1 4/5] hwmon: (lm75) Create function from code to write into registers
Date:   Tue,  9 Jul 2019 10:50:51 +0100
Message-Id: <20190709095052.7964-5-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709095052.7964-1-iker.perez@codethink.co.uk>
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

This function will be needed later to configure update_interval

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 drivers/hwmon/lm75.c | 63 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 1d4d060bd695..5ba7277dac69 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -78,6 +78,40 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 	return ((temp >> (16 - resolution)) * 1000) >> (resolution - 8);
 }
 
+static void lm75_remove(void *data)
+{
+	struct lm75_data *lm75 = data;
+	struct i2c_client *client = lm75->client;
+
+	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
+}
+static int configure_reg(u8 set_mask, u8 clr_mask, struct lm75_data *data,
+		struct i2c_client *client)
+{
+	int status, err, new;
+	struct device *dev = &client->dev;
+
+	/* configure as specified */
+	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
+	if (status < 0) {
+		dev_dbg(dev, "Can't read config? %d\n", status);
+		return status;
+	}
+	data->orig_conf = status;
+	new = status & ~clr_mask;
+	new |= set_mask;
+	if (status != new)
+		i2c_smbus_write_byte_data(client, LM75_REG_CONF, new);
+
+	err = devm_add_action_or_reset(dev, lm75_remove, data);
+	if (err)
+		return err;
+
+	dev_dbg(dev, "Config %02x\n", new);
+
+	return 0;
+}
+
 static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 		     u32 attr, int channel, long *val)
 {
@@ -238,14 +272,6 @@ static const struct regmap_config lm75_regmap_config = {
 	.use_single_write = true,
 };
 
-static void lm75_remove(void *data)
-{
-	struct lm75_data *lm75 = data;
-	struct i2c_client *client = lm75->client;
-
-	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
-}
-
 static int
 lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
@@ -253,9 +279,8 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	struct device *hwmon_dev;
 	struct lm75_data *data;
 	struct lm75_data device_data;
-	int status, err;
+	int status;
 	u8 set_mask, clr_mask;
-	int new;
 
 	data = &device_data;
 	if (client->dev.of_node)
@@ -370,23 +395,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		break;
 	}
 
-	/* configure as specified */
-	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
-	if (status < 0) {
-		dev_dbg(dev, "Can't read config? %d\n", status);
-		return status;
-	}
-	data->orig_conf = status;
-	new = status & ~clr_mask;
-	new |= set_mask;
-	if (status != new)
-		i2c_smbus_write_byte_data(client, LM75_REG_CONF, new);
-
-	err = devm_add_action_or_reset(dev, lm75_remove, data);
-	if (err)
-		return err;
-
-	dev_dbg(dev, "Config %02x\n", new);
+	status = configure_reg(set_mask, clr_mask, data, client);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &lm75_chip_info,
-- 
2.11.0

