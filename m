Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:55024 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbeHNMBR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Aug 2018 08:01:17 -0400
Date: Tue, 14 Aug 2018 12:14:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jean Delvare <jdelvare@suse.com>,
        Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (adt7475) Remove some unnecessary checks
Message-ID: <20180814091432.xhdmxd7aqbz2si4k@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180814091236.zubxfj32bedobr52@kili.mountain>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The adt7475_read_word() returns u16 values, so it's impossible for
"ret" to be negative.  The check is harmless, but static checkers
complain about it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 16045149f3db..9d3da8ea38ba 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1492,10 +1492,7 @@ static int adt7475_update_limits(struct i2c_client *client)
 	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
 		if (i == 3 && !data->has_fan4)
 			continue;
-		ret = adt7475_read_word(client, TACH_MIN_REG(i));
-		if (ret < 0)
-			return ret;
-		data->tach[MIN][i] = ret;
+		data->tach[MIN][i] = adt7475_read_word(client, TACH_MIN_REG(i));
 	}
 
 	for (i = 0; i < ADT7475_PWM_COUNT; i++) {
@@ -1881,10 +1878,7 @@ static int adt7475_update_measure(struct device *dev)
 	for (i = 0; i < ADT7475_TACH_COUNT; i++) {
 		if (i == 3 && !data->has_fan4)
 			continue;
-		ret = adt7475_read_word(client, TACH_REG(i));
-		if (ret < 0)
-			return ret;
-		data->tach[INPUT][i] = ret;
+		data->tach[INPUT][i] = adt7475_read_word(client, TACH_REG(i));
 	}
 
 	/* Updated by hw when in auto mode */
