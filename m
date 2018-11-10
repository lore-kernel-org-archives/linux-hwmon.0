Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42473 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbeKJKZe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Nov 2018 05:25:34 -0500
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon (ina2xx) Fix NULL id pointer in probe()
Date: Fri,  9 Nov 2018 16:42:14 -0800
Message-Id: <20181110004214.13858-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

When using DT configurations, the id pointer might turn out to
be NULL. Then the driver encounters NULL pointer access:

  Unable to handle kernel read from unreadable memory at vaddr 00000018
  [...]
  PC is at ina2xx_probe+0x114/0x200
  LR is at ina2xx_probe+0x10c/0x200
  [...]
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

The reason is that i2c core returns the id pointer by matching
id_table with client->name, while the client->name is actually
using the name from the first string in the DT compatible list,
not the best one. So i2c core would fail to match the id_table
if the best matched compatible string isn't the first one, and
then would return a NULL id pointer.

This probably should be fixed in i2c core. But it doesn't hurt
to make the driver robust. So this patch fixes it by using the
"chip" that's added to unify both DT and non-DT configurations.

Additionally, since id pointer could be null, so as id->name:
  ina2xx 10-0047: power monitor (null) (Rshunt = 1000 uOhm)
  ina2xx 10-0048: power monitor (null) (Rshunt = 10000 uOhm)

So this patch also fixes NULL name pointer, using client->name
to play safe and to align with hwmon->name.

Fixes: bd0ddd4d0883 ("hwmon: (ina2xx) Add OF device ID table")
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/ina2xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 71d3445ba869..c2252cf452f5 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -491,7 +491,7 @@ static int ina2xx_probe(struct i2c_client *client,
 	}
 
 	data->groups[group++] = &ina2xx_group;
-	if (id->driver_data == ina226)
+	if (chip == ina226)
 		data->groups[group++] = &ina226_group;
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
@@ -500,7 +500,7 @@ static int ina2xx_probe(struct i2c_client *client,
 		return PTR_ERR(hwmon_dev);
 
 	dev_info(dev, "power monitor %s (Rshunt = %li uOhm)\n",
-		 id->name, data->rshunt);
+		 client->name, data->rshunt);
 
 	return 0;
 }
-- 
2.17.1
