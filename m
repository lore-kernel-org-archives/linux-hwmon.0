Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990654;
	b=M6f2zFXtYUzcCDu7gCTKlEWs0qYqoJP4e9JiPsC2G03oyrBBBajMowtzEZ11HIvgC0d8
	 2+vS+NOCSwIuua9xJ6GonaXY1FvaXaBas98J3mkX7mqmHJxD+pI2RZtsDPLLdguSwSkRm
	 u6+KW9SNqFI9k/M6czjZcnP/2CtmABloQrF0qrEMxIOyJjb1ieZrhvfzV9E4kyp445H+J
	 nLAWgkJ9gXXkgmEVo4UxZ5Ru6mEO9mMpuROGGuHLr18XVwYmOAGizDqyvv0By3CH2ihKY
	 Wo3SuNWYi4xHg13pYdvMIaaR6jkL3HomaOfgFD/xMIn8K5MF0q+Tmm8Mt6d5i6q6PfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990654;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=G6imxDnM+jHmS/bPugKJ9w5lPtzVnIQlF/zM6XhCb6w=;
	b=R9TyUgH9Wo/OPE5ToB1XCkB907tk6taPkUAvKg7k+n8eH3i6tRA3xKhO45WnulnOSJ1e
	 vPDfEXGxbsq1tISKqQcb7HmLB81ITKs6onDS1ulg93p8grajqjhUV5HghfTD+Ba/UvjGf
	 rEh3m5wVV94mE/CXbf3OAZmPxSTz//qzRtf88lzqCcSdShey9TbLVHfJ8Z4Yj45PvRZlB
	 rkAfqf8uRxXKiabcPtAr5jp9GtXb/O1/kzySjFeeQr3zYVk3v36yvdR0h2Gl/HGYGI3k1
	 yI6f4IaNNCEpWkHoavl2hi+5HIDt6fStRmumxGuIyWPDNaRQ8pv9ZHUBd0qpOzHCNGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=ZNb1uE9t;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FFC606A326;
	Fri,  6 Nov 2026 18:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FFC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=ZNb1uE9t
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jLp433DmLzMlby;
	Fri, 06 Nov 2026 19:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1793990643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G6imxDnM+jHmS/bPugKJ9w5lPtzVnIQlF/zM6XhCb6w=;
	b=ZNb1uE9tMNNvfdMiDniIlARldyap0DnzywLvvZc4R3MSHjRbe5NAf/5G6Y36ENPAZb4sxM
	s1YK/p7XTNt/5Z394MFeMR9IZcYPexoBuRomrYswQ3vBjiEpamccFrHSxtLYJwN7KIGNu5
	1pGW6R7SrfgGpx3lCvGSICQqn+6N8XwBYh/VzmRVcYcRVrB01GdpzmyeAzJqprwMDhekOQ
	mLfP7N5f4EdV8iOBCtOiHnjaBngtzETWXISHOa8AtinZUNXXcE+sW+zkIE7OP3ftuJd1am
	BYaBzk2BzHDMWrFrrUZ1cPf3Kh0eEW4VqdGF/kqRY1PEj8Qcs4QCipLLdP8Idg==
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
Subject: [PATCH] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Fri,  6 Nov 2026 19:43:57 +0100
Message-ID: <20261106184357.27763-1-tomasz@bojanowski.me>
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
X-Rspamd-Queue-Id: 4jLp433DmLzMlby

MSI 800-series motherboards have a USB microcontroller (0db0:0076) that
drives the RGB LED headers. Besides the LEDs, it measures a few voltage
rails that are not monitored by the Super I/O chip, and reports them in
HID feature report 0xf0.

Add a driver that reads this report and exposes the rails as standard
hwmon voltage attributes with labels. The values are cached for one
second. The driver never writes to the device, and it starts the HID
device with HID_CONNECT_HIDRAW, so user space tools that control the
LEDs through hidraw keep working.

The rails and their position in the report depend on the motherboard,
which is identified by the MSI board code at the start of the USB serial
number. For now only the MAG B850M MORTAR WIFI (MS-7E61) is supported.
On other boards the driver still binds to the device, so that hidraw
remains available (hid-generic does not take a device that is listed in
another driver's id_table), but it does not register a hwmon device.

The report layout was determined by analysing the vendor's Windows
software and confirmed on hardware.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61, BIOS 1.A68), with the
driver built out of tree against kernel 7.2.15. The readings (CPU 1P8
1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V) are stable and plausible for
the respective rails, repeated reads within one second are served from
the cache, and hidraw access works while the driver is bound. Binding and
unbinding the driver repeatedly hands the device back to hid-generic
without errors.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
 Documentation/hwmon/index.rst            |   1 +
 Documentation/hwmon/msi_mystic_light.rst |  58 +++++
 MAINTAINERS                              |   7 +
 drivers/hwmon/Kconfig                    |  11 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/msi_mystic_light.c         | 291 +++++++++++++++++++++++
 6 files changed, 369 insertions(+)
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
index 000000000000..d58186b83ce8
--- /dev/null
+++ b/Documentation/hwmon/msi_mystic_light.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver msi_mystic_light
+==============================
+
+Supported devices:
+
+* MSI Mystic Light USB controller (USB ID 0db0:0076), found on MSI
+  800-series motherboards
+
+  Voltage sensors are supported on:
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
+Which rails are present, and where they are found in the sensor report,
+depends on the motherboard. The board is identified by the MSI board code
+at the start of the USB serial number (for example ``7E61``). On boards
+without a known layout the driver binds to the device, but does not
+register a hwmon device.
+
+The driver only reads HID feature report 0xf0. It never writes to the
+controller. The hidraw interface remains available, so user space tools
+that control the LEDs keep working.
+
+Usage Notes
+-----------
+
+The sensor values are cached for one second. A rail that reads 0 is
+reported as unavailable (-ENODATA).
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
index 3ae676a56d95..313f095e82ca 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1570,6 +1570,17 @@ config SENSORS_MR75203
 	  This driver can also be built as a module. If so, the module
 	  will be called mr75203.
 
+config SENSORS_MSI_MYSTIC_LIGHT
+	tristate "MSI Mystic Light USB controller voltage sensors"
+	depends on USB_HID
+	help
+	  If you say yes here you get support for the voltage sensors of the
+	  MSI Mystic Light USB controller (0db0:0076) found on MSI 800-series
+	  motherboards.
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
index 000000000000..39dde9d9e82d
--- /dev/null
+++ b/drivers/hwmon/msi_mystic_light.c
@@ -0,0 +1,291 @@
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
+ * The rails and their position in the report depend on the motherboard.
+ * The board is identified by the MSI board code in the first four
+ * characters of the USB serial number, for example "7E61" for the
+ * MAG B850M MORTAR WIFI (MS-7E61). On boards without a known layout the
+ * driver binds to the device, but does not register a hwmon device.
+ *
+ * Copyright (C) 2026 Tomasz Bojanowski <tomasz@bojanowski.me>
+ */
+
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
+/* Every sensor report starts with this header (after the report ID) */
+#define MSI_ML_SENSOR_CMD_OFFSET	1
+#define MSI_ML_SENSOR_CMD		0xa0
+#define MSI_ML_SENSOR_PAGE_OFFSET	9
+#define MSI_ML_SENSOR_PAGE_HI		0x01
+#define MSI_ML_SENSOR_PAGE_LO		0xfc
+
+#define MSI_ML_BOARD_CODE_LEN		4
+#define MSI_ML_MAX_IN			3
+#define MSI_ML_CACHE_TIME		HZ
+
+struct msi_ml_board {
+	const char *code;		/* MSI board code, start of USB serial */
+	int num_in;
+	const char *const *in_label;
+	const u8 *in_offset;		/* little endian u16 in mV */
+};
+
+/* MAG B850M MORTAR WIFI (MS-7E61) */
+static const char *const msi_ml_7e61_in_label[] = {
+	"CPU 1P8", "CHIP Core", "VDD MISC",
+};
+
+static const u8 msi_ml_7e61_in_offset[] = { 23, 17, 25 };
+
+static const struct msi_ml_board msi_ml_boards[] = {
+	{
+		.code = "7E61",
+		.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
+		.in_label = msi_ml_7e61_in_label,
+		.in_offset = msi_ml_7e61_in_offset,
+	},
+};
+
+struct msi_ml_data {
+	struct hid_device *hdev;
+	struct device *hwmon_dev;
+	const struct msi_ml_board *board;
+	u8 *buf;			/* report buffer, must be DMA safe */
+	u16 in[MSI_ML_MAX_IN];		/* mV, 0 = no reading */
+	unsigned long updated;		/* jiffies */
+	bool valid;
+};
+
+static const struct msi_ml_board *msi_ml_find_board(struct hid_device *hdev)
+{
+	int i;
+
+	if (strnlen(hdev->uniq, sizeof(hdev->uniq)) < MSI_ML_BOARD_CODE_LEN)
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(msi_ml_boards); i++) {
+		if (!strncasecmp(hdev->uniq, msi_ml_boards[i].code,
+				 MSI_ML_BOARD_CODE_LEN))
+			return &msi_ml_boards[i];
+	}
+
+	return NULL;
+}
+
+/*
+ * Read the sensor report, at most once per MSI_ML_CACHE_TIME. Only called
+ * from the hwmon read callback, which the hwmon core serializes, so no
+ * additional locking is needed for the buffer and the cached values.
+ */
+static int msi_ml_update(struct msi_ml_data *priv)
+{
+	const struct msi_ml_board *board = priv->board;
+	u8 *buf = priv->buf;
+	int i, ret;
+
+	if (priv->valid && time_before(jiffies, priv->updated + MSI_ML_CACHE_TIME))
+		return 0;
+
+	memset(buf, 0, MSI_ML_SENSOR_REPORT_SIZE);
+	buf[0] = MSI_ML_SENSOR_REPORT_ID;
+
+	ret = hid_hw_raw_request(priv->hdev, MSI_ML_SENSOR_REPORT_ID, buf,
+				 MSI_ML_SENSOR_REPORT_SIZE, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
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
+	priv->updated = jiffies;
+	priv->valid = true;
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
+	if (type == hwmon_in && channel < priv->board->num_in)
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
+	ret = msi_ml_update(priv);
+	if (ret)
+		return ret;
+
+	/* A rail that reads 0 has no valid measurement */
+	if (!priv->in[channel])
+		return -ENODATA;
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
+	int ret;
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
+	priv->board = msi_ml_find_board(hdev);
+	hid_set_drvdata(hdev, priv);
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	/* Keep the hidraw interface for user space LED control */
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret)
+		return ret;
+
+	if (!priv->board) {
+		hid_info(hdev, "no sensor layout for board code \"%.4s\"\n",
+			 hdev->uniq);
+		return 0;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret)
+		goto fail_stop;
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
+	if (priv->board) {
+		hwmon_device_unregister(priv->hwmon_dev);
+		hid_hw_close(hdev);
+	}
+
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id msi_ml_table[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB, USB_PRODUCT_ID_MYSTIC_LIGHT) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, msi_ml_table);
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

