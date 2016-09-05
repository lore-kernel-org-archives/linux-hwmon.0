Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39468 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754115AbcIEFgW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Sep 2016 01:36:22 -0400
From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (lm87) Add channel data from the dts file.
Date: Mon,  5 Sep 2016 17:36:14 +1200
Message-Id: <20160905053614.7135-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Currently there is no method for setting the channel
value from the DTS file. When, the driver uses a dts
file to initialize the driver platform_data is not set.
As a the result channel variable may not be set correctly.

Without the channel variable set correctly, some of the
sensors will not be initialized correctly. For example
temp3 sensor sysfs entries.

This adds the required functionality to set the channel
variable from the DTS file. This is done via reading the
reading a property named "channel" from the lm87 driver.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
---
 drivers/hwmon/lm87.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index a5e2958..ac0018b 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -858,14 +858,25 @@ static void lm87_remove_files(struct i2c_client *client)
 static void lm87_init_client(struct i2c_client *client)
 {
 	struct lm87_data *data = i2c_get_clientdata(client);
+	struct device_node *np = NULL;
+	const char *channel = NULL;
+	u8 val;
 
-	if (dev_get_platdata(&client->dev)) {
+	np = client->dev.of_node;
+
+	/* Use value read from the dts file to setup channel value. */
+	if (np && of_property_read_u8(np, "channels", &val) == 0) {
+		data->channel = val;
+		lm87_write_value(client,
+				 LM87_REG_CHANNEL_MODE, data->channel);
+	} else if (dev_get_platdata(&client->dev)) {
 		data->channel = *(u8 *)dev_get_platdata(&client->dev);
 		lm87_write_value(client,
 				 LM87_REG_CHANNEL_MODE, data->channel);
 	} else {
 		data->channel = lm87_read_value(client, LM87_REG_CHANNEL_MODE);
 	}
+
 	data->config = lm87_read_value(client, LM87_REG_CONFIG) & 0x6F;
 
 	if (!(data->config & 0x01)) {
-- 
2.9.3

