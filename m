Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38029 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750943AbdECAka (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 May 2017 20:40:30 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/3] hwmon: (adt7475) replace find_nearest() with find_closest()
Date: Wed,  3 May 2017 12:40:07 +1200
Message-Id: <20170503004009.23769-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170503004009.23769-1-chris.packham@alliedtelesis.co.nz>
References: <20170503004009.23769-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The adt7475 has had find_nearest() since it's creation in 2009. Since
then find_closest() has been introduced and several drivers have been
updated to use it. Update the adt7475 to use find_closest() and remove
the now unused find_nearest().

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/adt7475.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index c803e3c5fcd4..ec0c43fbcdce 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -22,6 +22,7 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/jiffies.h>
+#include <linux/util_macros.h>
 
 /* Indexes for the sysfs hooks */
 
@@ -314,35 +315,6 @@ static void adt7475_write_word(struct i2c_client *client, int reg, u16 val)
 	i2c_smbus_write_byte_data(client, reg, val & 0xFF);
 }
 
-/*
- * Find the nearest value in a table - used for pwm frequency and
- * auto temp range
- */
-static int find_nearest(long val, const int *array, int size)
-{
-	int i;
-
-	if (val < array[0])
-		return 0;
-
-	if (val > array[size - 1])
-		return size - 1;
-
-	for (i = 0; i < size - 1; i++) {
-		int a, b;
-
-		if (val > array[i + 1])
-			continue;
-
-		a = val - array[i];
-		b = array[i + 1] - val;
-
-		return (a <= b) ? i : i + 1;
-	}
-
-	return 0;
-}
-
 static ssize_t show_voltage(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
@@ -606,7 +578,7 @@ static ssize_t set_point2(struct device *dev, struct device_attribute *attr,
 	val -= temp;
 
 	/* Find the nearest table entry to what the user wrote */
-	val = find_nearest(val, autorange_table, ARRAY_SIZE(autorange_table));
+	val = find_closest(val, autorange_table, ARRAY_SIZE(autorange_table));
 
 	data->range[sattr->index] &= ~0xF0;
 	data->range[sattr->index] |= val << 4;
@@ -864,7 +836,7 @@ static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
 	if (kstrtol(buf, 10, &val))
 		return -EINVAL;
 
-	out = find_nearest(val, pwmfreq_table, ARRAY_SIZE(pwmfreq_table));
+	out = find_closest(val, pwmfreq_table, ARRAY_SIZE(pwmfreq_table));
 
 	mutex_lock(&data->lock);
 
-- 
2.11.0.24.ge6920cf

