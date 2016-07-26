Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35747 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756077AbcGZPT7 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 26 Jul 2016 11:19:59 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (lm75) Improve error handling
Date: Tue, 26 Jul 2016 08:19:46 -0700
Message-Id: <1469546388-29907-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1469546388-29907-1-git-send-email-linux@roeck-us.net>
References: <1469546388-29907-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use devm_add_action_or_reset() instead of devm_add_action(), and
check its return value.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 547a9c87c68c..92f9d4bbf597 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -220,7 +220,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm75_data *data;
-	int status;
+	int status, err;
 	u8 set_mask, clr_mask;
 	int new;
 	enum lm75_type kind = id->driver_data;
@@ -331,7 +331,9 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (status != new)
 		i2c_smbus_write_byte_data(client, LM75_REG_CONF, new);
 
-	devm_add_action(dev, lm75_remove, data);
+	err = devm_add_action_or_reset(dev, lm75_remove, data);
+	if (err)
+		return err;
 
 	dev_dbg(dev, "Config %02x\n", new);
 
-- 
2.5.0

