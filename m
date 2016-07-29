Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48089 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868AbcG2Vmy (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 29 Jul 2016 17:42:54 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3] hwmon: (ntc_thermistor) Use dev instead of &pdev->dev where possible
Date: Fri, 29 Jul 2016 14:42:43 -0700
Message-Id: <1469828564-21928-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1469828564-21928-1-git-send-email-linux@roeck-us.net>
References: <1469828564-21928-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Instead of repeatedly accessing &pdev->dev, use a local variable dev
instead where possible. Also drop 'dev' from private data since it is
unnecessary.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ntc_thermistor.c | 52 ++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 485701ca3609..6b2d5222521f 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -256,7 +256,6 @@ struct ntc_data {
 	struct device *hwmon_dev;
 	struct ntc_thermistor_platform_data *pdata;
 	const struct ntc_compensation *comp;
-	struct device *dev;
 	int n_comp;
 	char name[PLATFORM_NAME_SIZE];
 };
@@ -316,22 +315,22 @@ static const struct of_device_id ntc_match[] = {
 MODULE_DEVICE_TABLE(of, ntc_match);
 
 static struct ntc_thermistor_platform_data *
-ntc_thermistor_parse_dt(struct platform_device *pdev)
+ntc_thermistor_parse_dt(struct device *dev)
 {
 	struct iio_channel *chan;
 	enum iio_chan_type type;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev->of_node;
 	struct ntc_thermistor_platform_data *pdata;
 	int ret;
 
 	if (!np)
 		return NULL;
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	chan = devm_iio_channel_get(&pdev->dev, NULL);
+	chan = devm_iio_channel_get(dev, NULL);
 	if (IS_ERR(chan))
 		return ERR_CAST(chan);
 
@@ -361,7 +360,7 @@ ntc_thermistor_parse_dt(struct platform_device *pdev)
 }
 #else
 static struct ntc_thermistor_platform_data *
-ntc_thermistor_parse_dt(struct platform_device *pdev)
+ntc_thermistor_parse_dt(struct device *dev)
 {
 	return NULL;
 }
@@ -572,33 +571,34 @@ static const struct thermal_zone_of_device_ops ntc_of_thermal_ops = {
 static int ntc_thermistor_probe(struct platform_device *pdev)
 {
 	struct thermal_zone_device *tz;
+	struct device *dev = &pdev->dev;
 	const struct of_device_id *of_id =
-			of_match_device(of_match_ptr(ntc_match), &pdev->dev);
+			of_match_device(of_match_ptr(ntc_match), dev);
 	const struct platform_device_id *pdev_id;
 	struct ntc_thermistor_platform_data *pdata;
 	struct ntc_data *data;
 	int ret;
 
-	pdata = ntc_thermistor_parse_dt(pdev);
+	pdata = ntc_thermistor_parse_dt(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
 	else if (pdata == NULL)
-		pdata = dev_get_platdata(&pdev->dev);
+		pdata = dev_get_platdata(dev);
 
 	if (!pdata) {
-		dev_err(&pdev->dev, "No platform init data supplied.\n");
+		dev_err(dev, "No platform init data supplied.\n");
 		return -ENODEV;
 	}
 
 	/* Either one of the two is required. */
 	if (!pdata->read_uv && !pdata->read_ohm) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"Both read_uv and read_ohm missing. Need either one of the two.\n");
 		return -EINVAL;
 	}
 
 	if (pdata->read_uv && pdata->read_ohm) {
-		dev_warn(&pdev->dev,
+		dev_warn(dev,
 			 "Only one of read_uv and read_ohm is needed; ignoring read_uv.\n");
 		pdata->read_uv = NULL;
 	}
@@ -610,18 +610,16 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 				 NTC_CONNECTED_POSITIVE) ||
 				(pdata->connect != NTC_CONNECTED_POSITIVE &&
 				 pdata->connect != NTC_CONNECTED_GROUND))) {
-		dev_err(&pdev->dev,
-			"Required data to use read_uv not supplied.\n");
+		dev_err(dev, "Required data to use read_uv not supplied.\n");
 		return -EINVAL;
 	}
 
-	data = devm_kzalloc(&pdev->dev, sizeof(struct ntc_data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct ntc_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
 
-	data->dev = &pdev->dev;
 	data->pdata = pdata;
 	strlcpy(data->name, pdev_id->name, sizeof(data->name));
 
@@ -647,37 +645,37 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		data->n_comp = ARRAY_SIZE(ncpXXxh103);
 		break;
 	default:
-		dev_err(&pdev->dev, "Unknown device type: %lu(%s)\n",
+		dev_err(dev, "Unknown device type: %lu(%s)\n",
 				pdev_id->driver_data, pdev_id->name);
 		return -EINVAL;
 	}
 
 	platform_set_drvdata(pdev, data);
 
-	ret = sysfs_create_group(&data->dev->kobj, &ntc_attr_group);
+	ret = sysfs_create_group(&dev->kobj, &ntc_attr_group);
 	if (ret) {
-		dev_err(data->dev, "unable to create sysfs files\n");
+		dev_err(dev, "unable to create sysfs files\n");
 		return ret;
 	}
 
-	data->hwmon_dev = hwmon_device_register(data->dev);
+	data->hwmon_dev = hwmon_device_register(dev);
 	if (IS_ERR(data->hwmon_dev)) {
-		dev_err(data->dev, "unable to register as hwmon device.\n");
+		dev_err(dev, "unable to register as hwmon device.\n");
 		ret = PTR_ERR(data->hwmon_dev);
 		goto err_after_sysfs;
 	}
 
-	dev_info(&pdev->dev, "Thermistor type: %s successfully probed.\n",
-								pdev_id->name);
+	dev_info(dev, "Thermistor type: %s successfully probed.\n",
+		 pdev_id->name);
 
-	tz = devm_thermal_zone_of_sensor_register(data->dev, 0, data->dev,
+	tz = devm_thermal_zone_of_sensor_register(dev, 0, dev,
 						  &ntc_of_thermal_ops);
 	if (IS_ERR(tz))
-		dev_dbg(&pdev->dev, "Failed to register to thermal fw.\n");
+		dev_dbg(dev, "Failed to register to thermal fw.\n");
 
 	return 0;
 err_after_sysfs:
-	sysfs_remove_group(&data->dev->kobj, &ntc_attr_group);
+	sysfs_remove_group(&dev->kobj, &ntc_attr_group);
 	return ret;
 }
 
@@ -686,7 +684,7 @@ static int ntc_thermistor_remove(struct platform_device *pdev)
 	struct ntc_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
-	sysfs_remove_group(&data->dev->kobj, &ntc_attr_group);
+	sysfs_remove_group(&pdev->dev.kobj, &ntc_attr_group);
 
 	return 0;
 }
-- 
2.5.0

