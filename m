Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60144 "EHLO
	mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751999AbcGYGLP (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 25 Jul 2016 02:11:15 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiri@resnulli.us,
	Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch] hwmon: (pmbus) Add explicit support for DPS-460, DPS-800, and SGD009
Date: Mon, 25 Jul 2016 08:10:29 +0000
Message-Id: <1469434229-162391-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
SGD009 from Acbel Polytech, INC.
These devices do not support the STATUS_CML register, and reports a
communication error in response to this command.
For this reason, the status register check is disabled for these controllers.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Reviewed-by: Jiri Pirko <jiri@mellanox.com>
---
 drivers/hwmon/pmbus/pmbus.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 0a74991..f28de37 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
+#include <linux/i2c/pmbus.h>
 #include "pmbus.h"
 
 /*
@@ -167,14 +168,27 @@ static int pmbus_probe(struct i2c_client *client,
 		       const struct i2c_device_id *id)
 {
 	struct pmbus_driver_info *info;
+	struct pmbus_platform_data *pdata = NULL;
+	struct device *dev = &client->dev;
 
 	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
 			    GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
+	if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
+	    !strcmp(id->name, "sgd009")) {
+		pdata = devm_kzalloc(&client->dev,
+				     sizeof(struct pmbus_platform_data),
+				     GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+
+		pdata->flags = PMBUS_SKIP_STATUS_CHECK;
+	}
 
 	info->pages = id->driver_data;
 	info->identify = pmbus_identify;
+	dev->platform_data = pdata;
 
 	return pmbus_do_probe(client, id, info);
 }
@@ -186,6 +200,8 @@ static const struct i2c_device_id pmbus_id[] = {
 	{"adp4000", 1},
 	{"bmr453", 1},
 	{"bmr454", 1},
+	{"dps460", 1},
+	{"dps800", 1},
 	{"mdt040", 1},
 	{"ncp4200", 1},
 	{"ncp4208", 1},
@@ -193,6 +209,7 @@ static const struct i2c_device_id pmbus_id[] = {
 	{"pdt006", 1},
 	{"pdt012", 1},
 	{"pmbus", 0},
+	{"sgd009", 1},
 	{"tps40400", 1},
 	{"tps544b20", 1},
 	{"tps544b25", 1},
-- 
2.1.4

