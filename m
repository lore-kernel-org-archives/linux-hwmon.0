Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/10] hwmon: (adt7411) Replace macro generating sensor attributes
Date: Tue, 27 Dec 2016 15:28:28 -0800
Message-Id: <1482881308-13550-11-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace macro generating sensor attributes with explicit code to ease
conversion to SENSOR_DEVICE_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7411.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index b939f8a115ba..bc6e8cd80b68 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -199,13 +199,15 @@ static ssize_t adt7411_set_bit(struct device *dev,
 	return ret < 0 ? ret : count;
 }
 
-#define ADT7411_BIT_ATTR(__name, __reg, __bit) \
-	SENSOR_DEVICE_ATTR_2(__name, S_IRUGO | S_IWUSR, adt7411_show_bit, \
-	adt7411_set_bit, __bit, __reg)
-
-static ADT7411_BIT_ATTR(no_average, ADT7411_REG_CFG2, ADT7411_CFG2_DISABLE_AVG);
-static ADT7411_BIT_ATTR(fast_sampling, ADT7411_REG_CFG3, ADT7411_CFG3_ADC_CLK_225);
-static ADT7411_BIT_ATTR(adc_ref_vdd, ADT7411_REG_CFG3, ADT7411_CFG3_REF_VDD);
+static SENSOR_DEVICE_ATTR_2(no_average, S_IRUGO | S_IWUSR,
+			    adt7411_show_bit, adt7411_set_bit,
+			    ADT7411_CFG2_DISABLE_AVG, ADT7411_REG_CFG2);
+static SENSOR_DEVICE_ATTR_2(fast_sampling, S_IRUGO | S_IWUSR,
+			    adt7411_show_bit, adt7411_set_bit,
+			    ADT7411_CFG3_ADC_CLK_225, ADT7411_REG_CFG3);
+static SENSOR_DEVICE_ATTR_2(adc_ref_vdd, S_IRUGO | S_IWUSR,
+			    adt7411_show_bit, adt7411_set_bit,
+			    ADT7411_CFG3_REF_VDD, ADT7411_REG_CFG3);
 
 static struct attribute *adt7411_attrs[] = {
 	&sensor_dev_attr_no_average.dev_attr.attr,
-- 
2.7.4
