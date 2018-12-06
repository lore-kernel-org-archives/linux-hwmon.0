Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/13] hwmon: (pwm-fan) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:29 -0800
Message-Id: <1544124153-23961-10-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pwm-fan.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 7da6a160d45a..2c944825026f 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -72,8 +72,8 @@ static void pwm_fan_update_state(struct pwm_fan_ctx *ctx, unsigned long pwm)
 	ctx->pwm_fan_state = i;
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 	unsigned long pwm;
@@ -90,8 +90,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
 
@@ -99,7 +99,7 @@ static ssize_t show_pwm(struct device *dev,
 }
 
 
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
 
 static struct attribute *pwm_fan_attrs[] = {
 	&sensor_dev_attr_pwm1.dev_attr.attr,
-- 
2.7.4
