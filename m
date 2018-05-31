Return-Path: <bastiangermann@fishpost.de>
Return-path: <bastiangermann@fishpost.de>
From: Bastian Germann <bastiangermann@fishpost.de>
To: Luca Tettamanti <kronos.it@gmail.com>
Cc: Bastian Germann <bastiangermann@fishpost.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus_atk0110) Remove unused manual sysfs file management
Date: Thu, 31 May 2018 16:01:36 +0200
Message-Id: <20180531140136.13969-2-bastiangermann@fishpost.de>
In-Reply-To: <20180531140136.13969-1-bastiangermann@fishpost.de>
References: <20180531140136.13969-1-bastiangermann@fishpost.de>
List-ID: <linux-hwmon@vger.kernel.org>

Remove the manual sysfs file creation and deletion that are now taken care
of by the (un)register calls via an attribute_group array.

Signed-off-by: Bastian Germann <bastiangermann@fishpost.de>
---
 drivers/hwmon/asus_atk0110.c | 46 ------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index 8a35fb27ff50..2f4955ec8437 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -263,14 +263,6 @@ static ssize_t atk_limit2_show(struct device *dev,
 	return sprintf(buf, "%lld\n", value);
 }
 
-static ssize_t atk_name_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	return sprintf(buf, "atk0110\n");
-}
-static struct device_attribute atk_name_attr =
-		__ATTR(name, 0444, atk_name_show, NULL);
-
 static void atk_init_attribute(struct device_attribute *attr, char *name,
 		sysfs_show_func show)
 {
@@ -1194,44 +1186,6 @@ static int atk_enumerate_new_hwmon(struct atk_data *data)
 	return err;
 }
 
-static int atk_create_files(struct atk_data *data)
-{
-	struct atk_sensor_data *s;
-	int err;
-
-	list_for_each_entry(s, &data->sensor_list, list) {
-		err = device_create_file(data->hwmon_dev, &s->input_attr);
-		if (err)
-			return err;
-		err = device_create_file(data->hwmon_dev, &s->label_attr);
-		if (err)
-			return err;
-		err = device_create_file(data->hwmon_dev, &s->limit1_attr);
-		if (err)
-			return err;
-		err = device_create_file(data->hwmon_dev, &s->limit2_attr);
-		if (err)
-			return err;
-	}
-
-	err = device_create_file(data->hwmon_dev, &atk_name_attr);
-
-	return err;
-}
-
-static void atk_remove_files(struct atk_data *data)
-{
-	struct atk_sensor_data *s;
-
-	list_for_each_entry(s, &data->sensor_list, list) {
-		device_remove_file(data->hwmon_dev, &s->input_attr);
-		device_remove_file(data->hwmon_dev, &s->label_attr);
-		device_remove_file(data->hwmon_dev, &s->limit1_attr);
-		device_remove_file(data->hwmon_dev, &s->limit2_attr);
-	}
-	device_remove_file(data->hwmon_dev, &atk_name_attr);
-}
-
 static void atk_free_sensors(struct atk_data *data)
 {
 	struct list_head *head = &data->sensor_list;
-- 
2.17.1
