Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD92C43460
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Apr 2021 13:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB63F613ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Apr 2021 13:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhD3N2f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Apr 2021 09:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhD3N2f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Apr 2021 09:28:35 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAC6C06138C
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 06:27:45 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id y26so2999920eds.4
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sb/3uQlSBguQeWWAbDR6AiAugXIHrHTSzlKI/qU+RY4=;
        b=z22RvG1tooUnyivcFA2R9XOBU0q44Wr2IkR9wULqQNxi1EDVobwAtTH0vcvuC7uL5w
         Uv1CYKndcm3lkxWoNl+DpqrOidwGhydtj15cV9LTm/+Ye9fZ6rzNmWMoLFh/5xltT6nU
         EnLL4DWpoBaNhzBzb8yg2g9v7n8NrNL2Kd58XKgeM0cC2XXIwNasP2hB/Lw1b4qTi8vL
         wU2zmd+8wOaZsCR+A6FO7dIpolXDHq8EvJGW13mto9VRB8BIxuw7TcCLmORT+n6Y/xZW
         3bUvdWg8fF/HOwGTyGA5s/O6+zY4Wkc5/+ka7nB7C3pz99v06pgWOZf5GhqVGodermkX
         bTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sb/3uQlSBguQeWWAbDR6AiAugXIHrHTSzlKI/qU+RY4=;
        b=HQZglGEPUiGhqrCl4zp7gP2m495oEsR2pTcC3pgtC5soQ6uXmx0OSHiJCAjKuewsRz
         Iigsl3ckUzYOm/eloPoyRoXadzTiyMsZpt1HoFlJvrlHg4k+mr9vI5vIhyBNhS3m3x35
         6tBltXkBFOhP2RZQuFeDtypuxQPDb0B9HQmHW04QPp6WQgV5HiOB/gbVzN35kIp62u4a
         VOHrWNeGnZhbWyIEXvKuO6j4J+FnJVTqREuH5kKBdPb12K4/NzIe05sHyNQgUG8l8nzV
         cVbrW65Fe6qHbk4OGjv9SUxX+2jOWWghkTNSgrnfF7/S3VOurhXdKUAq+Yu8PsvD+z+C
         adBw==
X-Gm-Message-State: AOAM533JJhrYjgcVNmgi8wOuyo6d+WQ69vR2P42VvLfF+mFOFotjxk2b
        ZNqte4y644uxIPD6MPu4dRwTerL0ALiMdEniZZU=
X-Google-Smtp-Source: ABdhPJwC9MgRhnBWEj1efQWoICSRsywapdZvCl32GyiavyCPui8jNX6+PYeHeqTywCr0Wcj09HOY9w==
X-Received: by 2002:aa7:de02:: with SMTP id h2mr5993698edv.61.1619789263694;
        Fri, 30 Apr 2021 06:27:43 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id o6sm1245776edw.24.2021.04.30.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 06:27:43 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/3] hwmon: (pmbus) Add driver for Delta DPS-920AB PSU
Date:   Fri, 30 Apr 2021 15:27:33 +0200
Message-Id: <20210430132735.127342-1-robert.marko@sartura.hr>
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
 Documentation/hwmon/dps920ab.rst | 80 ++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst    |  1 +
 drivers/hwmon/pmbus/Kconfig      |  9 ++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/dps920ab.c   | 63 +++++++++++++++++++++++++
 5 files changed, 154 insertions(+)
 create mode 100644 Documentation/hwmon/dps920ab.rst
 create mode 100644 drivers/hwmon/pmbus/dps920ab.c

diff --git a/Documentation/hwmon/dps920ab.rst b/Documentation/hwmon/dps920ab.rst
new file mode 100644
index 000000000000..df0aef530c7e
--- /dev/null
+++ b/Documentation/hwmon/dps920ab.rst
@@ -0,0 +1,80 @@
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
+curr1_crit		Critical maximum current
+curr1_crit_alarm	Current critical high alarm
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_crit		Critical maximum current
+curr2_crit_alarm	Current critical high alarm
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_lcrit		Critical minimum input voltage
+in1_lcrit_alarm		Input voltage critical low alarm
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_lcrit		Critical minimum output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+in2_crit		Critical maximum output voltage
+in2_crit_alarm		Output voltage critical high alarm
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+
+power2_label		"pout1"
+power2_input		Measured output power
+
+temp[1-2]_input		Measured temperature
+temp[1-2]_crit		Critical high temperature
+temp[1-2]_crit_alarm	Chip temperature critical high alarm
+temp[1-2]_max		Maximum temperature
+temp[1-2]_max_alarm	Chip temperature high alarm
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
index 000000000000..d579ed9f879c
--- /dev/null
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Delta DPS920AB PSU
+ *
+ * Copyright (C) 2021 Delta Networks, Inc.
+ * Copyright (C) 2021 Sartura Ltd.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
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
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN  |
+	PMBUS_HAVE_VOUT  | PMBUS_HAVE_STATUS_VOUT   |
+	PMBUS_HAVE_IOUT  | PMBUS_HAVE_STATUS_IOUT   |
+	PMBUS_HAVE_TEMP  | PMBUS_HAVE_TEMP2         |
+	PMBUS_HAVE_PIN   | PMBUS_HAVE_POUT          |
+	PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12  |
+	PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int dps920ab_probe(struct i2c_client *client)
+{
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	return pmbus_do_probe(client, &dps920ab_info);
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

