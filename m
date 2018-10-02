Return-Path: <arnd@arndb.de>
Return-path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: ina3221: mark PM functions as __maybe_unused
Date: Tue,  2 Oct 2018 23:10:47 +0200
Message-Id: <20181002211054.2654746-1-arnd@arndb.de>
List-ID: <linux-hwmon@vger.kernel.org>

When CONFIG_PM_SLEEP is disabled, we get a warning about unused
suspend/resume functions:

drivers/hwmon/ina3221.c:451:12: error: 'ina3221_resume' defined but not used [-Werror=unused-function]
 static int ina3221_resume(struct device *dev)
drivers/hwmon/ina3221.c:428:12: error: 'ina3221_suspend' defined but not used [-Werror=unused-function]
 static int ina3221_suspend(struct device *dev)

Picking the correct #ifdef check is hard, so let's remove
that check and instead mark the functions as __maybe_unused
to let the compiler silently drop them instead.

Fixes: 7de1ab9dac8e ("hwmon: (ina3221) Add suspend and resume functions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/ina3221.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 1e38b4c43fbf..8c3352910cc4 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -424,8 +424,7 @@ static int ina3221_probe(struct i2c_client *client,
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int ina3221_suspend(struct device *dev)
+static int __maybe_unused ina3221_suspend(struct device *dev)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	int ret;
@@ -448,7 +447,7 @@ static int ina3221_suspend(struct device *dev)
 	return 0;
 }
 
-static int ina3221_resume(struct device *dev)
+static int __maybe_unused ina3221_resume(struct device *dev)
 {
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	int ret;
@@ -474,7 +473,6 @@ static int ina3221_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops ina3221_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(ina3221_suspend, ina3221_resume)
-- 
2.18.0
