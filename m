Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:28750 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752368AbeAQSZL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Jan 2018 13:25:11 -0500
From: Luis de Bethencourt <luisbg@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Luis de Bethencourt <luisbg@kernel.org>
Subject: [PATCH] hwmon: (lm75) Fix trailing semicolon
Date: Wed, 17 Jan 2018 18:24:48 +0000
Message-Id: <20180117182448.16204-1-luisbg@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The trailing semicolon is an empty statement that does no operation.
Removing it since it doesn't do anything.

Signed-off-by: Luis de Bethencourt <luisbg@kernel.org>
---

Hi,

After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
suggested I fix it treewide [0].

Best regards 
Luis


[0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
[1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html

 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 005ffb5ffa92..49f4b33a5685 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -100,7 +100,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_chip_update_interval:
 			*val = data->sample_time;
-			break;;
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.15.1

