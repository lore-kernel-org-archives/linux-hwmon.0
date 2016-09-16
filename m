Return-path: <wagi@monom.org>
From: Daniel Wagner <wagi@monom.org>
To: linux-kernel@vger.kernel.org
Cc: Daniel Wagner <daniel.wagner@bmw-carit.de>,
	"Darrick J . Wong" <djwong@us.ibm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (adt7470) No need for additional synchronization on kthread_stop()
Date: Fri, 16 Sep 2016 10:07:36 +0200
Message-Id: <1474013256-9996-1-git-send-email-wagi@monom.org>
List-ID: <linux-hwmon@vger.kernel.org>

From: Daniel Wagner <daniel.wagner@bmw-carit.de>

The kthread_stop() waits for the thread to exit. There is no need for an
additional synchronization needed to join on the kthread.

The completation was added by 89fac11cb3e7 ("adt7470: make automatic fan
control really work").

Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: Darrick J. Wong <djwong@us.ibm.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7470.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index f5da39a..f5d618c 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -170,7 +170,6 @@ struct adt7470_data {
 	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
 
 	struct task_struct	*auto_update;
-	struct completion	auto_update_stop;
 	unsigned int		auto_update_interval;
 };
 
@@ -271,7 +270,6 @@ static int adt7470_update_thread(void *p)
 		msleep_interruptible(data->auto_update_interval);
 	}
 
-	complete_all(&data->auto_update_stop);
 	return 0;
 }
 
@@ -1256,7 +1254,6 @@ static int adt7470_probe(struct i2c_client *client,
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	init_completion(&data->auto_update_stop);
 	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",
 					dev_name(hwmon_dev));
 	if (IS_ERR(data->auto_update)) {
@@ -1271,7 +1268,6 @@ static int adt7470_remove(struct i2c_client *client)
 	struct adt7470_data *data = i2c_get_clientdata(client);
 
 	kthread_stop(data->auto_update);
-	wait_for_completion(&data->auto_update_stop);
 	return 0;
 }
 
-- 
2.7.4
