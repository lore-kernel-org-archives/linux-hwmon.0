Return-path: <akshay.bhat@timesys.com>
From: Akshay Bhat <akshay.bhat@timesys.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akshay Bhat <akshay.bhat@timesys.com>
Subject: [PATCH] hwmon: (ads7828) Enable internal reference
Date: Mon, 18 Apr 2016 15:47:53 -0400
Message-Id: <1461008873-17694-1-git-send-email-akshay.bhat@timesys.com>
List-ID: <linux-hwmon@vger.kernel.org>

On ads7828 the internal reference defaults to off upon power up. When
using internal reference, it needs to be turned on and the voltage needs
to settle before normal conversion cycle can be started. Hence perform a
dummy read in the probe to enable the internal reference allowing the
voltage to settle before performing a normal read.

Without this fix, the first read from the ADC when using internal
reference always returns incorrect data.

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
---
 drivers/hwmon/ads7828.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 6c99ee7..b15c9bd 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -120,6 +120,7 @@ static int ads7828_probe(struct i2c_client *client,
 	unsigned int vref_mv = ADS7828_INT_VREF_MV;
 	bool diff_input = false;
 	bool ext_vref = false;
+	unsigned int regval;
 
 	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
 	if (!data)
@@ -154,6 +155,15 @@ static int ads7828_probe(struct i2c_client *client,
 	if (!diff_input)
 		data->cmd_byte |= ADS7828_CMD_SD_SE;
 
+	/*
+	 * Datasheet specifies internal reference volatage is disabled by
+	 * default. The internal reference voltage needs to be enabled and
+	 * voltage needs to settle before getting valid ADC data. So perform a
+	 * dummy read to enable the internal reference voltage.
+	 */
+	if (!ext_vref)
+		regmap_read(data->regmap, data->cmd_byte, &regval);
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data,
 							   ads7828_groups);
-- 
2.8.1
