Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mxhk.zte.com.cn ([63.217.80.70]:48066 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966279AbeCAGfl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 1 Mar 2018 01:35:41 -0500
From: Peng Hao <peng.hao2@zte.com.cn>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH v3] hwmon: g762: handle cleanup with devm_add_action
Date: Thu, 1 Mar 2018 22:48:30 +0800
Message-Id: <1519915710-82397-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Simplify code and use devm_add_action() to handle cleanup.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/hwmon/g762.c | 58 +++++++++++++++++-----------------------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 6d1208b..0f2d468 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -128,7 +128,6 @@ enum g762_regs {
 			 G762_REG_FAN_CMD2_GEAR_MODE_1)) >> 2))
 
 struct g762_data {
-	struct device *hwmon_dev;
 	struct i2c_client *client;
 	struct clk *clk;
 
@@ -594,6 +593,17 @@ static int do_set_fan_startv(struct device *dev, unsigned long val)
  * call to g762_of_clock_disable(). Note that a reference to clock is kept
  * in our private data structure to be used in this function.
  */
+static void g762_of_clock_disable(void *data)
+{
+	struct g762_data *g762 = data;
+
+	if (!g762->clk)
+		return;
+
+	clk_disable_unprepare(g762->clk);
+	clk_put(g762->clk);
+}
+
 static int g762_of_clock_enable(struct i2c_client *client)
 {
 	struct g762_data *data;
@@ -625,7 +635,8 @@ static int g762_of_clock_enable(struct i2c_client *client)
 
 	data = i2c_get_clientdata(client);
 	data->clk = clk;
-
+
+	devm_add_action(&client->dev, g762_of_clock_disable, data);
 	return 0;
 
  clk_unprep:
@@ -637,17 +648,6 @@ static int g762_of_clock_enable(struct i2c_client *client)
 	return ret;
 }
 
-static void g762_of_clock_disable(struct i2c_client *client)
-{
-	struct g762_data *data = i2c_get_clientdata(client);
-
-	if (!data->clk)
-		return;
-
-	clk_disable_unprepare(data->clk);
-	clk_put(data->clk);
-}
-
 static int g762_of_prop_import_one(struct i2c_client *client,
 				   const char *pname,
 				   int (*psetter)(struct device *dev,
@@ -699,7 +699,7 @@ static int g762_of_clock_enable(struct i2c_client *client)
 	return 0;
 }
 
-static void g762_of_clock_disable(struct i2c_client *client) { }
+static void g762_of_clock_disable(void *data) { }
 #endif
 
 /*
@@ -1054,6 +1054,7 @@ static inline int g762_fan_init(struct device *dev)
 static int g762_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
 	struct g762_data *data;
 	int ret;
 
@@ -1080,35 +1081,15 @@ static int g762_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
+	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static struct i2c_driver g762_driver = {
@@ -1117,7 +1098,6 @@ static int g762_remove(struct i2c_client *client)
 		.of_match_table = of_match_ptr(g762_dt_match),
 	},
 	.probe	  = g762_probe,
-	.remove	  = g762_remove,
 	.id_table = g762_id,
 };
 
-- 
1.8.3.1

