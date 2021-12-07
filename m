Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F76CC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Dec 2021 17:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235543AbhLGR7r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Dec 2021 12:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbhLGR7r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Dec 2021 12:59:47 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18897C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Dec 2021 09:56:17 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso19034960ots.6
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Dec 2021 09:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:resent-from:resent-date:resent-message-id
         :resent-to:envelope-to:delivery-date:dkim-signature:from:to:cc
         :subject:date:message-id:mime-version:content-transfer-encoding;
        bh=G0omo7Egqr3hytg5r9KH47aiBoXPSyXGzIlq5RGChSA=;
        b=tLlT29PTOhO7NcSNs1VWahdIueZ9vdez1njApCXKB5uZYdYdu9wnJBZ5eftYlmThr1
         Dy/A5OPduImY4mAXW0kUb47oCs1XK0KHPRgxnVdw48MPqzUMA9xIHNpBebCSIdCYSJOC
         NIL6Kosmh4RyDKF+RTBqUOW7aRwTlAynpXsLhgez65z0fpHPkHefHFCtprSO0IIRK9d7
         BgCas2AWJvWNs1PtkttXwMm0aqeO2O71DcORmTl1HYwM+b1KUb3XKPy5PJy45UBwQC19
         C0bu6tTdGYU/N8C7bZQs37ixSAzZvHzdrd91qYSxdLxQ3fV+tnqBWrFSmqah4Gr8DIVm
         Zntw==
X-Gm-Message-State: AOAM532F2GtJLtQNZXk+gnmXuT4EPzXo6wxrb0d+rhqGZvSgzfX6+N4q
        Axm+q2IFLO8VEyYV7PoYTFdeZ48FKWI=
X-Google-Smtp-Source: ABdhPJx2TsKxXmSnctJ5WzQN7HajpryVxQn2uVuAvdurM+6YjwFujawxlsTTAO7s5WqJiuVfVkkOZQ==
X-Received: by 2002:a05:6830:1ad2:: with SMTP id r18mr36051509otc.308.1638899776153;
        Tue, 07 Dec 2021 09:56:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r25sm46412ote.73.2021.12.07.09.56.15
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 09:56:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Received: from bh-25.webhostbox.net
        by bh-25.webhostbox.net with LMTP
        id OJgPJScDr2Fr6A4Ah82d6A
        (envelope-from <howard10703049@gmail.com>)
        for <linux@roeck-us.net>; Tue, 07 Dec 2021 06:45:59 +0000
Envelope-to: linux@roeck-us.net
Delivery-date: Tue, 07 Dec 2021 06:45:59 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177]:37463)
        by bh-25.webhostbox.net with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <howard10703049@gmail.com>)
        id 1muUEh-0049ce-6U
        for linux@roeck-us.net; Tue, 07 Dec 2021 06:45:59 +0000
Received: by mail-pf1-f177.google.com with SMTP id 8so12512550pfo.4
        for <linux@roeck-us.net>; Mon, 06 Dec 2021 22:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G0omo7Egqr3hytg5r9KH47aiBoXPSyXGzIlq5RGChSA=;
        b=VYlmU4B3WwLuxMzTakTr9D4yheq4v2y4TdCRtge5Vl6prjGqPx5TzVuE+W/ewiQpwh
         9uRf+1hBnt9fOJC1sO0KFrdU/kpct9tyiAApZJeWKyb4+7MaZqexpVHQg5Zcuoh8ff4y
         MuidlwVNBc8hxX42/Sm3fC2563F5Jp2Dbzcv2dRbLZ18Tg3fRlcRjNpM7q7BfJa7CISF
         oM+Pcm3dSmZC9lzAw5smsI89AnD+dXFZpV7mZ79wdMTnbC4pdrq5aESB+XfofA0INZf1
         3ZL6R1kKQfNknM9H0gmPczwtyIWgKZmMrEkL7lW3hmXfvCMdPTHi2L97pV84wjorVTwK
         cZ1A==
X-Received: by 2002:a63:8848:: with SMTP id l69mr23277994pgd.41.1638859547882;
        Mon, 06 Dec 2021 22:45:47 -0800 (PST)
Received: from howard-System-Product-Name.dhcpserver.bu9bmc.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id g13sm1358326pjc.39.2021.12.06.22.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 22:45:47 -0800 (PST)
From:   Howard Chiu <howard10703049@gmail.com>
X-Google-Original-From: Howard Chiu <howard.chiu@quantatw.com>
To:     linux@roeck-us.net, jdelvare@suse.com, inux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Howard Chiu <howard.chiu@quantatw.com>
Subject: [PATCH v1] hwmon: (pmbus) Add support for MPS Multi-phase mp5023 controller
Date:   Tue,  7 Dec 2021 14:43:25 +0800
Message-Id: <20211207064325.312583-1-howard.chiu@quantatw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for mp5023 device from Monolithic Power Systems, Inc. (MPS)
vendor. This is a Hot-Swap Controller.

Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
---
 Documentation/hwmon/mp5023.rst | 80 ++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/mp5023.c   | 66 ++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 Documentation/hwmon/mp5023.rst
 create mode 100644 drivers/hwmon/pmbus/mp5023.c

diff --git a/Documentation/hwmon/mp5023.rst b/Documentation/hwmon/mp5023.rst
new file mode 100644
index 000000000000..b88506817406
--- /dev/null
+++ b/Documentation/hwmon/mp5023.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5023
+====================
+
+Supported chips:
+
+  * MPS MP5023
+
+    Prefix: 'mp5023'
+
+Author:
+
+	Howard Chiu <howard.chiu@quantatw.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5023 Hot-Swap Controller.
+
+Device complaint with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading input voltage, output voltage,
+output current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the next attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+The driver provides the next attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the next attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
+
+The driver provides the next attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ffb609cee3a4..b56bd8542864 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -276,6 +276,15 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP5023
+	tristate "MPS MP5023"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP5023.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5023.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0ed4d596a948..61cdc24b1309 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
+obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
new file mode 100644
index 000000000000..2d2048c9765e
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5023.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP5023 Hot-Swap Controller
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5023_info = {
+	.pages = 1,
+
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 32,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 32,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 2,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int mp5023_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mp5023_info);
+}
+
+static const struct of_device_id __maybe_unused mp5023_of_match[] = {
+	{ .compatible = "mps,mp5023", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mp5023_of_match);
+
+static struct i2c_driver mp5023_driver = {
+	.driver = {
+		   .name = "mp5023",
+		   .of_match_table = of_match_ptr(mp5023_of_match),
+	},
+	.probe_new = mp5023_probe,
+};
+
+module_i2c_driver(mp5023_driver);
+
+MODULE_AUTHOR("Howard Chiu <howard.chiu@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP5023 HSC");
+MODULE_LICENSE("GPL");
-- 
2.25.1

