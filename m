Return-Path: <SRS0=Lz+R=2Y=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEFCC2D0C2
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Jan 2020 21:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65368222C3
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Jan 2020 21:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0TYa/bt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgACV0k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Jan 2020 16:26:40 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40034 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728549AbgACV0j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Jan 2020 16:26:39 -0500
Received: by mail-pg1-f193.google.com with SMTP id k25so23935080pgt.7
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Jan 2020 13:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=dDyMSAT3mPW+c9nv3jZ3y2F2X8H9gfBt12SmwfemL0Y=;
        b=p0TYa/btUcIebW7fGPXSTyX9B168XP4MJdHzk/JA0O/sbyP/q5vDhup1qWEPy7wphQ
         UKcTAcoKT+qxBPnb6mHKGmYnItVSROfLYGtAHdTvMqN84vlT7kBIxEkBnJx0rugHNg93
         uJwIj8F1turo+VZyvK68jW8clvTZkZViPJi6zZ/RdQRFGdJszB+XzrPJ7uV4Q5o8ObhJ
         6YsOASSO0LMnIc1XgMki5KsOHzIyDOEvtgJ1krR6nce22ygsZpaUYZ3ET/TyyBhX14WI
         nh0qjshtD0CzPjbe3wFsQuzQfd5HSgTp/Dx0enOcsmo3rK6PfmA020tX1OxrI28CSxFS
         jbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=dDyMSAT3mPW+c9nv3jZ3y2F2X8H9gfBt12SmwfemL0Y=;
        b=jfuldB27bknwaiwaq36E3AOe6i20+PTPbnbgVRoG1h0Y4VM3bMS8FXOIFLUVCCRj0Q
         1mGanTr9GhX345wQ5TTcVwxPla9vtn7b2CIvgnJVd00vYM3wHZbPEcGpCJC4vOE8UNLN
         HL2jPRK/S6gMJcmfTLDVL5npo7QUyJWD0ajbvzP5IuexOAjnPskAgdCw8d9HO34Gncu4
         Tc3HZVhs0Mrtlo8zEGAnYoBRKQwi+o8p0ypvUiAkUEoDxw6bj7WxuDHL1TdRmU32k2Iz
         jNRKVAowuqfrRzM4DTtsTXIwfbD6FCs+AZwPAqjiPlOja0t3+Nf7d6hRZLVQMoxJSAu+
         QhCw==
X-Gm-Message-State: APjAAAWFo/sTgSe2zVroeTMbjE9NmSCWl9s7/9kQro0jvobMymYbSMGO
        Tc/vFbcOBwXxzc8w8DcpVbgz3bHk
X-Google-Smtp-Source: APXvYqyWbBbXCkikZpjoeEZxx5JtEDNY644Me6yT6qnQ/Xa0ZDWyr8Cb2fpoRE4yavrZv+Hd7x+h0w==
X-Received: by 2002:a63:6787:: with SMTP id b129mr98346954pgc.103.1578086798087;
        Fri, 03 Jan 2020 13:26:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k1sm15521367pjl.21.2020.01.03.13.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jan 2020 13:26:37 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus) Driver for MAX20730, MAX20734, and MAX20743
Date:   Fri,  3 Jan 2020 13:26:35 -0800
Message-Id: <20200103212635.9779-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for Maxim MAX20730, MAX20734, MAX20743 Integrated,
Step-Down Switching Regulators with PMBus support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/max20730.rst |  74 ++++++
 drivers/hwmon/pmbus/Kconfig      |   9 +
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/max20730.c   | 372 +++++++++++++++++++++++++++++++
 5 files changed, 457 insertions(+)
 create mode 100644 Documentation/hwmon/max20730.rst
 create mode 100644 drivers/hwmon/pmbus/max20730.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 43cc605741ea..2cdcdf42aa9a 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -106,6 +106,7 @@ Hardware Monitoring Kernel Drivers
    max1619
    max1668
    max197
+   max20730
    max20751
    max31722
    max31785
diff --git a/Documentation/hwmon/max20730.rst b/Documentation/hwmon/max20730.rst
new file mode 100644
index 000000000000..cea7ae58c2f7
--- /dev/null
+++ b/Documentation/hwmon/max20730.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver max20730
+======================
+
+Supported chips:
+
+  * Maxim MAX20730
+
+    Prefix: 'max20730'
+
+    Addresses scanned: -
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20730.pdf
+
+  * Maxim MAX20734
+
+    Prefix: 'max20734'
+
+    Addresses scanned: -
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20734.pdf
+
+  * Maxim MAX20743
+
+    Prefix: 'max20743'
+
+    Addresses scanned: -
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20743.pdf
+
+Author: Guenter Roeck <linux@roeck-us.net>
+
+
+Description
+-----------
+
+This driver implements support for Maxim MAX20730, MAX20734, and MAX20743
+Integrated, Step-Down Switching Regulators with PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+=================== ===== =======================================================
+curr1_crit          RW/RO Critical output current. Please see datasheet for
+                          supported limits. Read-only if the chip is
+                          write protected; read-write otherwise.
+curr1_crit_alarm    RO    Output current critical alarm
+curr1_input         RO    Output current
+curr1_label         RO    'iout1'
+in1_alarm           RO    Input voltage alarm
+in1_input           RO    Input voltage
+in1_label           RO    'vin'
+in2_alarm           RO    Output voltage alarm
+in2_input           RO    Output voltage
+in2_label           RO    'vout1'
+temp1_crit          RW/RO Critical temeperature. Supported values are 130 or 150
+                          degrees C. Read-only if the chip is write protected;
+                          read-write otherwise.
+temp1_crit_alarm    RO    Temperature critical alarm
+temp1_input         RO    Chip temperature
+=================== ===== =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 59859979571d..996b18d7ee6d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -145,6 +145,15 @@ config SENSORS_MAX16064
 	  This driver can also be built as a module. If so, the module will
 	  be called max16064.
 
+config SENSORS_MAX20730
+	tristate "Maxim MAX20730, MAX20734, MAX20743"
+	help
+	  If you say yes here you get hardware monitoring support for Maxim
+	  MAX20730, MAX20734, and MAX20743.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called max20730.
+
 config SENSORS_MAX20751
 	tristate "Maxim MAX20751"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 3f8c1014938b..722c4bcaed44 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
 obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
+obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
 obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
new file mode 100644
index 000000000000..294e2212f61e
--- /dev/null
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MAX20730, MAX20734, and MAX20743 Integrated, Step-Down
+ * Switching Regulators
+ *
+ * Copyright 2019 Google LLC.
+ */
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/pmbus.h>
+#include <linux/util_macros.h>
+#include "pmbus.h"
+
+enum chips {
+	max20730,
+	max20734,
+	max20743
+};
+
+struct max20730_data {
+	enum chips id;
+	struct pmbus_driver_info info;
+	struct mutex lock;	/* Used to protect against parallel writes */
+	u16 mfr_devset1;
+};
+
+#define to_max20730_data(x)  container_of(x, struct max20730_data, info)
+
+#define MAX20730_MFR_DEVSET1	0xd2
+
+/*
+ * Convert discreet value to direct data format. Strictly speaking, all passed
+ * values are constants, so we could do that calculation manually. On the
+ * downside, that would make the driver more difficult to maintain, so lets
+ * use this approach.
+ */
+static u16 val_to_direct(int v, enum pmbus_sensor_classes class,
+			 const struct pmbus_driver_info *info)
+{
+	int R = info->R[class] - 3;	/* take milli-units into account */
+	int b = info->b[class] * 1000;
+	long d;
+
+	d = v * info->m[class] + b;
+	/*
+	 * R < 0 is true for all callers, so we don't need to bother
+	 * about the R > 0 case.
+	 */
+	while (R < 0) {
+		d = DIV_ROUND_CLOSEST(d, 10);
+		R++;
+	}
+	return (u16)d;
+}
+
+static long direct_to_val(u16 w, enum pmbus_sensor_classes class,
+			  const struct pmbus_driver_info *info)
+{
+	int R = info->R[class] - 3;
+	int b = info->b[class] * 1000;
+	int m = info->m[class];
+	long d = (s16)w;
+
+	if (m == 0)
+		return 0;
+
+	while (R < 0) {
+		d *= 10;
+		R++;
+	}
+	d = (d - b) / m;
+	return d;
+}
+
+static u32 max_current[][5] = {
+	[max20730] = { 13000, 16600, 20100, 23600 },
+	[max20734] = { 21000, 27000, 32000, 38000 },
+	[max20743] = { 18900, 24100, 29200, 34100 },
+};
+
+static int max20730_read_word_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct max20730_data *data = to_max20730_data(info);
+	int ret = 0;
+	u32 max_c;
+
+	switch (reg) {
+	case PMBUS_OT_FAULT_LIMIT:
+		switch ((data->mfr_devset1 >> 11) & 0x3) {
+		case 0x0:
+			ret = val_to_direct(150000, PSC_TEMPERATURE, info);
+			break;
+		case 0x1:
+			ret = val_to_direct(130000, PSC_TEMPERATURE, info);
+			break;
+		default:
+			ret = -ENODATA;
+			break;
+		}
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		max_c = max_current[data->id][(data->mfr_devset1 >> 5) & 0x3];
+		ret = val_to_direct(max_c, PSC_CURRENT_OUT, info);
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
+static int max20730_write_word_data(struct i2c_client *client, int page,
+				    int reg, u16 word)
+{
+	struct pmbus_driver_info *info;
+	struct max20730_data *data;
+	u16 devset1;
+	int ret = 0;
+	int idx;
+
+	info = (struct pmbus_driver_info *)pmbus_get_driver_info(client);
+	data = to_max20730_data(info);
+
+	mutex_lock(&data->lock);
+	devset1 = data->mfr_devset1;
+
+	switch (reg) {
+	case PMBUS_OT_FAULT_LIMIT:
+		devset1 &= ~(BIT(11) | BIT(12));
+		if (direct_to_val(word, PSC_TEMPERATURE, info) < 140000)
+			devset1 |= BIT(11);
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		devset1 &= ~(BIT(5) | BIT(6));
+
+		idx = find_closest(direct_to_val(word, PSC_CURRENT_OUT, info),
+				   max_current[data->id], 4);
+		devset1 |= (idx << 5);
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	if (!ret && devset1 != data->mfr_devset1) {
+		ret = i2c_smbus_write_word_data(client, MAX20730_MFR_DEVSET1,
+						devset1);
+		if (!ret) {
+			data->mfr_devset1 = devset1;
+			pmbus_clear_cache(client);
+		}
+	}
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static const struct pmbus_driver_info max20730_info[] = {
+	[max20730] = {
+		.pages = 1,
+		.read_word_data = max20730_read_word_data,
+		.write_word_data = max20730_write_word_data,
+
+		/* Source : Maxim AN6042 */
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 21,
+		.b[PSC_TEMPERATURE] = 5887,
+		.R[PSC_TEMPERATURE] = -1,
+
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 3609,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+
+		/*
+		 * Values in the datasheet are adjusted for temperature and
+		 * for the relationship between Vin and Vout.
+		 * Unfortunately, the data sheet suggests that Vout measurement
+		 * may be scaled with a resistor array. This is indeed the case
+		 * at least on the evaulation boards. As a result, any in-driver
+		 * adjustments would either be wrong or require elaborate means
+		 * to configure the scaling. Instead of doing that, just report
+		 * raw values and let userspace handle adjustments.
+		 */
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 153,
+		.b[PSC_CURRENT_OUT] = 4976,
+		.R[PSC_CURRENT_OUT] = -1,
+
+		.format[PSC_VOLTAGE_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+	},
+	[max20734] = {
+		.pages = 1,
+		.read_word_data = max20730_read_word_data,
+		.write_word_data = max20730_write_word_data,
+
+		/* Source : Maxim AN6209 */
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 21,
+		.b[PSC_TEMPERATURE] = 5887,
+		.R[PSC_TEMPERATURE] = -1,
+
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 3592,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 111,
+		.b[PSC_CURRENT_OUT] = 3461,
+		.R[PSC_CURRENT_OUT] = -1,
+
+		.format[PSC_VOLTAGE_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+	},
+	[max20743] = {
+		.pages = 1,
+		.read_word_data = max20730_read_word_data,
+		.write_word_data = max20730_write_word_data,
+
+		/* Source : Maxim AN6042 */
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 21,
+		.b[PSC_TEMPERATURE] = 5887,
+		.R[PSC_TEMPERATURE] = -1,
+
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 3597,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 95,
+		.b[PSC_CURRENT_OUT] = 5014,
+		.R[PSC_CURRENT_OUT] = -1,
+
+		.format[PSC_VOLTAGE_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+	},
+};
+
+static int max20730_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	struct max20730_data *data;
+	enum chips chip_id;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
+				     I2C_FUNC_SMBUS_READ_WORD_DATA |
+				     I2C_FUNC_SMBUS_BLOCK_DATA))
+		return -ENODEV;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
+		return ret;
+	}
+	if (ret != 5 || strncmp(buf, "MAXIM", 5)) {
+		buf[ret] = '\0';
+		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	/*
+	 * The chips support reading PMBUS_MFR_MODEL. On both MAX20730
+	 * and MAX20734, reading it returns M20743. Presumably that is
+	 * the reason why the command is not documented. Unfortunately,
+	 * that means that there is no reliable means to detect the chip.
+	 * However, we can at least detect the chip series. Compare
+	 * the returned value against 'M20743' and bail out if there is
+	 * a mismatch. If that doesn't work for all chips, we may have
+	 * to remove this check.
+	 */
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read Manufacturer Model\n");
+		return ret;
+	}
+	if (ret != 6 || strncmp(buf, "M20743", 6)) {
+		buf[ret] = '\0';
+		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read Manufacturer Revision\n");
+		return ret;
+	}
+	if (ret != 1 || buf[0] != 'F') {
+		buf[ret] = '\0';
+		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	if (client->dev.of_node)
+		chip_id = (enum chips)of_device_get_match_data(dev);
+	else
+		chip_id = id->driver_data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->id = chip_id;
+	mutex_init(&data->lock);
+	memcpy(&data->info, &max20730_info[chip_id], sizeof(data->info));
+
+	ret = i2c_smbus_read_word_data(client, MAX20730_MFR_DEVSET1);
+	if (ret < 0)
+		return ret;
+	data->mfr_devset1 = ret;
+
+	return pmbus_do_probe(client, id, &data->info);
+}
+
+static const struct i2c_device_id max20730_id[] = {
+	{ "max20730", max20730 },
+	{ "max20734", max20734 },
+	{ "max20743", max20743 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, max20730_id);
+
+static const struct of_device_id max20730_of_match[] = {
+	{ .compatible = "maxim,max20730", .data = (void *)max20730 },
+	{ .compatible = "maxim,max20734", .data = (void *)max20734 },
+	{ .compatible = "maxim,max20743", .data = (void *)max20743 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, max20730_of_match);
+
+static struct i2c_driver max20730_driver = {
+	.driver = {
+		.name = "max20730",
+		.of_match_table = max20730_of_match,
+	},
+	.probe = max20730_probe,
+	.remove = pmbus_do_remove,
+	.id_table = max20730_id,
+};
+
+module_i2c_driver(max20730_driver);
+
+MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
+MODULE_DESCRIPTION("PMBus driver for Maxim MAX20730 / MAX20734 / MAX20743");
+MODULE_LICENSE("GPL");
-- 
2.17.1

