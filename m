Return-path: <joshuas@alliedtelesis.co.nz>
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: adt7470: Allow faster removal
Date: Wed,  7 Sep 2016 10:49:38 +1200
Message-Id: <20160906224938.6640-1-joshua.scott@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

adt7470_remove will wait for the update thread to complete before
returning. This had a worst-case time of up to the user-configurable
auto_update_interval.

Replace msleep_interruptible with set_current_state and schedule_timeout
so that kthread_stop will interrupt the sleep.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/hwmon/adt7470.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 7d185a9..e93c528 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -273,9 +273,12 @@ static int adt7470_update_thread(void *p)
 		mutex_lock(&data->lock);
 		adt7470_read_temperatures(client, data);
 		mutex_unlock(&data->lock);
+
+		set_current_state(TASK_INTERRUPTIBLE);
 		if (kthread_should_stop())
 			break;
-		msleep_interruptible(data->auto_update_interval);
+
+		schedule_timeout(data->auto_update_interval * HZ / 1000);
 	}
 
 	complete_all(&data->auto_update_stop);
-- 
2.9.0
