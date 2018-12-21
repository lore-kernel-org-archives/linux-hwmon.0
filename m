Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:42458 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729609AbeLUTBn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Dec 2018 14:01:43 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 5EBCDD67
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Dec 2018 19:01:41 +0000 (UTC)
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tO3VzL60U8YT for <linux-hwmon@vger.kernel.org>;
        Fri, 21 Dec 2018 13:01:41 -0600 (CST)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 30B61BA6
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Dec 2018 13:01:41 -0600 (CST)
Received: by mail-io1-f69.google.com with SMTP id t133so5288417iof.20
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Dec 2018 11:01:41 -0800 (PST)
From: Kangjie Lu <kjlu@umn.edu>
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm80) fix a missing check of the status of SMBus read
Date: Fri, 21 Dec 2018 13:01:33 -0600
Message-Id: <20181221190134.930-1-kjlu@umn.edu>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If lm80_read_value() fails, it returns a negative number instead of the
correct read data. Therefore, we should avoid using the data if it
fails.

The fix checks if lm80_read_value() fails, and if so, returns with the
error number.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/hwmon/lm80.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 08e3945a6fbf..d91333557f04 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -360,6 +360,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = data->client;
 	unsigned long min, val;
 	u8 reg;
+	int rv;
 	int err = kstrtoul(buf, 10, &val);
 	if (err < 0)
 		return err;
@@ -390,8 +391,11 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
-	reg = (lm80_read_value(client, LM80_REG_FANDIV) &
-	       ~(3 << (2 * (nr + 1)))) | (data->fan_div[nr] << (2 * (nr + 1)));
+	rv = lm80_read_value(client, LM80_REG_FANDIV);
+	if (rv < 0)
+		return rv;
+	reg = (rv & ~(3 << (2 * (nr + 1))))
+	    | (data->fan_div[nr] << (2 * (nr + 1)));
 	lm80_write_value(client, LM80_REG_FANDIV, reg);
 
 	/* Restore fan_min */
-- 
2.17.1
