Return-path: <joel.stan@gmail.com>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: linux@roeck-us.net,
	jdelvare@suse.com
Cc: Yi Li <adamliyi@msn.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (adm1275) Enable adm1278 VOUT sampling
Date: Fri, 14 Oct 2016 20:36:05 +1030
Message-Id: <20161014100605.23887-1-joel@jms.id.au>
List-ID: <linux-hwmon@vger.kernel.org>

From: Yi Li <adamliyi@msn.com>

The adm1278 can optionally monitor the VOUT pin. This functionality is
not enabled at reset, so PMON_CONFIG needs to be modified in order to
enable it.

Signed-off-by: Yi Li <adamliyi@msn.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Guenter, I'm not sure if this is a valid thing to do in the probe function. If
not, can you suggest an alternative method for enabling this?

 drivers/hwmon/pmbus/adm1275.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 3baa4f4a8c5e..7d1f5f7891cc 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -500,6 +500,19 @@ static int adm1275_probe(struct i2c_client *client,
 		tindex = 3;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT;
+
+		/* By default when reset VOUT is not enabled */
+		if (!(config & ADM1278_VOUT_EN)) {
+			config |= ADM1278_VOUT_EN;
+			ret = i2c_smbus_write_byte_data(client,
+							ADM1275_PMON_CONFIG,
+							config);
+			if (ret < 0) {
+				dev_warn(&client->dev,
+					"Failed to enable VOUT monitoring\n");
+			}
+		}
+
 		if (config & ADM1278_TEMP1_EN)
 			info->func[0] |=
 				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
-- 
2.9.3
