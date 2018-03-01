Return-Path: <peng.hao2@zte.com.cn>
Return-path: <peng.hao2@zte.com.cn>
From: Peng Hao <peng.hao2@zte.com.cn>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH v2] hwmon: g762: handle cleanup with devm_add_action
Date: Thu, 1 Mar 2018 19:03:22 +0800
Message-Id: <1519902202-80883-1-git-send-email-peng.hao2@zte.com.cn>
List-ID: <linux-hwmon@vger.kernel.org>

Simplify code and use devm_add_action() to handle cleanup.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/hwmon/g762.c | 43 +++++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 6d1208b..49046b4 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -128,7 +128,6 @@ enum g762_regs {
 			 G762_REG_FAN_CMD2_GEAR_MODE_1)) >> 2))
 
 struct g762_data {
-	struct device *hwmon_dev;
 	struct i2c_client *client;
 	struct clk *clk;
 
@@ -174,6 +173,9 @@ struct g762_data {
 		      */
 };
 
+static void g762_remove(void *data);
+
+
 /*
  * Convert count value from fan controller register (FAN_SET_CNT) into fan
  * speed RPM value. Note that the datasheet documents a basic formula;
@@ -626,6 +628,7 @@ static int g762_of_clock_enable(struct i2c_client *client)
 	data = i2c_get_clientdata(client);
 	data->clk = clk;
 
+	devm_add_action(&client->dev, g762_remove, data);
 	return 0;
 
  clk_unprep:
@@ -1051,9 +1054,17 @@ static inline int g762_fan_init(struct device *dev)
 					 data->fan_cmd1);
 }
 
+static void g762_remove(void *data)
+{
+	struct g762_data *g762 = data;
+
+	g762_of_clock_disable(g762->client);
+}
+
 static int g762_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
 	struct g762_data *data;
 	int ret;
 
@@ -1080,35 +1091,16 @@ static int g762_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 	ret = g762_of_prop_import(client);
 	if (ret)
-		goto clock_dis;
+		return ret;
 	/* ... or platform_data */
 	ret = g762_pdata_prop_import(client);
 	if (ret)
-		goto clock_dis;
+		return ret;
 
-	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							    data, g762_groups);
-	if (IS_ERR(data->hwmon_dev)) {
-		ret = PTR_ERR(data->hwmon_dev);
-		goto clock_dis;
-	}
-
-	return 0;
-
- clock_dis:
-	g762_of_clock_disable(client);
-
-	return ret;
-}
-
-static int g762_remove(struct i2c_client *client)
-{
-	struct g762_data *data = i2c_get_clientdata(client);
-
-	hwmon_device_unregister(data->hwmon_dev);
-	g762_of_clock_disable(client);
-
-	return 0;
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static struct i2c_driver g762_driver = {
@@ -1117,7 +1109,6 @@ static int g762_remove(struct i2c_client *client)
 		.of_match_table = of_match_ptr(g762_dt_match),
 	},
 	.probe	  = g762_probe,
-	.remove	  = g762_remove,
 	.id_table = g762_id,
 };
 
-- 
1.8.3.1
