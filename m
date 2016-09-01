Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:33237 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbcIAFR1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2016 01:17:27 -0400
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: adt7470: Allow faster removal
Date: Thu,  1 Sep 2016 17:17:21 +1200
Message-Id: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

adt7470_remove will wait for the update thread to complete before
returning. This has a worst-case time of up to the user-configurable
auto_update_interval.

Break this delay into smaller slices to allow the thread to exit quickly
when adt7470_remove is called.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/hwmon/adt7470.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 7d185a9..ba97392 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -268,14 +268,21 @@ static int adt7470_update_thread(void *p)
 {
 	struct i2c_client *client = p;
 	struct adt7470_data *data = i2c_get_clientdata(client);
+	unsigned long next_read = jiffies - 1;
 
 	while (!kthread_should_stop()) {
-		mutex_lock(&data->lock);
-		adt7470_read_temperatures(client, data);
-		mutex_unlock(&data->lock);
+
+		if (time_after_eq(jiffies, next_read)) {
+			next_read = jiffies + data->auto_update_interval * HZ / 1000;
+			mutex_lock(&data->lock);
+			adt7470_read_temperatures(client, data);
+			mutex_unlock(&data->lock);
+		}
+
+		msleep_interruptible(1);
+
 		if (kthread_should_stop())
 			break;
-		msleep_interruptible(data->auto_update_interval);
 	}
 
 	complete_all(&data->auto_update_stop);
-- 
2.9.0

