Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36076 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486AbcF3Dm2 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 29 Jun 2016 23:42:28 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: Nishanth Menon <nm@ti.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 2/3] hwmon: (tmp102) Rework chip configuration
Date: Wed, 29 Jun 2016 20:41:58 -0700
Message-Id: <1467258119-14071-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467258119-14071-1-git-send-email-linux@roeck-us.net>
References: <1467258119-14071-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

So far the chip was forced into polarity 0, even if it was preconfigured
differently. Do not touch the polarity when configuring the chip.

Also, the configuration register was read beack to check if the
configuration 'sticks'. Ultimately, that is similar to checking if the
chip is a tmp102 in the first place. Checking if a write into the
configuration register was successful is really not the way to do it,
and quite risky if the chip is not a tmp102, so drop that check.
Instead, verify if the configuration register has unexpected bits set
before writing into it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: No change
v2: No change

 drivers/hwmon/tmp102.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index fd4a4515692a..82a8a29af2e4 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -47,6 +47,17 @@
 #define	TMP102_TLOW_REG			0x02
 #define	TMP102_THIGH_REG		0x03
 
+#define TMP102_CONFREG_MASK	(TMP102_CONF_SD | TMP102_CONF_TM | \
+				 TMP102_CONF_POL | TMP102_CONF_F0 | \
+				 TMP102_CONF_F1 | TMP102_CONF_OS | \
+				 TMP102_CONF_EM | TMP102_CONF_AL | \
+				 TMP102_CONF_CR0 | TMP102_CONF_CR1)
+
+#define TMP102_CONFIG_CLEAR	(TMP102_CONF_SD | TMP102_CONF_OS | \
+				 TMP102_CONF_CR0)
+#define TMP102_CONFIG_SET	(TMP102_CONF_TM | TMP102_CONF_EM | \
+				 TMP102_CONF_CR1)
+
 #define CONVERSION_TIME_MS		35	/* in milli-seconds */
 
 struct tmp102 {
@@ -167,9 +178,6 @@ static struct attribute *tmp102_attrs[] = {
 };
 ATTRIBUTE_GROUPS(tmp102);
 
-#define TMP102_CONFIG  (TMP102_CONF_TM | TMP102_CONF_EM | TMP102_CONF_CR1)
-#define TMP102_CONFIG_RD_ONLY (TMP102_CONF_R0 | TMP102_CONF_R1 | TMP102_CONF_AL)
-
 static const struct thermal_zone_of_device_ops tmp102_of_thermal_ops = {
 	.get_temp = tmp102_read_temp,
 };
@@ -210,26 +218,25 @@ static int tmp102_probe(struct i2c_client *client,
 		dev_err(dev, "error reading config register\n");
 		return status;
 	}
+
+	if ((status & ~TMP102_CONFREG_MASK) !=
+	    (TMP102_CONF_R0 | TMP102_CONF_R1)) {
+		dev_err(dev, "unexpected config register value\n");
+		return -ENODEV;
+	}
+
 	tmp102->config_orig = status;
 
 	devm_add_action(dev, tmp102_restore_config, tmp102);
 
-	status = i2c_smbus_write_word_swapped(client, TMP102_CONF_REG,
-					      TMP102_CONFIG);
+	status &= ~TMP102_CONFIG_CLEAR;
+	status |= TMP102_CONFIG_SET;
+
+	status = i2c_smbus_write_word_swapped(client, TMP102_CONF_REG, status);
 	if (status < 0) {
 		dev_err(dev, "error writing config register\n");
 		return status;
 	}
-	status = i2c_smbus_read_word_swapped(client, TMP102_CONF_REG);
-	if (status < 0) {
-		dev_err(dev, "error reading config register\n");
-		return status;
-	}
-	status &= ~TMP102_CONFIG_RD_ONLY;
-	if (status != TMP102_CONFIG) {
-		dev_err(dev, "config settings did not stick\n");
-		return -ENODEV;
-	}
 
 	mutex_init(&tmp102->lock);
 
-- 
2.5.0

