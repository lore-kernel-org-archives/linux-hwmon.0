Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dirk Eibach <eibach@gdsys.de>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:05 -0500
Message-Id: <20170718214339.7774-25-robh@kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Dirk Eibach <eibach@gdsys.de>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/ads1015.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
index 357b42607164..98c704d3366a 100644
--- a/drivers/hwmon/ads1015.c
+++ b/drivers/hwmon/ads1015.c
@@ -191,24 +191,23 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
 		unsigned int data_rate = ADS1015_DEFAULT_DATA_RATE;

 		if (of_property_read_u32(node, "reg", &pval)) {
-			dev_err(&client->dev, "invalid reg on %s\n",
-				node->full_name);
+			dev_err(&client->dev, "invalid reg on %pOF\n", node);
 			continue;
 		}

 		channel = pval;
 		if (channel >= ADS1015_CHANNELS) {
 			dev_err(&client->dev,
-				"invalid channel index %d on %s\n",
-				channel, node->full_name);
+				"invalid channel index %d on %pOF\n",
+				channel, node);
 			continue;
 		}

 		if (!of_property_read_u32(node, "ti,gain", &pval)) {
 			pga = pval;
 			if (pga > 6) {
-				dev_err(&client->dev, "invalid gain on %s\n",
-					node->full_name);
+				dev_err(&client->dev, "invalid gain on %pOF\n",
+					node);
 				return -EINVAL;
 			}
 		}
@@ -217,8 +216,7 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
 			data_rate = pval;
 			if (data_rate > 7) {
 				dev_err(&client->dev,
-					"invalid data_rate on %s\n",
-					node->full_name);
+					"invalid data_rate on %pOF\n", node);
 				return -EINVAL;
 			}
 		}
--
2.11.0
