Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52347 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752060AbdHBHQj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Aug 2017 03:16:39 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, mspinler@linux.vnet.ibm.com,
        msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/4] pmbus: max31785: Work around back-to-back writes with FAN_CONFIG_1_2
Date: Wed,  2 Aug 2017 16:45:41 +0930
Message-Id: <20170802071541.3121-5-andrew@aj.id.au>
In-Reply-To: <20170802071541.3121-1-andrew@aj.id.au>
References: <20170802071541.3121-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Testing of the pmbus max31785 driver implementation revealed occasional
NACKs from the device. Attempting the same transaction immediately after
the failure appears to always succeed. The NACK has consistently been
observed to happen on the second write of back-to-back writes to the
device, where the first write is to FAN_CONFIG_1_2. The NACK occurs
against the first data byte transmitted by the master on the second
write. The behaviour has the hallmarks of a PMBus Device Busy response,
but the busy bit is not set in the status byte.

Work around this undocumented behaviour by retrying any back-to-back
writes that occur after first writing FAN_CONFIG_1_2.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 105 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 97 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index c2b693badcea..509b1a5a49b9 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -48,6 +48,55 @@ enum max31785_regs {
 
 #define MAX31785_NR_PAGES		23
 
+/*
+ * MAX31785 dragons ahead
+ *
+ * It seems there's an undocumented timing constraint when performing
+ * back-to-back writes where the first write is to FAN_CONFIG_1_2. The device
+ * provides no indication of this besides NACK'ing master Txs; no bits are set
+ * in STATUS_BYTE to suggest anything has gone wrong.
+ *
+ * Given that, do a one-shot retry of the write.
+ *
+ * The max31785_*_write_*_data() functions should be used at any point where
+ * the prior write is to FAN_CONFIG_1_2.
+ */
+static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
+					      int command, u16 data)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, command, data);
+	if (ret == -EIO)
+		ret = i2c_smbus_write_byte_data(client, command, data);
+
+	return ret;
+}
+
+static int max31785_i2c_smbus_write_word_data(struct i2c_client *client,
+					      int command, u16 data)
+{
+	int ret;
+
+	ret = i2c_smbus_write_word_data(client, command, data);
+	if (ret == -EIO)
+		ret = i2c_smbus_write_word_data(client, command, data);
+
+	return ret;
+}
+
+static int max31785_pmbus_write_word_data(struct i2c_client *client, int page,
+					  int command, u16 data)
+{
+	int ret;
+
+	ret = pmbus_write_word_data(client, page, command, data);
+	if (ret == -EIO)
+		ret = pmbus_write_word_data(client, page, command, data);
+
+	return ret;
+}
+
 static int max31785_read_byte_data(struct i2c_client *client, int page,
 				   int reg)
 {
@@ -210,6 +259,31 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 	return rv;
 }
 
+static int max31785_update_fan(struct i2c_client *client, int page,
+			       u8 config, u8 mask, u16 command)
+{
+	int from, rv;
+	u8 to;
+
+	from = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	if (from < 0)
+		return from;
+
+	to = (from & ~mask) | (config & mask);
+
+	if (to != from) {
+		rv = pmbus_write_byte_data(client, page, PMBUS_FAN_CONFIG_12,
+					   to);
+		if (rv < 0)
+			return rv;
+	}
+
+	rv = max31785_pmbus_write_word_data(client, page, PMBUS_FAN_COMMAND_1,
+					    command);
+
+	return rv;
+}
+
 static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
 
 static int max31785_write_word_data(struct i2c_client *client, int page,
@@ -219,12 +293,24 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 		return -ENXIO;
 
 	switch (reg) {
+	case PMBUS_VIRT_FAN_TARGET_1:
+		return max31785_update_fan(client, page, PB_FAN_1_RPM,
+					   PB_FAN_1_RPM, word);
+	case PMBUS_VIRT_PWM_1:
+	{
+		u32 command = word;
+
+		command *= 100;
+		command /= 255;
+		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
+					   command);
+	}
 	case PMBUS_VIRT_PWM_ENABLE_1:
 		if (word >= ARRAY_SIZE(max31785_pwm_modes))
 			return -EINVAL;
 
-		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
-					max31785_pwm_modes[word]);
+		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
+					   max31785_pwm_modes[word]);
 	default:
 		break;
 	}
@@ -262,7 +348,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -419,7 +505,8 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
+	ret = max31785_i2c_smbus_write_word_data(client, MFR_FAN_CONFIG,
+						 mfr_cfg);
 	if (ret < 0)
 		return ret;
 
@@ -473,7 +560,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -631,7 +718,8 @@ static int max31785_probe(struct i2c_client *client,
 		if (!have_fan || fan_configured)
 			continue;
 
-		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+							 i);
 		if (ret < 0)
 			return ret;
 
@@ -640,8 +728,9 @@ static int max31785_probe(struct i2c_client *client,
 			return ret;
 
 		ret &= ~PB_FAN_1_INSTALLED;
-		ret = i2c_smbus_write_word_data(client, PMBUS_FAN_CONFIG_12,
-						ret);
+		ret = max31785_i2c_smbus_write_word_data(client,
+							 PMBUS_FAN_CONFIG_12,
+							 ret);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.11.0

