Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43239 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750742AbdA1Dtz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Jan 2017 22:49:55 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Relax name attribute validation for new APIs
Date: Fri, 27 Jan 2017 19:49:49 -0800
Message-Id: <1485575389-31616-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

While invalid name attributes are really not desirable and do mess up
libsensors, enforcing valid names has the detrimental effect of driving
users away from using the new hardware monitoring API, especially those
registering name attributes violating the ABI restrictions. Another
undesirable side effect is that this violation and the resulting error
may only be discovered some time after a conversion to the new API,
which in turn may trigger a revert of that conversion.

To solve the problem, relax validation and only issue a warning instead
of returning an error if a name attribute violating the ABI is provided.
This lets callers continue to provide invalid name attributes while
notifying them about it.

Many thanks are due to Dmitry Torokhov for the idea.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index affff8195fff..53c54a81f7ad 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -544,9 +544,10 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	struct device *hdev;
 	int i, j, err, id;
 
-	/* Do not accept invalid characters in hwmon name attribute */
+	/* Complain about invalid characters in hwmon name attribute */
 	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
-		return ERR_PTR(-EINVAL);
+		dev_warn(dev, "hwmon: '%s' is not a valid name attribute\n",
+			 name);
 
 	id = ida_simple_get(&hwmon_ida, 0, 0, GFP_KERNEL);
 	if (id < 0)
-- 
2.7.4

