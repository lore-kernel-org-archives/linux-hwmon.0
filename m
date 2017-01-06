Return-path: <mail@alexanderkoch.net>
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Hornung <mhornung.linux@gmail.com>,
	devicetree@vger.kernel.org,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [PATCH v3 4/4] hwmon: adc128d818: Preserve operation mode
Date: Fri,  6 Jan 2017 11:38:17 +0100
Message-Id: <20170106103817.11588-5-mail@alexanderkoch.net>
In-Reply-To: <20170106103817.11588-1-mail@alexanderkoch.net>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
List-ID: <linux-hwmon@vger.kernel.org>

Preserve chip operation mode if no mode is specified via devicetree. This
enables operation when chip configuration is done by BIOS/ROMMON.

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
Acked-by: Michael Hornung <mhornung.linux@gmail.com>
---
 drivers/hwmon/adc128d818.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
index 0502af963f73..bbe3a5c5b3f5 100644
--- a/drivers/hwmon/adc128d818.c
+++ b/drivers/hwmon/adc128d818.c
@@ -491,7 +491,7 @@ static int adc128_probe(struct i2c_client *client,
 		data->vref = 2560;	/* 2.56V, in mV */
 	}
 
-	/* Operation mode is optional and defaults to mode 0 */
+	/* Operation mode is optional. If unspecified, keep current mode */
 	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
 		if (data->mode > 3) {
 			dev_err(dev, "invalid operation mode %d\n",
@@ -500,7 +500,10 @@ static int adc128_probe(struct i2c_client *client,
 			goto error;
 		}
 	} else {
-		data->mode = 0;
+		err = i2c_smbus_read_byte_data(client, ADC128_REG_CONFIG_ADV);
+		if (err < 0)
+			goto error;
+		data->mode = (err >> 1) & ADC128_REG_MASK;
 	}
 
 	data->client = client;
-- 
2.11.0
