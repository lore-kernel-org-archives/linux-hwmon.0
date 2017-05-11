Return-path: <chrisp@alliedtelesis.co.nz>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org,
	linux@roeck-us.net
Cc: Tobi Wulff <tobi.wulff@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] hwmon: (adt7475) add high frequency support
Date: Thu, 11 May 2017 15:45:24 +1200
Message-Id: <20170511034524.22698-5-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

Systems using 4-wire fans usually require high frequency (22.5kHz)
output on the pwm. Add 22500 as a valid option in the pwmfreq_table. In
high frequency mode the low-order bit are ignored so they can safely be
set to 0.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- New

 drivers/hwmon/adt7475.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index f7322330789c..f5a65d1166cd 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -936,7 +936,7 @@ static ssize_t set_pwmctrl(struct device *dev, struct device_attribute *attr,
 
 /* List of frequencies for the PWM */
 static const int pwmfreq_table[] = {
-	11, 14, 22, 29, 35, 44, 58, 88
+	11, 14, 22, 29, 35, 44, 58, 88, 22500
 };
 
 static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
@@ -944,9 +944,10 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	int i = clamp_val(data->range[sattr->index] & 0xf, 0,
+			  sizeof(pwmfreq_table));
 
-	return sprintf(buf, "%d\n",
-		       pwmfreq_table[data->range[sattr->index] & 7]);
+	return sprintf(buf, "%d\n", pwmfreq_table[i]);
 }
 
 static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
@@ -967,7 +968,7 @@ static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
 
 	data->range[sattr->index] =
 		adt7475_read(TEMP_TRANGE_REG(sattr->index));
-	data->range[sattr->index] &= ~7;
+	data->range[sattr->index] &= ~0xf;
 	data->range[sattr->index] |= out;
 
 	i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(sattr->index),
-- 
2.11.0.24.ge6920cf
