Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiri@resnulli.us,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [bd47e298a86a7d5547da1e64b134cfaa5d090526] Disable PMBus status check for DPS400 PSU controller
Date: Thu, 21 Jul 2016 13:24:00 +0000
Message-Id: <1469107440-72136-1-git-send-email-vadimp@mellanox.com>
List-ID: <linux-hwmon@vger.kernel.org>

pmbus/dps400: disable PMBus status check through platform data structure to
provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
SGD009 from Acbel Polytech, INC.
These devices do not support the STATUS_CML register, and reports communication
error in response to this command.
For this reason for these controllers, the status register check is disabled.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Reviewed-by: Jiri Pirko <jiri@mellanox.com>
---
 drivers/hwmon/pmbus/pmbus.c      | 16 ++++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 0a74991..44c736a 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
+#include <linux/i2c/pmbus.h>
 #include "pmbus.h"
 
 /*
@@ -167,14 +168,26 @@ static int pmbus_probe(struct i2c_client *client,
 		       const struct i2c_device_id *id)
 {
 	struct pmbus_driver_info *info;
+	struct pmbus_platform_data *pdata = NULL;
+	struct device *dev = &client->dev;
 
 	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
 			    GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
+	if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps460") ||
+	    !strcmp(id->name, "sgd009")) {
+		pdata = kzalloc(sizeof(struct pmbus_platform_data), GFP_KERNEL);
+		if (!pdata) {
+			kfree(info);
+			return -ENOMEM;
+		}
+		pdata->flags = PMBUS_SKIP_STATUS_CHECK;
+	}
 
 	info->pages = id->driver_data;
 	info->identify = pmbus_identify;
+	dev->platform_data = pdata;
 
 	return pmbus_do_probe(client, id, info);
 }
@@ -199,6 +212,9 @@ static const struct i2c_device_id pmbus_id[] = {
 	{"tps544c20", 1},
 	{"tps544c25", 1},
 	{"udt020", 1},
+	{"dps460", 1},
+	{"dps800", 1},
+	{"sgd009", 1},
 	{}
 };
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ba59eae..3d98070 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1931,8 +1931,11 @@ EXPORT_SYMBOL_GPL(pmbus_do_probe);
 int pmbus_do_remove(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_platform_data *pdata =
+				dev_get_platdata(&client->dev);
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
+	kfree(pdata);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
-- 
2.1.4
