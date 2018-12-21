Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:60156 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387647AbeLUTKs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Dec 2018 14:10:48 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id BA1CDD1F
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Dec 2018 19:10:46 +0000 (UTC)
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kKYas7jvlJyi for <linux-hwmon@vger.kernel.org>;
        Fri, 21 Dec 2018 13:10:46 -0600 (CST)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 874CDC26
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Dec 2018 13:10:46 -0600 (CST)
Received: by mail-io1-f70.google.com with SMTP id w5so5476450iom.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Dec 2018 11:10:46 -0800 (PST)
From: Kangjie Lu <kjlu@umn.edu>
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm80) fix a missing check of bus read in lm80 probe
Date: Fri, 21 Dec 2018 13:10:39 -0600
Message-Id: <20181221191039.1519-1-kjlu@umn.edu>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

In lm80_probe(), if lm80_read_value() fails, it returns a negative
error number which is stored to data->fan[f_min] and will be further
used. We should avoid using the data if the read fails.

The fix checks if lm80_read_value() fails, and if so, returns with the
error number.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/hwmon/lm80.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index d91333557f04..85f797501aaf 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -627,6 +627,7 @@ static int lm80_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm80_data *data;
+	int rv;
 
 	data = devm_kzalloc(dev, sizeof(struct lm80_data), GFP_KERNEL);
 	if (!data)
@@ -639,8 +640,14 @@ static int lm80_probe(struct i2c_client *client,
 	lm80_init_client(client);
 
 	/* A few vars need to be filled upon startup */
-	data->fan[f_min][0] = lm80_read_value(client, LM80_REG_FAN_MIN(1));
-	data->fan[f_min][1] = lm80_read_value(client, LM80_REG_FAN_MIN(2));
+	rv = lm80_read_value(client, LM80_REG_FAN_MIN(1));
+	if (rv < 0)
+		return rv;
+	data->fan[f_min][0] = rv;
+	rv = lm80_read_value(client, LM80_REG_FAN_MIN(2));
+	if (rv < 0)
+		return rv;
+	data->fan[f_min][1] = rv;
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, lm80_groups);
-- 
2.17.1
