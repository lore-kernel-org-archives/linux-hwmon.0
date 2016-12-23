Return-path: <mail@alexanderkoch.net>
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Kosina <trivial@kernel.org>,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [RFC PATCH v2 2/4] hwmon: adc128d818: Implement mode selection via dt
Date: Fri, 23 Dec 2016 23:12:03 +0100
Message-Id: <20161223221205.8825-3-mail@alexanderkoch.net>
In-Reply-To: <20161223221205.8825-1-mail@alexanderkoch.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
List-ID: <linux-hwmon@vger.kernel.org>

Implement operation mode selection using the optional 'mode' devicetree
property (see [1]). The ADC128D818 supports four operation modes differing
in the number and type of input readings (see datasheet, sec. 8.4.1), of
which mode 0 is the default.

We only add handling of the 'mode' property here, the driver still supports
nothing else than the default mode 0.

[1] Documentation/devicetree/bindings/hwmon/adc128d818.txt

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 drivers/hwmon/adc128d818.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index ad2b47e40345..8667f454ea11 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -28,6 +28,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/mutex.h>
 #include <linux/bitops.h>
+#include <linux/of.h>
 
 /* Addresses to scan
  * The chip also supports addresses 0x35..0x37. Don't scan those addresses
@@ -63,6 +64,7 @@ struct adc128_data {
 	struct regulator *regulator;
 	int vref;		/* Reference voltage in mV */
 	struct mutex update_lock;
+	u8 mode;		/* Operation mode */
 	bool valid;		/* true if following fields are valid */
 	unsigned long last_updated;	/* In jiffies */
 
@@ -387,6 +389,15 @@ static int adc128_init_client(struct adc128_data *data)
 	if (err)
 		return err;
 
+	/* Set operation mode, if non-default */
+	if (data->mode != 0) {
+		err = i2c_smbus_write_byte_data(client,
+						ADC128_REG_CONFIG_ADV,
+						data->mode << 1);
+		if (err)
+			return err;
+	}
+
 	/* Start monitoring */
 	err = i2c_smbus_write_byte_data(client, ADC128_REG_CONFIG, 0x01);
 	if (err)
@@ -433,6 +444,19 @@ static int adc128_probe(struct i2c_client *client,
 		data->vref = 2560;	/* 2.56V, in mV */
 	}
 
+	/* Operation mode is optional and defaults to mode 0 */
+	if (of_property_read_u8(dev->of_node, "mode", &data->mode) == 0) {
+		/* Currently only mode 0 supported */
+		if (data->mode != 0) {
+			dev_err(dev, "unsupported operation mode %d",
+				data->mode);
+			err = -EINVAL;
+			goto error;
+		}
+	} else {
+		data->mode = 0;
+	}
+
 	data->client = client;
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
-- 
2.11.0
