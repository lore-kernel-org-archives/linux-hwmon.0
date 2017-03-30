Return-path: <chrisp@alliedtelesis.co.nz>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org,
	linux@roeck-us.net
Cc: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] lm87: Allow channel data to be set from dts file
Date: Fri, 31 Mar 2017 12:01:00 +1300
Message-Id: <20170330230100.989-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170330230100.989-1-chris.packham@alliedtelesis.co.nz>
References: <20170330230100.989-1-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>

Currently there is no method for setting the channel
value from the DTS file. When, the driver uses a dts
file to initialize the driver platform_data is not set.
As a result channel variable may not be set correctly.

Without the channel variable set correctly, some of the
sensors will not be initialized correctly. For example
temp3 sensor sysfs entries.

This implements the schema agreed with the device tree
binding document.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
- Changes since v1:
  Removed unncessary variables channel and np.
  Update the code as per review comments.

- Changes since v2 (note v3 and v4 skipped):
  Use of_property_read_bool for flag properties (has-foo)
  Use regulator API and vcc-supply property to select 5V/3V3 scaling.

 drivers/hwmon/lm87.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index e06faf9d3f0f..04a7a1ddb030 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -66,6 +66,7 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/regulator/consumer.h>
 
 /*
  * Addresses to scan
@@ -855,8 +856,26 @@ static int lm87_init_client(struct i2c_client *client)
 {
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int rc;
-
-	if (dev_get_platdata(&client->dev)) {
+	struct device_node *of_node = client->dev.of_node;
+	u8 val = 0;
+	struct regulator *vcc = NULL;
+
+	if (of_node) {
+		if (of_property_read_bool(of_node, "has-temp3"))
+			val |= CHAN_TEMP3;
+		if (of_property_read_bool(of_node, "has-in6"))
+			val |= CHAN_NO_FAN(0);
+		if (of_property_read_bool(of_node, "has-in7"))
+			val |= CHAN_NO_FAN(1);
+		vcc = devm_regulator_get_optional(&client->dev, "vcc");
+		if (!IS_ERR(vcc)) {
+			if (regulator_get_voltage(vcc) == 5000000)
+				val |= CHAN_VCC_5V;
+		}
+		data->channel = val;
+		lm87_write_value(client,
+				LM87_REG_CHANNEL_MODE, data->channel);
+	} else if (dev_get_platdata(&client->dev)) {
 		data->channel = *(u8 *)dev_get_platdata(&client->dev);
 		lm87_write_value(client,
 				 LM87_REG_CHANNEL_MODE, data->channel);
-- 
2.11.0.24.ge6920cf
