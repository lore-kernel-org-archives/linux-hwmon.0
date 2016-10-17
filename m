Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33189 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757584AbcJQIYX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Oct 2016 04:24:23 -0400
Received: by mail-pa0-f65.google.com with SMTP id hh10so8984334pac.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Oct 2016 01:23:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linux@roeck-us.net, jdelvare@suse.com
Cc: Yi Li <adamliyi@msn.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (adm1275) Enable adm1278 VOUT sampling
Date: Mon, 17 Oct 2016 18:38:53 +1030
Message-Id: <20161017080853.7627-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Yi Li <adamliyi@msn.com>

The adm1278 can optionally monitor the VOUT pin. This functioanltiy is
not enabled at reset, so PMON_CONFIG needs to be modified in order to
enable it.

Signed-off-by: Yi Li <adamliyi@msn.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Return an error when unable to enable VOUT monitoring as suggestd by Guenter

 drivers/hwmon/pmbus/adm1275.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 3baa4f4a8c5e..9940849351a1 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -499,15 +499,27 @@ static int adm1275_probe(struct i2c_client *client,
 		pindex = 2;
 		tindex = 3;
 
-		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT;
+		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+
+		/* By default when reset VOUT is not enabled */
+		if (!(config & ADM1278_VOUT_EN)) {
+			config |= ADM1278_VOUT_EN;
+			ret = i2c_smbus_write_byte_data(client,
+							ADM1275_PMON_CONFIG,
+							config);
+			if (ret < 0) {
+				dev_err(&client->dev,
+					"Failed to enable VOUT monitoring\n");
+				return -ENODEV;
+			}
+		}
+
 		if (config & ADM1278_TEMP1_EN)
 			info->func[0] |=
 				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
-		if (config & ADM1278_VOUT_EN)
-			info->func[0] |=
-				PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1293:
 	case adm1294:
-- 
2.9.3

