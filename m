Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3] hwmon: (ntc_thermistor) Use devm_iio_channel_get
Date: Fri, 29 Jul 2016 14:42:42 -0700
Message-Id: <1469828564-21928-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Use devm_iio_channel_get() instead of iio_channel_get to simplify error
handling and device removal.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ntc_thermistor.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index 8ef7b713cb1a..485701ca3609 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -331,7 +331,7 @@ ntc_thermistor_parse_dt(struct platform_device *pdev)
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	chan = iio_channel_get(&pdev->dev, NULL);
+	chan = devm_iio_channel_get(&pdev->dev, NULL);
 	if (IS_ERR(chan))
 		return ERR_CAST(chan);
 
@@ -359,11 +359,6 @@ ntc_thermistor_parse_dt(struct platform_device *pdev)
 
 	return pdata;
 }
-static void ntc_iio_channel_release(struct ntc_thermistor_platform_data *pdata)
-{
-	if (pdata->chan)
-		iio_channel_release(pdata->chan);
-}
 #else
 static struct ntc_thermistor_platform_data *
 ntc_thermistor_parse_dt(struct platform_device *pdev)
@@ -373,8 +368,6 @@ ntc_thermistor_parse_dt(struct platform_device *pdev)
 
 #define ntc_match	NULL
 
-static void ntc_iio_channel_release(struct ntc_thermistor_platform_data *pdata)
-{ }
 #endif
 
 static inline u64 div64_u64_safe(u64 dividend, u64 divisor)
@@ -685,18 +678,15 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	return 0;
 err_after_sysfs:
 	sysfs_remove_group(&data->dev->kobj, &ntc_attr_group);
-	ntc_iio_channel_release(pdata);
 	return ret;
 }
 
 static int ntc_thermistor_remove(struct platform_device *pdev)
 {
 	struct ntc_data *data = platform_get_drvdata(pdev);
-	struct ntc_thermistor_platform_data *pdata = data->pdata;
 
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&data->dev->kobj, &ntc_attr_group);
-	ntc_iio_channel_release(pdata);
 
 	return 0;
 }
-- 
2.5.0
