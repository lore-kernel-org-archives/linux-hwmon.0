Return-Path: <SRS0=+A0F=XA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B313C3A5A9
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Sep 2019 02:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E657920820
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Sep 2019 02:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730718AbfIECAs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Sep 2019 22:00:48 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15]:17518 "EHLO
        sender4-op-o15.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730717AbfIECAs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Sep 2019 22:00:48 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567648810; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=WJk2gc0qkfD++qOvy+F9zqyP1h4M+3uS2uqTaHszs/3yyAQx/uNFMcm0LzL6SU0ZkKM+mbCLAcwKXj31tiYBUUuLXnODvwrVrftBsbAmUf8cLVVqXyTw/o71H/dKMHMgUlkR6fgnNsZVmt2AebuBjZ6SMPJSwU76aikNB4Y9y/s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567648810; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=6pu0j+YrbrYbFWRtzHMKnhZVyQg7Zg4Wl0Xngc7B06E=; 
        b=QrbaK+BLXV2jiD+mMrAP/PZUPBusxEeDf4H3PPMGI0oN270H5iJYBAyYouz73fcAF8QgWihzps3S53KZ5glMEPChRZ2dyljf1ux/lN4j8Di/VOWOAlywpMhqabBHgV9NBZS+zNDLAeSXaJRUOJFpKO8Anibh4v0icld1jVoolGQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=dlrobertson.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie.verizon.net (pool-100-15-144-194.washdc.fios.verizon.net [100.15.144.194]) by mx.zohomail.com
        with SMTPS id 1567648807744991.2886932031469; Wed, 4 Sep 2019 19:00:07 -0700 (PDT)
From:   Dan Robertson <dan@dlrobertson.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Robertson <dan@dlrobertson.com>
Message-ID: <20190905014554.21658-2-dan@dlrobertson.com>
Subject: [PATCH 1/2] hwmon: (shtc1) add support for the SHTC3 sensor
Date:   Thu,  5 Sep 2019 01:45:53 +0000
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190905014554.21658-1-dan@dlrobertson.com>
References: <20190905010130.15019-2-dan@dlrobertson.com>
 <20190905014554.21658-1-dan@dlrobertson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for the Sensirion SHTC3 humidity and temperature sensor to
the shtc1 module.

Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 Documentation/hwmon/shtc1.rst | 19 ++++++++----
 drivers/hwmon/Kconfig         |  4 +--
 drivers/hwmon/shtc1.c         | 56 ++++++++++++++++++++++++++---------
 3 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/Documentation/hwmon/shtc1.rst b/Documentation/hwmon/shtc1.rst
index aa116332ba26..9b0f1eee5bf2 100644
--- a/Documentation/hwmon/shtc1.rst
+++ b/Documentation/hwmon/shtc1.rst
@@ -19,7 +19,17 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Not publicly available
+    Datasheet: http://www.sensirion.com/file/datasheet_shtw1
+
+
+
+  * Sensirion SHTC3
+
+    Prefix: 'shtc3'
+
+    Addresses scanned: none
+
+    Datasheet: http://www.sensirion.com/file/datasheet_shtc3
 
 
 
@@ -30,10 +40,9 @@ Author:
 Description
 -----------
 
-This driver implements support for the Sensirion SHTC1 chip, a humidity and
-temperature sensor. Temperature is measured in degrees celsius, relative
-humidity is expressed as a percentage. Driver can be used as well for SHTW1
-chip, which has the same electrical interface.
+This driver implements support for the Sensirion SHTC1, SHTW1, and SHTC3
+chips, a humidity and temperature sensor. Temperature is measured in degrees
+celsius, relative humidity is expressed as a percentage.
 
 The device communicates with the I2C protocol. All sensors are set to I2C
 address 0x70. See Documentation/i2c/instantiating-devices for methods to
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 650dd71f9724..e8b9b172ed9d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1382,8 +1382,8 @@ config SENSORS_SHTC1
 	tristate "Sensiron humidity and temperature sensors. SHTC1 and compat."
 	depends on I2C
 	help
-	  If you say yes here you get support for the Sensiron SHTC1 and SHTW1
-	  humidity and temperature sensors.
+	  If you say yes here you get support for the Sensiron SHTC1, SHTW1,
+	  and SHTC3 humidity and temperature sensors.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called shtc1.
diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 83fe08185ac7..3e9a859a2b58 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -24,19 +24,32 @@ static const unsigned char shtc1_cmd_measure_blocking_lpm[]    = { 0x64, 0x58 };
 static const unsigned char shtc1_cmd_measure_nonblocking_lpm[] = { 0x60, 0x9c };
 
 /* command for reading the ID register */
-static const unsigned char shtc1_cmd_read_id_reg[]	       = { 0xef, 0xc8 };
+static const unsigned char shtc1_cmd_read_id_reg[]             = { 0xef, 0xc8 };
 
-/* constants for reading the ID register */
-#define SHTC1_ID	  0x07
-#define SHTC1_ID_REG_MASK 0x1f
+/* constants for reading the ID register
+ * SHTC1: 0x0007 with mask 0x001f
+ * SHTW1: 0x0007 with mask 0x001f
+ * SHTC3: 0x0807 with mask 0x083f
+ */
+#define SHTC3_ID      0x0807
+#define SHTC3_ID_MASK 0x083f
+#define SHTC1_ID      0x0007
+#define SHTC1_ID_MASK 0x001f
 
 /* delays for non-blocking i2c commands, both in us */
 #define SHTC1_NONBLOCKING_WAIT_TIME_HPM  14400
 #define SHTC1_NONBLOCKING_WAIT_TIME_LPM   1000
+#define SHTC3_NONBLOCKING_WAIT_TIME_HPM  12100
+#define SHTC3_NONBLOCKING_WAIT_TIME_LPM    800
 
 #define SHTC1_CMD_LENGTH      2
 #define SHTC1_RESPONSE_LENGTH 6
 
+enum shtcx_chips {
+	shtc1,
+	shtc3,
+};
+
 struct shtc1_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
@@ -47,6 +60,7 @@ struct shtc1_data {
 	unsigned int nonblocking_wait_time; /* in us */
 
 	struct shtc1_platform_data setup;
+	enum shtcx_chips chip;
 
 	int temperature; /* 1000 * temperature in dgr C */
 	int humidity; /* 1000 * relative humidity in %RH */
@@ -157,13 +171,16 @@ static void shtc1_select_command(struct shtc1_data *data)
 		data->command = data->setup.blocking_io ?
 				shtc1_cmd_measure_blocking_hpm :
 				shtc1_cmd_measure_nonblocking_hpm;
-		data->nonblocking_wait_time = SHTC1_NONBLOCKING_WAIT_TIME_HPM;
-
+		data->nonblocking_wait_time = (data->chip == shtc1) ?
+				SHTC1_NONBLOCKING_WAIT_TIME_HPM :
+				SHTC3_NONBLOCKING_WAIT_TIME_HPM;
 	} else {
 		data->command = data->setup.blocking_io ?
 				shtc1_cmd_measure_blocking_lpm :
 				shtc1_cmd_measure_nonblocking_lpm;
-		data->nonblocking_wait_time = SHTC1_NONBLOCKING_WAIT_TIME_LPM;
+		data->nonblocking_wait_time = (data->chip == shtc1) ?
+				SHTC1_NONBLOCKING_WAIT_TIME_LPM :
+				SHTC3_NONBLOCKING_WAIT_TIME_LPM;
 	}
 }
 
@@ -171,9 +188,11 @@ static int shtc1_probe(struct i2c_client *client,
 		       const struct i2c_device_id *id)
 {
 	int ret;
-	char id_reg[2];
+	u16 id_reg;
+	char id_reg_buf[2];
 	struct shtc1_data *data;
 	struct device *hwmon_dev;
+	enum shtcx_chips chip = id->driver_data;
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 
@@ -187,13 +206,20 @@ static int shtc1_probe(struct i2c_client *client,
 		dev_err(dev, "could not send read_id_reg command: %d\n", ret);
 		return ret < 0 ? ret : -ENODEV;
 	}
-	ret = i2c_master_recv(client, id_reg, sizeof(id_reg));
-	if (ret != sizeof(id_reg)) {
+	ret = i2c_master_recv(client, id_reg_buf, sizeof(id_reg_buf));
+	if (ret != sizeof(id_reg_buf)) {
 		dev_err(dev, "could not read ID register: %d\n", ret);
 		return -ENODEV;
 	}
-	if ((id_reg[1] & SHTC1_ID_REG_MASK) != SHTC1_ID) {
-		dev_err(dev, "ID register doesn't match\n");
+
+	id_reg = be16_to_cpup((__be16 *)id_reg_buf);
+	if (chip == shtc3) {
+		if ((id_reg & SHTC3_ID_MASK) != SHTC3_ID) {
+			dev_err(dev, "SHTC3 ID register does not match\n");
+			return -ENODEV;
+		}
+	} else if ((id_reg & SHTC1_ID_MASK) != SHTC1_ID) {
+		dev_err(dev, "SHTC1 ID register does not match\n");
 		return -ENODEV;
 	}
 
@@ -204,6 +230,7 @@ static int shtc1_probe(struct i2c_client *client,
 	data->setup.blocking_io = false;
 	data->setup.high_precision = true;
 	data->client = client;
+	data->chip = chip;
 
 	if (client->dev.platform_data)
 		data->setup = *(struct shtc1_platform_data *)dev->platform_data;
@@ -222,8 +249,9 @@ static int shtc1_probe(struct i2c_client *client,
 
 /* device ID table */
 static const struct i2c_device_id shtc1_id[] = {
-	{ "shtc1", 0 },
-	{ "shtw1", 0 },
+	{ "shtc1", shtc1 },
+	{ "shtw1", shtc1 },
+	{ "shtc3", shtc3 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, shtc1_id);
-- 
2.23.0



