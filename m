Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D5339719;
	Mon, 14 Sep 2026 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415957; cv=none; b=EIcSmdYQqXchXVLMPZpnQtq30t1bMKhHtaI908uJv0Px59O4lDhB/nb6un6KYohxRQAkMUuBM/6whn2bt5LgB6j+L9+0mKKQOOSl87naR9+s9EE46ccJiiwy9XolFZcAkbAa/jibPTYwFuk8pdv9Ly1+EcDhTfYpkh7xLNQK0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415957; c=relaxed/simple;
	bh=MbTK/BiDK32M+Hi83c8cfvVO9pH0nnM6KlxNarHoa18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8kp8dygPhl4w4QuN2zUXtpfkODNKhfIAxHskyoWgR6qtV9E3jx94RhLdLi/7QAnbwljd3PaMNgvPBZecXzFTVeHxwP5+KQ3Mef83GlGycr1UWf3tf0cRJNH5hdmccWhoEIwSy/sbsEqMFXJ3/ReU4A27DhqR9bF66gaSGI38D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=c4fHtoFz; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="c4fHtoFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1789415944; x=1789675144;
	bh=fTwBKA6RAontSyliE1HVRUhDjQpzvDmrCWyxP8N+KXc=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c4fHtoFzOg91SjUwZ0nXIOWg4pS1n0qcWKGETFvhiZSGb4isATVqC1E+xOKtPu2vM
	 L65Yq0imTcRtky5Z0+J/9ep5F2s7qaWc4oANso6dpbrf++aKtT9eECVpZbnhWDWVhB
	 DxJ4udfcuXGM4hsbZVAAD/8okOcaAJbnyyspJn6L9DkqMwaGMPgWpS6dh1k9lW1Y28
	 f8CVoIaqVdOKYzqPkaQqRo/EYcWnJUFUsk8m4l5L3EUPECtDZ9X1wzIAd9m9338F5k
	 NZCqZz1QjmDYZNZTzQgtetRwu6XCcwQoB1onRUVAg2Hh3SlgtCNTJr7jd1QrnRFBep
	 qKODD4Y+ERIWw==
X-Pm-Submission-Id: 4hkGDz6Cwpz2Sd3r
From: Vas Zayarskiy <contact@vasily.cc>
To: Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] hwmon: (aquacomputer_d5next) Add AMPINEL support
Date: Mon, 14 Sep 2026 22:57:22 +0300
Message-ID: <20260914195759.171524-1-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Aquacomputer AMPINEL power monitor currently exposes no hwmon
readings. Add read-only support for total power, total current, input
voltage, hotspot temperature, six channel currents and the device's
reported current deviation.

Decode the unsolicited 544-byte input reports from USB interface 1.
Validate the vendor collection, report length and ID, and use the
existing two-second expiry check to reject missing or stale readings.
Keep aggregate power and current in wire units in the existing caches
and convert them on read to avoid overflowing those caches. Reject power
values that cannot be represented by the hwmon long value on 32-bit
systems.

HID matching also claims the separate keyboard interface for this product
ID. Preserve its input and hidraw handling, including reset-resume, while
keeping it outside the sensor decoder.

Document the sensor mapping and update the Kconfig help. Channel labels
follow report order. No vendor configuration requests are sent, and
protection settings and alarm reporting are not implemented.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
This initial support is based on passive USB captures compared with video
of the device's own display at idle and under workload. It is intended
to make the observed telemetry available through standard hwmon readers.
The captures establish field scales and load response, not calibration
or exact equivalence between USB and display averaging.

Testing:
- Built and linked the module against Linux 7.2.5 with W=1.
- Built the driver object on this hwmon-next base (7.3-rc3), x86_64 with
  the driver configured as a module, and i386 built-in with SMP and PM
  disabled. Both configurations pass W=1 and sparse without findings.
- Replayed 995 reports through the actual C parser/read functions in a
  userspace harness with ASan/UBSan, malformed reports, stale reads,
  keyboard bypass, visibility and integer range checks. The harness
  also simulates the 32-bit long conversion bound. All seven Python
  capture/decoder tests pass, including filmed-display fixtures.
- checkpatch --strict reports no findings with the pending sign-off
  check excluded. The changed RST document renders without warnings.

Hardware testing used one AMPINEL (0c70:f015, USB bcdDevice 0100) connected
from its small USB header to an internal motherboard USB header on NixOS.
The C implementation passed 72/72 simultaneous raw-USB/hwmon comparisons
on 7.2.3 across module reload, USB-core unbind/rebind and deep suspend/
resume. Both input registration and keyboard capabilities were preserved.
Automatic loading and updating readings were subsequently verified after
reboot to 7.2.5 and after desktop-session changes. No executable C
statements have changed since those hardware tests; this preparation
adds a header include, comments, Kconfig and documentation updates.
The new 7.3-rc3 builds are compile/static checks, not hardware boots.

Review limits and questions:
- Alarm flags and configurable limits are not decoded. Is this initial
  telemetry-only scope acceptable? Their USB mappings are not established.
- Channel numbers are report order, not verified connector pin numbers.
  Current deviation is the reported value; its formula is unknown.
- Hotspot temperature was validated only above zero. The existing
  Aquacomputer 0x7fff unavailable convention is applied by analogy;
  an unavailable hotspot and negative encodings were not observed.
- USB bcdDevice is a descriptor value, not an independently verified
  firmware version. Other firmware, alarm-generated keyboard events,
  full power removal and physical unplug/replug remain untested. The
  internal header connection is not ordinarily unplugged during use.

AI assistance: Codex assisted with capture/display analysis, the C
implementation, tests and submission text in response to requests for
read-only Linux telemetry through the existing Aquacomputer driver.
Sparse was also used for static analysis.

 Documentation/hwmon/aquacomputer_d5next.rst |  14 ++
 drivers/hwmon/Kconfig                       |   4 +-
 drivers/hwmon/aquacomputer_d5next.c         | 146 +++++++++++++++++++-
 3 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/aquacomputer_d5next.rst b/Documentation/hwmon/aquacomputer_d5next.rst
index 49163f387..0d44626cf 100644
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
@@ -69,6 +70,19 @@ The Aquastream XT pump exposes temperature readings for the coolant, external se
 and fan IC. It also exposes pump and fan speeds (in RPM), voltages, as well as pump
 current.
 
+The AMPINEL exposes total power, total current, input voltage, hotspot
+temperature, six channel currents and current deviation. Channel numbers follow
+report order; their mapping to physical connector pins has not been verified.
+The readings are received approximately twice per second. The device connects
+to an internal motherboard USB header. Only sensor reads are supported; the
+driver does not configure the device's protection settings or report alarms.
+
+For AMPINEL, ``power1_input`` is total power, ``in0_input`` is input voltage,
+``temp1_input`` is hotspot temperature, ``curr1_input`` is total current,
+``curr[2-7]_input`` are the six channel currents, and ``curr8_input`` is the
+device-reported current deviation. The deviation formula is not known.
+Readings older than two seconds return an error instead of a cached value.
+
 The Aquastream Ultimate pump exposes coolant temp and an external temp sensor, along
 with speed, power, voltage and current of both the pump and optionally connected fan.
 It also exposes pressure and flow speed readings.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3d8b2c958..06cb246ff 100644
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
index 1ca70e726..b33d0ccc0 100644
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
@@ -19,9 +19,11 @@
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/ktime.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/unaligned.h>
+#include <linux/usb.h>
 
 #define USB_VENDOR_ID_AQUACOMPUTER	0x0c70
 #define USB_PRODUCT_ID_AQUAERO		0xf001
@@ -32,6 +34,7 @@
 #define USB_PRODUCT_ID_OCTO		0xf011
 #define USB_PRODUCT_ID_HIGHFLOWNEXT	0xf012
 #define USB_PRODUCT_ID_LEAKSHIELD	0xf014
+#define USB_PRODUCT_ID_AMPINEL		0xf015
 #define USB_PRODUCT_ID_AQUASTREAMXT	0xf0b6
 #define USB_PRODUCT_ID_AQUASTREAMULT	0xf00b
 #define USB_PRODUCT_ID_POWERADJUST3	0xf0bd
@@ -40,7 +43,7 @@
 enum kinds {
 	d5next, farbwerk, farbwerk360, octo, quadro,
 	highflownext, aquaero, poweradjust3, aquastreamult,
-	aquastreamxt, leakshield, highflow
+	aquastreamxt, leakshield, highflow, ampinel
 };
 
 static const char *const aqc_device_names[] = {
@@ -55,7 +58,8 @@ static const char *const aqc_device_names[] = {
 	[aquaero] = "aquaero",
 	[aquastreamult] = "aquastreamultimate",
 	[poweradjust3] = "poweradjust3",
-	[highflow] = "highflow" /* Covers MPS Flow devices */
+	[highflow] = "highflow", /* Covers MPS Flow devices */
+	[ampinel] = "ampinel"
 };
 
 #define DRIVER_NAME			"aquacomputer_d5next"
@@ -110,6 +114,17 @@ static u8 aquaero_secondary_ctrl_report[] = {
 #define AQC_FAN_POWER_OFFSET		0x06
 #define AQC_FAN_SPEED_OFFSET		0x08
 
+/* AMPINEL offsets include the report ID byte. */
+#define AMPINEL_DATA_INTERFACE		1
+#define AMPINEL_STATUS_REPORT_SIZE	544
+#define AMPINEL_NUM_CHANNELS		6
+#define AMPINEL_CHANNEL_CURRENT_START	0x6f
+#define AMPINEL_POWER			0xc7
+#define AMPINEL_CURRENT			0xc9
+#define AMPINEL_CURRENT_DEVIATION		0xcb
+#define AMPINEL_VOLTAGE			0xcf
+#define AMPINEL_HOTSPOT			0xe1
+
 /* Specs of the Aquaero fan controllers */
 #define AQUAERO_SERIAL_START			0x07
 #define AQUAERO_FIRMWARE_VERSION		0x0B
@@ -515,6 +530,25 @@ static const char *const label_highflow_speeds[] = {
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
+	"Channel 4", "Channel 5", "Channel 6",
+	"Current deviation"
+};
+
 struct aqc_fan_structure_offsets {
 	u8 voltage;
 	u8 curr;
@@ -868,6 +902,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
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
@@ -888,6 +926,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
 		break;
 	case hwmon_curr:
 		switch (priv->kind) {
+		case ampinel:
+			if (channel < AMPINEL_NUM_CHANNELS + 2)
+				return 0444;
+			break;
 		case aquastreamult:
 			/* Special case to support pump and fan current */
 			if (channel < 2)
@@ -906,6 +948,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
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
@@ -1071,6 +1117,12 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	case hwmon_power:
 		*val = priv->power_input[channel];
+		if (priv->kind == ampinel) {
+			/* AMPINEL caches deciwatts to avoid overflowing u32. */
+			if (*val > LONG_MAX / 100000)
+				return -ERANGE;
+			*val *= 100000;
+		}
 		break;
 	case hwmon_pwm:
 		switch (priv->kind) {
@@ -1097,6 +1149,9 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	case hwmon_curr:
 		*val = priv->current_input[channel];
+		/* AMPINEL caches total current in centiamperes to fit u16. */
+		if (priv->kind == ampinel && channel == 0)
+			*val *= 10;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1324,6 +1379,34 @@ static const struct hwmon_chip_info aqc_chip_info = {
 	.info = aqc_info,
 };
 
+static int aqc_ampinel_raw_event(struct aqc_data *priv, const u8 *data, int size)
+{
+	int i, sensor_value;
+
+	if (size != AMPINEL_STATUS_REPORT_SIZE || data[0] != STATUS_REPORT_ID)
+		return 0;
+
+	priv->serial_number[0] = get_unaligned_be16(data + AQC_SERIAL_START);
+	priv->serial_number[1] = get_unaligned_be16(data + AQC_SERIAL_START + SERIAL_PART_OFFSET);
+
+	/* Keep aggregate power and current in wire units until aqc_read(). */
+	priv->power_input[0] = get_unaligned_be16(data + AMPINEL_POWER);
+	priv->current_input[0] = get_unaligned_be16(data + AMPINEL_CURRENT);
+	for (i = 0; i < AMPINEL_NUM_CHANNELS; i++)
+		priv->current_input[i + 1] =
+			get_unaligned_be16(data + AMPINEL_CHANNEL_CURRENT_START +
+					   i * AQC_SENSOR_SIZE);
+	priv->current_input[AMPINEL_NUM_CHANNELS + 1] =
+		get_unaligned_be16(data + AMPINEL_CURRENT_DEVIATION);
+	priv->voltage_input[0] = get_unaligned_be16(data + AMPINEL_VOLTAGE);
+
+	sensor_value = get_unaligned_be16(data + AMPINEL_HOTSPOT);
+	priv->temp_input[0] = sensor_value == AQC_SENSOR_NA ? -ENODATA : sensor_value * 10;
+	priv->updated = jiffies;
+
+	return 0;
+}
+
 static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
 {
 	int i, j, sensor_value;
@@ -1333,6 +1416,14 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 		return 0;
 
 	priv = hid_get_drvdata(hdev);
+	/* The AMPINEL keyboard interface has no hwmon device. */
+	if (!priv->hwmon_dev)
+		return 0;
+	if (priv->kind == ampinel) {
+		if (report->type != HID_INPUT_REPORT)
+			return 0;
+		return aqc_ampinel_raw_event(priv, data, size);
+	}
 
 	/* Info provided with every report */
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
@@ -1517,6 +1608,8 @@ static void aqc_debugfs_init(struct aqc_data *priv)
 
 static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
+	struct hid_report *report;
+	struct usb_interface *intf;
 	struct aqc_data *priv;
 	int ret;
 
@@ -1533,6 +1626,27 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		return ret;
 
+	if (hdev->product == USB_PRODUCT_ID_AMPINEL) {
+		intf = to_usb_interface(hdev->dev.parent);
+		/*
+		 * hid-generic yields every interface matching our product ID.
+		 * Preserve input and hidraw on the separate keyboard interface.
+		 */
+		if (intf->cur_altsetting->desc.bInterfaceNumber != AMPINEL_DATA_INTERFACE) {
+			hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+			return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+		}
+
+		report = hdev->report_enum[HID_INPUT_REPORT].report_id_hash[STATUS_REPORT_ID];
+		if (hdev->maxcollection != 1 ||
+		    hdev->collection[0].usage != (HID_UP_MSVENDOR | 1) ||
+		    !report || report->size != (AMPINEL_STATUS_REPORT_SIZE - 1) * 8)
+			return -ENODEV;
+
+		/* Do not expose zero readings before the first complete report. */
+		priv->updated--;
+	}
+
 	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
 	if (ret)
 		return ret;
@@ -1542,6 +1656,14 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto fail_and_stop;
 
 	switch (hdev->product) {
+	case USB_PRODUCT_ID_AMPINEL:
+		priv->kind = ampinel;
+		priv->num_temp_sensors = 1;
+		priv->temp_label = label_ampinel_temp;
+		priv->power_label = label_ampinel_power;
+		priv->voltage_label = label_ampinel_voltage;
+		priv->current_label = label_ampinel_current;
+		break;
 	case USB_PRODUCT_ID_AQUAERO:
 		/*
 		 * Aquaero presents itself as three HID devices under the same product ID:
@@ -1791,6 +1913,9 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	switch (priv->kind) {
+	case ampinel:
+		priv->serial_number_start_offset = AQC_SERIAL_START;
+		break;
 	case aquaero:
 		priv->serial_number_start_offset = AQUAERO_SERIAL_START;
 		priv->firmware_version_offset = AQUAERO_FIRMWARE_VERSION;
@@ -1870,6 +1995,11 @@ static void aqc_remove(struct hid_device *hdev)
 {
 	struct aqc_data *priv = hid_get_drvdata(hdev);
 
+	if (!priv->hwmon_dev) {
+		hid_hw_stop(hdev);
+		return;
+	}
+
 	debugfs_remove_recursive(priv->debugfs);
 	hwmon_device_unregister(priv->hwmon_dev);
 
@@ -1877,6 +2007,14 @@ static void aqc_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
+static int aqc_reset_resume(struct hid_device *hdev)
+{
+	if (hdev->claimed & HID_CLAIMED_INPUT)
+		hidinput_reset_resume(hdev);
+
+	return 0;
+}
+
 static const struct hid_device_id aqc_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUAERO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_D5NEXT) },
@@ -1886,6 +2024,7 @@ static const struct hid_device_id aqc_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_QUADRO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_HIGHFLOWNEXT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_LEAKSHIELD) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AMPINEL) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUASTREAMXT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUASTREAMULT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_POWERADJUST3) },
@@ -1901,6 +2040,7 @@ static struct hid_driver aqc_driver = {
 	.probe = aqc_probe,
 	.remove = aqc_remove,
 	.raw_event = aqc_raw_event,
+	.reset_resume = aqc_reset_resume,
 };
 
 static int __init aqc_init(void)

base-commit: 46fde107b4e881f179bf02bca69d8a0020561b3c
-- 
2.54.0

