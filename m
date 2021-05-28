Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1494C47087
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 10:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A1D061157
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 10:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbhE1KkP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 06:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbhE1KkO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 06:40:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14204C061761
        for <linux-hwmon@vger.kernel.org>; Fri, 28 May 2021 03:38:36 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gb17so4615805ejc.8
        for <linux-hwmon@vger.kernel.org>; Fri, 28 May 2021 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cSYhcaztb4lantt7D7ci6iqGUPsIeDRbyndPy1mVepA=;
        b=ajojPZE7ywFxlkkleU/xmYwQOyDxFI6A5RipiW3IFaeFF7DV6vfNq2fNjR2wMVPzlh
         6aE5UfglU02qQC5RIECvGlS8No+0FUmyVxbK44+SMqZruJLbslPd+k1J8lYjyKbZ7EiR
         9NyWYr2K/GNpRhnuw41o7/qyphzqIKbBSi395oa3LQTEOTbUxJCTuYiNieaumDZip+tL
         qXJ/ELyPPFFSMuGsklX9MvBvOXm4a7fOwp5EFmP7nbhqo2SV9M5zSyqODI0c504Feyqz
         pfxfNfoMmwP+5B8wQg1heDQxV0SnvUiga1io9um30eJcTGq0y+DlLnujFZAM2u1e57pp
         83xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cSYhcaztb4lantt7D7ci6iqGUPsIeDRbyndPy1mVepA=;
        b=MaapUz30mXWNCXWmbx8H1VXzG1D4LD/5HZoaH2H4A0vicbOm9gfleQoY6Mvj6BBDhb
         ES3Zgg4jsRcVBxLBxwY/PKkXvthKweQqXFsxPC6iHbv0iW+WnWfKyTiRxixbd/1nNaCJ
         gWWVaeL5enL/amHuPunx0KmRpyJ4Ly9rW6UJl6tPbIlzVk7Fi0GcGPoLOanF4TRJBH7J
         qz4NCAL/T5I0GN5v5XcK69wJtLxnuQGd3UUomfOfPQY1ZoNSNrWNnQ+juYqnMjpg0M0U
         9BV4uIbiu/VLsvtVgsei/bTE+WE7eSMwluHcddaM7dgfg7aEA5Fm9Zkishxx2/7gdylP
         zJBA==
X-Gm-Message-State: AOAM532V+jKV6bK8XeS1LtpibbOQEtZzOlN9EwhCKXuuaXInIMX33COv
        AgwqUYVepbXqxsTSdq4MWjC5Wg==
X-Google-Smtp-Source: ABdhPJwtmS+T7a8UVbEgIgq9GuyvUZkSjZ1gMv8695vY8Jn1JxaXrBMU4hvANZ22hTqUQsRZSeYB4w==
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr8079449ejc.366.1622198315423;
        Fri, 28 May 2021 03:38:35 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-158.xnet.hr. [88.207.97.158])
        by smtp.googlemail.com with ESMTPSA id jw9sm2192446ejb.77.2021.05.28.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 03:38:34 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, Jonathan.Cameron@huawei.com,
        alexandre.belloni@bootlin.com, sst@poczta.fm, krzk@kernel.org,
        alexandru.ardelean@analog.com, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/3] hwmon: (pmbus) Add driver for Delta DPS-920AB PSU
Date:   Fri, 28 May 2021 12:38:26 +0200
Message-Id: <20210528103828.53320-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds support for the Delta DPS-920AB PSU.

Only missing feature is fan control which the PSU supports.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Check for Manufacturer and Model
* Restrict word read/write to supported only
* Update documentation to reflect driver changes
* Add basic debugfs entries

 Documentation/hwmon/dps920ab.rst |  73 ++++++++++
 Documentation/hwmon/index.rst    |   1 +
 drivers/hwmon/pmbus/Kconfig      |   9 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/dps920ab.c   | 229 +++++++++++++++++++++++++++++++
 5 files changed, 313 insertions(+)
 create mode 100644 Documentation/hwmon/dps920ab.rst
 create mode 100644 drivers/hwmon/pmbus/dps920ab.c

diff --git a/Documentation/hwmon/dps920ab.rst b/Documentation/hwmon/dps920ab.rst
new file mode 100644
index 000000000000..c33b4cdc0a60
--- /dev/null
+++ b/Documentation/hwmon/dps920ab.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver dps920ab
+========================
+
+Supported chips:
+
+  * Delta DPS920AB
+
+    Prefix: 'dps920ab'
+
+    Addresses scanned: -
+
+Authors:
+    Robert Marko <robert.marko@sartura.hr>
+
+
+Description
+-----------
+
+This driver implements support for Delta DPS920AB 920W 54V DC single output
+power supply with PMBus support.
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
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_alarm		Input current high alarm
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_alarm		Input voltage alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_rated_min		Minimum rated output voltage
+in2_rated_max		Maximum rated output voltage
+in2_alarm		Output voltage alarm
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+
+power2_label		"pout1"
+power2_input		Measured output power
+power2_rated_max	Maximum rated output power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_alarm		Temperature alarm
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8d5a2df1ecb6..b24436f22052 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -54,6 +54,7 @@ Hardware Monitoring Kernel Drivers
    dell-smm-hwmon
    dme1737
    drivetemp
+   dps920ab
    ds1621
    ds620
    emc1403
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 32d2fc850621..865ade0aa205 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -66,6 +66,15 @@ config SENSORS_IBM_CFFPS
 	  This driver can also be built as a module. If so, the module will
 	  be called ibm-cffps.
 
+config SENSORS_DPS920AB
+	tristate "Delta DPS920AB Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for Delta
+	  DPS920AB Power Supplies.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called dps920ab.
+
 config SENSORS_INSPUR_IPSPS
 	tristate "INSPUR Power System Power Supply"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 6a4ba0fdc1db..f59ba0123d68 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
+obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
new file mode 100644
index 000000000000..de084a42dec3
--- /dev/null
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Delta DPS920AB PSU
+ *
+ * Copyright (C) 2021 Delta Networks, Inc.
+ * Copyright (C) 2021 Sartura Ltd.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+struct dps920ab_data {
+	struct i2c_client *client;
+	struct dentry *debugfs_dir;
+};
+
+static int dps920ab_read_word_data(struct i2c_client *client, int page, int phase, int reg)
+{
+	int ret;
+
+	/*
+	 * This masks commands which are not supported.
+	 * PSU advertises that all features are supported,
+	 * in reality that unfortunately is not true.
+	 * So enable only those that the datasheet confirms.
+	 */
+	switch (reg) {
+	case PMBUS_FAN_COMMAND_1:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_STATUS_WORD:
+	case PMBUS_READ_VIN:
+	case PMBUS_READ_IIN:
+	case PMBUS_READ_VOUT:
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_READ_TEMPERATURE_2:
+	case PMBUS_READ_TEMPERATURE_3:
+	case PMBUS_READ_FAN_SPEED_1:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_PIN:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_MFR_POUT_MAX:
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	ret = pmbus_set_page(client, page, phase);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_read_word_data(client, reg);
+}
+
+static int dps920ab_write_word_data(struct i2c_client *client, int page, int reg,
+				    u16 word)
+{
+	int ret;
+
+	/*
+	 * This masks commands which are not supported.
+	 * PSU only has one R/W register and that is
+	 * for the fan.
+	 */
+	switch (reg) {
+	case PMBUS_FAN_COMMAND_1:
+		break;
+	default:
+		ret = -ENODATA;
+	}
+
+	ret = pmbus_set_page(client, page, 0xff);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_word_data(client, reg, word);
+}
+
+static struct pmbus_driver_info dps920ab_info = {
+	.pages = 1,
+
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_FAN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP  | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+		PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 |
+		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_word_data = dps920ab_read_word_data,
+	.write_word_data = dps920ab_write_word_data,
+};
+
+static int dps920ab_mfr_id_show(struct seq_file *s, void *data)
+{
+	struct dps920ab_data *priv = s->private;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	int ret;
+
+	ret = i2c_smbus_read_block_data(priv->client, PMBUS_MFR_ID, buf);
+	if (ret < 0)
+		return ret;
+
+	seq_printf(s, "%s\n", buf);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(dps920ab_mfr_id);
+
+static int dps920ab_mfr_model_show(struct seq_file *s, void *data)
+{
+	struct dps920ab_data *priv = s->private;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	int ret;
+
+	ret = i2c_smbus_read_block_data(priv->client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+
+	seq_printf(s, "%s\n", buf);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(dps920ab_mfr_model);
+
+static void dps920ab_init_debugfs(struct dps920ab_data *data)
+{
+	struct dentry *root;
+
+	root = pmbus_get_debugfs_dir(data->client);
+	if (!root)
+		return;
+
+	data->debugfs_dir = debugfs_create_dir(data->client->name, root);
+	if (!data->debugfs_dir)
+		return;
+
+	debugfs_create_file("mfr_id",
+			    0400,
+			    data->debugfs_dir,
+			    data,
+			    &dps920ab_mfr_id_fops);
+
+	debugfs_create_file("mfr_model",
+			    0400,
+			    data->debugfs_dir,
+			    data,
+			    &dps920ab_mfr_model_fops);
+}
+
+static int dps920ab_probe(struct i2c_client *client)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	struct dps920ab_data *data;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
+		return ret;
+	}
+	if (ret != 5 || strncmp(buf, "DELTA", 5)) {
+		buf[ret] = '\0';
+		dev_err(&client->dev, "Unsupported Manufacturer ID '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
+		return ret;
+	}
+	if (ret != 11 || strncmp(buf, "DPS-920AB", 9)) {
+		buf[ret] = '\0';
+		dev_err(&client->dev, "Unsupported Manufacturer Model '%s'\n", buf);
+		return -ENODEV;
+	}
+
+	ret = pmbus_do_probe(client, &dps920ab_info);
+	if (ret)
+		return ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+
+	dps920ab_init_debugfs(data);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
+	{ .compatible = "delta,dps920ab", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, dps920ab_of_match);
+
+static struct i2c_driver dps920ab_driver = {
+	.driver = {
+		   .name = "dps920ab",
+		   .of_match_table = of_match_ptr(dps920ab_of_match),
+	},
+	.probe_new = dps920ab_probe,
+};
+
+module_i2c_driver(dps920ab_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("PMBus driver for Delta DPS920AB PSU");
+MODULE_LICENSE("GPL");
-- 
2.31.1

