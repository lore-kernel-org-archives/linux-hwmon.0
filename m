Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57326 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752570AbdEOBaq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 May 2017 21:30:46 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] hwmon: (adt7475) add high frequency support
Date: Mon, 15 May 2017 13:30:29 +1200
Message-Id: <20170515013029.31397-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170515013029.31397-1-chris.packham@alliedtelesis.co.nz>
References: <20170515013029.31397-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Systems using 4-wire fans usually require high frequency (22.5kHz)
output on the pwm. Add 22500 as a valid option in the pwmfreq_table. In
high frequency mode the low-order bit are ignored so they can safely be
set to 0.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- New
Changes in v4:
- Fix pwmfreq_table array indexing

 drivers/hwmon/adt7475.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 3056076fae27..1baa213a60bd 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -934,7 +934,7 @@ static ssize_t set_pwmctrl(struct device *dev, struct device_attribute *attr,
 
 /* List of frequencies for the PWM */
 static const int pwmfreq_table[] = {
-	11, 14, 22, 29, 35, 44, 58, 88
+	11, 14, 22, 29, 35, 44, 58, 88, 22500
 };
 
 static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
@@ -942,9 +942,10 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	int i = clamp_val(data->range[sattr->index] & 0xf, 0,
+			  ARRAY_SIZE(pwmfreq_table) - 1);
 
-	return sprintf(buf, "%d\n",
-		       pwmfreq_table[data->range[sattr->index] & 7]);
+	return sprintf(buf, "%d\n", pwmfreq_table[i]);
 }
 
 static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
@@ -965,7 +966,7 @@ static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
 
 	data->range[sattr->index] =
 		adt7475_read(TEMP_TRANGE_REG(sattr->index));
-	data->range[sattr->index] &= ~7;
+	data->range[sattr->index] &= ~0xf;
 	data->range[sattr->index] |= out;
 
 	i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(sattr->index),
-- 
2.11.0.24.ge6920cf

