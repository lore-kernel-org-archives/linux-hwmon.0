Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42953 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728535AbeJaILf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 04:11:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id q6-v6so10217697lfh.9
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Oct 2018 16:16:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v6] scsi: Add hwmon support for SMART temperature sensors
Date: Wed, 31 Oct 2018 00:15:47 +0100
Message-Id: <20181030231547.7377-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

S.M.A.R.T. temperature sensors have been supported for
years by userspace tools such as smarttools. This adds
support to read it from the kernel and adds a temperature
zone for the drive.

The temperature readout is however also a good fit for
Linux' hwmon subsystem. By adding a hwmon interface to dig
out SMART parameters, we can expose the drive temperature
as a standard hwmon sensor.

The idea came about when experimenting with NAS enclosures
that lack their own on-board sensors but instead piggy-back
the sensor found in the harddrive, if any, to decide on a
policy for driving the on-board fan.

The kernel thermal subsystem supports defining a thermal
policy for the enclosure using the device tree, see e.g.:
arch/arm/boot/dts/gemini-dlink-dns-313.dts
but this requires a proper hwmon sensor integrated with
the kernel.

With this driver, the hard disk temperatur can be read from
sysfs:

 > cd /sys/class/hwmon/hwmon0/
 > cat temp1_input
 38

If the harddrive supports one of the detected vendor
extensions for providing min/max temperatures we also
provide attributes for displaying that.

This means that they can also be handled by userspace
tools such as lm_sensors in a uniform way without need
for any special tools such as "hddtemp" (which seems
dormant).

This driver does not block any simultaneous use of
other SMART userspace tools, it's a both/and approach,
not either/or.

The driver registers using
devm_hwmon_device_register_with_info() so hwmon sensors
will go away with their parent devices.

Reviewed-by: Guenter Roeck <linux@roeck-us.net> # HWMON
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Add the hwmon sensor on the scsi_add_lun() synchronous
  or scsi_sysfs_add_devices() asynchronous path.
- Add a flag to drivers/usb/storage/scsiglue.c so that
  the ATA method will be tred with USB mass storage
  device. Works fine on my drives.
- Tested that this works fine with drives that come and
  go by adding/removing the USB cradle.
- Also tested the patch with some random USB flash drives
  so as to indicate they survive being sent some random
  ATA command. They are fine, they just bail out.
- This now illustrates more devices than just libata
  making use of the code in scsi_hwmon.c.
ChangeLog v4->v5:
- Move the whole thing over to drivers/scsi so it can
  be used with other devices using SCSI as transport
  more easily.
- Rename some functions and variables with scsi_*
  prefixes rather than ata_* where they are supposed to
  be generic for any SCSI device, and keep the naming for
  code that pertains specifically to the ATA slave access
  method.
- Add an enum to struct scsi_device telling what type of
  SMART interface the device is using, add SCSI_SMART_ATA
  for libata slave devices. (We can add more.)
- I am uncertain if this applies to SAS drives as well,
  it appears not (Christian Frankes answer) they
  require a different access method, and I can't test it,
  so I am currently only setting it up explicitly for
  ATA slave devices.
- Kept Guenter's ACK since the hwmon use didn't change.
- Now drive-by-coding in the SCSI subsystem instead of
  libata, enjoying the ride, let's see where it takes us!
ChangeLog v3->v4:
- Resend because of new libata maintainer.
ChangeLog v2->v3:
- Register a thermal zone for the harddrive.
- Remove unnecessary else after return.
- Collect Guenther's ACK.
ChangeLog v1->v2:
- Return the error code from scsci_execute() upwards.
- Use the .is_visible() callback on the hwmon device to
  decide whether to display min/max temperature properties
  or not.
- Split out an explicit format detection and reading
  function, and only detect the temperature format from
  probe()
- Name the hwmon sensor "sd" as per the pattern of other
  hwmon sensors, this is what userspace expects.
- Drop an unnecessary type check.
ChangeLog RFC->v1:
- Put includes in alphabetical order.
- Octal 00444 instead of S_IRUGO
- Avoid double negations in temperature range test
- Allocate a sector buffer in the state container
- Break out the SMART property parser to its own function
- Sink error codes into property parser
- Drop registration info print
- Use return PTR_ERR_OR_ZERO() in probe
- Make the hwmon device a local variable in probe()
- Use Guenthers Kconfig trick to avoid exporting the
  probe call
- Return temperatures in millicelsus
- Demote initial temperature to dev_dbg()
- Dynamically decide whether to display just temperature
  or also min/max temperatures depending on what the SMART
  sensor can provide
---
 drivers/ata/libata-scsi.c      |   2 +
 drivers/scsi/Kconfig           |  13 +
 drivers/scsi/Makefile          |   1 +
 drivers/scsi/scsi_hwmon.c      | 464 +++++++++++++++++++++++++++++++++
 drivers/scsi/scsi_hwmon.h      |  15 ++
 drivers/scsi/scsi_scan.c       |   5 +
 drivers/usb/storage/scsiglue.c |   3 +
 include/scsi/scsi_device.h     |   6 +
 8 files changed, 509 insertions(+)
 create mode 100644 drivers/scsi/scsi_hwmon.c
 create mode 100644 drivers/scsi/scsi_hwmon.h

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 3d4887d0e84a..5485cf08595a 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -1346,6 +1346,8 @@ int ata_scsi_slave_config(struct scsi_device *sdev)
 	int rc = 0;
 
 	ata_scsi_sdev_config(sdev);
+	/* ATA slaves have specific SMART access methods */
+	sdev->smart = SCSI_SMART_ATA;
 
 	if (dev)
 		rc = ata_scsi_dev_config(sdev, dev);
diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index 70988c381268..66b969a11c79 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -62,6 +62,19 @@ config SCSI_MQ_DEFAULT
 
 	  If unsure say Y.
 
+config SCSI_HWMON
+	bool "S.M.A.R.T. HWMON support"
+	depends on (SCSI=m && HWMON) || HWMON=y
+	help
+	  This options compiles in code to support temperature reading
+	  from a SCSI device using the S.M.A.R.T. (Self-Monitoring,
+	  Analysis and Reporting Technology) support for temperature
+	  sensors found in some hard drives. The drive will be probed
+	  to figure out if it has a temperature sensor, and if it does
+	  the kernel hardware monitor framework will be utilized to
+	  interact with the sensor. This work orthogonal to any userspace
+	  S.M.A.R.T. access tools.
+
 config SCSI_PROC_FS
 	bool "legacy /proc/scsi/ support"
 	depends on SCSI && PROC_FS
diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
index fcb41ae329c4..e1b9e5610271 100644
--- a/drivers/scsi/Makefile
+++ b/drivers/scsi/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_PCMCIA)		+= pcmcia/
 
 obj-$(CONFIG_SCSI)		+= scsi_mod.o
 obj-$(CONFIG_BLK_SCSI_REQUEST)	+= scsi_common.o
+obj-$(CONFIG_SCSI_HWMON)	+= scsi_hwmon.o
 
 obj-$(CONFIG_RAID_ATTRS)	+= raid_class.o
 
diff --git a/drivers/scsi/scsi_hwmon.c b/drivers/scsi/scsi_hwmon.c
new file mode 100644
index 000000000000..35fc283e1e68
--- /dev/null
+++ b/drivers/scsi/scsi_hwmon.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hwmon client for S.M.A.R.T. hard disk drives with temperature
+ * sensors.
+ * (C) 2018 Linus Walleij
+ *
+ * This code is based on know-how and examples from the
+ * smartmontools by Bruce Allen, Christian Franke et al.
+ * (C) 2002-2018
+ */
+
+#include <linux/ata.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <scsi/scsi_cmnd.h>
+#include <scsi/scsi_device.h>
+
+#include "scsi_hwmon.h"
+
+#define ATA_MAX_SMART_ATTRS 30
+#define SMART_TEMP_PROP_194 194
+
+enum ata_temp_format {
+	ATA_TEMP_FMT_TT_XX_00_00_00_00,
+	ATA_TEMP_FMT_TT_XX_LL_HH_00_00,
+	ATA_TEMP_FMT_TT_LL_HH_00_00_00,
+	ATA_TEMP_FMT_TT_XX_LL_XX_HH_XX,
+	ATA_TEMP_FMT_TT_XX_HH_XX_LL_XX,
+	ATA_TEMP_FMT_TT_XX_LL_HH_CC_CC,
+	ATA_TEMP_FMT_UNKNOWN,
+};
+
+/**
+ * struct scsi_hwmon - device instance state
+ * @dev: parent device
+ * @sdev: associated SCSI device
+ * @tfmt: temperature format
+ * @smartdata: buffer for reading in the SMART "sector"
+ */
+struct scsi_hwmon {
+	struct device *dev;
+	struct scsi_device *sdev;
+	enum ata_temp_format tfmt;
+	u8 smartdata[ATA_SECT_SIZE];
+};
+
+static umode_t scsi_hwmon_is_visible(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	const struct scsi_hwmon *shd = data;
+
+	/*
+	 * If we detected a temperature format with min/max temperatures
+	 * we make those attributes visible, else just the temperature
+	 * input per se.
+	 */
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return 00444;
+		case hwmon_temp_min:
+		case hwmon_temp_max:
+			if (shd->tfmt == ATA_TEMP_FMT_TT_XX_00_00_00_00)
+				return 0;
+			return 00444;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int ata_check_temp_word(u16 word)
+{
+	if (word <= 0x7f)
+		return 0x11; /* >= 0, signed byte or word */
+	if (word <= 0xff)
+		return 0x01; /* < 0, signed byte */
+	if (word > 0xff80)
+		return 0x10; /* < 0, signed word */
+	return 0x00;
+}
+
+static bool ata_check_temp_range(int t, u8 t1, u8 t2)
+{
+	int lo = (s8)t1;
+	int hi = (s8)t2;
+
+	/* This is obviously wrong */
+	if (lo > hi)
+		return false;
+
+	/*
+	 * If -60 <= lo <= t <= hi <= 120 and
+	 * and lo != -1 and hi > 0, then we have valid lo and hi
+	 */
+	if (-60 <= lo && lo <= t && t <= hi && hi <= 120
+	    && (lo != -1 && hi > 0)) {
+		return true;
+	}
+	return false;
+}
+
+static void scsi_hwmon_convert_temperatures(struct scsi_hwmon *shd, u8 *raw,
+					   int *t, int *lo, int *hi)
+{
+	*t = (s8)raw[0];
+
+	switch (shd->tfmt) {
+	case ATA_TEMP_FMT_TT_XX_00_00_00_00:
+		*lo = 0;
+		*hi = 0;
+		break;
+	case ATA_TEMP_FMT_TT_XX_LL_HH_00_00:
+		*lo = (s8)raw[2];
+		*hi = (s8)raw[3];
+		break;
+	case ATA_TEMP_FMT_TT_LL_HH_00_00_00:
+		*lo = (s8)raw[1];
+		*hi = (s8)raw[2];
+		break;
+	case ATA_TEMP_FMT_TT_XX_LL_XX_HH_XX:
+		*lo = (s8)raw[2];
+		*hi = (s8)raw[4];
+		break;
+	case ATA_TEMP_FMT_TT_XX_HH_XX_LL_XX:
+		*lo = (s8)raw[4];
+		*hi = (s8)raw[2];
+		break;
+	case ATA_TEMP_FMT_TT_XX_LL_HH_CC_CC:
+		*lo = (s8)raw[2];
+		*hi = (s8)raw[3];
+		break;
+	case ATA_TEMP_FMT_UNKNOWN:
+		*lo = 0;
+		*hi = 0;
+		break;
+	}
+}
+
+static int scsi_hwmon_parse_smartdata(struct scsi_hwmon *shd,
+				     u8 *buf, u8 *raw)
+{
+	u8 id;
+	u16 flags;
+	u8 curr;
+	u8 worst;
+	int i;
+
+	/* Loop over SMART attributes */
+	for (i = 0; i < ATA_MAX_SMART_ATTRS; i++) {
+		int j;
+
+		id = buf[2 + i * 12];
+		if (!id)
+			continue;
+
+		/*
+		 * The "current" and "worst" values represent a normalized
+		 * value in the range 0..100 where 0 is "worst" and 100
+		 * is "best". It does not represent actual temperatures.
+		 * It is probably possible to use vendor-specific code per
+		 * drive to convert this to proper temperatures but we leave
+		 * it out for now.
+		 */
+		flags = buf[3 + i * 12] | (buf[4 + i * 12] << 16);
+		/* Highest temperature since boot */
+		curr = buf[5 + i * 12];
+		/* Highest temperature ever */
+		worst = buf[6 + i * 12];
+		for (j = 0; j < 6; j++)
+			raw[j] = buf[7 + i * 12 + j];
+		dev_dbg(shd->dev, "ID: %d, FLAGS: %04x, current %d, worst %d, "
+			"RAW %02x %02x %02x %02x %02x %02x\n",
+			id, flags, curr, worst,
+			raw[0], raw[1], raw[2], raw[3], raw[4], raw[5]);
+
+		if (id == SMART_TEMP_PROP_194)
+			break;
+	}
+
+	if (id != SMART_TEMP_PROP_194)
+		return -ENOTSUPP;
+
+	return 0;
+}
+
+static int scsi_hwmon_read_raw(struct scsi_hwmon *shd, u8 *raw)
+{
+	u8 scsi_cmd[MAX_COMMAND_SIZE];
+	int cmd_result;
+	struct scsi_sense_hdr sshdr;
+	u8 *buf = shd->smartdata;
+	int ret;
+	u8 csum;
+	int i;
+
+	/* Send ATA command to read SMART values */
+	memset(scsi_cmd, 0, sizeof(scsi_cmd));
+	scsi_cmd[0] = ATA_16;
+	scsi_cmd[1] = (4 << 1); /* PIO Data-in */
+	/*
+	 * No off.line or cc, read from dev, block count in sector count
+	 * field.
+	 */
+	scsi_cmd[2] = 0x0e;
+	scsi_cmd[4] = ATA_SMART_READ_VALUES;
+	scsi_cmd[6] = 1; /* Read 1 sector */
+	scsi_cmd[8] = 0; /* args[1]; */
+	scsi_cmd[10] = ATA_SMART_LBAM_PASS;
+	scsi_cmd[12] = ATA_SMART_LBAH_PASS;
+	scsi_cmd[14] = ATA_CMD_SMART;
+
+	cmd_result = scsi_execute(shd->sdev, scsi_cmd, DMA_FROM_DEVICE,
+				  buf, ATA_SECT_SIZE,
+				  NULL, &sshdr, 10 * HZ, 5, 0, 0, NULL);
+	if (cmd_result) {
+		dev_dbg(shd->dev, "error %d reading SMART values from device\n",
+			cmd_result);
+		return cmd_result;
+	}
+
+	/* Checksum the read value table */
+	csum = 0;
+	for (i = 0; i < ATA_SECT_SIZE; i++)
+		csum += buf[i];
+	if (csum) {
+		dev_dbg(shd->dev, "checksum error reading SMART values\n");
+		return -EIO;
+	}
+
+	/* This will fail with -ENOTSUPP if we don't have temperature */
+	ret = scsi_hwmon_parse_smartdata(shd, buf, raw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int scsi_hwmon_detect_tempformat(struct scsi_hwmon *shd)
+{
+	u8 raw[6];
+	s8 t;
+	u16 w0, w1, w2;
+	int ctw0;
+	int ret;
+
+	shd->tfmt = ATA_TEMP_FMT_UNKNOWN;
+
+	/* First read in some raw temperature sensor data */
+	ret = scsi_hwmon_read_raw(shd, raw);
+	if (ret)
+		return ret;
+
+	/*
+	 * Interpret the RAW temperature data:
+	 * raw[0] is the temperature given as signed u8 on all known drives
+	 *
+	 * Search for possible min/max values
+	 * This algorithm is a modified version from the smartmontools.
+	 *
+	 * [0][1][2][3][4][5] raw[]
+	 * [ 0 ] [ 1 ] [ 2 ] word[]
+	 * TT xx LL xx HH xx  Hitachi/HGST
+	 * TT xx HH xx LL xx  Kingston SSDs
+	 * TT xx LL HH 00 00  Maxtor, Samsung, Seagate, Toshiba
+	 * TT LL HH 00 00 00  WDC
+	 * TT xx LL HH CC CC  WDC, CCCC=over temperature count
+	 * (xx = 00/ff, possibly sign extension of lower byte)
+	 *
+	 * TODO: detect the 10x temperatures found on some Samsung
+	 * drives. struct scsi_device contains manufacturer and model
+	 * information.
+	 */
+	w0 = raw[0] | raw[1] << 16;
+	w1 = raw[2] | raw[3] << 16;
+	w2 = raw[4] | raw[5] << 16;
+	t = (s8)raw[0];
+
+	/* If this is != 0, then w0 may contain something useful */
+	ctw0 = ata_check_temp_word(w0);
+
+	/* This checks variants with zero in [4] [5] */
+	if (!w2) {
+		/* TT xx 00 00 00 00 */
+		if (!w1 && ctw0)
+			shd->tfmt = ATA_TEMP_FMT_TT_XX_00_00_00_00;
+		/* TT xx LL HH 00 00 */
+		else if (ctw0 &&
+			 ata_check_temp_range(t, raw[2], raw[3]))
+			shd->tfmt = ATA_TEMP_FMT_TT_XX_LL_HH_00_00;
+		/* TT LL HH 00 00 00 */
+		else if (!raw[3] &&
+			 ata_check_temp_range(t, raw[1], raw[2]))
+			shd->tfmt = ATA_TEMP_FMT_TT_LL_HH_00_00_00;
+		else
+			return -ENOTSUPP;
+	} else if (ctw0) {
+		/*
+		 * TT xx LL xx HH xx
+		 * What the expression below does is to check that each word
+		 * formed by [0][1], [2][3], and [4][5] is something little-
+		 * endian s8 or s16 that could be meaningful.
+		 */
+		if ((ctw0 & ata_check_temp_word(w1) & ata_check_temp_word(w2))
+		    != 0x00)
+			if (ata_check_temp_range(t, raw[2], raw[4]))
+				shd->tfmt = ATA_TEMP_FMT_TT_XX_LL_XX_HH_XX;
+			else if (ata_check_temp_range(t, raw[4], raw[2]))
+				shd->tfmt = ATA_TEMP_FMT_TT_XX_HH_XX_LL_XX;
+			else
+				return -ENOTSUPP;
+		/*
+		 * TT xx LL HH CC CC
+		 * Make sure the CC CC word is at least not negative, and that
+		 * the max temperature is something >= 40, then it is probably
+		 * the right format.
+		 */
+		else if (w2 < 0x7fff) {
+			if (ata_check_temp_range(t, raw[2], raw[3]) &&
+			    raw[3] >= 40)
+				shd->tfmt = ATA_TEMP_FMT_TT_XX_LL_HH_CC_CC;
+			else
+				return -ENOTSUPP;
+		} else {
+			return -ENOTSUPP;
+		}
+	} else {
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int scsi_hwmon_read_temp(struct scsi_hwmon *shd, int *temp,
+			       int *min, int *max)
+{
+	u8 raw[6];
+	int ret;
+
+	ret = scsi_hwmon_read_raw(shd, raw);
+	if (ret)
+		return ret;
+
+	scsi_hwmon_convert_temperatures(shd, raw, temp, min, max);
+	dev_dbg(shd->dev, "temp = %d, min = %d, max = %d\n",
+		*temp, *min, *max);
+
+	return 0;
+}
+
+static int scsi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *val)
+{
+	struct scsi_hwmon *shd = dev_get_drvdata(dev);
+	int temp, min = 0, max = 0;
+	int ret;
+
+	ret = scsi_hwmon_read_temp(shd, &temp, &min, &max);
+	if (ret)
+		return ret;
+
+	/*
+	 * Multiply return values by 1000 as hwmon expects millicentigrades
+	 */
+	switch (attr) {
+	case hwmon_temp_input:
+		*val = temp * 1000;
+		break;
+	case hwmon_temp_min:
+		*val = min * 1000;
+		break;
+	case hwmon_temp_max:
+		*val = max * 1000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops scsi_hwmon_ops = {
+	.is_visible = scsi_hwmon_is_visible,
+	.read = scsi_hwmon_read,
+};
+
+static const u32 scsi_hwmon_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX,
+	0,
+};
+
+static const struct hwmon_channel_info scsi_hwmon_temp = {
+	.type = hwmon_temp,
+	.config = scsi_hwmon_temp_config,
+};
+
+static u32 scsi_hwmon_chip_config[] = {
+	HWMON_C_REGISTER_TZ,
+	0
+};
+
+static const struct hwmon_channel_info scsi_hwmon_chip = {
+	.type = hwmon_chip,
+	.config = scsi_hwmon_chip_config,
+};
+
+static const struct hwmon_channel_info *scsi_hwmon_info[] = {
+	&scsi_hwmon_temp,
+	&scsi_hwmon_chip,
+	NULL,
+};
+
+static const struct hwmon_chip_info scsi_hwmon_devinfo = {
+	.ops = &scsi_hwmon_ops,
+	.info = scsi_hwmon_info,
+};
+
+int scsi_hwmon_probe(struct scsi_device *sdev)
+{
+	struct device *dev = &sdev->sdev_gendev;
+	struct device *hwmon_dev;
+	struct scsi_hwmon *shd;
+	int ret;
+
+	/*
+	 * We currently only support SMART temperature readouts using
+	 * ATA SMART propery 194.
+	 *
+	 * TODO: Add more SMART types for SCSI, SAS, USB etc.
+	 */
+	if (sdev->smart != SCSI_SMART_ATA)
+		return 0;
+
+	shd = devm_kzalloc(dev, sizeof(*shd), GFP_KERNEL);
+	if (!shd)
+		return -ENOMEM;
+	shd->dev = dev;
+	shd->sdev = sdev;
+
+	/*
+	 * If temperature reading is not supported in the SMART
+	 * properties, we just bail out.
+	 */
+	ret = scsi_hwmon_detect_tempformat(shd);
+	if (ret == -ENOTSUPP)
+		return 0;
+	/* Any other error, return upward */
+	if (ret)
+		return ret;
+
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(dev, "sd", shd,
+						     &scsi_hwmon_devinfo,
+						     NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
diff --git a/drivers/scsi/scsi_hwmon.h b/drivers/scsi/scsi_hwmon.h
new file mode 100644
index 000000000000..9e978a677dad
--- /dev/null
+++ b/drivers/scsi/scsi_hwmon.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <scsi/scsi_device.h>
+
+#ifdef CONFIG_SCSI_HWMON
+
+int scsi_hwmon_probe(struct scsi_device *sdev);
+
+#else
+
+static inline int scsi_hwmon_probe(struct scsi_device *sdev)
+{
+	return 0;
+}
+
+#endif
diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 78ca63dfba4a..96f584e07828 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -49,6 +49,7 @@
 
 #include "scsi_priv.h"
 #include "scsi_logging.h"
+#include "scsi_hwmon.h"
 
 #define ALLOC_FAILURE_MSG	KERN_ERR "%s: Allocation failure during" \
 	" SCSI scanning, some SCSI devices might not be configured\n"
@@ -998,6 +999,9 @@ static int scsi_add_lun(struct scsi_device *sdev, unsigned char *inq_result,
 	if (!async && scsi_sysfs_add_sdev(sdev) != 0)
 		return SCSI_SCAN_NO_RESPONSE;
 
+	if (!async)
+		scsi_hwmon_probe(sdev);
+
 	return SCSI_SCAN_LUN_PRESENT;
 }
 
@@ -1707,6 +1711,7 @@ static void scsi_sysfs_add_devices(struct Scsi_Host *shost)
 		if (!scsi_host_scan_allowed(shost) ||
 		    scsi_sysfs_add_sdev(sdev) != 0)
 			__scsi_remove_device(sdev);
+		scsi_hwmon_probe(sdev);
 	}
 }
 
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index e227bb5b794f..0a4dbe0f9dbc 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -288,6 +288,9 @@ static int slave_configure(struct scsi_device *sdev)
 			/* assume sync is needed */
 			sdev->wce_default_on = 1;
 		}
+
+		/* Assume ATA SMART type */
+		sdev->smart = SCSI_SMART_ATA;
 	} else {
 
 		/*
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 202f4d6a4342..b914d0d56b31 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -61,6 +61,11 @@ enum scsi_scan_mode {
 	SCSI_SCAN_MANUAL,
 };
 
+enum scsi_smart_type {
+	SCSI_SMART_NONE = 0,
+	SCSI_SMART_ATA,		/* Used to read temperatures */
+};
+
 enum scsi_device_event {
 	SDEV_EVT_MEDIA_CHANGE	= 1,	/* media has changed */
 	SDEV_EVT_INQUIRY_CHANGE_REPORTED,		/* 3F 03  UA reported */
@@ -226,6 +231,7 @@ struct scsi_device {
 	unsigned char		access_state;
 	struct mutex		state_mutex;
 	enum scsi_device_state sdev_state;
+	enum scsi_smart_type	smart;
 	struct task_struct	*quiesced_by;
 	unsigned long		sdev_data[0];
 } __attribute__((aligned(sizeof(unsigned long))));
-- 
2.17.2
