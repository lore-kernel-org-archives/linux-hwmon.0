Return-path: <khoroshilov@ispras.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Marc Hulsman <m.hulsman@tudelft.nl>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] hwmon: (w83791d) Make use of hwmon_device_register_with_groups
Date: Sun,  5 Feb 2017 02:12:21 +0300
Message-Id: <1486249941-2142-1-git-send-email-khoroshilov@ispras.ru>
List-ID: <linux-hwmon@vger.kernel.org>

There is no remove of w83791d_group_fanpwm45 sysfs group.
Fix the problem by switching to hwmon_device_register_with_groups().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/hwmon/w83791d.c | 40 +++++++++++++++-------------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 001df856913f..14a19396785e 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -1211,7 +1211,7 @@ static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
 	&sda_temp_beep[X].dev_attr.attr,	\
 	&sda_temp_alarm[X].dev_attr.attr
 
-static struct attribute *w83791d_attributes[] = {
+static struct attribute *w83791d_attrs[] = {
 	IN_UNIT_ATTRS(0),
 	IN_UNIT_ATTRS(1),
 	IN_UNIT_ATTRS(2),
@@ -1248,16 +1248,14 @@ static struct attribute *w83791d_attributes[] = {
 	NULL
 };
 
-static const struct attribute_group w83791d_group = {
-	.attrs = w83791d_attributes,
-};
+ATTRIBUTE_GROUPS(w83791d);
 
 /*
  * Separate group of attributes for fan/pwm 4-5. Their pins can also be
  * in use for GPIO in which case their sysfs-interface should not be made
  * available
  */
-static struct attribute *w83791d_attributes_fanpwm45[] = {
+static struct attribute *w83791d_attrs_fanpwm45[] = {
 	FAN_UNIT_ATTRS(3),
 	FAN_UNIT_ATTRS(4),
 	&sda_pwm[3].dev_attr.attr,
@@ -1266,7 +1264,13 @@ static struct attribute *w83791d_attributes_fanpwm45[] = {
 };
 
 static const struct attribute_group w83791d_group_fanpwm45 = {
-	.attrs = w83791d_attributes_fanpwm45,
+	.attrs = w83791d_attrs_fanpwm45,
+};
+
+static const struct attribute_group *w83791d_groups_fanpwm45[] = {
+	&w83791d_group,
+	&w83791d_group_fanpwm45,
+	NULL
 };
 
 static int w83791d_detect_subclients(struct i2c_client *client)
@@ -1376,6 +1380,7 @@ static int w83791d_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	int i, err;
 	u8 has_fanpwm45;
+	const struct attribute_group **groups;
 
 #ifdef DEBUG
 	int val1;
@@ -1406,34 +1411,20 @@ static int w83791d_probe(struct i2c_client *client,
 	for (i = 0; i < NUMBER_OF_FANIN; i++)
 		data->fan_min[i] = w83791d_read(client, W83791D_REG_FAN_MIN[i]);
 
-	/* Register sysfs hooks */
-	err = sysfs_create_group(&client->dev.kobj, &w83791d_group);
-	if (err)
-		goto error3;
-
 	/* Check if pins of fan/pwm 4-5 are in use as GPIO */
 	has_fanpwm45 = w83791d_read(client, W83791D_REG_GPIO) & 0x10;
-	if (has_fanpwm45) {
-		err = sysfs_create_group(&client->dev.kobj,
-					 &w83791d_group_fanpwm45);
-		if (err)
-			goto error4;
-	}
+	groups = has_fanpwm45 ? w83791d_groups_fanpwm45 : w83791d_groups;
 
 	/* Everything is ready, now register the working device */
-	data->hwmon_dev = hwmon_device_register(dev);
+	data->hwmon_dev = hwmon_device_register_with_groups(dev, "w83791d",
+							    NULL, groups);
 	if (IS_ERR(data->hwmon_dev)) {
 		err = PTR_ERR(data->hwmon_dev);
-		goto error5;
+		goto error3;
 	}
 
 	return 0;
 
-error5:
-	if (has_fanpwm45)
-		sysfs_remove_group(&client->dev.kobj, &w83791d_group_fanpwm45);
-error4:
-	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
 error3:
 	if (data->lm75[0] != NULL)
 		i2c_unregister_device(data->lm75[0]);
@@ -1447,7 +1438,6 @@ static int w83791d_remove(struct i2c_client *client)
 	struct w83791d_data *data = i2c_get_clientdata(client);
 
 	hwmon_device_unregister(data->hwmon_dev);
-	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
 
 	if (data->lm75[0] != NULL)
 		i2c_unregister_device(data->lm75[0]);
-- 
2.7.4
