Return-path: <mahodar@alliedtelesis.co.nz>
From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>,
	Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: [PATCH v3]  lm87: Allow channel data to be set from dts file.
Date: Tue, 15 Nov 2016 17:00:06 +1300
Message-Id: <20161115040006.7435-1-mahoda.ratnayaka@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

 Currently there is no method for setting the channel
 value from the DTS file. When, the driver uses a dts
 file to initialize the driver platform_data is not set.
 As a the result channel variable may not be set correctly.

 Without the channel variable set correctly, some of the
 sensors will not be initialized correctly. For example
 temp3 sensor sysfs entries.

 This implements the schema agreed with the device tree
 binding document.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
---

Notes:
    changes since v1:
    Removed unncessary variables channel and np.
    Update the code as per review comments.
    
    changes since v2:
    Update the implementation to reflect the
    newly added lm87 binding document.
    https://patchwork.kernel.org/patch/9408433/

 drivers/hwmon/lm87.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index a5e2958..64ea57d4 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -858,8 +858,22 @@ static void lm87_remove_files(struct i2c_client *client)
 static void lm87_init_client(struct i2c_client *client)
 {
 	struct lm87_data *data = i2c_get_clientdata(client);
-
-	if (dev_get_platdata(&client->dev)) {
+	struct device_node *of_node = client->dev.of_node;
+	u8 val = 0;
+
+	if (of_node) {
+		if (of_property_read_bool(of_node, "has-temp3"))
+			val |= CHAN_TEMP3;
+		if (of_property_read_bool(of_node, "has-in6"))
+			val |= CHAN_NO_FAN(0);
+		if (of_property_read_bool(of_node, "has-in7"))
+			val |= CHAN_NO_FAN(1);
+		if (of_property_read_bool(of_node, "vcc-supply"))
+			val |= CHAN_VCC_5V;
+		data->channel = val;
+		lm87_write_value(client,
+				 LM87_REG_CHANNEL_MODE, data->channel);
+	} else if (dev_get_platdata(&client->dev)) {
 		data->channel = *(u8 *)dev_get_platdata(&client->dev);
 		lm87_write_value(client,
 				 LM87_REG_CHANNEL_MODE, data->channel);
-- 
2.10.2
