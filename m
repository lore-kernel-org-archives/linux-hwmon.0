Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040110;
	b=UGZ7WYJVCRnSpOmyOwG8z7Eyud/DeTI5L7hVUhTIEIgrf/ZpI+WV0J6W6Ylurlbb81q9
	 6Ty5QXMTOO/up5KmWNntJiCtjRSh6o6fG7OjEO6HtXQNc1h9ppuwGVqGPmPY20a2d2T/J
	 ozSF4cHQgXkT1pBDVOOqKLPvvbqiIwPWRtUGZAj2HklS7FxPV0ebQ6ffq0K2ZEPgsKH4k
	 5It+syDP4xCcYhBx+uIK/DlHxUpvKZg3XDAz5gyk6bm7Esbtg576ZjQJkEKYb34YiEBlb
	 bjW+I+hKAEbHN+ibLafQxn4d4U3QCqnAZXrAGAKf8BcG3g3/38aBp/lqxUS8kH8xtwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040110;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=W+pnNjGf5B9r7E40olMY7AWbSxvx4+mdcqd2CLf9qEc=;
	b=ejrysJ6xq802f8/7glosui4UOoXaBRaaLVNX2IV6ZqI2fRKpmaoMS5sED8icssjh1n2L
	 dp5GUUc2P5PmRxTiWup045/ybCSA6gNLumm22yvNbYG0AuTycYgwTH+nbA1KbR7EALQJb
	 X3nswkidMXhn/O89zcKm7cpV0yQ5SQuzBBNj+hDHheHm82VTcbW7PgPxRinRMSZzDE5tC
	 9typLUJyz/HyCS5X4wumHv/kGKvs7ee0TmDVBkMunqdDATM7G1qhV1cO6OfIyKHuP4X8s
	 tX5Uv01f01iPSj25Epr5gPEmCpeShCKNt2Ut8fgPaPzeE/zUB4uZeHhBpReYxxpOrKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=OrQ45juK;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D79606A326;
	Sat,  7 Nov 2026 08:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D79606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=OrQ45juK
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jM8MF0NMgzMlRG;
	Sat, 07 Nov 2026 09:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794040105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W+pnNjGf5B9r7E40olMY7AWbSxvx4+mdcqd2CLf9qEc=;
	b=OrQ45juK9bGoiHJrzk45dAVbzDKMfID7T18GXwEzDJGC6Sb9M+qkE+BJ/jmlYuVWu+Vs9L
	mFst0M5HtxucI84huxPzNnIW199eink54EZ6kNYVZK2pDdXuBLATLY/zCaUM8v33LNt66o
	DMr090IIj3P33zkPpN8J/RayKAIc4BuzW+mdPOqzTtht4hHOf3L1yObZmEZ6nAHk9qIjT3
	IeeD4kXdn7/8cSuAq6JR9XKbHQTe/QgzKIDWi5crRzPhfEHculJYrpoWNTk7xnH3Xr3UYu
	A9/SgPdWmHzVdIfyOn1RCRw3XMeD2JzYdNZtnx1cK4sS2NtqO1mLd5gYPwZnpg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 09:28:21 +0100
Message-ID: <20261107082821.8257-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jM8MF0NMgzMlRG

MSI 800-series motherboards have a USB microcontroller (0db0:0076) that
drives the RGB LED headers. Besides the LEDs, it measures a few voltage
rails that are not monitored by the Super I/O chip, and reports them in
HID feature report 0xf0.

Add a driver that reads this report and exposes the rails as standard
hwmon voltage attributes with labels. The values are cached for one
second. The driver never writes to the device and keeps the hidraw
interface, so user space tools that control the LEDs through hidraw keep
working.

The controller has the same USB ID on different boards, while the rails
and their position in the report depend on the board. The driver is
therefore only registered on supported boards, which are matched by DMI.
On other boards the device stays with hid-generic. Probe reads the
report once, fails if it cannot be read or has an unexpected format, and
only exposes the rails that return a reading. For now only the MAG B850M
MORTAR WIFI (MS-7E61) is supported.

The report layout was determined by analysing the vendor's Windows
software and confirmed on hardware.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61, BIOS 1.A68), with the
driver built out of tree against kernel 7.2.15. The readings (CPU 1P8
1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V) are stable and plausible for
the respective rails, repeated reads within one second are served from
the cache, and hidraw access works while the driver is bound. Loading
and unloading the module repeatedly hands the device back to hid-generic
without errors.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
Changes in v2:
- Use 64-bit jiffies for the cache timestamp (Sashiko)
- Pass HID_CONNECT_DRIVER so the driver works with CONFIG_HIDRAW=n (Sashiko)
- Match supported boards by DMI instead of the USB serial number; register
  the driver and load the module only on those boards (Guenter)
- Read and validate the sensor report in probe, and fail probe if that
  does not work (Guenter)
- Expose only the rails that return a reading in probe, drop -ENODATA,
  and fail probe if no rail returns a reading (Guenter)
- Initialize the cache timestamp with the first read in probe (Guenter)
- Take a runtime PM reference around the feature report request
- Add build-time checks for the board tables
- Depend on DMI || COMPILE_TEST, name the supported board in Kconfig, and
  update the documentation and comments
- Describe the test as loading and unloading the module
- Retest on MS-7E61
- Sashiko review of v1: https://sashiko.dev/#/patchset/20261106184357.27763-1-tomasz@bojanowski.me
- Link to v1: https://lore.kernel.org/r/20261106184357.27763-1-tomasz@bojanowski.me

I used an AI assistant (Claude Code) during development. I reviewed all
of the changes, tested them on the hardware described above, and take
responsibility for them.

 Documentation/hwmon/index.rst            |   1 +
 Documentation/hwmon/msi_mystic_light.rst |  64 +++++
 MAINTAINERS                              |   7 +
 drivers/hwmon/Kconfig                    |  13 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/msi_mystic_light.c         | 324 +++++++++++++++++++++++
 6 files changed, 410 insertions(+)
 create mode 100644 Documentation/hwmon/msi_mystic_light.rst
 create mode 100644 drivers/hwmon/msi_mystic_light.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index a8ea421128b5..7ce1a6f42ddc 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -213,6 +213,7 @@ Hardware Monitoring Kernel Drivers
    mpq82d00
    mpq8646
    mpq8785
+   msi_mystic_light
    nct6683
    nct6775
    nct7363
diff --git a/Documentation/hwmon/msi_mystic_light.rst b/Documentation/hwmon/msi_mystic_light.rst
new file mode 100644
index 000000000000..f5847a6b96cc
--- /dev/null
+++ b/Documentation/hwmon/msi_mystic_light.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver msi_mystic_light
+==============================
+
+Supported devices:
+
+* MSI Mystic Light USB controller (USB ID 0db0:0076) on these MSI
+  800-series motherboards:
+
+  - MSI MAG B850M MORTAR WIFI (MS-7E61)
+
+Author: Tomasz Bojanowski <tomasz@bojanowski.me>
+
+Description
+-----------
+
+On MSI 800-series motherboards the RGB LED headers ("Mystic Light") are
+driven by a microcontroller attached over USB. The controller also measures
+a few voltage rails that are not monitored by the Super I/O chip (see
+nct6683). This driver reports these voltages.
+
+The controller has the same USB ID on different boards, while the rails
+that are present, and their position in the sensor report, depend on the
+motherboard. The driver is therefore only registered on supported boards,
+which are identified by DMI. On other boards the controller is left to
+hid-generic.
+
+When probing the controller, the driver reads the sensor report once. If
+the report cannot be read or does not have the expected format, the driver
+does not bind to the device. Only the rails that return a reading are
+exposed.
+
+The driver never writes to the controller. The only request it sends is
+a read of HID feature report 0xf0. While the driver is bound, the device
+is kept open, so its interrupt endpoint is polled as it is with the
+vendor software. The hidraw interface remains available, so user space
+tools that control the LEDs keep working.
+
+Usage Notes
+-----------
+
+The sensor values are cached for one second. If the sensor report cannot
+be read later, or does not have the expected format, reading fails with an
+error, for example -EPROTO.
+
+Sysfs entries
+-------------
+
+=============== =========================================================
+in[0-2]_input   Voltage in millivolts
+in[0-2]_label   Rail name
+=============== =========================================================
+
+MSI MAG B850M MORTAR WIFI (MS-7E61)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+======= ========= ==========================
+Channel Label     Typical value
+======= ========= ==========================
+in0     CPU 1P8   1.79 V
+in1     CHIP Core 1.04 V
+in2     VDD MISC  1.10 V
+======= ========= ==========================
diff --git a/MAINTAINERS b/MAINTAINERS
index 873a8beb15b6..8f02d3f3c3f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19093,6 +19093,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/msi-laptop.c
 
+MSI MYSTIC LIGHT HARDWARE MONITORING DRIVER
+M:	Tomasz Bojanowski <tomasz@bojanowski.me>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/msi_mystic_light.rst
+F:	drivers/hwmon/msi_mystic_light.c
+
 MSI WMI SUPPORT
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3ae676a56d95..9979958a59a2 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1570,6 +1570,19 @@ config SENSORS_MR75203
 	  This driver can also be built as a module. If so, the module
 	  will be called mr75203.
 
+config SENSORS_MSI_MYSTIC_LIGHT
+	tristate "MSI Mystic Light USB controller voltage sensors"
+	depends on USB_HID
+	depends on DMI || COMPILE_TEST
+	help
+	  If you say yes here you get support for the voltage sensors of the
+	  MSI Mystic Light USB controller (0db0:0076) found on MSI 800-series
+	  motherboards. Currently the MSI MAG B850M MORTAR WIFI (MS-7E61) is
+	  supported.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called msi_mystic_light.
+
 config SENSORS_ADCXX
 	tristate "National Semiconductor ADCxxxSxxx"
 	depends on SPI_MASTER
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index be3eb0992a0d..ec4b0de8cf47 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
 obj-$(CONFIG_SENSORS_MINISFORUM_UM780XTX) += minisforum-um780xtx.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
+obj-$(CONFIG_SENSORS_MSI_MYSTIC_LIGHT) += msi_mystic_light.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
 obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_light.c
new file mode 100644
index 000000000000..a27bb9916588
--- /dev/null
+++ b/drivers/hwmon/msi_mystic_light.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * hwmon driver for the voltage sensors of the MSI Mystic Light USB
+ * controller (0db0:0076) found on MSI 800-series motherboards
+ *
+ * The microcontroller that drives the RGB LED headers of these boards also
+ * measures a few voltage rails that are not monitored by the Super I/O chip.
+ * They are returned in HID feature report 0xf0. This driver only reads that
+ * report and never sends anything else to the device. The hidraw interface
+ * is kept, so user space LED control keeps working.
+ *
+ * The controller has the same USB ID on different boards, while the rails
+ * and their position in the report depend on the board. The driver is
+ * therefore only registered on supported boards, which are matched by DMI.
+ *
+ * Copyright (C) 2026 Tomasz Bojanowski <tomasz@bojanowski.me>
+ */
+
+#include <linux/bits.h>
+#include <linux/build_bug.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#define USB_VENDOR_ID_MSI_MB		0x0db0
+#define USB_PRODUCT_ID_MYSTIC_LIGHT	0x0076
+
+#define MSI_ML_SENSOR_REPORT_ID		0xf0
+#define MSI_ML_SENSOR_REPORT_SIZE	64
+
+/* Fixed bytes found in every sensor report: 0xa0 at [1], 01 fc at [9..10] */
+#define MSI_ML_SENSOR_CMD_OFFSET	1
+#define MSI_ML_SENSOR_CMD		0xa0
+#define MSI_ML_SENSOR_PAGE_OFFSET	9
+#define MSI_ML_SENSOR_PAGE_HI		0x01
+#define MSI_ML_SENSOR_PAGE_LO		0xfc
+
+#define MSI_ML_MAX_IN			3
+#define MSI_ML_CACHE_TIME		HZ
+
+struct msi_ml_board {
+	int num_in;
+	const char *const *in_label;
+	/* little endian u16 in mV, offset at most MSI_ML_SENSOR_REPORT_SIZE - 2 */
+	const u8 *in_offset;
+};
+
+/* MAG B850M MORTAR WIFI (MS-7E61) */
+static const char *const msi_ml_7e61_in_label[] = {
+	"CPU 1P8", "CHIP Core", "VDD MISC",
+};
+
+static const u8 msi_ml_7e61_in_offset[] = { 23, 17, 25 };
+
+static_assert(ARRAY_SIZE(msi_ml_7e61_in_label) ==
+	      ARRAY_SIZE(msi_ml_7e61_in_offset));
+static_assert(ARRAY_SIZE(msi_ml_7e61_in_label) <= MSI_ML_MAX_IN);
+
+static const struct msi_ml_board msi_ml_7e61 = {
+	.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
+	.in_label = msi_ml_7e61_in_label,
+	.in_offset = msi_ml_7e61_in_offset,
+};
+
+static const struct dmi_system_id msi_ml_dmi_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International"),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-7E61"),
+		},
+		.driver_data = (void *)&msi_ml_7e61,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, msi_ml_dmi_table);
+
+/* Board matched by DMI, set once before the HID driver is registered */
+static const struct msi_ml_board *msi_ml_board;
+
+struct msi_ml_data {
+	struct hid_device *hdev;
+	struct device *hwmon_dev;
+	const struct msi_ml_board *board;
+	u8 *buf;			/* report buffer, must be DMA safe */
+	u16 in[MSI_ML_MAX_IN];		/* mV */
+	unsigned int in_mask;		/* rails with a reading in probe */
+	u64 updated;			/* jiffies of the last successful read */
+};
+
+/*
+ * Read the sensor report. Called from probe before the hwmon device is
+ * registered, and afterwards only from the hwmon read callback, which the
+ * hwmon core serializes. No additional locking is needed for the buffer
+ * and the cached values.
+ */
+static int msi_ml_read_report(struct msi_ml_data *priv)
+{
+	const struct msi_ml_board *board = priv->board;
+	u8 *buf = priv->buf;
+	int i, ret;
+
+	memset(buf, 0, MSI_ML_SENSOR_REPORT_SIZE);
+	buf[0] = MSI_ML_SENSOR_REPORT_ID;
+
+	/* Make sure the device is not autosuspended during the request */
+	ret = hid_hw_power(priv->hdev, PM_HINT_FULLON);
+	if (ret < 0)
+		return ret;
+
+	ret = hid_hw_raw_request(priv->hdev, MSI_ML_SENSOR_REPORT_ID, buf,
+				 MSI_ML_SENSOR_REPORT_SIZE, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+
+	hid_hw_power(priv->hdev, PM_HINT_NORMAL);
+
+	if (ret < 0)
+		return ret;
+	if (ret != MSI_ML_SENSOR_REPORT_SIZE)
+		return -EPROTO;
+
+	if (buf[0] != MSI_ML_SENSOR_REPORT_ID ||
+	    buf[MSI_ML_SENSOR_CMD_OFFSET] != MSI_ML_SENSOR_CMD ||
+	    buf[MSI_ML_SENSOR_PAGE_OFFSET] != MSI_ML_SENSOR_PAGE_HI ||
+	    buf[MSI_ML_SENSOR_PAGE_OFFSET + 1] != MSI_ML_SENSOR_PAGE_LO)
+		return -EPROTO;
+
+	for (i = 0; i < board->num_in; i++)
+		priv->in[i] = get_unaligned_le16(buf + board->in_offset[i]);
+
+	priv->updated = get_jiffies_64();
+
+	return 0;
+}
+
+static umode_t msi_ml_is_visible(const void *data,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel)
+{
+	const struct msi_ml_data *priv = data;
+
+	/* Only the rails that returned a reading in probe */
+	if (priv->in_mask & BIT(channel))
+		return 0444;
+
+	return 0;
+}
+
+static int msi_ml_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct msi_ml_data *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (time_after_eq64(get_jiffies_64(),
+			    priv->updated + MSI_ML_CACHE_TIME)) {
+		ret = msi_ml_read_report(priv);
+		if (ret)
+			return ret;
+	}
+
+	*val = priv->in[channel];
+
+	return 0;
+}
+
+static int msi_ml_read_string(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, const char **str)
+{
+	struct msi_ml_data *priv = dev_get_drvdata(dev);
+
+	*str = priv->board->in_label[channel];
+
+	return 0;
+}
+
+static const struct hwmon_ops msi_ml_hwmon_ops = {
+	.is_visible = msi_ml_is_visible,
+	.read = msi_ml_read,
+	.read_string = msi_ml_read_string,
+};
+
+/* One entry per channel, MSI_ML_MAX_IN in total */
+static const struct hwmon_channel_info *const msi_ml_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info msi_ml_chip_info = {
+	.ops = &msi_ml_hwmon_ops,
+	.info = msi_ml_info,
+};
+
+static int msi_ml_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct msi_ml_data *priv;
+	int i, ret;
+
+	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->buf = devm_kzalloc(&hdev->dev, MSI_ML_SENSOR_REPORT_SIZE, GFP_KERNEL);
+	if (!priv->buf)
+		return -ENOMEM;
+
+	priv->hdev = hdev;
+	priv->board = msi_ml_board;
+	hid_set_drvdata(hdev, priv);
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Keep the hidraw interface for user space LED control. Also claim
+	 * the device for this driver, so that probing does not fail when
+	 * CONFIG_HIDRAW is disabled.
+	 */
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW | HID_CONNECT_DRIVER);
+	if (ret)
+		return ret;
+
+	/*
+	 * Keep the device open while the driver is bound, so that its
+	 * interrupt endpoint is polled as it is with the vendor software.
+	 * Reading the sensor report has only been tested in this state.
+	 */
+	ret = hid_hw_open(hdev);
+	if (ret)
+		goto fail_stop;
+
+	/* Check that the sensor report works, and which rails have a reading */
+	ret = msi_ml_read_report(priv);
+	if (ret) {
+		hid_err(hdev, "failed to read the sensor report: %pe\n",
+			ERR_PTR(ret));
+		goto fail_close;
+	}
+
+	for (i = 0; i < priv->board->num_in; i++) {
+		if (priv->in[i])
+			priv->in_mask |= BIT(i);
+	}
+
+	if (!priv->in_mask) {
+		hid_err(hdev, "no voltage readings in the sensor report\n");
+		ret = -ENODEV;
+		goto fail_close;
+	}
+
+	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev,
+							  "msi_mystic_light",
+							  priv,
+							  &msi_ml_chip_info,
+							  NULL);
+	if (IS_ERR(priv->hwmon_dev)) {
+		ret = PTR_ERR(priv->hwmon_dev);
+		goto fail_close;
+	}
+
+	return 0;
+
+fail_close:
+	hid_hw_close(hdev);
+fail_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void msi_ml_remove(struct hid_device *hdev)
+{
+	struct msi_ml_data *priv = hid_get_drvdata(hdev);
+
+	hwmon_device_unregister(priv->hwmon_dev);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id msi_ml_table[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB, USB_PRODUCT_ID_MYSTIC_LIGHT) },
+	{ }
+};
+
+static struct hid_driver msi_ml_driver = {
+	.name = "msi_mystic_light",
+	.id_table = msi_ml_table,
+	.probe = msi_ml_probe,
+	.remove = msi_ml_remove,
+};
+
+static int __init msi_ml_init(void)
+{
+	const struct dmi_system_id *dmi_id;
+
+	dmi_id = dmi_first_match(msi_ml_dmi_table);
+	if (!dmi_id)
+		return -ENODEV;
+
+	msi_ml_board = dmi_id->driver_data;
+
+	return hid_register_driver(&msi_ml_driver);
+}
+
+static void __exit msi_ml_exit(void)
+{
+	hid_unregister_driver(&msi_ml_driver);
+}
+
+/* When built into the kernel, register after the HID bus is initialized */
+late_initcall(msi_ml_init);
+module_exit(msi_ml_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tomasz Bojanowski <tomasz@bojanowski.me>");
+MODULE_DESCRIPTION("Hwmon driver for MSI Mystic Light USB controller voltage sensors");

base-commit: 9926f611495c8f046caf5f8f46dbd4d401337550
-- 
2.56.0

