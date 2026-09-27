Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB49439349
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536442; cv=none; b=bpG31sk3+smNCNdQqXgaG6fYPPYvIc3Mxj8S8jB746HrItUYwpKIbrXRDpCHG7jEK12V0nOgUdllCWhGab+U84PFHk80u2IvdE9+xpAG3GG+0mbSq8AeAdzkwQgwdYcjg9uqBCLrguUOM+/FSK0KYrjjqiYZk5yAEgv2InXBbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536442; c=relaxed/simple;
	bh=Eahv06AYI96KqZVESUl9ndmaKnqCRsjCXd00t3HdZuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyY4cwmYqBBlZjcXieTryp+T2bQ9IdftuQzsPje72hWMC+MRWmV2X73dfdepMFq5XcF2ctHgkDq/o/RIgpVqVbOw0Jy16fXcqIqGRu/h5Cu6DiexpJXkjO6tvrttBmmGlw7wwvXJPCO4mF9hN3q2qDdpvqwe+zMQTgtAuNlDfcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=oSGoTGGi; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="oSGoTGGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536434; x=1790795634;
	bh=oqpU06ywyxTNnE55A9o2CRSoLVTFAAlyS0a2smR7S2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oSGoTGGiCcxenyYrzMA8BiTkXwS0TzOlEvvkC8IG0BOJVhquIVzjkuMopkR8m2Kuz
	 T4BdC4XwKpQ4lmh2+CIXkepAqaBTfLr1jlXm9FSNM4VrKLy1HYCQfimdkQTrksKi8B
	 7pcU744u1q6meuqHXam+LduOoiwAifw0mATqX4Nn80gQf1LC/jiD4oWP6BWtcoECJn
	 ciOabZvkJNF0Pzs6I81gfsyD0zwYwNn021qBNcxKZwxXJZO8OMCsIdkKxX5yBB9A5D
	 bFN0vjZPFyZ7cEfTMRwWz64vME1VaXzk0SsrM4Di36I+amywQZwgL5O4IXYQyaxYLY
	 pEEDjOswK7c3Q==
X-Pm-Submission-Id: 4htDcv5VYTz2ScDC
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 5/5] hwmon: (aquacomputer_d5next) Add AMPINEL telemetry support
Date: Sun, 27 Sep 2026 22:13:16 +0300
Message-ID: <20260927191316.4137752-6-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read-only total power, total current, input voltage, hotspot
temperature and six channel currents for the Aquacomputer AMPINEL.

Decode its 544-byte input report through the existing serial-number,
temperature and update path, with power, current and voltage handled in
the device-specific switch. Store all readings in hwmon units.

Select the telemetry interface in probe by its vendor collection and
input report layout, following the existing Aquaero and Leakshield
probe filtering. No match callback or HID core change is required.

The separate keyboard interface is not supported. The driver rejects
it in probe, and stock hid-generic yields to this driver's product ID
entry, leaving it unbound. This intentionally limits support to telemetry;
keyboard support can be addressed separately. Channel labels follow
report order; configuration and alarms are not supported.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
Changes in v5: Mark the AMPINEL power-cache write with WRITE_ONCE().

 Documentation/hwmon/aquacomputer_d5next.rst | 13 ++++
 drivers/hwmon/Kconfig                       |  4 +-
 drivers/hwmon/aquacomputer_d5next.c         | 81 ++++++++++++++++++++-
 3 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/aquacomputer_d5next.rst b/Documentation/hwmon/aquacomputer_d5next.rst
index 49163f387..ad8f85b1c 100644
--- a/Documentation/hwmon/aquacomputer_d5next.rst
+++ b/Documentation/hwmon/aquacomputer_d5next.rst
@@ -13,6 +13,7 @@ Supported devices:
 * Aquacomputer Quadro fan controller
 * Aquacomputer High Flow Next sensor
 * Aquacomputer Leakshield leak prevention system
+* Aquacomputer AMPINEL power monitor
 * Aquacomputer Aquastream XT watercooling pump
 * Aquacomputer Aquastream Ultimate watercooling pump
 * Aquacomputer Poweradjust 3 fan controller
@@ -69,6 +70,18 @@ The Aquastream XT pump exposes temperature readings for the coolant, external se
 and fan IC. It also exposes pump and fan speeds (in RPM), voltages, as well as pump
 current.
 
+The AMPINEL exposes total power, total current, input voltage, hotspot
+temperature and six channel currents. Channel numbers follow report order;
+their mapping to physical connector pins has not been verified. The readings
+are received approximately twice per second. Only sensor reads are supported;
+the driver does not configure protection settings or report alarms.
+The separate keyboard interface is not supported and remains unbound while
+this driver is registered.
+
+For AMPINEL, ``power1_input`` is total power, ``in0_input`` is input voltage,
+``temp1_input`` is hotspot temperature, ``curr1_input`` is total current, and
+``curr[2-7]_input`` are the six channel currents.
+
 The Aquastream Ultimate pump exposes coolant temp and an external temp sensor, along
 with speed, power, voltage and current of both the pump and optionally connected fan.
 It also exposes pressure and flow speed readings.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a..ae90f4894 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -257,14 +257,14 @@ config SENSORS_AHT10
 	  will be called aht10.
 
 config SENSORS_AQUACOMPUTER_D5NEXT
-	tristate "Aquacomputer D5 Next, Octo, Quadro, Farbwerk, Farbwerk 360, High Flow Next"
+	tristate "Aquacomputer D5 Next and other USB devices"
 	depends on USB_HID
 	select CRC16
 	help
 	  If you say yes here you get support for sensors and fans of
 	  the Aquacomputer D5 Next watercooling pump, Octo and Quadro fan
 	  controllers, Farbwerk and Farbwerk 360 RGB controllers, High Flow
-	  Next sensor, where available.
+	  Next sensor and AMPINEL power monitor, where available.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called aquacomputer_d5next.
diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 13272eb88..1fb447be9 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -2,7 +2,7 @@
 /*
  * hwmon driver for Aquacomputer devices (D5 Next, Farbwerk, Farbwerk 360, Octo,
  * Quadro, High Flow Next, Aquaero, Aquastream Ultimate, Leakshield,
- * High Flow USB/MPS Flow family)
+ * High Flow USB/MPS Flow family, AMPINEL)
  *
  * Aquacomputer devices send HID reports (with ID 0x01) every second to report
  * sensor values, except for devices that communicate through the
@@ -33,6 +33,7 @@
 #define USB_PRODUCT_ID_OCTO		0xf011
 #define USB_PRODUCT_ID_HIGHFLOWNEXT	0xf012
 #define USB_PRODUCT_ID_LEAKSHIELD	0xf014
+#define USB_PRODUCT_ID_AMPINEL		0xf015
 #define USB_PRODUCT_ID_AQUASTREAMXT	0xf0b6
 #define USB_PRODUCT_ID_AQUASTREAMULT	0xf00b
 #define USB_PRODUCT_ID_POWERADJUST3	0xf0bd
@@ -41,7 +42,7 @@
 enum kinds {
 	d5next, farbwerk, farbwerk360, octo, quadro,
 	highflownext, aquaero, poweradjust3, aquastreamult,
-	aquastreamxt, leakshield, highflow
+	aquastreamxt, leakshield, highflow, ampinel
 };
 
 static const char *const aqc_device_names[] = {
@@ -56,7 +57,8 @@ static const char *const aqc_device_names[] = {
 	[aquaero] = "aquaero",
 	[aquastreamult] = "aquastreamultimate",
 	[poweradjust3] = "poweradjust3",
-	[highflow] = "highflow" /* Covers MPS Flow devices */
+	[highflow] = "highflow", /* Covers MPS Flow devices */
+	[ampinel] = "ampinel",
 };
 
 #define DRIVER_NAME			"aquacomputer_d5next"
@@ -111,6 +113,15 @@ static u8 aquaero_secondary_ctrl_report[] = {
 #define AQC_FAN_POWER_OFFSET		0x06
 #define AQC_FAN_SPEED_OFFSET		0x08
 
+/* AMPINEL offsets include the report ID byte. */
+#define AMPINEL_STATUS_REPORT_SIZE	544
+#define AMPINEL_NUM_CHANNELS		6
+#define AMPINEL_CHANNEL_CURRENT_START	0x6f
+#define AMPINEL_POWER			0xc7
+#define AMPINEL_CURRENT			0xc9
+#define AMPINEL_VOLTAGE			0xcf
+#define AMPINEL_HOTSPOT			0xe1
+
 /* Specs of the Aquaero fan controllers */
 #define AQUAERO_SERIAL_START			0x07
 #define AQUAERO_FIRMWARE_VERSION		0x0B
@@ -516,6 +527,24 @@ static const char *const label_highflow_speeds[] = {
 	"Flow speed [dL/h]"
 };
 
+static const char *const label_ampinel_temp[] = {
+	"Hotspot"
+};
+
+static const char *const label_ampinel_power[] = {
+	"Total power"
+};
+
+static const char *const label_ampinel_voltage[] = {
+	"VCC In"
+};
+
+static const char *const label_ampinel_current[] = {
+	"Total current",
+	"Channel 1", "Channel 2", "Channel 3",
+	"Channel 4", "Channel 5", "Channel 6"
+};
+
 struct aqc_fan_structure_offsets {
 	u8 voltage;
 	u8 curr;
@@ -869,6 +898,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
 		break;
 	case hwmon_power:
 		switch (priv->kind) {
+		case ampinel:
+			if (channel == 0)
+				return 0444;
+			break;
 		case aquastreamult:
 			/* Special case to support pump and fan power */
 			if (channel < 2)
@@ -889,6 +922,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
 		break;
 	case hwmon_curr:
 		switch (priv->kind) {
+		case ampinel:
+			if (channel < AMPINEL_NUM_CHANNELS + 1)
+				return 0444;
+			break;
 		case aquastreamult:
 			/* Special case to support pump and fan current */
 			if (channel < 2)
@@ -907,6 +944,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
 		break;
 	case hwmon_in:
 		switch (priv->kind) {
+		case ampinel:
+			if (channel == 0)
+				return 0444;
+			break;
 		case d5next:
 			/* Special case to support +5V and +12V voltage sensors */
 			if (channel < priv->num_fans + 2)
@@ -1398,6 +1439,17 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 
 	/* Special-case sensor readings */
 	switch (priv->kind) {
+	case ampinel:
+		WRITE_ONCE(priv->power_input[0],
+			   min_t(u64, get_unaligned_be16(data + AMPINEL_POWER) * 100000ULL,
+				 LONG_MAX));
+		priv->current_input[0] = get_unaligned_be16(data + AMPINEL_CURRENT) * 10;
+		for (i = 0; i < AMPINEL_NUM_CHANNELS; i++)
+			priv->current_input[i + 1] =
+				get_unaligned_be16(data + AMPINEL_CHANNEL_CURRENT_START +
+						   i * AQC_SENSOR_SIZE);
+		priv->voltage_input[0] = get_unaligned_be16(data + AMPINEL_VOLTAGE);
+		break;
 	case aquaero:
 		/* Read calculated virtual temp sensors */
 		i = priv->num_temp_sensors + priv->num_virtual_temp_sensors;
@@ -1526,6 +1578,7 @@ static void aqc_debugfs_init(struct aqc_data *priv)
 
 static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
+	struct hid_report *report;
 	struct aqc_data *priv;
 	int ret;
 
@@ -1551,6 +1604,24 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto fail_and_stop;
 
 	switch (hdev->product) {
+	case USB_PRODUCT_ID_AMPINEL:
+		/* The other AMPINEL HID interface is a keyboard. */
+		report = hdev->report_enum[HID_INPUT_REPORT].report_id_hash[STATUS_REPORT_ID];
+		if (hdev->maxcollection != 1 ||
+		    hdev->collection[0].usage != (HID_UP_MSVENDOR | 1) ||
+		    !report || report->size != (AMPINEL_STATUS_REPORT_SIZE - 1) * 8) {
+			ret = -ENODEV;
+			goto fail_and_close;
+		}
+
+		priv->kind = ampinel;
+		priv->num_temp_sensors = 1;
+		priv->temp_sensor_start_offset = AMPINEL_HOTSPOT;
+		priv->temp_label = label_ampinel_temp;
+		priv->power_label = label_ampinel_power;
+		priv->voltage_label = label_ampinel_voltage;
+		priv->current_label = label_ampinel_current;
+		break;
 	case USB_PRODUCT_ID_AQUAERO:
 		/*
 		 * Aquaero presents itself as three HID devices under the same product ID:
@@ -1800,6 +1871,9 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	switch (priv->kind) {
+	case ampinel:
+		priv->serial_number_start_offset = AQC_SERIAL_START;
+		break;
 	case aquaero:
 		priv->serial_number_start_offset = AQUAERO_SERIAL_START;
 		priv->firmware_version_offset = AQUAERO_FIRMWARE_VERSION;
@@ -1895,6 +1969,7 @@ static const struct hid_device_id aqc_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_QUADRO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_HIGHFLOWNEXT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_LEAKSHIELD) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AMPINEL) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUASTREAMXT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUASTREAMULT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_POWERADJUST3) },
