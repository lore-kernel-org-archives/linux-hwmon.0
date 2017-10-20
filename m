Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-db5eur01on0139.outbound.protection.outlook.com ([104.47.2.139]:60216
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752989AbdJTKk2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Oct 2017 06:40:28 -0400
From: Romain Porte <romain.porte@nokia.com>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Romain Porte <romain.porte@nokia.com>
Subject: [PATCH 2/2] pmbus: removed tps544c20 from generic pmbus driver
Date: Fri, 20 Oct 2017 12:39:16 +0200
Message-ID: <20171020103916.3309-3-romain.porte@nokia.com>
In-Reply-To: <20171020103916.3309-1-romain.porte@nokia.com>
References: <20171020103916.3309-1-romain.porte@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Since there is a new driver proposed with enhanced
features we need to remove support for tps544c20
from the generic pmbus driver.
---
 drivers/hwmon/pmbus/pmbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7718e58dbda5..aeea5c9e7a8b 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -212,7 +212,6 @@ static const struct i2c_device_id pmbus_id[] = {
 	{"tps40400", 1},
 	{"tps544b20", 1},
 	{"tps544b25", 1},
-	{"tps544c20", 1},
 	{"tps544c25", 1},
 	{"udt020", 1},
 	{}
-- 
2.11.0

