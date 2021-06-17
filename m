Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98564C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 09:43:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D81D61209
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 09:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhFQJpq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jun 2021 05:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhFQJpp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jun 2021 05:45:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84266C061574;
        Thu, 17 Jun 2021 02:43:38 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id p13so4620725pfw.0;
        Thu, 17 Jun 2021 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TBNRII8MXpg4lTy6zErEE6nCFsHDWSAHCLOWWO1eLeY=;
        b=brlS9M5xV6FITLIGsUhZRTZd172jIjX6rEx/K9a7PQhiApBTlTNZlvg1bcsZRccCRr
         qQwyKi/4D101O3faqPu3DFXuUoxid7hoHRoAhhu0zDaS1HEvmClV9sv2T/kKG1MZglWO
         W5y3Fu3d83b+GYlYbNTQxyrz7Fd3LX7yu/hitAvXRhz3RlUlXiDB8TnvHxF49TwfT7CF
         SYa4dglcqMLb6HQUamy11vtuHpUMX201/81bNH5kHPHHXKLe0iJMQE1VmkSD51q8xj32
         bauM5T6Na8yMhWXi/766SbInENHDdYQ+F0JgmvO3p2pzq0U6zlb81aLelV5gvsrwV4Zy
         fC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TBNRII8MXpg4lTy6zErEE6nCFsHDWSAHCLOWWO1eLeY=;
        b=hfzXVrLaV2ihpDd4WZBv4yI86bWzMQWwrGtVqXEFMaH9rurBtYA6n0YtDlfrHnwdXs
         D3Xz8Wdfe6EU9M8ElO4JPRay6vfXvNW9m3Pr/6d35U1zAfGcq/P42Wv8ZuLCZgd+xiCB
         0qZBRw83OEOIsJzyJLcw2P29/Ev9B3x3HxL2zjeAXLmV1aPzGc4Ueb8FwLZC2zm8+ZrI
         x9IR4beVTVS26HRy/r9FDyI/wd6yUCAVANzPqbIXZNFq6dYqTs4KmN/68QtVJDJbGZLt
         Fib/RYvrp2G7vlwagBbWf5LRxD6+QEtDfh9pI9vKidBaUSgMB2tWa4r1F/Q/0HsvtCKj
         9RIw==
X-Gm-Message-State: AOAM532nV7HTqwjqIzAD5lq8hh498d5GH3cI7GnEKeIIKAUXEWjPH7L/
        n0na99J+Y+e+M7VjyuEFAxA=
X-Google-Smtp-Source: ABdhPJyrNDJeYSgKE+yDiQxWkRecFtCZnxemeJnX5iQSPxu7eN2YCroDu+k0aIfNhvniJFg5YY9FTg==
X-Received: by 2002:a63:e407:: with SMTP id a7mr4149382pgi.220.1623923018032;
        Thu, 17 Jun 2021 02:43:38 -0700 (PDT)
Received: from localhost.localdomain ([23.100.94.64])
        by smtp.gmail.com with ESMTPSA id u73sm4870467pfc.169.2021.06.17.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 02:43:37 -0700 (PDT)
From:   ainux.wang@gmail.com
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        ainux.wang@gmail.com
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) Add support for MPS MP2949A
Date:   Thu, 17 Jun 2021 17:43:23 +0800
Message-Id: <20210617094323.24016-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Ainux.Wang" <ainux.wang@gmail.com>

Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS)
vendor. This is a triple-loop, digital, multi-phase controller.
This device:
- Supports up to three power rail.
- Provides 6 pulse-width modulations (PWMs), and can be configured up
  to 6-phase operation for Rail A , up to 2-phase operation for Rail B
  and up to 1-phase operation for Rail C.
- The PMBus registers are distributed into three pages: Page 0, Page 1,
  Page 2. Page 0 contains the registers for Rail A and most of the common
  settings for all of the rails. Page 1 contains register information for
  Rail B. Page 2 contains register information for Rail C.
- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
  IMVP9 with only one DAC for each rail to generate REF.

Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
---
 Documentation/hwmon/mp2949a.rst  | 48 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig      |  9 ++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/mp2949a.c    | 83 ++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h      |  6 +++
 drivers/hwmon/pmbus/pmbus_core.c | 18 +++++--
 6 files changed, 160 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/hwmon/mp2949a.rst
 create mode 100644 drivers/hwmon/pmbus/mp2949a.c

diff --git a/Documentation/hwmon/mp2949a.rst b/Documentation/hwmon/mp2949a.rst
new file mode 100644
index 000000000000..82ab15e0588b
--- /dev/null
+++ b/Documentation/hwmon/mp2949a.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2949a
+====================
+
+Supported chips:
+
+  * MPS MP2949A
+
+    Prefix: 'mp2949a'
+
+Author:
+
+	Ainux Wang <ainux.wang@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+vendor triple-loop, digital, multi-phase controller MP2949A.
+
+This device:
+
+- Supports up to three power rail.
+- Provides 6 pulse-width modulations (PWMs), and can be configured up
+  to 6-phase operation for Rail A , up to 2-phase operation for Rail B
+  and up to 1-phase operation for Rail C.
+- The PMBus registers are distributed into three pages: Page 0, Page 1,
+  Page 2. Page 0 contains the registers for Rail A and most of the common
+  settings for all of the rails. Page 1 contains register information for
+  Rail B. Page 2 contains register information for Rail C.
+- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
+  IMVP9 with only one DAC for each rail to generate REF.
+
+Device supports:
+
+- SVID interface.
+- PMBus interface.
+
+Device complaint with:
+
+- PMBus rev 1.2 interface.
+
+Device supports direct format for reading output power.
+Device supports linear format for reading input voltage and output current
+and temperature.
+Device supports VID for reading output voltage.
+The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 37a5c39784fa..b1344b265976 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -248,6 +248,15 @@ config SENSORS_MAX8688
 	  This driver can also be built as a module. If so, the module will
 	  be called max8688.
 
+config SENSORS_MP2949A
+	tristate "MPS MP2949A"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2949A Triple Loop Digital Multi-Phase Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2949a.
+
 config SENSORS_MP2975
 	tristate "MPS MP2975"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f8dcc27cd56a..bfb55ab12da1 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_MP2949A)	+= mp2949a.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949a.c
new file mode 100644
index 000000000000..2b51176d8921
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2949a.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Monolithic Power Systems MP2949A
+ *
+ * Copyright (c) 2021 Lemote Technologies. All rights reserved.
+ * Copyright (c) 2021 Ainux <ainux.wang@gmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define MP2949A_PAGE_NUM		3
+
+static struct pmbus_driver_info mp2949a_info = {
+	.pages = MP2949A_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = vid,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT,
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_POUT,
+	.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_POUT,
+	.skip_icp = true,
+};
+
+static int mp2949a_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct pmbus_driver_info *info;
+	int i;
+
+	info = devm_kmemdup(&client->dev, &mp2949a_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	for (i = 0; i < MP2949A_PAGE_NUM; i++)
+		info->vrm_version[i] = vr12;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id mp2949a_id[] = {
+	{"mp2949a", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, mp2949a_id);
+
+static const struct of_device_id mp2949a_of_match[] = {
+	{.compatible = "mps,mp2949a"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2949a_of_match);
+
+static struct i2c_driver mp2949a_driver = {
+	.driver = {
+		.name = "mp2949a",
+		.of_match_table = of_match_ptr(mp2949a_of_match),
+	},
+	.probe = mp2949a_probe,
+	.id_table = mp2949a_id,
+};
+
+module_i2c_driver(mp2949a_driver);
+
+MODULE_AUTHOR("Ainux <ainux.wang@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for Monolithic Power Systems MP2949A");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 3968924f8533..fd329670876d 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -454,6 +454,12 @@ struct pmbus_driver_info {
 
 	/* custom attributes */
 	const struct attribute_group **groups;
+
+	/*
+	 * Skip identify chip parameters,
+	 * some device do not support the PMBUS_VOUT_MODE.
+	 */
+	bool skip_icp;
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index bbd745178147..644bef5cdafd 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2248,13 +2248,21 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 		return -ENODEV;
 	}
 
-	for (page = 0; page < info->pages; page++) {
-		ret = pmbus_identify_common(client, data, page);
-		if (ret < 0) {
-			dev_err(dev, "Failed to identify chip capabilities\n");
-			return ret;
+	/*
+	 * Some device do not support the PMBUS_VOUT_MODE,
+	 * and the driver of device has known correct formats,
+	 * so the driver set skip_icp to true.
+	 */
+	if (!data->info->skip_icp) {
+		for (page = 0; page < info->pages; page++) {
+			ret = pmbus_identify_common(client, data, page);
+			if (ret < 0) {
+				dev_err(dev, "Failed to identify chip capabilities\n");
+				return ret;
+			}
 		}
 	}
+
 	return 0;
 }
 
-- 
2.18.1

