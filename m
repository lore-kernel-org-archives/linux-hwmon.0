Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:44178 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932973AbdGLCwq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2017 22:52:46 -0400
From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm75) Add a basic interrupt handler
Date: Wed, 12 Jul 2017 14:52:37 +1200
Message-Id: <20170712025237.24163-1-tony.obrien@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The LM75 interrupt cannot be masked in the device so an over-temperature
event can cause an interrupt that cannot be cleared.
Add an interrupt handler if an interrupt node exists in the DTS for an
LM75.  The handler simply reads a device register to clear the interrupt
and returns.

Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/lm75.c | 28 ++++++++++++++++++++++++++++
 drivers/hwmon/lm75.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 005ffb5ffa92..08a833e960aa 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
+#include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -265,6 +266,17 @@ static void lm75_remove(void *data)
 	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
 }
 
+static irqreturn_t lm75_process_interrupt(int irq, void *data)
+{
+	struct i2c_client *client = (struct i2c_client *)data;
+	int val;
+
+	/* Do a read to clear the interrupt */
+	val = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
+
+	return IRQ_HANDLED;
+}
+
 static int
 lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
@@ -275,6 +287,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	u8 set_mask, clr_mask;
 	int new;
 	enum lm75_type kind;
+	int ret;
 
 	if (client->dev.of_node)
 		kind = (enum lm75_type)of_device_get_match_data(&client->dev);
@@ -375,6 +388,21 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		break;
 	}
 
+	if (client->irq) {
+		/* If requesting an interrupt then set to interrupt mode */
+		set_mask |= LM75_MODE_INTERRUPT;
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						lm75_process_interrupt,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT |
+							IRQF_SHARED,
+						dev_name(dev),
+						client);
+		if (ret) {
+			dev_err(dev, "Error requesting irq\n");
+			return ret;
+		}
+	}
+
 	/* configure as specified */
 	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
 	if (status < 0) {
diff --git a/drivers/hwmon/lm75.h b/drivers/hwmon/lm75.h
index 5cde94e56f17..82a71d870331 100644
--- a/drivers/hwmon/lm75.h
+++ b/drivers/hwmon/lm75.h
@@ -31,6 +31,7 @@
 #define LM75_TEMP_MIN (-55000)
 #define LM75_TEMP_MAX 125000
 #define LM75_SHUTDOWN 0x01
+#define LM75_MODE_INTERRUPT 0x02
 
 /* TEMP: 0.001C/bit (-55C to +125C)
    REG: (0.5C/bit, two's complement) << 7 */
-- 
2.13.0

