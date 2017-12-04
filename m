Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hwmon: Deal with errors from the thermal subsystem
Date: Mon,  4 Dec 2017 23:20:29 +0100
Message-Id: <20171204222029.11956-1-linus.walleij@linaro.org>
List-ID: <linux-hwmon@vger.kernel.org>

If the thermal subsystem returne -EPROBE_DEFER or any other error
when hwmon calls devm_thermal_zone_of_sensor_register(), this is
silently ignored.

I ran into this with an incorrectly defined thermal zone, making
it non-existing and thus this call failed with -EPROBE_DEFER
assuming it would appear later. The sensor was still added
which is incorrect: sensors must strictly be added after the
thermal zones, so deferred probe must be respected.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/hwmon.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index c9790e2c3440..6d1cb6b47490 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -143,6 +143,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 				    struct hwmon_device *hwdev, int index)
 {
 	struct hwmon_thermal_data *tdata;
+	struct thermal_zone_device *tzd;
 
 	tdata = devm_kzalloc(dev, sizeof(*tdata), GFP_KERNEL);
 	if (!tdata)
@@ -151,8 +152,10 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 	tdata->hwdev = hwdev;
 	tdata->index = index;
 
-	devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
-					     &hwmon_thermal_ops);
+	tzd = devm_thermal_zone_of_sensor_register(&hwdev->dev, index, tdata,
+						   &hwmon_thermal_ops);
+	if (IS_ERR(tzd))
+		return PTR_ERR(tzd);
 
 	return 0;
 }
@@ -621,14 +624,20 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 				if (!chip->ops->is_visible(drvdata, hwmon_temp,
 							   hwmon_temp_input, j))
 					continue;
-				if (info[i]->config[j] & HWMON_T_INPUT)
-					hwmon_thermal_add_sensor(dev, hwdev, j);
+				if (info[i]->config[j] & HWMON_T_INPUT) {
+					err = hwmon_thermal_add_sensor(dev,
+								hwdev, j);
+					if (err)
+						goto free_device;
+				}
 			}
 		}
 	}
 
 	return hdev;
 
+free_device:
+	device_unregister(hdev);
 free_hwmon:
 	kfree(hwdev);
 ida_remove:
-- 
2.14.3
