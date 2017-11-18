Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53535 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760368AbdKRD1B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Nov 2017 22:27:01 -0500
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net,
        robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        corbet@lwn.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 4/4] pmbus (max31785): Add dual tachometer support
Date: Sat, 18 Nov 2017 13:56:06 +1030
Message-Id: <fed48a38ef5481643b8d2027a7f4146ea7aaf2e0.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The dual tachometer feature is implemented in hardware with a TACHSEL
input to indicate the rotor under measurement, and exposed on the device
by extending the READ_FAN_SPEED_1 word with two extra bytes*. The need
to read the non-standard four-byte response leads to a cut-down
implementation of i2c_smbus_xfer_emulated() included in the driver.
Further, to expose the second rotor tachometer value to userspace the
values are exposed through virtual pages. We re-route accesses to
FAN_CONFIG_1_2 and READ_FAN_SPEED_1 on pages 23-28 (not defined by the
hardware) to the same registers on pages 0-5, and with the latter command we
extract the value from the second word of the four-byte response.

* The documentation recommends the slower rotor be associated with
TACHSEL=0, which corresponds to the first word of the response. The TACHSEL=0
measurement is used by the controller's closed-loop fan management to judge
target fan rate.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/max31785   |   8 +-
 drivers/hwmon/pmbus/max31785.c | 147 ++++++++++++++++++++++++++++++++++-
 2 files changed, 152 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
index 7b0a0a8cdb6b..270c5f865261 100644
--- a/Documentation/hwmon/max31785
+++ b/Documentation/hwmon/max31785
@@ -17,8 +17,9 @@ management with temperature and remote voltage sensing. Various fan control
 features are provided, including PWM frequency control, temperature hysteresis,
 dual tachometer measurements, and fan health monitoring.
 
-For dual rotor fan configuration, the MAX31785 exposes the slowest rotor of the
-two in the fan[1-4]_input attributes.
+For dual-rotor configurations the MAX31785A exposes the second rotor tachometer
+readings in attributes fan[5-8]_input. By contrast the MAX31785 only exposes
+the slowest rotor measurement, and does so in the fan[1-4]_input attributes.
 
 Usage Notes
 -----------
@@ -31,7 +32,8 @@ Sysfs attributes
 
 fan[1-4]_alarm		Fan alarm.
 fan[1-4]_fault		Fan fault.
-fan[1-4]_input		Fan RPM.
+fan[1-8]_input		Fan RPM. On the MAX31785A, inputs 5-8 correspond to the
+			second rotor of fans 1-4
 fan[1-4]_target		Fan input target
 
 in[1-6]_crit		Critical maximum output voltage
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 2699134dfbe7..b5389070ae06 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -16,9 +16,79 @@
 
 enum max31785_regs {
 	MFR_REVISION		= 0x9b,
+	MFR_FAN_CONFIG		= 0xf1,
 };
 
+#define MAX31785			0x3030
+#define MAX31785A			0x3040
+
+#define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
+
 #define MAX31785_NR_PAGES		23
+#define MAX31785_NR_FAN_PAGES		6
+
+static int max31785_read_byte_data(struct i2c_client *client, int page,
+				   int reg)
+{
+	if (page < MAX31785_NR_PAGES)
+		return -ENODATA;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		return -ENOTSUPP;
+	case PMBUS_FAN_CONFIG_12:
+		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
+					    reg);
+	}
+
+	return -ENODATA;
+}
+
+static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
+{
+	if (page < MAX31785_NR_PAGES)
+		return -ENODATA;
+
+	return -ENOTSUPP;
+}
+
+static int max31785_read_long_data(struct i2c_client *client, int page,
+				   int reg, u32 *data)
+{
+	unsigned char cmdbuf[1];
+	unsigned char rspbuf[4];
+	int rc;
+
+	struct i2c_msg msg[2] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = sizeof(cmdbuf),
+			.buf = cmdbuf,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(rspbuf),
+			.buf = rspbuf,
+		},
+	};
+
+	cmdbuf[0] = reg;
+
+	rc = pmbus_set_page(client, page);
+	if (rc < 0)
+		return rc;
+
+	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (rc < 0)
+		return rc;
+
+	*data = (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
+		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));
+
+	return rc;
+}
 
 static int max31785_get_pwm(struct i2c_client *client, int page)
 {
@@ -62,9 +132,30 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
 static int max31785_read_word_data(struct i2c_client *client, int page,
 				   int reg)
 {
+	u32 val;
 	int rv;
 
 	switch (reg) {
+	case PMBUS_READ_FAN_SPEED_1:
+		if (page < MAX31785_NR_PAGES)
+			return -ENODATA;
+
+		rv = max31785_read_long_data(client, page - MAX31785_NR_PAGES,
+					     reg, &val);
+		if (rv < 0)
+			return rv;
+
+		rv = (val >> 16) & 0xffff;
+		break;
+	case PMBUS_FAN_COMMAND_1:
+		/*
+		 * PMBUS_FAN_COMMAND_x is probed to judge whether or not to
+		 * expose fan control registers.
+		 *
+		 * Don't expose fan_target attribute for virtual pages.
+		 */
+		rv = (page >= MAX31785_NR_PAGES) ? -ENOTSUPP : -ENODATA;
+		break;
 	case PMBUS_VIRT_PWM_1:
 		rv = max31785_get_pwm(client, page);
 		break;
@@ -157,11 +248,15 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 #define MAX31785_VOUT_FUNCS \
 	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT)
 
+#define MAX37185_NUM_FAN_PAGES 6
+
 static const struct pmbus_driver_info max31785_info = {
 	.pages = MAX31785_NR_PAGES,
 
 	.write_word_data = max31785_write_word_data,
+	.read_byte_data = max31785_read_byte_data,
 	.read_word_data = max31785_read_word_data,
+	.write_byte = max31785_write_byte,
 
 	/* RPM */
 	.format[PSC_FAN] = direct,
@@ -208,13 +303,46 @@ static const struct pmbus_driver_info max31785_info = {
 	.func[22] = MAX31785_VOUT_FUNCS,
 };
 
+static int max31785_configure_dual_tach(struct i2c_client *client,
+					struct pmbus_driver_info *info)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
+		if (ret < 0)
+			return ret;
+
+		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {
+			int virtual = MAX31785_NR_PAGES + i;
+
+			info->pages = virtual + 1;
+			info->func[virtual] |= PMBUS_HAVE_FAN12;
+			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
+		}
+	}
+
+	return 0;
+}
+
 static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
+	bool dual_tach = false;
 	s64 ret;
 
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
 	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
@@ -225,6 +353,25 @@ static int max31785_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
+	ret = i2c_smbus_read_word_data(client, MFR_REVISION);
+	if (ret < 0)
+		return ret;
+
+	if (ret == MAX31785A) {
+		dual_tach = true;
+	} else if (ret == MAX31785) {
+		if (!strcmp("max31785a", id->name))
+			dev_warn(dev, "Expected max3175a, found max31785: cannot provide secondary tachometer readings\n");
+	} else {
+		return -ENODEV;
+	}
+
+	if (dual_tach) {
+		ret = max31785_configure_dual_tach(client, info);
+		if (ret < 0)
+			return ret;
+	}
+
 	return pmbus_do_probe(client, id, info);
 }
 
-- 
git-series 0.9.1
