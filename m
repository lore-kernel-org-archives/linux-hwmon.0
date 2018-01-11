Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, linux-kernel@vger.kernel.org, jdelvare@suse.com,
        joel@jms.id.au, eajames@linux.vnet.ibm.com
Subject: [PATCH v3] hwmon (pmbus): cffps: Add led class device for power supply fault led
Date: Thu, 11 Jan 2018 11:20:10 -0600
Message-Id: <1515691210-24402-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

This power supply device doesn't correctly manage it's own fault led.
Add an led class device and register it so that userspace can manage
power supply fault led as necessary.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---

 Changes since v2:
 - Use fixed size buffer for led name.

 Changes since v1:
 - move led registration into a separate function.
 - improve comments.

 drivers/hwmon/pmbus/ibm-cffps.c | 96 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 2d6f4f4..93d9a9e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -13,6 +13,7 @@
 #include <linux/fs.h>
 #include <linux/i2c.h>
 #include <linux/jiffies.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pmbus.h>
@@ -25,6 +26,7 @@
 #define CFFPS_CCIN_CMD				0xBD
 #define CFFPS_FW_CMD_START			0xFA
 #define CFFPS_FW_NUM_BYTES			4
+#define CFFPS_SYS_CONFIG_CMD			0xDA
 
 #define CFFPS_INPUT_HISTORY_CMD			0xD6
 #define CFFPS_INPUT_HISTORY_SIZE		100
@@ -39,6 +41,11 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
+#define CFFPS_LED_BLINK				BIT(0)
+#define CFFPS_LED_ON				BIT(1)
+#define CFFPS_LED_OFF				BIT(2)
+#define CFFPS_BLINK_RATE_MS			250
+
 enum {
 	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
 	CFFPS_DEBUGFS_FRU,
@@ -63,6 +70,10 @@ struct ibm_cffps {
 	struct ibm_cffps_input_history input_history;
 
 	int debugfs_entries[CFFPS_DEBUGFS_NUM_ENTRIES];
+
+	char led_name[32];
+	u8 led_state;
+	struct led_classdev led;
 };
 
 #define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
@@ -258,6 +269,69 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 	return rc;
 }
 
+static void ibm_cffps_led_brightness_set(struct led_classdev *led_cdev,
+					 enum led_brightness brightness)
+{
+	int rc;
+	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
+
+	if (brightness == LED_OFF) {
+		psu->led_state = CFFPS_LED_OFF;
+	} else {
+		brightness = LED_FULL;
+		if (psu->led_state != CFFPS_LED_BLINK)
+			psu->led_state = CFFPS_LED_ON;
+	}
+
+	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
+				       psu->led_state);
+	if (rc < 0)
+		return;
+
+	led_cdev->brightness = brightness;
+}
+
+static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
+				   unsigned long *delay_on,
+				   unsigned long *delay_off)
+{
+	int rc;
+	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
+
+	psu->led_state = CFFPS_LED_BLINK;
+
+	if (led_cdev->brightness == LED_OFF)
+		return 0;
+
+	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
+				       CFFPS_LED_BLINK);
+	if (rc < 0)
+		return rc;
+
+	*delay_on = CFFPS_BLINK_RATE_MS;
+	*delay_off = CFFPS_BLINK_RATE_MS;
+
+	return 0;
+}
+
+static void ibm_cffps_create_led_class(struct ibm_cffps *psu)
+{
+	int rc;
+	struct i2c_client *client = psu->client;
+	struct device *dev = &client->dev;
+
+	snprintf(psu->led_name, sizeof(psu->led_name), "%s-%02x", client->name,
+		 client->addr);
+	psu->led.name = psu->led_name;
+	psu->led.max_brightness = LED_FULL;
+	psu->led.brightness_set = ibm_cffps_led_brightness_set;
+	psu->led.blink_set = ibm_cffps_led_blink_set;
+
+	rc = devm_led_classdev_register(dev, &psu->led);
+	if (rc)
+		dev_warn(dev, "failed to register led class: %d\n", rc);
+}
+
 static struct pmbus_driver_info ibm_cffps_info = {
 	.pages = 1,
 	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
@@ -286,6 +360,20 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	if (rc)
 		return rc;
 
+	/*
+	 * Don't fail the probe if there isn't enough memory for leds and
+	 * debugfs.
+	 */
+	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu)
+		return 0;
+
+	psu->client = client;
+	mutex_init(&psu->input_history.update_lock);
+	psu->input_history.last_update = jiffies - HZ;
+
+	ibm_cffps_create_led_class(psu);
+
 	/* Don't fail the probe if we can't create debugfs */
 	debugfs = pmbus_get_debugfs_dir(client);
 	if (!debugfs)
@@ -295,14 +383,6 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	if (!ibm_cffps_dir)
 		return 0;
 
-	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
-	if (!psu)
-		return 0;
-
-	psu->client = client;
-	mutex_init(&psu->input_history.update_lock);
-	psu->input_history.last_update = jiffies - HZ;
-
 	for (i = 0; i < CFFPS_DEBUGFS_NUM_ENTRIES; ++i)
 		psu->debugfs_entries[i] = i;
 
-- 
1.8.3.1
