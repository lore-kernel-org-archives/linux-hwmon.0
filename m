Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3] hwmon: (ntc_thermistor) Use devm_hwmon_device_register_with_groups
Date: Fri, 29 Jul 2016 14:42:44 -0700
Message-Id: <1469828564-21928-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1469828564-21928-1-git-send-email-linux@roeck-us.net>
References: <1469828564-21928-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Simplify code, reduce code size, and drop remove function as no longer
needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ntc_thermistor.c | 57 +++++++-----------------------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 6b2d5222521f..c52d07c6b49f 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -253,11 +253,9 @@ static const struct ntc_compensation b57330v2103[] = {
 };
 
 struct ntc_data {
-	struct device *hwmon_dev;
 	struct ntc_thermistor_platform_data *pdata;
 	const struct ntc_compensation *comp;
 	int n_comp;
-	char name[PLATFORM_NAME_SIZE];
 };
 
 #if defined(CONFIG_OF) && IS_ENABLED(CONFIG_IIO)
@@ -508,9 +506,8 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
 	return -EINVAL;
 }
 
-static int ntc_read_temp(void *dev, int *temp)
+static int ntc_read_temp(void *data, int *temp)
 {
-	struct ntc_data *data = dev_get_drvdata(dev);
 	int ohm;
 
 	ohm = ntc_thermistor_get_ohm(data);
@@ -522,14 +519,6 @@ static int ntc_read_temp(void *dev, int *temp)
 	return 0;
 }
 
-static ssize_t ntc_show_name(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct ntc_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%s\n", data->name);
-}
-
 static ssize_t ntc_show_type(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -551,18 +540,13 @@ static ssize_t ntc_show_temp(struct device *dev,
 
 static SENSOR_DEVICE_ATTR(temp1_type, S_IRUGO, ntc_show_type, NULL, 0);
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ntc_show_temp, NULL, 0);
-static DEVICE_ATTR(name, S_IRUGO, ntc_show_name, NULL);
 
-static struct attribute *ntc_attributes[] = {
-	&dev_attr_name.attr,
+static struct attribute *ntc_attrs[] = {
 	&sensor_dev_attr_temp1_type.dev_attr.attr,
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	NULL,
 };
-
-static const struct attribute_group ntc_attr_group = {
-	.attrs = ntc_attributes,
-};
+ATTRIBUTE_GROUPS(ntc);
 
 static const struct thermal_zone_of_device_ops ntc_of_thermal_ops = {
 	.get_temp = ntc_read_temp,
@@ -576,8 +560,8 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 			of_match_device(of_match_ptr(ntc_match), dev);
 	const struct platform_device_id *pdev_id;
 	struct ntc_thermistor_platform_data *pdata;
+	struct device *hwmon_dev;
 	struct ntc_data *data;
-	int ret;
 
 	pdata = ntc_thermistor_parse_dt(dev);
 	if (IS_ERR(pdata))
@@ -621,7 +605,6 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
 
 	data->pdata = pdata;
-	strlcpy(data->name, pdev_id->name, sizeof(data->name));
 
 	switch (pdev_id->driver_data) {
 	case TYPE_NCPXXWB473:
@@ -650,43 +633,22 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	platform_set_drvdata(pdev, data);
-
-	ret = sysfs_create_group(&dev->kobj, &ntc_attr_group);
-	if (ret) {
-		dev_err(dev, "unable to create sysfs files\n");
-		return ret;
-	}
-
-	data->hwmon_dev = hwmon_device_register(dev);
-	if (IS_ERR(data->hwmon_dev)) {
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, pdev_id->name,
+							   data, ntc_groups);
+	if (IS_ERR(hwmon_dev)) {
 		dev_err(dev, "unable to register as hwmon device.\n");
-		ret = PTR_ERR(data->hwmon_dev);
-		goto err_after_sysfs;
+		return PTR_ERR(hwmon_dev);
 	}
 
 	dev_info(dev, "Thermistor type: %s successfully probed.\n",
 		 pdev_id->name);
 
-	tz = devm_thermal_zone_of_sensor_register(dev, 0, dev,
+	tz = devm_thermal_zone_of_sensor_register(dev, 0, data,
 						  &ntc_of_thermal_ops);
 	if (IS_ERR(tz))
 		dev_dbg(dev, "Failed to register to thermal fw.\n");
 
 	return 0;
-err_after_sysfs:
-	sysfs_remove_group(&dev->kobj, &ntc_attr_group);
-	return ret;
-}
-
-static int ntc_thermistor_remove(struct platform_device *pdev)
-{
-	struct ntc_data *data = platform_get_drvdata(pdev);
-
-	hwmon_device_unregister(data->hwmon_dev);
-	sysfs_remove_group(&pdev->dev.kobj, &ntc_attr_group);
-
-	return 0;
 }
 
 static struct platform_driver ntc_thermistor_driver = {
@@ -695,7 +657,6 @@ static struct platform_driver ntc_thermistor_driver = {
 		.of_match_table = of_match_ptr(ntc_match),
 	},
 	.probe = ntc_thermistor_probe,
-	.remove = ntc_thermistor_remove,
 	.id_table = ntc_thermistor_id,
 };
 
-- 
2.5.0
